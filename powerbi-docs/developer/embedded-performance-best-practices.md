---
title: Power BI Embedded performance best practices
description: This article provides guidance for embedded analytics best practices
author: KesemSharabi
ms.author: kesharab
manager: rkarlin
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 12/12/2018
---

# Power BI Embedded performance best practices

This article provides recommendations for faster rendering of reports, dashboards, and tiles in your application.
[!Note]
Remember that loading time mainly depends on elements relevant to the report and data itself. Such as number of visuals, size of data, and complexity of the queries and calculated measures. For more information, see [Power BI performance best practices](../power-bi-reports-performance.md).

## Update tools and SDK packages

Keep tools and SDK packages up-to-date.

* Always use the latest version of [Power BI Desktop](https://powerbi.microsoft.com/desktop/).

* Install the latest version of the [Power BI client SDK](https://github.com/Microsoft/PowerBI-JavaScript). We continuously release additional enhancements, so make sure to follow up from time to time.

## Embed parameters

`powerbi.embed(element, config)` method receives an element and a config. The config parameter includes fields that have performance implications.

### Embed URL

Avoid generating the embed URL yourself. Instead, make sure you get the Embed URL by calling [Get reports](/rest/api/power-bi/reports/getreportsingroup), [Get dashboards](/rest/api/power-bi/dashboards/getdashboardsingroup), or [Get tiles](/rest/api/power-bi/dashboards/gettilesingroup) API. We added a new parameter to the URL called **_config_**, which is used for performance improvements.

### Permissions

Provide **View** permissions if you're not intending to embed a report in **Edit mode**. This way embed code doesn't initialize components, which are used for Edit mode.

### Filters, bookmarks, and slicers

Usually, report visuals are saved with cached data. The cached data is used to give perceived performance. Reports render cached data while queries are executed. If filters, bookmarks, or slicers are provided, cached data isn't relevant and the visuals are rendered only after the visual query has ended.

If you embed reports with the same filters, bookmarks, and slicers, to improve your performance, save the report with the filters, bookmarks, and slicers already applied. This renders the report with the cached data which includes the filters, bookmarks, and slicers.

## Switching between reports

When embedding multiple reports to the same iframe, don't generate a new iframe for each report. Instead use `powerbi.embed(element, config)` with a different config to embed the new report.

> Note: Switching between reports for 'App owns data' scenario, might not be very effective, due to the necessity to generate a new embed token.

## Query caching

Organizations with Power BI Premium capacity or Power BI Embedded capacity, can take advantage of query caching to speed up reports associated with a dataset.

[Learn more about query caching in Power BI](../power-bi-query-caching.md)

## Preload

Use the **preload** JavaScript API to improve the end-user performance.
`powerbi.preload()` downloads javascript, css files, and other artifacts, which are used later to embed a report.

Call **preload** if you're not embedding the report immediately. For example, if you embed a report on a button click, it’s better to call **preload** when the previous page loads. Then, when the application user clicks the button, the rendering is faster.

> Note: It's not recommended to use preload if the report is about to be embedded, instead, you can use bootstrap to prepare the iframe for embedding.

## Bootstrapping the iframe

> Note: [Power BI client SDK](https://github.com/Microsoft/PowerBI-JavaScript) version 2.9 (beta) is required in order to bootstrap the iframe

`powerbi.bootstrap(element, config)` can be used to prepare the iframe for embedding. The main use case for this feature is to parallelize the iframe bootstrap and the backend calls that are used for embedding (for example, [Get reports](/rest/api/power-bi/reports/getreportsingroup) call)

[Learn more about iframe bootstrap](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Bootstrap---For-Better-Performance)

## Measure performance

### Performance events

To measure embedded performance, you may use two events:

1. Loaded event: the time until the report is initialized (PowerBI logo will disappear when the load is finished).
2. Rendered event: the time until the report is fully rendered, using the actual data. The rendered event is fired each time the report is re-rendered (for example, after applying filters). To measure a report, make sure you do the calculations on the first raised event.

Cached data is rendered when available, however no additional event is generated.

[Learn more about events handling](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Handling-Events)

### Performance Analyzer

To examine the performance of the report elements, you might use the Performance Analyzer in Power BI Desktop.
The Performance Analyzer will allow you to see and record logs that measure how each of your report elements performs.

[Learn more about Performance Analyzer](../desktop-performance-analyzer)

> Note: Always remember to compare the embedded report performance to the performance on powerbi.com. This might help you understand the origin of your performance issues

## Next steps

* [Power BI report performance best practices](../power-bi-reports-performance.md)
* [How to troubleshoot Power BI Embedded issues](embedded-troubleshoot.md)
* [Power BI Embedded FAQ](embedded-faq.md)