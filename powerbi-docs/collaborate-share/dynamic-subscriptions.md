---
title: Create a dynamic subscription (Preview)
description: Learn how to create per-recipient subscriptions based on parameters that you select.
author: mihart
ms.author: mihart
ms.reviewer: mibruhje
featuredvideoid: 
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 08/25/2023
ms.custom: retail analysis sample
LocalizationGroup: Common tasks
---

# Dynamic per recipient subscriptions (Preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Dynamic per recipient subscriptions are designed to simplify distributing a personalized copy of a report to each recipient of an email subscription. Based on the mapping defined in a Power BI dataset, you define which view of the report an individual receives by specifying what parameters should be applied to their version of the report. 
The dynamic subscription parameters are stored in a separate database. In some organizations, there might be a corporate employee database that fits the purpose. Or, you may need to create a new dataset that contains employee email addresses, geographies, managers, etc. The critical piece of data is the email addresses. In order for you to set the parameters on a per-recipient basis, the dataset needs to include the email addresses of all potential recipients.

:::image type="content" source="media/dynamic-subscriptions/power-bi-paginated-report.png" alt-text="Screenshot of a paginated report.":::

> [!IMPORTANT]
> Dynamic subscriptions is currently in PREVIEW and only available for paginated reports.
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.



## Prerequisites
- A paginated report with parameters to share that is saved in a workspace backed by a capacity( [Power BI Premium capacity](../enterprise/service-premium-what-is.md), [Microsoft Fabric (Preview) trial](fabric/get-started/fabric-trial.md), or [Microsoft Fabric capacity](/fabric/enterprise/licenses.md))
- Build permissions to a Power BI dataset that contains the email addresses of your recipients and parameter values that should be applied for each recipient  
- A Contributor, Member, or Admin role in that workspace. You know that you have the Contributor, Member, or Admin role in a workspace if you're able to edit reports or dashboards in that workspace. Read more about [Roles in workspaces](service-roles-new-workspaces.md).
- A Power BI dataset that contains recipient data. Recipient data includes recipient email addresses and the parameters that you're interested in assigning for each recipient. 
- Your Fabric admin can enable and disable this preview feature in your admin portal tenant settings. For Dynamic subscriptions to work, your admin must leave the email subscriptions feature enabled. For more information, see [subscribe to reports](end-user-subscribe.md#subscribe-to-paginated-reports)

## Create a dynamic subscription

Have you wanted to create one subscription that sends customized views of a report to your subscribers based on parameters that you set? Perhaps you're a training director and want to send a report to various managers, each interested in the completion progress of their employees. Now you can create a subscription and customize the report so that each manager only sees data related to their own employees. This is done by connecting to a Power BI dataset that defines the mapping between recipients and parameters. When it's time to send out the report, the latest data available in this dataset determines which manager receives a report in their inbox, and what parameters are applied to that report.

For users familiar with SQL Server Reporting Services (SSRS), this feature is similar to data-driven subscriptions. 

Start with a paginated report that has parameters. You know that the report has parameters if you select **Parameters** and see dropdown options in the header. This report has a parameter for **Manager name** and a parameter for **Employee**. 

:::image type="content" source="media/dynamic-subscriptions/power-bi-parameters.png" alt-text="Screenshot of the Power BI service showing two parameters.":::

### Connect to recipient data

1. Select **Subscribe to report**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-subscribe-icon.png" alt-text="Screenshot of the Power BI service showing Subscribe to report button.":::    


1. The **Subscriptions** window opens and there are no subscriptions yet. Select **Create a subscription**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-create-subscription.png" alt-text="Screenshot of the Power BI service showing the Subscriptions screen with no subscriptions yet.":::

1. Select **Dynamic per recipient**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-dynamic-option.png" alt-text="Screenshot of the Power BI service showing the New subscriptions screen and the option for Dynamic per recipient.":::

1. Highlight the Power BI dataset that contains your recipient data. Recipient data includes a list of email addresses of colleagues and other parameter values that can be set on a per user basis. Select **Next**. In this example, our parameter mapping dataset is named **Training data**. 

    :::image type="content" source="media/dynamic-subscriptions/power-bi-training-data.png" alt-text="Screenshot of the Power BI service showing Connect to recipient data step of the wizard, with Training data outlined in red.":::

### Select and filter data

Select the columns from your dataset that you want to be varied for each recipient. Email address, email subject, report parameters, and even the attachment format can be set dynamically based on data in a dataset. 

1. The **Select and filter data** window displays the list of fields from the *Training data* dataset that can be used to dynamically filter your *Manager training* report subscription. In this example, we have **Email address**, **Email subject**, **Report parameters**, and **Attachment file type**. These fields from the *Training data* dataset can be tied to the subscription. 

    Select the relevant fields that you'd like to filter dynamically. Optionally, add filters and change the method of aggregation by expanding the **Filter** and **Build** panes. As you add data, Power BI builds a table. In this window, narrow down who should receive the report. For our example, we select only those employees who are also managers. 

    :::image type="content" source="media/dynamic-subscriptions/power-bi-managers.png" alt-text="Screenshot of the Power BI service showing the Select and filter data page for dynamic subscriptions.":::

1. Select **Next** when you're satisfied with your selections.

### Enter email details

In the **Email details** window, name the subscription, add recipients and a subject, and select the type of attachment to use. Many of these fields offer the option to use the dynamic parameters. In this example, **Recipients** are dynamically added from the *Training data* dataset, using the **Email** parameter. And, the email **Subject** is dynamically created using the **Manager name** parameter. The link icon ![Image of the dynamic content link icon.](media/dynamic-subscriptions/power-bi-icon.png) lets you know that dynamic content is being used. 

1. Name your subscription. 
1. Manually enter recipient email addresses, or use the dropdown to select a value that dynamically selects recipients from the *Training data* dataset.
1. Manually add an email subject, or use the dropdown to dynamically create individualized subjects using the Manager name field from the *Training data* dataset.  

    :::image type="content" source="media/dynamic-subscriptions/power-bi-email.png" alt-text="Screenshot of the Power BI service showing dynamic parameter options on the Email details window.":::

1. Optionally, add a message and use the toggles to add a link to the report in Power BI and to include a report preview. 

1. Select the **Attach full report** dropdown to display the list of options. Select a format. Sensitivity labels are applied to the email attachment and the attachment respects all privacy labels for the report. The size of the attachment is limited to no more than 20 pages and less than 25 MB.  

1. Choose **Next**.  

### Select the parameters

In the **Parameters** window, Power BI displays the parameters that you opted to use in your email. Paginated reports allow you to specify the view of the report people receive in the subscription by setting the parameters in the **Parameters** window. For each parameter, decide whether to use the current value, default value, or dynamic value. For our scenario, sending training completion reports to managers, it makes sense to use the Manager name dynamic parameter and the Employee name dynamic parameter. But there are other scenarios where you might want to use a mix of static and dynamic parameters. For example, if your report had continent and country-region data, you might want to set the continent as South America and use dynamic parameters for the states.

:::image type="content" source="media/dynamic-subscriptions/power-bi-employee-parameter.png" alt-text="Screenshot of the Power BI service showing dynamic parameter options on the Parameters window.":::

- **Current** uses the value from the currently selected active version of the report. To update the current values, re-render the paginated report with different values, open the **Subscribe to report** wizard, and select **Current**.
- **Default** uses the value set by the report author. For example, if the report author has set expression-based parameters (for example, the default is always today's date), the subscription uses that as the default value. 
- **Get from data** displays a dropdown of the parameter options for this dataset.  

### Set the schedule

In the **Set the schedule** window, create a schedule for your dynamic subscription. 
1. Select a Start date and optionally, an End date for your subscription. By default, the start date is the date you created the subscription and the end date is one year later. You can change it to any date in the future at any time before the subscription ends. When a subscription reaches an end date, it stops until you re-enable it. You receive notifications before the scheduled end date to ask if you'd like to extend it.

1. Use the **Repeat** dropdown to select a frequency for your subscription. You may choose hourly, daily, weekly, monthly, or after data refresh (once daily). Most of the options require that you set a time zone as well.

    > [!Tip]
    > To receive a subscription email only on certain days, select Hourly or Weekly and then select the week day checkboxes. If you select Monthly, enter the day(s) of the month you wish to receive the subscription email.

1. If you choose Hourly, Daily, Weekly, or Monthly, choose a Scheduled Time for the subscription. You can have it run on the hour, or at 15, 30, or 45 minutes past for a specified time zone. If you choose Hourly, select the Scheduled time you want the subscription to start, and it will run every hour after the Scheduled time.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-subscription.png" alt-text="Screenshot of the Power BI service showing the Schedule window.":::

1. By turning off **Active subscription**, you have the option of triggering this subscription manually instead of having it run on a recurring basis.  

### Review and finish creating the dynamic subscription

In the **Review and finish** window, select a heading to review your settings. If all the settings look correct, select **Save and close**. If any need changes, select the pencil icon to make edits. 

 :::image type="content" source="media/dynamic-subscriptions/power-bi-review-subscription.png" alt-text="Screenshot of the Power BI service showing the Review and finish window.":::

Your **Subscriptions** pane lists the new subscriptions. The link icon ![Image of the dynamic content link icon.](media/dynamic-subscriptions/power-bi-icon.png) lets you know that dynamic content is being used. 

Another way to review your subscription is to select the arrow in the **Subscriptions** pane. 

:::image type="content" source="media/dynamic-subscriptions/power-bi-review-again.png" alt-text="Screenshot of the Power BI service showing the Subscriptions pane.":::

As with other subscriptions, you can edit, delete, turn on, and turn off the subscription. 

## Considerations and limitations
- Rendering the report uses some of your capacity. It's classified as a **Background** activity.
- Your recipient dataset has a limit of 50 rows of recipients. If the recipient list exceeds 50 rows at any point, only the first 50 recipients receive the subscription email, and the subscription creator receives an error email. 
- Receiving the subscription email doesn't guarantee access to the report. Report access must be set separately.
- [Parameter values attempt to map to the *value* and not to the *label*](../paginated-reports/parameters/associate-query-parameter-report-parameter-report-builder.md#associate-a-query-parameter-with-a-report-parameter)  
- As a Preview feature, it’s not available to customers located in Sovereign Clouds.  

## Next steps

[Troubleshoot Power BI subscriptions](service-troubleshoot-subscribe.yml).   
[Search for and sort content](../consumer/end-user-search-sort.md).
