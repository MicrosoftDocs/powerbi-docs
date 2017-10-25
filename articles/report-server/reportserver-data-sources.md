<properties
   pageTitle="Power BI report data sources in Power BI Report Server"
   description="Power BI reports can connect to different data sources. Depending on how data is used, different data sources are available."
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/25/2017"
   ms.author="asaxton"/>

# Power BI report data sources in Power BI Report Server

Power BI reports can connect to different data sources. Depending on how data is used, different data sources are available. Data can be imported or data can be queried directly using DirectQuery or a live connection to SQL Server Analysis Services.

These data sources are specific to Power BI reports used within Power BI Report Server. For information about data sources supported with paginated reports, see [Data Sources Supported by Reporting Services](https://docs.microsoft.com/sql/reporting-services/report-data/data-sources-supported-by-reporting-services-ssrs).

## List of supported data sources

> [AZURE.NOTE] Other data sources may work even though they aren't on the supported list above.

|**Data source**|**Live/DirectQuery**|**Scheduled refresh**|
|---|---|---|---|
|Access|No|Yes|
|Active Directory|No|Yes|
|Analysis Services Tabular|Yes|Yes|
|Analysis Services Multidimensional|Yes|Yes|
|Azure Blob Storage|No|Yes|
|Azure SQL Database|Yes|Yes|
|Azure Table|No|Yes|
|Cosmos DB|No|Yes|
|Excel|No|Yes|
|Folder|No|Yes|
|HDInsight (HDFS)|No|Yes|
|HDInsight (Spark)|No|Yes|
|IBM DB2|No|Yes|
|IBM Informix Database|No|Yes|
|JSON|No|Yes|
|Microsoft Exchange|No|Yes|
|MySQL|No|Yes|
|OData|No|Yes|
|ODBC|No|Yes|
|Oledb|No|Yes|
|Oracle|Yes|Yes|
|PostgresSQL|No|Yes|
|SAP BW|Yes|Yes|
|SAP HANA|Yes|Yes|
|SharePoint list (on-premises)|No|Yes|
|SQL Server|Yes|Yes|
|Sybase|No|Yes|
|Teradata|Yes|Yes|
|Text|No|Yes|
|Web|No|Yes|
|XML|No|Yes|

> [AZURE.IMPORTANT] Row-level security configured at the data source should work for certain DirectQuery (SQL Server, Azure SQL Database, Oracle and Teradata) and live connections assuming Kerberos is configured properly in your environment.

## Next steps

Now that your data source is picked out, [create a report](reportserver-quickstart-powerbi-report.md) using data from that data source.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)