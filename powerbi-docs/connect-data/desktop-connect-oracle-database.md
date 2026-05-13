---
title: Connect to an Oracle Database with Power BI Desktop
description: Learn how to connect to an Oracle database with Power BI Desktop and the Power BI service using the bundled Oracle provider, direct cloud connections, or the on-premises data gateway.
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 09/25/2025
LocalizationGroup: Connect to data
ms.custom: sfi-image-nochange
#customer intent: As a Power BI user, I want to learn how to connect to an Oracle database with Power BI Desktop and the Power BI service so that I can access and analyze data from Oracle databases in my Power BI reports and dashboards.
---
# Connect to an Oracle database with Power BI Desktop

You can connect to an Oracle database to access and analyze data in Power BI Desktop and the Power BI service. This article explains the connection options and setup requirements.

Power BI supports the following methods for connecting to Oracle databases:

- **Bundled Oracle provider (Preview)** — Power BI Desktop includes a built-in Oracle Managed ODP.NET provider. Enable it with preview feature switches to connect without installing separate Oracle client software.
- **Oracle Client for Microsoft Tools (OCMT)** — A graphical installer from Oracle that configures Oracle Data Provider for .NET (ODP.NET). Use OCMT if you prefer the unmanaged provider or haven't enabled the preview switches.
- **Direct cloud connections (Preview)** — Connect from the Power BI service directly to Oracle cloud databases, such as Oracle Autonomous Database, without requiring a data gateway.
- **On-premises data gateway** — Connect to on-premises Oracle databases through the enterprise on-premises data gateway.

## Supported Oracle database versions

- Oracle Database 12c (12.1.0.2) and later
- Oracle Autonomous Database - all versions

## Determine which version of Power BI Desktop is installed

To determine which version of Power BI Desktop is installed, on the **Help** ribbon, select **About**, then check the **Version** line. In the following image, a 64-bit version of Power BI Desktop is installed:

:::image type="content" source="media/desktop-connect-oracle-database/connect-oracle-database_1.png" alt-text="Screenshot of the Power BI Desktop About dialog showing the 64-bit version information.":::

## Connect with the bundled Oracle provider (Preview)

Power BI Desktop includes a bundled Oracle Managed ODP.NET provider, so you can connect to Oracle databases without installing separate Oracle client software. To use the bundled provider, enable the following preview feature switches in Power BI Desktop under **File** > **Options and settings** > **Options** > **Preview features**:

- **Enable Oracle Bundled Provider for Import Mode**
- **Enable Oracle Bundled Provider for DirectQuery Mode**

After you enable the switches, restart Power BI Desktop. You can then connect to Oracle databases through Import or DirectQuery mode using the built-in provider.

> [!NOTE]
> The bundled provider is currently in preview. Oracle Client for Microsoft Tools (OCMT) is still available as an alternative for customers who prefer the unmanaged provider or haven't enabled the preview switches.

## Install the Oracle Client for Microsoft Tools

OCMT is a graphical installer from Oracle that configures Oracle Data Provider for .NET (ODP.NET) for Power BI Desktop and on-premises data gateway scenarios. Use OCMT if you aren't using the bundled Oracle provider preview.

OCMT supports 32-bit and 64-bit connections to Oracle on-premises and cloud databases, including Oracle Autonomous Database. It also supports Excel, SQL Server Analysis Services, SQL Server Data Tools, SQL Server Integration Services, SQL Server Reporting Services, and BizTalk Server.

OCMT is free software. Download it from the [Oracle Client for Microsoft Tools page](https://www.oracle.com/database/technologies/appdev/ocmt.html). Choose the version that matches your Power BI Desktop installation (32-bit or 64-bit).

For step-by-step instructions, go to [Set up Oracle database connectivity in Power BI Desktop](https://www.oracle.com/a/ocom/docs/database/microsoft-powerbi-connection-adw.pdf).

## Connect to an Oracle database

How you connect to an Oracle database depends on whether the database is in the cloud or on-premises, and whether you're using Power BI Desktop or the Power BI service.

### Direct cloud connections from the Power BI service (Preview)

The Power BI service supports direct cloud connections to Oracle cloud endpoints, such as Oracle Autonomous Database, without requiring a data gateway. This option simplifies configuration for cloud-hosted Oracle databases.

Direct cloud connections support both Import and DirectQuery modes.

To create a direct cloud connection to an Oracle database:

1. In the Power BI service, select **Settings** > **Manage connections and gateways**.
1. Select **New connection** and choose **Cloud**.
1. For **Connection type**, select **Oracle**.
1. Enter the Oracle cloud server name. For Oracle Autonomous Database, use the endpoint URL that ends with `.oraclecloud.com`.
1. Provide the database name and authentication credentials.
1. Select **Create** to save the connection.

After you create the connection, you can use it in semantic models that connect to Oracle cloud databases through Import or DirectQuery.

### On-premises data gateway

To connect to an on-premises Oracle database from the Power BI service, use the [on-premises data gateway](/data-integration/gateway/). Install 64-bit OCMT on the computer running the gateway since the gateway is a 64-bit app. For more information, go to [Manage your data source - Oracle](./service-gateway-onprem-manage-oracle.md).

> [!NOTE]
> Personal data gateways aren't supported for Oracle connections. Use the enterprise on-premises data gateway for on-premises Oracle databases, or use direct cloud connections for Oracle cloud databases.

> [!NOTE]
> If you're connecting to an on-premises Oracle database, ensure your machine has network access to the database server. This might require a VPN connection or firewall configuration. Contact your IT administrator for assistance.

### Power Query connector reference

For detailed information about connecting to an Oracle database or an Oracle Autonomous Database from either Power BI Desktop or the Power BI service, go to the [Power Query article on Oracle databases](/power-query/connectors/oracle-database).

## Use Microsoft Entra ID SSO with Oracle

Power BI supports Microsoft Entra ID Single Sign-On (SSO) for Oracle databases. This feature allows users to authenticate using Entra ID tokens instead of Oracle usernames and passwords, improving security and simplifying access management.

Requirements are as follows:

- Oracle Database 19c Release 20 or later
- Oracle 23ai
- Oracle Autonomous Database
- Power BI Desktop (June 2024 or later)
- Microsoft Entra ID configured for your Oracle environment
- On-premises data gateway (for scheduled refresh or shared datasets)

> [!NOTE]
> Entra ID SSO for Oracle is currently supported only for DirectQuery and Import modes. Ensure your Oracle environment is configured to accept Entra ID tokens.

## Related content

- [DirectQuery in Power BI](desktop-directquery-about.md)
- [What is Power BI?](../fundamentals/power-bi-overview.md)  
- [Data sources for the Power BI service](service-get-data.md)  
- [Oracle Client for Microsoft Tools](https://www.oracle.com/database/technologies/appdev/ocmt.html)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
