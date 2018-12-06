---
title: Troubleshooting scheduled refresh for Azure SQL Databases
description: Troubleshooting scheduled refresh for Azure SQL Databases in Power BI
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2017
ms.author: mblythe
ms.custom: seodec18

LocalizationGroup: Troubleshooting
---
# Troubleshooting scheduled refresh for Azure SQL Databases in Power BI
For detailed steps on setting up scheduled refresh, be sure to see [Refresh data in Power BI](refresh-data.md).

While setting up scheduled refresh for Azure SQL Database, if you get an error with error code 400 during editing the credentials, try the following to set up the appropriate firewall rule:

1. Log into your Azure management portal
2. Go to the Azure SQL server you are configuring refresh for
3. Turn on 'Windows Azure Services' in the allowed services section

![Azure allowed services](media/service-admin-troubleshooting-scheduled-refresh-azure-sql-databases/azurerefresh.png)  

More questions? [Try the Power BI Community](http://community.powerbi.com/)

