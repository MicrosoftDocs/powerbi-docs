---
title: Connect to QuickBooks Online with Power BI
description: QuickBooks Online for Power BI
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
# Connect to QuickBooks Online with Power BI
When you connect to your QuickBooks Online data from Power BI you immediately get a Power BI dashboard and Power BI reports that provide insights about your business cash flow, profitability, customers, and more. Use the dashboard and reports as they are, or customize them to highlight the information you care most about. The data is refreshed automatically once a day.

Connect to the [QuickBooks Online content pack](https://dxt.powerbi.com/getdata/services/quickbooks-online) for Power BI.

>[!NOTE]
>To import your QuickBooks Online data into Power BI, you need to be an admin on your QuickBooks Online account and sign in with your admin account credentials. You can't use this connector with QuickBooks Desktop software. 

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-quickbooks-online/pbi_getdata.png) 
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-quickbooks-online/pbi_getservices.png) 
3. Select **QuickBooks Online**, then select **Get**.
   
   ![](media/service-connect-to-quickbooks-online/qbo.png)
4. Select **oAuth2** for Authentication Method and select **Sign In**. 
5. When prompted, enter your QuickBooks Online credentials and follow the QuickBooks Online authentication process. If you are already signed in to QuickBooks Online in your browser, you may not be prompted for credentials.
   >[!NOTE]
   >You need admin credentials for your QuickBooks Online account.
6. Select the company you would like to connect to Power BI in the next screen.
   
   ![](media/service-connect-to-quickbooks-online/pbi_qbo_almost.png)
7. Select **Authorize** in the next screen to begin the import process. This can take a few minutes depending on the size of your company data. 
   
   ![](media/service-connect-to-quickbooks-online/pbi_qbo_authorizesm.png)
   
   After Power BI imports the data, you see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*.
   
   ![](media/service-connect-to-quickbooks-online/pbi_qbo_leftnavnew.png)
8. Select the QuickBooks Online dashboard. This is the dashboard Power BI created automatically to display your imported data. You can modify this dashboard to display your data any way you want. 
   
   ![](media/service-connect-to-quickbooks-online/pbi_qbo_dash.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## Troubleshooting
**“Oops! An error has occurred"**

If you get this message after selecting **Authorize**:

“Oops! An error has occurred." Please close this window and try again.

The application has already been subscribed to by another user for this company. Please contact [admin email] to make changes to this subscription.”

![](media/service-connect-to-quickbooks-online/pbi_qbo_oopssm.png)

... this means another admin in your company has already connected to your company data with Power BI. Ask that admin to share the dashboard with you. Currently, only one admin user can connect a particular QuickBooks Online company dataset to Power BI. After Power BI creates the dashboard, the admin can shared it with multiple colleagues on the same Power BI tenants.

**"This app is not set up to allow connections from your country"**

Currently Power BI only supports US editions of QuickBooks Online. 

![](media/service-connect-to-quickbooks-online/pbi_qbo_countrynotsupported.png)

## Next steps
[What is Power BI?](power-bi-overview.md)

[Power BI - Basic Concepts](consumer/end-user-basic-concepts.md)

