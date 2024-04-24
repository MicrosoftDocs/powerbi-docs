---
title: Feature availability for users with Free licenses in the Power BI service
description: Explanation and chart showing features available to consumers and Free users.
author: haydnr
ms.author: haydnr
ms.reviewer:  mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: conceptual
ms.date: 11/18/2022
ms.custom: licensing support
LocalizationGroup: consumers
---

# Interact with the Power BI service as a *Free user*

[!INCLUDE[consumer-appliesto-ynnn](../includes/consumer-appliesto-ynnn.md)]

As a Power BI service user with a free license, you explore content (such as reports, apps, scorecards, dashboards, and more) in order to make business decisions. That content is created by *designers* who have Power BI Pro or Premium Per User (PPU) licenses. In order to share it with users with free licenses, designers need to publish that content to a group workspace backed by a Premium capacity. Premium capacity provides the benefit of unlimited content sharing. Sometimes, designers share content by sending you links to content such as a Power BI app [Apps in the Power BI service](end-user-apps.md), and sometimes the [content automatically installs](end-user-apps.md) and appears in Power BI under **Apps** or **Browse** > **Shared with me**.

There are many different ways designers can share content. But this article is for Power BI users with a free license, and therefore only describes how "free users" receive and interact with content. For more information on other ways to share content, see [Ways to share your work in Power BI](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md).

![Power BI navigation pane](media/end-user-features/power-bi-shared.png)

In the [previous article](end-user-license.md), you learned that what you can do with dashboards, reports, and apps (content) in the Power BI service depends on three things: your licenses, your [roles](../collaborate-share/service-roles-new-workspaces.md) and [permissions](../connect-data/service-datasets-permissions.md), and where content is stored.

This article lists which features in the Power BI service are available to users with Free licenses. 

> [!NOTE]
> In sovereign cloud environments with Power BI Premium capacity, all users can view content without needing an assigned license.  

## Quick review of terminology

Let's review some Power BI concepts before we get to the list. This will be a quick review and if you need more details, visit [Licenses for consumers](end-user-license.md) or [Power BI basic concepts](end-user-basic-concepts.md).

### Workspaces and roles

Collaborating and sharing in workspaces requires that workspace owners, who have Pro or Premium Per User (PPU) licenses, assign you a *role* in that [workspace](../collaborate-share/service-roles-new-workspaces.md).

Roles determine who can do what in that workspace. Free users are assigned the **Viewer** role. Being assigned any other role requires that a free user upgrade to Pro or PPU. 

### Premium capacity

When an organization has a Premium capacity subscription, admins and Pro users can assign workspaces to the Premium capacity. Content in workspaces hosted in Premium capacity can be accessed by users with any Power BI license as long as they have appropriate permissions to access the content.

### Licenses

Each Power BI service user has at least one of the following: a free license, a Power BI Pro license, a Premium Per user license. As long as your colleagues use Premium capacity workspaces to share content, free users can view and interact with that content.

