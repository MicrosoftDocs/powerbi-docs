---
title: Paginated report data sources in Power BI Report Server
description: Learn about data sources that paginated reports (.rdl) can connect to in Power BI Report Server.
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 05/17/2018
ms.author: maggies

---
# Paginated report data sources  in Power BI Report Server
Reporting Services paginated reports in Power BI Report Server support the same data sources that are supported in SQL Server Reporting Services. See the list of [Data sources supported by Reporting Services](https://docs.microsoft.com/sql/reporting-services/report-data/data-sources-supported-by-reporting-services-ssrs).

## Connect to Oracle data sources with UseInstalledUICulture

To connect to Oracle data sources, Reporting Services uses the Oracle Data Provider for .NET (ODP.NET) which is NLS agnostic.
By default, Reporting Services uses the first client's UI culture to load ODP.NET.  As a result, all subsequent connections to Oracle from Reporting Services will be in that initial UI culture until restart of the service.  This approach can cause issues rendering a report due to mismatches in UI culture formatting.
To offer a better experience in Reporting Services, we have introduced a configuration setting named UseInstalledUICulture. When UseInstalledUICulture is set to true, Reporting Services will always load ODP.NET in the server’s UI Culture instead of the first client’s culture.
>
> This is available in Power BI Reporting Services (February Service Release) and after.

To enable the feature, modify ORACLE extension entry rsreportserver.config file like below.
```xml
<Extension Name="ORACLE" Type="Microsoft.ReportingServices.DataExtensions.OracleClientConnectionWrapper,Microsoft.ReportingServices.DataExtensions">
    <Configuration>
        <UseInstalledUICulture>true</UseInstalledUICulture>
    </Configuration>
</Extension>
```

## Next steps
Now that you've connected to your data source, [create a paginated report](quickstart-create-paginated-report.md).  


More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
