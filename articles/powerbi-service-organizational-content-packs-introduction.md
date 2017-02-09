<properties 
   pageTitle="Intro to organizational content packs in Power BI"
   description="Read about packaging up your dashboards, reports, Excel workbooks, and datasets into organizational content packs you can share with your coworkers."
   services="powerbi" 
   documentationCenter="" 
   authors="ajayan" 
   manager="erikre" 
   backup="maggiesMSFT"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/07/2017"
   ms.author="ajayan"/>
# Intro to organizational content packs in Power BI

Do you regularly distribute reports by email to your team? Try this instead: Package up your dashboards, reports, Excel workbooks, and datasets and publish them to your team as a content pack. Content packs are easy to find &#151; they are all in the content pack library. Because they're part of Power BI, they leverage all the features of Power BI, including interactive data exploration, new visuals, Q&A, integration with other data sources, data refresh, and more.

Creating content packs is different from sharing dashboards or collaborating on them in a group. Read [How should I share my dashboard?](powerbi-service-how-should-i-share-my-dashboard.md) to decide on the best option for your situation. 

In the Content Pack Library, you can browse or search for content packs published to the entire organization, to distribution or security groups, and to [Office 365 groups you belong to](https://support.office.com/article/Create-a-group-in-Office-365-7124dc4c-1de9-40d4-b096-e8add19209e9). If you aren't a member of a specific group, you won't see content packs shared with that group. All members of the group have the same read-only access to the content pack data, reports, workbooks, and dashboards (unless it's a SQL Server Analysis Services (SSAS) data source, in which case your privileges are inherited with the data source).

The dashboards, reports, and Excel workbooks are read-only, but as a member of the group, you can copy and use the dashboards and reports as a starting point for creating your own personalized version of the content pack.

>**Note**:  Organizational content packs are only available when you and your colleagues have [Power BI Pro](powerbi-power-bi-pro-content-what-is-it.md).

## What is the Power BI *Content Pack Library*?

Publishing an organizational content pack adds it to the Content Pack Library.  This centralized repository makes it easy for members to browse and discover dashboards, reports, and datasets published for them.  

- To view the Content Pack Library, select **Get Data** > **My Organization** > **Get**.

Read more about [finding and opening organizational content packs](powerbi-service-organizational-content-pack-find-and-open.md).

## The life cycle of an organizational content pack

Any Power BI Pro user can create, publish, and access organizational content packs. Only the content pack creator can modify the workbook and dataset, schedule refresh, and delete it.

The lifecycle looks something like this:

1. In Power BI Pro, Nate creates a content pack and publishes it to the Marketing group. The refresh settings are inherited with the dataset and can only be changed by Nate.

    >Note: If Nate creates the content pack from within a [Power BI group](powerbi-service-create-a-group-in-power-bi.md) he belongs to, then even if he leaves the group, others in the Power BI group can take over ownership.

2. Nate sends mail to the group, telling them about the new content pack.

3. In Power BI Pro, Jane, a member of the Marketing group, searches for and connects to this content pack in the library. She now has a read-only copy.  She knows it's read-only because in the left Navigation Pane, there is a sharing icon to the left of the dashboard name and report name. And when she selects the dashboard, a lock icon lets Jane know she is looking at a content pack dashboard. 

5. Say she decides to customize it. She now has her own copy of the dashboard and reports. Her work does not affect the source, the original content pack, or other group members. She is now working on her own copy of the dashboard and report.

4. Nate makes updates to the dashboard and when it's ready, he publishes a new version of the content pack.

  - Julio, another group member, didn't customize the original content pack. The new changes are automatically applied to his version of the content pack.  

 - Jane did customize the content pack. She receives a notification that there's a new version.  She can navigate to the content pack library and get the updated content pack without losing her personalized version. She'll now have two versions: her personalized version and the updated content pack.

6. Say Nate changes the security settings. Julio and Jane no longer have access to the content. Or say they're removed from the Marketing group.

 -  Julio didn't customize the original content pack, so the content is automatically removed. 
 
 -  Jane did customize the content pack. The next time she opens the dashboard all tiles from the original content pack are gone, but tiles she pinned from other reports (that she still has permission to use) still appear. The associated reports and dataset are no longer available (and don't appear in her left navigation pane).

8. Or Nate deletes the content pack.

 -  Julio didn't customize the original content pack, so the content is automatically removed. 
 -  Jane did customize the content pack. The  next time she opens the dashboard all tiles from the original content pack are gone, but tiles she pinned from other reports still appear. The associated reports and dataset are no longer available (and don't appear in her left navigation pane).

## Data security

All group members have the same permissions to the data as the content pack creator. The one exception to this is SSAS on-premises tabular datasets. Because the reports and dashboards are connecting live to the on-premises SSAS model, the credentials of each individual group member are used to determine which data he or she can access.

## See also

-   [Create and publish an organizational content pack](powerbi-service-organizational-content-pack-tutorial-create-and-publish.md)
-   [Find and open an organizational content pack](powerbi-service-organizational-content-pack-find-and-open.md)
-   [Manage, update, and delete an organizational content pack](powerbi-service-organizational-content-packs-manage-update-delete.md)
-   [Create a group in Power BI](powerbi-service-create-a-group-in-power-bi.md)
-  [Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
- More questions? [Try the Power BI Community](http://community.powerbi.com/)


