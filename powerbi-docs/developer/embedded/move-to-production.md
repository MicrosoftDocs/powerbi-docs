---
title: Move your Power BI embedded analytics application to production
description: Learn what are the needed steps to move your Power BI application to production.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: ''
ms.date: 09/28/2022
#Customer intent: As an ISV developer, I want to embed a report, dashboard, or tile into an application so that my customers can share data.
---

# Move your embedded app to production

>[!IMPORTANT]
>This article only applies to [*embed for your customers*](embedded-analytics-power-bi.md#embed-for-your-customers) applications. If you're using the [*embed for your organization*](embedded-analytics-power-bi.md#embed-for-your-organization) scenario, you need to use either a Pro or Premium license.

After you've completed developing your application, to move to production you'll need to back your workspace with a [capacity](./pbi-glossary.md#capacity).
Note that **all workspaces** (the ones containing the reports or dashboards, and the ones containing the datasets) must be assigned to a capacity.

## Create a capacity

By creating a capacity, you can take advantage of having a resource for your customers. There are two types of capacities you can choose from:

* **Power BI Premium** - A tenant-level Microsoft 365 subscription available in two SKU families, *EM* and *P*. When embedding Power BI content, this solution is referred to as *Power BI embedding*. For more information regarding this subscription, see [What is Power BI Premium?](../../enterprise/service-premium-what-is.md)

* **Azure Power BI Embedded** - You can purchase a capacity from the [Microsoft Azure portal](https://portal.azure.com). This subscription uses the *A* SKUs. For details on how to create a Power BI Embedded capacity, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md).

    > [!NOTE]
    > A SKUs don't support the use of a FREE Power BI license to access to Power BI content.

### Capacity specifications

The table below describes the resources and limits of each SKU. To determine which capacity best fits your needs, see the [which SKU should I purchase for my scenario](./embedded-faq.yml#which-solution-should-i-choose-) table.

| Capacity SKUs | Total v-cores |Backend v-cores | Frontend v-cores | Max memory per dataset (GB)<sup>1, 2, 3</sup> | DirectQuery/Live connection (per second)<sup>1, 2</sup> | Max memory per query (GB)<sup>1, 2</sup> | Model refresh parallelism<sup>2</sup> |
| ----------------- | --- | ---- | ---- | --- | ------ | --- | ---- |
| EM1/A1            |   1 |  0.5 |  0.5 |   3 |   3.75 |  1  |   5  |
| EM2/A2            |   2 |  1   |  1   |   5 |   7.5  |  2  |  10  |
| EM3/A3            |   4 |  2   |  2   |  10 |  15    |  2  |  20  |
| P1/A4             |   8 |  4   |  4   |  25 |  30    |  6  |  40  |
| P2/A5             |  16 |  8   |  8   |  50 |  60    |  6  |  80  |
| P3/A6             |  32 | 16   | 16   | 100 | 120    | 10  | 160  |
| P4/A7<sup>4</sup> |  64 | 32   | 32   | 200 | 240    | 10  | 320  |
| P5/A8<sup>4</sup> | 128 | 64   | 64   | 400 | 480    | 10  | 640  |

<sup>1</sup> The [Power BI Premium Utilization and Metrics app](../../enterprise/service-premium-install-gen2-app.md) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the datasets workload per capacity.

<sup>3</sup> The *Max memory per dataset (GB)* column represents an upper bound for the dataset size. However, an amount of memory must be reserved for operations such as refreshes and queries on the dataset. The maximum dataset size permitted on a capacity may be smaller than the numbers in this column.

<sup>4</sup> SKUs greater than 100 GB aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

## Development testing

For development testing, you can use free embed trial tokens with a Pro license. To embed in a production environment, use a capacity.

> [!IMPORTANT]
> Free trial tokens are limited to development testing only. Once going to production, a capacity must be purchased. Until a capacity is purchased, the *Free trial version* banner will continue to appear at the top of the embedded report.

The number of embed trial tokens a Power BI *service principal* or *master user* (master account) can generate, is limited. Use the [Available Features](/rest/api/power-bi/available-features/get-available-features) API to check the percentage of your current embedded usage. The usage amount is displayed per service principal or master account.

If you run out of embed tokens while testing, you need to purchase a Power BI Embedded or Premium [capacity](embedded-capacity.md). There's no limit to the number of embed tokens you can generate with a capacity.

## Assign a workspace to a capacity

Once you create a capacity, you can assign your workspace to that capacity.

Each workspace that contains a Power BI item related to the embedded content (including datasets, reports, and dashboards), must be assigned to capacities. For example, if an embedded report and the dataset bound to it reside in different workspaces, both workspaces must be assigned to capacities.

### Assign a workspace to a capacity using a service principal

To assign a workspace to a capacity using a [service principal](embed-service-principal.md), use the [Power BI REST API](/rest/api/power-bi/capacities/groups_assigntocapacity). When you're using the Power BI REST APIs, make sure to use the [service principal object ID](embed-service-principal.md). The service principal should have administrator permissions on the workspace and capacity assignment permissions to the capacity.

### Assign a workspace to a capacity using a master user

You can also assign a workspace to a capacity from the settings of that workspace using a **master user**. The master user must have admin permissions to that workspace, and also capacity assignment permissions to that capacity.

1. Within the **Power BI service**, expand workspaces and select the ellipsis for the workspace you're using for embedding your content. Then select **Workspace settings**.

    >[!div class="mx-imgBorder"]
    >:::image type="content" source="media/move-to-production/workspace-settings.png" alt-text="A screenshot showing the workspace settings menu in Power B I service portal.":::

2. Select the **Premium** tab, and do the following:

    * Enable **Capacity**.

    * Select the capacity you created.

    * Select **Save**.

    >[!div class="mx-imgBorder"]
    >:::image type="content" source="media/move-to-production/premium-tab.png" alt-text="A screenshot showing the workspace premium settings tab in Power B I service portal.":::

    After assigning your workspace to a capacity, a diamond appears next to it 

    >[!div class="mx-imgBorder"]
    >:::image type="content" source="media/move-to-production/premium-workspace.png" alt-text="A screenshot showing the diamond next to a workspace with a premium capacity in Power B I service portal.":::

## Next steps

* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Capacity planning in Power BI embedded analytics](embedded-capacity-planning.md)
* [Considerations when generating an embed token](generate-embed-token.md)
