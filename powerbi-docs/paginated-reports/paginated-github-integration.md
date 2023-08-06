---
title: "Git integration with paginated reports"
description: You can view paginated reports in your local or preferred language in the Power BI service.
author: nirusrin
ms.author: nisrinivasan
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 07/31/2023
---

# Git integration with paginated reports

[!INCLUDE [applies-yes-service-yes-report-builder-no-desktop](../includes/applies-yes-service-no-report-builder-no-desktop.md)]

This article walks you through publishing a paginated report and keeping it in sync with your git workspace. Developers can apply their development processes, tools, and best practices.  

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../includes/power-bi-paginated-prerequisites.md)]
- [Git Integration for Microsoft Fabric](https://learn.microsoft.com/fabric/cicd/git-integration/intro-to-git-integration)


## Get started

1. In the Power BI service, navigate to the Workspace that you want to sync with your git repository by selecting **Workspace** in the left nav.

    :::image type="content" source="media/page-view/paginated-reports-workspace-selection.png" alt-text="Screenshot of the Workspace":::

1. Select **Workspace Settings** in the Workspace.

    :::image type="content" source="media/page-view/paginated-reports-workspace-settings.png" alt-text="Screenshot of the Workspace Settings":::

1. Select **Git integration** in the Workspace Settings and enter the information required to connect to your git workspace. Select **Connect and sync**. 

    :::image type="content" source="media/page-view/paginated-reports-workspace-settings-repository-info.png" alt-text="Screenshot of the information to connect to workspace":::


    **Note:** If the branch is new, you'll be prompted to **Create and sync**.


1. Upload your .rdl to the workspace on the service. We don't support OneDrive and Sharepoint yet.

    :::image type="content" source="media/page-view/paginated-reports-upload.png" alt-text="Screenshot of the Upload button":::

    Once the file is uploaded, you should see the report and the Git status **Uncommitted** and **Source control**.

    :::image type="content" source="media/page-view/paginated-reports-source-control.png" alt-text="Screenshot of status":::

1. Select **Source Control**. In the source control pane, select the file and commit.  

    :::image type="content" source="media/page-view/paginated-reports-source-control-1.png" alt-text="Screenshot of Commit":::

    Once you commit the file, the **Git status** will change to **Sync**.

    :::image type="content" source="media/page-view/paginated-reports-git-status-sync.png" alt-text="Screenshot of Git Synced":::


You'll see a folder in your git repository which contains the .rdl and 2 .json files. You may have to refresh your repository.

:::image type="content" source="media/page-view/paginated-report-git-repo.png" alt-text="Screenshot of Git repo":::


## Considerations and limitations

- Publish/upload the paginated report to the service and then use git. The paginated report won't render if you start with the files in git.  

- When you delete a paginated report from git, delete the *entire folder* and not just the .rdl report.  

- The paginated remains connected to the orginal dataset when you move the paginated report to a different workspace. Update the dataset in Power BI Report builder and re-publish the paginated report to the Power BI service.

