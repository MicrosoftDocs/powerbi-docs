---
title: Troubleshooting how to develop Power BI custom visuals
description: This article discusses some common issues you may encounter when developing or creating a custom Power BI visual.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-developer
ms.topic: conceptual
ms.subservice: powerbi-custom-visuals
ms.date: 11/06/2018
---

# Troubleshoot Power BI custom visuals

## Debug

**Pbiviz command not found (or similar errors)**

When you run `pbiviz` in your terminal's command line, you should see the help screen. If not, then it is not installed correctly. Make sure you have at least the 4.0 version of NodeJS installed.

**Can't find the debug visual in the Visualizations tab**

The debug visual looks like a prompt icon within the **Visualizations** tab.

![Visual selection](media/power-bi-custom-visuals-troubleshoot/powerbi-developer-visual-selection.png)

If you don't see it, make sure you have enabled it within the Power BI settings.

> [!NOTE]
> The debug visual is currently only available in the Power BI service and not in Power BI Desktop or the mobile app. The packaged visual will still work everywhere.

**Can't contact visual server**

Run the visual server with the command `pbiviz start` in your terminal's command line from the root of your visual project. If the server is not running, it is likely that your SSL certificates weren't installed correctly.

Feel free to contact the custom visuals support team: *pbicvsupport@microsoft.com* with any questions, comments, or issues you have.

## Next steps

For more information, visit [Frequently asked questions about Power BI custom visuals](power-bi-custom-visuals-faq.md#organizational-custom-visuals).
