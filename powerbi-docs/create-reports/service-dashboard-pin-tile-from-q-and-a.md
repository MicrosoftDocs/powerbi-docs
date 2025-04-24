---
title: How to pin a tile to a dashboard from Q&A
description: Learn how to pin a tile to a Power BI dashboard from the Q&A question box by using natural language.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/05/2024
LocalizationGroup: Dashboards
#customer intent: As a Power BI user I want ot learn how to pin a tile to a dashboard in Power BI.
---
# Pin a tile to a dashboard from Q&A

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Q&A is a Power BI tool for exploring your data by using natural language. Need to find a particular insight? Ask a question about your data, and receive an answer in the form of a visualization.

In this how-to article, we open a [dashboard](../consumer/end-user-dashboards.md) in the Power BI service, ask a question by using natural language to create a visualization, and pin that visualization to the dashboard. Dashboards aren't available in Power BI Desktop. For information on using Q&A with other Power BI tools and content, see the [Power BI Q&A overview](../consumer/end-user-q-and-a.md).

## Prerequisites

- You just need a [Fabric free license](../consumer/end-user-features.md) to edit dashboards in My Workspace in the Power BI service.
- You need a Power BI Pro license to edit dashboards in other workspaces in the Power BI service. Read more about [Power BI Pro licenses](../fundamentals/service-self-service-signup-purchase-for-power-bi.md).
- You also need at least a Contributor role in that workspace. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).
- If you want to follow along, get the [Retail Analysis sample dashboard](sample-retail-analysis.md#get-the-built-in-sample-in-the-power-bi-service).

## How to pin a tile from Q&A

1. Open a dashboard that has at least one tile pinned from a report. When you ask a question, Power BI looks for the answer in any semantic model that has a tile pinned to that dashboard.
1. In the question box at the top of your dashboard, start typing what you want to know about your data.

:::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-question-box.png" alt-text="Screenshot of the question and answer question box.":::

1. For example, as you type "year over year revenue", the question box gives you suggestions. Select a suggestion or press Enter.

    :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-type-q-and-a.png" alt-text="Screenshot of a question in the question box.":::

1. To add the chart to your dashboard as a tile, select **Pin visual** in the upper right corner. If the dashboard has been shared with you, you aren't able to pin any visualizations.

1. Pin the tile to an existing dashboard or to a new dashboard.

   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-pin-to-dashboard-2.png" alt-text="Screenshot of the Pin to dashboard dialog.":::

   - Existing dashboard: select the name of the dashboard from the dropdown. Your choices are limited to only those dashboards within the current workspace.
   - New dashboard: type the name of the new dashboard, and it will be added to your current workspace.

1. Select **Pin**.

   A success message lets you know the visualization was added as a tile to your dashboard.

   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-pin-success.png" alt-text="Screenshot of the pinned to dashboard dialog.":::
1. Select **Go to dashboard** to see the new tile. There, you can [rename, resize, add a hyperlink, reposition the tile, and more](service-dashboard-edit-tile.md) on your dashboard.

   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-pinned-2.png" alt-text="A screenshot of the dashboard with tiles.":::

## Considerations and troubleshooting

- When you start typing a question, Q&A immediately begins searching for the best answer from all semantic models associated with the current dashboard. The "current dashboard" is the dashboard listed in the top nav pane. For example, this question is being asked in the **Retail Analysis Sample** dashboard.

  :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-navbar-2.png" alt-text="screenshot of the tile pinned to the dashboard.":::

- **How does Q&A know which semantic models to use**? Q&A has access to all semantic models that have at least one visualization pinned to that dashboard.

- **Don't see the question box**? Check with your Power BI administrator. The administrator has the ability to disable Q&A.

## Related content

- [Edit or remove a dashboard tile](service-dashboard-edit-tile.md)
- [Display content in more detail: focus mode and full screen mode](../consumer/end-user-focus.md)
- [Q&A for Power BI business users](../consumer/end-user-q-and-a.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
