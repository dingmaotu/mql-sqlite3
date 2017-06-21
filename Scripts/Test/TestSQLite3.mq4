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
//+------------------------------------------------------------------+
