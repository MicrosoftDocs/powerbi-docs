---
title: Git integration with Power BI Desktop projects
description: Learn about Git integration with Power BI Desktop projects
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/18/2023
---

# Power BI Desktop Projects Azure DevOps integration

Power BI Desktop Projects enable co-development by connecting your local Git repo to a remote Git host, like Azure DevOps.

:::image type="content" source="media/projects-azdo/pbip-azdo-diagram.png" alt-text="PBIP and Azure DevOps integration diagram.":::

## Create a Git repo in Azure DevOps

1. In [Azure DevOps](https://dev.azure.com/), select an existing organization, or  create a new one.

1. Create a new Project within the organization:

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project.png" alt-text="PBIP and Azure DevOps integration new project.":::

1. Enter you project details.

    :::image type="content" source="media/projects-azdo/pbip-azdo-new-project-details.png" alt-text="PBIP and Azure DevOps integration new project details.":::

1. Click on **Repos** > **Files**, and then copy the URL of the remote repo:

    :::image type="content" source="media/projects-azdo/pbip-azdo-copy-repo-url.png" alt-text="PBIP and Azure DevOps integration copy URL.":::
