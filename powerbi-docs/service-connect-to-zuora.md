---
title: Connect to Zuora with Power BI
description: Zuora for Power BI
author: SarinaJoan
manager: kfile
ms.reviewer: maggiesMSFT

ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: conceptual
ms.date: 10/24/2018
ms.author: sarinas

LocalizationGroup: Connect to services
---
# Connect to Zuora with Power BI
Zuora for Power BI allows you to visualize important revenue, billing, and subscription data. Use the default dashboard and reports to analyze usage trends, track billings and payments, and monitor recurring revenue, or customize them to meet your own unique dashboard and reporting needs.

Connect to the [Zuora](https://app.powerbi.com/getdata/services/Zuora) for Power BI.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.

   ![](media/service-connect-to-zuora/getdata.png)
2. In the **Services** box, select **Get**.

   ![](media/service-connect-to-zuora/services.png)
3. Select **Zuora** \>  **Get**.

   ![](media/service-connect-to-zuora/zuora.png)
4. Specify your Zuora URL. The URL is typically "<https://www.zuora.com>", see details on [finding those parameters](#FindingParams) below.

   ![](media/service-connect-to-zuora/params.png)
5. For **Authentication Method**, select **Basic** and provide your username and password (case sensitive), then select **Sign In**.

    ![](media/service-connect-to-zuora/creds.png)
6. After approving, the import process will begin automatically. When complete, a new dashboard, report, and model will appear in the Navigation Pane. Select the dashboard to view your imported data.

     ![](media/service-connect-to-zuora/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
The content pack uses the Zuora AQUA API to pull in the following tables:

| Tables |  |  |
| --- | --- | --- |
| Account |InvoiceItemAdjustment |Refund |
| AccountingCode |Payment |RevenueSchedule |
| AccountingPeriod |PaymentMethod |RevenueScheduleItem |
| BillTo |Product |Subscription |
| DateDim |ProductRatePlan |TaxationItem |
| Invoice |ProductRatePlanCharge |Usage |
| InvoiceAdjustment |RatePlan | |
| InvoiceItem |RatePlanCharge | |

It also includes these calculated measures:

| Measure | Description | Pseudo-Calculation |
| --- | --- | --- |
| Account: Payments |Total payment amounts in a time period, based on payment effective date. |SUM (Payment.Amount) <br>WHERE<br>Payment.EffectiveDate =< TimePeriod.EndDate<br>AND    Payment.EffectiveDate >= TimePeriod.StartDate |
| Account: Refunds |Total refund amounts in a time period, based on refund date. Amount is reported as a negative number. |-1*SUM(Refund.Amount)<br>WHERE<br>Refund.RefundDate =< TimePeriod.EndDate<br>AND    Refund.RefundDate >= TimePeriod.StartDate |
| Account: Net Payments |Account Payments plus Account Refunds in a time period. |Account.Payments + Account.Refunds |
| Account: Active Accounts |The count of accounts that were active in a time period. Subscriptions must have started before (or on) time period start date. |COUNT (Account.AccountNumber)<br>WHERE<br>    Subscription.Status != "Expired"<br>AND    Subscription.Status != "Draft"<br>AND    Subscription.SubscriptionStartDate <= TimePeriod.StartDate<br>AND    (Subscription.SubscriptionEndDate > TimePeriod.StartDate<br>OR<br>Subscription.SubscriptionEndDate = null) –evergreen subscription |
| Account: Average Recurring Revenue |Gross MRR per active account in a time period. |Gross MRR / Account.ActiveAccounts |
| Account: Cancelled Subscriptions |The count of accounts that cancelled a subscription in a time period. |COUNT (Account.AccountNumber)<br>WHERE<br>Subscription.Status = "Cancelled"<br>AND    Subscription.SubscriptionStartDate <= TimePeriod.StartDate<br>AND    Subscription.CancelledDate >= TimePeriod.StartDate |
| Account: Payment Errors |Total value of payment errors. |SUM (Payment.Amount)<br>WHERE<br>Payment.Status = "Error" |
| Revenue Schedule Item: Recognized Revenue |Total recognized revenue in an accounting period. |SUM (RevenueScheduleItem.Amount)<br>WHERE<br>AccountingPeriod.StartDate = TimePeriod.StartDate |
| Subscription: New Subscriptions |Count of new subscriptions in a time period. |COUNT (Subscription.ID)<br>WHERE<br>Subscription.Version = "1"<br>AND    Subscription.CreatedDate <= TimePeriod.EndDate<br>AND    Subscription.CreatedDate >= TimePeriod.StartDate |
| Invoice: Invoice Items |Total invoice item charge amounts in a time period. |SUM (InvoiceItem.ChargeAmount)<br>WHERE<br>    Invoice.Status = "Posted"<br>AND    Invoice.InvoiceDate <= TimePeriod.EndDate<br>AND    Invoice.InvoiceDate >= TimePeriod.StartDate |
| Invoice: Taxation Items |Total taxation item tax amounts in a time period. |SUM (TaxationItem.TaxAmount)<br>WHERE<br>Invoice.Status = "Posted"<br>AND    Invoice.InvoiceDate <= TimePeriod.EndDate<br>AND    Invoice.InvoiceDate >= TimePeriod.StartDate |
| Invoice: Invoice Item Adjustments |Total invoice item adjustment amounts in a time period. |SUM (InvoiceItemAdjustment.Amount) <br>WHERE<br>    Invoice.Status = "Posted"<br>AND    InvoiceItemAdjustment.AdjustmentDate <= TimePeriod.EndDate<br>AND    InvoiceItemAdjustment.AdjustmentDate >= TimePeriod.StartDate |
| Invoice: Invoice Adjustments |Total invoice adjustment amounts in a time period. |SUM (InvoiceAdjustment.Amount) <br>WHERE<br>    Invoice.Status = "Posted"<br>AND    InvoiceAdjustment.AdjustmentDate <= TimePeriod.EndDate<br>AND    InvoiceAdjustment.AdjustmentDate >= TimePeriod.StartDate |
| Invoice: Net Billings |Sum of invoice items, taxation items, invoice item adjustments, and invoice adjustments in a time period. |Invoice.InvoiceItems + Invoice.TaxationItems + Invoice.InvoiceItemAdjustments + Invoice.InvoiceAdjustments |
| Invoice: Invoice Aging Balance |Sum of posted invoice balances. |SUM (Invoice.Balance) <br>WHERE<br>    Invoice.Status = "Posted" |
| Invoice: Gross Billings |Sum of invoice item charge amounts for posted invoices in a time period. |SUM (InvoiceItem.ChargeAmount) <br>WHERE<br>    Invoice.Status = "Posted"<br>AND    Invoice.InvoiceDate <= TimePeriod.EndDate<br>AND    Invoice.InvoiceDate >= TimePeriod.StartDate |
| Invoice: Total Adjustments |Sum of processed invoice adjustments and invoice item adjustments associated with posted invoices. |SUM (InvoiceAdjustment.Amount) <br>WHERE<br>    Invoice.Status = "Posted"<br>AND    InvoiceAdjustment.Status = "Processed"<br>+<br>SUM (InvoiceItemAdjustment.Amount) <br>WHERE<br>    Invoice.Status = "Posted"<br>AND    invoiceItemAdjustment.Status = "Processed" |
| Rate Plan Charge: Gross MRR |Sum of monthly recurring revenue from subscriptions in a time period. |SUM (RatePlanCharge.MRR) <br>WHERE<br>    Subscription.Status != "Expired"<br>AND    Subscription.Status != "Draft"<br>AND    RatePlanCharge.EffectiveStartDate <= TimePeriod.StartDate<br>AND        RatePlanCharge.EffectiveEndDate > TimePeriod.StartDate<br>    OR    RatePlanCharge.EffectiveEndDate = null --evergreen subscription |

## System requirements
Access to the Zuora API is required.

<a name="FindingParams"></a>

## Finding parameters
Provide the URL you typically sign into to access your Zuora data. The valid options are:  

* https://www.zuora.com  
* The URL corresponding to your service instance  

## Troubleshooting
The Zuora content pack pulls in many different aspects of your Zuora account. If you don't use certain features, you may see corresponding tiles/reports empty. Contact Power BI Support if you have any issues loading.

## Next steps
[Get started in Power BI](service-get-started.md)

[Get data in Power BI](service-get-data.md)
