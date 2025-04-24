---
title: Troubleshoot scheduled refresh in Power BI Report Server
description: This article discusses resources available to troubleshoot issues with scheduled refresh in Power BI Report Server.
author: kfollis
ms.author: kfollis
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: troubleshooting
ms.date: 11/01/2017
---
# Troubleshoot scheduled refresh in Power BI Report Server
This article discusses resources available to troubleshoot issues with scheduled refresh in Power BI Report Server.

As issues come up, this article will be updated with information to help you.

## Common issues
The following are the more common issues you will hit when trying to schedule refresh for a report. 

### Driver related problems
Connecting to different data sources may require 3rd party drivers that need to be installed in order to connect successfully. Not only would you need to install them on the machine you are using Power BI Desktop on, but you will also need to make sure the driver is installed on the report server.

The driver may also come in both 32bit and 64bit. Make sure to install the 64bit driver as Power BI Report Server is 64bit.

Please refer to the manufacturer for details on how to install and configure 3rd party drivers.

### Memory pressure
Memory pressure can occur when reports require more memory to process and render. Schedule refresh on reports may demand a significant amount of memory on the machine. Especially for larger reports. Memory pressure can result in report failures as well as a potential crash of the report server itself.

If you are encountering memory pressure consistently, it may be worth looking at a scaled out deployment of the report server in order to spread the load of resources. You can also define that a given report server is used for data refresh with the `IsDataModelRefreshService` setting within rsreportserver.config. With this setting, you could define one or more servers to be the front end server to handle on demand reports, and have another set of servers to only be used for scheduled refresh.

For information on how to monitor an Analysis Services instance, see [Monitor an Analysis Services Instance](/sql/analysis-services/instances/monitor-an-analysis-services-instance).

For information about memory settings within Analysis Services, see [Memory Properties](/sql/analysis-services/server-properties/memory-properties).

### Kerberos configuration
Connecting to a data source with windows credentials may require configuring Kerberos constrained delegation to make a successful connection. For more information about how to configure Kerberos constrained delegation, see [Configure Kerberos to use Power BI reports](configure-kerberos-powerbi-reports.md).

## Known issues
Information about known issues will be listed here when they become available.

## Configuration settings
The following settings can be used to affect scheduled refresh. Settings set within SQL Server Management Studio (SSMS) apply to all report servers within a scale-out deployment. Settings configured within rsreportserver.config are for the specific server they are set on.

**Settings within SSMS:**

| Setting | Description |
| --- | --- |
| MaxFileSizeMb |Maximum file size for uploaded reports. Default is 1000 MB (1 GB). Maximum value is 2000 MB (2 GB). |
| ModelCleanupCycleMinutes |Defines how often the model is checked to evict it from memory. Default is 15 minutes. |
| ModelExpirationMinutes |Defines how long until the model expires based on the last time used and is evicted. Default is 60 minutes. |
| ScheduleRefreshTimeoutMinutes |Defines how long the data refresh can take for a mode. Default is 120 minutes. There is no upper limit. |

**Settings within rsreportserver.config:**

```xml
<Configuration>
    <Service>
        <PollingInterval>10</PollingInterval>
        <IsDataModelRefreshService>false</IsDataModelRefreshService>
        <MaxQueueThreads>0</MaxQueueThreads>
    </Service>
</Configuration>
```

## Tools for troubleshooting
### Logs relevant for scheduled refresh of Power BI reports
The log files which hold information about scheduled refresh are the RSPowerBI_ logs. They are located in the LogFiles folder of your report server installation location. 

```
C:\Program Files\Microsoft Power BI Report Server\PBIRS\LogFiles\RSPowerBI_*.log
```

**Error condition**

```
2017-10-20 02:00:09.5188|ERROR|744|Error Processing Data Model Refresh: SessionId: e960c25e-ddd4-4763-aa78-0e5dceb53472, Status: Error Model can not be refreshed because not all the data sources are embedded, Exception Microsoft.PowerBI.ReportServer.AsServer.InvalidDataSourceException: Model can not be refreshed because not all the data sources are embedde
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.AnalysisServicesDataRefresh.CanModelRefresh(IEnumerable`1 dataSources)
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.DataRefreshScope.<>c__DisplayClass7.<ExecuteActionWithLogging>b__5()
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.DataRefreshScope.<ExecuteFuncWithLogging>d__1`1.MoveNext()
```

