---
title: See What's New in the March 2026 Power BI Update
description: "Discover the March 2026 Power BI update: translytical task flows now generally available, modern visual defaults preview, Direct Lake in OneLake GA, custom totals, and more. Learn what's new and get started today."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: concept-article
ms.date: 3/17/2026
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI: March 2026 update

Power BI's March 2026 update delivers powerful enhancements across reporting, AI, modeling, and visuals. Translytical task flows move to general availability, enabling end users to take action directly from reports. Modern visual defaults (preview) bring a fresh Fluent 2 design to your reports. Direct Lake in OneLake reaches general availability, unlocking incredible performance directly against OneLake. Plus, custom totals, series label leader lines, updated Copilot experiences, and expanded DAX capabilities make this a feature-packed release.

For a quick summary of the March features, read on. For a detailed look at these updates and more enhancements, see the [Power BI March 2026 Feature Summary](https://powerbi.microsoft.com/blog/power-bi-march-2026-feature-summary/). You can also watch the March demos.

> **Download** the [March 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## General

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Upcoming deprecation of old file picker experience in Power BI Desktop | Deprecation is planned for the old file picker experience in Power BI Desktop in April. The updated file picker, announced last January, provides a more intuitive way of navigating between files and folders and becomes the default experience. No action is required from users. |        |

## Copilot and AI

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Copilot pane user experience update | The Copilot pane in Reports and Apps has an updated user experience that matches the look and feel of the standalone Copilot experience. Button suggestions disappear after starting your conversation (accessible via prompt guide or clear chat). The input box remains enabled while processing requests, so you can type your next prompt. The copy action is moved to the bottom of responses next to feedback buttons. For more information, see [Summarize a report with Copilot](../explore-reports/copilot-pane-summarize-content.md). |          |
| Copilot feedback update | Across all Power BI Copilot experiences, an updated feedback dialog now allows you to add diagnostics with your submission. Sharing diagnostics with thumbs up or down feedback provides conversational context and is helpful during support investigations. You can preview the diagnostics file before submission to ensure you aren't sending sensitive information. For more information, see [Summarize a report with Copilot](../explore-reports/copilot-pane-summarize-content.md#provide-feedback-with-diagnostics). |          |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Translytical task flows (Generally Available) | **Now generally available**. Translytical task flows let end users take action directly from Power BI reports—updating records, adding data, or triggering workflows in other systems—without leaving the report. Translytical task flows use Fabric user data functions to connect reports to underlying data sources. Common scenarios include editing data records in place, adding annotations, deleting outdated entries, and calling external APIs like Azure OpenAI. Data write-back supports Fabric SQL databases, Fabric warehouses, and Fabric lakehouses (for files). For more information, see [Understand translytical task flows](../create-reports/translytical-task-flow-overview.md) and [Tutorial: Create a translytical task flow](../create-reports/translytical-task-flow-tutorial.md). |        |
| Modern visual defaults and customizing theme improvements (Preview) | Power BI Desktop visuals now start with a modern look. This preview introduces an updated base theme aligned with Fluent 2, featuring subtitles, uniform padding, style presets, and a gray canvas background at 1080x1920px by default. Charts display with smooth lines, slicers default to dropdown mode, and buttons have a refreshed appearance—all without manual formatting. Enable the preview in Options > Preview features by turning on **modern visual defaults** and **customizing theme improvements**. Published reports retain the new base theme for editing in the browser. The theme schema also supports setting page size and defining reusable named colors. For more information, see [Use report themes in Power BI Desktop](../create-reports/desktop-report-themes.md). | ✔️ |
| Custom totals (Preview) | Table and matrix visuals now support custom totals, giving you more control over what the total row displays for a specific column. By default, the total row shows the result of evaluating the measure across the entire filter context. With custom totals, you can easily change the total row value to the sum, min, max, count (distinct), or count of the displayed rows. Right-click a numerical column or use the Build pane to choose **Customize total calculation**. Custom totals are based on visual calculations. For more information, see [Visual calculations overview](../transform-model/desktop-visual-calculations-overview.md) and [Tables in Power BI](../visuals/power-bi-visualization-tables.md). | ✔️ |
| Series label leader lines for line charts | Leader lines for series labels are now available on line charts and related visuals, making it easier to understand which line belongs to which label – especially in dense or overlapping scenarios. When enabled, leader lines visually connect each series label to its corresponding data point. The feature includes smart layout logic to avoid label collisions, along with formatting options for line style, width, and transparency. Leader lines turn on automatically when series labels are enabled for new reports. Series labels are also selectable, which highlights a line and displays markers. You can select more than one by holding down the CTRL key. For more information, see [Line charts in Power BI](../visuals/power-bi-line-chart.md). |        |
| Report Theme Updates | This month introduces two enhancements to custom report themes. You can now define a default page size directly in your theme file. When you add a page section to your theme JSON, any new pages added to your report automatically use those dimensions. You can also now reference structural theme colors such as background and foreground in your theme JSON. For more information, see [Create custom report themes in Power BI Desktop](../create-reports/report-themes-create-custom.md). |        |
| Input slicer now supports conditional formatting | The input slicer now supports conditional formatting (Fx) across multiple visual elements in the formatting pane. You can apply dynamic formatting rules to text colors, icon colors, borders, and accent bars based on measures or field values in your data. Elements that support conditional formatting include Filters (text color, dismiss button color), Filter operator (text and icon color), Apply button (icon color), and Input box (placeholder text color and accent bar color), as well as background and border colors for each. For more information, see [Create and use an input slicer](../visuals/power-bi-visualization-input-slicer.md). |        |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Direct Lake in OneLake (Generally Available) | **Now generally available**. Power BI is standardizing on open-data formats by adopting Delta Lake and Parquet. Direct Lake storage mode accelerates time to data-driven decisions by unlocking incredible performance directly against OneLake, without the need to manage costly, time-consuming data refreshes for large volumes of data. Direct Lake in OneLake works from Power BI Desktop, providing compatibility with OneLake security, more modeling features, and faster query performance. When creating a new Direct Lake semantic model from the SQL analytics endpoint page, you can select either Direct Lake on OneLake or Direct Lake on SQL. For more information, see [OneLake security overview](/fabric/onelake/security/get-started-security), [OneLake security for SQL analytics endpoint](/fabric/onelake/security/sql-analytics-endpoint-onelake-security), and [Direct Lake overview](/fabric/fundamentals/direct-lake-overview). |        |
| TMDL View in web modeling (Preview) | TMDL View on the Web introduces a code-first semantic modeling experience directly in the browser. Developers can script, modify, and apply changes to model objects directly in a code editor using Tabular Model Definition Language (TMDL) without switching to Desktop or downloading model files. This experience provides immediate code-level visibility into all semantic model metadata (tables, measures, relationships, and more), enabling bulk edits, automation of repetitive tasks, and reuse of definitions. For more information, see [Tabular Model Definition Language (TMDL) overview](/analysis-services/tmdl/tmdl-overview) and [Work with TMDL view in Power BI Desktop](../transform-model/desktop-tmdl-view.md). | ✔️ |
| DAX user-defined functions (Preview) | This month's ongoing preview of DAX user-defined functions includes several updates: A new INFO.USERDEFINEDFUNCTIONS() function returns information about user-defined functions in your model. Power BI now keeps DAX code in sync when you rename tables, columns, or measures, with automatic dependency tracking for user-defined functions. New type hints (CalendarRef, ColumnRef, MeasureRef, TableRef) provide more expressive power beyond the existing AnyVal, Scalar, Table, and AnyRef. "Quick queries" for Functions in DAX Query View now supports "Define with references and evaluate." Formula bar is available for creating or modifying UDF expressions in Model Explorer. Syntax highlighting support for UDFs in TMDL View. Support for JSDoc block tags to author UDF description and parameters using the triple slash prefix (///). Support for up to 256 UDF parameters (increased from 12). For more information, see [INFO.USERDEFINEDFUNCTIONS function](/dax/info-userdefinedfunctions-function-dax) and [DAX user-defined functions best practices](/dax/best-practices/dax-user-defined-functions). | ✔️ |

## Data connectivity

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| IBM Netezza ODBC Driver (Generally Available) | **Now generally available**. The IBM Netezza ODBC driver provides a more reliable, supported path forward as Microsoft transitions away from the embedded Simba driver. This update ensures continued connectivity, long-term support, and a more future-ready experience for organizations using the Netezza connector. Customers don't need to install a new connector; you can reuse your existing connector but need to install the new IBM Netezza ODBC driver. For more information, see [IBM Netezza database connector](/power-query/connectors/ibm-netezza-database). |        |
| QuickBooks Online Connector Retirement | The QuickBooks Online connector is retiring and won't be supported after March 2026. After retirement, customers can't create new connections, and existing connections might stop working. |        |

## Visualizations

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| AI Narrative auto refresh | Instead of clicking **Refresh** every time you select a slicer in a report with the AI Narrative visual, use the **Auto refresh** toggle in the visualizations pane. This toggle enables the summary to update automatically whenever a slicer selection changes, creating a smoother and more efficient reporting experience. For more information, see [Create smart narrative summaries](../visuals/power-bi-visualization-smart-narrative.md). |          |

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

> **Download** the [March 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
