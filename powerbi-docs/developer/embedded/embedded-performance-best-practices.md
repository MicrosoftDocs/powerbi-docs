---
title: Best practices for faster performance in Power BI embedded analytics 
description: This article provides recommendations for Power BI embedded analytics best practices for fast rendering.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: noam, or, may
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 05/06/2024
---

# Best practices for faster performance in Power BI embedded analytics

This article provides recommendations for faster rendering of reports, dashboards, and tiles in your application.

> [!NOTE]
> Remember that loading time mainly depends on elements relevant to the report and data itself, including visuals, the size of the data, and the complexity of the queries and measures. For more information, see the [Power BI optimization guide](../../guidance/power-bi-optimization.md).

## Update tools and SDK packages

Keep tools and SDK packages up-to-date.

* Use the latest version of [Power BI Desktop](https://powerbi.microsoft.com/desktop/).
* Install the latest version of the [Power BI client SDK](https://github.com/Microsoft/PowerBI-JavaScript). We continuously release new enhancements, so make sure to follow up from time to time.
* Use the latest version of [Tabular Editor](https://github.com/otykier/TabularEditor/releases/latest).

## Initialize embedding

### Preload

Use `powerbi.preload()` to improve the end-user performance. The method `powerbi.preload()` downloads JavaScript, css files, and other [items](./pbi-glossary.md#item), which are used later to embed a report.

Call `powerbi.preload()` if you're not embedding the report immediately. For example, if the embedded Power BI content doesn't appear in the home page, use `powerbi.preload()` to download and cache the items that are used for embedding the content.

### Bootstrapping the iFrame

> [!NOTE]
> [Power BI client SDK](https://github.com/Microsoft/PowerBI-JavaScript) version 2.9 is required to bootstrap the iFrame.

`powerbi.bootstrap(element, config)` allows you to start embedding before all required parameters are available. The bootstrap API prepares and initializes the iFrame.
When using the bootstrap API, it's still required to call `powerbi.embed(element, config)` on the same HTML element.

For example, one of the use cases for this feature, is to run the iFrame bootstrap and the back-end calls for embedding, in parallel.
> [!TIP]
> Use the [bootstrap API](/javascript/api/overview/powerbi/bootstrap-better-performance) when possible to generate the iFrame before it's visible to the end user.

​When embedding a report or other Power BI items, make sure that the embed container is part of the DOM and that the display CSS attribute is not set to *none* as this can cause unexpected behaviors. If you want to hide the embed container, consider using the visibility CSS attribute.

## Embed parameters

The `powerbi.embed(element, config)` method receives an element and a config parameter. The config parameter includes fields that have performance implications.

### Embed URL

Avoid generating the embed URL yourself. Instead, make sure you get the Embed URL by calling [Get reports](/rest/api/power-bi/reports/getreportsingroup), [Get dashboards](/rest/api/power-bi/dashboards/getdashboardsingroup), or [Get tiles](/rest/api/power-bi/dashboards/gettilesingroup) API. The ***config*** parameter in the URL is used for performance improvements.

### Permissions

Provide **View** permissions if you don't intend to embed a report in edit mode. This way, time isn't spent initializing components that are only used in edit mode.

### Filters, bookmarks, and slicers

Usually, report visuals are saved with cached data. Reports render the cached data while queries are executed. If filters, bookmarks, or slicers are provided, cached data isn't used and the visuals are rendered only after the visual query has ended.

If you embed reports with the same filters, bookmarks, and slicers, save the report with the filters, bookmarks, and slicers already applied. When you save the report this way, it renders using the cached data that includes the filters, bookmarks, and slicers, which improves performance.

## Switching between reports

When embedding multiple reports to the same space, don't generate a new [iFrame](pbi-glossary.md#inline-frame-iframe) for each report. Instead, embed the new report in the same iFrame to overwrite the previous report. Use `powerbi.embed(element, config)` with a different config to embed the new report.

> [!NOTE]
> Embedding reports using embed for your customers (also known as an 'app owns data' scenario), requires the use of an embed token with permissions to all reports and semantic models. For more information, see the [generate token API](/rest/api/power-bi/embed-token/generate-token).

## Multiple visuals

When embedding several visuals from the same report, don't generate a new [iFrame](pbi-glossary.md#inline-frame-iframe) for each visual. Use a single iFrame to [render the report](/javascript/api/overview/powerbi/embed-report) with the [specified visuals](/javascript/api/overview/powerbi/embed-visual).

When embedding multiple visuals into a single iFrame, consider the following points:

* Power BI uses iFrames to embed a report. Sometimes you might want to add more content between the visuals (for example, text or graphics that don't come from the report). In that case, you might need a different iFrame to render different visuals. For best performance, try and arrange the visuals so that you use the fewest iFrames possible. To reduce the number of iFrames, consider using the [custom-layout feature](/javascript/api/overview/powerbi/custom-layout).

* If you have visuals from different reports or different semantic models, consider joining the semantic models and creating a new report so that you can include all the visuals in the same iFrame.

* Another alternative, if you have noncontiguous regions, or data from multiple semantic models, is to create a [dashboard](/power-bi/create-reports/service-dashboard-tiles) and pin the visuals to it. This allows you to:

  * Embed the individual [tiles](/javascript/api/overview/powerbi/embed-dashboard-tile) into noncontiguous iFrames. Dashboard tiles are lighter than reports and load faster.
  * Embed the entire dashboard into one iFrame. This allows you to have visuals from different reports or semantic models in one iFrame without creating a new report.

  Keep in mind, however, that dashboard tiles aren't interactive and don't [refresh](/power-bi/connect-data/refresh-data) with the same frequency as visuals.

## Query caching

Organizations with Power BI Premium capacity or Power BI Embedded capacity can take advantage of query caching to speed up reports associated with a semantic model.

[Learn more about query caching in Power BI](../../connect-data/power-bi-query-caching.md).

## Measure performance

### Performance events

To measure embedded performance, you can use two events:

1. Loaded event: The time until the report is initialized (the Power BI logo disappears when the load is finished).
2. Rendered event: The time until the report is fully rendered, using the actual data. The rendered event is fired each time the report is re-rendered (for example, after applying filters). To measure a report, make sure you do the calculations on the first raised event.

Cached data is rendered when available but no other event is generated.

[Learn more about event handling](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Handling-Events).

### Performance Analyzer

To examine the performance of the report elements, you might use the Performance Analyzer in Power BI Desktop.
The Performance Analyzer allows you to see and record logs that measure how each of your report elements performs.

[Learn more about Performance Analyzer](../../create-reports/desktop-performance-analyzer.md).

> [!NOTE]
> Always remember to compare the embedded report performance to the performance on powerbi.com. This might help you understand the origin of your performance issues

## Related content

* [Power BI optimization guide](../../guidance/power-bi-optimization.md)
* [How to troubleshoot Power BI embedded analytics issues](embedded-troubleshoot.md)
* [Power BI embedded analytics FAQ](embedded-faq.yml)
