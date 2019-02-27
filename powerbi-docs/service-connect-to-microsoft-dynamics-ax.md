---
title: Connect to Microsoft Dynamics AX content pack with Power BI
description: Microsoft Dynamics AX content pack for Power BI
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
# Connect to Microsoft Dynamics AX content pack with Power BI
Microsoft Dynamics AX has three Power BI content packs targeted at different business users. The Financial Performance content pack, designed specifically for CFOs, provides access to insights about your organization’s financial performance. The Retail Channel Performance content pack is targeted for channel managers focuses on sales performance to predict trends and uncover insights by drawing directly from Retail & Commerce data. The Cost Management is designed for COOs and CFOs and provides details on operation performance.

Connect to the Microsoft Dynamics AX [Retail Channel Performance](https://app.powerbi.com/getdata/services/dynamics-ax-retail-channel-performance), the [Financial Performance](https://app.powerbi.com/getdata/services/dynamics-ax-financial-performance) or the [Cost Management](https://app.powerbi.com/getdata/services/dynamics-ax-cost-management) content pack for Power BI.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-microsoft-dynamics-ax/getdata.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-microsoft-dynamics-ax/services.png)
3. Select one of the Dynamics AX content packs and choose **Get**.
   
   ![](media/service-connect-to-microsoft-dynamics-ax/mdax.png)
4. Specify the URL of your Dynamics AX 7 environment. See details on [finding those parameters](#FindingParams) below.
   
   ![](media/service-connect-to-microsoft-dynamics-ax/params.png)
5. For **Authentication Method**, select **oAuth2** \> **Sign In**. When prompted, enter your Dynamics AX credentials.
   
    ![](media/service-connect-to-microsoft-dynamics-ax/creds.png)
   
    ![](media/service-connect-to-microsoft-dynamics-ax/creds2.png)
6. After approving, the import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.
   
     ![](media/service-connect-to-microsoft-dynamics-ax/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
The content pack uses the Dynamics AX 7 OData feed to import data related to Retail Channel, Financial, and Cost Management performance respectively.

## System requirements
This content pack requires a Dynamics AX 7 environment URL and the user should have access to the OData feed.

## Finding parameters
<a name="FindingParams"></a>

The Dynamics AX 7 environment URL can be found in the browser when the user signs in. Just copy the URL of the root Dynamics AX environment into the Power BI dialog.

## Troubleshooting
The data may take some time to load depending on the size of your instance. If you're seeing empty reports within Power BI, please confirm you have access to the OData tables required for the reports.

## Next steps
[Get started in Power BI](service-get-started.md)

[Get data in Power BI](service-get-data.md)

