---
title: Power BI Embedded performance best practices
description: This article provides guidance for embedded analytics best practices
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-embedded
ms.topic: conceptual
ms.date: 12/10/2018
LocalizationGroup: Reports
---

#  Power BI Embedded performance best practices

In this article, you can find recommendations to get faster rendering for reports, dashboards, and tiles in your application.

## Embed parameters

Powerbi.embed() method receives few parameters to embed a report, a dashboard to a tile. These parameters have performance implications.

## Embed URL

Avoid generating the embed URL yourself. Instead, make sure you get the Embed URL by calling the [Get reports](https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Frest%2Fapi%2Fpower-bi%2Freports%2Fgetreportsingroup&data=02%7C01%7CMark.Ghanayem%40microsoft.com%7C07ca68ceb37a48e3f3de08d64968707a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636777110256168308&sdata=22lkqRM2w1MQfrM8dooedaPqqIU8PufTq9TT4VDzRo0%3D&reserved=0), the [Get dashboards](https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Frest%2Fapi%2Fpower-bi%2Fdashboards%2Fgetdashboardsingroup&data=02%7C01%7CMark.Ghanayem%40microsoft.com%7C07ca68ceb37a48e3f3de08d64968707a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636777110256168308&sdata=nfWRgbSoXVF42Rg%2Ba9491u19uksXp%2FAyz%2Fa%2Ba7%2FCtdA%3D&reserved=0), or the [Get tiles](https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Frest%2Fapi%2Fpower-bi%2Fdashboards%2Fgettilesingroup&data=02%7C01%7CMark.Ghanayem%40microsoft.com%7C07ca68ceb37a48e3f3de08d64968707a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636777110256178318&sdata=LgZ27TynNpqQJDrb3aHWGQXIS%2FzichAO9De5M2uhF1Q%3D&reserved=0) API. We added a new parameter to the URL called **_config_**, used for performance improvements.

## Permissions

Provide **View** permissions if you're not intending to embed a report in **Edit mode**. This way embed code doesn't initialize components, which are used for Edit mode.

## Filters, bookmarks, and slicers

Usually, reports visuals are saved with cached data. These cached data is used to give preserved performance. Reports render cached data while queries are executed. If filters, bookmarks or slicers are provided, cached data isn't relevant. Then, the visuals are rendered only after running the visual query.

> [!Recommendation]
> If you always embed a report with the same filters, it’s better to save the report with the filters applied. That way you can avoid passing a list of filters in load configuration.

## Update tools and SDKs

To enjoy the recent enhancements, Keep Tools and SDKs up-to-date.

* It’s better to use the latest version of Power BI Desktop.

* install the latest powerbi-client SDK version. We continue to release more enhancement, so make sure to follow up from time to time.

* Packages to install:
    * Npm package: powerbi-client
    * NuGet package: Microsoft.PowerBI.JavaScript

## Preloading

You may Use ‘Preload’ JavaScript API to improve the end-user perceived performance.
Powerbi.preload() downloads javascript, css files, and other artifacts, which is used later to embed a report.

* There's no point of calling powerbi.preload() and then immediately calling powerbi.embed().
* Call preload if you're not embedding the report immediately.
    * Example: if you embed a report on a button click, it’s better to call preload when the page loads. Then, when the application user clicks the button, the rendering is faster.

## Measuring performance

To measure performance, you can use the two events we provide:

1. Loaded: time until report is initialized (user sees no spinny).
2. Rendered: time until fully report is rendered using actual data. The rendered event is fired each time the report is re-rendered (that is, after applying filters). To measure a report first, make sure you do the calculations in the first raised event.

Cached data is rendered when available, but we don’t have an event for this data yet.

> [!Important]
> Remember that loading time mainly depends on elements relevant to the report and data itself, such as number of visuals, size of data and complexity of the queries and calculated measures. Please follow best practices document to improve the report’s loading time.

## Next Steps

* [How to troubleshoot Power BI Embedded issues](embedded-troubleshoot.md)
* [Power BI Embedded FAQ](embedded-faq.md)
