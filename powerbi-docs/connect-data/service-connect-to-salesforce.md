---
title: Connect to Salesforce with Power BI Desktop
description: "Learn how to connect to Salesforce Analytics for Sales Managers in Power BI. Install the template app to analyze sales pipelines, accounts, leads, and KPIs with interactive visuals."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 10/27/2025
ai-usage: ai-assisted
LocalizationGroup: Connect to services
---

# Connect to Salesforce with Power BI Desktop

> [!NOTE]
> This template app may contain outdated UI elements and screenshots. For the most current Salesforce connector information, see the [Salesforce connector reference](/power-query/connectors/salesforcereports).

The Salesforce Analytics for Sales Managers template app includes visuals and insights for analyzing your marketing effort.

The app's out-of-the-box dashboard provides key metrics, such as your sales pipeline, best accounts, and KPIs. You can drill down into the report for more details on each aspect. Fully interactive visuals help you explore your data further.

In this article we walk through the app using sample data to give you an idea of how you can use the app to gain key insights into your sales data.

## Prerequisites

- Power BI Pro or Premium Per User (PPU) license
- A marketing, developer, or admin Salesforce subscription

## Install the app

1. Click the following link to get to the app: [Salesforce Analytics for Sales Managers template app.](https://app.powerbi.com/groups/me/getapps/services/pbi-contentpacks.salesforceanalytics)
1. Once you're on the App's AppSource page, click [**GET IT NOW**](https://app.powerbi.com/groups/me/getapps/services/pbi-contentpacks.salesforceanalytics).

    :::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-appsource-icon.png" alt-text="Screenshot of the app in AppSource.":::

1. When prompted, select **Install**. Once the app has installed, you will see it on your Apps page.

   :::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-apps-page-icon.png" alt-text="Screenshot of the app on the Apps page.":::

## Connect to data sources

1. Click the icon on your Apps page to open the app. The app opens, showing sample data.
1. Select the **Connect your data** link on the banner at the top of the page.

   :::image type="content" source="media/service-connect-to-salesforce/power-bi-salesforce-analytics-connect-data.png" alt-text="Screenshot of the connect your data link.":::

1. The parameters dialog will appear. There are no required parameters. Click **Next**.

   :::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-parameters-dialog.png" alt-text="Screenshot of the parameters dialog.":::

1. The authentication method dialog will appear. Recommended values are prepopulated. Don't change these unless you have specific knowledge of different values. Click **Sign in and connect**.

   :::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-authentication-dialog.png" alt-text="Screenshot of the authentication dialog.":::

1. When prompted, sign into Salesforce.

   The report will connect to the data sources and be populated with up-to-date data. During this time you will see sample data and that refresh is in progress.

   :::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-refresh-monitor.png" alt-text="Screenshot of the refresh in progress indicator.":::

## What does the KPI dashboard tell us?

When you open the app, you'll see the KPI dashboard. The KPI dashboard shows us an overall view of the key metrics from all the dashboards. Click the arrows to get to the individual dashboards.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-kpi-overall.png" alt-text="Screenshot of the KPI dashboard.":::

## What does the Sales Manager dashboard tell us?

The Sales Manager dashboard and underlying report focus on a typical sales challenge: providing a total sales analysis over a certain period.

Using the dashboard to look at the sample data, we're going see how to:

- Understand how much we can generate from the total open opportunities that a Sales company has.
- Identify which areas we should focus on in the total sales life cycle.
- Spot loopholes we should look into.

Now let's look at the various components of the dashboard.

The top two visuals show us the total number of open opportunities we have and the revenue we can expect to generate from them.

The Opportunity Sales Stage visual shows the position of the opportunities in the sales pipeline. Select any stage on the sales pipeline stage to see its impact on the whole sales process. Now we can analyze the revenue that corresponds with that stage.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-sales-manager-dashboard.png" alt-text="Screenshot of the Sales Manager dashboard.":::

If you click on any one of the industries in the Share of Industry visual, it shows the share of the industry your sales team is working on. Let's click on "Apparel" for example.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-share-of-industry.png" alt-text="Screenshot of the Share of Industry visual.":::

When we click on "Apparel", we see that the account we have in this sector is one of the top ten critical opportunities with respect to revenue. We can conclude that this is an opportunity that deserves our focus on a priority basis, since its expected revenue is among the highest as compared to other accounts.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-top-ten-critical-opportunity.png" alt-text="Screenshot of the Top Ten Critical Opportunities visual.":::

## What does the Account dashboard tell us?

The Account dashboard lets you oversee how you are performing in all your accounts. It tells you which are your most profitable accounts. Let's analyze the accounts for apparel.

On the dashboard, select "Apparel" on the Account dashboard's Account Share Industry Wise visual.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-account-share-industry-wise.png" alt-text="Screenshot of the Account Share Industry Wise visual.":::

 You'll see the tiles get updated. Notice that there is one industry in apparel, for which we have 1 account.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-top-two-updated.png" alt-text="Screenshot of the updated tiles.":::

If we look at the Account Area Wise map visual, you'll see the area where we have the apparel account.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-account-area-wise.png" alt-text="Screenshot of the Account Area Wise map.":::

Let's look at the revenue for the account under apparel. In the Revenue by Account visual you can see that the account for apparel is highlighted, and shows the revenue being generated.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-revenue-by-account.png" alt-text="Screenshot of the Revenue by Account visual.":::

We can also see a comparison of revenue won vs lost. If we hover over a bar, we see the exact revenue won out of the total revenue.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-revenue-won-vs-lost.png" alt-text="Screenshot of the Revenue Won vs Lost visual.":::

## What does the Lead dashboard tell us?

The Lead dashboard lets you see what the sources of your leads are. It tells you which are your most profitable sources of lead.

Look at the Probability of Conversion visual to examine what the probability is that the lead from a source is going to be converted. For example, selecting "External Referral" in the Leads by Source visual shows that the probability of conversion is 90.00%, while its total forecasted amount is 1.65 million dollars.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-forecast-category-amount.png" alt-text="Screenshot of the Forecast Category Amount visual.":::

Similarly, you can also see the distribution of customers in the sales lead by looking at the Sales Lead by Customer Type visual. You can see it for a single lead by hovering over it. So, for "External Referral", you can see that there is one new customer belonging to the "New Business" category.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-sales-lead-customer-type.png" alt-text="Screenshot of the Sales Lead by Customer Type visual.":::

We can also see the overall number of lead statuses that we have, and in what stage they are.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-lead-status.png" alt-text="Screenshot of the Lead Status visual.":::

## What does the Representative dashboard tell us?

The Representative dashboard lets you measure the performance of the sales representatives by a number of matrices.

We can see all the industries a sales representative works in, and all the representatives of an industry.

To see the performance of the sales representatives, we selected "Energy" as the industry from the Share of Industry visual. Then, in the Total Opportunities Gained visual, we can see the name of the sales representative and the number of opportunities which belong to the selected industry.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-total-opportunities-gained.png" alt-text="Screenshot of the Total Opportunities Gained visual.":::

The top three visuals show us the number of leads generated by the sales representatives and the revenue they have generated and lost.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-top-three-numbers.png" alt-text="Screenshot of the top three number visuals.":::

At same time, we can use the Month Wise Performance visual to measure the month-wise performance of the sales representatives.

:::image type="content" source="media/service-connect-to-salesforce/service-salesforce-analytics-month-wise-performance.png" alt-text="Screenshot of the Month Wise Performance visual.":::

## System requirements and considerations

- Connected with a production Salesforce account that has API access enabled.
- Permission granted to the Power BI app during sign in.
- The account has sufficient API calls available to pull and refresh the data.
- A valid authentication token is required for refresh. Salesforce has a limit of five authentication tokens per application so make sure you've five or less Salesforce datasets imported.
- The Salesforce Reports API has a restriction that supports up to 2,000 rows of data.

## Troubleshooting

If you encounter any errors, review the requirements above:

- Signing in to a custom or sandbox domain isn't currently supported.
- [Salesforce connector reference](/power-query/connectors/salesforcereports)

### "Unable to connect to the remote server" message

If you get an "Unable to connect to the remote server" message when trying to connect to your Salesforce account, see this solution on the following forum: [Salesforce Connector sign in Error Message: Unable to connect to the remote server](https://www.outsystems.com/forums/discussion/17674/salesforce-connector-log-in-error-message-unable-to-connect-to-the-remote-ser/)

## Related content

- [What are Power BI template apps](service-template-apps-overview.md)
- [Create a template app in Power BI](service-template-apps-create.md)
- [Install and distribute template apps in your organization](service-template-apps-install-distribute.md)
- Questions? [Ask the Power BI Community](https://community.powerbi.com/)
