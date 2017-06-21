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

## API comparison
   
Below is a detailed comparison table of MQL and C/C++ APIs. If you are reading
the official documentation, and you want to find the corresponding MQL API for
the C API, use this table. This table also has comments about why a particular
API is not included in this binding. This table might change if new APIs get added.

<table border=0 cellpadding=0 cellspacing=0>
 <thead>
  <tr>
   <th>SQLite3 C API</th>
   <th>mql-sqlite3</th>
   <th>Comment</th>
  </tr>
 </thead>
 <tbody>
 <tr>
  <td>sqlite3_aggregate_context</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_aggregate_count</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_auto_extension</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_backup_finish</td>
  <td>Backup::~Backup</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_backup_init</td>
  <td>Backup::Backup</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_backup_pagecount</td>
  <td>Backup::getPageCount</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_backup_remaining</td>
  <td>Backup::getRemaining</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_backup_step</td>
  <td>Backup::step</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_blob</td>
  <td>Statement::bind</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_blob64</td>
  <td>N/A</td>
  <td>too large for ordinary use</td>
 </tr>
 <tr>
  <td>sqlite3_bind_double</td>
  <td>Statement::bind</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_int</td>
  <td>Statement::bind</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_int64</td>
  <td>Statement::bind</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_null</td>
  <td>Statement::bind</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_parameter_count</td>
  <td>Statement::getParameterCount</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_parameter_index</td>
  <td>Statement::getParameterIndex</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_parameter_name</td>
  <td>Statement::getParameterName</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_text</td>
  <td>Statement::bind</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_text16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_bind_text64</td>
  <td>N/A</td>
  <td>too large for ordinary use</td>
 </tr>
 <tr>
  <td>sqlite3_bind_value</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_bind_zeroblob</td>
  <td>Statement::zero</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_bind_zeroblob64</td>
  <td>Statement::zero</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_blob_bytes</td>
  <td>Blob::size</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_blob_close</td>
  <td>Blob::~Blob</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_blob_open</td>
  <td>Blob::Blob</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_blob_read</td>
  <td>Blob::read</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_blob_reopen</td>
  <td>Blob::moveTo</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_blob_write</td>
  <td>Blob::write</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_busy_handler</td>
  <td>N/A</td>
  <td>Need callback</td>
 </tr>
 <tr>
  <td>sqlite3_busy_timeout</td>
  <td>SQLite3::setBusyTimeout</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_cancel_auto_extension</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_changes</td>
  <td>SQLite3::getChanges</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_clear_bindings</td>
  <td>Statement::clearBindings</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_close</td>
  <td>N/A</td>
  <td>use v2</td>
 </tr>
 <tr>
  <td>sqlite3_close_v2</td>
  <td>SQLite3::~SQLite3</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_collation_needed</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_collation_needed16</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_column_blob</td>
  <td>Statement::getColumn</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_bytes</td>
  <td>Statement::getColumnBytes</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_bytes16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_column_count</td>
  <td>Statement::getColumnCount</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_database_name</td>
  <td>Statement::getColumnDatabaseName</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_database_name16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_column_decltype</td>
  <td>Statement::getColumnDeclareType</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_decltype16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_column_double</td>
  <td>Statement::getColumn</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_int</td>
  <td>Statement::getColumn</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_int64</td>
  <td>Statement::getColumn</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_name</td>
  <td>Statement::getColumnName</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_name16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_column_origin_name</td>
  <td>Statement::getColumnOriginName</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_origin_name16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_column_table_name</td>
  <td>Statement::getColumnTableName</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_table_name16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_column_text</td>
  <td>Statement::getColumn</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_text16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_column_type</td>
  <td>Statement::getColumnType</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_column_value</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_commit_hook</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 <tr>
  <td>sqlite3_compileoption_get</td>
  <td>N/A</td>
  <td>diagnostic/optional</td>
 </tr>
 <tr>
  <td>sqlite3_compileoption_used</td>
  <td>N/A</td>
  <td>diagnostic/optional</td>
 </tr>
 <tr>
  <td>sqlite3_complete</td>
  <td>Statement::isComplete</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_complete16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_config</td>
  <td>SQLite3::set* static methods</td>
  <td>partial</td>
 </tr>
 <tr>
  <td>sqlite3_context_db_handle</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_collation</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_collation16</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_collation_v2</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_function</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_function16</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_function_v2</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_module</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_create_module_v2</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_data_count</td>
  <td>Statement::getDataCount</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_db_cacheflush</td>
  <td>SQLite3::flush</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_db_config</td>
  <td>SQLite3::setDbLookAside<br>
    SQLite3::setMainDbName<br>
    SQLite3::isTriggerEnabled<br>
    SQLite3::setTriggerEnabled<br>
    SQLite3::isForeignKeyEnabled<br>
    SQLite3::setForeignKeyEnabled<br>
    SQLite3::isFTS3TokenizerEnabled<br>
    SQLite3::setFTS3TokenizerEnabled<br>
    SQLite3::isLoadExtensionEnabled<br>
    SQLite3::setLoadExtensionEnabled<br>
    SQLite3::isCheckpointsOnCloseEnabled<br>
    SQLite3::setCheckpointsOnCloseEnabled</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_db_filename</td>
  <td>SQLite3::getDbFilename</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_db_handle</td>
  <td>Statement::getConnectionHandle</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_db_mutex</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_db_readonly</td>
  <td>SQLite3::isReadonly</td>
  <td>SQLite3::hasDb check if
  contains db</td>
 </tr>
 <tr>
  <td>sqlite3_db_release_memory</td>
  <td>SQLite3::releaseMemory</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_db_status</td>
  <td>SQLite3::getStatus</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_declare_vtab</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_enable_load_extension</td>
  <td>SQLite3::setLoadExtension</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_enable_shared_cache</td>
  <td>SQLite3::setSharedCache</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_errcode</td>
  <td>SQLite3::getErrorCode</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_errmsg</td>
  <td>SQLite3::getErrorMsg</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_errmsg16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_errstr</td>
  <td>SQLite3::errorCode2Msg</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_exec</td>
  <td>N/A</td>
  <td>convenience wrapper only</td>
 </tr>
 <tr>
  <td>sqlite3_expanded_sql</td>
  <td>SQLite3::getExpandedSql</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_expired</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_extended_errcode</td>
  <td>SQLite3::getExtendedErrorCode</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_extended_result_codes</td>
  <td>SQLite3::setResultCodes</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_file_control</td>
  <td>N/A</td>
  <td>too low level</td>
 </tr>
 <tr>
  <td>sqlite3_finalize</td>
  <td>SQLite3::~SQLite3</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_free</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_free_table</td>
  <td>N/A</td>
  <td>convenience wrapper only</td>
 </tr>
 <tr>
  <td>sqlite3_get_autocommit</td>
  <td>SQLite3::isAutoCommit</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_get_auxdata</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_get_table</td>
  <td>N/A</td>
  <td>convenience wrapper only</td>
 </tr>
 <tr>
  <td>sqlite3_global_recover</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_initialize</td>
  <td>SQLite3::initialize</td>
  <td>static</td>
 </tr>
 <tr>
  <td>sqlite3_interrupt</td>
  <td>SQLite3::interrupt</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_last_insert_rowid</td>
  <td>SQLite3::getLastInsertRowId</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_libversion</td>
  <td>SQLite3::getVersion</td>
  <td>static</td>
 </tr>
 <tr>
  <td>sqlite3_libversion_number</td>
  <td>SQLite3::getVersionNumber</td>
  <td>static</td>
 </tr>
 <tr>
  <td>sqlite3_limit</td>
  <td>SQLite3::setLimit</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_load_extension</td>
  <td>SQLite3::loadExtension</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_log</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_malloc</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_malloc64</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_memory_alarm</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_memory_highwater</td>
  <td>SQLite3::getMemoryHighwater,
  SQLite3::resetMemoryHighwater</td>
 </tr>
 <tr>
  <td>sqlite3_memory_used</td>
  <td>SQLite3::getMemoryUsed</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_mprintf</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_msize</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_mutex_alloc</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_mutex_enter</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_mutex_free</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_mutex_held</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_mutex_leave</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_mutex_notheld</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_mutex_try</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_next_stmt</td>
  <td>N/A</td>
  <td>no use</td>
 </tr>
 <tr>
  <td>sqlite3_open</td>
  <td>N/A</td>
  <td>use v2</td>
 </tr>
 <tr>
  <td>sqlite3_open16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_open_v2</td>
  <td>SQLite3::SQLite3</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_os_end</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_os_init</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_overload_function</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_prepare</td>
  <td>N/A</td>
  <td>use v2</td>
 </tr>
 <tr>
  <td>sqlite3_prepare16</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_prepare16_v2</td>
  <td>N/A</td>
  <td>always UTF-8</td>
 </tr>
 <tr>
  <td>sqlite3_prepare_v2</td>
  <td>Statement::Statement</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_preupdate_count</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_preupdate_depth</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_preupdate_hook</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_preupdate_new</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_preupdate_old</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_profile</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_progress_handler</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 <tr>
  <td>sqlite3_randomness</td>
  <td>N/A</td>
  <td>use MQL Random</td>
 </tr>
 <tr>
  <td>sqlite3_realloc</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_realloc64</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_release_memory</td>
  <td>SQLite3::releaseMemoryInBytes</td>
  <td>static</td>
 </tr>
 <tr>
  <td>sqlite3_reset</td>
  <td>Statement::reset</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_reset_auto_extension</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_blob</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_blob64</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_double</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_error</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_error16</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_error_code</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_error_nomem</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_error_toobig</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_int</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_int64</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_null</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_subtype</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_text</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_text16</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_text16be</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_text16le</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_text64</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_value</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_zeroblob</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_result_zeroblob64</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_rollback_hook</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 <tr>
  <td>sqlite3_set_authorizer</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 <tr>
  <td>sqlite3_set_auxdata</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_set_last_insert_rowid</td>
  <td>SQLite3::setLastInsertRowId</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_shutdown</td>
  <td>SQLite3::shutdown</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_sleep</td>
  <td>N/A</td>
  <td>use MQL Sleep</td>
 </tr>
 <tr>
  <td>sqlite3_snapshot_cmp(exp)</td>
  <td>N/A</td>
  <td>experimental</td>
 </tr>
 <tr>
  <td>sqlite3_snapshot_free(exp)</td>
  <td>N/A</td>
  <td>experimental</td>
 </tr>
 <tr>
  <td>sqlite3_snapshot_get(exp)</td>
  <td>N/A</td>
  <td>experimental</td>
 </tr>
 <tr>
  <td>sqlite3_snapshot_open(exp)</td>
  <td>N/A</td>
  <td>experimental</td>
 </tr>
 <tr>
  <td>sqlite3_snapshot_recover(exp)</td>
  <td>N/A</td>
  <td>experimental</td>
 </tr>
 <tr>
  <td>sqlite3_snprintf</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_soft_heap_limit</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_soft_heap_limit64</td>
  <td>SQLite3::setSoftHeapLimit</td>
  <td>static</td>
 </tr>
 <tr>
  <td>sqlite3_sourceid</td>
  <td>SQLite3::getSourceId</td>
  <td>static</td>
 </tr>
 <tr>
  <td>sqlite3_sql</td>
  <td>Statement::getSql</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_status</td>
  <td>N/A</td>
  <td>use sqlite3_status64</td>
 </tr>
 <tr>
  <td>sqlite3_status64</td>
  <td>SQLite3::status</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_step</td>
  <td>Statement::step</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_stmt_busy</td>
  <td>Statement::isBusy</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_stmt_readonly</td>
  <td>Statement::isReadonly</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_stmt_scanstatus</td>
  <td>N/A</td>
  <td>advanced/optional</td>
 </tr>
 <tr>
  <td>sqlite3_stmt_scanstatus_reset</td>
  <td>N/A</td>
  <td>advanced/optional</td>
 </tr>
 <tr>
  <td>sqlite3_stmt_status</td>
  <td>Statement::getCounter,
  Statement::resetCounter</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_strglob</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_stricmp</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_strlike</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_strnicmp</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_system_errno</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_table_column_metadata</td>
  <td>SQLite3::getDbColumnMetadata</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_test_control</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_thread_cleanup</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_threadsafe</td>
  <td>SQLite3::isThreadSafe</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_total_changes</td>
  <td>SQLite3::getTotalChanges</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_trace</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_trace_v2</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 <tr>
  <td>sqlite3_transfer_bindings</td>
  <td>N/A</td>
  <td>deprecated</td>
 </tr>
 <tr>
  <td>sqlite3_unlock_notify</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 <tr>
  <td>sqlite3_update_hook</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 <tr>
  <td>sqlite3_uri_boolean</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_uri_int64</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_uri_parameter</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_user_data</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_blob</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_bytes</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_bytes16</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_double</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_dup</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_free</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_int</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_int64</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_numeric_type</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_subtype</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_text</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_text16</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_text16be</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_text16le</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_value_type</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_version</td>
  <td>N/A</td>
  <td>not a function</td>
 </tr>
 <tr>
  <td>sqlite3_vfs_find</td>
  <td>Vfs::find, Vfs::getDefault</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_vfs_register</td>
  <td>Vfs::register,
  Vfs::registerDefault</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_vfs_unregister</td>
  <td>Vfs::unregister</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_vmprintf</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_vsnprintf</td>
  <td>N/A</td>
  <td>internal use only</td>
 </tr>
 <tr>
  <td>sqlite3_vtab_config</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_vtab_on_conflict</td>
  <td>N/A</td>
  <td>for extension</td>
 </tr>
 <tr>
  <td>sqlite3_wal_autocheckpoint</td>
  <td>SQLite3::setAutoCheckpoint</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_wal_checkpoint</td>
  <td>N/A</td>
  <td>use v2</td>
 </tr>
 <tr>
  <td>sqlite3_wal_checkpoint_v2</td>
  <td>SQLite3::checkpoint</td>
  <td>　</td>
 </tr>
 <tr>
  <td>sqlite3_wal_hook</td>
  <td>N/A</td>
  <td>need callback</td>
 </tr>
 </tbody>
</table>

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
#ifdef __MQL5__
   string filesPath=TerminalInfoString(TERMINAL_DATA_PATH)+"\\MQL5\\Files";
#else
   string filesPath=TerminalInfoString(TERMINAL_DATA_PATH)+"\\MQL4\\Files";
#endif
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
