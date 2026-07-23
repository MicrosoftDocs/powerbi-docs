---
title: Manage semantic model settings in the settings pane
description: Learn how to use the semantic model settings pane in the Power BI service to configure refresh, credentials, gateways, and other model settings from a side pane.
author: kgremban
ms.author: kgremban
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 04/21/2026
ai-usage: ai-assisted
#customer intent: As a Power BI semantic model owner, I want to manage semantic model settings from a side pane so that I can review and change settings without leaving the page I'm working on.
---

# Manage semantic model settings in the settings pane (Preview)

**Applies to:** [!INCLUDE [applies-to-service](../includes/applies-to-version/service.md)]

The semantic model settings pane is a side pane in the Power BI service that you use to review and change settings for a semantic model without leaving your current page. The pane opens on the right side of the browser window, keeps the surrounding context visible, and provides the same settings that are on the full semantic model settings page.

> [!NOTE]
> The semantic model settings pane is currently in preview. Features and behavior might change before general availability.

This article describes how to open the settings pane, what you can do in it, and how it differs from the full settings page.

## Open the settings pane

The settings pane isn't displayed by default. To display it, go to the semantic model's settings page in the Power BI service, such as by selecting **Settings** in the semantic models context menu. Then, select the **Open settings pane >>** link at the top of the settings page. The settings pane opens on the right side of the page.

## What you can do in the settings pane

The settings pane provides the same settings that you find on the semantic model settings page. The main pane groups settings into expandable sections, and the top of the pane organizes settings into tabs. Select a section or tab to view or change its settings. To quickly find a specific setting, use the search box at the top of the pane to search across all sections and tabs.

:::image type="content" source="./media/service-semantic-model-settings-pane/settings-pane.png" alt-text="Screenshot of the semantic model settings pane open on the right side of a semantic model page in the Power BI service.":::

The following table is a quick reference of the groups, sections, and settings available in the settings pane.

| Group | Section | Settings |
|---|---|---|
|  | About | Name, Description, Semantic model image, Connection string |
|  | Sensitivity label | Sensitivity label, Apply to downstream items |
|  | Endorsement | Endorsement, Make discoverable |
|  | Refresh | Refresh history, Direct Lake, Automatic dashboard tile and goal refresh, Configure a refresh schedule |
|  | Approved for Copilot | Approved for Copilot |
|  | Q&A | Q&A on/off, Configure featured questions |
|  | Data storage | Large semantic model storage format, OneLake integration |
|  | Sharing and access | External sharing, Request access |
|  | Tags | Tags |
| Data access | Gateway and cloud connections | Select the gateway and map semantic model data sources to gateway or cloud connections. |
| Data access | Data source credentials | Sign in to data sources, edit credentials, and set the privacy level for each connection. |
| Data access | M parameters | View and update the values of M parameters defined in the semantic model. |
| Data access | Granular access control for data connections | Control which users or roles can use specific data connections in the semantic model. |
| Performance | Query scale-out | Enable query scale-out and manage read-only replica synchronization for high-concurrency workloads. |
| Performance | Auto aggregations | Configure automatic aggregations training, query coverage, and query performance impact targets. |
| Performance | Query caching | Turn query caching on or off to improve performance for frequently run queries. |
| OneDrive and SharePoint | OneDrive refresh | Enable refresh from a semantic model whose source file is in OneDrive or SharePoint. |
| OneDrive and SharePoint | Sync mode | Choose how the semantic model syncs with the source file in OneDrive or SharePoint. |
| OneDrive and SharePoint | OneDrive credentials | Sign in to OneDrive or SharePoint and edit the credentials used to access the source file. |

## Switch to the settings page

If you prefer the full-page experience, select the **<< Open settings page** link at the bottom of the pane. The semantic model settings page opens in the same browser window.


## Permissions

To change settings for a semantic model, you need to be the model owner or have **Write** permission on the semantic model. Some settings, including scheduled refresh and data source credentials, can be configured only by the semantic model owner. For more information, see [Semantic model permissions](service-datasets-permissions.md).

## Related content

- [Configure scheduled refresh](refresh-scheduled-refresh.md)
- [Data refresh in Power BI](refresh-data.md)
- [Manage your data source - import/scheduled refresh](service-gateway-enterprise-manage-scheduled-refresh.md)
