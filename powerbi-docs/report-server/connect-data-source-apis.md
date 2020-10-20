---
title: Change data source connection strings with PowerShell
description: Change data source connection strings using APIs in PowerShell - Power BI Report Server.
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 09/01/2020
ms.author: maggies

---
# Change data source connection strings in Power BI reports with PowerShell - Power BI Report Server


Starting with the October 2020 release of Power BI Report Server we are enabling the ability to update connections for Power BI reports for DirectQuery and refresh.

> [!IMPORTANT]
> This is also a breaking change on how you could set this up in previous releases. If you're using a pre-October 2020 version of Power BI Report Server, see [Change data source connection strings in Power BI reports with PowerShell - Power BI Report Server pre-October 2020](connect-data-source-apis-pre-oct-2020.md)

## Prerequisites:
- The October 2020 release of Power BI Report Server.
- A report saved with the October 2020 release of Power BI Desktop optimized for Report Server, with "Enhanced DataSet Metadata" enabled.
- A report that uses parameterized connections. Only reports with parameterized connections and databases can be updated after publishing.
- This example uses the Reporting Services PowerShell tools. You can achieve the same  by using the new REST APIs.

## Create a report With parameterized connections
	
1. Create a SQL Server connection to a server. In the example below, I'm connecting to my localhost to a database called ReportServer and pulling data from ExecutionLog.
	
    Here's what the M query looks like at this point:

    ```
    let
        Source = Sql.Database("localhost", "ReportServer"),
        dbo_ExecutionLog3 = Source{[Schema="dbo",Item="ExecutionLog3"]}[Data]
    in
        dbo_ExecutionLog3
    ```

2. Select **Manage Parameters** in the Power Query Editor ribbon to create parameters for the servername and databasenameoption.

3. Edit the query for the first connection, and map the database and servername.

    Now the query looks like this:

    ```
    let
        Source = Sql.Database(ServerName, Databasename),
        dbo_ExecutionLog3 = Source{[Schema="dbo",Item="ExecutionLog3"]}[Data]
    in
        dbo_ExecutionLog3
    ```
	
	4. Publish that report to the server. In this example, the report is named executionlogparameter. The data source management page should like this.

## Update parameters using the PowerShell tools

1. Open PowerShell and install the latest Reporting Services tools, following the instructions at [https://github.com/microsoft/ReportingServicesTools](https://github.com/microsoft/ReportingServicesTools).
	
2.  To get the parameter for the report, use the new REST DataModelParameters API using the following PowerShell call:

    ```powershell
    Get-RsRestItemDataModelParameters '/executionlogparameter'

        Name         Value
        ----         -----
        ServerName   localhost
        Databasename ReportServer
    ```

3. We save the result of this call in a variable:

    ```powershell
    $parameters = Get-RsRestItemDataModelParameters '/executionlogparameter'
    ```

4. This variable is updated with the values that we need to change.
5. We save the result of this call in a variable:

    ```powershell
    $parameters[0].Value = 'myproductionserver'
    $parameters[1].Value = 'myproductiondatabase'
    ```

6. With the updated values, we can use the commandlet `Set-RsRestItemDataModelParameters` to update the values in the server:

    ```powershell
    Set-RsRestItemDataModelParameters -RsItem '/executionlogparameter' -DataModelParameters $parameters
    ```

7. Once the parameters are updated, the server updates any data sources that were bound to the parameters. Going back to the **Edit data source** dialog box, you should be able to set credentials for the updated server and database.

## Next steps

[Paginated report data sources in Power BI Report Server](connect-data-sources.md) 

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
