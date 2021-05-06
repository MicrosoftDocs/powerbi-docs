---
title: Troubleshooting how to develop Power BI visuals
description: This article discusses some common issues you might encounter when developing or creating a custom Power BI visual.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: troubleshooting
ms.date: 05/06/2021
---

# Troubleshoot Power BI visuals

## Debug

**pbiviz command not found (or similar errors)**

When you run `pbiviz` in your terminal's command line, you should see the help screen. If not, then it isn't installed correctly. Make sure you have at least the 4.0 version of NodeJS installed.
To install [pbiviz](environment-setup.md#install-pbiviz) or [NodeJS](environment-setup.md#install-nodejs) see [Set up your environment for developing a Power BI visual](environment-setup.md).

**Can't find the debug visual in the Visualizations tab**

The debug visual looks like a prompt icon within the **Visualizations** tab.

![Visual selection](media/power-bi-custom-visuals-troubleshoot/powerbi-developer-visual-selection.png)

If you don't see it, make sure you have [enabled it within the Power BI settings](environment-setup.md#set-up-power-bi-service-for-developing-a-visual).

> [!NOTE]
> The debug visual is currently only available in the Power BI service and not in Power BI Desktop or the mobile app. The packaged visual will still work everywhere.

**Can't contact visual server**

Run the visual server with the command `pbiviz start` in your terminal's command line from the root of your visual project. If the server isn't running, it's likely that your SSL certificates weren't installed correctly.

Feel free to contact the Power BI visuals support team (pbicvsupport@microsoft.com) with any questions, comments, or issues you have.

## Next steps

>[!div class="nextstepaction"]
>[Frequently asked questions about Power BI visuals](power-bi-custom-visuals-faq.yml#organizational-power-bi-visuals)
