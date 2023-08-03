---
title: Known issue - Deployment pipeline stuck in loading
description: A known issue is posted where deployment pipeline load endless once user is assigned 'viewer' permission on workspace.
author: mihart
ms.author: anirmale
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting 
ms.date: 07/27/2023
ms.custom: known-issue-443
---

# Known issue - Deployment pipeline stuck in loading

There's a known issue where the deployment pipeline doesn't load based on the following scenario. You create a deployment pipeline and assign a workspace to a pipeline stage and then change your workspace permission to Viewer. If you refresh the deployment pipeline, the deployment pipeline stages don't load.

**Status:** Open

**Product Experience:** Power BI

## Symptoms

When you open a deployment pipeline, the pipeline stages don't load and show an endless spinning icon.

## Solutions and workarounds

Here are some workarounds that help to avoid the issue:

1. Avoid the use of view permission to the pipeline workspaces.
2. Make use of the Microsoft public api for deployment - [Git integration] (/power-bi/pipelines/selective-deploy).
3. Make manual changes in the browser url and load the pipeline page. Deploy the deployment pipeline. If the page doesn't function properly, append "unmin=1" to the url and validate the page loads, select **F12** to open the Dev Tools and switch to the **Sources** tab. Select **Ctrl+Shift+F** and look for text: "allSlotsFoldersArtifactRelationsLoaded". Select the second result and set a break point on the line number. Refreshing the page with the Dev Tools opened should stop on the set break point. Change to the **Console** tab and copy "allSlotsFoldersArtifactRelationsLoaded = true" and select **Enter**. Close the dev tools to load the page.

## Next steps

- [About known issues](https://support.fabric.microsoft.com/known-issues)
