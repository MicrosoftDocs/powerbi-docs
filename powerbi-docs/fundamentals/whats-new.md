---
title: See What's New in the May 2026 Power BI Update
description: "Discover the May 2026 Power BI update: Copilot summary shortcuts, visual calculations and custom totals GA, new Get Data experience in Power BI Desktop preview, and more. Learn what's new and get started today."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: concept-article
ms.date: 5/20/2026
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI? May 2026 update

The May 2026 Power BI update brings visual calculations and custom totals to general availability, adds Copilot summary shortcuts on the report ribbon and visual header, introduces a new Get Data experience in Power BI Desktop preview, and ships multiple reporting features including set as landing page, subscriptions support for reports in org apps, and column fixed width for table and matrix.

For a quick summary of the May features, read on. For a detailed look at these updates and more enhancements, see the [Power BI May 2026 Feature Summary](https://community.fabric.microsoft.com/t5/Power-BI-Updates-Blog/bg-p/fbc_pbiupdatesblog).

> **Download** the [May 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## Copilot and AI

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Explore improvements | Explore now supports perspectives for large data models—[create a perspective](../create-reports/power-bi-personalize-visuals.md#use-perspectives-for-a-more-focused-view) and set it in **File** > **Settings** > **Report settings** (service) or **File** > **Options and settings** > **Options** > **Current File** > **Report settings** (Desktop) to give consumers a focused list of fields. Matrix auto-expand now adjusts which fields are expanded when you add or reorder fields, so new fields are visible. Users can show or hide totals on table and matrix visuals from the Explore toolbar. Formatting applied to a matrix during report authoring now carries over when users launch an exploration from it. |          |
| Copilot summary shortcuts | A **Summarize** button on the report ribbon generates a report-wide summary in the Copilot pane, surfacing key trends, highlights, and changes across pages and visuals. A Copilot summary option on the visual header produces a visual-level summary, calling out trend shifts, category differences, and key drivers. For more information, see [Summarize a report with Copilot](../explore-reports/copilot-pane-summarize-content.md). |          |
| Copilot narrative visual: embedding in customer applications (Preview) | The Copilot narrative visual now supports the app-owns-data embed scenario. Embed the narrative visual in customer applications where report consumers don't need to sign in. For more information, see [Create a narrative visual with Copilot for Power BI](../create-reports/copilot-create-narrative.md). | ✔️ |
| New Copilot tooling format (Preview) | A new Copilot tooling format for **Prep data for AI** stores Copilot metadata in a Git-friendly, documented structure designed for direct editing and source control. It decouples Copilot from Q&A, moves metadata outside the Analysis Services database to reduce memory load, and improves performance for metadata-only scenarios. Support rolls out incrementally. For more information, see [Prepare your data for AI](../create-reports/copilot-prepare-data-ai.md#upgrade-to-copilot-tooling-format). | ✔️ |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Visual calculations and custom totals (Generally Available) | Visual calculations let you add running sums, moving averages, percent of parent, and other calculations directly to a visual without adding DAX measures to your semantic model. Calculations operate on aggregated data within the visual and are aware of row position. Select a visual and choose **New visual calculation** from the ribbon or context menu. For more information, see [Using visual calculations](../transform-model/desktop-visual-calculations-overview.md). |        |
| Custom totals: None and Average (Generally Available) | Custom totals now include **None** and **Average** options in addition to Sum, Min, Max, Count, and Count Distinct. Right-click a numerical column in a table or matrix and select **Customize total calculation** to choose the aggregation for the total row. For more information, see [Custom totals](../visuals/power-bi-visualization-tables.md#custom-totals). |        |
| Set as landing page (Generally Available) | Designate any page as the landing page so report viewers always start on the right page. Right-click a page tab and select **Set as landing page**, or use the page formatting pane. For more information, see [Set a landing page](../create-reports/power-bi-set-landing-page.md). |        |
| Default format string locale for dates and numbers (Generally Available) | Set a format string locale in report settings so all locale-aware format strings use your specified locale instead of the viewer's browser language. Note: this affects how values display in visuals only—`USERCULTURE()` and metadata translations still use the viewer's browser locale. For more information, see [Default format string locale](../create-reports/power-bi-default-format-string-locale.md). |        |
| Translytical task flows: optional parameters and default values (Generally Available) | Reports pre-populate input fields with default values from user data functions, and users can submit task flows without specifying every parameter value. For more information, see [Understand translytical task flows](../create-reports/translytical-task-flow-overview.md). |        |
| Input slicer numeric column support (Generally Available) | The input slicer now supports numeric fields and a numeric input mask. Use operator syntax to filter values with expressions like ranges (`1-2`), greater than (`>2`), less than (`<2`), not equal (`<>2`), or wildcards (`2*`). Without a data column, limit the slicer to numeric entry for translytical task flows. Invalid input now shows clear feedback. For more information, see [Create and use an input slicer](../visuals/power-bi-visualization-input-slicer.md). |        |
| Matrix auto-expand for embedded visuals and Explore (Generally Available) | Set a property so fields added to a matrix visual automatically expand in embedded scenarios, displaying expanded hierarchies without requiring user interaction. Explore also auto-expands as fields are added to the matrix. For more information, see [Power BI embedded analytics playground](../developer/embedded/power-bi-playground.md). |        |
| Text box list formatting improvements (Generally Available) | Lists in text boxes now preserve formatting correctly, indentation renders as expected, and you can paste bulleted lists directly from Word. For more information, see [Add text boxes, shapes, and smart narratives to Power BI reports](../create-reports/power-bi-reports-add-text-and-shapes.md). |        |
| Azure Maps formatting pane (Generally Available) | The Azure Maps visual has an updated formatting pane aligned with the modern formatting experience in Power BI, with map settings, layer options, and style controls in a consistent layout. For more information, see [Get started with Azure Maps Power BI visual](/azure/azure-maps/power-bi-visual-get-started). |        |
| Modern visual defaults improvements (Preview) | The theme dropdown has an updated look. The **Remove custom theme** tile is renamed **Reset to default** for clarity. Fixes include: the slicer now defaults to dropdown mode without issues, and the first page correctly uses the new canvas size. For more information, see [Visual defaults in Power BI reports](../create-reports/power-bi-reports-visual-defaults.md). | ✔️ |
| Column fixed and default width for table and matrix (Generally Available) | Specify exact pixel widths for columns in table and matrix visuals in the formatting pane, or set a default width for all columns. **Auto-size** behavior now includes a **Fixed width** option in addition to fit to content and grow to fit. Widths can be set differently for desktop and mobile views. For more information, see [Table and matrix visual overview](../visuals/power-bi-visualizations-overview.md#tables-and-matrices). |        |
| Subscriptions support for Power BI reports in org apps (Preview) | Create and manage email subscriptions for Power BI reports directly within org apps. Consumers viewing reports in an org app can stay informed with scheduled email snapshots and links back to the report, just as they would when accessing reports elsewhere in the Power BI service. For more information, see [Email subscriptions for reports in org apps](../explore-reports/org-app-items.md). | ✔️ |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Faster access to web modeling for semantic model authors | Users with edit permissions on semantic models are now taken directly to the web modeling experience instead of the model details page. Most actions from the model details page are now integrated into model view. For more information, see [Edit semantic models in the Power BI service](../transform-model/service-edit-data-models.md). |        |

## Data connectivity

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| New Get Data experience in Power BI Desktop (Preview) | A redesigned Power Query Get Data experience provides a unified place to discover and connect to data sources. Key highlights include improved data source discovery, a streamlined connection flow, and built-in accessibility features such as keyboard navigation and dark mode. Brings greater consistency to Power Query across Microsoft Fabric, Power BI Desktop, and Microsoft Excel. For more information, see [New Get Data experience](https://aka.ms/NewGetDataMsLearn). | ✔️ |

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

> **Download** the [May 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
