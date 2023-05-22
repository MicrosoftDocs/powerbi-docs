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
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

Microsoft Power BI Desktop projects enable developer collaboration by connecting your local Git repo to a remote Git host, like Azure DevOps.

:::image type="content" source="media/projects-azdo/pbip-azdo-diagram.png" alt-text="PBIP and Azure DevOps integration diagram.":::

## Create a Git repo in Azure DevOps

1. In [Azure DevOps](https://dev.azure.com/), select an existing organization, or create a new one.

1. Create a new Project within the organization:

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project.png" border="false" alt-text="PBIP and Azure DevOps integration new project.":::

1. Enter you project details.

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project-details.png" alt-text="PBIP and Azure DevOps integration new project details.":::

1. Select **Repos** > **Files**, and then copy the URL of the remote repo:

    :::image type="content" source="media/projects-azdo/pbip-azdo-copy-repo-url.png" alt-text="PBIP and Azure DevOps integration copy URL.":::

## See also

[Power BI Desktop projects Git integration](projects-git.md)  
[Power BI Desktop projects](projects-overview.md)  
