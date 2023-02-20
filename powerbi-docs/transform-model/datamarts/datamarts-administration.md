---
title: Administration of datamarts (preview)
description: Manage and administer datamarts
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 02/10/2023
LocalizationGroup: Data from files
---

# Administration of datamarts
You can administer the use and settings for datamarts just like you can administer other aspects of Power BI. This article describes and explains how to administer your datamarts, and where to find the settings.


## Enabling datamarts in the admin portal
Power BI administrators can enable or disable datamart creation for the entire organization or for specific security groups, using the setting found in the Power BI **admin portal**, as shown in the following image.

:::image type="content" source="media/datamarts-administration/datamarts-administration-06.png" alt-text="Screenshot of the admin portal to enable or disable datamarts.":::

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
* [Admin - Get Activity Events - REST API (Power BI Power BI REST APIs)](/rest/api/power-bi/admin/get-activity-events)
* [Track user activities in Power BI](/power-bi/admin/service-admin-auditing)

## Capacity utilization and reporting 

Datamart CPU usage is free during preview, including datamarts and queries on SQL endpoints of a datamart. Auto-generated dataset usage will be reported for throttling and auto-scaling. To avoid incurring costs during the preview period, consider using a Premium Per User (PPU) trial workspace. 


## Considerations and limitations

The following limitations should be considered when using datamarts: 

* Datamarts are only available in Premium Gen 2 workspaces.
* Datamarts aren't currently supported in the following Power BI SKUs: A1/A2, EM1, and EM2.
* Datamarts aren't available in workspaces that are bound to an Azure Data Lake Gen2 storage account.
* Datamart extract, transform and load (ETL) operations can currently only run for up to 24 hours
* Datamarts currently officially support data volumes of up to 100 GB.
* Currently datamarts don’t support the currency data type, and such data types will be converted to float.
* Data sources behind a VNET or using private links can't currently be used with datamarts; to work around this limitation you can use an on-premises data gateway.
* Datamarts use port 1948 for connectivity to the SQL endpoint. Port 1433 needs to be open for datamarts to work.
* Datamarts only support Microsoft Azure Active Directory (Azure AD) and do *not* support managed identities or service principals at this time.
* Beginning February 2023, datamarts support any SQL client.
* Datamarts aren't currently available in the following Azure regions:
    * Sweden Central and South
    * West India
    * UAE Central 
    * Japan West 

Datamarts are supported in all other Azure regions.


## Next steps
This article provided information about the administration of datamarts. 

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Understand datamarts](datamarts-understand.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Create reports with datamarts](datamarts-create-reports.md)
* [Access control in datamarts](datamarts-access-control.md)

For more information about dataflows and transforming data, see the following articles:
* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)









