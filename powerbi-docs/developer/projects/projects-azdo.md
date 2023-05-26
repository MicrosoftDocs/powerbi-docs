---
title: Azure DevOps integration with Power BI Desktop projects
description: Learn about Azure DevOps integration with Power BI Desktop projects
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/18/2023
---

# Power BI Desktop projects Azure DevOps integration

> [!IMPORTANT]
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease feature that may be substantially modified before being released for General Availability (GA). Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

Microsoft Power BI Desktop projects enable developer collaboration by connecting your local Git repo to a remote Git host, like Azure DevOps.

:::image type="content" source="media/projects-azdo/pbip-azdo-diagram.png" alt-text="PBIP and Azure DevOps integration diagram.":::

## Create a Git repo in Azure DevOps

1. In [Azure DevOps](https://dev.azure.com/), select an existing organization, or create a new one.

1. Create a new Project within the organization:

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project.png" border="false" alt-text="PBIP and Azure DevOps integration new project.":::

1. Enter your project details.

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project-details.png" alt-text="PBIP and Azure DevOps integration new project details.":::

1. Select **Repos** > **Files**, and then copy the URL of the remote repo:

    :::image type="content" source="media/projects-azdo/pbip-azdo-copy-repo-url.png" alt-text="PBIP and Azure DevOps integration copy URL.":::

1. In Visual Studio Code (VS Code) > **Source Control** > **Remote**, select **Add Remote**.

    :::image type="content" source="media/projects-azdo/pbip-azdo-add-remote.png" alt-text="Add Remote in VS Code.":::

1. Select **Publish Branch**.

    :::image type="content" source="media/projects-azdo/pbip-azdo-publish-branch.png" alt-text="Publish Branch in VS Code.":::

    VS Code takes care of publishing your project into Azure DevOps, where you can see your project files.

    :::image type="content" source="media/projects-azdo/pbip-azdo-see-project.png" alt-text="See your project in Azure DevOps.":::

And that's it! You can see with Azure DevOps integration, you can now have multiple developers working on the same Power BI project. All they need to do is be synced with the same Azure Devops Git Repo.

If you're using Microsoft Fabric, you can also connect a Fabric workspace to an Azure DevOps Git repo and get all your content automatically deployed into the service. Git and Azure DevOps integration can provide a continuous integration workflow not only from Power BI Desktop to the service, but also from changes made in the service to Power BI Desktop.

## See also

[Power BI Desktop projects Git integration](projects-git.md)  
[Power BI Desktop projects](projects-overview.md)  
