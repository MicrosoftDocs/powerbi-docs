---
title: View Related Content in Power BI Dashboards and Reports
description: Discover how to view and navigate related content in Power BI dashboards, reports, and semantic models. Learn to open reports, generate insights, and analyze data efficiently.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.custom: video-B2vd4MQrz4M
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/12/2026
ai-usage: ai-assisted
LocalizationGroup: Get started
---

# View related content in Power BI dashboards and reports

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

The **Related content** pane shows how your Power BI service content - dashboards, reports, and semantic models - are interconnected. The **Related content** pane is also a launching pad for taking action. From here, you can open dashboards and reports, generate insights, analyze the data in Excel, and more.  

In the Power BI service, reports are built on semantic models, report visuals are pinned to dashboards, and dashboard visuals link back to reports. But how do you know which dashboards host visuals from your Marketing report? And how do you locate those dashboards? Is your Procurement dashboard using visuals from more than one semantic model? If so, what are their names and how can you open them? Is your HR semantic model used in any reports or dashboards at all? You can answer questions like these on the **Related content** pane. The pane displays the related content and allows you to take action on the content and easily navigate between related items.

:::image type="content" source="./media/end-user-related/power-bi-see-related-pane.png" alt-text="Screenshot that shows the Related content pane in the Power BI service.":::

> [!NOTE]
> The related content feature doesn't work for streaming semantic models.

## Why use related content?

The **Related content** pane helps you understand and navigate your Power BI content more effectively. Here are common scenarios where it's useful:

- **Understand data sources**: You found a useful dashboard tile and want to explore the underlying report or understand what data it's based on.
- **Find similar content**: You're viewing a report and want to see what other reports use the same semantic model, which might contain related insights.
- **Prepare for presentations**: Before presenting a dashboard to stakeholders, you want to review the source reports to understand the data context and be ready for questions.
- **Discover more insights**: You're analyzing a report and want to see what dashboards use this data, which might reveal how others in your organization are using the same information.
- **Verify data freshness**: You want to check when the semantic model behind your report was last refreshed to ensure you're working with current data.

## See related content for a dashboard or report

When you open a dashboard or report, select **More options** (...) in the menu bar, and choose **See related content** from the dropdown.

:::image type="content" source="./media/end-user-related/power-bi-see-related-new.png" alt-text="Screenshot that shows the More options dropdown menu.":::

The **Related content** pane opens. For a dashboard, it shows all the reports that have visualizations pinned to the dashboard and their associated semantic models. For this dashboard, visualizations come from only one report and that report is based on only one semantic model. If you look at the image at the beginning of this article, you see related content for a dashboard that has visualizations pinned from two reports, and one semantic model.

:::image type="content" source="./media/end-user-related/power-bi-view-related-dashboard-new.png" alt-text="Screenshot that shows the Related content pane for a dashboard.":::

From here, you can take direct action on the related content, depending on your permissions. For example, select a report or dashboard name to open it. For a listed report, select an icon to [get insights](end-user-insights.md) and more. For a semantic model, review the last refresh date and time, [analyze in Excel](../collaborate-share/service-analyze-in-excel.md), [get insights](end-user-insights.md), refresh, and more.

## Considerations and limitations

- If you don't see **See related**, look for the icon instead :::image type="icon" source="./media/end-user-related/power-bi-view-related-icon-new.png":::. Select the icon to open the **Related content** pane.
- To open related content for a report, you need to be in [Reading view](end-user-reading-view.md#reading-view).
- The related content feature doesn't work for streaming datasets.
- **Permissions**: The actions you can take on related content depend on your permissions. For example, you need at least read access to view related content. To analyze data in Excel or refresh a semantic model, you need additional permissions on the semantic model. If you don't have permission to access certain related items, you might see them listed but can't open them.
- **App content**: When viewing content through an app, the **Related content** pane shows relationships within that app's content. You can see reports and dashboards included in the app, but you might not see the underlying semantic models if they weren't included in the app or if you don't have separate access to them.
- **Workspace context**: Related content can span multiple workspaces if you have access to them. If a related item is in a workspace you can't access, it doesn't appear in the related content pane.

## Related content

- [Tutorial: Get started creating in the Power BI service](../fundamentals/service-get-started.md)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)
