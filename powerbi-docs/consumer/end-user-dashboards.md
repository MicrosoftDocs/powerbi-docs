---
title: Dashboards for Business Users of the Power BI Service
description: Learn about Power BI dashboards, a single-page canvas with key visualizations that tell a story. Understand the advantages and how dashboards differ from reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-explore
ms.search.form: Get started with dashboards
ms.topic: concept-article
ms.date: 12/01/2025
LocalizationGroup: Dashboards
ms.custom: intro-overview
ai-usage: ai-assisted
---
# Dashboards for business users of the Power BI service

[!INCLUDE[consumer-appliesto-ynny](../includes/consumer-appliesto-ynny.md)]

A Power BI *dashboard* is a single page, often called a canvas, that uses visualizations to tell a story. Because it's limited to one page, a well-designed dashboard contains only the most important elements of that story.

> [!TIP]
> **Key takeaway:** Dashboards display visualizations from one or more reports on a single page. Unlike reports, dashboards don't support filtering or slicing, but they do support Q&A natural language queries and data alerts.

## Key concepts for understanding dashboards

Before exploring dashboards, here are some essential terms:

- **Tile**: A single visualization (chart, number, image) displayed on a dashboard. Tiles are pinned from reports.
- **Pin**: The action of adding a visualization from a report to a dashboard.
- **Semantic model**: The underlying data that powers reports and dashboards.
- **Report**: A multi-page collection of visualizations based on a single semantic model.
- **Q&A**: A feature that lets you ask questions about your data in natural language.

:::image type="content" source="media/end-user-dashboards/power-bi-full-dashboard.png" alt-text="Screenshot showing the Sales and Marketing Sample dashboard." lightbox="media/end-user-dashboards/power-bi-full-dashboard.png#lightbox":::

The visualizations on the dashboard are called *tiles*. Report designers *pin* tiles to the dashboard. In most cases, selecting a tile takes you to the report page where the visualization was created. If you're new to Power BI, start with [Basics of the Power BI service](../fundamentals/service-basic-concepts.md) to get a good foundation. Hovering over an element on a dashboard displays a tooltip.

> [!NOTE]
>
>You can view and share dashboards on [mobile devices](mobile/mobile-apps-view-dashboard.md).
>
>To view dashboards that colleagues share with you, you must have a Power BI Pro or Premium Per User (PPU) license, or the content must be shared with you from a Premium (or Fabric F64+) capacity. For more information, see [Power BI license types](../fundamentals/end-user-license.md).

The visualizations on a dashboard come from reports, and each report is based on one semantic model. You can think of a dashboard as an entryway into the underlying reports and semantic models. Select a visualization to take you to the report that was used to create it.

:::image type="content" source="media/end-user-dashboards/power-bi-diagram.png" alt-text="Diagram showing the relationship between dashboards, reports, and semantic models.":::

## Advantages of dashboards

Dashboards are a great way to monitor your business, find answers, and see your most important metrics at a glance. The visualizations on a dashboard can come from one or more underlying semantic models or reports. A dashboard can combine on-premises and cloud data, which provides a consolidated view regardless of where the data lives.

A dashboard isn't just a pretty picture, it's an interactive canvas. The tiles update as the underlying data changes.

## Try it: Explore a sample dashboard

The best way to understand dashboards is to explore one yourself. Power BI provides built-in samples you can use to follow along with this article.

### Get the Sales and Marketing sample

1. Open the Power BI service at [app.powerbi.com](https://app.powerbi.com) and sign in.
1. In the navigation pane, select **Learn**.
1. On the **Learning center** page, under **Sample reports**, find **Sales and Marketing Sample** and select it.
1. Power BI installs the sample in your **My workspace**. Select the **Sales and Marketing Sample** dashboard to open it.

### Explore the dashboard

Now that you have the sample dashboard open, try these actions:

- **View a tile's source**: Hover over a tile and select **More options (...)** > **Open report** to see the report page where the visualization was created.
- **Ask a question**: At the top of the dashboard, select the Q&A box and type "total units this year" to see how Power BI answers with a visualization.
- **See tile details**: Hover over any tile to see a tooltip with more information about the data.
- **Resize your view**: Use the browser zoom controls to see how the dashboard adapts to different screen sizes.

As you explore, notice how the dashboard brings together key metrics from multiple report pages onto a single canvas, making it easy to monitor business performance at a glance.

## Dashboards vs. reports for Power BI business users

How you interact with Power BI depends on your job role. As a consumer or business user, you receive content like dashboards, reports, and apps from colleagues who are designers. Reports can be confused with dashboards because they're both canvases filled with visualizations, but there are major differences from a Power BI business user's point of view. The following table shows an overview of the different capabilities of dashboards and reports.

| **Capability** | **Dashboards** | **Reports** |
| --- | --- | --- |
| **Pages** | One page | One or more pages |
|**Ask a question about your data (Power BI Q&A) field** | Yes, almost always available | No Q&A field |
| **Data sources** | One or more report or semantic model per dashboard |A single semantic model per report |
| **Filtering** | No, you can't filter or slice | Yes, there are many ways to filter, highlight, and slice |
| **Set alerts** | Yes, you can create email alerts when certain conditions are met | No, you can't set alerts |
| **Can see underlying semantic model tables and fields** |No. Can export data but can't see the semantic model tables and fields in the dashboard itself |Yes. Can see semantic model tables and fields and values that you have permissions to see |

## Related content

- [View a dashboard](end-user-dashboard-open.md).
- Learn about [dashboard tiles](end-user-tiles.md) and what happens when you select one.
- Track and receive email alerts for individual dashboard tiles by [Creating alerts on tiles](end-user-alerts.md).
- Learn how to use [Power BI Q&A](end-user-q-and-a.md) to ask a question about your data and get the answer in the form of a visualization.
