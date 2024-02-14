---
title: Change data source connection strings with PowerShell - Power BI Report Server pre-October 2020
description: Change data source connection strings using APIs in PowerShell - Power BI Report Server pre-October 2020.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 10/26/2020
---
# Change data source connection strings in Power BI reports with PowerShell - Power BI Report Server pre-October 2020


You can change data source connection strings of Power BI reports hosted in Power BI Report Server by using PowerShell to interact with the necessary APIs. 

> [!IMPORTANT]
> If you're using the latest version of Power BI Report Server, see [Change data source connection strings in Power BI reports with PowerShell - Power BI Report Server](connect-data-source-apis.md).

> [!NOTE]
> Currently this functionality only works for DirectQuery. Support for import and data refresh is coming.

1. Install the Power BI Report Server PowerShell commandlets. Find the commandlets and installation instructions at [https://github.com/Microsoft/ReportingServicesTools](https://github.com/Microsoft/ReportingServicesTools). 

    Install the `ReportingServicesTools` module directly from the [PowerShell Gallery](https://www.powershellgallery.com/packages/ReportingServicesTools/) using the following command.

    ```powershell
    Install-Module ReportingServicesTools
    ```

2. Fetch the existing data source information for the Power BI file via the PowerShell commandlets:

    ```powershell
    $dataSources = Get-RsRestItemDataSource -RsItem '/MyPbixReport'
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
    $dataSources[0].DataModelDataSource.Username = 'domain\user'
    ```
    ```powershell
    $dataSources[0].DataModelDataSource.Secret = 'password'
    ```

4. Save the updated credentials back to the server.

    ```powershell
    Set-RsRestItemDataSource -RsItem '/MyPbixReport' -RsItemType 'PowerBIReport' -DataSources $dataSources
    ```

## Related content

- [Paginated report data sources in Power BI Report Server](connect-data-sources.md) 

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
