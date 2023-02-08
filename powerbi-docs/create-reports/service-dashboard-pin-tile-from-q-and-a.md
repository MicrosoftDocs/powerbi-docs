---
title: How to pin a tile to a dashboard from Q&A
description: Learn how to pin a tile to a Power BI dashboard from the Q&A question box by using natural language.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/08/2023
LocalizationGroup: Dashboards
---
# Pin a tile to a dashboard from Q&A

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Q&A is a Power BI tool for exploring your data by using natural language. Need to find a particular insight? Ask a question about your data, and receive an answer in the form of a visualization.

In this how-to article, we open a [dashboard](../consumer/end-user-dashboards.md) in the Power BI service, ask a question by using natural language to create a visualization, and pin that visualization to the dashboard. Dashboards aren't available in Power BI Desktop. For information on using Q&A with other Power BI tools and content, see the [Power BI Q&A overview](../consumer/end-user-q-and-a.md).

To follow along, open the [Retail Analysis sample dashboard](sample-retail-analysis.md).

## How to pin a tile from Q&A

1. Open a dashboard that has at least one tile pinned from a report. When you ask a question, Power BI looks for the answer in any dataset that has a tile pinned to that dashboard.
2. In the question box at the top of your dashboard, start typing what you want to know about your data.
   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-question-box.png" alt-text="Screenshot of the Q&A question box.":::
3. For example, as you type "year over year revenue", the question box gives you suggestions.
   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-type-q-and-a.png" alt-text="Screenshot of a question in the question box.":::

4. To add the chart to your dashboard as a tile, select **Pin visual**. If the dashboard has been shared with you, you aren't able to pin any visualizations.

5. Pin the tile to an existing dashboard or to a new dashboard.

   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-pin-to-dashboard-2.png" alt-text="Screenshot of the Pin to dashboard dialog.":::

   * Existing dashboard: select the name of the dashboard from the dropdown. Your choices are limited to only those dashboards within the current workspace.
   * New dashboard: type the name of the new dashboard, and it will be added to your current workspace.

6. Select **Pin**.

   A success message lets you know the visualization was added as a tile to your dashboard.

   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-pin-success.png" alt-text="Screenshot of the pinned to dashboard dialog.":::
7. Select **Go to dashboard** to see the new tile. There, you can [rename, resize, add a hyperlink, reposition the tile, and more](service-dashboard-edit-tile.md) on your dashboard.

   :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-pinned-2.png" alt-text="dashboard with tiles":::

## Considerations and troubleshooting

* When you start typing a question, Q&A immediately begins searching for the best answer from all datasets associated with the current dashboard. The "current dashboard" is the dashboard listed in the top nav pane. For example, this question is being asked in the **Retail Analysis Sample** dashboard.

  :::image type="content" source="media/service-dashboard-pin-tile-from-q-and-a/power-bi-navbar-2.png" alt-text="screenshot of the tile pinned to the dashboard.":::
* **How does Q&A know which datasets to use**? Q&A has access to all datasets that have at least one visualization pinned to that dashboard.

* **Don't see the question box**? Check with your Power BI administrator. The administrator has the ability to disable Q&A.

## Next steps

[Edit or remove a dashboard tile](service-dashboard-edit-tile.md)
[Display content in more detail: focus mode and full screen mode](../consumer/end-user-focus.md)
[Q&A for Power BI business users](../consumer/end-user-q-and-a.md)
More questions? [Ask the Power BI Community](https://community.powerbi.com/)
