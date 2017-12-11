---
title: Azure SQL Database with DirectQuery
description: Azure SQL Database with DirectQuery
services: powerbi
documentationcenter: ''
author: guyinacube
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/18/2017
ms.author: asaxton

---
# Azure SQL Database with DirectQuery
Learn how you can connect directly to Azure SQL Database and create reports that use live data. You can keep your data at the source and not in Power BI.

With DirectQuery, queries are sent back to your Azure SQL Database as you explore the data in the report view. This experience is suggested for users who are familiar with the databases and entities they connect to.

**Notes:**

* Specify the fully qualified server name when connecting (see below for more details)
* Ensure firewall rules for the database are configured to "[Allow access to Azure services](https://msdn.microsoft.com/library/azure/ee621782.aspx)"
* Every action such as selecting a column or adding a filter will send a query back to the database
* Tiles are refreshed every hour (refresh does not need to be scheduled). This can be adjusted in the Advanced settings when you connect.
* Q&A is not available for DirectQuery datasets
* Schema changes afre not picked up automatically

These restrictions and notes may change as we continue to improve the experiences. The steps to connect are detailed below. 

## Power BI Desktop and DirectQuery
In order to connect to Azure SQL Database using DirectQuery, you will need to use Power BI Desktop. This approach provides additional flexability and capabilities. Reports created using Power BI Desktop can then be published to the Power BI service. You can learn more about how to connect to [Azure SQL Database using DirectQuery](desktop-use-directquery.md) within Power BI Desktop. 

## Single sign-on

After you publish an Azure SQL DirectQuery dataset to the service, you can enable single sign-on (SSO) via Azure Active Directory (Azure AD) OAuth2 for your end users. 

To enable SSO, go to settings for the dataset, open the **Data Sources** tab, and check the SSO box.

![Configure Azure SQL DQ dialog box](media/service-azure-sql-database-with-direct-connect/sso-dialog.png)

When the SSO option is enabled and your users access reports built atop the data source, Power BI authenticates their Azure AD credentials in the queries to the Azure SQL database. This enables Power BI to respect the security settings that are configured at the data source level.

The SSO option takes affect across all datasets that use this data source. It does not affect the authentication method used for import scenarios.

## Finding Parameter Values
Your fully qualified server name and database name can be found in the Azure Portal.

![](media/service-azure-sql-database-with-direct-connect/azureportnew_update.png)

![](media/service-azure-sql-database-with-direct-connect/azureportal_update.png)

## Next steps
[Use DirectQuery in Power BI Desktop](desktop-use-directquery.md)  
[Get started with Power BI](service-get-started.md)  
[Get Data for Power BI](service-get-data.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)
