---
title: Connect to Troux with Power BI
description: Troux for Power BI
author: SarinaJoan
manager: kfile
ms.reviewer: maggiesMSFT

ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: conceptual
ms.date: 10/16/2017
ms.author: sarinas

LocalizationGroup: Connect to services
---
# Connect to Troux for Power BI
With the Troux content pack, you can visualize your Enterprise Architecture repository in entirely new ways directly in Power BI. The content pack offers a set of insights on your business capabilities, the applications that deliver those capabilities, and the technologies that support those applications that can be fully customized using Power BI.

Connect to the [Troux content pack](https://app.powerbi.com/getdata/services/troux) for Power BI.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-troux/getdata.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-troux/services.png)
3. Select **Troux** \>  **Get**.
   
   ![](media/service-connect-to-troux/troux.png)
4. Specify your Troux OData URL. See details on [finding those parameters](#FindingParams) below.
   
   ![](media/service-connect-to-troux/params.png)
5. For **Authentication Method**, select **Basic** and provide your username and password (case sensitive), then select **Sign In**.
   
    ![](media/service-connect-to-troux/creds.png)
6. After approving, the import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.
   
     ![](media/service-connect-to-troux/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## System requirements
Access to the Troux OData feed and Troux 9.5.1 or higher is required.

<a name="FindingParams"></a>

## Finding parameters
Your Customer Care team can provide your unique Troux OData feed URL to you

## Troubleshooting
If you are seeing a timeout error after providing credentials, try connecting again.

## Next steps
[Get started in Power BI](service-get-started.md)

[Get data in Power BI](service-get-data.md)

