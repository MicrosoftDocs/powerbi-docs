---
title: "Merge or append on-premises and cloud data sources"
description: "Use the on-premises data gateway to merge or append on-premises and cloud data sources in the same query."
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 01/17/2023
LocalizationGroup: Gateways
---

# Merge or append on-premises and cloud data sources

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

You can use the on-premises data gateway to merge or append on-premises and cloud data sources in the same query. This solution is helpful when you want to combine data from multiple sources without having to use separate queries.

> [!NOTE]
> This article applies only to datasets that have cloud and on-premises data sources merged or appended in a single query. For datasets that include separate queries, for instance, one that connects to an on-premises data source and the other to a cloud data source, the gateway doesn't execute the query for the cloud data source.

## Prerequisites

- A [gateway installed](/data-integration/gateway/service-gateway-install) on a local computer.
- A Power BI Desktop file with queries that combine on-premises and cloud data sources.

> [!NOTE]
> To access any cloud data sources, you must ensure that the gateway has access to those data sources.

1. In the upper-right corner of the Power BI service, select the gear icon :::image type="icon" source="media/service-gateway-mashup-on-premises-cloud/icon-gear.png"::: then **Manage connections and gateways**.

   ![Screenshot shows the gear icon with its context menu with Manage connections and gateways selected.](media/service-gateway-mashup-on-premises-cloud/manage-gateways.png)

1. Select the gateway you want to configure, and select **Settings** from the top ribbon

    :::image type="content" source="media/service-gateway-mashup-on-premises-cloud/open-settings-gateway.png" alt-text="Screenshot of opening the setting page for gateways." :::

1. Under **Settings**, select **Allow user's cloud data sources to refresh through this gateway cluster**, then select **Save**.

1. To  add any [on-premises data sources](service-gateway-enterprise-manage-scheduled-refresh.md#add-a-data-source) used in your queries, select **Connections**, then select **New** to create a connection. You don't need to add the cloud data sources here.

1. Select your gateway for **Gateway cluster name**. Name the connection and specify the type of connection and other required information. Then select **Create**.

1. Upload to the Power BI service your Power BI Desktop file with the queries that combine on-premises and cloud data sources.

With the cloud credentials set, you can now refresh the dataset by using the **Refresh now** option. Or, you can schedule it to refresh periodically.

## Related content

To learn more about data refresh for gateways, see [Use the data source for scheduled refresh](service-gateway-enterprise-manage-scheduled-refresh.md#use-the-data-source-for-scheduled-refresh).
