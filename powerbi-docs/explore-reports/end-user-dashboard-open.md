---
title: View and Interact with Power BI Dashboards
description: Learn how to open, view, and interact with Power BI dashboards. Explore tiles, use Q&A, navigate view modes, and maximize your insights.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/14/2026
ai-usage: ai-assisted
LocalizationGroup: Dashboards
ms.custom:  
---
# View and interact with Power BI dashboards

[!INCLUDE[consumer-appliesto-ynny](../includes/consumer-appliesto-ynny.md)]

Power BI *business users* spend a lot of time viewing dashboards. Designers create dashboards to highlight specific information from the underlying reports and semantic models. Power BI business users rely on that information for tracking, monitoring, answering questions, testing, and more. They use it to make data-driven business decisions.

This article shows you how to open dashboards, understand what you're viewing, and interact with dashboard elements to get the insights you need.

:::image type="content" source="media/end-user-dashboard-open/power-bi-sales-dashboard.png" alt-text="Screenshot of the Sales and Marketing Sample dashboard.":::

To share a dashboard or view a shared dashboard, you need a Power BI Pro or Premium Per User (PPU) license. The only exception is when the content is hosted in a Premium (or Fabric F64+) capacity. [Which license do I have?](/power-bi/fundamentals/end-user-license)

## Open a dashboard

You can open dashboards from many locations in the Power BI service. One way to open a dashboard is to select and open a workspace.

:::image type="content" source="media/end-user-dashboard-open/power-bi-workspace-select.png" alt-text="Screenshot of the navigation pane with Workspaces highlighted.":::

If that workspace contains a dashboard, you see the following icon.

:::image type="icon" source="media/end-user-dashboard-open/power-bi-dashboard.png" border="false":::

After you identify a dashboard, open it by selecting it. The dashboard fills your Power BI canvas.

On the left navigation pane, you can view and open dashboards from:

- **Home**
- **Browse**
  - **Recent** - if you recently visited a dashboard
  - **Favorites** - if you [set a dashboard as a favorite](end-user-favorite.md)
  - **Shared with me** - if a colleague [shared a dashboard with you](end-user-shared-with-me.md)
- **Data hub** - contains content from across your organization
- **Apps** - most apps contain both dashboards and reports
- **Workspaces**, including **My workspace** - if you downloaded any of the [Power BI samples](/power-bi/create-reports/sample-datasets) or other content, or if colleagues shared content with you.

## Understand dashboard elements and tiles

When you open a dashboard, it fills your Power BI canvas. A dashboard is a single-page canvas that contains visualizations called *tiles*. Each tile displays a specific chart, metric, or image that you pinned from a report.

:::image type="content" source="media/end-user-dashboard-open/power-bi-sales-dashboard.png" alt-text="Screenshot of a dashboard showing various tiles with charts and metrics.":::

Key elements you see on a dashboard:

- **Dashboard name** - displayed at the top of the page
- **Tiles** - individual visualizations arranged on the canvas
- **Q&A box** - lets you ask questions about your data in natural language (if available)
- **More options (...)** - provides access to dashboard actions like refresh, settings, and sharing
- **Subscribe** - lets you set up email subscriptions for the dashboard
- **Filters** - some dashboards might have filters applied (though this condition is less common than in reports)

Each tile is a snapshot of data from the underlying report. Tiles update automatically when the underlying data refreshes, so you always see current information.

## Interact with tiles

Tiles are the building blocks of dashboards. Here's how to interact with them:

- **Hover over a tile** - see a tooltip with extra information and access **More options (...)**
- **Select a tile** - opens the report page where the visualization was created, letting you explore the full context
- **Use More options (...)** - export data, view insights, add comments, or open in focus mode

Some tiles, like images or text boxes, might not link to a report. For detailed information about working with tiles, see [Dashboard tiles](end-user-tiles.md).

## Ask questions by using Q&A

> [!IMPORTANT]
> Q&A experiences are going away in December 2026. We recommend using [Copilot for Power BI](../create-reports/copilot-introduction.md), which offers a more advanced and integrated way to query your data using natural language.

Most dashboards include a Q&A box at the top that you can use to ask questions about your data in natural language. Select the box, type a question like "total sales by region," and Power BI generates a visualization based on your question.

For detailed guidance on using Q&A effectively, see [Ask questions with Power BI Q&A](end-user-q-and-a.md).

## View dashboards in full screen mode

Full screen mode removes the navigation pane and headers, giving you more space for your dashboard. This extra space is useful for presenting in meetings, displaying on monitors or TVs, or maximizing your view.

To enter full screen mode:

1. Open a dashboard.
1. Select **View** on the menu bar.
1. Select **Full screen**.

To exit full screen mode, press **Esc** or select **Exit full screen** in the top right corner.

For other display options, including focus mode, see [Display content in more detail](end-user-report-view.md).

## What you can do as a business user

As a Power BI business user (sometimes called a consumer), your dashboard experience focuses on viewing and consuming content. Here's what you can do:

**You can:**

- Open and view dashboards shared with you.
- Interact with tiles by using actions like hover, select, and focus mode.
- Ask questions by using Q&A (if available) or Copilot.
- Export data from tiles if permitted.
- Add comments to tiles.
- Set up email subscriptions and data alerts.
- Add dashboards to your favorites.
- Share dashboards with others if you have a Pro or PPU license.
- View dashboards on mobile devices.

**You can't:**

- Edit the dashboard layout or design unless you have edit permissions.
- Create new tiles or pin visualizations unless you have edit permissions.
- Delete tiles from the dashboard.
- Change the underlying semantic model.
- Filter or slice data on the dashboard. This is a report capability.

If you need to make changes to a dashboard, contact the dashboard owner or your Power BI administrator.

## Tips for viewing and using dashboards effectively

Get the most from your dashboard viewing experience:

- **Check the last refresh time** - see when the data was last updated at the top of the dashboard.
- **Use favorites** - add frequently used dashboards to your favorites for quick access.
- **Explore underlying reports** - select tiles to see full reports and dive deeper into the data.
- **Set up alerts** - create data alerts for key metrics to get notified when values change.
- **Use mobile apps** - view dashboards on your phone or tablet with the Power BI mobile app. 

## Related content

- [Dashboards for business users](end-user-dashboards.md) - understand the concepts behind dashboards
- [Dashboard tiles](end-user-tiles.md) - explore tiles in more detail
- [Ask questions with Power BI Q&A](end-user-q-and-a.md) - learn advanced Q&A techniques
- [Set data alerts on tiles](end-user-alerts.md) - get notified when data changes
- [Get started with samples](/power-bi/create-reports/sample-tutorial-connect-to-the-samples) - practice with sample dashboards
