---
title: Streamline report authoring with optimize ribbon in Power BI Desktop
description: Optimize ribbon in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/16/2022
LocalizationGroup: Create reports
---
# Optimize ribbon in Power BI Desktop (Preview)

You can streamline your report authoring experience with the **Optimize** ribbon in Power BI Desktop in any reporting scenario. The **Optimize** ribbon has four tools that can be used for any reporting scenario; DirectQuery reporting scenarios will find them most useful, as visual queries are sent back to the data source with many visual changes.

The following sections describe the tools that the **Optimize** ribbon provides. 

## Reporting scenarios

In Power BI, you can choose from authoring reports based on small improvised data models, to big data models backed with billions and billions of rows of data, allowing you choose from different [table data storage modes](../transform-model/desktop-storage-mode.md). These options vary widely in how data is accessed and used, such as: 

* Downloading the data locally for tables in [import mode](../connect-data/desktop-directquery-about.md#import-connections)
* Only querying data when in visuals with tables in [DirectQuery mode](../connect-data/desktop-directquery-about.md#import-connections)
* Options between the two previous bullets, such as with [hybrid tables](https://powerbi.microsoft.com/blog/announcing-public-preview-of-hybrid-tables-in-power-bi-premium/) or datasets with some tables in import and others in DirectQuery

Additionally, you can create a report from an already published dataset or model from Power BI, Azure Analysis Services, or SQL Server Analysis Services using [Live Connection](../connect-data/desktop-directquery-about.md#import-connections) or [DirectQuery for Power BI datasets and Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md), where you may not know what storage mode the underlying tables are using.

When selecting from among such options, the table storage modes dictate whether you're in an import or DirectQuery reporting scenario, which can impact your report authoring experience. **DirectQuery report scenarios** are defined as those with any visual sending queries to the data source directly, which can be identified in the Performance analyzer as visuals with a **Direct query** line, as shown in the following image.

:::image type="content" source="media/desktop-optimize-ribbon/desktop-optimize-ribbon-01.png" alt-text="Screen capture of direct query in performance analyzer.":::


## Pause visuals

You can control when visuals send queries using the **Pause visuals** feature. When you change or create a visual by adding or removing columns to the visuals field well, a DAX query is sent to retrieve new data. You can see this DAX query in the **Performance analyzer**. If authoring a report seems slow when you're making changes to visuals because those queries are being run, you can stop the visual DAX queries using **Pause visuals** in the **Optimize** ribbon.

Selecting the **Pause visuals** button in the **Optimize** ribbon pauses the entire report. When a change to a visual would normally send a query to get new data, the visual instead enters the **visual pending state**.

In a **visual pending state,** the visual:

* Shows a banner with a **Refresh** button, allowing you to that visual only; the rest of the report remains paused.
* Shows the visual's earlier state, if available, or remains empty.
* Can [have columns or measures added, moved, or removed from the visual](../transform-model/desktop-field-list.md), allowing you to make bulk changes to the visual without having to wait for the visual to refresh, or run queries, with each change.
* Blocks [formatting actions](service-the-report-editor-take-a-tour.md#format-your-visuals), as the formatting options are based on the data in the visual. Before the visual enters a pending state you can perform any formatting option and many such options will still show immediately; but if a formatting action such as conditional formatting requires the visual to run a query, the visual enters the pending state.

When you're done making changes, you can do the following:

* Refresh an individual visual and keep the report paused with the **Refresh** button in the visual pending banner, in the selection pane, or in the visual context menu.
* Refresh all visuals on the page and keep the report paused with the **Refresh visuals** button in the Optimize ribbon, or page banner for Pause visuals.
* Refresh all visuals on the page and unpause the report by selecting the **Resume visual queries** button in the page banner for Pause visuals, or **Paused visuals** button in the **Optimize** ribbon.

:::image type="content" source="media/desktop-optimize-ribbon/desktop-optimize-ribbon-02.png" alt-text="Screen shot of optimize and pause visuals from ribbon.":::

There are a few things to consider when working with visuals in the pending state:

* The filter pane isn't affected by **Pause visuals**, so you can add a filter to the visual, see filter options, and filter it.
* [Automatic page refresh](../create-reports/desktop-automatic-page-refresh.md) is paused with **Pause visuals** but continues once visuals are resumed.
* Repeated actions, such as adding a field that was added before, may not trigger a visual pending state or take a visual out of the pending state. If there's a cache of data matching the visual configuration available, Power BI Desktop use that data instead of sending a query.
* Tooltips are disabled in a visual pending state.
* The page banner for Pause visuals can be dismissed, but the report remains paused until you select **Paused visuals** in the **Optimize** ribbon.
* The lower left status bar in Power BI Desktop indicates whether **visuals queries are paused**.
* Saving and closing a Power BI Desktop file with the report paused enables you to open the file later with the report still paused.



## Refresh visuals

You can also trigger a **Visuals refresh** to manually refresh all visuals on the page, which is the same behavior as [the refresh visuals on the Performance analyzer pane](../create-reports/desktop-performance-analyzer.md#refreshing-visuals). You can learn more about [Power BI refresh types](../connect-data/refresh-data.md#power-bi-refresh-types).

## Optimization presets

**Optimization presets** let you quickly choose and apply predefined combinations of settings tailored to your reporting scenario. Power BI Desktop favors **Interactivity** by default, but reports using DirectQuery especially benefit from less interactivity with **Query reduction**. The predefined combination of settings for **Query reduction** follows the recommended best practices outlined in the [report design guidance page for using DirectQuery](../connect-data/desktop-directquery-about.md#report-design-guidance).

There are a few things to consider when using options and settings:

* **Query reduction:** Turns off cross-highlighting and cross-filtering and adds an **Apply** button to slicers. Usually best for DirectQuery connections.
* **Interactivity:** Allows cross-highlighting, cross-filtering, and real-time changes to slicers and filters. Usually best for import mode, and is the default setting for Power BI Desktop.
- **Customize** : Opens the Query reduction section of the **Options** dialog so you can choose which query reduction features you want to use.

The following image shows the **Optimization presets** menu items on the ribbon.

:::image type="content" source="media/desktop-optimize-ribbon/desktop-optimize-ribbon-03.png" alt-text="Screen shot of optimization presets menu items on the ribbon.":::


## Next steps
You might also be interested in learning about **Performance analyzer**:
* [Use Performance Analyzer to examine report element performance](desktop-performance-analyzer.md)

There are all sorts of things you can do with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query Overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data Types in Power BI Desktop](../connect-data/desktop-data-types.md)
* [Shape and Combine Data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Common Query Tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
