---
title: Install Power BI Desktop optimized for Power BI Report Server
description: Learn how to install Power BI Desktop optimized for Power BI Report Server
services: powerbi
documentationcenter: ''
author: maggiesMSFT
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/05/2017
ms.author: maggies

---
# Install Power BI Desktop optimized for Power BI Report Server
Learn how to install Power BI Desktop optimized for Power BI Report Server.

To create Power BI reports for Power BI Report Server, you need to download and install Power BI Desktop optimized for Power BI Report Server. This release is different from the Power BI Desktop used with the Power BI service. Using this release makes sure that the report server can interact with a known version of the reports and model. 

> [!NOTE]
> You can install Power BI Desktop and Power BI Desktop optimized for Power BI Report Server side by side on the same computer.

## Download and install Power BI Desktop

The easiest way to be sure you have the most up-to-date version of Power BI Desktop optimized for Power BI Report Server is to start from the web portal of your report server.

1. In the report server web portal, select the **Download** arrow > **Power BI Desktop**.

    ![Download Power BI Desktop from the web portal](media/install-powerbi-desktop/report-server-download-web-portal.png)

    Or you can go directly to [Microsoft Power BI Desktop](https://go.microsoft.com/fwlink/?linkid=861076) (Optimized for Power BI Report Server - October 2017) in the Microsoft Download Center.

2. In the Download Center page, select **Download**.

3. Depending on your computer, select: 

    - **PBIDesktopRS.msi** (the 32-bit version) or

    - **PBIDesktopRS_x64.msi** (the 64-bit version).

1. After you download the installer, run the Power BI Desktop (October 2017) Setup Wizard.
2. At the end of the installation, check **Start Power BI Desktop now**.
   
    It starts automatically and you're ready to go.

## Verify you are using the correct version
You can verify that you are using the correct Power BI Desktop by looking at the launch screen or title bar within Power BI Desktop. The title bar will indicated the release month and year of the release.

![Title bar for Power BI Desktop optimized for Power BI Report Server](media/quickstart-create-powerbi-report/report-server-desktop-october-2017-version.png)

The Power BI Desktop version for the Power BI service doesn't have the month and year in the title bar.

## File extension association
If you installed both Power BI Desktop and Power BI Desktop optimized for Power BI Report Server on the same machine, the last install of Power BI Desktop will have the file association with .pbix. This means that when you double click on a pbix file, it will launch the Power BI Desktop that was last installed.

If you had Power BI Desktop and then installed Power BI Desktop optimized for Power BI Report Server, all pbix files will open in Power BI Desktop optimized for Power BI Report Server by default. If you would rather Power BI Desktop be the default to launch when opening a pbix file, reinstall Power BI Desktop from the Power BI service.

You can always open the version of Power BI Desktop you want to use first. And then open the file from within Power BI Desktop.

Editing a Power BI report from within Power BI Report Server, or creating a new Power BI report from the web portal, will always open the correct version of Power BI Destop.

## Next steps
Now that you have Power BI Desktop installed, you can start creating Power BI reports.

[Quickstart: Create a Power BI report for Power BI Report Server](quickstart-create-powerbi-report.md)  
[Get started with Power BI Desktop](../desktop-getting-started.md)  
Guided learning: [Getting started with Power BI Desktop](../guided-learning/gettingdata.yml#step-2)  
[User handbook overview, Power BI Report Server](user-handbook-overview.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

