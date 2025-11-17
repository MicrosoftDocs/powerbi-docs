---
title: See What's New in the November 2025 Power BI Update
description: "Discover the November 2025 Power BI update: new features, Copilot improvements, and reporting enhancements. Learn what's new and get started today."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: conceptual
ms.date: 11/18/2025
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI: November 2025 update

The November 2025 Power BI feature update brings several important announcements and enhancements across the platform. Key highlights include the deprecation of R and Python visuals in the "Embed for your customers" solution, significant updates to Copilot and AI capabilities—such as the standalone Copilot in Power BI mobile apps (preview) and improvements to Verified Answers—and new options for reporting, modeling, and data connectivity. There are also advancements in report visuals, with features like automatically expanding matrix columns and a generally available Card visual.

For a quick summary of the September features, read on. For a detailed look at these updates and more enhancements, go to the [Power BI November 2025 Feature Summary blog post](https://aka.ms/powerbinov2025update). You can also watch the [November demos](https://youtu.be/pRFeQWzUhn0).

> **Download** the [November 2025 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## Events and announcements

- **Fabric Data Days**: Two months of learning, contests, live sessions, and community connection start November 4. See the [full schedule](https://aka.ms/fabricdatadays).
- **FabCon**: March 16–20, 2026, Atlanta, GA. This community-led event includes keynotes, expert sessions, an expo hall, Power Hour, the Data Viz World Championship, and a party at the Georgia Aquarium. [Use code FABCOMM](https://aka.ms/fabcon) to get $200 off.

## General

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Announcing deprecation of R and Python visuals in "Embed for your customers" solution | In May 2026, Power BI is ending support for embedding reports and dashboards containing R or Python visuals using "Embed for your customers" (app owns data) and Publish to web scenarios. After this date, R or Python charts will display as blank. This doesn't affect "Embed for your organization" or "Secure embeddings to SharePoint, Website, or Portal." |        |

## Copilot and AI

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Ask anything, anywhere with Standalone Copilot in Power BI mobile apps | New standalone Copilot experience on mobile homepage with complete chat capabilities. Ask questions, get instant insights, and interact with generated visuals. iOS apps support dictation for voice interaction. | ✔️ |
| Updates to the standalone Copilot in Power BI | Copilot now automatically selects data sources when there's a strong match, eliminating the need to choose from a list. New entry points on the home page, suggested prompts for recently opened items, and improved experience for attaching items to questions. |          |
| Improvements to the Report Copilot | Upgraded Report Copilot with better visual recommendations, expanded visual library, and improved context awareness. Creates entire report pages in seconds with more accurate and insightful results. Available in Power BI service and Desktop. |          |
| Improvements to Verified Answers | Verified answers now inherit the entire visual state including slicers, cross-filters, and drill-through filters. Filter limit increased from 3 to 10 permutations. New card visual and Azure maps now supported. Improved filtering reliability. |          |
| Remote Power BI Model Context Protocol Server for chat with your Data | Remote MCP server provides agents and MCP clients with tools to chat with data remotely, authenticated with Microsoft Entra ID. Includes tools for getting semantic model schema, generating DAX queries, and executing queries. | ✔️ |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Automatically expand matrix columns to fill available space | Matrix visual now supports the **Grow to fit** option, distributing extra space evenly across columns when total column width is smaller than the visual container. Horizontal scrollbar behavior corrected. |        |
| Card visual | **Now generally available** with support for hero images, dynamic collage layout, customizable display order for callout area/reference label/hero image, and consistent formatting controls across visuals. Images can be uploaded, provided via URL, or selected from dataset. |        |
| Enhancing Image visuals with styling, states, and more | Image visual now supports state-based formatting (All, Default, Hover, Pressed) and rich styling controls including background, border, shape, and effects. Expanded image sources (URL, data column, upload) and fit options (Fit, Fill, Center, Stretch). |        |
| OneLake Catalog now supports user data functions for Translytical task flows | Fabric user data function selection improved with OneLake catalog. Browse, search, view details, and filter by My Functions or Endorsed in your org. Available when selecting functions for Data function actions. | ✔️ |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Power BI Modeling MCP Server | Local MCP server enables AI agents to interact with Power BI models using natural language. Build and modify semantic models, perform bulk operations, apply best practices, and leverage agentic workflows. Available as Visual Studio Code extension. | ✔️ |
| Semantic Model Version History | **Now generally available**. Automatically captures up to five versions when opening models in Editing mode, publishing/uploading .pbix files, or restoring versions. Versions can be restored from Office-like history pane. |        |
| TMDL Visual Studio Code Extension | **Now generally available** with DAX semantic highlighting, Power Query support, breadcrumb navigation, code actions, code formatting, and localization. Essential for working with TMDL documents in Power BI Projects. |        |

## Data connectivity

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Spark and Impala Connectors | Implementation 2.0 **now generally available**, powered by open-source Arrow Database Connectivity (ADBC) driver. Delivers faster, more secure connectivity with reduced overhead, memory safety, and seamless integration across Fabric and Power BI Desktop. |        |

## Visualizations

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Activity Gauge by Powerviz | Advanced visual for measuring progress against targets for multiple categories. Features gauge customization, targets, data colors with 7 schemes and 30+ palettes, smart labels, center circle customization, interactive mouseover, fill patterns, conditional formatting, ranking, annotation, and grid view. |          |
| Decomposition Tree – All Expanding | Now allows adding a legend field that creates more column charts beside each node showing breakdown from another dimension. Supports images in nodes. |          |
| Dynamic chart legends in Zebra BI Charts | Chart legends automatically adapt to selected filter or scenario, eliminating confusion from static labels. Useful for financial planning and analysis when comparing forecast versions, year-over-year analysis, and regional reporting. |          |
| Drill Down Bubble PRO by ZoomCharts | Create visually impressive bubble charts with intuitive UI interactions. Features drill down through multi-level hierarchy, data-driven formatting with custom marker colors/shapes/images, trendlines, thresholds, and area shading. Includes free Developer License for Power BI Desktop. |          |
| Power BI Theme Generator | Rebuilt and expanded BIBB Report Theme Generator helps teams standardize look-and-feel and meet accessibility baselines. Features smarter color engine with contrast checks, gradients creation, AI-powered themes, preset brand colors, apply theme through Fabric, font selection, live preview, and advanced BI.ST mode. |          |
| Power Gantt Chart by Nova Silva | Now supports task dependencies with Finish-to-Start (FS) dependencies visualized as arrows connecting tasks. Enables true project scheduling capability to understand task sequences, identify bottlenecks, and manage timelines. |          |
| Synoptic Panel by OKVIZ | Transform any SVG image into an interactive visual. Perfect for floor plans, organizational charts, technical layouts, or geographical maps. Features flexible image loading, multi-level navigation, dynamic switching, Map Editor and Label Designer, advanced coloring, map search, and integrated security. |          |

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

> **Download** the [November 2025 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
