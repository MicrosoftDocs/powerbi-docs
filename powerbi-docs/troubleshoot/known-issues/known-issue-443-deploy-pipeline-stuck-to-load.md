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
When using a deployment pipeline, it doesn't ever load.

**Status:** Open

**Product Experience:** Power BI

## Symptoms
The deployment pipeline doesn't load and instead spins endlessly.

## Solutions and workarounds

1. Avoid the use of view permission to the pipeline workspaces.
2. Make use of the Microsoft public api for deployment - [Git integration] (/power-bi/pipelines/selective-deploy).
3. Make manual changes in the browser url and load the pipeline page. Deploy the deployment pipeline. If the page doesn't function properly, append 'unmin=1' to the url. Then validate that the page loads and select **F12** to open the Dev Tools and switch to the **Sources** tab. Select Ctrl+Shift+F and look for this text: a"llSlotsFoldersArtifactRelationsLoaded". Select the second result and set a break point on the line number. Refreshing the page with the Dev Tools opened, should stop on the set break point. Change to the **Console** tab and copy "allSlotsFoldersArtifactRelationsLoaded = true" and select Enter. Close the Dev Tools to load the page.

## Next steps

- [About known issues](https://support.fabric.microsoft.com/known-issues)
