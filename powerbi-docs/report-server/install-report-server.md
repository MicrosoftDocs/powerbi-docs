---
title: Install Power BI Report Server
description: Find out how to install Power BI Report Server on Windows Server. Also get information about configuring the report server, integrations, and other components.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 11/05/2025
ai-usage: ai-assisted
ms.custom: intro-installation
# customer intent: As a Power BI user, I want to find out how to install Power BI Report Server so that I can create, manage, and share reports on an on-premises server.
---

# Install Power BI Report Server

Power BI Report Server is an on-premises server that provides a web portal for displaying and managing reports and key performance indicators (KPIs). This article shows you how to install Power BI Report Server.

> [!NOTE]
> Starting with SQL Server 2025 (17.x) Preview, on-premises reporting services are being consolidated under **[Power BI Report Server](/power-bi/report-server/get-started)**. For more information, see **[Reporting Services consolidation FAQ](/sql/reporting-services/reporting-services-consolidation-faq)**.

> [!TIP]
> An alternative to installing Power BI Report Server on-premises is to create a [Windows Server 2019 virtual machine (VM) with a Power BI Report Server Enterprise image from Azure Marketplace](https://marketplace.microsoft.com/product/virtual-machines/microsoftpowerbi.pbirs?tab=overview).

## Prerequisites

The requirements listed in [Hardware and software requirements for installing Power BI Report Server](system-requirements.md)

> [!IMPORTANT]
> You can install Power BI Report Server in an environment that has a read-only domain controller (RODC). But Power BI Report Server needs access to a read-write domain controller to function properly. If Power BI Report Server only has access to a RODC, you might encounter errors when you try to administer the service.

### Power BI Report Server product key

If you want to use a product key instead of installing a free edition, you first need to locate your product key. For instructions, see [How to find your report server product key](find-product-key.md).

> [!IMPORTANT]
> When you install Power BI Report Server on multiple servers for a scale-out scenario, all servers must use the same Power BI Report Server product key.

## Download the Power BI Report Server installer

To download the Power BI Report Server installer, take the following steps:

1. Go to [On-premises reporting with Power BI Report Server](https://www.microsoft.com/power-platform/products/power-bi/report-server), and then select **Download free trial**. Even though you select the free trial in this step, you have the option later of entering a product key.

1. On the page that opens, select your preferred language, and then select **Download**.

1. Select **PowerBIReportServer.exe**, and then select **Download**.

## Install your report server

Installing Power BI Report Server is straightforward. You can install the files in a few steps.

You don't need a SQL Server database engine server for installation. But you do need one to configure your report server after the installation.

1. Find the downloaded *PowerBIReportServer.exe* file and open the installer.

1. Select **Install Power BI Report Server**.

   :::image type="content" source="media/install-report-server/installer-welcome-page.png" alt-text="Screenshot of the Welcome page in the Power BI Report Server installer. The Install Power BI Report Server button is highlighted.":::

1. Select an edition to install.

   :::image type="content" source="media/install-report-server/choose-install-edition.png" alt-text="Screenshot of the Choose an edition to install page in the Power BI Report Server installer. The option for installing a free edition is selected.":::

   - If you select **Choose a free edition**, select either **Evaluation** or **Developer**, and then select **Next**.

     :::image type="content" source="media/install-report-server/pbireportserver-choose-edition2.png" alt-text="Screenshot of the Choose an edition to install page in the Power BI Report Server installer. The free editions list contains Developer and Evaluation.":::

   - If you select **Enter the product key**, enter the product key that you got from either the Power BI service or the Microsoft 365 admin center, and then select **Next**. For more information about how to get your product key, see [Power BI Report Server product key](#power-bi-report-server-product-key), earlier in this article.

1. Review and accept the license terms, and then select **Next**.

   :::image type="content" source="media/install-report-server/review-license-terms-page.png" alt-text="Screenshot of the Review the license terms page in the Power BI Report Server installer, with the checkbox for accepting the terms selected.":::

1. On the **Install Database Engine** page, select **Next** to install the report server only. You need a database engine available to store the report server database.

   :::image type="content" source="media/install-report-server/install-database-engine-page.png" alt-text="Screenshot of the Install Database Engine page in the Power BI Report Server installer, with the Install Power BI Report Server only option selected.":::

1. Enter the installation location for the report server, and then select **Install**.

   :::image type="content" source="media/install-report-server/specify-installation-location-page.png" alt-text="Screenshot of the Specify an install location page in the Power BI Report Server installer. The Install location box contains a path.":::

   The default path is *C:\Program Files\Microsoft Power BI Report Server*.

1. After a successful setup, select **Configure report server** to open Report Server Configuration Manager.

   :::image type="content" source="media/install-report-server/setup-completed-page.png" alt-text="Screenshot of the Setup completed page in the Power BI Report Server installer. The Configure report server button is highlighted.":::

## Configure your report server

After you select **Configure report server** in the setup, Report Server Configuration Manager opens. For more information, see [What is Report Server Configuration Manager (Native mode)?](/sql/reporting-services/install-windows/reporting-services-configuration-manager-native-mode).

To complete the initial configuration of your report server, you [create a report server database](/sql/reporting-services/install-windows/ssrs-report-server-create-a-report-server-database). A SQL Server database server is required to complete this step.

### Create a database on a different server

You can use one machine for your report server and a different machine for your database server. If you do, change the service account for the report server to a credential that the database server recognizes.

By default, the report server uses the virtual service account. If you try to create a database on a different server, you might receive the following error on the step for applying connection rights:

`System.Data.SqlClient.SqlException (0x80131904): Windows NT user or group '(null)' not found. Check the name again.`

To work around the error, you can change the service account to either **Network Service** or a domain account. Changing the service account to **Network Service** applies rights in the context of the machine account for the report server.

:::image type="content" source="media/install-report-server/service-account-page.png" alt-text="Screenshot of the Service Account page in Report Server Configuration Manager. For the built-in account, Network Service is selected and highlighted.":::

For more information, see [Configure the report server service account (Report Server Configuration Manager)](/sql/reporting-services/install-windows/configure-the-report-server-service-account-ssrs-configuration-manager).

## Windows service

A Windows service is created as part of the installation. Windows Services Manager lists it as **Power BI Report Server**. The service name is `PowerBIReportServer`.

:::image type="content" source="media/install-report-server/windows-services-manager-list.png" alt-text="Screenshot of Windows Services Manager. In the list of services, Power BI Report Server is highlighted, and its status is Running." lightbox="media/install-report-server/windows-services-manager-list.png":::

:::image type="content" source="media/install-report-server/windows-services-manager-properties.png" alt-text="Screenshot of the Power BI Report Server properties dialog in Windows Services Manager. The General tab lists the name, path, and other properties." lightbox="media/install-report-server/windows-services-manager-properties.png":::

## Default URL reservations

By default, Power BI Report Server uses certain URLs to provide access to its report server and web portal. These URL reservations are composed of a prefix, host name, port, and virtual directory.

| Part | Description |
| --- | --- |
| Prefix |The default prefix is `HTTP`. If you previously installed a Transport Layer Security (TLS) certificate, the setup process tries to create URL reservations that use the `HTTPS` prefix. |
| Host name |The default host name is a strong wildcard (`+`). It specifies that the report server accepts any HTTP request on the designated port for any host name that resolves to the computer, including `https://<computer-name>/reportserver`, `https://localhost/reportserver`, or `https://<IP-address>/reportserver.` |
| Port |The default port is 80. If you use any port other than port 80, you have to explicitly add it to the URL when you open the web portal in a browser. |
| Virtual directory |By default, Power BI Report Server creates two virtual directories:<br>-For the report server: *reportserver*.<br>-For the web portal: *reports*. |

The complete strings might look like the following URLs:

- For the report server: `https://+:80/reportserver`
- For the web portal: `https://+:80/reports`

For more information, see [Configure report server URLs (Report Server Configuration Manager)](/sql/reporting-services/install-windows/configure-report-server-urls-ssrs-configuration-manager) and [Configure TLS connections on a native mode report server](/sql/reporting-services/security/configure-ssl-connections-on-a-native-mode-report-server).

## Firewall

If you're accessing the report server from a remote machine, make sure you configure any firewall rules if there's a firewall present.

Open up the Transmission Control Protocol (TCP) port that you configure for your report server URL and web portal URL. By default, they're configured on TCP port 80.

## Other configurations

- To configure integration with the Power BI service so you can pin report items to a Power BI dashboard, see [Power BI Report Server integration (Configuration Manager)](/sql/reporting-services/install-windows/power-bi-report-server-integration-configuration-manager).
- To configure email for subscriptions processing, see [Email settings in Reporting Services native mode (Report Server Configuration Manager)](/sql/reporting-services/install-windows/e-mail-settings-reporting-services-native-mode-configuration-manager) and [Email delivery in Reporting Services](/sql/reporting-services/subscriptions/e-mail-delivery-in-reporting-services).
- To configure the web portal so you can access it on a report computer to view and manage reports, see [Configure a firewall for report server access](/sql/reporting-services/report-server/configure-a-firewall-for-report-server-access) and [Configure a report server for remote administration](/sql/reporting-services/report-server/configure-a-report-server-for-remote-administration).
- For detailed information about setting report server system properties in SQL Server Management Studio, see [Server properties Advanced page - Power BI Report Server & Reporting Services](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services). Unless it specifies otherwise, the options apply to both Power BI Report Server and SQL Server Reporting Services.

## Related content

- [Verify a Reporting Services installation](/sql/reporting-services/install-windows/verify-a-reporting-services-installation)
- [SSRS Encryption Keys - Initialize a report server](/sql/reporting-services/install-windows/ssrs-encryption-keys-initialize-a-report-server)
- [Admin overview, Power BI Report Server](admin-handbook-overview.md)
