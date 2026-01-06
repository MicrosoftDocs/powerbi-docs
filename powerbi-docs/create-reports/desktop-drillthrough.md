---
title: 'Drillthrough in Power BI Reports: Navigate to Detailed Insights'
description: Learn how to use drillthrough filters, buttons, and cross-report drillthrough in Power BI Desktop to provide detailed, context-specific insights.
ms.topic: concept-article
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.date: 09/02/2025
ms.custom: "https://github.com/microsoft/powerbi-desktop-samples/blob/main/Sample%20Reports/Sales%20%26%20Returns%20Sample%20v201912.pbix"
LocalizationGroup: Create reports
ai-usage: ai-assisted
#customer intent: As a Power BI user, I want to set up drillthrough in my reports so that I can provide detailed, context-specific information to my report readers.
---

# Drillthrough in Power BI reports: Navigate to detailed insights

Drillthrough in Power BI lets users navigate from a summary view to a detailed report page filtered to a specific context. This feature improves report interactivity and supports focused analysis, enabling users to explore data related to a selected item.  

## Overview

Drillthrough is a navigation feature that lets report viewers move from one page to another filtered to a specific value. It's commonly used to show detailed information about a selected entity, like a customer, product, or region. Drillthrough can be triggered by right-clicking a visual or selecting a button, making it easy for users to explore detailed insights.

## Concepts

Understanding drillthrough components helps you design effective report navigation. This section introduces the key elements for setting up and using drillthrough.

| Feature | Description |
|---|---|
| Drillthrough filters | Fields added to a drillthrough page that determine which data is shown when a user navigates to that page. Filters apply automatically based on selection. Use multiple fields to support compound filtering. |
| Drillthrough pages | Report pages designed to display detailed information about a single item, with visuals that respond to the drillthrough filter and clear labeling. |
| Drillthrough buttons | Interactive elements that allow users to navigate to a drillthrough page. Configure buttons with tooltips and formatting for accessibility. Use conditional formatting to show or hide buttons based on filter context. |
| Cross-report drillthrough | Enables navigation between reports in the same workspace. Requires consistent field names and data types, and must be enabled in report settings. Only supported in the Power BI service. |

The following section outlines steps to create and use drillthrough features in Power BI. Each procedure is designed to be concise and focused on essential actions.

## Create a drillthrough page

To create a drillthrough page:

1. Create a new report page in Power BI Desktop.
1. In the Visualizations pane, locate the **Drillthrough filters** well.
1. Drag the desired field (for example, `Customer Name`) into the **Drillthrough filters** well.
1. Add visuals to the page that respond to the drillthrough filter, such as charts or tables that highlight key details.

## Use drillthrough from a visual

To use drillthrough from a visual, follow these steps:

1. Right-click a data point in a visual.
1. Select the drillthrough page from the context menu.
1. The drillthrough page opens and is filtered to the selected value.

## Add a drillthrough button

To add a drillthrough button, follow these steps:

1. Insert a button on a report page.
1. In the Visualizations pane, set the button's action to `Drillthrough`.
1. Select the target drillthrough page.
1. Configure the button's tooltip and formatting, if needed.
1. Use conditional formatting to show or hide the button depending on the filter context.
1. Add descriptive labels and tooltips to enhance accessibility.

## Enable cross-report drillthrough

To enable cross-report drillthrough, follow these steps:

1. Publish the source and target reports to the same workspace.
1. In the target report, enable **Cross-report drillthrough** in the report settings.
1. Use matching field names and data types in the source and target reports.
1. Create a drillthrough page in the target report and apply the appropriate drillthrough filter.
1. Refresh the source and target reports after publishing to ensure drillthrough is available.

## Troubleshooting

This section outlines common issues users might encounter when using drillthrough in Power BI and provides steps to resolve them.

### Drillthrough page doesn't appear in the context menu

If the drillthrough page doesn't appear when right-clicking a visual, follow these suggestions:

1. Verify that the drillthrough filter field is present in the **Drillthrough filters** well on the target page.
1. Make sure the field used in the source visual matches the field in the drillthrough filter.
1. Check that the field isn't aggregated (for example, summed or counted) in the source visual.
1. Use the **Performance analyzer** to identify potential issues with the query behavior.

### Drillthrough button isn't working

If a drillthrough button doesn't navigate to the target page, follow these suggestions:

1. Verify that the button’s **Action** is set to `Drillthrough`.
1. Verify that the **Drillthrough target** is correctly selected.
1. Make sure the report is published and the button isn't disabled due to missing filter context.

### Filters aren't applied correctly

If the drillthrough page opens but doesn't filter as expected, follow these suggestions:

1. Check that the field used for drillthrough isn't duplicated or transformed in Power Query.
1. Check for relationships between tables that can affect filter propagation.
1. Use the **Performance analyzer** to inspect query behavior and confirm filter application.

### Cross-report drillthrough fails

If cross-report drillthrough fails, follow these suggestions:

1. Ensure both reports are published to the same workspace.
1. Verify that the field names and data types match exactly between source and target reports.
1. Enable **Cross-report drillthrough** in the target report’s settings.
1. Refresh both reports after publishing.

### Data refresh gives an error

If drillthrough pages show outdated or missing data, follow these suggestions:

1. Refresh the dataset manually in Power BI Desktop.
1. Use the **Transform data** pane to find and fix errors in affected tables.
1. Remove duplicate values from join columns if the errors persist.
1. Republish the report and verify the refresh timestamp in the Power BI service.

> [!NOTE]
> For large datasets, like those used in pacing dashboards, refresh previews for all tables before publishing to avoid partial updates.

## Related content

- [Filters and highlighting](power-bi-reports-filters-and-highlighting.md)
- [Create buttons](desktop-buttons.md)
- [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
