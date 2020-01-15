---
title: Change data source connection strings with PowerShell
description: Change data source connection strings using APIs in PowerShell - Power BI Report Server.
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 10/24/2019
ms.author: maggies

---
# Change data source connection strings in Power BI reports with PowerShell - Power BI Report Server


You can change data source connection strings in Power BI reports in Power BI Report Server using APIs in PowerShell. 

> [!NOTE]
> Currently this functionality only works for DirectQuery. Support for import and data refresh is coming.

1. Install the Power BI Report Server PowerShell commandlets. Find the commandlets and installation instructions at [https://github.com/Microsoft/ReportingServicesTools](https://github.com/Microsoft/ReportingServicesTools). 

2. Fetch the existing data source information for the Power BI file via the PowerShell commandlets:

    ```powershell
    Get-RsRestItemDataSource -RsItem '/MyPbixReport'
    ```

    To view information for the first data source contained in the Power BI report: 

    ```powershell
    $dataSources[0]
    ```

3. Update connection and credential info as needed. If updating the connection string and the data source makes use of stored credentials, you need to provide the account password. 

    To update a data source connection string:

    ```powershell
    $dataSources[0].ConnectionString = 'data source=myCatalogServer;initial catalog=ReportServer;persist security info=False' 
    ```

    To change the data source credential type:

    ```powershell
    $dataSources[0].DataModelDataSource.AuthType = 'Integrated'
    ```

    To change the data source username/password:

    ```powershell
    $dataSources[0].DataModelDataSource.Username = 'domain\user
    ```
    ```powershell
    $dataSources[0].DataModelDataSource.Secret = 'password'
    ```

4. Save the updated credentials back to the server.

    ```powershell
    Set-RsRestItemDataSource -RsItem '/MyPbixReport' -RsItemType 'PowerBIReport' -DataSources $dataSources
    ```

## Next steps

[Paginated report data sources in Power BI Report Server](connect-data-sources.md) 

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