***Successful refresh***

```
2017-10-25 15:23:41.9370|INFO|6|Handling event with data: TimeEntered: 10/25/2017 8:23:41 PM, Type: Event, SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, EventType: DataModelRefresh
2017-10-25 15:23:41.9370|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Data Refresh.
2017-10-25 15:23:41.9370|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Retrieving PBIX AsDatabaseInfo.
2017-10-25 15:23:42.7134|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Verifying all the data sources are embedded.
2017-10-25 15:23:42.7134|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Verifying connection strings are valid.
2017-10-25 15:23:42.7134|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Streaming model to Analysis Server.
2017-10-25 15:23:42.7603|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Refreshing the model.
2017-10-25 15:23:51.5258|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Removing credentials from the model.
2017-10-25 15:23:51.6508|INFO|6|Processing Data Model Refresh: SessionId: 46d398db-0b1f-49d8-b7bd-c5461c07ec7a, Status: Starting Saving model to the catalog.
```

**Incorrect Credentials**

```
2017-10-20 08:22:01.5595|INFO|302|Processing Data Model Refresh: SessionId: 22cd9ec3-b21a-4eb1-81ae-15fac8d379ea, Status: Starting Refreshing the model.
2017-10-20 08:22:02.3758|ERROR|302|Error Processing Data Model Refresh: SessionId: 22cd9ec3-b21a-4eb1-81ae-15fac8d379ea, Status: Error Failed to refresh the model, Exception Microsoft.AnalysisServices.OperationException: Failed to save modifications to the server. Error returned: 'The credentials provided for the SQL source are invalid. (Source at rosecatalog;reportserver.). The exception was raised by the IDbCommand interface.
'.
   at Microsoft.AnalysisServices.Tabular.Model.SaveChanges(SaveOptions saveOptions)
   at Microsoft.PowerBI.ReportServer.AsServer.TOMWrapper.RefreshModel(Database database)
   at Microsoft.PowerBI.ReportServer.AsServer.AnalysisServicesServer.RefreshDatabase(String databaseName, IEnumerable`1 dataSources)
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.AnalysisServicesDataRefresh.RefreshDatabase(AsDatabaseInfo asDatabaseInfo)
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.DataRefreshScope.<>c__DisplayClass7.<ExecuteActionWithLogging>b__5()
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.DataRefreshScope.<ExecuteFuncWithLogging>d__1`1.MoveNext()
2017-10-20 08:22:02.4588|ERROR|302|Error Processing Data Model Refresh: SessionId: 22cd9ec3-b21a-4eb1-81ae-15fac8d379ea, Status: Error Failed Data Refresh, Exception Microsoft.AnalysisServices.OperationException: Failed to save modifications to the server. Error returned: 'The credentials provided for the SQL source are invalid. (Source at rosecatalog;reportserver.). The exception was raised by the IDbCommand interface.
'.
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.DataRefreshScope.ExecuteActionWithLogging(Action methodToExecute, String description, String localizedDescription, String messageInFailure, RefreshInfo refreshInfo, DataAccessors dataAccessors, ReportEventType operation, Int64 size, Boolean isDataRetrieval, Boolean showInExecutionLog)
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.AnalysisServicesDataRefresh.RefreshData(RefreshInfo refreshInfo)
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.DataRefreshScope.<>c__DisplayClass7.<ExecuteActionWithLogging>b__5()
   at Microsoft.PowerBI.ReportServer.WebHost.EventHandler.DataRefreshScope.<ExecuteFuncWithLogging>d__1`1.MoveNext()
