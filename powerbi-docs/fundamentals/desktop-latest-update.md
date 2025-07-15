---
title: See what's new with the latest Power BI update
description: Discover the latest Power BI monthly update, including new features, Copilot improvements, and reporting enhancements. Learn what's new and get started today.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: conceptual
ms.date: 07/15/2025
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---

# What's new in Power BI: July 2025 update

The [July 2025 Power BI update](https://powerbi.microsoft.com/blog/power-bi-july-2025-feature-summary/) introduces richer Microsoft 365 connections, smarter Copilot features, and integrated reporting with PBIRS and SQL Server 2025. This article covers all the new features, benefits, and improvements to help you get the most out of Power BI.

For a quick summary of the July features, read on. For a detailed look at these updates and more enhancements, go to the [blog](https://powerbi.microsoft.com/blog/power-bi-july-2025-feature-summary/). You can also watch the July demos in the [monthly playlist](https://youtu.be/RABiSIUiCH4)

## Events and announcements

- **Power BI is turning 10**: Power BI celebrates its 10th anniversary with a special live episode featuring behind-the-scenes stories, product evolution highlights, and a sneak peek at future developments. The celebration includes a live Q&A session, contests, and giveaways.
- **The Microsoft Fabric Community Conference is back x2. Join us in Vienna and Atlanta**: The Microsoft Fabric Community Conference returns for its third year. Events are in Vienna from September 15-18, 2025, and in Atlanta, Georgia, from March 16-20, 2026. Attendees can register for discounts using specific codes.

## General

- **Expanded data sharing with M365**: Power BI improves integration with Microsoft 365 by sharing more detailed metadata, like chart titles and descriptive text, so users find reports and make data-driven decisions.
- **PBIRS will consolidate on-premises reporting services from SQL Server 2025**: Starting with SQL Server 2025, all on-premises reporting services unify under Power BI Report Server (PBIRS), which is the default solution for all paid SQL Server editions. Microsoft doesn't release new versions of SQL Server Reporting Services (SSRS).

## Copilot and AI

- **Improvements to standalone Copilot answers**: Standalone Copilot prioritizes report data over model data to generate answers, so responses are more relevant. Copilot also applies filters to report responses, so answers to user queries are more specific.
- **Limit Copilot search to prepped content**: New admin settings let tenant and workspace admins limit Copilot search responses to items marked as "Prepped for use with AI." This feature helps reduce the risk of using outdated or irrelevant reports.
- **Verified answers from Copilot search**: Power BI's standalone Copilot provides human-curated common questions and visualizations, so users get accurate and relevant answers.
- **AI data schema—updates (preview)**: The AI data schema capability in the "Get your data AI ready" preview now shows indicators for hidden fields. These updates make it easier to prepare data for AI.
- **Customized instructions for summaries through subscriptions**: Power BI report subscriptions support summaries by Copilot at the top of the email, which can include custom instructions and make report summaries more relevant.
- **Narrative visual available in subscription snapshot and export**: The narrative visual is available in screenshot export services, so users can include these visuals in PDF or PPT exports and subscriptions.
- **Textual responses for data inquiries**: Copilot offers textual summaries that complement generated visuals for data-related elements of the visual response, so the user experience is better.

## Reporting

- **New Power BI app navigation menu in Teams**: The new left navigation menu in the Power BI app for Teams streamlines navigation, so you find and use Power BI content in Teams more easily. The redesigned menu has a user-friendly layout.
- **Influencing sort for visual calculations (preview)**: Power BI adds an ORDERBY parameter to most visual calculations, so you run advanced computations based on data sorting. This feature lets you use more flexible visual calculations.
- **Field parameters (generally available)**: Field parameters are generally available, so you change the measures or dimensions you analyze in a report. This feature lets you customize reports more easily.
- **Organizational themes (preview)**: Power BI supports organizational themes, so reports have consistent branding and styling. Tenant admins manage and share custom JSON themes centrally, so reports match your organization’s visual identity.
- **Improvements to pie and donut charts**: The latest update improves pie and donut charts with more consistent styling options and better accessibility. You adjust slice colors, transparency, borders, and other features.

## Modeling

- **Direct Lake in Desktop from mirrored and SQL databases**: Create Direct Lake semantic models in Power BI Desktop from SQL and mirrored databases in Microsoft Fabric. This feature lets you create and validate semantic models more easily.
- **DAX query view and web modeling view switcher**: Use the new view switcher to quickly switch between web modeling and DAX query view. This makes working with published semantic models easier.

## Data connectivity

- **Support for PQO gateway connections for paginated reports**: Create paginated reports using an on-premises data source by establishing a gateway connection. This feature expands connectivity options for paginated reports.
- **Snowflake connector implementation 2.0 (generally available)**: Snowflake connector implementation 2.0 is generally available, offering improved performance and security features. This update includes enhancements like Boolean column support and improved tracing.
- **New Google BigQuery (Microsoft Entra ID) connector implementation (preview)**: The new Google BigQuery (Microsoft Entra ID) connector implementation is available, offering improved performance and security features. Enable this feature in Power BI Desktop.
- **New Databricks connector implementation (preview)**: The new Databricks connector implementation is available in preview, offering improved performance and security features. This update uses the Arrow Database Connectivity (ADBC) driver.
- **Connect to Netezza database with the user-installed ODBC driver (preview)**: Access Netezza data using the user-installed ODBC driver, which provides more flexibility when connecting to Netezza databases.
- **PostgreSQL connector adds support for Microsoft Entra ID authentication**: The PostgreSQL connector supports Microsoft Entra ID authentication, which provides an alternative to database (username/password) authentication.

## Mobile

- **Home in the Power BI mobile app has been reorganized**: The home screen in the Power BI mobile app is reorganized so you can get to your most important content faster. The update includes a combined carousel for recent and frequent items, and a new favorites carousel.

## Developers and APIs

- **Power BI enhanced report format (PBIR) update**: The PBIR file format update addresses limitations and is on the path to general availability. The update supports deploying PBIR reports using Fabric deployment pipelines, and it's compatible with different Power BI service features.

## Visualizations

- **Stacked bar chart with line by JTA - a data scientist's visualization tool**: This custom Power BI visual from JTA combines a traditional bar chart, a stacked bar, and a dynamic line chart, so you can compare multiple metrics in one display. The visual lets you customize many options.
- **Linear gauge by Powerviz**: The linear gauge visual by Powerviz is an advanced tool for showing progress against set targets on a linear scale. It lets you customize gauge styles, orientation, and data colors.
- **Drill down shape map PRO by ZoomCharts**: Shape Map PRO is a custom visual that lets you create interactive map charts for quick, actionable insights. The visual supports many customization options and works well with other visuals.
- **Inforiver premium table—high-performance, formatted, and scalable table visual for Power BI**: Inforiver premium table is for business reporting, operational dashboards, and customer-level analytics. It supports rich formatting, inline edits, and custom calculations, so it's ideal for showing categorical data.
- **Inforiver Analytics+ 4.7 is here with 100+ charts, Gantt, KPI cards, and tables**: Inforiver Analytics+ now has over 100 chart types, KPI cards, tables, and Gantt charts in one visual. This update fills key gaps in Power BI and adds many advanced chart types.

## Resources

Want to learn about Power BI through videos and other engaging content? Check out these video sources and content:

- [This month's Power BI playlist on YouTube](https://youtu.be/RABiSIUiCH4): Watch videos and demos that highlight this month's Power BI updates.
  - See [all Power BI playlists on YouTube](https://www.youtube.com/@MicrosoftPowerBI/playlists)
- [Power BI YouTube channel](https://www.youtube.com/user/mspowerbi): Official Microsoft Power BI channel
- Follow Power BI on X [@MSPowerBI](https://twitter.com/mspowerbi)
- Go to the [Power BI forums in the Microsoft Fabric Community](https://community.fabric.microsoft.com/t5/Power-BI-forums/ct-p/powerbi)

> [!NOTE]
> Some resources use earlier versions of Power BI Desktop or the Power BI service.

Download previous versions of Power BI Desktop if your organization requires it. We recommend using the most recent version of Power BI Desktop instead of a previous version. Previous versions have these limitations:

- Previous releases of Power BI Desktop aren't serviced—always use the most recent release for the latest features and updates.
- You can't open files created or saved in newer releases of Power BI Desktop with previous versions.
- If you get a warning when loading a report saved in a newer release, then save that report in the previous version, you lose any information related to new features.
- Only the English versions of Power BI Desktop are archived.

Select a link to download this version:

- [July 2025 version of Power BI Desktop - 32-bit](https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup-2025-07.exe)
- [July 2025 version of Power BI Desktop - 64-bit](https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup-2025-07_x64.exe)

## Past updates
Looking for Power BI updates from previous months? Find them in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
