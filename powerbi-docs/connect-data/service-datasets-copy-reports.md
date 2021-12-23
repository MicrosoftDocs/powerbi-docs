---
title: Copy reports from other apps or workspaces - Power BI
description: Learn how you can create a copy of a report and save it to your own workspace.
author: paulinbar
ms.author: painbar
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 07/01/2021
LocalizationGroup: Share your work
---
# Copy reports from other workspaces

When you find a report you like in a workspace or an app, you can make a copy of it and save it to a different workspace. Then you can modify your copy of the report, adding or deleting visuals and other elements. You don't have to worry about creating the data model. It's already created for you. And it's much easier to modify an existing report than it is to start from scratch. However, when you make an app from your workspace, sometimes you can't publish your copy of the report in the app. See [Considerations and limitations in the article "Use datasets across workspaces"](service-datasets-across-workspaces.md#considerations-and-limitations) for details.

## Prerequisites

- To copy a report, you need a Pro or Premium Per User (PPU) license, even if the original report is in a workspace in a Premium capacity.
- To copy a report to another workspace, or to create a report in one workspace based on a dataset in another workspace, you need [Build permission for the dataset](service-datasets-build-permissions.md). For datasets in the original workspace, if you have at least the Contributor role you automatically have Build permission through your workspace role. You also need at least the Contributor role in the destination workspace. See [Roles in the new workspaces](../collaborate-share/service-roles-new-workspaces.md) for details.

## Save a copy of a report in a workspace

1. In a workspace, find a report in the list. The report has a **More options** menu.

    ![Reports list view](media/service-datasets-copy-reports/power-bi-report-list-view.png)

1. From **More options**, select **Save a copy**.

    ![Save a copy of a report](media/service-datasets-copy-reports/power-bi-dataset-save-report-copy.png)

    You only see the **Save a copy** option if the report is in a new experience workspace, and you have [Build permission](service-datasets-build-permissions.md). Even if you have access to the workspace, you have to have Build permission for the dataset.

3. In **Save a copy of this report**, give the report a name and select the destination workspace.

    ![Save a copy dialog box](media/service-datasets-copy-reports/power-bi-dataset-save-report.png)

    You can save the report to the current workspace or a different one in the Power BI service. You only see workspaces that are new experience workspaces, in which you're a member. 
  
4. Select **Save**.

    Power BI automatically creates a copy of the report, and an entry in the list of datasets if the report is based on a dataset outside of the workspace.

    To see the shared dataset, select **More options** > **View lineage**. This item shows the lineage:

    ![Dataset actions](media/service-datasets-copy-reports/power-bi-dataset-actions.png)

    The icon for this dataset is different from the icon for datasets in the workspace. That way, members of the workspace can tell which reports and dashboards use datasets that are outside the workspace.

    See [Your copy of the report](#your-copy-of-the-report) in this article for more about the report and related dataset.

## Copy a report in an app

1. In an app, open the report you want to copy.
2. In the menu bar, select **File** > **Save a copy**.

    ![Save a copy of the report](media/service-datasets-copy-reports/power-bi-save-copy.png)

    You only see the **Save a copy** option if the report is in a new experience workspace, and you have [Build permission](service-datasets-build-permissions.md).

3. Give your report a name > **Save**.

    ![Name your copy of the report](media/service-datasets-copy-reports/power-bi-save-report-from-app.png)

    Your copy is automatically saved to your My Workspace.

4. Select **Go to report** to open your copy.

## Your copy of the report

When you save a copy of the report, you create a live connection to the dataset, and you can open the report creation experience with the full dataset available. 

![Edit your copy of the report](media/service-datasets-copy-reports/power-bi-edit-report-copy.png)

You haven't made a copy of the dataset. The dataset still resides in its original location. You can use all tables and measures in the dataset in your own report. Row-level security (RLS) restrictions on the dataset are in effect, so you only see data you have permissions to see based on your RLS role.

## View related datasets

When you have a report in one workspace based on a dataset in another workspace, you may need to know more about the dataset it's based on.

1. In the report, select **More options** > **See related content**.

    ![Screenshot shows See related content under More options.](media/service-datasets-copy-reports/power-bi-dataset-view-related.png)

1. The **Related content** dialog box shows all related items. In this list, the dataset looks like any other. You can't tell it resides in a different workspace. This issue is known.
 
    ![Related content dialog box](media/service-datasets-copy-reports/power-bi-dataset-related.png)

## Delete a report and its shared dataset

You may decide you no longer want the report and its associated shared dataset in workspace.

1. Delete the report. In the list of reports in the workspace, in the **More options** menu, select **Delete**.

    ![Delete report icon](media/service-datasets-copy-reports/power-bi-datasets-delete-report.png)

2. The shared datasets don't have **Delete** options. Refresh the page, or go to a different page and return. The dataset will be gone. If not, the dataset may be related to another table in your workspace.

    > [!NOTE]
    > Deleting the shared dataset in this workspace doesn't delete the dataset. It just deletes the reference to it.


## Next steps

- [Use datasets across workspaces](service-datasets-across-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
