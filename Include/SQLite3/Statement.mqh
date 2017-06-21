//+------------------------------------------------------------------+
//|                                                    Statement.mqh |
//|                                          Copyright 2017, Li Ding |
//|                                                dingmaotu@126.com |
//+------------------------------------------------------------------+
#property strict

#include "SQLite3.mqh"
//+------------------------------------------------------------------+
//| Wraps sqlite3_stmt object                                        |
//+------------------------------------------------------------------+
class Statement
  {
private:
   int               m_valid;
   intptr_t          m_ref;
public:

   static bool       isComplete(string sql)
     {
      uchar buf[];
      StringToUtf8(sql,buf);
      return 1==sqlite3_complete(buf);
     }

                     Statement(const SQLite3 &conn,string sql)
     {
      m_valid=sqlite3_prepare(conn.ref(),sql,m_ref);
     }
                    ~Statement() {if(isValid())sqlite3_finalize(m_ref);}

   bool              setSql(string sql)
     {
      if(isValid())
        {
         intptr_t h=getConnectionHandle();
         sqlite3_finalize(m_ref);
         m_valid=sqlite3_prepare(h,sql,m_ref);
         return m_valid==SQLITE_OK;
        }
      return false;
     }
   string            getSql() const {return StringFromUtf8Pointer(sqlite3_sql(m_ref));}
   string            getExpandedSql() const {return StringFromUtf8Pointer(sqlite3_expanded_sql(m_ref));}
   intptr_t          getConnectionHandle() const {return sqlite3_db_handle(m_ref);}

   bool              isValid() const {return m_valid==SQLITE_OK;}

   bool              isBusy() const {return sqlite3_stmt_busy(m_ref);}
   bool              isReadonly() const {return sqlite3_stmt_readonly(m_ref);}

   int               getCounter(int op) const {return sqlite3_stmt_status(m_ref,op,false);}
   void              resetCounter(int op) { sqlite3_stmt_status(m_ref,op,true);}

   int               step() { return sqlite3_step(m_ref);}

   int               reset() {return sqlite3_reset(m_ref);}
   int               clearBindings() {return sqlite3_clear_bindings(m_ref);}

   int               getParameterCount() const {return sqlite3_bind_parameter_count(m_ref);}
   string            getParameterName(int i) const {return StringFromUtf8Pointer(sqlite3_bind_parameter_name(m_ref,i));}
   int               getParameterIndex(string name) const
     {
      uchar u8name[];
      StringToUtf8(name,u8name);
      return sqlite3_bind_parameter_index(m_ref,u8name);
     }

   int               bind(int i,const uchar &value[],bool copy=true)
     {
      return sqlite3_bind_blob(m_ref,i,value,ArraySize(value),copy?SQLITE_TRANSIENT:SQLITE_STATIC);
     }
   int               bind(int i,string text)
     {
      uchar u8text[];
      StringToUtf8(text,u8text);
      return sqlite3_bind_text(m_ref,i,u8text,ArraySize(u8text),SQLITE_TRANSIENT);
     }

   int               bind(int i,double value) {return sqlite3_bind_double(m_ref,i,value);}
   int               bind(int i,int value) {return sqlite3_bind_int(m_ref,i,value);}
   int               bind(int i,long value) {return sqlite3_bind_int64(m_ref,i,value);}
   int               bind(int i) {return sqlite3_bind_null(m_ref,i);}

   int               zero(int i,int bytes) {return sqlite3_bind_zeroblob(m_ref,i,bytes);}
   int               zero(int i,ulong bytes) {return sqlite3_bind_zeroblob64(m_ref,i,bytes);}

   int               getDataCount() const {return sqlite3_data_count(m_ref);}

   int               getColumnCount() const {return sqlite3_column_count(m_ref);}
   string            getColumnName(int i) const {return StringFromUtf8Pointer(sqlite3_column_name(m_ref,i));}
   int               getColumnType(int i) const {return sqlite3_column_type(m_ref,i);}
   string            getColumnDeclareType(int i) const {return StringFromUtf8Pointer(sqlite3_column_decltype(m_ref,i));}
   int               getColumnBytes(int i) const {return sqlite3_column_bytes(m_ref,i);}

   string            getColumnDatabaseName(int i) const {return StringFromUtf8Pointer(sqlite3_column_database_name(m_ref,i));}
   string            getColumnTableName(int i) const {return StringFromUtf8Pointer(sqlite3_column_table_name(m_ref,i));}
   string            getColumnOriginName(int i) const {return StringFromUtf8Pointer(sqlite3_column_origin_name(m_ref,i));}

   void              getColumn(int i,double &value) const {value=sqlite3_column_double(m_ref,i);}
   void              getColumn(int i,int &value) const {value=sqlite3_column_int(m_ref,i);}
   void              getColumn(int i,long &value) const {value=sqlite3_column_int64(m_ref,i);}
   void              getColumn(int i,string &value) const
     {
      intptr_t u8p=0;
      u8p=sqlite3_column_text(m_ref,i);
      if(u8p>0) value=StringFromUtf8Pointer(u8p);
      else value=NULL;
     }
   void              getColumn(int i,uchar &blob[]) const
     {
      int len=sqlite3_column_bytes(m_ref,i);
      if(len==0)
        {ArrayFree(blob);return;}
      intptr_t blobp=sqlite3_column_blob(m_ref,i);
      ArrayResize(blob,len);
      ArrayFromPointer(blob,blobp,len);
     }
  };
//+------------------------------------------------------------------+
