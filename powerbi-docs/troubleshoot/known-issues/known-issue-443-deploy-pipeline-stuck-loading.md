---
title: Known issue - deployment pipeline stuck in loading
description: A known issue is posted where deployment pipeline stuck in loading
author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting 
ms.date: 07/27/2023
ms.custom: known-issue-443
---

# Known issue - deployment pipeline stuck in loading
deployment pipeline stuck in loading

**Status:** Open

**Product Experience:** Power BI

## Symptoms
deployment pipeline stuck in loading

## Solutions and workarounds

1. Avoid using viewer permission to the pipeline workspaces if possible. 2. Use our public api for deployment - https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/selective-deploy 3. The user can do some manual changes in the browser and load the pipeline page. The user is able to deploy but the page isn't fully functional. > the user should append 'unmin=1' to the url > After the page loads the user should select 'F12' to open the Dev Tools and switch to the 'Sources' tab > The user should select: Ctrl+Shift+F and look for the following text: allSlotsFoldersArtifactRelationsLoaded > select on the second result and set a break point by clicking on the line number: > Refresh the page with the Dev Tools open, the page should stop on the break point > Then move to the 'Console' tab and copy the part where: allSlotsFoldersArtifactRelationsLoaded = true and select enter > Now close the dev tools and continue loading the page

## Next steps

- [About known issues](https://support.fabric.microsoft.com/known-issues)
