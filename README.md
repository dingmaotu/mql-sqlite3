# mql-sqlite3

SQLite3 binding for the MQL language (both 32bit MT4 and 64bit MT5)

## Introduction

This is a complete binding of the [SQLite3](http://sqlite.org/) library (version
3180000) for the MQL4/5 language used by MetaTrader4/5.

SQLite is an fast embeded SQL engine written in C
and [widely used](http://sqlite.org/mostdeployed.html) by a lot of projects. We
always have the need to persistent states of Expert Advisors and SQLite seems to
be the best solution.

This binding tries to remain compatible between MQL4/5. Users of both versions
can use this binding, with a single set of headers. MQL4 and MQL5 are basically
the same in that they are merged in recent versions. The difference is in the
runtime environment (MetaTrader5 is 64bit by default, while MetaTrader4 is
32bit). The trading system is also different, but it is no concern of this
binding.

## Files

This binding contains three sets of files:

1. The binding itself is in the `Include/SQLite3` directory.

2. There is a simple testing script called `TestSQLite3.mq4` in `Scripts/Test`
   directory. The script files are mq4 by default, but you can change the
   extension to mq5 to use them in MetaTrader5. Currently there is only one
   script. I am going to add more in the future.

3. Precompiled DLLs of both 64bit (`Library/MT5`) and 32bit (`Library/MT4`) are
   provided. Copy the corresponding DLLs to the `Library` folder of your
   MetaTrader terminal. If you are using MetaTrader5 32bit, use the 32bit
   version from `Library/MT4`. The DLLs have no special dependencies and should
   work in any Windows version after NT. *Note* that these DLLs are copied from
   official binary release, without any modification. You can download/compile
   your own if you don't trust these binaries.
   
4. [mql-sqlite3-api.html](mql-sqlite3-api.html) is a detailed comparison table
   of MQL and C/C++ APIs. If you are reading the official documentation, and you
   want to find the corresponding MQL API for the C API, use this table. This
   table also has comments about why a particular API is not included in this
   binding.

## About string encoding and API choices

MQL strings are Win32 UNICODE strings (basically 2-byte UTF-16). While for
several APIs, SQLite3 provides both UTF-8 and UTF-16 versions, only UTF-8
strings are accepted in other APIs. For unification and maximum
interoperabibility, we only use the UTF-8 version of the APIs. In this binding
all strings are converted to utf-8 strings before sending to the dll layer. And
strings in the database are also UTF-8 encoded.

## About callbacks, internal APIs, and convenience wrappers

A lot of SQLite3 APIs are for internal use only, or for extension development,
or need a C function as callback. These are not included in this binding. This
will not affect the general applicability of this binding for most application
level usage.

APIs like `sqlite3_exec`, `sqlite3_get_table`, etc. are convenience wrappers,
which are not included. Maybe I will implement them in MQL.

For a complete comparison table of C/C++ APIs and MQL APIs
see [mql-sqlite3-api.html](mql-sqlite3-api.html).

## Usage

You'd better read the official documentation or some books about SQLite before
using this library. Documentation about this binding will be added when I have
the time to finish them. You can find a simple test script in `Scripts/Test`.
Here is a sample from `TestSQLite3.mq4`:

```MQL5
//+------------------------------------------------------------------+
//|                                                  TestSQLite3.mq4 |
//|                                          Copyright 2017, Li Ding |
//|                                                dingmaotu@126.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Li Ding"
#property link      "dingmaotu@126.com"
#property version   "1.00"
#property strict

#include <SQLite3/Statement.mqh>
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- optional but recommended
   SQLite3::initialize();

//--- ensure the dll and the lib is of the same version
   Print(SQLite3::getVersionNumber(), " = ", SQLITE_VERSION_NUMBER);
   Print(SQLite3::getVersion(), " = ", SQLITE_VERSION);
   Print(SQLite3::getSourceId(), " = ", SQLITE_SOURCE_ID);

//--- create an empty db
   string filesPath=TerminalInfoString(TERMINAL_DATA_PATH)+"\\MQL4\\Files";
   string dbPath=filesPath+"\\test.db";
   Print(dbPath);

   SQLite3 db(dbPath,SQLITE_OPEN_READWRITE|SQLITE_OPEN_CREATE);
   if(!db.isValid()) return;

   Print("DB created.");
   string sql="create table buy_orders"
              "(a int, b text);";
   if(Statement::isComplete(sql))
      Print(">>> SQL is complete");
   else
      Print(">>> SQL not complete");

   Statement s(db,sql);

   if(!s.isValid())
     {
      Print(db.getErrorMsg());
      return;
     }

   int r=s.step();
   if(r == SQLITE_OK)
      Print(">>> Step finished.");
   else if(r==SQLITE_DONE)
      Print(">>> Successfully created table.");
   else
      Print(">>> Error executing statement: ",db.getErrorMsg());

//--- optional but recommended
   SQLite3::shutdown();
  }
```

## TODO

1. Write more tests.
2. Documentation.

## Changes

* 2017-06-21: Initial version. Alpha quality, needs more tests.
