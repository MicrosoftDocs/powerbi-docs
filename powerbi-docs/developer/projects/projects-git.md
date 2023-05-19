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

# Power BI Desktop Projects Git integration


> [!IMPORTANT]
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites

- Be familiar with Git, the git-scm website is a good place to learn the basics
- Install Git on your machine: Git - Downloads (git-scm.com)
- Install VS Code, that has native integration with Git out-of-the-box, please refer to this link for more information.

#### To create a local Git Repo by using VS Code

1. In VS Code, open the Power BI Desktop project folder:

    :::image type="content" source="media/projects-git/open-pbip-folder.png" alt-text="Image showing open folder in VS Code.":::


1. Initialize a Git repository by selecting **Source Control** > **Initialize Repository**:

    :::image type="content" source="media/projects-git/initialize-git-repo.png" alt-text="Image showing Initialize Repository in VS Code.":::

1. Do an initial Commit and enter a message:

    :::image type="content" source="media/projects-git/commit.png" alt-text="Image showing a commit in VS Code.":::

From now on, any changes you make in Power BI Desktop will change a file in the folder tracked by your local Git. For example, in Power BI Desktop, when you change a DAX formula for a measure and then save. It triggers a Git diff on the model.bim file.

:::image type="content" source="media/projects-git/measure-change.png" alt-text="Image showing a measure change in VS Code.":::

With Git integration, you can not only track your change history, but also backup your development work. For example, with GitGraph, a popular free VS Code Extension, you can easily track all your changes:

:::image type="content" source="media/projects-git/gitgraph.png" alt-text="Image showing GitGraph in VS Code.":::
