---
title: Feature availability for Free users in Power BI service
description: Detailed explanation and comprehensive chart showing features available to consumers and Free users in the Power BI service.
author: julcsc
ms.author: juliacawthra 
ms.reviewer: haydnr
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: concept-article
ms.date: 11/14/2025
ms.custom: licensing support
ai-usage: ai-assisted
LocalizationGroup: consumers
#customer intent: As a Fabric user I want to understand feature availability for the Power BI service.
---

# Interact with the Power BI service as a *Free user*

[!INCLUDE[consumer-appliesto-ynnn](../includes/consumer-appliesto-ynnn.md)]

As a Power BI service user with a free license, you explore content (such as reports, apps, scorecards, dashboards, and more) to make business decisions. That content is created by *designers* who have Power BI Pro or Premium Per User (PPU) licenses. To share it with free users, designers publish that content to a workspace on a qualifying capacity (Fabric F64+ or Premium). A qualifying capacity (Fabric F64+ or Premium P) enables free users to view content shared with them. Sometimes, designers share content by sending you links to content such as a Power BI app [Apps in the Power BI service](end-user-apps.md), and sometimes the [content automatically installs](end-user-apps.md) and appears in Power BI under **Apps** or **Browse** > **Shared with me**.

There are many different ways designers can share content. But this article is for Power BI users with a free license, and therefore only describes how "free users" receive and interact with content. For more information on other ways to share content, see [Ways to share your work in Power BI](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md).

> [!TIP]
> - For a list of Fabric features by SKU type, see [Microsoft Fabric features parity](/fabric/enterprise/fabric-features).
>
> - For a list of features that apply to all the Power BI Premium licenses, including Premium Per User (PPU) and Power BI Embedded, see [Power BI Premium features](/fabric/enterprise/powerbi/service-premium-features).

![Power BI navigation pane](media/end-user-features/power-bi-shared.png)

In [Licenses for consumers](../fundamentals/end-user-license.md), you learned that what you can do with dashboards, reports, and apps (content) in the Power BI service depends on three things: your licenses, your [roles](../collaborate-share/service-roles-new-workspaces.md) and [permissions](../connect-data/service-datasets-permissions.md), and where content is stored.

This article lists which features in the Power BI service are available to users with Free licenses. 

> [!NOTE]
> In sovereign cloud environments with capacity (Fabric F64+ or Premium), all users can view content without needing an assigned license. Behavior can vary by sovereign cloud region; consult regional documentation for any exceptions (see ‡ note below the feature table).  

## Quick review of terminology

Let's review some Power BI concepts before we get to the list. This will be a quick review and if you need more details, visit [Licenses for consumers](../fundamentals/end-user-license.md) or [Basics of the Power BI service](../fundamentals/service-basic-concepts.md).

### Workspaces and roles

Collaborating and sharing in workspaces requires that workspace owners, who have Pro or Premium Per User (PPU) licenses, assign you a *role* in that [workspace](../collaborate-share/service-roles-new-workspaces.md).

Roles determine who can do what in that workspace. Free users are assigned the **Viewer** role. Being assigned any other role requires that a free user upgrade to Pro or PPU. 

### Capacity: Fabric F64+ and Premium

When an organization has a qualifying capacity subscription (Fabric F64+ or Premium), admins and Pro/PPU users can assign workspaces to that capacity. Content in workspaces hosted on a qualifying capacity can be accessed by users with any Power BI license (including free) as long as they have appropriate permissions.

### Licenses

Each Power BI service user has at least one of the following: a free license, a Power BI Pro license, or a Premium Per User (PPU) license. As long as your colleagues use capacity workspaces (Fabric F64+ or Premium) to share content, free users can view and interact with that content.

