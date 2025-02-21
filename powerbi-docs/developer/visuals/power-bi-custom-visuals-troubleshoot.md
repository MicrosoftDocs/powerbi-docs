---
title: Troubleshooting Power BI developer environment setup
description: This article discusses some common issues you might come across when developing or creating a custom Power BI visual.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: troubleshooting
ms.date: 12/21/2024
# customer intent: As a Power BI developer, I want to learn how to troubleshoot common issues that might occur when setting up my developer environment for creating custom Power BI visuals so that I can develop my visuals effectively.
---

# Troubleshoot your Power BI developer environment setup for custom visuals

This article explains how to diagnose and fix the following common problems that can occur when setting up your developer environment for creating custom Power BI visuals.

* [Can't start up pbiviz](#cant-start-up-pbiviz)
* [Can't connect to the Power BI service](#cant-connect-to-the-power-bi-service)
* [Can't see the developer icon on the visualization tab](#cant-see-the-developer-icon-on-the-visualizations-tab)
* [Contacting the support team](#contacting-the-support-team)

## Can't start up pbiviz

When your environment isn't set up correctly, you might receive an error such as: *pbiviz command not found*

When you run `pbiviz` in your terminal's command line, you should see the help screen. If you don't, make sure you have [NodeJS](environment-setup.md#install-nodejs) version 4.0 or higher installed.
For help with installing [pbiviz](environment-setup.md#install-pbiviz) or [NodeJS](environment-setup.md#install-nodejs) see [Set up your environment for developing a Power BI visual](environment-setup.md).

## Can't connect to the Power BI service

Run the visual server with the command `pbiviz start` in your terminal's command line *from the root of your visual project*.

:::image type="content" source="media/power-bi-custom-visuals-troubleshoot/powerbi-start-visual.png" alt-text="Screenshot of powershell running the p b i viz start command showing the server starting.":::

If the server's not running, your SSL certificates were probably not installed correctly. To install your SSL certificates, see [Create an SSL certificate](create-ssl-certificate.md).

## Can't see the developer icon on the Visualizations tab

The developer icon looks like a prompt icon within the **Visualizations** tab.

![Visual selection](media/power-bi-custom-visuals-troubleshoot/powerbi-developer-visual-selection.png)

If you don't see it, make sure you have [enabled developer mode in the Power BI settings](environment-setup.md#enable-developer-mode).

> [!NOTE]
> The developer visual is currently only available in the **Power BI service** and not in Power BI Desktop or the mobile app. The packaged visual will work everywhere.

## Contacting the support team

Feel free to contact the Power BI visuals support team <pbicvsupport@microsoft.com> with any questions, comments, or issues you have.  
This support channel is for custom visuals developers in the process of developing their own visuals.

For customer experience issues when using custom Power BI visuals, submit a case request via the [Power Platform admin center portal](https://admin.powerplatform.microsoft.com/newsupportticket/powerbipro).

## Related content

* [Setting up your Power BI environment](environment-setup.md)
* [Frequently asked questions about Power BI visuals](power-bi-custom-visuals-faq.yml)

More questions? [Try the Power BI Community](https://community.powerbi.com/)  
