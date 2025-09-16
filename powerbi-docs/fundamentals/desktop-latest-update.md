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
ms.date: 09/16/2025
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---

# What's new in Power BI: September 2025 update (version 2.147.909.0)

The [Power BI September 2025 Feature Summary blog post](https://aka.ms/fabricsept2025update) introduces updates for users and coincides with FabCon Vienna. This release introduces several key enhancements, including, updates to Copilot and AI capabilities such as the standalone Copilot default-on experience and important changes to default visuals like the Bing Maps Visual icon. Dive into the details to discover how these innovations can elevate your Power BI experience.

For a quick summary of the September features, read on. For a detailed look at these updates and more enhancements, go to the [blog](https://aka.ms/fabricsept2025update). You can also watch the September demos in the [monthly playlist](https://youtu.be/CQVQtXr9EbI).

> **Download** the [September 2025 version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494).

## Events and announcements

- **Power BI Dataviz World Championships**: Four finalists are taking the stage at FabCon Vienna to compete for the title of world champion. Follow the [Power BI September 2025 Feature Summary blog](https://aka.ms/fabricsept2025update) to find out who was crowned champion.
- **Get certified in Microsoft Fabric**: Join the thousands of other Fabric users who’ve achieved over 50,000 certifications collectively for the Fabric Analytics Engineers and Fabric Data Engineers roles. To celebrate FabCon Vienna, we are offering the entire Fabric community a **50% discount** on exams *DP-600*, *DP-700*, *DP-900*, and *PL-300*.

## General

| Feature | Details and related documentation |
|---|---|
| **Bing Maps visual icon will be removed from the default visuals list of the visualization pane** | Beginning with the October release, the Bing Maps visual icon will be removed from the default visuals list in the Power BI visualization pane. |

## Copilot and AI

| Feature | Details and related documentation |
|---|---|
|**Standalone Copilot to default-on**|The standalone Copilot experience for Power BI, a full-screen, chat-based AI interface, will be enabled by default for all tenants with Copilot turned on starting September 5, 2025. Users can opt out via the admin portal. For more information, see [Standalone Copilot experience in Power BI](../create-reports/copilot-chat-with-data-standalone.md).|
|**Autoselection of Copilot workspaces**|Copilot will automatically assign a workspace to users without Fabric Copilot Capacity, simplifying access while maintaining user control. For more information, see [Standalone Copilot experience in Power BI](../create-reports/copilot-chat-with-data-standalone.md).|
|**Save explorations to pro workspaces**|Explorations can now be saved to Pro workspaces, making it easier to share insights. For more information, see [Use Explore in the Power BI service](../consumer/explore-data-service.md)|
|**Find Power BI reports in Microsoft 365**|Search for Power BI reports in Microsoft 365 by title, description, or chart details, improving discovery in M365 Copilot and Office search. For more information, see [Share data with your Microsoft 365 services](/fabric/admin/admin-share-power-bi-metadata-microsoft-365-services#how-to-turn-sharing-with-microsoft-365-services-on-and-off).|
|**Copilot search improvements**|Copilot search now boosts content marked as "Prepped for AI," provides descriptive captions for reports, and supports workspace and item type hints. For more information, see [Find content with Power BI Copilot search](../create-reports/copilot-search-new-content.md).|
|**Prep data for AI coming soon to the Power BI service**|Prepare semantic models for AI directly in the Power BI service, including Direct Lake models. Features include schema selection, verified answers, and AI instructions. For more information, see [Mark your model as prepped for AI](../create-reports/copilot-prepare-data-ai#mark-your-model-as-prepped-for-ai).|

## Reporting

| Feature | Details and related documentation |
|---|---|
|**Enhanced DAX time intelligence (preview)**|Define custom calendars, such as fiscal or 4-5-4 retail calendars, for precise time-based calculations. Includes new functions like TOTALWTD and PREVIOUSWEEK. For more information, see [Implement time-based calculations in Power BI](https://aka.ms/powerbi-calendar-TI-docs).|
|**Performance analyzer available when editing a report in the web**|Observe visual load times and copy DAX queries directly in the web report editing experience. For more information, see [Use Performance Analyzer to examine report element performance in Power BI Desktop](../create-reports/desktop-performance-analyzer.md).|
|**Translytical task flows are now enabled by default in Power BI**|Automate tasks like updating records and triggering workflows directly from reports using Fabric User data functions. For more information, see [Understand translytical task flows](../create-reports/translytical-task-flow-overview.md).|

## Modeling

| Feature | Details and related documentation |
|---|---|
|**Editing semantic models in the Power BI service (generally available)**|Create and edit semantic models directly in the browser, including advanced modeling capabilities like relationships, DAX measures, and row-level security. For more information, see [Edit data models in the Power BI service (preview)](https://go.microsoft.com/fwlink/?linkid=2232209).|
|**Live editing Direct Lake semantic models with Power BI Desktop (generally available)**|Edit Direct Lake semantic models directly in Power BI Desktop, with changes applied in Fabric. For more information, see [Direct Lake in Power BI Desktop (preview)](https://aka.ms/directlakeindesktop).|
|**TMDL view (generally available)**|Edit semantic models using the Tabular Model Definition Language (TMDL) for batch updates and code-first transparency. For more information, see [Work with TMDL view in Power BI Desktop (preview)](../transform-model/desktop-tmdl-view.md).|
|**Download PBIX of XMLA altered semantic models**|Download and edit PBIX files for semantic models modified through the XMLA endpoint. For more information, see [Limitations when downloading a report .pbix file](../create-reports/service-export-to-pbix.md#limitations-when-downloading-a-report-pbix-file).|
|**Fabric Notebooks for Power BI: best practices analyzer and memory analyzer (generally available)**|Analyze semantic models with Fabric Notebooks for performance, memory, and storage optimization. For more information, see [Use notebooks with a semantic model](https://go.microsoft.com/fwlink/?linkid=2303903).|
|**Direct Lake on OneLake + import in web modeling (preview)**|Combine Direct Lake and import table storage modes in web modeling for flexible data integration. For more information, see [Direct Lake overview](/fabric/fundamentals/direct-lake-overview).|
|**Direct Lake on OneLake + import in desktop**|Power BI Desktop can also live edit semantic models with both Direct Lake and import tables. For more information, see [Direct Lake overview](/fabric/fundamentals/direct-lake-overview).|
|**DAX user-defined functions (preview)**|Define reusable DAX functions with parameters for cleaner, maintainable logic. For more information, see [Power BI DAX User Data Functions](https://aka.ms/powerbi-dax-UDFs-docs).|
|**Refresh data or schema options in Power BI Desktop**|Choose to refresh data only or sync schema only, providing more control over refresh operations. For more information, see [Data refresh in Power BI](../connect-data/refresh-data.md#Power-BI-Desktop-refresh-options).|
|**Power BI content shared in Teams now opens in a separate window**|Power BI items shared in Teams now open in a separate window, preserving the chat view. For more information, see [Link preview cards in Microsoft Teams chats and channels](../collaborate-share/service-teams-link-preview.md).|

## Mobile

| Feature | Details and related documentation |
|---|---|
|**NFC tag support in Power BI Mobile (generally available)**|Register and access Power BI items via NFC tags for quick data retrieval. For more information, see [Connect data to physical locations with NFC tags](../consumer/mobile/mobile-apps-nfc-tags.md).|

## Other

| Feature | Details and related documentation |
|---|---|
|**New tenant setting for set alert button visibility**|Admins can control visibility of the 'Set alert' button for creating Fabric Activator alerts. For more information, see [Create an alert in Power BI report](/fabric/real-time-intelligence/data-activator/activator-get-data-power-bi.md)|

## Visualizations

| Feature | Details and related documentation |
|---|---|
|**ADWISE advanced column v 2.0**|A versatile column chart visual with features like difference lines, Top N selection, and total columns.|
|**Zebra BI tables: calculated reports in one click and brand images**|Streamline reporting with row calculations and brand images for intuitive data storytelling.|
|**Word cloud by Powerviz**|Create high-quality word clouds with advanced styling, ranking, and conditional formatting.|
|**Drill down combo bar PRO by ZoomCharts**|Visualize categorical data with up to nine drill-down levels and customizable chart types.|
|**CAGR arrows now in Zebra BI charts**|Highlight multi-year growth trends with intuitive CAGR arrows in Zebra BI Charts.|

## Resources

Want to learn about Power BI through videos and other engaging content? Check out these video sources and content:

- [This month's Power BI playlist on YouTube](https://youtu.be/AEXtSe2OA5E): Watch videos and demos that highlight this month's Power BI updates.
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

> **Download** the [September 2025 version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494).

## Past updates

Looking for Power BI updates from previous months? Find them in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
