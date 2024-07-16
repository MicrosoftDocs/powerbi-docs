---
title: Upgrade Power BI Report Server
description: Learn how to upgrade Power BI Report Server.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.custom: ""
ms.date: 01/06/2022
---

# Upgrade Power BI Report Server

Learn how to upgrade Power BI Report Server.

 **Download** ![download icon](media/upgrade/download.png "download icon")

To download Power BI Report Server, and Power BI Desktop for Power BI Report Server, go to [On-premises reporting with Power BI Report Server](https://powerbi.microsoft.com/report-server/).

## Before you begin

Before you upgrade a report server, we recommend the following steps to back up your report server.

### Backing up the encryption keys

Back up the encryption keys when you configure a report server installation for the first time. Also back up the keys anytime you change the identity of the service accounts or rename the computer. For more information, see [Back Up and Restore Reporting Services Encryption Keys](/sql/reporting-services/install-windows/ssrs-encryption-keys-back-up-and-restore-encryption-keys).

### Backing up the report server databases

Because a report server is a stateless server, all application data is stored in the **reportserver** and **reportservertempdb** databases that run on a SQL Server Database Engine instance. You can back up the **reportserver** and **reportservertempdb** databases using one of the supported methods for backing up SQL Server databases. These recommendations are specific to report server databases:

* Use the full recovery model to back up the **reportserver** database.
* Use the simple recovery model to back up the **reportservertempdb** database.
* You can use different backup schedules for each database. The only reason to back up the **reportservertempdb** is to avoid having to recreate it if there is a hardware failure. In case of hardware failure, you don't need to recover the data in **reportservertempdb**, but you do need the table structure. If you lose **reportservertempdb**, the only way to get it back is to recreate the report server database. If you recreate the **reportservertempdb**, it's important that it have the same name as the primary report server database.

For more information about backup and recovery of SQL Server relational databases, see [Back Up and Restore of SQL Server Databases](/sql/relational-databases/backup-restore/back-up-and-restore-of-sql-server-databases).

### Backing up the configuration files

Power BI Report Server uses configuration files to store application settings. Back up the files when you first configure the server, and after you deploy any custom extensions. Files to back up include:

* config.json
* RSHostingService.exe.config
* Rsreportserver.config
* Rssrvpolicy.config
* Reportingservicesservice.exe.config
* Web.config for the Report Server ASP.NET applications
* Machine.config for ASP.NET

## Upgrade the report server

Upgrading Power BI Report Server is straightforward. There are only a few steps to install the files.

1. Find the location of PowerBIReportServer.exe and launch the installer.

2. Select **Upgrade Power BI Report Server**.

    ![Upgrade Power BI Report Server](media/upgrade/reportserver-upgrade1.png "Upgrade Power BI Report Server")

3. Read and agree to the license terms and conditions and then select **Upgrade**.

    ![License agreement](media/upgrade/reportserver-upgrade-eula.png "License agreement")

4. After a successful upgrade, you can select **Configure Report Server** to launch the Reporting Services Configuration Manager, or select **Close** to exit the installer.

    ![Upgrade config](media/upgrade/reportserver-upgrade-configure.png)

## Enable Microsoft Update security fixes for Power BI Report Server

Power BI Report Server receives security fixes via Microsoft Update. To enable getting them, manually opt in to Microsoft Update.

1.	Open Windows Update in **Update & security settings** on the computer you want to opt in.
2.	Select **Advanced options**.
3.	Select the checkbox for **Give me updates for other Microsoft products when I update Windows**.

## Upgrade Power BI Desktop

After you upgrade the report server, make sure that any Power BI report authors upgrade to the version of Power BI Desktop for Power BI Report Server that matches the server.

## Related content

* [Administrator overview](admin-handbook-overview.md)  
* [Install Power BI Desktop for Power BI Report Server](install-powerbi-desktop.md)  
* [Verify a Reporting Services installation](/sql/reporting-services/install-windows/verify-a-reporting-services-installation)  
* [Configure the report server service account](/sql/reporting-services/install-windows/configure-the-report-server-service-account-ssrs-configuration-manager)  
* [Configure report server URLs](/sql/reporting-services/install-windows/configure-report-server-urls-ssrs-configuration-manager)  
* [Configure a report server database connection](/sql/reporting-services/install-windows/configure-a-report-server-database-connection-ssrs-configuration-manager)  
* [Initialize a report server](/sql/reporting-services/install-windows/ssrs-encryption-keys-initialize-a-report-server)  
* [Configure SSL connections on a report server](/sql/reporting-services/security/configure-ssl-connections-on-a-native-mode-report-server)  
* [Configure windows service accounts and permissions](/sql/database-engine/configure-windows/configure-windows-service-accounts-and-permissions)  
* [Browser support for Power BI Report Server](browser-support.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
