---
title: Connect to Xero with Power BI
description: Xero  for Power BI
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
# Connect to Xero with Power BI
Xero is easy to use online accounting software that’s designed specifically for small businesses. Create compelling visualizations based on your Xero financials with this Power BI content pack. Your default dashboard includes many small business metrics like cash position, revenue vs. expenses, profit loss trend, debtor days and return on investment.

Connect to the [Xero content pack](https://app.powerbi.com/getdata/services/xero) for Power BI or learn more about the [Xero and Power BI](https://help.xero.com/Power-BI) integration.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-xero/getdata.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-xero/services.png)
3. Select **Xero** \>  **Get**.
   
   ![](media/service-connect-to-xero/connect.png)
4. Enter a nickname for the organisation associated with your Xero account. Anything will do, this is mostly to help users with multiple Xero organizations keep them all straight. See details on [below](#FindingParams).
   
   ![](media/service-connect-to-xero/params.png)
5. For **Authentication Method** and select **OAuth**, when prompted sign into your Xero account and select the organisation to connect to. Once the login completes, select **Sign In** to start the loading process.
   
    ![](media/service-connect-to-xero/creds.png)
   
    ![](media/service-connect-to-xero/creds2.png)
6. After approving, the import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.
   
     ![](media/service-connect-to-xero/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
The content pack dashboard includes tiles and metrics that cover a variety of areas, with corresponding reports to learn more:  

| Area | Dashboard Tiles | Report |
| --- | --- | --- |
| Cash |Daily cash flow <br>Cash in <br>Cash out <br>Closing balance by account <br>Closing balance today |Bank Accounts |
| Customer |Invoiced sales <br>Invoiced sales by customer <br>Invoiced sales growth trend <br>Invoices due <br>Outstanding receivables <br>Overdue receivables |Customer <br>Inventory |
| Supplier |Billed purchases <br>Billed purchases by supplier <br>Billed purchases growth trend <br> Bills due <br>Outstanding payables <br>Overdue payables |Suppliers <br>Inventory |
| Inventory |Monthly sales amount by product |Inventory |
| Profit and loss |Monthly profit and loss <br>Net profit this fiscal year <br>Net profit this month <br>Top expense accounts |Profit and Loss |
| Balance sheet |Total assets <br>Total liabilities <br>Equity |Balance Sheet |
| Health |Current ratio <br>Gross profit percentage <br> Return on total assets <br>Total liabilities to equity ratio |Health <br>Glossary and Technical Notes |

The dataset also includes the following tables to customize your reports and dashboards:  

* Addresses  
* Alerts  
* Bank Statement Daily Balance  
* Bank Statements  
* Contacts  
* Expense Claims  
* Invoice Line Items  
* Invoices  
* Items  
* Month End  
* Organisation  
* Trial Balance  
* Xero Accounts

## System requirements
The following roles are required to access the Xero content pack: "Standard + Reports" or "Advisor".

<a name="FindingParams"></a>

## Finding parameters
Provide a name for your organisation to track in Power BI. This allows you to connect to multiple different organisations. Note that you cannot connect to the same organisation multiple times, as it will affect the scheduled refresh.   

## Troubleshooting
* Xero users must have the following roles to access the Xero content pack for Power BI: "Standard + Reports" or "Advisor". The content pack relies on the user-based permissions to access reporting data through Power BI.  
* If you receieve a failure after loading for some time, verify how long it took to see that error message. Note that the access token provided by Xero is only valid for 30min so accounts with more data than can be loaded in that timeframe will fail. We're actively working to improve this.
* During the load the tiles on the dashboard will be in a generic loading state. This is not expected to change until the full load completes. If you receive a notification that your load completed but the tiles are still loading, try refreshing the dashboard tiles using the ... in the top right of your dashboard.
* If your content pack fails to refresh, please check if you have connected to the same organisation more than once in Power BI. Xero only allows a single active connection to an organisation and you may see an error indicating your credentials are invalid if you connect to the same one more than once.  
* For issues connecting the Xero content pack for Power BI like error messages or very slow load times, first clear the cache / cookies and restart the browser, then reconnect to Power BI.  

For other issues, please file a ticket at http://support.powerbi.com if the issue persists.

## Next steps
[Get started in Power BI](service-get-started.md)

[Get data in Power BI](service-get-data.md)

