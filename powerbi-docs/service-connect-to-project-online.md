---
title: Connect to Project Online with Power BI
description: Project Online for Power BI
author: SarinaJoan
manager: kfile
ms.reviewer: maggiesMSFT

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 10/16/2017
ms.author: sarinas

LocalizationGroup: Connect to services
---
# Connect to Project Online with Power BI
Microsoft Project Online is a flexible online solution for project portfolio management (PPM) and everyday work. Project Online enables organizations to get started, prioritize project portfolio investments and deliver the intended business value. The Project Online content pack for Power BI allows you to unlock insight from Project Online to help manage projects, portfolios and resources.

Connect to the [Project Online content pack](https://app.powerbi.com/getdata/services/project-online) for Power BI.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
    ![](media/service-connect-to-project-online/getdata.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-project-online/services.png)
3. Select **Microsoft Project Online** \> **Get**.
   
   ![](media/service-connect-to-project-online/mproject.png)
4. In the **Project Web App URL** text box, enter the URL for the Project Web Add (PWA) you want to connect to and hit **Next**. Note this may differ from the example if you have a custom domain. In the **PWA Site Language** text box, type the number that corresponds to your PWA site language. Type the single digit '1' for English, '2' for French, '3' for German, '4' for Portuguese (Brazil), '5' for Portuguese (Portugal) and '6' for Spanish. 
   
    ![](media/service-connect-to-project-online/params.png)
5. For Authentication Method, select **oAuth2** \> **Sign In**. When prompted, enter your Project Online credentials and follow the authentication process.
   
    ![](media/service-connect-to-project-online/creds.png)
    
Note that you need to have Portfolio Viewer, Portfolio Manager or Administrator permissions for the Project Web App you are connecting to.

6. You’ll see a notification indicating your data is loading. Depending on the size of your account this may take some time. After Power BI imports the data you will see a new dashboard, 13 reports, and dataset in the left navigation pane. This is the default dashboard that Power BI created to display your data. You can modify this dashboard to display your data in any way you want.

   ![](media/service-connect-to-project-online/dashboard2.png)

7. Once your dashboard and reports are ready, go ahead and start exploring your Project Online data! The Content Pack comes with 13 rich and detailed reports for the Portfolio Overview (6 report pages), Resource Overview (5 report pages) and Project Status (2 report pages). 

   ![](media/service-connect-to-project-online/report1.png)
   
   ![](media/service-connect-to-project-online/report3.png)
   
   ![](media/service-connect-to-project-online/report2.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

**Expand the Content Pack**

Download the [GitHub PBIT file](https://github.com/OfficeDev/Project-Power-BI-Content-Packs) to further customize and update the Content Pack

## Next steps
[Get started in Power BI](service-get-started.md)

[Get data in Power BI](service-get-data.md)

