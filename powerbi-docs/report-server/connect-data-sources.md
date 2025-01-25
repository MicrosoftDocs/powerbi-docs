---
title: Paginated report data sources in Power BI Report Server
description: Learn about data sources that paginated reports (.rdl) can connect to in Power BI Report Server.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 06/26/2020
---
# Paginated report data sources  in Power BI Report Server
Reporting Services paginated reports in Power BI Report Server support the same data sources that are supported in SQL Server Reporting Services. See the list of [Data sources supported by Reporting Services](/sql/reporting-services/report-data/data-sources-supported-by-reporting-services-ssrs).

## Connect to Oracle data sources with UseInstalledUICulture

To connect to Oracle data sources, Power BI Report Server uses the Oracle Data Provider for .NET (ODP.NET) which is NLS agnostic.

By default, the report server uses the first client's UI culture to load ODP.NET.  As a result, all subsequent connections to Oracle from the report server will be in that initial UI culture until restart of the service.  This approach can cause issues rendering a report due to mismatches in UI culture formatting.

To offer a better experience in Power BI Report Server, we have introduced a configuration setting named UseInstalledUICulture. When UseInstalledUICulture is set to true, the report server always loads ODP.NET in the server’s UI Culture instead of the first client’s culture.
This setting is available in Power BI Report Server starting with the March 2020 Service Release.

To enable the feature, modify ORACLE extension entry rsreportserver.config file like below.
```xml
<Extension Name="ORACLE" Type="Microsoft.ReportingServices.DataExtensions.OracleClientConnectionWrapper,Microsoft.ReportingServices.DataExtensions">
    <Configuration>
        <UseInstalledUICulture>true</UseInstalledUICulture>
    </Configuration>
</Extension>
```

## Related content

Now that you've connected to your data source, [create a paginated report](quickstart-create-paginated-report.md).  


More questions? [Try asking the Power BI Community](https://community.powerbi.com/)