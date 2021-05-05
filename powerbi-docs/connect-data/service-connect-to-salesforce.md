---
title: Connect to Salesforce with Power BI
description: Salesforce for Power BI
author: paulinbar
ms.author: painbar
ms.reviewer: maggiesMSFT
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 05/02/2021
LocalizationGroup: Connect to services
---

# Salesforce Analytics for Sales Managers

The Salesforce Analytics for Sales Managers template app includes visuals and insights for analyzing your marketing effort.

The app's out-of-the-box dashboard provides key metrics, such as your sales pipeline, best accounts, and KPI's. You can drill down into the report for more details on each aspect. Fully interactive visuals help you explore your data further.

In this article we will walk through the app using sample data, to give you an idea of how you can use the app to gain key insights into your sales data.

## Install the app

1. Click the following link to get to the app: [Salesforce Analytics for Sales Managers template app.](https://app.powerbi.com/groups/me/getapps/services/pbi-contentpacks.salesforceanalytics)

1. Once you're on the App's AppSource page, click [**GET IT NOW**](https://app.powerbi.com/groups/me/getapps/services/pbi-contentpacks.salesforceanalytics).

    [![Salesforce Analytics for Sales Managers in AppSource.](media/service-connect-to-salesforce/service-salesforce-analytics-appsource-icon.png)](https://app.powerbi.com/groups/me/getapps/services/pbi-contentpacks.salesforceanalytics)


1. When prompted , click **Install**. Once the app has installed, you will see it on your Apps page.

   ![Salesforce Analytics for Sales Managers on App page.](media/service-connect-to-salesforce/service-salesforce-analytics-apps-page-icon.png)

## Connect to data sources

1. Click the icon on your Apps page to open the app. The app opens, showing sample data.

1. Select the **Connect your data** link on the banner at the top of the page.

   ![GitHub app connect your data link](media/service-connect-to-salesforce/power-bi-salesforce-analytics-connect-data.png)

1. The parameters dialog will appear. There are no required parameters. Click **Next**.

   ![Screenshot of the Salesforce Analytics for Sales Managers parameters dialog.](media/service-connect-to-salesforce/service-salesforce-analytics-parameters-dialog.png)

1. The authentication method dialog will appear. Recommended values are prepopulated. Don't change these unless you have specific knowledge of different values. Click **Sign in and connect**.

   ![Screenshot of the Salesforce Analytics for Sales Managers authentication dialog.](media/service-connect-to-salesforce/service-salesforce-analytics-authentication-dialog.png)

1. When prompted, sign into Salesforce. 
 
   The report will connect to the data sources and be populated with up-to-date data. During this time you will see sample data and that refresh is in progress.

   ![Salesforce Analytics for Sales Managers refresh in progress](media/service-connect-to-salesforce/service-salesforce-analytics-refresh-monitor.png) 

## What does the Sales manager dashboard tell us?

The Sales Manager sample dashboard and underlying report focus on a typical sales challenge: providing a total sales analysis over a certain period. 

Using the sample dashboard, we're going see how to
* Understand how much we can generate from the total open opportunities that a Sales company has.
* Identify which areas we should focus on in the total sales life cycle.
* Spot loopholes should look into.

Now let's analyze various components of the dashboard.

The top two visuals show us the total number of open opportunities we have and the expected revenue we can expect to generate from them.

![Screenshot of total open opportunities visual.](media/service-connect-to-salesforce/service-salesforce-analytics-top-two.png)

The dashboard shows the opportunity position in the sales pipeline. Select any stage on the sales pipeline stage to see its impact on the whole sales process. Now we can analyze the revenue that corresponds with that stage.


![Screenshot of Opportunity Sales Stage visual.](media/service-connect-to-salesforce/service-salesforce-analytics-sales-manager-dashboard.png)

The dashboard shows the share of the industry your sales team is working on, if you click on any one of the industries. For example, let's say “Communication”:

![Screenshot of Share of Industry visual.](media/service-connect-to-salesforce/service-salesforce-analytics-share-of-industry.png) 
 
We can see that one of the accounts we have in the Communication sector is falls under the top 10 critical opportunities with respect to revenue. We can conclude that we should put our focus on this opportunity on a priority basis. as the expected revenue is the highest as compared to other accounts.

![Screenshot of Top Ten Critical Opportunities visual.](media/service-connect-to-salesforce/service-salesforce-analytics-top-ten-critical-opportunity.png)
 
## What is our account dashboard telling us?

The Account dashboard lets you oversee how you are performing in all your accounts. It tells you which are among your most profitable accounts.

Let's analyze the accounts for technology.

On the dashboard, select “Manufacturing” in the account's Share Industry-wise visual.

![Screenshot of Account Share Industry Wise visual.](media/service-connect-to-salesforce/service-salesforce-analytics-account-share-industry-wise.png)

 You'll see the tiles get updated. Notice that we have a total of 1 industry in manufacturing, for which we have 20 accounts. 
 
![Screenshot of updated open opportunities visual.](media/service-connect-to-salesforce/service-salesforce-analytics-top-two-updated.png)

If we look at the Account area-wise map visual, you'll see the areas under which we have Manufacturing accounts.

![Screenshot of Account Share Area Wise visual.](media/service-connect-to-salesforce/service-salesforce-analytics-account-area-wise.png)
 
Let’s see the revenue for all the accounts under Manufacturing. In the Revenue by account visual you can see that the accounts for manufacturing are highlighted, describing the revenue being generated.

![Screenshot of Revenue by Account visual.](media/service-connect-to-salesforce/service-salesforce-analytics-revenue-by-account.png)

We can also see the comparison between revenue won vs lost. If we hover over the bar, we can see the exact revenue for apparel out of the total revenue.

![Screenshot of Revenue Won vs Lost visual.](media/service-connect-to-salesforce/service-salesforce-analytics-revenue-won-vs-lost.png)

## What is our lead dashboard telling us?

The Lead dashboard lets you oversee what the sources of your leads are. It tells you which are among your most profitable sources of lead.

You can look at the probability of conversion visual to examine what is the probability that the lead from a source is going to be converted.

For example, by selecting for Google AdWords, the probability of conversion is 51.25%, and the total forecasted amount for it is 1.92 million dollars.

![Screenshot of Forecast Category Amount visual.](media/service-connect-to-salesforce/service-salesforce-analytics-forecast-category-amount.png)
 
Similarly, you can also see the distribution of customers in the sales lead by customer type visual. You can see it for a single lead by hovering over it. So, for Google AdWords, there are 3 new customers belonging to the “New Business” category.

![Screenshot of Sales Lead Customer Type visual.](media/service-connect-to-salesforce/service-salesforce-analytics-sales-lead-customer-type.png)
 
We can also see the overall number of lead Status that we have, and in which stage.

![Screenshot of Lead Status visual.](media/service-connect-to-salesforce/service-salesforce-analytics-lead-status.png)
 
## What is our Representative dashboard telling us?

The Representative dashboard lets you measure the performance of the sales representatives by a number of matrices.

We can see all the industries in which a sales representative works, and all of the representatives of an industry.

To see the performance of the sales representatives, we selected "media" as the industry from the share-of-industry visual. In the total opportunities gained visual we can see the name of the sales representatives and the number of opportunities which belong to the selected industry

![Screenshot of Total Opportunities Gained visual.](media/service-connect-to-salesforce/service-salesforce-analytics-total-opportunities-gained.png)
 
The top three show us the number of leads generated by the sales representative and the revenue he/she has generated and the share of amount that he/she has lost. 

![Screenshot of number of leads generated visual.](media/service-connect-to-salesforce/service-salesforce-analytics-top-three-numbers.png)

At same time we get the option to measure the month-wise performance of the sales representatives.

![Screenshot of Month Wise Performance visual.](media/service-connect-to-salesforce/service-salesforce-analytics-month-wise-performance.png)

## What is our KPI dashboard telling us?

The KPI dashboard shows us all the key metrics from all the dashboards and provides us a way to navigate to those dashboards using the navigation button.

![Screenshot of KPI overall visual.](media/service-connect-to-salesforce/service-salesforce-analytics-kpi-overall.png)

## System requirements and considerations

* Connected with a production Salesforce account that has API access enabled.
* Permission granted to the Power BI app during sign in.
* The account has sufficient API calls available to pull and refresh the data.
* A valid authentication token is required for refresh. Salesforce has a limit of five authentication tokens per application so make sure you've five or less Salesforce data sets imported.
* The Salesforce Reports API has a restriction that supports up to 2,000 rows of data.

## Troubleshooting

* If you encounter any errors, review the requirements above.
* Signing in to a custom or sandbox domain isn't currently supported.

### "Unable to connect to the remote server" message

If you get an "Unable to connect to the remote server" message when trying to connect to your Salesforce account, see this solution on the following forum: [Salesforce Connector sign in Error Message: Unable to connect to the remote server](https://www.outsystems.com/forums/Forum_TopicView.aspx?TopicId=17674&TopicName=log-in-error-message-unable-to-connect-to-the-remote-server&)
 
* [What are Power BI template apps](service-template-apps-overview.md)
* [Create a template app in Power BI](service-template-apps-create.md)
* [Install and distribute template apps in your organization](service-template-apps-install-distribute.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
