---
title: Git commands for creating a new article or updating an existing article
description: Steps for working with the Power BI technical content GitHub repositories.
metakeywords: ""
services: ""
solutions: ""
documentationcenter: ""
ms.topic: article
ms.service: contributor-guide
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ""
videoid: ""
scriptid: ""
ms.devlang: ""
ms.tgt_pltfrm: ""
ms.workload: ""
ms.custom: ""
ms.date: 11/08/2017
---

# Git commands for creating a new article or updating an existing article

## Standard process (working from master)

Follow the steps in this article to create a local working branch on your computer so that you can create a new article for the technical documentation section of powerbi.microsoft.com or update an existing article.

![Github commands](./media/git-commands-for-master/githubcommands1.png)

1. Start Git Bash (or the command-line tool you use for Git).

   **Note:** If you are working in the public repository, change powerbi-content-pr to powerbi-content in all the commands.

2. Change to powerbi-docs-pr:

        cd powerbi-docs-pr
3. Check out the master branch:

        git checkout master

4. Create a fresh local working branch derived from the master branch:

        git pull upstream master:<working branch>

5. Move into the new working branch:
        git checkout <working branch>

6. Let your fork know you created the local working branch:

        git push origin <working branch>

7. Create your new article or make changes to an existing article. Use Windows Explorer to open and create new markdown files, and use Atom (http://atom.io) as your markdown editor. After you created or modified your article and images, go to the next step.

8. Add and commit the changes you made:

        git add .
        git commit –m "<comment>"

   Or, to add only the specific files you modified:

        git add <file path>
        git commit –m "<comment>"

9. Update your local working branch with changes from upstream:

        git pull upstream master

10. Push the changes to your fork on GitHub:

        git push origin <working branch>

11. When you are ready to submit your content to the upstream master branch for staging, validation, and/or publishing, in the GitHub UI, create a pull request from your fork to the master branch.

12. The pull request acceptor reviews your pull request, provides feedback, and/or accepts your pull request. 

13. Verify your published article or changes at

    https://review.docs.microsoft.com/en-us/power-bi/*name-of-your-article-without-the-MD-extension*?branch=master

**Notes:**

* At this time, technical articles are published once daily around 10 AM Pacific Standard Time (PST), Monday-Friday. Remember, your pull request has to be accepted before changes are included in the next scheduled publishing run.
* If you are an employee working in the private repository, all pull requests are subject to validation rules that need to be addressed before the pull request can be accepted. 
* In the private repo, the changes you submit are automatically staged, and a staging link is written to the pull request. Please review your staged content and sign off in the pull request comments to indicate the changes are ready to be pushed live. If you don't want the pull request to be accepted - if you are just staging the changes - add that note to the pull request.

## Working with release branches

When you are working with a release branch, the best way to create a local working branch from the release branch is to use this command syntax:

    git checkout upstream/<upstream branch name> -b <local working branch name>

This creates the local branch directly from the upstream branch, avoiding any local merging.