To find out what type of license is assigned to your account, select your profile picture from the page header in [Power BI service](https://app.powerbi.com). If **Pro account** or **Premium Per User account** is displayed, you can share content with other users. When **Free** is shown, you can only create content in My Workspace and consume content that is hosted in a Premium workspace. Select **View account** to see more details about your account.

   :::image type="content" source="media/end-user-features/power-bi-licenses.png" alt-text="Screenshot showing license type displayed with account profile.":::

## Power BI feature list for users with a free license

The following chart identifies which tasks can be performed by a user with a **free** license interacting with content in their own **My Workspace** or in **Premium** capacity.

The first column represents a free user only working with content in **My workspace**. This user cannot collaborate with colleagues in the Power BI service. Colleagues cannot directly share content with this user, and this user cannot share from **My workspace**.

The second column represents a free user working with content in a workspace that is saved in Premium capacity.  This free user:

- has a free user license type
- is part of an organization that has a Premium capacity subscription
- gets content (apps, dashboards, reports, etc.) from Pro or PPU users who share that content using group workspaces in Premium capacity.
- is assigned the **Viewer** role to those app workspaces.

> [!NOTE]
> Content hosted in a PPU workspace can only be used by users with PPU licenses.  

### Legend

![green dot](media/end-user-license/power-bi-green-dot.png)  feature is available in the current scenario    
![orange x](media/end-user-features/orange-x.png)  feature is not available in the current scenario    
 **![green mw](media/end-user-features/green-mwo.png)** feature availability is limited to **My workspace**. Content in **My workspace** is for the owner's personal use and cannot be viewed by anyone else in Power BI.    
 \*  access to this feature can be turned on or off by a Pro user or an admin.    
 <br><br>

### Feature list

|Features   | Scenario 1: Power BI Free user who has no access to content hosted in Premium capacity.    | Scenario 2: Power BI Free user with **Viewer** permissions to content stored in Premium capacity.  |
|---|---|---|
|**Apps** 
|Installs automatically | ![orange x](media/end-user-features/orange-x.png) | ![green dot](media/end-user-license/power-bi-green-dot.png)*| 
|Open | ![orange x](media/end-user-features/orange-x.png) | ![green dot](media/end-user-license/power-bi-green-dot.png)  | 
|Favorite | ![orange x](media/end-user-features/orange-x.png) | ![green dot](media/end-user-license/power-bi-green-dot.png)  |
 |Edit, update, republish |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)   |
 |Create new app |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)   |
 |AppSource: download and open | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|Organization store: download and open|![orange x](media/end-user-features/orange-x.png)  |![green dot](media/end-user-license/power-bi-green-dot.png)  |
| Reshare an app | ![orange x](media/end-user-features/orange-x.png)  | ![green dot](media/end-user-license/power-bi-green-dot.png)  |
 |**Workspaces in Premium capacity**