To find out what type of license is assigned to your account, select your profile picture from the page header in [Power BI service](https://app.powerbi.com). If **Pro account** or **Premium Per User account** is displayed, you can share content with other users. When **Free** is shown, you can only create content in My Workspace and consume content that's hosted in a Premium workspace, unless the **Enable Microsoft Fabric for your organization** admin setting is enabled. When this setting is enabled, you can create Fabric content in capacity workspaces regardless of your license type. Select **View account** to see more details about your account.

   :::image type="content" source="media/end-user-features/power-bi-licenses.png" alt-text="Screenshot showing license type displayed with account profile.":::

## Power BI feature list for users with a free license

The following chart identifies which tasks can be performed by a user with a **free** license interacting with content in their own **My workspace** or in a workspace on a capacity (Fabric F64+ or Premium).

> [!TIP]
> - For a list of Fabric features by SKU type, see [Microsoft Fabric features parity](/fabric/enterprise/fabric-features).
> 
> - For a list of features that apply to all the Power BI Premium licenses, including Premium Per User (PPU) and Power BI Embedded, see [Power BI Premium features](/fabric/enterprise/powerbi/service-premium-features).

The first column represents a free user only working with content in **My workspace**. This user cannot collaborate with colleagues in the Power BI service. Colleagues cannot directly share content with this user, and this user cannot share from **My workspace**.

The second column represents a free user working with content in a workspace that is saved on a capacity (Fabric F64+ or Premium). This free user:

- has a free user license type
- is part of an organization that has a capacity subscription (Fabric F or Premium)
- gets content (apps, dashboards, reports, etc.) from Pro or PPU users who share that content using workspaces on capacity.
- is assigned the **Viewer** role to those app workspaces.

> [!NOTE]
> Content hosted in a PPU workspace can only be used by users with PPU licenses.  

### Legend

![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) Feature is available in the current scenario

![orange x](media/end-user-features/orange-x.png) Feature is not available in the current scenario

 **![green mw](media/end-user-features/green-mwo.png)** Feature availability is limited to **My workspace**. Content in **My workspace** is for the owner's personal use and cannot be viewed by anyone else in Power BI.

### Feature list

|Features   | Scenario 1: Free user who has no access to content hosted in capacity (Fabric F64+ or Premium).    | Scenario 2: Free user with **Viewer** permissions to content stored in capacity (Fabric F64+ or Premium).  |
|---|---|---|
|**Apps** |
|Installs automatically | ![orange x](media/end-user-features/orange-x.png) | ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)*|
|Open | ![orange x](media/end-user-features/orange-x.png) | ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
|Favorite | ![orange x](media/end-user-features/orange-x.png) | ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
 |Edit, update, republish |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)   |
 |Create new app |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)   |
 |AppSource: download and open | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |
