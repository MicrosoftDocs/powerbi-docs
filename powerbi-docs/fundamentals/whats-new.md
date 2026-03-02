---
title: See What's New in the February 2026 Power BI Update
description: "Discover the February 2026 Power BI update: expanded Copilot prompt limits, Input slicer generally available, new DAX functions, and more. Learn what's new and get started today."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: concept-article
ms.date: 2/24/2026
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI: February 2026 update (version 2.151.1052.0)

Power BI's February 2026 update is here, bringing smarter Copilot and AI experiences, more flexible ways to interact with reports, polished visuals, and useful modeling enhancements—plus a few important updates to keep in mind. With FabCon right around the corner, it's the perfect time to explore what's new and get excited about what's next.

For a quick summary of the February features, read on. For a detailed look at these updates and more enhancements, go to the [Power BI February 2026 Feature Summary blog post](https://powerbi.microsoft.com/blog/power-bi-february-2026-feature-summary/). You can also watch the [February demos](https://youtu.be/O21vXCpYdCc).

> **Download** the [February 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## Events and announcements

- **Data Viz World Championships finalists**: Meet the four finalists heading to the finals at FabCon, where they battle it out for the title of 2026 Power BI DataViz World Champion. [Learn more](https://developer.microsoft.com/reactor/events/26851/) about how to register for the session and view entries.
- **FabCon Americas 2026**: Less than one month away! Join us for the ultimate Power BI, Microsoft Fabric, SQL, Real-Time Intelligence, AI, and Databases community-led event from March 16–20, 2026, in Atlanta, GA. [Register](https://aka.ms/fabcon) with code FABCOMM to save $200.

## General

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Deprecation of Hierarchies in Power BI scorecards | Starting April 15, 2026, the Hierarchies feature in Power BI Scorecards will be removed. The Heatmap view, which was tied to hierarchies, will also be discontinued. Scorecards themselves continue to work as usual. For more information, see [Create scorecards and manual goals](../create-reports/service-goals-create.md). |        |
| Deprecation of SSRS, PBIRS and SSAS Management Packs in SCOM | Microsoft has announced the deprecation of the System Center Operations Manager (SCOM) Management Packs for SQL Server Reporting Services (SSRS), Power BI Report Server (PBIRS), and SQL Server Analysis Services (SSAS). These management packs will no longer be supported after January 2027. |        |
| Deprecation of legacy Import Excel & CSV experience in Power BI Service | Entry points to the legacy experience will be removed on May 31, 2026, and semantic models created using the legacy experience will stop refreshing on July 31, 2026. For guidance, see [Get data from Excel workbook files](../connect-data/service-excel-workbook-files.md). |        |
| Deprecation of the Simba Vertica ODBC driver | The Simba Vertica ODBC Driver begins its deprecation process in February 2026. Customers should transition to the Vertica ODBC driver. For more details, see [Power Query Vertica database connector](/power-query/connectors/vertica-database#use-vertica-odbc-driver). |        |

## Copilot and AI

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Expanded prompt input character limit | Based on customer feedback, the character limit for Copilot input increased from 500 characters to 10K in all Copilot surfaces, including Standalone, Report pane, Apps, Mobile, and Embed. For more information, see [Use Copilot with Power BI reports and semantic models](../create-reports/copilot-reports-overview.md). |          |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Filter or enter data in reports with Input slicer (Generally Available) | The Text Slicer is now renamed to Input Slicer and is **generally available**. This interactive visual lets you filter data using free-form text input with flexible options like exact match, contains, or starts with. For more information, see [Create and use an input slicer](../visuals/power-bi-visualization-text-slicer.md). |        |
| Paste selections into any report slicer | The paste context menu feature on the slicer visual lets you apply multiple selections by pasting a list of values directly into your slicer. For more information, see [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md?tabs=powerbi-desktop#paste-values-in-slicers). |        |
| Card visual updates | The new Card visual default increased from 5 to 10 callouts. Selecting a category name now filters other visuals on the page. For more information, see [Create a card visual in Power BI](../visuals/power-bi-visualization-card.md?tabs=powerbi-desktop). |        |
| Fonts compatible with non-Windows devices for Power BI reports | Default fonts such as Segoe UI in Power BI reports when viewed on a non-Windows device now show as expected. For more information, see [Supported Browsers for Power BI and Fabric](power-bi-browsers.md). |        |
| Preview visuals update | Preview visuals now display "(Preview)" after their name and will soon appear below the divider line with custom and other unpinned visuals. For more information, see [Report visualizations](../visuals/power-bi-report-visualizations.md). |        |
| Conditional formatting dialog updates | Enhanced conditional formatting dialog with a wider dropdown menu and helpful tooltips that display field names for easier selection. For more information, see [Apply Conditional Table Formatting](../create-reports/desktop-conditional-table-formatting.md). |        |
| Improved error dialogs in Power BI Desktop | Additional error details for visuals in Power BI reports are now available in Power BI Desktop. For more information, see [Troubleshoot Visualizations in Power BI](../visuals/power-bi-visualization-troubleshoot.md). |        |
| Azure Maps visual updates | Enhanced performance for Azure Maps visual with pie charts and new endpoint regions for Korea and Brazil. For more information, see [Get started with Azure Maps Power BI visual](/azure/azure-maps/power-bi-visual-get-started). |        |
| Fewer steps to insight in Power BI apps | A more conversational Copilot experience in Power BI apps—just ask your question and Copilot does the work by finding the right reports or data. Copilot can also summarize what reporting is available in an app. For more information, see [Copilot for Power BI apps](../create-reports/copilot-apps-overview.md). |        |
| Org Apps now feature Persistent Report Filters and Reset Functionality | Org apps (Preview) have been updated to retain Power BI report filters, slicers, and other data view changes. The persistent filters setting is enabled by default for all reports. For more information, see [Org apps](../consumer/org-app-items/org-app-items.md). | ✔️ |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| TABLEOF and NAMEOF DAX functions | New TABLEOF function returns a reference to the table associated with a given column, measure, or calendar. NAMEOF returns the name of a table, column, measure, or calendar as a text string. These functions help write DAX that's safer and easier to maintain. For more information, see [TABLEOF](/dax/tableof-function-dax) and [NAMEOF](/dax/nameof-function-dax). |        |

## Visualizations

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Drill Down Pie PRO (Filter) by ZoomCharts | Pie PRO (Filter) enhances pie and donut charts with advanced labeling, category level reference markers, one-click drill down, and images on slices. [Get it on AppSource](https://appsource.microsoft.com/product/WA200001678). |          |
| Rich titles in Zebra BI Charts | Rich titles let you structure context across multiple lines for clearer hierarchy and faster comprehension. [Learn more](https://bit.ly/3LEKmLc). |          |
| Rose Donut Pie Chart by Powerviz | Build four types of charts—rose, rose donut, donut, and pie—with 30+ color palettes, smart labels, conditional formatting, and more. [Get it on AppSource](https://appsource.microsoft.com/product/power-bi-visuals/truvizinc1674781244292.rose-donut-pie-chart-by-powerviz). |          |

## Other

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Fabric Copilot capacity tenant setting default update | Beginning on or after February 8, 2026, the tenant setting **Capacities can be designated as Fabric Copilot capacities** will be enabled by default for all tenants. This only updates the tenant setting—it won't modify existing capacity configurations. For more information, see [Fabric Copilot capacity](../admin/service-admin-portal-copilot.md). |          |

## Resources

Want to learn about Power BI through videos and other engaging content? Check out these video sources and content:

- See [all Power BI playlists on YouTube](https://www.youtube.com/@MicrosoftPowerBI/playlists).
- [Power BI YouTube channel](https://www.youtube.com/user/mspowerbi): Official Microsoft Power BI channel.
- Follow Power BI on X [@MSPowerBI](https://twitter.com/mspowerbi).
- Go to the [Power BI forums in the Microsoft Fabric Community](https://community.fabric.microsoft.com/t5/Power-BI-forums/ct-p/powerbi).

> [!NOTE]
> Some resources use earlier versions of Power BI Desktop or the Power BI service.

If your organization needs an earlier version, download it. Use the most recent version of Power BI Desktop when possible. Earlier versions have these limitations:

- Previous releases of Power BI Desktop aren't serviced. Use the most recent release for the latest features and updates.
- Previous versions can't open files created or saved in newer releases of Power BI Desktop.
- If you load a report from a newer release, get a warning, and then save it in a previous version, you lose information related to new features.
- Only English versions of Power BI Desktop are archived.

> **Download** the [February 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
