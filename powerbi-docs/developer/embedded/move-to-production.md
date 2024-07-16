---
title: Move your Power BI embedded analytics app to production
description: Find out how to move your Power BI embedded app to production by assigning a capacity to your workspace. See specifications for various capacities and SKUs.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: ''
ms.date: 01/20/2024
#Customer intent: As an ISV developer, I want to embed a report, dashboard, or tile into an application so that my customers can share data.
---

# Move your embedded app to production

>[!IMPORTANT]
>This article only applies to [embed-for-your-customers](embedded-analytics-power-bi.md#embed-for-your-customers) applications. If you're using the [embed-for-your-organization](embedded-analytics-power-bi.md#embed-for-your-organization) scenario, you need to use either a Pro or Premium license.

After you've developed your application, you need to back your workspace with a [capacity](./pbi-glossary.md#capacity) before you can move to production.
**All workspaces** (the ones containing the reports or dashboards, and the ones containing the semantic models) must be assigned to a capacity.

## Create a capacity

By creating a capacity, you can take advantage of having a resource for your customers. There are two types of capacities you can choose from:

* **Power BI Premium** - A tenant-level Microsoft 365 subscription available in two SKU families, *EM* and *P*. When you embed Power BI content, this solution is referred to as *Power BI embedding*. For more information regarding this subscription, see [What is Power BI Premium?](../../enterprise/service-premium-what-is.md).

* **Azure Power BI Embedded** - A subscription that uses *A* SKUs. You can purchase a capacity from the [Azure portal](https://portal.azure.com). For details about how to create a Power BI Embedded capacity, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md).

  > [!NOTE]
  > SKUs of type *A* don't support the use of a free Power BI license to access Power BI content.

### Capacity specifications

The following table describes the resources and limits of each SKU. To determine which capacity best fits your needs, see [Which solution should I choose?](./embedded-faq.yml#which-solution-should-i-choose-).

[!INCLUDE [Power BI capacity and SKUs](../../includes/capacity-table.md)]

## Development testing

For development testing, you can use free embed trial tokens with a Pro license or Premium Per User (PPU) license. To embed in a production environment, use a capacity.

> [!IMPORTANT]
> Free trial tokens are limited to development testing only. After going to production, a capacity must be purchased. Until a capacity is purchased, the *Free trial version* banner continues to appear at the top of the embedded report.

The number of embed trial tokens a Power BI *service principal* or *master user* (master account) can generate is limited. Use the [Available features](/rest/api/power-bi/available-features/get-available-features) API to check the percentage of your current embedded usage. The usage amount is displayed per service principal or master account.

If you run out of embed tokens while testing, you need to purchase a Power BI Embedded or Premium [capacity](embedded-capacity.md). There's no limit to the number of embed tokens you can generate with a capacity.

## Assign a workspace to a capacity

After you create a capacity, you can assign your workspace to that capacity.

Each workspace that contains a Power BI item related to the embedded content (including semantic models, reports, and dashboards) must be assigned to capacities. For example, if an embedded report and the semantic model bound to it reside in different workspaces, both workspaces must be assigned to capacities.

### Assign a workspace to a capacity by using a service principal

To assign a workspace to a capacity by using a [service principal](embed-service-principal.md), use the [Power BI REST API](/rest/api/power-bi/capacities/groups_assigntocapacity). When you're using the Power BI REST APIs, make sure to use the [service principal object ID](embed-service-principal.md). The service principal should have administrator permissions for the workspace and capacity assignment permissions for the capacity.

### Assign a workspace to a capacity by using a master user

You can also assign a workspace to a capacity from the settings of that workspace by using a **master user**. The master user must have admin permissions for that workspace, and also capacity assignment permissions for that capacity.

1. In the **Power BI service**, expand **Workspaces**, and then scroll to the workspace you're using for embedding your content. On its **More** menu, select **Workspace settings**.

   :::image type="content" source="media/move-to-production/workspace-settings.png" alt-text="Screenshot of the Power BI service, with the More menu of a workspace expanded. On that menu, the ellipsis and Workspace settings are highlighted.":::

1. Select the **Premium** tab, and do the following:

   1. Under **License mode**, select the type of capacity you created: **Premium per capacity** or **Embedded**.

   1. Select the capacity you created.

   1. Select **Save**.

   :::image type="content" source="media/move-to-production/premium-tab.png" alt-text="Screenshot of the premium settings of a workspace in the Power BI service. A selected capacity and the Save button are highlighted.":::

   After you assign your workspace to a capacity, a diamond appears next to it in the **Workspaces** list.

   :::image type="content" source="media/move-to-production/premium-workspace.png" alt-text="Screenshot of the Power BI service. In the Workspaces list, a diamond is visible next to the name of a workspace that has a capacity assigned to it.":::

## Related content

* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Capacity planning in Power BI embedded analytics](embedded-capacity-planning.md)
* [Considerations when generating an embed token](generate-embed-token.md)
