---
title: Azure Synapse Analytics (formerly SQL Data Warehouse) with DirectQuery
description: Learn how to connect to a SQL Server database with the Azure Synapse Analytics connector in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.reviewer: ""
ms.custom: ""
ms.date: 11/10/2023
LocalizationGroup: Data from databases
---

# Azure Synapse Analytics (formerly SQL Data Warehouse) with DirectQuery

Azure Synapse Analytics (formerly SQL Data Warehouse) with DirectQuery allows you to create dynamic reports based on data and metrics you already have in Azure Synapse Analytics. With DirectQuery, queries are sent back to your Azure Synapse Analytics in real time as you explore the data. Real-time queries, combined with the scale of Synapse Analytics enables users to create dynamic reports in minutes against terabytes of data.

When you use the Azure Synapse Analytics connector:

* Specify the fully qualified server name when you connect (see details later in this article).
* Ensure firewall rules for the server are configured to "Allow access to Azure services".
* Every action such as selecting a column or adding a filter will directly query the data warehouse.
* Tiles are set to refresh approximately every 15 minutes and you don't need to schedule a refresh.  You can adjust refresh in the Advanced settings when you connect.
* Q&A isn't available for DirectQuery semantic models.
* Schema changes aren't picked up automatically.

These restrictions and notes can change as we continue to improve the experience. Steps to connect are in the next section.

## Build dashboards and reports in Power BI

> [!IMPORTANT]
> We continually improve connectivity to Azure Synapse Analytics. For the best experience to connect to your Azure Synapse Analytics data source, use Power BI Desktop. After you've built your model and report, you can publish it to the Power BI service. The previously available direct connector for Azure Synapse Analytics in the Power BI service is no longer available.

The easiest way to move between your Synapse Analytics and Power BI is to create reports in Power BI Desktop. To get started, [download and install Power BI Desktop](../fundamentals/desktop-get-the-desktop.md).

## Connect through Power BI Desktop

You can connect to an Azure Synapse Analytics using the process described in [the Power Query article about Azure SQL Data Warehouse](/power-query/connectors/azure-sql-data-warehouse).

## Find Parameter Values

Your fully qualified server name and database name can be found in the Azure portal. Azure Synapse Analytics only has a presence in the Azure portal at this time.

:::image type="content" source="media/service-azure-sql-data-warehouse-with-direct-connect/azureportal.png" alt-text="Screenshot of the Azure portal with SQK demo data highlighted.":::

> [!NOTE]
> If your Power BI tenant is in the same region as the Azure Synapse Analytics there will be no egress charges. To find where your Power BI tenant is located, see [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md).

[!INCLUDE [direct-query-sso](../includes/direct-query-sso.md)]

## Related content

* [DirectQuery in Power BI](desktop-directquery-about.md)
* [What is Power BI?](../fundamentals/power-bi-overview.md)  
* [Data sources for the Power BI service](service-get-data.md)  
* [What is dedicated SQL pool (formerly SQL DW) in Azure Synapse Analytics?](/azure/sql-data-warehouse/sql-data-warehouse-overview-what-is/)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
