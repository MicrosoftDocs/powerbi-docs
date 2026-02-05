---
title: Paginated Report Data Sources in Power BI Report Server
description: Learn about paginated report data sources in Power BI Report Server, including supported connections and Oracle culture settings—explore options now.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: concept-article
ms.date: 10/01/2025
ai-usage: ai-assisted
---
# Paginated report data sources in Power BI Report Server

Paginated report data sources in Power BI Report Server match those in SQL Server Reporting Services, so you can reuse existing connectivity knowledge. This article summarizes supported sources and highlights using OData shared datasets and the Oracle UseInstalledUICulture setting.

## Use a shared dataset as an OData feed

To consume a shared dataset as an OData feed:

1. Copy the dataset’s OData feed URL.
1. In Power BI Desktop (Report Server compatible), select **Get Data > OData Feed**, then paste the URL.
1. Enable **Open Type Columns** in **Advanced options** to shape the schema (optional).
Continue with standard modeling. For more capabilities, see [OData feed connector](/power-query/connectors/odata-feed).

## Connect to Oracle data sources with UseInstalledUICulture

Power BI Report Server uses the Oracle Data Provider for .NET (ODP.NET), which is NLS agnostic, to connect to Oracle data sources.

By default, the report server uses the first client's UI culture to load ODP.NET. As a result, subsequent Oracle connections use that initial UI culture until you restart the service. This behavior can cause report rendering issues because of UI culture mismatches.

Power BI Report Server includes a configuration setting named `UseInstalledUICulture`. When you set `UseInstalledUICulture` to `true`, the report server loads ODP.NET in the server UI culture instead of the first client's culture. The setting is available starting with the March 2020 service release.

To enable the feature, modify the ORACLE extension entry in the `rsreportserver.config` file as shown:

```xml
<Extension Name="ORACLE" Type="Microsoft.ReportingServices.DataExtensions.OracleClientConnectionWrapper,Microsoft.ReportingServices.DataExtensions">
    <Configuration>
        <UseInstalledUICulture>true</UseInstalledUICulture>
    </Configuration>
</Extension>
```

## Related content

- After you connect to your data source, [create a paginated report](quickstart-create-paginated-report.md).  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
