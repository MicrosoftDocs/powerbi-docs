---
title: How Power BI ensures your content is up-to-date
description: Learn how Power BI ensures you are working with the latest version of the data, report, dashboard, and app.
author: mihart
manager: kvivek
ms.service: powerbi
ms.custom:  
ms.subservice: powerbi-service
ms.topic: overview
ms.date: 01/31/2019
ms.author: mihart

LocalizationGroup: Get started
# Customer intent: As a Power BI customer or potential customer, I want to be sure that I'm using the most-recent data and learn how to determine this.
---

Making sure you’re always getting the latest data is often critical in making the right decisions. You’ve probably already used Get Data in Power BI to connect to and upload some data, created some reports and a dashboard. Now, you want to make sure your data really is the latest and greatest.
In many cases, you don’t need to do anything at all. Some data, like from a Salesforce or Marketo content pack is automatically refreshed for you. If your connection makes use of a live connection or DirectQuery, the data will be update to date. But, in other cases, like with an Excel workbook or Power BI Desktop file that connects to an external online or on-premises data source, you’ll need to refresh manually or setup a refresh schedule so Power BI can refresh the data in your reports and dashboards for you.

Whenever you refresh data in a dataset, whether by using Refresh Now or by setting up a refresh schedule, Power BI uses information in the dataset to connect to the data sources defined for it, query for updated data, and then loads the updated data into the dataset. Any visualizations in your reports or dashboards based on the data are updated automatically.

Tile refresh updates the cache for tile visuals, on the dashboard, once data changes. This happens about every fifteen minutes. You can also force a tile refresh by selecting the ellipsis (...) in the upper right of a dashboard and selecting Refresh dashboard tiles. For details around common tile refresh errors, see Troubleshooting tile errors.

Visual container refresh
Refreshing the visual container updates the cached report visuals, within a report, once the data changes.

refresh-troubleshooting-tile-errors.md

When the content pack is created, the refresh settings are inherited with the dataset. When you create a copy of the content pack, the new version retains its link to the original dataset and its refresh schedule.
When you make and save a change to the dashboard that you included in a content pack, Power BI reminds you to update it so others can see the changes. 
For group members who haven't customized the content pack, the update is automatically applied.
Group members who have customized the content pack receive a notification that there is a new version. They can go to AppSource and get the updated content pack without losing their personalized version. They'll now have 2 versions: the personalized version and the updated content pack. In the personalized version, all tiles from the original content pack will be gone. But tiles pinned from other reports will still render. However, if the content pack owner deletes the dataset the content pack is based on, then the whole report will be gone.

As the content pack creator, you can schedule refresh of the datasets. When you create and upload the content pack, that refresh schedule is uploaded with the datasets. If you change the refresh schedule, you need to re-publish the content pack (see above).

Delete an organizational content pack from AppSource
For group members who haven't customized the content pack, the dashboard and reports associated with that content pack are automatically removed. They're no longer available, and the content pack doesn't appear in the Navigation Pane.








# Your content is up-to-date
As a consumer, you interact with content that is created by *designers* and shared with you. You might wonder if that content is up-to-date or maybe you just want to know when that content was last refreshed. Knowing that you are working with the freshest content gives you confidence.  
 

![Power BI dashboard](media/end-user-consumer/power-bi-service.png)


## Scheduled refresh
not avail to consumers. Dash tiles refresh every 15m. 

don't mention perf inspector.

## View related
shows last updated for dash, report, dataset

## Shared with me
- shows date it was last shared, 
- and owner on Shared with me pane/list. 
- From report Focus mode shows last refresh - sometimes. Maybe not custom vizs? 
- View Related from report page shows refresh date for related content.
- Refresh button in report - what does it do?






## Subscribe to see changes


## Apps
Display last updated date.  This is the date that the app was shared with you.  Report *designers* will push out updates, you do not have ability to update or refresh yourself. 

Each app lists the name of the designer. Contact the designer if you have questions about the freshness of the app's data. 

- Refresh dashboard tiles.  What does it do actually? 
- Focus mode to see last refreshed per tile. 
- app **View content list** to see app contents.  From there can see what is included in app, select item to see View Related > dataset last refresh. But can't find owner since owner is person who created the app.
- dashboard View Related to see refresh for dataset
- dashboard performance inspector
- 

## Next steps

