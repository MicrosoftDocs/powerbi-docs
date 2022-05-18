---
title: Administration of datamarts (preview)
description: Manage and administer datamarts
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-datamarts
ms.topic: how-to
ms.date: 05/24/2022
LocalizationGroup: Data from files
---

# Administration of datamarts
You can administer the use and settings for datamarts just like you can administer other aspects of Power BI. This article describes and explains how to administer your datamarts, and where to find the settings.


## Enabling datamarts in the Admin portal
Power BI administrators can enable or disable datamart creation, using the setting found in the Power BI **admin portal**, as shown in the following image.

:::image type="content" source="media/datamarts-administration/datamarts-administration-01.png" alt-text="Screenshot of the admin portal to enable or disable datamarts.":::

### Keeping track of datamarts

In the Power BI admin portal, you can review a list of datamarts along with all other Power BI items in any workspace, as shown in the following image.

:::image type="content" source="media/datamarts-administration/datamarts-administration-02.png" alt-text="Screenshot of the admin portal to track datamarts.":::


Existing Power BI admin APIs for getting workspace information work for datamarts as well, such as *GetGroupsAsAdmin* and the workspace scanner API. Such APIs enable you, as the Power BI service administrator, to retrieve datamarts metadata along with other Power BI item information, so you can monitor workspace usage and generate relevant reports.

### Viewing audit logs and activity events

Power BI administrators can audit datamart operations from the **Microsoft 365 Admin Center**. Audit operations supported on datamarts are the following: 

* Create
* Rename
* Update
* Delete
* Refresh 
* View

To get audit logs, complete the following steps:

1.	Sign in to the Power BI admin portal as the administrator and navigate to **Audit logs**.
2.	In the **Audit logs** section, select the button to go to **Microsoft 365 Admin Center**
    :::image type="content" source="media/datamarts-administration/datamarts-administration-03.png" alt-text="Screenshot of the admin portal to view audit logs.":::
3.	Get audit events by applying search criteria.
    :::image type="content" source="media/datamarts-administration/datamarts-administration-04.png" alt-text="Screenshot of the Microsoft 365 admin center audit section.":::

4.	Export audit logs and apply filter for datamart operations.
    :::image type="content" source="media/datamarts-administration/datamarts-administration-05.png" alt-text="Screenshot of the Microsoft 365 admin center audit search criteria.":::


### Using REST APIs for activity events

Administrators can export activity events on datamarts by using existing supported REST APIs. The following articles provide information about the APIs:
•	[Admin - Get Activity Events - REST API (Power BI Power BI REST APIs)](/rest/api/power-bi/admin/get-activity-events)
•	[Track user activities in Power BI](/power-bi/admin/service-admin-auditing)

## Capacity utilization and reporting 

Datamarts CPU usage is free during preview. The free components include datamart and queries on SQL endpoint of datamart. Auto-generated dataset usage would be reported for throttling and auto-scaling. To avoid any cost during private preview, we suggest using PPU trial workspace. 

### Create a Premium workspace for datamarts
( if this is a rehash of existing content, remove the section and add a link)

( yes it's redundant, bad images too )


## Considerations and limitations

The following limitations should be considered when using datamarts: 

•	Datamarts are only offered as a Premium Gen 2 offering (PPC/PPU)
•	Datamarts currently officially support data volumes of up to 100 GB- this is not an enforced system limit, however.
•	Currently datamarts don’t support currency data type- they will be converted to float.
•	Data sources behind a VNET cannot currently be used with datamarts.
•	Datamart won’t be available (until further notice) in the following azure regions:
•	Sweden Central and South (Until June)
•	West India (No future availability date yet)
•	UAE Central 
•	Japan West 
•	Southeast Asia 
In all other Azure regions, datamarts are supported


## Next steps
This article provided information about adminisration of datamarts. 

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Understand datamarts](datamarts-understand.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Create reports with datamarts](datamarts-create-reports.md)
* [Access control in datamarts](datamarts-access-control.md)

For more information about dataflows and transforming data, consult the following articles:
* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)