```

#### Enabling Verbose Logging
Enabling verbose logging, in Power BI Report Server, is the same as it is for SQL Server Reporting Services.

1. Open `<install directory>\PBIRS\ReportServer\bin\ReportingServicesService.exe.config`.
2. Under `<system.diagnostics>`, change **DefaultTraceSwitch** to **4**.
3. Under `<RStrace>`, change **Components** to **all:4**. 

### ExecutionLog
Whenever a Power BI report is rendered, or a schedule refresh plan is executed, new entries are added to the Execution Log in the database. These entries are available in the **ExecutionLog3** view within the report server catalog database.

Execution log entries for Power BI reports differ from entries for other report types.

* TimeRendering columns is always 0. Rendering of Power BI reports happens in the browser, not in the server.
* There are 2 Request Types and subsequent item actions:
  * **Interactive**: whenever a report is being viewed.
    * **ASModelStream**: when the data model is streamed to Analysis Services from the catalog.
    * **ConceptualSchema**: when user clicks on viewing the report.
    * **QueryData**: whenever data is being requested from client.
  * **Refresh Cache**: whenever a schedule refresh plan has been executed.
    * **ASModelStream**: whenever the data model is streamed to Analysis Services from the catalog.
    * **DataRefresh**: whenever data is being refreshed from one or more data sources.
    * **SaveToCatalog**: whenever the data model is being saved back to the catalog.

## Analysis Services
There may be times you want to modify Analysis Services for diagnosing issues, or adjust memory limits.

> [!IMPORTANT]
> These settings will be reset any time you upgrade the report server. Be sure to keep a copy of your changes and reapply them if needed.
> 
> 

### Install location
The default location for Power BI Report Server, and Analysis Services is the following.

`C:\Program Files\Microsoft Power BI Report Server\PBIRS\ASEngine`

### Configuring Analysis Services settings (msmdsrv.ini)
In the `<install directory>\PBIRS\ASEngine` directory, you will find the *msmdsrv.ini* file, which you can use to control different settings of Analysis Services. When you open this file, you will immediately realize that this file doesn't have all the settings you would expect in the msmdsrv.ini file. 

This is because the actual Analysis Services process that is run by Power BI Report Server is launched in `<install directory>\PBIRS\ASEngine\workspaces`. In that folder, you will see the full *msmdsrv.ini* file you are used to. It is important not to modify the file within the workspaces folder as it is rewritten whenever the Analysis Services process launches. If you want to control a setting, please do this by modifying msmdsrv.ini in the `<install directory>\PBIRS\ASEngine` directory.

The following settings are reset when ever the Analysis Services process is launched. Any changes you make to these will be ignored.

* ConfigurationSettings\PrivateProcess
* ConfigurationSettings\DataDir
* ConfigurationSettings\LogDir
* ConfigurationSettings\TempDir
* ConfigurationSettings\BackupDir
* ConfigurationSettings\AllowedBrowsingFolders
* ConfigurationSettings\CrashReportsFolder
* ConfigurationSettings\ExtensionDir
* ConfigurationSettings\Port
* ConfigurationSettings\DeploymentMode
* ConfigurationSettings\ServerLocation
* ConfigurationSettings\TMCompatabilitySKU
* ConfigurationSettings\FlightRecorder\TraceDefinitionFile

### Profiling the local Analysis Services process
A SQL Profiler trace can be run on the local Analysis Services process for diagnostic purposes. To connect to the local Analysis Services instance, do the following.

SQL Server Profiler Trace is included with the [SQL Server Management Studio (SSMS) download](/sql/ssms/download-sql-server-management-studio-ssms).

1. Start **SQL Server Profiler** as an administrator.
2. Select the **New Trace** button.
3. In the **Connect to server** dialog, select **Analysis Services** and enter **localhost:5132** for the server name.
4. In the **Trace properties** dialog, select the events you want to capture and select **Run**.

## Lock Pages In Memory Windows privilege
If you find that you are unable to render a Power BI report, assigning the **Lock pages in memory** privilege to the services account running Power BI Report server may help. For more information about how to configure **Lock pages in memory**, see [Windows privileges assigned to the Analysis Services service account](/sql/analysis-services/instances/configure-service-accounts-analysis-services#bkmk_winpriv).

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)