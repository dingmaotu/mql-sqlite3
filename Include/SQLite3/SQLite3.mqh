//+------------------------------------------------------------------+
//|                                                      SQLite3.mqh |
//|                                          Copyright 2017, Li Ding |
//|                                                dingmaotu@126.com |
//+------------------------------------------------------------------+
#property strict

#include "Imports.mqh"
//+------------------------------------------------------------------+
//| Represents column metadata                                       |
//+------------------------------------------------------------------+
struct ColumnInfo
  {
public:
   string            DataType;
   string            CollationSequence;
   bool              NotNull;
   bool              PrimaryKey;
   bool              AutoIncrement;
  };
//+------------------------------------------------------------------+
//| sqlite3 object representing a connection to a db                 |
//+------------------------------------------------------------------+
class SQLite3
  {
private:
   int               m_valid;
   intptr_t          m_ref;
   uchar             m_dbName[];
public:
   // version numbers
   static int        getVersionNumber() {return sqlite3_libversion_number();}
   static string     getVersion() {return StringFromUtf8Pointer(sqlite3_libversion());}
   static string     getSourceId() {return StringFromUtf8Pointer(sqlite3_sourceid());}

   // compile time thread safety setting
   static bool       isThreadSafe() {return sqlite3_threadsafe()!=0;}

   // global configuration before initialize
   static int        setSingleThreaded() {return sqlite3_config(SQLITE_CONFIG_SINGLETHREAD);}
   static int        setMultiThreaded() {return sqlite3_config(SQLITE_CONFIG_MULTITHREAD);}
   static int        setSerialized() {return sqlite3_config(SQLITE_CONFIG_SERIALIZED);}

   static int        setMemStatus(bool enabled) {return sqlite3_config(SQLITE_CONFIG_MEMSTATUS,int(enabled));}
   static int        setUriHandling(bool enabled) {return sqlite3_config(SQLITE_CONFIG_URI,int(enabled));}
   static int        setLookAside(int before,int after) {return sqlite3_config(SQLITE_CONFIG_LOOKASIDE,before,after);}

   static int        setMmapSize(long size) {return sqlite3_config(SQLITE_CONFIG_MMAP_SIZE,size);}
   static int        setWin32HeapSize(int size) {return sqlite3_config(SQLITE_CONFIG_WIN32_HEAPSIZE,size);}
   static int        setStatementJournalThreshold(int size) {return sqlite3_config(SQLITE_CONFIG_STMTJRNL_SPILL,size);}

   static int        initialize() {return sqlite3_initialize();}
   static int        shutdown() {return sqlite3_shutdown();}

   static string     errorCode2Msg(int code) {return StringFromUtf8Pointer(sqlite3_errstr(code));}
   static int        status(int op,long &current,long &highwater,bool reset=false) {return sqlite3_status64(op,current,highwater,reset);}

   static int        releaseMemoryInBytes(int bytes) {return sqlite3_release_memory(bytes);}
   static long       setSoftHeapLimit(long bytes) {return sqlite3_soft_heap_limit64(bytes);}

   static long       getMemoryUsed() {return sqlite3_memory_used(); }
   static long       getMemoryHighwater() {return sqlite3_memory_highwater(false);}
   static long       resetMemoryHighwater() {return sqlite3_memory_highwater(true);}

                     SQLite3(string filename,int flags,string vfs="")
     {
      m_valid=sqlite3_open(filename,m_ref,flags,vfs);
      if(m_valid!=SQLITE_OK)
        {
         Print(">>> Error opening database [",filename,"]: ",SQLite3::errorCode2Msg(m_valid));
        }
     }
                    ~SQLite3()
     {
      if(isValid())
        {
         int ret=sqlite3_close(m_ref);
         if(ret!=SQLITE_OK)
           {
            Print(">>> Error close connection: ",getErrorMsg());
           }
        }
     }

   bool              isValid() const {return m_valid==SQLITE_OK;}

   bool              isAutoCommit() const { return sqlite3_get_autocommit(m_ref)!=0;}

   bool              isReadonly(string db) const
     {
      char buf[];
      StringToUtf8(db,buf);
      return 1==sqlite3_db_readonly(m_ref,buf);
     }
   bool              hasDb(string db) const
     {
      char buf[];
      StringToUtf8(db,buf);
      return -1==sqlite3_db_readonly(m_ref,buf);
     }
   string            getDbFilename(string db) const
     {
      char buf[];
      StringToUtf8(db,buf);
      return StringFromUtf8Pointer(sqlite3_db_filename(m_ref,buf));
     }
   int               getDbColumnMetadata(string db,string table,string column,ColumnInfo &info)
     {
      char zDbName[];
      char zTableName[];
      char zColumnName[];
      StringToUtf8(db,zDbName);
      StringToUtf8(table,zTableName);
      StringToUtf8(column,zColumnName);
      intptr_t pDataType;
      intptr_t pCollSeq;
      int res=sqlite3_table_column_metadata(m_ref,zDbName,zTableName,zColumnName,pDataType,pCollSeq,info.NotNull,info.PrimaryKey,info.AutoIncrement);
      if(res==SQLITE_OK)
        {
         info.DataType=StringFromUtf8Pointer(pDataType);
         info.CollationSequence=StringFromUtf8Pointer(pCollSeq);
        }
      return res;
     }

   int               setLimit(int id,int value) {return sqlite3_limit(m_ref,id,value);}
   int               setBusyTimeout(int millis) {return sqlite3_busy_timeout(m_ref, millis);}

   int               flush() {return sqlite3_db_cacheflush(m_ref);}
   int               releaseMemory() {return sqlite3_db_release_memory(m_ref);}

   void              interrupt() {sqlite3_interrupt(m_ref);}

   long              getLastInsertRowId() {return sqlite3_last_insert_rowid(m_ref);}
   void              setLastInsertRowId(long id) {sqlite3_set_last_insert_rowid(m_ref,id);}
   int               getChanges() const {return sqlite3_changes(m_ref);}
   int               getTotalChanges() const {return sqlite3_total_changes(m_ref);}

   int               getErrorCode() const {return sqlite3_errcode(m_ref);}
   int               getExtendedErrorCode() const {return sqlite3_extended_errcode(m_ref);}
   string            getErrorMsg() const {return StringFromUtf8Pointer(sqlite3_errmsg(m_ref));}

   int               getStatus(int op,int &current,int &highwater,bool reset=false) {return sqlite3_db_status(m_ref,op,current,highwater,reset);}

   int               setSharedCache(bool value) {return sqlite3_enable_shared_cache(value);}
   int               setLoadExtension(bool value) {return sqlite3_enable_load_extension(m_ref,value);}

   int               setExtendedResultCodes(bool value) {return sqlite3_extended_result_codes(m_ref,value);}

   bool              loadExtension(string name,string entry)
     {
      char u8name[],u8entry[];
      StringToUtf8(name,u8name);
      StringToUtf8(name,u8entry);
      intptr_t errMsg;
      int res= sqlite3_load_extension(m_ref,u8name,u8entry,errMsg);
      if(res == SQLITE_OK) return true;
      else
        {
         PrintFormat(">>> Error loading extension module %s: %s",name,StringFromUtf8Pointer(errMsg));
         sqlite3_free(errMsg);
         return false;
        }
     }

   int               setAutoCheckpoint(int frameThreshold) {return sqlite3_wal_autocheckpoint(m_ref,frameThreshold);}
   int               checkpoint(string db,int mode,int &pnLog,int &pnCkpt)
     {
      if(db==NULL)
         return sqlite3_wal_checkpoint_v2(m_ref, 0, mode, pnLog, pnCkpt);
      else
        {
         uchar u8db[];
         StringToUtf8(db,u8db);
         return sqlite3_wal_checkpoint_v2(m_ref, u8db, mode, pnLog, pnCkpt);
        }
     }

   // db config
   #define DB_CONFIG(Name,MACRO) \
   bool              is##Name##Enabled() const {int res;sqlite3_db_config(m_ref,MACRO,-1,res);return res!=0;}\
   void              set##Name##Enabled(bool value) {sqlite3_db_config(m_ref,MACRO,value,0);}

   DB_CONFIG(Trigger,SQLITE_DBCONFIG_ENABLE_TRIGGER)
   DB_CONFIG(ForeignKey,SQLITE_DBCONFIG_ENABLE_FKEY)
   DB_CONFIG(FTS3Tokenizer,SQLITE_DBCONFIG_ENABLE_FTS3_TOKENIZER)
   DB_CONFIG(LoadExtension,SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION)
   DB_CONFIG(CheckpointsOnClose,SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE)

   bool              setMainDbName(string name)
     {
      if(ArraySize(m_dbName) > 0) return false;
      StringToUtf8(name,m_dbName);
      sqlite3_db_config(m_ref,SQLITE_DBCONFIG_MAINDBNAME,m_dbName);
      return true;
     }

   int               setDbLookAside(int slotSize,int nSlots) {return sqlite3_db_config(m_ref,SQLITE_DBCONFIG_LOOKASIDE,0,slotSize,nSlots);}
   // end db config

   //--- intended for internal use
   intptr_t          ref() const {return m_ref;}
  };
//+------------------------------------------------------------------+
