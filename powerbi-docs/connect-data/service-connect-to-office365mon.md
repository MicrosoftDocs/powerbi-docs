---
title: Connect to Office365Mon with Power BI
description: Learn how to analyze Office 365 outages and health performance data by using the Power BI and the Office365Mon template app.
author: paulinbar
ms.author: painbar
ms.reviewer: maggiesMSFT
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 07/05/2023
LocalizationGroup: Connect to services
---

# Connect to Office365Mon with Power BI

Analyzing your Office 365 outages and health performance data is easy with Power BI and the Office365Mon template app. Power BI retrieves your data, including outages and health probes, and then builds an out-of-the-box dashboard and reports based on that data.

Connect to the [Office365Mon template app](https://msit.powerbi.com/groups/me/getapps/services/office365mon.office365mon_powerbi_v3) for Power BI.

>[!NOTE]
>You need an Office365Mon admin account to connect to and load the Power BI template app.

## How to connect

1. Select **Connect your data** at the top of the screen:
   
   :::image type="content" source="media/service-connect-to-office365mon/connect-your-data.png" alt-text="Screenshot that shows the Connect your data link." lightbox="media/service-connect-to-office365mon/connect-your-data.png":::

2. In the **Connect to Office365 Power BI Template Pack** window, select **Next**:
   
   :::image type="content" source="media/service-connect-to-office365mon/connect-template.png" alt-text="Screenshot that shows the Connect to Office365 Power BI Template Pack window.":::

3. In the **Authentication method** box, select **OAuth2**. You can change the privacy level if you want. For more information, select **Learn more** in the window. When you're done, select **Sign in and connect**.
   
   :::image type="content" source="media/service-connect-to-office365mon/connect-template-2.png" alt-text="Screenshot that shows connection options in the Connect to Office365 Power BI Template Pack window.":::

4. When prompted, enter your Office365Mon admin credentials and complete the authentication process.

5. After Power BI imports the data, you see a new dashboard, report, and semantic model in your workspace. Select **Office365Mon**.
   
   :::image type="content" source="media/service-connect-to-office365mon/office365mon-dashboard.png" alt-text="Screenshot that shows the Office365Mon dashboard." lightbox="media/service-connect-to-office365mon/office365mon-dashboard.png":::
  
**What now?**

* Try [asking a question in the Q&A box](../consumer/end-user-q-and-a.md) at the top of the dashboard.
* [Change the tiles](../create-reports/service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](../consumer/end-user-tiles.md) to open the underlying report.
* Change the refresh schedule. The semantic model is scheduled to refresh daily. You can change the schedule, or refresh it on demand by selecting **Refresh now** in the workspace.

## Troubleshooting

If you see a **Need admin approval** error when you try to sign in to Office365Mon, the account you're using doesn't have permissions to retrieve the data. You need to use an Office365Mon admin account when you sign in.

## Related content

- [What is Power BI?](../fundamentals/power-bi-overview.md)
- [Get data for Power BI](service-get-data.md)
