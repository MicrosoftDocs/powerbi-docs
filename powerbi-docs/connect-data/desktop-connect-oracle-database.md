---
title: Connect to an Oracle database with Power BI Desktop
description: Steps and downloads necessary to connect Oracle to Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/22/2023
LocalizationGroup: Connect to data
---
# Connect to an Oracle database with Power BI Desktop
To connect to an Oracle database with Power BI Desktop, the correct Oracle client software must be installed on the computer running Power BI Desktop. The Oracle client software you use depends on which version of Power BI Desktop you've installed: 32-bit or 64-bit. It also depends on your version of Oracle server.

Supported Oracle versions: 
- Oracle Server 9 and later
- Oracle Data Access Client (ODAC) software 11.2 or greater

Before you can connect to an Oracle database using Power BI, you need to install the Oracle Data Access Client (ODAC) software 11.2 or greater on your computer. To install the 32-bit ODAC software, go to [32-bit Oracle Data Access Components (12.1.0.2.4)](https://www.oracle.com/technetwork/topics/dotnet/utilsoft-086879.html) or choose a version you prefer. To install the 64-bit ODAC software, go to [64-bit Oracle Data Access Components (12.1.0.2.4)](https://www.oracle.com/technetwork/database/windows/downloads/index-090165.html) or choose a version you prefer.  You must choose a Windows Installer version since x-copy version doesn't work with Power BI Desktop. 

From the Oracle readme file:

"Machine-wide configuration is no longer supported beginning with ODAC 18c. Administrators can still place ODP.NET in the GAC and add the configuration section handler and DbProviderFactory information to machine.config manually if they wish to override ODP.NET settings for individual applications."

Once Oracle 18.x/19.x is installed the customer must follow the instructions here: [Registering Oracle drivers for Power BI Desktop](/sql/reporting-services/report-data/oracle-connection-type-ssrs#64-bit-and-32-bit-drivers-for-power-bi-desktop)

If you're configuring an Oracle database for Power BI Desktop, On Premises Data Gateway, or Power BI Report Server, consult the information in the [Oracle Connection Type](/sql/reporting-services/report-data/oracle-connection-type-ssrs) article. 


## Determining which version of Power BI Desktop is installed
To determine which version of Power BI Desktop is installed, on the **Help** ribbon, select **About**, then check the **Version** line. In the following image, a 64-bit version of Power BI Desktop is installed:

![Power BI Desktop version](media/desktop-connect-oracle-database/connect-oracle-database_1.png)

## Install the Oracle client
- For the 32-bit version of Power BI Desktop, [download and install the 32-bit Oracle client](https://www.oracle.com/technetwork/topics/dotnet/utilsoft-086879.html).

- For the 64-bit version of Power BI Desktop, [download and install the 64-bit Oracle client](https://www.oracle.com/database/technologies/odac-downloads.html).

> [!NOTE]
> Choose a version of Oracle Data Access Client (ODAC) which is compatible with your Oracle Server. For instance, ODAC 12.x does not always support Oracle Server version 9.
> Choose the Windows installer of the Oracle Client.
> During the setup of the Oracle client, make sure you enable *Configure ODP.NET and/or Oracle Providers for ASP.NET at machine-wide level* by selecting the corresponding checkbox during the setup wizard. Some versions of the Oracle client wizard selects the checkbox by default, others do not. Make sure that checkbox is selected so that Power BI can connect to your Oracle database.

## Connect to an Oracle database
After you install the matching Oracle client driver, you can connect to an Oracle database. To connect to an Oracle database with the [on-premises data gateway](/data-integration/gateway/), the correct Oracle client software must be installed on the computer running the gateway. The Oracle client software you use depends on the Oracle server version, but will always match the 64-bit gateway. For more information, go to [Manage your data source - Oracle](./service-gateway-onprem-manage-oracle.md).

### 64-bit and 32-bit drivers for Power BI Desktop

Power BI Desktop uses **Unmanaged ODP.NET** for authoring Power BI reports. You only need to take the following steps when using drivers later than Oracle ODAC 12.2. For ODAC 12.2 and previous drivers, when you install ODAC you have an option to include the configuration of **Unmanaged ODP.NET** at a machine-wide level automatically. 

The steps in the following two sections assume you've installed the ODAC 18.x files to the c:\oracle64 folder for 64-bit versions of Power BI Desktop, or to the c:\oracle32 folder for the 32-bit versions of Power BI Desktop. Follow these steps to register **Unmanaged ODP.NET**:

#### 64-bit Power BI Desktop

1. On the Oracle download site, install the Oracle 64-bit ODAC Oracle Universal Installer (OUI).

2. Register ODP.NET Unmanaged Client to GAC:


    `C:\oracle64\product\18.0.0\client_1\odp.net\bin\4\OraProvCfg.exe /action:gac /providerpath:C:\oracle64\product\18.0.0\client_1\odp.net\bin\4\Oracle.DataAccess.dll`

3. Add ODP.NET Unmanaged Client entries to machine.config:

    `C:\oracle64\product\18.0.0\client_1\odp.net\bin\4\OraProvCfg.exe /action:config /force /product:odp /frameworkversion:v4.0.30319 /providerpath:C:\oracle64\product\18.0.0\client_1\odp.net\bin\4\Oracle.DataAccess.dll`

#### 32-bit Power BI Desktop

1. On the Oracle download site, install the [Oracle 32-bit ODAC Oracle Universal Installer (OUI)](https://www.oracle.com/technetwork/topics/dotnet/downloads/odacdev-4242174.html).

2. Register ODP.NET Unmanaged Client to GAC:

    `C:\oracle32\product\18.0.0\client_1\odp.net\bin\4\OraProvCfg.exe /action:gac /providerpath:C:\oracle32\product\18.0.0\client_1\odp.net\bin\4\Oracle.DataAccess.dll`

3. Add ODP.NET Unmanaged Client entries to machine.config:

    `C:\oracle32\product\18.0.0\client_1\odp.net\bin\4\OraProvCfg.exe /action:config /force /product:odp /frameworkversion:v4.0.30319 /providerpath:C:\oracle32\product\18.0.0\client_1\odp.net\bin\4\Oracle.DataAccess.dll`


## Connect to an Oracle Database

For information about connecting to an Oracle database or an Oracle Autonomous database, go to the Power Query article on [Oracle databases](/power-query/connectors/oracle-database).

## Next steps

* [DirectQuery in Power BI](desktop-directquery-about.md)
* [What is Power BI?](../fundamentals/power-bi-overview.md)  
* [Data sources for the Power BI service](service-get-data.md)  

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
