---
title: Manage data storage in your workspaces
description: Learn how to manage data storage in your individual or workspace to make sure you can continue to publish reports and datasets.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 12/15/2021
LocalizationGroup: Administration
---
# Manage data storage in Power BI workspaces

Learn how to manage data storage in your individual or workspace so you can keep publishing reports and datasets.

## Capacity limits

Workspace storage limits, whether for My Workspace or an app workspace, depend on whether the workspace is in [shared or Premium capacity](../fundamentals/service-basic-concepts.md#capacities).

### Shared capacity limits
For workspaces in shared capacity: 

- There is a per-workspace storage limit of 10 GB.
- For app workspaces, the total usage can’t exceed the tenant storage limit of 10 GB multiplied by the number of Pro or Premium Per User (PPU) licenses in the tenant.

### Premium capacity limits
For workspaces in Premium capacity:
- There is a limit of 100 TB per Premium capacity.
- There is no per-user storage limit.
- Workspace storage usage is shown as 0 (as shown in this screenshot) if the workspace is assigned to a Premium capacity. 

  ![Workspace storage usage in a Premium capacity](media/service-admin-manage-your-data-storage-in-power-bi/workspace-storage-usage-premium.png)


Read about other features of the [Power BI pricing model](https://powerbi.microsoft.com/pricing).

## What's included in storage

Included in your data storage are your own datasets and Excel reports, and those items that someone has shared with you. Datasets are any of the data sources you’ve uploaded or connected to. These data sources include Power BI Desktop files and Excel workbooks you’re using. The following are also included in your data capacity.

* Excel ranges pinned to a dashboard.
* Reporting Services on-premises visualizations pinned to a Power BI dashboard.
* Uploaded images.

The size of a dashboard that you share varies, depending on what's pinned to it. For example, if you pin items from two reports that are part of two different datasets, the size includes both datasets.

## Manage items you own

See how much data storage you’re using in your Power BI account, and manage your account.

1. To manage your own storage, go to **My Workspace** on the navigation pane.
   
    ![Screenshot of the navigation pane with My Workspace called out.](media/service-admin-manage-your-data-storage-in-power-bi/power-bi-myworkspace.png)

2. Select the gear icon ![Gear icon](media/service-admin-manage-your-data-storage-in-power-bi/pbi_gearicon.png) in the upper-right corner **Manage personal storage**.
   
    The top bar shows how much of your storage limit you’ve used.
   
    ![Screenshot of the Manage storage limit, showing how much storage has been used.](media/service-admin-manage-your-data-storage-in-power-bi/pbi_persnlstorage.png)
   
    The datasets and reports are separated onto two tabs:
   
    **Owned by me:** You’ve uploaded these reports and datasets to your Power BI account, including service datasets such as Salesforce and Dynamics CRM.  

    **Owned by others:** Others have shared these reports and datasets with you.
1. To delete a dataset or report, select the trash can icon ![Trash can icon](media/service-admin-manage-your-data-storage-in-power-bi/pbi_deleteicon.png).

Keep in mind that you or someone else may have reports and dashboards based on a dataset. If you delete the dataset, those reports and dashboards won’t work anymore.

## Manage your workspace
1. Select the arrow next to **Workspaces** select the name of the workspace.
   
    ![Screenshot of the Workspace selection, showing the Sales Group workspace.](media/service-admin-manage-your-data-storage-in-power-bi/power-bi-group-workspaces.png)
2. Select the gear icon ![Gear icon](media/service-admin-manage-your-data-storage-in-power-bi/pbi_gearicon.png) in the upper-right corner **Manage group storage**.
   
    The top bar shows how much of the group’s storage limit is used.
   
    ![Screenshot of the Manage storage, showing how much the Sales Group's storage limit has been used.](media/service-admin-manage-your-data-storage-in-power-bi/pbi_groupstorage.png)
   
    The datasets and reports are separated onto two tabs:
   
    **Owned by us:** You or someone else has uploaded these reports and datasets to the group’s Power BI account, including service datasets such as Salesforce and Dynamics CRM.

    **Owned by others:** Others have shared these reports and datasets with your group.

3. To delete a dataset or report, select the trash can icon ![Trash can icon](media/service-admin-manage-your-data-storage-in-power-bi/pbi_deleteicon.png).
   
   > [!NOTE]
   > Keep in mind that you or someone else in the group may have reports and dashboards based on a dataset. If you delete the dataset, those reports and dashboards won’t work anymore.
   
   Any member in a workspace with the admin, member, or contributor role has permissions to delete datasets and reports from the workspace.

## Dataset limits
There is a 1 GB limit per dataset that is imported into Power BI, unless the workspace is in a Power BI Premium capacity. See the [Large datasets](service-premium-what-is.md#large-datasets) section of _What is Power BI Premium?_ for details. However, if you choose to keep the Excel experience, instead of importing the data, the limit is 250 MB for the dataset.

## What happens when you reach a limit
When you reach the data capacity limit of what you can do, you see prompts within the service. 

When you select the gear icon ![Gear icon](media/service-admin-manage-your-data-storage-in-power-bi/pbi_gearicon.png), you see a red bar indicating you are over your data capacity limit.

![Screenshot of the storage capacity, showing the limit has been reached.](media/service-admin-manage-your-data-storage-in-power-bi/manage-storage-limit.png)

This limit also is indicated within **Manage personal storage**.

 ![Screenshot of the personal storage capacity, showing Jane's limit has been reached.](media/service-admin-manage-your-data-storage-in-power-bi/manage-storage-limit2.png)

 When you try to perform an action that will reach one of the limits, you see a message you are over the limit. You can [manage your storage](#manage-items-you-own) to reduce your storage amount and get past the limit.

 ![Screenshot of the Over your storage limit dialog, showing limits have been reached.](media/service-admin-manage-your-data-storage-in-power-bi/powerbi-pro-over-limit.png)

 ## Next steps

 More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
