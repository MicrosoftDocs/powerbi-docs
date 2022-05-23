---
title: Power BI data source prerequisites
description: Power BI data source prerequisites
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 12/02/2021
LocalizationGroup: Connect to data
---
# Power BI data source prerequisites
For each data provider, Power BI supports a specific provider version on objects. For more information about data sources available to Power BI, see [Data sources](desktop-data-sources.md). The following table describes these requirements.

| Data source | Provider | Minimum provider version | Minimum data source version | Supported data source objects | Download link |
| --- | --- | --- | --- | --- | --- |
| SQL Server |ADO.net (built into .NET Framework) |.NET Framework 3.5 (only) |SQL Server 2005+ |Tables/Views, Scalar functions, Table functions |Included in .NET Framework 3.5 or above |
| Access |Microsoft Access Database Engine (ACE) |ACE 2010 SP1 |No restriction |Tables/Views |[Download link](./desktop-access-database-errors.md) |
| Excel (.xls files only) (see note 1) |Microsoft Access Database Engine (ACE) |ACE 2010 SP1 |No restriction |Tables, Sheets |[Download link](./desktop-access-database-errors.md) |
| Oracle (see note 2) |ODP.NET |ODAC 11.2 Release 5 (11.2.0.3.20) |9.x+ |Tables/Views |[Download link](./desktop-connect-oracle-database.md) |
| MySQL |Connector/Net |6.6.5 |5.1 |Tables/Views, Scalar functions |[Download link](https://go.microsoft.com/fwlink/?linkid=278885&clcid=0x409) |
| PostgreSQL |NPGSQL ADO.NET provider (Shipped with Power BI Desktop) |4.0.10 |9.4 |Tables/Views |[Download link](https://go.microsoft.com/fwlink/?linkid=282716&clcid=0x409) |
| Teradata |.NET Data Provider for Teradata |14+ |12+ |Tables/Views |[Download link](https://go.microsoft.com/fwlink/?linkid=278886&clcid=0x409) |
| SAP Sybase SQL Anywhere |iAnywhere.Data.SQLAnywhere for .NET 3.5 |16+ |16+ |Tables/Views |[Download link](https://go.microsoft.com/fwlink/?linkid=324846) |

>[!NOTE]
>Excel files that have an .xlsx extension do not require a separate provider installation.

>[!NOTE]
>The Oracle providers also require Oracle client software (version 8.1.7+).
> 
>