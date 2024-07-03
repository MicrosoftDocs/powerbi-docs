---
title: "Git integration with paginated reports"
description: You can edit paginated reports using git integration in the Power BI service.
author: nirusrin
ms.author: nisrinivasan
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 06/28/2024
---

# Git integration with paginated reports

[!INCLUDE [applies-yes-service-yes-report-builder-no-desktop](../includes/applies-yes-service-no-report-builder-no-desktop.md)]

This article walks you through publishing a paginated report and keeping it in sync with your git workspace. Developers can apply their development processes, tools, and best practices.  

## Prerequisites

[!INCLUDE [github-prereqs](~/../fabric-repo/docs/includes/github-prereqs.md)]

Read about the integration of Git with Microsoft Fabric at [Introduction to git integration](/fabric/cicd/git-integration/intro-to-git-integration).

### Power BI prerequisites

See the **Prerequisites** section in [Get started creating paginated reports in the Power BI service](web-authoring/get-started-paginated-formatted-table.md#prerequisites).

## Add a paginated report to GitHub

1. Connect your workspace to your git repository by following the directions in [Connect a workspace to an Azure repo](/fabric/cicd/git-integration/git-get-started#connect-a-workspace-to-an-azure-repo).

    :::image type="content" source="media/page-view/paginated-reports-workspace-settings-repository-info.png" alt-text="Screenshot of the information to connect to workspace." lightbox="media/page-view/paginated-reports-workspace-settings-repository-info.png":::

    > [!Note]
    > If the branch is new, you're prompted to **Create and sync**.

1. Upload your *.rdl* file to the workspace on the service. We don't support OneDrive or Sharepoint yet.

    :::image type="content" source="media/page-view/paginated-reports-upload.png" alt-text="Screenshot of the Upload button." lightbox="media/page-view/paginated-reports-upload.png":::

    After you upload the file, you should see the report and the Git status **Uncommitted** and **Source control**.

    :::image type="content" source="media/page-view/paginated-reports-source-control.png" alt-text="Screenshot of status." lightbox="media/page-view/paginated-reports-source-control.png":::

1. Select **Source Control**. In the source control pane, select the file and commit.  

    :::image type="content" source="media/page-view/paginated-reports-source-control-1.png" alt-text="Screenshot of Commit." lightbox="media/page-view/paginated-reports-source-control-1.png":::

    After you commit the file, the **Git status** changes to **Sync**.

    :::image type="content" source="media/page-view/paginated-reports-git-status-sync.png" alt-text="Screenshot of Git Synced." lightbox="media/page-view/paginated-reports-git-status-sync.png":::

    A folder appears in your git repository that contains the *.rdl* and two *.json* files. You might have to refresh your repository.

    :::image type="content" source="media/page-view/paginated-report-git-repo.png" alt-text="Screenshot of Git repo." lightbox="media/page-view/paginated-report-git-repo.png":::

## Edit a paginated report that's saved to GitHub

1. Open the .rdl file from the local git repository in Power BI Report Builder.
1. Make the desired edits.
1. Commit and push your changes to the remote repository.
1. Create a PR to the main branch.
1. Once approved, the PR is merged to the main branch.
1. From the main branch, apply your revised changes to the relevant workspace.

## Considerations and limitations

- Publish/upload the paginated report to the service and then use git. Paginated reports don't render if you start with the files in git.  

- When you delete a paginated report from git, delete the *entire folder* and not just the .rdl report.

- Renaming a paginated report in git doesn't work. However, renaming the .rdl on the Power BI service does work. If you do want to rename the paginated report, you must delete the paginated report from git, delete the **entire folder**, and recreate the folder with the .rdl with the new name.  

- The paginated report remains connected to the original dataset when you move it to a different workspace. If you move a paginated report to a different workspace, update the dataset in Power BI Report Builder and republish the paginated report to the Power BI service.

## Next steps

- [Introduction to git integration](/fabric/cicd/git-integration/intro-to-git-integration)
