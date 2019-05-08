---
title: Power BI data source prerequisites
description: Power BI data source prerequisites
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 05/08/2019
ms.author: davidi

LocalizationGroup: Connect to data
---
# Power BI Data Source Prerequisites
For each data provider, Power BI supports a specific provider version on objects. For more information about data sources available to Power BI, see [Data Sources](desktop-data-sources.md). The following table describes these requirements.

| Data Source | Provider | Minimum provider version | Minimum data source version | Supported data source objects | Download link |
| --- | --- | --- | --- | --- | --- |
| SQL Server |ADO.net (built into .Net Framework) |.NET Framework 3.5 (only) |SQL Server 2005+ |Tables/Views, Scalar functions, Table functions |Included in .NET Framework 3.5 or above |
| Access |Microsoft Access Database Engine (ACE) |ACE 2010 SP1 |No restriction |Tables/Views |[Download link](http://go.microsoft.com/fwlink/?linkid=285987&clcid=0x409) |
| Excel (.xls files only) (see note 1) |Microsoft Access Database Engine (ACE) |ACE 2010 SP1 |No restriction |Tables, Sheets |[Download link](http://go.microsoft.com/fwlink/?linkid=285987&clcid=0x409) |
| Oracle (see note 2) |ODP.NET |ODAC 11.2 Release 5 (11.2.0.3.20) |9.x+ |Tables/Views |[Download link](http://go.microsoft.com/fwlink/?linkid=272376&clcid=0x409) |
| | System.Data.OracleClient (Built in .NET Framework) |.NET Framework 3.5 |9.x+ |Tables/Views |Included in .NET Framework 3.5 or above |
| IBM DB2 |ADO.Net client from IBM (part of the IBM data server driver package) |10.1 |9.1+ |Tables/Views |[Download link](http://go.microsoft.com/fwlink/?linkid=274911&clcid=0x409) |
| MySQL |Connector/Net |6.6.5 |5.1 |Tables/Views, Scalar functions |[Download link](http://go.microsoft.com/fwlink/?linkid=278885&clcid=0x409) |
| PostgreSQL |NPGSQL ADO.NET provider |2.0.12 |7.4 |Tables/Views |[Download link](http://go.microsoft.com/fwlink/?linkid=282716&clcid=0x409) |
| Teradata |.NET Data Provider for Teradata |14+ |12+ |Tables/Views |[Download link](http://go.microsoft.com/fwlink/?linkid=278886&clcid=0x409) |
| SAP Sybase SQL Anywhere |iAnywhere.Data.SQLAnywhere for .NET 3.5 |16+ |16+ |Tables/Views |[Download link](http://go.microsoft.com/fwlink/?linkid=324846) |

>[!NOTE]
>Excel files that have an .xlsx extension do not require a separate provider installation.

>[!NOTE]
>The Oracle providers also require Oracle client software (version 8.1.7+).
> 
> 

