---
title: Troubleshooting Power BI custom visual
description: This article discusses some common issues you may encounter when developing and creating a Power BI custom issue.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-developer
ms.topic: conceptual
ms.date: 11/02/2018
---

# Troubleshooting Power BI custom visual

## Developing custom visuals

**Pbiviz command not found (or similar errors)**

If you run `pbiviz` in your terminal / command line, you should see the help screen. If not, it is not installed correctly. Make sure you have at least the 4.0 version of NodeJS installed.

For more information, see [Install NodeJS and the Power BI tools](#install-nodejs-and-the-power-bi-tools)...

**Cannot find the debug visual in the Visualizations tab**

The debug visual looks like a prompt icon within the **Visualizations** tab.

![Visual selection](../media/power-bi-custom-visuals-troubleshoot/powerbi-developer-visual-selection.png)

If you don't see it, make sure you have enabled it within the Power BI settings.

> [!NOTE]
> The debug visual is currently only available in the Power BI service and not in Power BI Desktop or the mobile app. The packaged visual will still work everywhere.

For more information, see [Enable live preview of developer visual](#enable-live-preview-of-developer-visual).

**Can't contact visual server**

Run the visual server with the command `pbiviz start` in your terminal / command line from the root of your visual project. If the server is running, it is likely that your SSL vertificates weren't installed correctly.

For more information, see [Running your visual](#running-your-visual) or [Server certificate setup](#ssl-setup).