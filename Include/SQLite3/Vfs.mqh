//+------------------------------------------------------------------+
//|                                                          Vfs.mqh |
//|                                          Copyright 2017, Li Ding |
//|                                                dingmaotu@126.com |
//+------------------------------------------------------------------+
#property strict

#include "Imports.mqh"
//+------------------------------------------------------------------+
//| Virtual file system operations                                   |
//+------------------------------------------------------------------+
struct Vfs
  {
public:
   intptr_t          handle;

   static Vfs        getDefault() {Vfs vfs(sqlite3_vfs_find(0)); return vfs;}
   static bool       find(string name,Vfs &vfs) {char u8[];StringToUtf8(name,u8);vfs.handle=sqlite3_vfs_find(u8);return vfs.handle!=0;}

                     Vfs(intptr_t ptr):handle(ptr){}
                     Vfs(const Vfs&rhs):handle(rhs.handle) {}
   void              operator=(const Vfs&rhs) {handle=rhs.handle;}

   int               register() {return sqlite3_vfs_register(handle,false);}
   int               registerDefault() {return sqlite3_vfs_register(handle,true);}
   int               unregister() {return sqlite3_vfs_unregister(handle);}
  };
//+------------------------------------------------------------------+
