---
title: See What's New in the July 2026 Power BI Update
description: "Discover the July 2026 Power BI update. See the latest feature highlights across Power BI and links to detailed documentation."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: concept-article
ms.date: 7/22/2026
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI? July 2026 update

The July 2026 Power BI update introduces new capabilities across reporting, modeling, mobile, and embedded analytics. Highlights include expanded modern visual defaults, conditional formatting improvements for line charts and legends, new org app capabilities and APIs, model options in the Power BI Service, and TMDL view on the web.

For a quick summary of July features, read on. For a detailed look at these updates and more enhancements, see the [Power BI July 2026 Feature Summary](https://aka.ms/powerbijuly2026update). You can also [watch the July demos](https://youtu.be/8JWZF1eB6oQ).

> **Download** the [July 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## General

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| New behavior for downloading .pbix from semantic model in Power BI Service | When downloading a .pbix file from a semantic model, users now get an empty report with the dataset only. To download the report with the dataset, go to the report in the Power BI Service. This change addresses inconsistent report results from semantic model downloading. |        |
| Deprecation of old file picker experience in Power BI Desktop | Starting in October, users with Power BI Desktop versions from March 2026 or earlier will no longer be able to save and share files to OneDrive and SharePoint. Update Power BI Desktop to keep using this functionality. |        |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Update your report defaults and use color palettes with modern visual defaults (Preview) | Modern Visual Defaults now includes a **Customize current theme** experience in the Format pane. Adjust report-wide defaults for visuals, choose color palettes, and control visual elements like background, border, header icons, tooltips, and shadow across your entire report. Update page size, background color, and wallpaper across all pages at once. When finished, export your custom theme for use in other reports or add it to organizational themes. For more information, see [Visual defaults in Power BI reports](../create-reports/power-bi-reports-visual-defaults.md). | ✔️ |
| Conditional formatting for line charts and legends (Generally Available) | Conditional formatting now extends to line charts and visuals with legends, including bar charts, column charts, pie charts, donut charts, and line charts. Format line colors using a gradient based on total value or category, or ensure consistent colors across your report using a single DAX measure. For more information, see [Conditional formatting in Power BI visuals](../visuals/power-bi-visualization-conditional-formatting.md). |        |
| Report page tab navigation improvements (Generally Available) | When dragging a page tab to reorder it, tabs continue to scroll until you reach the desired position, making it easier to move pages from the end to the beginning of your report. Arrow buttons for paging through tabs are more precise, ensuring you see each report page tab as you navigate. For more information, see [Report view in Power BI Desktop](../create-reports/desktop-report-view.md). |        |
| Simplified title spacing for visuals | Title spacing now uses a consistent "space above" approach for subtitle, divider, and plot area, instead of the previous "space below" settings. Existing reports and themes automatically adjust without appearance changes. For more information, see [Customize visualization titles in Power BI reports](../visuals/power-bi-visualization-customize-title-background-and-legend.md). |        |
| Visuals calculations LOOKUP function now supports INFERRED mode | The LOOKUP function in visual calculations now accepts an optional AssociatedColumnsBehavior parameter with EXPLICIT (default) and INFERRED values. When using INFERRED, the engine automatically identifies which axis columns are functionally determined by the coordinates you supply and fills them in before evaluating the lookup. For more information, see [Using visual calculations](../transform-model/desktop-visual-calculations-overview.md). |        |
| Org apps with audiences (Generally Available) | App creators can deliver different content experiences to different groups of users within the same app, making it easier to personalize content while managing a single app experience. For more information, see [Get started with org apps](../explore-reports/org-app-items.md). |        |
| Bookmarks support for reports in org apps | Users can access both report bookmarks created by authors and personal bookmarks when viewing interactive reports in org apps, making it easy to return to saved report views with filters, selections, and visual state. For more information, see [Bookmarks in the Power BI service](../explore-reports/end-user-bookmarks.md). |        |
| Storytelling support for reports and visuals in org apps | Reports in org apps now support Storytelling in PowerPoint, allowing users to add live report pages and visuals from org app content into PowerPoint presentations. For more information, see [Add live Power BI data to PowerPoint](../collaborate-share/service-power-bi-powerpoint-add-in-install.md). |        |
| CRUD APIs for org apps and audiences | Developers and administrators can programmatically manage org apps and audiences using Microsoft Fabric REST APIs. New APIs support create, read, update, delete, and list operations for both org app items and audience items. |        |
| CRUD APIs for paginated reports | Paginated reports can now be managed through Microsoft Fabric REST APIs. New support for create, read, update, delete, and list operations enables developers and administrators to automate report lifecycle management and deployment workflows. |        |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Measure descriptions with triple-slash comments | Add measure descriptions using `///` comment lines directly above your MEASURE definition in DAX query view, using the same syntax TMDL supports. Select **Update model with changes** and the description is written into the model. Descriptions appear in tooltips in DAX query view, Model Explorer, and the Data pane. For more information, see [Work with DAX query view in Power BI](../transform-model/dax-query-view.md). |        |
| Model Options now available in Power BI Service | The Model options dialog is now available directly in web modeling, providing control over type detection, relationships, time intelligence, parallel loading, locale settings, DirectQuery connections, and maximum connections per data source. For more information, see [Model options in the Power BI Service](../transform-model/service-model-options.md). |        |
| Semantic model settings pane becomes the default (Preview) | Starting in August, semantic model settings open in the new settings pane instead of the full settings page. The pane opens beside your content, so you can update refresh schedules, credentials, and other options without leaving your workspace. For more information, see [Edit semantic models in the Power BI Service](../transform-model/service-edit-data-models.md). | ✔️ |
| TMDL View on the web | Developers can script, modify, and apply changes to model objects directly in a code editor using Tabular Model Definition Language without switching to Desktop or downloading model files. Provides code-level visibility into semantic model metadata for bulk edits, automation, and reusable definitions. For more information, see [Use Tabular Model Definition Language view in Power BI Desktop](../transform-model/desktop-tmdl-view.md). |        |

## Mobile

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Org app audiences are now in mobile apps | Org app audiences in the Power BI mobile app extend a tailored org app experience to users on iOS and Android. Mobile and tablet users can open an org app and see content based on their assigned audience, delivering the right content to the right people on smaller screens. For more information, see [View org apps in the Power BI mobile apps](../explore-reports/mobile/mobile-apps-view-phone-report.md). |        |

## Embedded analytics

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Enhancements to Power BI embedding in SharePoint Online | A new UI lets you directly select the workspace you want to embed in SharePoint instead of copying and pasting the full URL. You can now embed a visual by selecting the **Embed a single visual** toggle. For more information, see [Add a Power BI report to SharePoint Online](../collaborate-share/service-embed-report-spo.md). |        |

## Visualizations

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Third-party custom visuals | Browse hundreds of custom visuals in AppSource, available directly from Power BI Desktop, or develop your own. Publish to AppSource or share across your organization. |        |

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

> **Download** the [July 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
