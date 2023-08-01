---
title: Known issue - deployment pipeline stuck in loading
description: A known issue is posted where deployment pipeline load endless once user is assigned 'viewer' permission on workspace.
author: mihart
ms.author: anirmale
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting 
ms.date: 07/27/2023
ms.custom: known-issue-443
---

# Known issue - deployment pipeline stuck in loading
Deployment pipeline stuck in loading

**Status:** Open

**Product Experience:** Power BI

## Symptoms
Deployment pipeline not loading and endless spinning

## Solutions and workarounds

1. Avoid the use of view permission to the pipeline workspaces.
2. Make use of the Microsoft public api for deployment - [Git integration] (/power-bi/pipelines/selective-deploy).
3. Make manual changes in the browser url as listed below in detail and load the pipeline page. Deploy the deployment pipeline. If the page doesn't function properly, append 'unmin=1' to the url and validate the page loads, select 'F12' to open the Dev Tools and switch to the 'Sources' tab. Select 'Ctrl+Shift+F' and look for text: allSlotsFoldersArtifactRelationsLoaded. Select the second result and set a break point on the line number. Refreshing the page with the Dev Tools opened, should stop on the set break point. Change to 'Console' tab and copy the part where: allSlotsFoldersArtifactRelationsLoaded = true and select enter. Close the dev tools to load the page.

## Next steps

- [About known issues](https://support.fabric.microsoft.com/known-issues)
