---
title: Troubleshooting Power BI developer environment setup
description: This article discusses some common issues you might encounter when developing or creating a custom Power BI visual.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 05/06/2021
---

# Troubleshooting your Power BI environment setup

This article explains how to diagnose and fix common problems that can occur when setting up your developer environment.

## Can't start up pbiviz

* **Error message: *pbiviz command not found* (or similar message)**

    When you run `pbiviz` in your terminal's command line, you should see the help screen. If you don't, then it is not installed correctly. Make sure you installed [NodeJS](environment-setup.md#install-nodejs) version 4.0 or higher.
    For help installing [pbiviz](environment-setup.md#install-pbiviz) or [NodeJS](environment-setup.md#install-nodejs) see [Set up your environment for developing a Power BI visual](environment-setup.md).

## Connecting to the Power BI service

* **Can't connect to Power BI server**

    Run the visual server with the command `pbiviz start` in your terminal's command line *from the root of your visual project*.

    ![pbiviz start command](media/power-bi-custom-visuals-troubleshoot/powerbi-start-visual.png)

    If the server's not running, your SSL certificates were probably not [installed correctly](environment-setup.md#create-and-install-a-certificate). To install your SSL certificates see [Create and install a certificate](environment-setup.md#create-and-install-a-certificate).

* **Developer visual doesn't appear in the Visualizations tab**

    The developer visual looks like a prompt icon within the **Visualizations** tab.

    ![Visual selection](media/power-bi-custom-visuals-troubleshoot/powerbi-developer-visual-selection.png)

    If you don't see it, make sure you have [enabled developer mode in the Power BI settings](environment-setup.md#set-up-power-bi-service-for-developing-a-visual).

    > [!NOTE]
    > The developer visual is currently only available in the **Power BI service** and not in Power BI Desktop or the mobile app. The packaged visual will work everywhere.

Feel free to contact the Power BI visuals support team (pbicvsupport@microsoft.com) with any questions, comments, or issues you have.

## Next steps

>[!div class="nextstepaction"]
>[Setting up your Power BI environment](environment-setup.md)

>[!div class="nextstepaction"]
>[Frequently asked questions about Power BI visuals](power-bi-custom-visuals-faq.yml#organizational-power-bi-visuals)
