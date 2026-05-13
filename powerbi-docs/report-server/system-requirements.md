---
title: Hardware and software requirements for installing Power BI Report Server
description: This article lays out  the minimum hardware and software requirements to install and run Power BI Report Server.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: concept-article
ms.date: 01/06/2026
ai-usage: ai-assisted
---

# Hardware and software requirements for installing Power BI Report Server

This article lays out the minimum hardware and software requirements to install and run Power BI Report Server. See [Capacity planning guidance for Power BI Report Server](capacity-planning.md) for more details.

> [!NOTE]
> Starting with SQL Server 2025, Microsoft is consolidating all on-premises reporting services under Power BI Report Server. No new versions of SQL Server Reporting Services (SSRS) will be released. Power BI Report Server is now the default on-premises reporting solution for SQL Server.

> [!IMPORTANT]
> Starting with the May 2025 version of Power BI Desktop for RS, your CPU must support Advanced Vector Extensions (AVX) instructions. If your CPU doesn't support AVX instructions, you might encounter unexpected errors with certain visuals in Power BI Desktop or Power BI Report Server. Even if your CPU supports AVX, the host machine's BIOS or virtualization settings could have AVX instructions disabled. Ensure that AVX instructions are enabled in your system configuration.

## Processor, memory, and operating system requirements

These are the requirements for the latest generally available (GA) version. 

| Component | Requirement |
| --- | --- |
| .NET Framework |4.8 or later<br><br>If the server doesn't have internet access, you can manually install the required version of the .NET Framework. For most scenarios, [download the latest supported .NET Framework version for Windows](https://dotnet.microsoft.com/en-us/download/dotnet-framework).<br/><br/>If you specifically need .NET Framework 4.8, use the [Microsoft .NET Framework 4.8 (Offline Installer) for Windows](https://support.microsoft.com/help/4503548/).<br/><br/>For more information, recommendations, and guidance about .NET Framework deployment, see [.NET Framework Deployment Guide for Developers](/dotnet/framework/deployment/deployment-guide-for-developers).<br/> |
| Hard Disk |Power BI Report Server requires a minimum of 1 GB of available hard-disk space.<br><br>Addition space will be required on the database server that is hosting the report server database. |
| Memory |**Minimum:** 1 GB<br/><br/> **Recommended:** At least 4 GB |
| Processor speed |**Minimum:** x64 Processor: 1.4 GHz<br/><br/> **Recommended:** 2.0 GHz or faster |
| Processor type |x64 Processor: AMD Opteron, AMD Athlon 64, Intel Xeon with Intel EM64T support, Intel Pentium IV with EM64T support |
| Operating system |Windows Server 2025<br><br>Windows Server 2022<br><br>Windows Server 2019 Datacenter<br><br>Windows Server 2019 Standard<br><br>Windows 11|

> [!NOTE]
> Installation of Power BI Report Server is supported on x64 processors only.

## Database server version requirements

SQL Server is used to host the report server databases. The SQL Server Database Engine instance can be a local or remote instance. The following are the supported versions of SQL Server Database Engine that can be used to host the report server databases:

* Azure SQL Managed Instance (Power BI Report Server January 2020 version and later)
* SQL Server 2025
* SQL Server 2022
* SQL Server 2019
* SQL Server 2017
* SQL Server 2016
* SQL Server 2014 SP3

When you create the report server database on a remote computer, you have to configure the connection to use a domain user account or a service account with network access. If you decide to use a remote SQL Server instance, consider carefully which credentials the report server should use to connect to the SQL Server instance. For more information, see [Configure a Report Server Database Connection](/sql/reporting-services/install-windows/configure-a-report-server-database-connection-ssrs-configuration-manager).

## Considerations

Power BI Report Server will install default values to configure the core settings required to make a report server operational. It has the following requirements:

* The supported languages for Power BI Report Server are - English, German, Spanish, Japanese, Italian, French, Russian, Chinese Simplified, Chinese Traditional, Portuguese Brazil, Korean
* A SQL Server Database Engine must be available after setup and before you configure the database for the report server. The Database Engine instance hosts the report server database that Reporting Services Configuration Manager will create. The Database Engine is not required for the actual setup experience.
* [Reporting Services Features Supported by the Editions of SQL Server](/sql/reporting-services/reporting-services-features-supported-by-the-editions-of-sql-server-2016) outlines differences between the editions of SQL Server.
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

## Related content

* [What is Power BI Report Server?](get-started.md)  
* [Install Power BI Report Server](install-report-server.md) 
* [Capacity planning guidance for Power BI Report Server](capacity-planning.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
