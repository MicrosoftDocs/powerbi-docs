---
title: See What's New in the January 2026 Power BI Update
description: "Discover the January 2026 Power BI update: enhanced Copilot features, improved reporting capabilities, and new visualization options. Learn what's new and get started today."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.custom: intro-whats-new
ms.topic: concept-article
ms.date: 1/20/2026
LocalizationGroup: Get started
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
---
# What's new in Power BI: January 2026 update

The January 2026 Power BI feature update delivers powerful enhancements across the platform. Key highlights include improved Copilot capabilities with attaching reports and semantic models to chat, enhanced color picker and format pane improvements, modern visual tooltips now generally available, and markers in Azure Maps Visual. There are also important updates to semantic model editing, GB18030-2022 character set support, and the PBIR report format becoming the default.

For a quick summary of the January features, read on. For a detailed look at these updates and more enhancements, go to the [Power BI January 2026 Feature Summary blog post](https://aka.ms/powerbijan2026update). You can also watch the [January demos](https://youtu.be/xYNx4a3aRZQ).

> **Download** the [January 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

To stay up to date on **bug fixes and improvements** as they're announced, visit the [change log for Power BI Desktop](desktop-change-log.md).

## Events and announcements

- **Data Viz World Championships**: There's only one way to find out if you can be the world champion! By joining this global contest, you will have the opportunity to tackle three weekly challenges designed to stretch visualization skills and inspire innovation. Four finalists will be selected to compete for the title of world champion LIVE on stage at FabCon Atlanta.
- **FabCon Americas 2026**: Join us for the ultimate Power BI, Microsoft Fabric, SQL, Real-Time Intelligence, AI, and Databases community-led event from March 16–20, 2026, in Atlanta, GA. The third annual FabCon Americas will feature sessions from your favorite Microsoft and community speakers, keynotes, more opportunities to Ask the Experts for 1:1 support, an engaging community lounge with opportunities to network and connect with your peers, a dedicated partner pre-day, a packed expo hall, attendee favorites Power Hour and the Data Viz World Championships live finals, and a can't-miss attendee party at the Georgia Aquarium. [Use code FABCOMM](https://aka.ms/fabcon) to get $200 off.

## General

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Deprecation of Power BI Q&A | Q&A, our legacy natural language tool, will be deprecated in December 2026. Moving forward, use Power BI Copilot, which provides a more advanced and integrated solution for querying data with natural language. |        |
| SQL Server Reporting Services (SSRS) Report Viewer Web Part Support Discontinuation | Support for SSRS SharePoint Webpart, a component that allows you to embed on-premises paginated reports directly into SharePoint Server pages, will end on April 13, 2026. While the download will continue to be available, technical support will no longer be provided. |        |
| The Power BI application is accessible within Teams for Microsoft 365 Operated by 21Vianet | Users can acquire the Power BI app from the app store, or admins can centrally install it for them. Once added, users can view their Power BI content in Teams by using the app, and pin Power BI items to Teams channels and chats. Note that certain features aren't supported in the Power BI app for Teams operated by 21Vianet environments. For more information, refer to the service description of [Power BI operated by 21Vianet](/fabric/enterprise/powerbi/regions-power-bi-china-cloud). |        |

## Copilot and AI

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Attach reference to Copilot chat in the Power BI mobile app | Attach a report or semantic model to Copilot chat as a grounded reference. To add a reference, tap the + icon or type / to search and select your desired item. For more information, see [Chat with Copilot in Power BI](../create-reports/copilot-chat-with-data-standalone.md). |          |
| Updating Prepped for AI setting name to Approved for Copilot | The setting to mark a model as prepped for AI is renamed to better reflect its purpose and functionality. For more information, see [Mark your model as approved for Copilot](../create-reports/copilot-prepare-data-ai.md#mark-your-model-as-approved-for-copilot). |          |
| Standalone Copilot Access on Power BI Home | New standalone Copilot entry point on the Power BI Home page for faster access to insights. You can switch back to Recommended content using the picker at the top of the Home page. For more information, see [Chat with Copilot in Power BI](../create-reports/copilot-chat-with-data-standalone.md). |          |

## Reporting

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Field parameters persist hierarchy level setting | New report-level setting to restore pre-July 2025 behavior for field parameters' expansion and collapse of hierarchy levels. By default, hierarchy levels remain persistent, but you can turn off this feature. For more information, see [Let report readers use field parameters to change visuals](../create-reports/power-bi-field-parameters.md). |        |
| Format Pane Improvements | Enhanced color picker with reset to default and back button to return from custom colors to theme colors. Makes color customization more intuitive and efficient. Reset individual formatting groups without impacting the rest of the section or the whole visual with granular reset options. Provides finer control for report formatting. For more information, see [Get started formatting report visualizations](../visuals/service-getting-started-with-color-formatting-and-axis-properties.md). |          |
| Introducing Markers in Azure Maps Visual | New Markers capability for Azure Maps Visual allows customized icons, varying sizes, and advanced formatting features to improve narrative clarity in geospatial analysis. Available in the next few weeks. For more information, see [Azure Maps visual for Power BI](/azure/azure-maps/power-bi-visual-getting-started?context=/power-bi/create-reports/context/context). |        |
| Modern Visual Tooltips (Generally Available) | **Now generally available**. Enhanced tooltips with drill actions footer for drilling down, up, or through data points directly from the tooltip. Automatically match report theme colors with customization options. For more information, see [Create Visual Tooltips](../create-reports/desktop-tooltips.md). |        |
| Column Sizing Update in Tables and Matrices | Columns are now sized by default based on content they contain, making tables and matrices more compact and easier to read. You can still use **Grow to Fit** to expand columns when needed. For more information, see [Create a table visualization](../visuals/power-bi-visualization-tables.md) and [Create matrix visualizations](../visuals/power-bi-visualization-matrix-visual.md). |        |

## Modeling

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Updates on Editing Semantic Models in the Power BI Service | Models configured with incremental refresh can now be opened and edited in the Power BI Service. Note that you can't download these models as PBIX files, and Power Query editor isn't available for web editing. For more information, see [Edit semantic models in the Power BI service](../transform-model/service-edit-data-models.md). |        |
| Chinese coded character set (GB18030-2022) support | Power BI can be configured to respect GB18030‑2022 encoding using the **UnicodeCharacterBehavior** setting via XMLA command. Ensures compliance with China's national character set requirements and affects DAX text functions like FIND, LEFT, LEN, MID, REPLACE, and RIGHT. |        |

## Developers and APIs

| Feature | Description | Currently in preview |
|---------|-------------|:------:|
| Power BI Enhanced Report Format (PBIR) as Default Format | PBIR is activated by default in the Power BI service as part of a phased rollout (full availability by the end of February). The March release sets PBIR as the default in Power BI Desktop. General Availability is planned for Q3 2026. For more information, see [Power BI Project (PBIP) and Azure DevOps](../developer/projects/projects-azdo.md). | ✔️ |

## Visualizations

| Feature | Description | Currently in preview |
|---------|-------------|:--------:|
| Funnel Chart by Powerviz | Power BI-certified visual with four chart types in one visual for tracking progress through stages. Features include funnel settings, seven color schemes with more than 30 palettes, conversion rate analysis, fill patterns, conditional formatting, ranking, annotation, and grid view. Useful for sales funnel analysis, marketing campaigns, user onboarding, and website traffic. Available on AppSource. |          |

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

> **Download** the [January 2026 version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

## Past updates

Find previous monthly Power BI updates in the [Power BI monthly updates archive](desktop-latest-update-archive.md).
