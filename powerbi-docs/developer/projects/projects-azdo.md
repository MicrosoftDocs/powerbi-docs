---
title: Azure DevOps integration with Power BI Desktop projects
description: Learn about Azure DevOps integration with Power BI. Desktop projects
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/31/2023
---

# Power BI Desktop projects Azure DevOps integration

> [!IMPORTANT]
> Power BI Desktop projects is currently in **preview**.

Microsoft Power BI Desktop projects enable developer collaboration by connecting your local Git repo to a remote Git host, like Azure DevOps.

:::image type="content" source="media/projects-azdo/pbip-azdo-diagram.png" alt-text="Diagram of PBIP and Azure DevOps integration.":::

## Create a Git repo in Azure DevOps

1. In [Azure DevOps](https://dev.azure.com/), select an existing organization, or create a new one.

1. Create a new Project within the organization:

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project.png" alt-text="Screenshot of PBIP and Azure DevOps integration new project button.":::

1. Enter your project details.

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project-details.png" alt-text="Screenshot showing how to add new project details in PBIP and Azure DevOps integration.":::

1. Select **Repos** > **Files**, and then select 'Initialize' to create an empty branch:

    :::image type="content" source="media/projects-azdo/pbip-azdo-init-branch.png" alt-text="Screenshot showing how to initializa a new branch.":::

1. In **Repos** > **Files**, select **Clone** > **Clone in VS Code**

    :::image type="content" source="media/projects-azdo/pbip-azdo-clone-vs-code.png" alt-text="Screenshot of UI for PBIP and Azure DevOps integration clone repo.":::

1. In Visual Studio Code (VS Code) > pick a folder and open

    :::image type="content" source="media/projects-azdo/pbip-azdo-clone-vs-code-pick-folder.png" alt-text="Screenshot of PBIP and Azure DevOps integration clone repo selection.":::

    :::image type="content" source="media/projects-azdo/pbip-azdo-clone-vs-code-open.png" alt-text="Screenshot of PBIP and Azure DevOps integration clone repo.":::

1. Save your Power BI Project files to the selected folder

    :::image type="content" source="media/projects-azdo/pbip-azdo-vs-code-save-as.png" alt-text="Screenshot of saving a PBIP in VS Code.":::

1. Commit and sync changes

    :::image type="content" source="media/projects-azdo/pbip-azdo-commit.png" alt-text="Screenshot of UI for Commit in VS Code.":::

    :::image type="content" source="media/projects-azdo/pbip-azdo-sync.png" alt-text="Screenshot of UI for Sync in VS Code.":::

    VS Code takes care of publishing your project into Azure DevOps, where you can see your project files.

    :::image type="content" source="media/projects-azdo/pbip-azdo-see-project.png" alt-text="Screenshot showing how to see your project in Azure DevOps.":::

As you can see, with Azure DevOps integration, you can have multiple developers working on the same Power BI project as long as they're synced with the same Azure Devops Git Repo.

If you're using Microsoft Fabric, you can also connect a Fabric workspace to an Azure DevOps Git repo and get all your content automatically deployed into the service. Git and Azure DevOps integration can provide a continuous integration workflow not only from Power BI Desktop to the service, but also from changes made in the service to Power BI Desktop. To learn more, see [Microsoft Fabric - Introduction to git integration](/fabric/cicd/git-integration/intro-to-git-integration).

## Related content

- [Power BI Desktop projects Git integration](projects-git.md)  
- [Power BI Desktop projects](projects-overview.md)  
