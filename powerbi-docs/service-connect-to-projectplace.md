---
title: Connect to Projectplace with Power BI
description: Projectplace for Power BI
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
# Connect to Projectplace by Planview with Power BI
With the Projectplace by Planview content pack, you can visualize your collaborative project data in entirely new ways directly in Power BI. Use your Projectplace sign-in credentials to interactively view key project statistics, find out who your most active and productive team members are, and identify at-risk cards and activities across projects in your Projectplace account. You can also extend the out-of-the box dashboard and reports to get the insights that are most important to you.

[Connect to the Projectplace content pack in Power BI](https://app.powerbi.com/getdata/services/projectplace)

>[!NOTE]
>To import your Projectplace data into Power BI, you must be a Projectplace user. See additional requirements below.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
    ![](media/service-connect-to-projectplace/get.png)
2. In the **Services** box, select **Get**.
   
    ![](media/service-connect-to-projectplace/services.png)
3. On the Power BI page, select **Projectplace by Planview**, then select **Get**:  
   
    ![](media/service-connect-to-projectplace/projectplace.png)
4. In the OData Feed URL text box, enter the URL for the Projectplace OData feed you want to use, as shown in the following image:
   
    ![](media/service-connect-to-projectplace/params.png)
5. On the Authentication Method list, select **OAuth** if it is not already selected. Hit **Sign In** and follow the login flow.  
   
   ![](media/service-connect-to-projectplace/creds.png)
6. On the left pane, select **Projectplace** from the list of dashboards. Power BI imports Projectplace data into the dashboard. Note that the data may take some time to load.  
   
    The dashboard contains tiles that display data from your Projectplace database. The following image shows an example of the default Projectplace dashboard in Power BI.
   
    ![](media/service-connect-to-projectplace/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## System requirements
To import your Projectplace data into Power BI, you must be a Projectplace user. This procedure assumes you have already signed in to the Microsoft Power BI home page with a Power BI account. If you do not have a Power BI account, go to [powerbi.com](https://powerbi.microsoft.com/get-started/), and under **Power BI - Cloud collaboration and sharing**, select **Try free**. Then click **Get Data**.

## Next steps
[What is Power BI?](power-bi-overview.md)

[Power BI - Basic Concepts](consumer/end-user-basic-concepts.md)

