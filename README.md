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
API is not included in this binding.

<div id="mql-sqlite3-api_13471" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1003 style='border-collapse:
 collapse;table-layout:fixed;width:753pt'>
 <col width=289 style='mso-width-source:userset;mso-width-alt:9258;width:217pt'>
 <col width=371 style='mso-width-source:userset;mso-width-alt:11861;width:278pt'>
 <col width=343 style='mso-width-source:userset;mso-width-alt:10986;width:258pt'>
 <tr height=23 style='height:17.5pt'>
  <td height=23 class=xl7113471 width=289 style='height:17.5pt;width:217pt;
  font-size:14.0pt;color:white;font-weight:700;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:等线, sans-serif;mso-font-charset:134;
  border-top:.5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#4472C4;mso-pattern:#4472C4 none'>Sqlite3
  C API</td>
  <td class=xl7113471 width=371 style='width:278pt;font-size:14.0pt;color:white;
  font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:等线, monospace;mso-font-charset:134;border-top:.5pt solid #8EA9DB;
  border-right:none;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#4472C4;mso-pattern:#4472C4 none'>mql-sqlite3</td>
  <td class=xl7213471 width=343 style='width:258pt;font-size:14.0pt;color:white;
  font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:等线, monospace;mso-font-charset:134;border-top:.5pt solid #8EA9DB;
  border-right:.5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:
  none;background:#4472C4;mso-pattern:#4472C4 none'>Comment</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_aggregate_context</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_aggregate_count</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_auto_extension</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_backup_finish</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Backup::~Backup</td>
  <td class=xl6713471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_backup_init</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Backup::Backup</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_backup_pagecount</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Backup::getPageCount</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_backup_remaining</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Backup::getRemaining</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_backup_step</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Backup::step</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_blob</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::bind</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_bind_blob64</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>too
  large for ordinary use</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_double</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::bind</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_bind_int</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::bind</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_int64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::bind</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_bind_null</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::bind</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_parameter_count</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getParameterCount</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_bind_parameter_index</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getParameterIndex</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_parameter_name</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getParameterName</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_bind_text</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::bind</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_text16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_bind_text64</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>too
  large for ordinary use</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_value</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_bind_zeroblob</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::zero</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_bind_zeroblob64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::zero</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_blob_bytes</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Blob::size</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_blob_close</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Blob::~Blob</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_blob_open</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Blob::Blob</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_blob_read</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Blob::read</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_blob_reopen</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Blob::moveTo</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_blob_write</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Blob::write</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_busy_handler</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>Need
  callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_busy_timeout</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::setBuyTimeout</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_cancel_auto_extension</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_changes</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::getChanges</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_clear_bindings</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::clearBindings</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_close</td>
  <td class=xl6813471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>use v2</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_close_v2</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::~Sqlite3</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_collation_needed</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_collation_needed16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_blob</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getColumn</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_bytes</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumnBytes</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_bytes16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_count</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumnCount</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_database_name</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getColumnDatabaseName</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_database_name16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>always
  UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_decltype</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getColumnDeclareType</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_decltype16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>always
  UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_double</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getColumn</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_int</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumn</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_int64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getColumn</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_name</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumnName</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_name16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='page-break-before:always;height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_origin_name</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumnOriginName</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_origin_name16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_table_name</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumnTableName</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_table_name16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_text</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumn</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_text16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_column_type</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::getColumnType</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_column_value</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_commit_hook</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>need
  callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_compileoption_get</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>diagnostic/optional</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_compileoption_used</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>diagnostic/optional</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_complete</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::isComplete</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_complete16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>always
  UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_config</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::set* static methods</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>partial</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_context_db_handle</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_create_collation</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_create_collation16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_create_collation_v2</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_create_function</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_create_function16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_create_function_v2</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_create_module</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_create_module_v2</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_data_count</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getDataCount</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_db_cacheflush</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::flush</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=248 style='height:186.0pt'>
  <td height=248 class=xl6913471 width=289 style='height:186.0pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_db_config</td>
  <td class=xl6913471 width=371 style='width:278pt;font-size:12.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;
  border-right:none;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>Sqlite3::setDbLookAside<br>
    Sqlite3::setMainDbName<br>
    Sqlite3::isTriggerEnabled<br>
    Sqlite3::setTriggerEnabled<br>
    Sqlite3::isForeignKeyEnabled<br>
    Sqlite3::setForeignKeyEnabled<br>
    Sqlite3::isFTS3TokenizerEnabled<br>
    Sqlite3::setFTS3TokenizerEnabled<br>
    Sqlite3::isLoadExtensionEnabled<br>
    Sqlite3::setLoadExtensionEnabled<br>
    Sqlite3::isCheckpointsOnCloseEnabled<br>
    Sqlite3::setCheckpointsOnCloseEnabled</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_db_filename</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getDbFilename</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_db_handle</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getConnectionHandle</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_db_mutex</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_db_readonly</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::isReadonly</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>Sqlite3::hasDb check if contains
  db</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_db_release_memory</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::releaseMemory</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_db_status</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::getStatus</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_declare_vtab</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_enable_load_extension</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::setLoadExtension</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_enable_shared_cache</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::setSharedCache</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_errcode</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::getErrorCode</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_errmsg</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getErrorMsg</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_errmsg16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_errstr</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::errorCode2Msg</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_exec</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>convenience wrapper only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_expanded_sql</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getExpandedSql</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_expired</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>deprecated</td>
 </tr>
 <tr height=21 style='page-break-before:always;height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_extended_errcode</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getExtendedErrorCode</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_extended_result_codes</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::setResultCodes</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_file_control</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>too low
  level</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_finalize</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::~Sqlite3</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_free</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_free_table</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>convenience wrapper only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_get_autocommit</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::isAutoCommit</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_get_auxdata</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_get_table</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>convenience
  wrapper only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_global_recover</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_initialize</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::initialize</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>static</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_interrupt</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::interrupt</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_last_insert_rowid</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getLastInsertRowId</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_libversion</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::getVersion</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>static</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_libversion_number</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getVersionNumber</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>static</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_limit</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::setLimit</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_load_extension</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::loadExtension</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_log</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_malloc</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_malloc64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_memory_alarm</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_memory_highwater</td>
  <td class=xl6313471 colspan=2 style='border-right:.5pt solid #8EA9DB;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:none;background:#D9E1F2;mso-pattern:#D9E1F2 none'>Sqlite3::getMemoryHighwater,
  Sqlite3::resetMemoryHighwater,<span style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_memory_used</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getMemoryUsed</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_mprintf</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_msize</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_mutex_alloc</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_mutex_enter</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_mutex_free</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_mutex_held</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_mutex_leave</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_mutex_notheld</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_mutex_try</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_next_stmt</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>no use</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_open</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>use v2</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_open16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>always
  UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_open_v2</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::Sqlite3</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_os_end</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_os_init</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_overload_function</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_prepare</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>use v2</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_prepare16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>always
  UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_prepare16_v2</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>always UTF-8</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_prepare_v2</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::Statement</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_preupdate_count</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_preupdate_depth</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_preupdate_hook</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_preupdate_new</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_preupdate_old</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_profile</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_progress_handler</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>need callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_randomness</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>use MQL
  Random</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_realloc</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_realloc64</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='page-break-before:always;height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_release_memory</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::releaseMemoryInBytes</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>static</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_reset</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::reset</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_reset_auto_extension</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_blob</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_blob64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_double</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_error</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_error16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_error_code</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_error_nomem</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_error_toobig</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_int</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_int64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_null</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_subtype</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_text</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_text16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_text16be</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_text16le</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_text64</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_value</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_result_zeroblob</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_result_zeroblob64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_rollback_hook</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>need
  callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_set_authorizer</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>need callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_set_auxdata</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_set_last_insert_rowid</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::setLastInsertRowId</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_shutdown</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::shutdown</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_sleep</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>use MQL Sleep</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_snapshot_cmp(exp)</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>experimental</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_snapshot_free(exp)</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>experimental</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_snapshot_get(exp)</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>experimental</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_snapshot_open(exp)</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>experimental</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_snapshot_recover(exp)</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>experimental</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_snprintf</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_soft_heap_limit</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_soft_heap_limit64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::setSoftHeapLimit</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>static</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_sourceid</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::getSourceId</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>static</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_sql</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::getSql</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_status</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>use
  sqlite3_status64</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_status64</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::status</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_step</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::step</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_stmt_busy</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Statement::isBusy</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_stmt_readonly</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Statement::isReadonly</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_stmt_scanstatus</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>advanced/optional</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_stmt_scanstatus_reset</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>advanced/optional</td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl6913471 width=289 style='height:31.0pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_stmt_status</td>
  <td class=xl6913471 width=371 style='width:278pt;font-size:12.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;
  border-right:none;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>Statement::getCounter,
  Statement::resetCounter</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_strglob</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_stricmp</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_strlike</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_strnicmp</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_system_errno</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='page-break-before:always;height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_table_column_metadata</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::getDbColumnMetadata</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_test_control</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_thread_cleanup</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_threadsafe</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::isThreadSafe</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_total_changes</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Sqlite3::getTotalChanges</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_trace</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_trace_v2</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>need callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_transfer_bindings</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>deprecated</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_unlock_notify</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>need callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_update_hook</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>need
  callback</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_uri_boolean</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_uri_int64</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_uri_parameter</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_user_data</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_blob</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_value_bytes</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_bytes16</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_value_double</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_dup</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_value_free</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_int</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_value_int64</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_numeric_type</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_value_subtype</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_text</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_value_text16</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_text16be</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_value_text16le</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_value_type</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_version</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>not a
  function</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_vfs_find</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Vfs::find, Vfs::getDefault</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_vfs_register</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Vfs::register,
  Vfs::registerDefault</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_vfs_unregister</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>Vfs::unregister</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_vmprintf</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>internal
  use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_vsnprintf</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>internal use only</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_vtab_config</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>N/A</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>for
  extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_vtab_on_conflict</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>for extension</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_wal_autocheckpoint</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::setAutoCheckpoint</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_wal_checkpoint</td>
  <td class=xl6313471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none;background:#D9E1F2;
  mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>use v2</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl7013471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB'>sqlite3_wal_checkpoint_v2</td>
  <td class=xl6513471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  none;border-bottom:.5pt solid #8EA9DB;border-left:none'>Sqlite3::checkpoint</td>
  <td class=xl6613471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none'>　</td>
 </tr>
 <tr height=21 style='height:15.5pt'>
  <td height=21 class=xl6913471 width=289 style='height:15.5pt;width:217pt;
  font-size:12.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:"Fira Code", monospace;border-top:
  .5pt solid #8EA9DB;border-right:none;border-bottom:.5pt solid #8EA9DB;
  border-left:.5pt solid #8EA9DB;background:#D9E1F2;mso-pattern:#D9E1F2 none'>sqlite3_wal_hook</td>
  <td class=xl6913471 width=371 style='width:278pt;font-size:12.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;
  border-right:none;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>N/A</td>
  <td class=xl6413471 style='font-size:12.0pt;color:black;font-weight:400;
  text-decoration:none;text-underline-style:none;text-line-through:none;
  font-family:"Fira Code", monospace;border-top:.5pt solid #8EA9DB;border-right:
  .5pt solid #8EA9DB;border-bottom:.5pt solid #8EA9DB;border-left:none;
  background:#D9E1F2;mso-pattern:#D9E1F2 none'>need callback</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=289 style='width:217pt'></td>
  <td width=371 style='width:278pt'></td>
  <td width=343 style='width:258pt'></td>
 </tr>
 <![endif]>
</table>

</div>

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
