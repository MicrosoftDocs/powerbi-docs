---
title: See What's New in the June 2026 Power BI Update (version 2.155.756.0)
description: "Discover the June 2026 Power BI update. See the latest feature highlights across Power BI and links to detailed documentation."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: concept-article
ms.date: 6/9/2026
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI? June 2026 update

The June 2026 Power BI update is planned for publication on June 9, 2026.

For a quick summary of June features, read on. For a detailed look at these updates and more enhancements, see the [Power BI June 2026 Feature Summary](https://aka.ms/powerbijune2026update). You can also [watch the June demos](https://youtu.be/pGmUMRa6xL4).

> **Download** the [June 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## General

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Power BI Dataviz World Championships announcement | The Dataviz World Championships return with kickoff events in June and a live finale at FabCon / SQLCon Barcelona. |        |
| FabCon Europe registration update | FabCon Europe takes place in Barcelona from September 28 to October 1, with community and Microsoft sessions across Fabric, Power BI, and related workloads. |        |

## Copilot and AI

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Fabric Apps for Semantic Models (Preview) | Fabric Apps add an AI-first app development path on top of semantic models so teams can build operational data apps while reusing model governance and business logic. For more information, see [Power BI data in Fabric Apps (preview)](../create-reports/fabric-apps-analytics.md). | ✔️ |
| Copilot in web modeling (Preview) | Copilot in model view helps analyze model structure and apply schema changes such as renames, relationships, and DAX measure creation by using natural language prompts. For more information, see [Copilot in web modeling (preview)](../transform-model/copilot-web-modeling.md). | ✔️ |
| AI-powered report authoring agent skills (Preview) | Power BI report authoring skills in Skills for Fabric support plan, design, author, validate, and publish workflows through natural language prompts. | ✔️ |
| Data answering in Fabric Skills, Cowork, and M365 Chat (Frontier) | Fabric IQ expands conversational data answering for Power BI reports and semantic models across Fabric and Microsoft 365 Copilot surfaces. For more information, see [Fabric IQ in Microsoft 365 Copilot Cowork (Frontier)](/fabric/iq/connectors/cowork-overview). |        |
| Data answering in Microsoft 365 Copilot Chat (Frontier) | Fabric IQ in Microsoft 365 Copilot Chat enables Frontier users to ask business questions grounded in governed Power BI data. For more information, see [Fabric IQ in Microsoft 365 Copilot Chat (Frontier)](/fabric/iq/connectors/m365-copilot-overview). |        |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Shape map (Generally Available) | Shape map now supports built-in maps, custom TopoJSON/GeoJSON uploads, URL-based map references, and downloading uploaded custom maps for reuse. For more information, see [Create shape map visuals in Power BI](../visuals/desktop-shape-map.md). |        |
| Date picker for slicers (Preview) | A new Date picker slicer option supports relative defaults that roll forward with refresh and lets report viewers switch between relative and manual date selections. For more information, see [Visualizations overview in Power BI](../visuals/power-bi-visualizations-overview.md). | ✔️ |
| Matrix row and column header auto-expand (Generally Available) | Matrix visuals now let you set auto-expand behavior for row and column headers so newly added hierarchy levels open expanded by default. For more information, see [Format settings for the matrix visual in Power BI](../visuals/power-bi-visualization-matrix-visual-format-settings.md). |        |
| Scatter charts: Auto-fit markers | Scatter charts add Auto-fit markers to keep bubbles and markers fully visible near plot boundaries without manual axis range tuning. For more information, see [Scatter charts, bubble charts, and dot plot charts in Power BI](../visuals/power-bi-visualization-scatter.md). |        |
| Axis improvements for bar and column charts (Generally Available) | Bar and column charts add Rounded range control and keep axis ranges stable when data labels are enabled. For more information, see [Create and use column charts in Power BI](../visuals/power-bi-visualization-column-charts.md). |        |
| Card visual image hover state options (Generally Available) | Card visuals now support hover-state image formatting, including alternate image source, transparency, effects, and background styling. For more information, see [Create a card visual in Power BI](../visuals/power-bi-visualization-card.md). |        |
| Slicer selection icon color formatting (Generally Available) | Slicers now let you set selection icon colors to improve contrast and readability, especially for dark themes and custom branding. For more information, see [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md). |        |
| Matrix and table fixed-width conditional formatting (Generally Available) | Matrix and table visuals support rule-based fixed width formatting so column widths can be controlled more consistently by scenario. For more information, see [Tables in Power BI](../visuals/power-bi-visualization-tables.md). |        |
| Azure Maps selections on by default (Generally Available) | Azure Maps now shows selection controls by default so users can start multi-point selection with circles, rectangles, polygons, distance, and drive-time tools. For more information, see [Azure and Power BI map visualizations](../visuals/power-bi-map-visualizations-overview.md). |        |
| Tooltip sentence options for visuals (Generally Available) | Tooltip options now include sentence-style text so authors can explain values with context without creating full tooltip pages. For more information, see [Tooltips in Power BI](../visuals/power-bi-visualization-tooltips-overview.md). |        |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| DAX user-defined functions (Generally Available) | DAX UDFs are now generally available with reusable typed function signatures and broader authoring workflows across Desktop and web modeling. For more information, see [DAX user-defined functions best practices](/dax/best-practices/dax-user-defined-functions). |        |
| DAX UDF optional parameters | UDFs now support default expressions for parameters so callers can omit selected arguments while preserving type-aware execution. For more information, see [DAX user-defined functions best practices](/dax/best-practices/dax-user-defined-functions). |        |
| DAX query view result grid sorting and filtering (Generally Available) | DAX query view result grids now include sort and filter controls to inspect query output without rewriting query text. For more information, see [DAX query view in Power BI](../transform-model/dax-query-view.md). |        |

## Visualizations

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Network Graph by Powerviz | Network Graph updates include directional links, clustering, duplicate-node merge options, and expanded formatting controls for relationship analysis scenarios. |        |
| accoMASTERDATA v1.1.16.2 | accoMASTERDATA updates add richer writeback, governance, and data-entry options including transaction keys, multiline text, and enhanced dropdown behavior. |        |

## Data connectivity

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| No dedicated data connectivity announcement in this release summary | The June draft doesn't call out a dedicated Data connectivity feature area. |        |

## Other

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Power BI Enhanced Report Format (PBIR) default-on rollout update | The PBIR default-on rollout resumes in the service, with Desktop default-on timing planned after rollout stability checks. For more information, see [PBIR format](../developer/projects/projects-report.md?tabs=v2%2Cdesktop#pbir-format). |        |
| Power BI Desktop Bridge (Preview) | Desktop Bridge enables agent and tool integration with a running Power BI Desktop session for iterative authoring and validation workflows. For more information, see [Power BI Desktop Bridge overview](../developer/agentic/power-bi-desktop-bridge-overview.md). | ✔️ |
| Power BI tabs in Teams private and shared channels | Power BI tabs in Teams now support private and shared channels so reports can be embedded in scoped collaboration spaces. For more information, see [Collaborate in Microsoft Teams with Power BI](../collaborate-share/office-integration/service-embed-report-microsoft-teams.md). |        |

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

> **Download** the [June 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
