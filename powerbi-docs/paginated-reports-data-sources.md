---
title: "Supported data sources for Power BI paginated reports"
description: In this article, you learn about supported data sources for paginated reports in the Power BI service, and how to connect to Azure SQL Database data sources.
author: onegoodsausage
ms.author: andremi
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 07/19/2019
---

# Supported data sources for Power BI paginated reports

This article spells out supported data sources for paginated reports in the Power BI service, and how to connect to Azure SQL Database data sources. Some data sources are supported natively. You can connect to others by way of data gateways.

## Natively supported data sources

Paginated reports natively support the following list of data sources:

| Data Source | Authentication | Notes |
| --- | --- | --- |
| Azure SQL Database <br>Azure SQL Data Warehouse | Basic, single sign-on (SSO), OAuth2 |   |
| Azure SQL Managed Instance | Basic | via Public Endpoint using the Azure SQL Database Extension  |
| Azure Analysis Services | SSO, OAuth2 |   |
| Power BI dataset | SSO | Premium and non-Premium Power BI datasets |
| Premium Power BI dataset (XMLA) | SSO |   |
| Enter Data | N/A | Data is embedded in the report. |

Except for Azure SQL Database, all data sources are ready to use after you have uploaded the report to the Power BI service. The data sources default to using single sign-on (SSO), where applicable. For Azure Analysis Services, you can change the authentication type to OAuth2.

For Azure SQL Database data sources, you need to supply more information, as described in the [Azure SQL Database Authentication](#azure-sql-database-authentication) section.

## Other data sources

In addition to the natively supported data sources above, the following data sources can be accessed via a [Power BI data gateway](service-gateway-onprem.md):

- SQL Server
- SQL Server Analysis Services
- Oracle
- Teradata

For paginated reports, Azure SQL Database and Azure Analysis Services currently can't be accessed via a Power BI data gateway.

## Azure SQL Database authentication

For Azure SQL Database data sources, you need to set an authentication type before you run the report. That applies only when you use a data source for the first time in a workspace. That first time, you see the following message:

![Publishing to Power BI](media/paginated-reports-data-sources/power-bi-paginated-publishing.png)

If you don't supply any credentials, an error occurs when you run the report. Select **Continue**  to go to the **Data source credentials** page for the report you just uploaded:

![Settings for the Azure SQL Database](media/paginated-reports-data-sources/power-bi-paginated-settings-azure-sql.png)

Select the **Edit credentials** link for a given data source to bring up the **Configure** dialog box:

![Configure the Azure SQL Database](media/paginated-reports-data-sources/power-bi-paginated-configure-azure-sql.png)

For Azure SQL Database data sources, here are the supported authentication types:

- Basic (user name and password)
- SSO (single sign-on)
- OAuth2 (stored AAD token)

For SSO and OAuth2 to work correctly, the Azure SQL Database server that the data source is connecting to needs to have [AAD authentication support enabled](https://docs.microsoft.com/azure/sql-database/sql-database-aad-authentication-configure). For the OAuth2 authentication method, AAD generates a token and stores it for future data source access. To use the [SSO authentication method](https://docs.microsoft.com/power-bi/service-azure-sql-database-with-direct-connect#single-sign-on) instead, select the SSO option right below it, **End users use their own OAuth2 credentials when accessing this data source via DirectQuery**.
  
## Next steps

[View a paginated report in the Power BI service](paginated-reports-view-power-bi-service.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
