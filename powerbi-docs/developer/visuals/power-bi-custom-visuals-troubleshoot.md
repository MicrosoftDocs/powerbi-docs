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

# Troubleshooting Power BI visuals

This article explains how to diagnose and fix issues that might come up when you develop your visual.

## Error messages

**Pbiviz command not found (or similar errors)**

When you run `pbiviz` in your terminal's command line, you should see the help screen. If you don't, then it is not installed correctly. Make sure you have [NodeJS](environment-setup.md#install-nodejs) version 4.0 or higher installed.
For help installing [pbiviz](environment-setup.md#install-pbiviz) or [NodeJS](environment-setup.md#install-nodejs) see [Set up your environment for developing a Power BI visual](environment-setup.md).

## Debugging from the Power BI server

**Can't find the debug visual in the Visualizations tab**

The debug visual looks like a prompt icon within the **Visualizations** tab.

![Visual selection](media/power-bi-custom-visuals-troubleshoot/powerbi-developer-visual-selection.png)

If you don't see it, make sure you have [enabled developer mode in the Power BI settings](environment-setup.md#set-up-power-bi-service-for-developing-a-visual) within the Power BI settings.

> [!NOTE]
> The debug visual is currently only available in the Power BI service and not in Power BI Desktop or the mobile app. The packaged visual will work in both.

**Can't contact visual server**

Run the visual server with the command `pbiviz start` in your terminal's command line from the root of your visual project.

![pbiviz start command](media/power-bi-custom-visuals-troubleshoot/powerbi-start-visual.png)

If the server's not running, it's likely that your SSL certificates weren't [installed correctly](environment-setup.md#create-and-install-a-certificate).

Feel free to contact the Power BI visuals support team (pbicvsupport@microsoft.com) with any questions, comments, or issues you have.

## Next steps

>[!div class="nextstepaction"]
>[Frequently asked questions about Power BI visuals](power-bi-custom-visuals-faq.yml#organizational-power-bi-visuals)
