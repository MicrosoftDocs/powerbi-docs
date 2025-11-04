---
title: Install Power BI Report Server
description: Learn how to install Power BI Report Server on Windows Server or create a virtual machine running Power BI Report Server on Azure, including prerequisites, database configuration, and service account setup.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
ms.custom: intro-installation
---

# Install Power BI Report Server

Learn how to install Power BI Report Server.

> [!NOTE]
> Starting in SQL Server 2025 (17.x) Preview, we are consolidating our on-premises reporting services under **[Power BI Report Server](/power-bi/report-server/get-started)**. For more information, see **[Reporting Services consolidation FAQ](/sql/reporting-services/reporting-services-consolidation-faq)**.

> [!TIP]
> Another option is to create a [virtual machine (VM) with a Power BI Report Server Enterprise Image](https://azuremarketplace.microsoft.com/marketplace/apps/microsoftpowerbi.pbirs?tab=overview) on Windows Server 2019 from Azure Marketplace.

## Prerequisites

Before you install Power BI Report Server, ensure that your system meets the requirements listed in [Hardware and Software Requirements for installing Power BI Report Server](system-requirements.md).

> [!IMPORTANT]
> You can install Power BI Report Server in an environment that has a Read-Only Domain Controller (RODC). But Power BI Report Server needs access to a Read-Write Domain Controller to function properly. If Power BI Report Server only has access to a RODC, you might encounter errors when you try to administer the service.

### Power BI Report Server product key

If you want to use a product key instead of installing a free edition, find your product key. For instructions, see [How to find your report server product key](find-product-key.md).

> [!IMPORTANT]
> When you install Power BI Report Server on multiple servers for a scale-out scenario, all servers must use the same Power BI Report Server product key.

## Download the Power BI Report Server installer

To download the Power BI Report Server installer, take the following steps:

1. Go to [On-premises reporting with Power BI Report Server](https://powerbi.microsoft.com/report-server/), and then select **Download free trial**. Even though you select the free trial in this step, you have the option later of entering a product key.

1. On the page that opens, select your preferred language, and then select **Download**.

1. Select **PowerBIReportServer.exe**, and then select **Download**.

## Install your report server

Installing Power BI Report Server is straightforward. You can install the files in a few steps.

You don't need a SQL Server database engine server for installation. But you do need one to configure Reporting Services after the installation.

1. Find the location of *PowerBIReportServer.exe* and launch the installer.

1. Select **Install Power BI Report Server**.

   :::image type="content" source="media/install-report-server/installer-welcome-page.png" alt-text="Screenshot of the Welcome page in the Power BI Report Server installer. The Install Power Bi Report Server button is highlighted.":::

1. Select an edition to install.

   :::image type="content" source="media/install-report-server/choose-install-edition.png" alt-text="Screenshot of the Choose an edition to install page in the Power BI Report Server installer. The option for installing a free edition is selected.":::

   - If you select **Choose a free edition**, select either **Evaluation** or **Developer**, and then select **Next**.

     :::image type="content" source="media/install-report-server/pbireportserver-choose-edition2.png" alt-text="Screenshot of the Choose an edition to install page in the Power BI Report Server installer. The free editions list contains Developer and Evaluation.":::

   - If you select **Enter the product key**, enter the product key that you got from either the Power BI service or the Volume License Service Center, and then select **Next**. For more information about how to get your product key, see [Power BI Report Server product key](#power-bi-report-server-product-key), earlier in this article.

1. Review and accept the license terms, and then select **Next**.

   :::image type="content" source="media/install-report-server/review-license-terms-page.png" alt-text="Screenshot of the Review the license terms page in the Power BI Report Server installer, with the checkbox for accepting the terms selected.":::

1. You need a Database Engine available to store the report server database. Select **Next** to install the report server only.

   :::image type="content" source="media/install-report-server/install-database-engine-page.png" alt-text="Screenshot of the Install Database Engine page in the Power BI Report Server installer, with the Install Power BI Report Server only option selected.":::

1. Specify the install location for the report server. Select **Install** to continue.

   :::image type="content" source="media/install-report-server/specify-installation-location-page.png" alt-text="Screenshot of the Specify an install location page in the Power BI Report Server installer. The Install location box contains a path.":::

   The default path is C:\Program Files\Microsoft Power BI Report Server.

1. After a successful setup, select **Configure report server** to launch Report Server Configuration Manager.

   :::image type="content" source="media/install-report-server/setup-completed-page.png" alt-text="Screenshot of the Setup completed page in the Power BI Report Server installer. The Configure report server button is highlighted.":::

## Configure your report server

After you select **Configure report server** in the setup, Reporting Services Configuration Manager opens. For more information, see [Reporting Services Configuration Manager](/sql/reporting-services/install-windows/reporting-services-configuration-manager-native-mode).

To complete the initial configuration of Reporting Services, you [create a report server database](/sql/reporting-services/install-windows/ssrs-report-server-create-a-report-server-database). A SQL Server Database server is required to complete this step.

### Creating a database on a different server

If you're creating the report server database on a database server on a different machine, change the service account for the report server to a credential that's recognized on the database server.

By default, the report server uses the virtual service account. If you try to create a database on a different server, you might receive the following error on the step for applying connection rights:

`System.Data.SqlClient.SqlException (0x80131904): Windows NT user or group '(null)' not found. Check the name again.`

To work around the error, you can change the service account to either **Network Service** or a domain account. Changing the service account to **Network Service** applies rights in the context of the machine account for the report server.

:::image type="content" source="media/install-report-server/service-account-page.png" alt-text="Screenshot of the Service Account page in Report Server Configuration Manager. For the built-in account, Network Service is selected and highlighted.":::

For more information, see [Configure the report server service account](/sql/reporting-services/install-windows/configure-the-report-server-service-account-ssrs-configuration-manager).

## Windows service

A Windows service is created as part of the installation. In Windows Services Manager, it's listed as **Power BI Report Server**. The service name is `PowerBIReportServer`.

:::image type="content" source="media/install-report-server/windows-services-manager-list.png" alt-text="Screenshot of Windows Services Manager. In the list of services, Power BI Report Server is highlighted, and its status is Running.":::

:::image type="content" source="media/install-report-server/windows-services-manager-properties.png" alt-text="Screenshot of the Power BI Report Server properties dialog in Windows Services Manager. The General tab lists the name, path, and other properties.":::

## Default URL reservations

URL reservations are composed of a prefix, host name, port, and virtual directory:

| Part | Description |
| --- | --- |
| Prefix |The default prefix is HTTP. If you previously installed a Secure Sockets Layer (SSL) certificate, Setup tries to create URL reservations that use the HTTPS prefix. |
| Host name |The default host name is a strong wildcard (+). It specifies that the report server accepts any HTTP request on the designated port for any host name that resolves to the computer, including `https://<computername>/reportserver`, `https://localhost/reportserver`, or `https://<IPAddress>/reportserver.` |
| Port |The default port is 80. If you use any port other than port 80, you have to explicitly add it to the URL when you open web portal in a browser window. |
| Virtual directory |By default, virtual directories are created in the format of ReportServer for the Report Server Web service and Reports for the web portal. For the Report Server Web service, the default virtual directory is **reportserver**. For the web portal, the default virtual directory is **reports**. |

An example of the complete URL string might be as follows:

- `https://+:80/reportserver` provides access to the report server.
- `https://+:80/reports` provides access to the web portal.

## Firewall

If you're accessing the report server from a remote machine, make sure you've configured any firewall rules if there is a firewall present.

Open up the TCP port that you've configured for your Web Service URL and Web Portal URL. By default, they're configured on TCP port 80.

## Additional configuration

- To configure integration with the Power BI service so you can pin report items to a Power BI dashboard, see [Integrate with the Power BI service](/sql/reporting-services/install-windows/power-bi-report-server-integration-configuration-manager).
- To configure email for subscriptions processing, see [E-Mail settings](/sql/reporting-services/install-windows/e-mail-settings-reporting-services-native-mode-configuration-manager) and [E-Mail delivery in a report server](/sql/reporting-services/subscriptions/e-mail-delivery-in-reporting-services).
- To configure the web portal so you can access it on a report computer to view and manage reports, see [Configure a firewall for report server access](/sql/reporting-services/report-server/configure-a-firewall-for-report-server-access) and [Configure a report server for remote administration](/sql/reporting-services/report-server/configure-a-report-server-for-remote-administration).
- For details on setting report server system properties in SQL Server Management Studio, see [Server Properties Advanced Page](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services). Unless it specifies otherwise, the options apply to both Power BI Report Server and SQL Server Reporting Services.

## Related content

- [Administrator overview](admin-handbook-overview.md)  
- [How to find your report server product key](find-product-key.md)  
- [Install Power BI Desktop for Power BI Report Server](install-powerbi-desktop.md)  
- [Verify a Reporting Services installation](/sql/reporting-services/install-windows/verify-a-reporting-services-installation)  
- [Configure the report server service account](/sql/reporting-services/install-windows/configure-the-report-server-service-account-ssrs-configuration-manager)  
- [Configure report server URLs](/sql/reporting-services/install-windows/configure-report-server-urls-ssrs-configuration-manager)  
- [Configure a report server database connection](/sql/reporting-services/install-windows/configure-a-report-server-database-connection-ssrs-configuration-manager)  
- [Initialize a report server](/sql/reporting-services/install-windows/ssrs-encryption-keys-initialize-a-report-server)  
- [Configure SSL connections on a report server](/sql/reporting-services/security/configure-ssl-connections-on-a-native-mode-report-server)  
- [Configure windows service accounts and permissions](/sql/database-engine/configure-windows/configure-windows-service-accounts-and-permissions)  
- [Browser support for Power BI Report Server](browser-support.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
