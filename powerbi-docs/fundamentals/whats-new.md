---
title: See What's New in the April 2026 Power BI Update
description: "Discover the April 2026 Power BI update: expanded Copilot in Power BI Mobile, modern visual defaults improvements, Direct Lake calculated columns preview, fixed size layout for card visuals, and more. Learn what's new and get started today."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: concept-article
ms.date: 4/13/2026
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI: April 2026 update

The April 2026 Power BI update adds conversational chat to in-report Copilot in Power BI Mobile, adds a base theme switcher to the Customize current theme dialog, and introduces Direct Lake calculated columns and user-context-aware calculated columns in preview. Reporting updates include fixed size layout for card, button slicer, and list slicer visuals, auto-fit markers for scatter charts, axis padding controls for bar and column charts, and preview visual labeling in the Visualizations pane.

For a quick summary of the April features, read on. For a detailed look at these updates and more enhancements, see the [Power BI April 2026 Feature Summary](https://powerbi.microsoft.com/blog/power-bi-april-2026-feature-summary/). You can also [watch the April demos](https://youtu.be/TBD).

> **Download** the [April 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## Events and announcements

- **FabCon SQLCon live recap series**: Starting April 14, watch session recaps covering FabCon keynotes and corenotes. Register to stay up to date on Fabric community news.
- **Power BI DataViz World Championship**: Register your interest to be notified when the next competition opens.

## General

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Deprecation of old file picker experience in Power BI Desktop | Starting in April as part of the SU04 release, the old file picker experience in Power BI Desktop is no longer available. The updated file picker, announced last January, is now the default experience. Users can no longer toggle between the old and updated experience. No action is required from users. |        |
| Deprecation of built-in Netezza ODBC driver | The previously built-in IBM Netezza ODBC driver is being deprecated. The IBM Netezza ODBC driver is generally available. Reuse your existing connector but install the new ODBC driver. For more information, see [IBM Netezza database connector](/power-query/connectors/ibm-netezza-database). |        |

## Copilot and AI

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Copilot in Power BI mobile: expanded features | In-report Copilot in Power BI Mobile apps now supports conversational chat grounded in the report you're viewing. Ask questions, get AI-generated visualizations, and follow up with additional questions. Every answer includes citations to the source visuals. On iPhone and iPad, voice dictation is available for hands-free input. For more information, see [In-report Copilot in Power BI Mobile apps](../explore-reports/mobile/mobile-apps-copilot.md). |          |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Modern visual defaults and customize theme improvements (Preview) | The Customize current theme dialog now includes a base theme switcher (**View** ribbon > **Themes**). Use it to revert to the previous base theme if your custom theme doesn't yet work with modern defaults, or to update an older report to the latest base theme. This update also adds common page sizes for each aspect ratio type in the **Canvas settings** > **Size** drop-down. Table and matrix built-in styles are fixed, with banded rows now enabled by default, default +/- buttons for matrix visuals, and correct axis colors for the Innovate and Orchid custom themes. Built-in theme tiles have an updated look and the **Reset to default** tile is now visually distinct. To update an existing report, open the Customize current theme dialog and select **Update theme**, or choose the **Reset to default** tile in the **Theme** drop-down. For more information, see [Use report themes in Power BI Desktop](../create-reports/desktop-report-themes.md). | ✔️ |
| Fixed size layout for card, button slicer, and list slicer visuals | Card, button slicer, and list slicer visuals now support a **Fixed size** option in the Layout section of the Format pane. Define exact pixel dimensions for each item instead of specifying a count. When the container isn't large enough to display all items, scroll bars appear. **Autogrid** is renamed to **Fit to space**. For list slicers with hierarchies, fixed size maintains consistent item spacing when expanding and collapsing levels. For more information, see [Create a card visual in Power BI](../visuals/power-bi-visualization-card.md), [Use button slicers](../visuals/power-bi-visualization-button-slicer.md), and [Use list slicers](../visuals/power-bi-visualization-list-slicer.md). |          |
| Card visual: category interactivity and formatting updates | Selecting a category header on the card visual now highlights the selected card and dims others. When multiple data columns are added to the category field, values concatenate in the category header. Use **Edit interactions** to control which visuals the card filters. Top-level images now display correctly when the image data is base64 encoded. For more information, see [Create a card visual in Power BI](../visuals/power-bi-visualization-card.md). |          |
| Scatter charts: Auto-fit markers | Scatter charts now include an **Auto-fit markers** option that automatically adjusts the plot area so markers and bubbles near the edges remain fully visible. You no longer need to manually adjust min/max axis ranges to prevent clipping. For more information, see [Visualizations overview in Power BI](../visuals/power-bi-visualizations-overview.md). |          |
| Axis improvements for bar and column charts | A new **Rounded range** option lets you remove extra axis padding so the value axis starts flush with your data. Adding data labels no longer shifts the axis range. For more information, see [Visualizations overview in Power BI](../visuals/power-bi-visualizations-overview.md). |          |
| Azure Maps visual: map style picker sync | Map style selections made in the in-visual style picker now persist to the Format pane. For more information, see [Get started with Azure Maps Power BI visual](/azure/azure-maps/power-bi-visual-get-started). |          |
| Preview visuals identified in Visualizations pane | Preview visuals now display **(preview)** after their names in the Visualizations pane and appear below the divider alongside custom and unpinned visuals, clearly separating them from generally available visuals. For more information, see [Visualizations overview in Power BI](../visuals/power-bi-visualizations-overview.md). |          |
| Narrative visual default type update | The Narrative visual now opens in Copilot mode by default for users with a Copilot license. The character limit has also increased to 10,000. For more information, see [Create smart narrative summaries](../visuals/power-bi-visualization-smart-narrative.md). |          |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Direct Lake calculated columns and tables (Preview) | Calculated columns (unmaterialized) on Direct Lake on OneLake tables are being deployed and will be available in the service in the coming weeks. Calculated tables referring to Direct Lake on OneLake columns are also supported. Use these features when adding columns or creating tables upstream isn't feasible, such as when data preparation in OneLake is managed by another team. For more information, see [Direct Lake overview](/fabric/fundamentals/direct-lake-overview). | ✔️ |
| User-context-aware calculated columns (Preview) | Calculated columns can now dynamically respond to DAX functions including `UserCulture()`, `UserPrincipalName()`, and `CustomData()`, enabling new scenarios like data translations. User-context-awareness can be set for calculated columns on Direct Lake on OneLake, Import, and DirectQuery tables using the Expression Context property. For more information, see [Direct Lake overview](/fabric/fundamentals/direct-lake-overview). | ✔️ |
| DAX user-defined functions: NAMEOF enhancements (Preview) | The DAX `NAMEOF` function now supports optional parameters to choose which part of a table, column, measure, or calendar name to return, and to control how that name is formatted for display. The new function signature is `NAMEOF ( <object> [, <component> [, <escaped>]] )`. Existing behavior is unchanged for current models. For more information, see [DAX user-defined functions best practices](/dax/best-practices/dax-user-defined-functions). | ✔️ |

## Visualizations

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Date Picker by Powerviz | A modern calendar slicer with pop-up mode, smart button label, custom preset title, first day of week setting, 15+ pre-built themes, and support for multiple date ranges, holidays, weekends, and import/export themes. Try Date Picker for free on [AppSource](https://appsource.microsoft.com). |          |
| Drill Down Waterfall PRO by ZoomCharts | A new **Automatic** mode in Change thresholds detects subtotals and calculates the difference between consecutive subtotal segments for clearer storytelling in multi-period reports. Also includes custom sequence control, drill-down support, automatic subtotal calculation, annotations, and cross-chart filtering. Get Drill Down Waterfall PRO on [AppSource](https://appsource.microsoft.com). |          |

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

> **Download** the [April 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
