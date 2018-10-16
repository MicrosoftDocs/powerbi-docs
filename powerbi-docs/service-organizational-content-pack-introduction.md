---
title: Intro to organizational content packs in Power BI
description: Read about packaging up your dashboards, reports, Excel workbooks, and datasets into organizational content packs you can share with your coworkers.
author: maggiesMSFT
manager: kfile
ms.reviewer: lukaszp

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 08/02/2018
ms.author: maggies

LocalizationGroup: Share your work
---
# Intro to organizational content packs in Power BI
> [!NOTE]
> You can't create organizational content packs or install them in the new workspace experiences preview. Now is a good time to upgrade your content packs to apps, if you haven't started yet. Learn [more about the new workspace experience](service-create-the-new-workspaces.md).
> 

Do you regularly distribute reports by email to your team? Try this instead: Package up your dashboards, reports, Excel workbooks, and datasets and publish them to your team as an *organizational content pack*. Content packs you create are easy for your team to find &#151; they are all in AppSource. Because they're part of Power BI, they leverage all the features of Power BI, including interactive data exploration, new visuals, Q&A, integration with other data sources, data refresh, and more.

![](media/service-organizational-content-pack-introduction/power-bi-org-content-packs.png)

Creating content packs is different from sharing dashboards or collaborating on them in an app workspace. Read [How should I collaborate on and share dashboards and reports?](service-how-to-collaborate-distribute-dashboards-reports.md) to decide on the best option for your situation. 

In AppSource, you can browse or search for content packs published to the entire organization, to distribution or security groups, and to [Office 365 groups you belong to](https://support.office.com/article/Create-a-group-in-Office-365-7124dc4c-1de9-40d4-b096-e8add19209e9). If you aren't a member of a specific group, you won't see content packs shared with that group. All members of the group have the same read-only access to the content pack data, reports, workbooks, and dashboards (unless it's a SQL Server Analysis Services (SSAS) data source, in which case your privileges are inherited with the data source).

The dashboards, reports, and Excel workbooks are read-only, but you can copy and use the dashboards and reports as a starting point for creating your own personalized version of the content pack.

> [!NOTE]
> Organizational content packs are only available when you and your colleagues have [Power BI Pro licenses](service-features-license-type.md).
> 
> 

## What is *AppSource*?
Publishing an organizational content pack adds it to AppSource.  This centralized repository makes it easy for members to browse and discover dashboards, reports, and datasets published for them.  

* To view AppSource, select **Get Data** > **My Organization** > **Get**.

Read more about [finding and opening organizational content packs](consumer/end-user-content-pack.md).

## The life cycle of an organizational content pack
Any Power BI Pro user can create, publish, and access organizational content packs. Only the content pack creator can modify the workbook and dataset, schedule refresh, and delete it.

The lifecycle looks something like this:

1. In Power BI Pro, Nate creates a content pack and publishes it to the Marketing distribution group. The refresh settings are inherited with the dataset and can only be changed by Nate.
   
   > [!NOTE]
   > If Nate creates the content pack from within a [Power BI app workspace](service-create-distribute-apps.md) he belongs to, then even if he leaves the workspace, others in the Power BI workspace can take over ownership.
   > 
   > 
2. Nate sends mail to the distribution group, telling them about the new content pack.
3. In Power BI Pro, Jane, a member of the Marketing distribution group, searches for and connects to this content pack in AppSource. She now has a read-only copy.  She knows it's read-only because in the left Navigation Pane, there is a sharing icon to the left of the dashboard name and report name. And when she selects the dashboard, a lock icon lets Jane know she is looking at a content pack dashboard. 
4. Say she decides to customize it. She now has her own copy of the dashboard and reports. Her work does not affect the source, the original content pack, or other distribution group members. She is now working on her own copy of the dashboard and report.
5. Nate makes updates to the dashboard and when it's ready, he publishes a new version of the content pack.
   
   * Julio, another distribution group member, didn't customize the original content pack. The new changes are automatically applied to his version of the content pack.  
   * Jane did customize the content pack. She receives a notification that there's a new version.  She can go to AppSource and get the updated content pack without losing her personalized version. She'll now have two versions: her personalized version and the updated content pack.
6. Say Nate changes the security settings. Julio and Jane no longer have access to the content. Or say they're removed from the Marketing distribution group.
   
   * Julio didn't customize the original content pack, so the content is automatically removed. 
   * Jane did customize the content pack. The next time she opens the dashboard all tiles from the original content pack are gone, but tiles she pinned from other reports (that she still has permission to use) still appear. The associated reports and dataset are no longer available (and don't appear in her left navigation pane).
7. Or Nate deletes the content pack.
   
   * Julio didn't customize the original content pack, so the content is automatically removed. 
   * Jane did customize the content pack. The  next time she opens the dashboard all tiles from the original content pack are gone, but tiles she pinned from other reports still appear. The associated reports and dataset are no longer available (and don't appear in her left navigation pane).

## Data security
All distribution group members have the same permissions to the data as the content pack creator. The one exception to this is SQL Server Analysis Services (SSAS) on-premises tabular datasets. Because the reports and dashboards are connecting live to the on-premises SSAS model, the credentials of each individual distribution group member are used to determine the data he or she can access.

## Next steps
* [Create and publish an organizational content pack](service-organizational-content-pack-create-and-publish.md)
* [Create and distribute an app in Power BI](service-create-distribute-apps.md) 
* [Power BI - Basic Concepts](consumer/end-user-basic-concepts.md)
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

