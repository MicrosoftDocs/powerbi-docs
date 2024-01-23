---
title: Refresh semantic models created from local Power BI Desktop files
description: Refresh semantic models created from Power BI Desktop files that are imported from a local drive.
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Data refresh
---
# Refresh semantic models created from local Power BI Desktop files

Power BI supports **Refresh now** and **Schedule refresh** for semantic models that are created from imported local Power BI Desktop files. Power BI supports refresh for any of the following data sources that you connect to or load with **Get data** and Power Query Editor.

### Power BI gateway (personal mode)

On-premises data gateway (personal mode) supports refresh for the following data sources:

- All online data sources that appear in Power BI Desktop **Get data** and Power Query Editor.
- All on-premises data sources that appear in Power BI Desktop **Get data** and Power Query Editor, except for Hadoop files (HDFS) and Microsoft Exchange.

<!-- Refresh Data sources-->
[!INCLUDE [refresh-datasources](../includes/refresh-datasources.md)]

> [!NOTE]
> A gateway must be installed and running for Power BI to connect to on-premises data sources and refresh the semantic model.

## Refresh in Power BI Desktop vs. Power BI service

You can do a one-time, manual refresh in Power BI Desktop by selecting **Refresh** on the **Home** tab of the ribbon. When you select **Refresh**, the data in the file's model refreshes with updated data from the original data source.

![Screenshot that shows Refresh on the Power BI Desktop ribbon.](media/refresh-desktop-file-local-drive/pbix-refresh.png)

This kind of refresh from within Power BI Desktop is different from manual or scheduled refresh in the Power BI service. It's important to understand the distinction.

When you import your Power BI Desktop file from a local drive, data and other information about the model is loaded into a semantic model in the Power BI service. You base your reports in the Power BI service on the semantic model. You refresh the data in the Power BI service, not in Power BI Desktop, because you based your reports on the semantic model in the service. Because the data sources are external, you can manually refresh the semantic model by using **Refresh now**, or you can set up a refresh schedule by using **Schedule refresh**.

When you refresh the semantic model, Power BI doesn't connect to the file on the local drive to query for updated data. Power BI uses information in the semantic model to connect directly to the data sources, query for updated data, and then load the updated data into the semantic model.

> [!NOTE]
> Refreshed data in the semantic model doesn't synchronize back to the file on the local drive.

## Scheduled refresh

When you set up a refresh schedule, Power BI connects directly to the data sources by using the connection information and credentials in the semantic model. Power BI queries for updated data, then loads the updated data into the semantic model. Any visualizations in reports and dashboards that are based on that semantic model also update.

For details on how to set up scheduled refresh, see [Configure scheduled refresh](refresh-scheduled-refresh.md).

## Troubleshooting

When things go wrong, it's usually because Power BI can't sign into data sources. Make sure Power BI can sign into your data sources. If the semantic model connects to an on-premises data source, the gateway might be offline. If the password you use to sign in to the data source changes, or Power BI gets signed out, try signing into your data sources again in **Data source credentials**.

Be sure to set **Send refresh failure notifications** to **Semantic model owner**, so you know right away if a scheduled refresh fails.

Sometimes refreshing data might not go as you expect. This issue often involves a gateway. For tools and known issues, see the following gateway troubleshooting articles:

- [Troubleshoot the on-premises data gateway](service-gateway-onprem-tshoot.md)
- [Troubleshoot the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
