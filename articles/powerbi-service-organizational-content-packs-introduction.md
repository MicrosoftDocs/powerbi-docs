<properties 
   pageTitle="Organizational content packs: An introduction"
   description="Organizational content packs: An introduction"
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/14/2015"
   ms.author="maggies"/>
# Organizational content packs: An introduction

Package up and share your own dashboard, reports, and datasets with your coworkers.  Do you regularly distribute reports via email to your team? Try this instead: Create dashboards and reports in Power BI and publish them as a content pack to your team. Content packs are easy to find -- they are all in the content pack library. Because they're part of Power BI, they leverage all the features of Power BI, including interactive data exploration, new visualizations, Q&A, integration with other data sources, data refresh, and more.

>**NOTE**:  Organizational content packs are only available when you and your colleagues have [Power BI Pro](powerbi-power-bi-pro-content-what-is-it.md).

In the Content Pack Library, you can browse or search for content packs published to the entire organization,  to distribution or security groups, and to [Office 365 groups you belong to](powerbi-service-groups.md).  If you are not a member of a specific group, you will not see that group's content packs. All members of the group have the same access and view of the content pack data, reports, and dashboards (unless it's an SSAS data source, in which case your privileges are inherited with the data source).

By default, the dashboards and reports are read-only but members can unlock and use them as a starting point for customizing their own reports and dashboards.  Once you edit a content pack, you now have a personalized version of the content pack.

All group members see the same data (unless it's an SSAS data source, in which case privileges are inherited with the data source).

This is different from [dashboard sharing](powerbi-service-share-unshare-dashboard.md), which gives read-only access to a dashboard and associated reports. Read [How should I share my dashboard?](powerbi-service-how-should-i-share-my-dashboard.md) to decide on the best for your situation. 

## The life cycle of an organizational content pack

Any Power BI Pro user can create, publish, and access organizational content packs. Only the content pack creator can modify the dataset and schedule refresh.

The lifecycle looks something like this:

1. In Power BI Pro, Nate creates a content pack and publishes it to the Marketing group. The refresh settings are inherited with the dataset and can only be changed by Nate.

2. Nate sends mail to the group, telling them about the new content pack.

3. In Power BI, Jane, a member of the Marketing group, searches for and connects to this content pack in the library. She now has a read-only copy.  She knows it's read-only because in the left Navigation Pane, there is a sharing icon to the left of the dashboard name and report name. And when she selects the dashboard, a lock icon lets Jane know she is looking at a content pack dashboard. Optionally, she can customize it and now has her own copy of the dashboard and reports. Her work does not affect the source, the original content pack, or other group members. She is now working on her own copy of the dashboard and report.

4. Nate makes updates to the dashboard and, when it's ready, publishes a new version of the content pack.

5. If Jane has not customized the original content pack, then the new changes are automatically applied.  If Jane has customized the content pack, she receives a notification that there is a new version.  She can navigate to the content pack library and get the updated content pack without losing her personalized version.  She'll now have 2 versions: her personalized version and the updated content pack.

6. Nate changes the security settings and Jane no longer has access to the content. Or, Jane is removed from the Marketing group.

7. If Jane has not customized the original content pack, then the content is automatically removed. If Jane has customized the content pack, the next time she opens the dashboard all tiles from the original content pack will be gone.  But tiles she pinned from other reports (that she still has permission to use) still render. The associated reports and dataset and will no longer be available (and won't appear in her Navigation pane).

8. Nate deletes the content pack.

9. If Jane has not customized the original content pack, then the content is automatically removed. If Jane has customized the content pack, the next time she opens the dashboard all tiles from the original content pack will be gone.  But tiles she pinned from other reports still render. The associated reports and dataset will no longer be available (and won't appear in her Navigation Pane).

  
## What is a Power BI *content pack library*?

Publishing an organizational content pack adds it to the content pack gallery.  This centralized repository makes it easy for members to browse and discover dashboards, reports, and datasets published for them.  

- To view the content pack library, select **Get Data** > **My Organization**.

## Data security

All group members have the same permissions to the data as the content pack creator.  The one exception to this is SSAS on-prem tabular datasets.  Since the reports and dashboards are connecting live to the on-prem SSAS model, the credentials of each individual group member are used to determine which data he or she can access.

## See also

-   [Create and publish an organizational content pack](powerbi-service-organizational-content-pack-tutorial-create-and-publish.md).
-   [Find and open an organizational content pack](powerbi-service-organizational-content-pack-find-and-open.md).
-   [Manage, update, and delete an organizational content pack](powerbi-service-organizational-content-packs-manage-update-delete.md).
-   [What is a Power BI group?](powerbi-service-groups.md)
-   [Get Started with Power BI](powerbi-service-get-started.md)
-  [Power BI - Basic Concepts](powerbi-service-basic-concepts.md)


