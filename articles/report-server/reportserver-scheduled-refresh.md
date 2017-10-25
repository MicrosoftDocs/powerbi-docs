<properties
   pageTitle="Power BI report scheduled refresh in Power BI Report Server"
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

# Power BI report scheduled refresh in Power BI Report Server

## How this works

## Considerations and limitations

### When scheduled refresh can't be used

Not all Power BI Reports can have a scheduled refresh plan created on them. The following is a list of Power BI Reports that you Can't create a scheduled refresh plan.

* Your report contains one or more Analysis Services data sources, which use a live connection.
* Your report contains one or more data sources, which use DirectQuery.
* Your report does not contain any data source. For example, data is manually entered via *Enter Data* or a report contains only static content like images, text, etc.

In addition to the above list, there are specific scenarios with data sources in *import* mode, for which you cannot created refresh plans.

* If a *File* or *Folder* data source is used and the file path is a local path (e.g. C:\Users\user\Documents), then a refresh plan cannot be created. The path must be a path the report server can connect to like a network share. For example, *\\myshare\Documents*.
* If data source can be connected using only OAuth (e.g. Facebook, Google Analytics, Salesforce, etc.), then cache refresh plan cannot be created. At the moment, RS does not support OAuth authentication for any data source whether it is for paginated, mobile or Power BI reports.

### Memory limits

Traditional workload for a report server has been similar to a web application. The ability to load reports with imported data or DirectQuery, and the ability to perform scheduled refresh, rely on an Analysis Services instance being hosted alongside of the report server. As a result, this could result is unexpected memory pressure on the server. Plan your server deployment accordingly knowning that Analysis Services may be consuming memory alongside the report server.

### Authentication and Kerberos

If your data source is set to use Windows credentials, Kerberos constrained delegation may need to be configured in order to work. For more information, see [Configure Windows authentication on the report server](https://docs.microsoft.com/sql/reporting-services/security/configure-windows-authentication-on-the-report-server).

## Next steps

Configure [scheduled refresh](reportserver-configure-scheduled-refresh.md) on a Power BI report.