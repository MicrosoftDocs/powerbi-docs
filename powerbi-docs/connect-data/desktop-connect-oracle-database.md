---
title: Connect to an Oracle Database with Power BI Desktop
description: Learn how to connect to an Oracle database with Power BI Desktop using the Oracle Client for Microsoft Tools and on-premises data gateway.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 09/25/2025
LocalizationGroup: Connect to data
ms.custom: sfi-image-nochange
#customer intent: As a Power BI user, I want to learn how to connect to an Oracle database with Power BI Desktop using the Oracle Client for Microsoft Tools and an on-premises data gateway so that I can access and analyze data from Oracle databases in my Power BI reports and dashboards.
---
# Connect to an Oracle database with Power BI Desktop

You can easily connect to an Oracle database to access and analyze data in Power BI Desktop. This article explains the initial setup requirements so you can create the connection successfully.

To connect to an Oracle database or Oracle Autonomous Database with Power BI Desktop, install Oracle Client for Microsoft Tools (OCMT) on the computer running Power BI Desktop. The OCMT software you use depends on which version of Power BI Desktop you've installed: 32-bit or 64-bit. It also depends on your version of Oracle server.

## Supported Oracle database versions

- Oracle Database 12c (12.1.0.2) and later
- Oracle Autonomous Database - all versions

## Determine which version of Power BI Desktop is installed

To determine which version of Power BI Desktop is installed, on the **Help** ribbon, select **About**, then check the **Version** line. In the following image, a 64-bit version of Power BI Desktop is installed:

:::image type="content" source="media/desktop-connect-oracle-database/connect-oracle-database_1.png" alt-text="Screenshot of the Power BI Desktop About dialog showing the 64-bit version information.":::

## Install the Oracle Client for Microsoft Tools

OCMT installs and configures Oracle Data Provider for .NET (ODP.​NET) to support 32-bit and 64-bit Microsoft tool connections with Oracle on-premises and cloud databases, including Oracle Autonomous Database. It is a graphical installer that automates the Oracle Database Client setup process. It supports connecting with Power BI Desktop, Power BI service, Excel, SQL Server Analysis Services, SQL Server Data Tools, SQL Server Integration Services, SQL Server Reporting Services, and BizTalk Server.

Microsoft recommends using the Oracle Client for Microsoft Tools (OCMT), a graphical installer that simplifies setup. OCMT installs Oracle Data Provider for .NET (ODP.NET) and configures environment variables automatically. It supports both Power BI Desktop and on-premises data gateway scenarios.

OCMT is free software. It can be downloaded from the [Oracle Client for Microsoft Tools page](https://www.oracle.com/database/technologies/appdev/ocmt.html) and is available for 32-bit or 64-bit Power BI Desktop.

Power BI Desktop uses unmanaged ODP.​NET to connect to Oracle database or Oracle Autonomous Database.

You can find [step-by-step instructions on how to use OCMT and set up Oracle database connectivity in Power BI Desktop here](https://www.oracle.com/a/ocom/docs/database/microsoft-powerbi-connection-adw.pdf).

## Connect to an Oracle database with the on-premises data gateway

Some Power BI Desktop app deployments use the on-premises data gateway to connect to Oracle database. To connect to an Oracle database with the [on-premises data gateway](/data-integration/gateway/), use 64-bit OCMT on the computer running the gateway since the gateway is a 64-bit app. For more information, go to [Manage your data source - Oracle](./service-gateway-onprem-manage-oracle.md).

> [!NOTE]
> If you're connecting to an on-premises Oracle database, ensure your machine has network access to the database server. This may require a VPN connection or firewall configuration. Contact your IT administrator for assistance.

## Connect to an Oracle database

For information about connecting to an Oracle database or an Oracle Autonomous database from either Power BI Desktop or the Power BI service, go to the [Power Query article on Oracle databases](/power-query/connectors/oracle-database).

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
