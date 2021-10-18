---
title: Power BI embedded analytics performance best practices
description: This article provides guidance for Power BI embedded analytics best practices.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 12/12/2018
---

# Power BI embedded analytics performance best practices

This article provides recommendations for faster rendering of reports, dashboards, and tiles in your application.

> [!Note]
> Remember that loading time mainly depends on elements relevant to the report and data itself, including visuals, the size of the data, and the complexity of the queries and measures. For more information, see the [Power BI optimization guide](../../guidance/power-bi-optimization.md).

## Update tools and SDK packages

Keep tools and SDK packages up-to-date.

* Always use the latest version of [Power BI Desktop](https://powerbi.microsoft.com/desktop/).

* Install the latest version of the [Power BI client SDK](https://github.com/Microsoft/PowerBI-JavaScript). We continuously release additional enhancements, so make sure to follow up from time to time.

## Embed parameters

The `powerbi.embed(element, config)` method receives an element and a config. The config parameter includes fields that have performance implications.

### Embed URL

Avoid generating the embed URL yourself. Instead, make sure you get the Embed URL by calling [Get reports](/rest/api/power-bi/reports/getreportsingroup), [Get dashboards](/rest/api/power-bi/dashboards/getdashboardsingroup), or [Get tiles](/rest/api/power-bi/dashboards/gettilesingroup) API. We added a new parameter to the URL called **_config_**, which is used for performance improvements.

### Permissions

Provide **View** permissions if you're not intending to embed a report in edit mode. This way, embedded code doesn't initialize components, which are used in edit mode.

### Filters, bookmarks, and slicers

Usually, report visuals are saved with cached data. The cached data is used to give perceived performance. Reports render cached data while queries are executed. If filters, bookmarks, or slicers are provided, cached data isn't relevant and the visuals are rendered only after the visual query has ended.

If you embed reports with the same filters, bookmarks, and slicers, to improve your performance, save the report with the filters, bookmarks, and slicers already applied. This renders the report with the cached data which includes the filters, bookmarks, and slicers.

## Switching between reports

When embedding multiple reports to the same iframe, don't generate a new iframe for each report. Instead, use `powerbi.embed(element, config)` with a different config to embed the new report.

> [!NOTE]
> Switching between reports when embedding for your customers (also known as an 'app owns data' scenario), requires the use of an embed token with permissions to all reports and datasets. For more information, see the [generate token API](/rest/api/power-bi/embedtoken/generatetoken).

## Query caching

Organizations with Power BI Premium capacity or Power BI Embedded capacity can take advantage of query caching to speed up reports associated with a dataset.

[Learn more about query caching in Power BI](../../connect-data/power-bi-query-caching.md).

## Preload

Use `powerbi.preload()` to improve the end-user performance. The method `powerbi.preload()` downloads JavaScript, css files, and other artifacts, which are used later to embed a report.

Call `powerbi.preload()` if you're not embedding the report immediately. For example, if the embedded Power BI content doesn't appear in the home page, use `powerbi.preload()` to download and cache the artifacts that are used for embedding the content.

## Bootstrapping the iframe

> [!NOTE]
> [Power BI client SDK](https://github.com/Microsoft/PowerBI-JavaScript) version 2.9 is required to bootstrap the iframe.

`powerbi.bootstrap(element, config)` allows you to start embedding before all required parameters are available. The bootstrap API prepares and initializes the iframe.
When using the bootstrap API, it's still required to call `powerbi.embed(element, config)` on the same HTML element.

For example, one of the use cases for this feature, is to run the iframe bootstrap and the back-end calls for embedding, in parallel.
> [!TIP]
> Use the bootstrap API when it's possible to generate the iframe before it's visible to the end user.

[Learn more about iframe bootstrap](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Bootstrap-For-Better-Performance).

## Measure performance

### Performance events

To measure embedded performance, you may use two events:

1. Loaded event: The time until the report is initialized (the Power BI logo will disappear when the load is finished).
2. Rendered event: The time until the report is fully rendered, using the actual data. The rendered event is fired each time the report is re-rendered (for example, after applying filters). To measure a report, make sure you do the calculations on the first raised event.

Cached data is rendered when available but no additional event is generated.

[Learn more about event handling](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Handling-Events).

### Performance Analyzer

To examine the performance of the report elements, you might use the Performance Analyzer in Power BI Desktop.
The Performance Analyzer will allow you to see and record logs that measure how each of your report elements performs.

[Learn more about Performance Analyzer](../../create-reports/desktop-performance-analyzer.md).

> [!NOTE]
> Always remember to compare the embedded report performance to the performance on powerbi.com. This might help you understand the origin of your performance issues

## Next steps

* [Power BI optimization guide](../../guidance/power-bi-optimization.md)
* [How to troubleshoot Power BI embedded analytics issues](embedded-troubleshoot.md)
* [Power BI embedded analytics FAQ](embedded-faq.yml)