| Create, edit, or delete workspace or content  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |
|Add endorsements | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|Open and view  |  ![orange x](media/end-user-features/orange-x.png) |  ![green dot](media/end-user-license/power-bi-green-dot.png)  | 
| Read data stored in workspace dataflows |![orange x](media/end-user-features/orange-x.png) |![green dot](media/end-user-license/power-bi-green-dot.png)|
|**Dashboards**
|Receive, view, and interact with dashboards from colleagues | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](media/end-user-license/power-bi-green-dot.png)  | 
| Add alerts to tiles  |  ![green myw](media/end-user-features/green-mwo.png) |  ![green dot](media/end-user-license/power-bi-green-dot.png)  | 
| View and respond to comments from others: add your own comments  |  ![orange x](media/end-user-features/orange-x.png) |  ![green dot](media/end-user-license/power-bi-green-dot.png)*  | 
| Save a copy | ![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) | 
|Copy visual as an image? |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png)|
|Create, edit, update, delete | ![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) | 
|Export tile to .csv |![green myw](media/end-user-features/green-mwo.png) | ![green dot](media/end-user-license/power-bi-green-dot.png)|
|Favorite |![green myw](media/end-user-features/green-mwo.png)| ![green dot](media/end-user-license/power-bi-green-dot.png)|
|Full screen and focus modes |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|Global search |![green dot](media/end-user-license/power-bi-green-dot.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
|Insights on tiles |![green myw](media/end-user-features/green-mwo.png)     | ![green dot](media/end-user-license/power-bi-green-dot.png)*|
|  Q&A: use on dashboard  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
|Q&A: add featured and saved questions | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |
|Q&A: review asked questions | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |  
|Pin tiles from Q&A or reports | ![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) | 
|Print |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
|Refresh | ![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) | 
|Reshare | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|Subscribe yourself |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)*  |
|Subscribe others | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|View dashboards that have been embedded into PowerApps or SharePoint pages | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](media/end-user-license/power-bi-green-dot.png)  | 
|**Datasets**
|  Add, delete, edit  |  ![green myw](media/end-user-features/green-mwo.png)  |  ![orange x](media/end-user-features/orange-x.png) |   
| Create a report in another workspace based on a dataset in this workspace | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) |      
|  Insights on datasets  | ![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)| 
|Schedule refresh |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)|
|Analyze in Excel |![green myw](media/end-user-features/green-mwo.png)  |![green dot](media/end-user-license/power-bi-green-dot.png)*|
|Create a report |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)|
|Create a paginated report |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png)|
|Share |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)|
|Manage permissions |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)|
|Save a copy |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)|
|Create from template |![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png)| 
|**Reports**
|Receive reports from colleagues | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](media/end-user-license/power-bi-green-dot.png)  | 
| Analyze report in Excel  |![green myw](media/end-user-features/green-mwo.png)*  |![green dot](media/end-user-license/power-bi-green-dot.png)*  | 
| View bookmarks created by others, and add your own bookmarks  | ![orange x](media/end-user-features/orange-x.png)|![green dot](media/end-user-license/power-bi-green-dot.png)  |
| View and respond to comments from others: add new comments  | ![orange x](media/end-user-features/orange-x.png)|![green dot](media/end-user-license/power-bi-green-dot.png)  |
|Change display dimensions   | ![green myw](media/end-user-features/green-mwo.png) | ![green dot](media/end-user-license/power-bi-green-dot.png)  | 
| Save a copy |![orange x](media/end-user-features/orange-x.png) |![orange x](media/end-user-features/orange-x.png)  
|Copy visual as an image* |
| Cross-highlight and cross-filter report visuals   |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png)  |
|  Drill   |![green myw](media/end-user-features/green-mwo.png)  |![green dot](media/end-user-license/power-bi-green-dot.png)  |
| Drillthrough |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
|  Embed (publish to web, public) | ![green myw](media/end-user-features/green-mwo.png)* |![orange x](media/end-user-features/orange-x.png) |  
|  Export summarized data from report visuals*  |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|Export underlying data from report visuals* | ![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png)  | 
|  Favorite the report  |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Filters: change types  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
|  Filters: interact   |![green myw](media/end-user-features/green-mwo.png)|![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Filters: persistent  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
| Search on the filter pane |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
| Full screen and focus modes   |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Insights on reports<sup>1</sup>  | ![green myw](media/end-user-features/green-mwo.png)  |![green dot](media/end-user-license/power-bi-green-dot.png)| 
| Lineage view  |![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) |
|Export to PDF* |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png)  |
|Performance Inspector |![green myw](media/end-user-features/green-mwo.png)|![green dot](media/end-user-license/power-bi-green-dot.png) |
| Export to PowerPoint*   |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Promote content to Home  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
| Print report pages* |![green dot](media/end-user-license/power-bi-green-dot.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|Interact with Q&A visual |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|QR Code |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Refresh  |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Share content with external users  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
| Share: allow others to reshare items | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|Show as table (show data)|![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Slicers: add or delete  |![green myw](media/end-user-features/green-mwo.png) |![orange x](media/end-user-features/orange-x.png) |
| Interact with slicers |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Sort report visuals  |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Subscribe yourself to reports* |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|  Subscribe others to reports  | ![orange x](media/end-user-features/orange-x.png)  |![orange x](media/end-user-features/orange-x.png) | 
|  View related |![green myw](media/end-user-features/green-mwo.png) |![green dot](media/end-user-license/power-bi-green-dot.png) |
|View reports that have been embedded into PowerApps or SharePoint pages | ![orange x](media/end-user-features/orange-x.png) |  ![green dot](media/end-user-license/power-bi-green-dot.png)  |
|  Visuals: change types in reports  |![green myw](media/end-user-features/green-mwo.png)* |![green dot](media/end-user-license/power-bi-green-dot.png)* |
|  Change visual interactions  |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png) |
|  Visuals: add new  |![green myw](media/end-user-features/green-mwo.png)  |![orange x](media/end-user-features/orange-x.png) |
|  Visuals: add new fields  |![green myw](media/end-user-features/green-mwo.png)   |![orange x](media/end-user-features/orange-x.png) |
|Visuals: change type |![green myw](media/end-user-features/green-mwo.png)  |![green dot](media/end-user-license/power-bi-green-dot.png) |
| Visuals: hover to reveal details and tooltips  |![green myw](media/end-user-features/green-mwo.png)  |![green dot](media/end-user-license/power-bi-green-dot.png) |

## Related content

- [Power BI for *business users*](end-user-consumer.md)    