|Organization store: download and open|![orange x](media/end-user-features/orange-x.png)  |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
| Reshare an app | ![orange x](media/end-user-features/orange-x.png)  | ![orange x](media/end-user-features/orange-x.png)  |
|**Workspaces on capacity (Fabric F64+ or Premium)** | | |
| Create, edit, or delete workspace or content  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |
|Add endorsements | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |
|Open and view  |  ![orange x](media/end-user-features/orange-x.png) |  ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
| Read data stored in workspace dataflows |![orange x](media/end-user-features/orange-x.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)|
|**Dashboards**
|Receive, view, and interact with dashboards from colleagues | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
| Add alerts to tiles  |  ![green myw](media/end-user-features/green-mwo.png) |  ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
| View and respond to comments from others: add your own comments  |  ![orange x](media/end-user-features/orange-x.png) |  ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)*  |
| Save a copy | ![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) |
|Copy visual as an image* |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)*|
|Create, edit, update, delete | ![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) |
|Export tile to .csv |![green myw](media/end-user-features/green-mwo.png) | ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)|
|Favorite |![green myw](media/end-user-features/green-mwo.png)| ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)|
|Full screen and focus modes |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|Global search |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
|Insights on tiles |![green myw](media/end-user-features/green-mwo.png)     | ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)*|
|  Q&A: use on dashboard  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
|Q&A: add featured and saved questions | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |
|Q&A: review asked questions | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |  
|Pin tiles from Q&A or reports | ![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) | 
|Print |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
|Refresh | ![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) | 
|Reshare | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|Subscribe yourself |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)*  |
|Subscribe others | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|View dashboards that have been embedded into PowerApps or SharePoint pages | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  | 
|**Datasets**
|  Add, delete, edit  |  ![green myw](media/end-user-features/green-mwo.png)  |  ![orange x](media/end-user-features/orange-x.png) |   
| Create a report in another workspace based on a dataset in this workspace | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
| Create a report in "My Workspace" using a dataset located in a Fabric Capacity Workspace |![orange x](media/end-user-features/orange-x.png) | ![orange x](media/end-user-features/orange-x.png)|
|  Insights on datasets  | ![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)| 
|Schedule refresh |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)|
|Analyze in Excel† |![green myw](media/end-user-features/green-mwo.png)  |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)|
|Create a report |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)|
|Create a paginated report |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)|
|Share |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)|
|Manage permissions |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)|
|Save a copy |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)|
|Create from template |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)| 
|**Reports**
|Receive reports from colleagues | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  | 
| Analyze report in Excel† |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
| View bookmarks created by others, and add your own bookmarks  | ![orange x](media/end-user-features/orange-x.png)|![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
| View and respond to comments from others: add new comments  | ![orange x](media/end-user-features/orange-x.png)|![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
|Change display dimensions   | ![green myw](media/end-user-features/green-mwo.png) | ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  | 
| Save a copy |![orange x](media/end-user-features/orange-x.png) |![orange x](media/end-user-features/orange-x.png)  
|Copy visual as an image* |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)*|
| Cross-highlight and cross-filter report visuals   |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
|  Drill   |![green myw](media/end-user-features/green-mwo.png)  |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
| Drillthrough |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
|  Embed (publish to web, public)§ | ![orange x](media/end-user-features/orange-x.png) |![orange x](media/end-user-features/orange-x.png) |  
|  Export summarized data from report visuals*  |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|Export underlying data from report visuals* | ![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  | 
|  Favorite the report  |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Filters: change types  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
|  Filters: interact   |![green myw](media/end-user-features/green-mwo.png)|![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Filters: persistent  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
| Search on the filter pane |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
| Full screen and focus modes   |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Insights on reports  | ![green myw](media/end-user-features/green-mwo.png)  |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)|
| Lineage view  |![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) |
|Export to PDF* |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
|Performance Inspector |![green myw](media/end-user-features/green-mwo.png)|![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
| Export to PowerPoint*   |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Promote content to Home  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
| Print report pages* |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|Interact with Q&A visual |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|QR Code |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Refresh  |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Share content with external users  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
| Share: allow others to reshare items | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|Show as table (show data)|![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Slicers: add or delete  |![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) |
| Interact with slicers |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Sort report visuals  |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Subscribe yourself to reports* |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|  Subscribe others to reports  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|  View related |![green myw](media/end-user-features/green-mwo.png) |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
|View reports that have been embedded into PowerApps or SharePoint pages | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)  |
|  Visuals: change types in reports  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png)* |
|  Change visual interactions  |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png) |
|  Visuals: add new  |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png) |
|  Visuals: add new fields  |![green myw](media/end-user-features/green-mwo.png)   |![orange x](media/end-user-features/orange-x.png) |
|Visuals: change type |![green myw](media/end-user-features/green-mwo.png)  |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |
| Visuals: hover to reveal details and tooltips  |![green myw](media/end-user-features/green-mwo.png)  |![green dot](../fundamentals/media/end-user-license/power-bi-green-dot.png) |

*\* An admin or tenant setting can enable or disable the feature for some or all users.*

*† Analyze in Excel (and related Excel live connection experiences) also requires Build permission on the semantic model and the relevant tenant settings to be enabled.*

*‡ Sovereign (national/regional) cloud behavior can differ; some capabilities may lag or have alternate licensing enforcement.*

*§ Publish to web embed code creation requires Pro or PPU. Free users cannot create embed codes; anyone can view an already-published public link (subject to admin enablement and governance policies).*

## Related content

- [Power BI for *business users*](end-user-consumer.md)
