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

Create a local Git Repo using VS Code
Pre-Requisites
•	Be familiar with Git, the git-scm website is a good place to learn the basics
•	Install Git on your machine: Git - Downloads (git-scm.com)
•	Install VS Code, that has native integration with Git out-of-the-box, please refer to this link for more information.

1. Using VS Code, open the PBIP folder created before:

    :::image type="content" source="media/projects-git/open-pbip-folder.png" alt-text="Image showing open folder in VS Code.":::


1. Initialize a Git repository by clicking on "Source Control" > "Initialize Repository":

    :::image type="content" source="media/projects-git/initialize-git-repo.png" alt-text="Image showing Initialize Repository in VS Code.":::


1. Do the initial Commit and provide a message:

    :::image type="content" source="media/projects-git/commit.png" alt-text="Image showing a commit in VS Code.":::

From now on, any changes you make in Power BI Desktop will change a file in the folder tracked by your local Git. For example, in Power BI Desktop, when you change a DAX formula for a measure, and then save. It triggers a Git diff on the model.bim file.

:::image type="content" source="media/projects-git/measure-change.png" alt-text="Image showing a measure change in VS Code.":::

Git integration, you not can not only track your change history, but also backup your development work. For example, with GitGraph, a popular free VS Code Extension, you can easily track all your changes:

:::image type="content" source="media/projects-git/gitgraph.png" alt-text="Image showing GitGraph in VS Code.":::
