---
title: Hardware and software requirements for installing Power BI Report Server
description: This article lays out  the minimum hardware and software requirements to install and run Power BI Report Server.
author: markingmyname
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-report-server
ms.topic: conceptual
ms.date: 11/08/2018
ms.author: maghan

---
# Hardware and software requirements for installing Power BI Report Server
This article lays out the minimum hardware and software requirements to install and run Power BI Report Server.

## Processor, Memory, and Operating System Requirements

| Component | Requirement |
| --- | --- |
| .NET Framework |4.6<br><br>You can manually install the .NET Framework from [Microsoft .NET Framework 4.6 (Web Installer) for Windows](http://support.microsoft.com/kb/3045560).<br/><br/> For more information, recommendations, and guidance about the .NET Framework 4.6 see [.NET Framework Deployment Guide for Developers](http://msdn.microsoft.com/library/ee942965\(v=vs.110\).aspx).<br/><br/>Windows 8.1, and Windows Server 2012 R2 require [KB2919355](http://support.microsoft.com/kb/2919355) before installing .NET Framework 4.6. |
| Hard Disk |Power BI Report Server requires a minimum of 1 GB of available hard-disk space.<br><br>Addition space will be required on the database server that is hosting the report server database. |
| Memory |**Minimum:** 1 GB<br/><br/> **Recommended:** At least 4 GB |
| Processor speed |**Minimum:** x64 Processor: 1.4 GHz<br/><br/> **Recommended:** 2.0 GHz or faster |
| Processor type |x64 Processor: AMD Opteron, AMD Athlon 64, Intel Xeon with Intel EM64T support, Intel Pentium IV with EM64T support |
| Operating system |Windows Server 2016 Datacenter<br><br>Windows Server 2016 Standard<br><br>Windows Server 2012 R2 Datacenter<br><br>Windows Server 2012 R2 Standard<br><br>Windows Server 2012 R2 Essentials<br><br>Windows Server 2012 R2 Foundation<br><br>Windows Server 2012 Datacenter<br><br>Windows Server 2012 Standard<br><br>Windows Server 2012 Essentials<br><br>Windows Server 2012 Foundation<br><br>Windows 10 Home<br><br>Windows 10 Professional<br><br>Windows 10 Enterprise<br><br>Windows 8.1<br><br>Windows 8.1 Pro<br><br>Windows 8.1 Enterprise<br><br>Windows 8<br><br>Windows 8 Pro<br><br>Windows 8 Enterprise |

> [!NOTE]
> Installation of Power BI Report Server is supported on x64 processors only.
> 
> 

## Database server version requirements
SQL Server is used to host the report server databases. The SQL Server Database Engine instance can be a local or remote instance. The following are the supported versions of SQL Server Database Engine that can be used to host the report server databases:

* SQL Server 2017
* SQL Server 2016
* SQL Server 2014
* SQL Server 2012

When you create the report server database on a remote computer, you have to configure the connection to use a domain user account or a service account with network access. If you decide to use a remote SQL Server instance, consider carefully which credentials the report server should use to connect to the SQL Server instance. For more information, see [Configure a Report Server Database Connection](https://docs.microsoft.com/sql/reporting-services/install-windows/configure-a-report-server-database-connection-ssrs-configuration-manager).

## Considerations
Power BI Report Server will install default values to configure the core settings required to make a report server operational. It has the following requirements:

* A SQL Server Database Engine must be available after setup and before you configure the database for the report server. The Database Engine instance hosts the report server database that Reporting Services Configuration Manager will create. The Database Engine is not required for the actual setup experience.
- [Reporting Services Features Supported by the Editions of SQL Server](https://docs.microsoft.com/sql/reporting-services/reporting-services-features-supported-by-the-editions-of-sql-server-2016) outlines differences between the editions of SQL Server.
* The user account that runs Setup must be a member of the local Administrators group.
* The user account that runs Reporting Services Configuration Manager must have permission to access and create databases on the Database Engine instance that hosts the report server databases.
* Setup must be able to use the default values to reserve the URLs that provide access to the report server and the web portal. These values are port 80, a strong wildcard, and the virtual directory names in the format **ReportServer** and **Reports**.

## Read-only domain controller (RODC)
 You can install the report server in an environment that has a Read-Only Domain Controller (RODC). However, Reporting Services needs access to a Read-Write Domain Controller to function properly. If Reporting Services only has access to a RODC, you may encounter errors when trying to administer the service.

## Power BI reports and Analysis Services live connections
You can use a live connection against tabular or multidimensional instances. Your Analysis Services server has to be the proper version and edition to work properly.

| **Server version** | **Required SKU** |
| --- | --- |
| 2012 SP1 CU4 or later |Business Intelligence and Enterprise SKU |
| 2014 |Business Intelligence and Enterprise SKU |
| 2016 and later |Standard SKU or higher |

## Next steps
[What is Power BI Report Server?](get-started.md)  
[Administrator overview](admin-handbook-overview.md)  
[Install Power BI Report Server](install-report-server.md)  
[Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

