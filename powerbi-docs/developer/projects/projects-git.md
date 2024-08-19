---
title: Git integration with Power BI Desktop projects
description: Learn about Git integration with Power BI Desktop projects and streamline your development processes, source control, and collaboration with Git repositories.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: concept-article
ms.date: 05/31/2024
#customer intent: As a Power BI developer, I want to learn how to use Git integration with Power BI Desktop projects so that I can streamline my development processes, source control, and collaboration with Git repositories.
---

# Power BI Desktop projects Git integration

> [!IMPORTANT]
> Power BI Desktop projects is currently in **preview**.

Git integration in Microsoft Visual Studio Code (VS Code) enables Pro BI developers working with Power BI Desktop projects to streamline development processes, source control, and collaboration with Git repositories.

With Git integration, you can:

- Backup and version your work.
- Revert to previous states.
- Collaborate with others or work alone using Git branches.
- Use the capabilities of familiar source control tools, like Azure DevOps.

## Prerequisites

- Familiarity with Git. See [Git and GitHub learning resources](https://docs.github.com/en/get-started/quickstart/git-and-github-learning-resources).
- [Download](/devops/develop/git/install-and-set-up-git) and install Git.
- [Download](https://code.visualstudio.com/) and install VS Code development environment. It has native integration with Git. To learn more, see [Using Git source control in VS Code](https://code.visualstudio.com/docs/sourcecontrol/overview).

## Create a local Git repo using VS Code

1. In VS Code, open a Power BI Desktop project folder:

    :::image type="content" source="media/projects-git/open-pbip-folder.png" alt-text="Image showing open folder in VS Code.":::

1. Initialize a Git repository by selecting **Source Control** > **Initialize Repository**:

    :::image type="content" source="media/projects-git/initialize-git-repo.png" alt-text="Image showing Initialize Repository in VS Code.":::

1. Do an initial Commit and enter a message:

    :::image type="content" source="media/projects-git/commit.png" alt-text="Image showing a commit in VS Code.":::

From now on, any changes you make in Power BI Desktop changes a file in the folder tracked by your local Git. For example, in Power BI Desktop, when you change a DAX formula for a measure and then save, it triggers a Git diff on the model.bim file.

:::image type="content" source="media/projects-git/measure-change.png" alt-text="Image showing a measure change in VS Code.":::

With Git integration, you can not only backup your work, but also track your change history. For example, with GitGraph, a popular free VS Code extension, you can easily track all your changes.

:::image type="content" source="media/projects-git/gitgraph.png" alt-text="Image showing GitGraph in VS Code.":::

## Related content

- [Power BI Desktop projects Azure DevOps integration](projects-azdo.md)  
- [Power BI Desktop project semantic model folder](projects-dataset.md)  
- [Power BI Desktop project report folder](projects-report.md)  
