---
title: Create a dynamic subscription for a paginated report (Preview)
description: Learn how to create per-recipient subscriptions for paginated reports based on parameters that you select.
author: mihart
ms.author: mihart
ms.reviewer: mibruhje
featuredvideoid: 
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/08/2024
ms.custom: retail analysis sample
LocalizationGroup: Common tasks
---

# Dynamic per recipient subscriptions for paginated reports (Preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Dynamic per recipient subscriptions are designed to simplify distributing a personalized copy of a report to each recipient of an email subscription. You define which view of the report an individual receives by specifying which parameters are applied to their version of the report. 
Dynamic per recipient subscriptions are available for paginated reports and for Power BI reports.  This article pertains to paginated reports. 
To learn about dynamic subscriptions for Power BI reports, see [Dynamic per recipient subscriptions for reports](power-bi-dynamic-report-subscriptions.md)
The dynamic subscription parameters are stored in a separate Power BI semantic model. The semantic model defines the mapping between recipients and respective parameters. When it’s time to send out the report, the latest data available in your semantic model determines who receives a subscription and with what parameter applied. 

:::image type="content" source="media/dynamic-subscriptions/power-bi-paginated-report.png" alt-text="Screenshot of a paginated report.":::

> [!IMPORTANT]
> Dynamic subscriptions is currently in PREVIEW and only available for paginated reports.
> This information relates to a prerelease product that might be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.



## Prerequisites
- A paginated report with parameters to share that is saved in a workspace backed by a capacity ([Power BI Premium capacity](../enterprise/service-premium-what-is.md), [Microsoft Fabric trial](/fabric/get-started/fabric-trial), or [Microsoft Fabric capacity](/fabric/enterprise/licenses)).
- Build permissions to a Power BI semantic model that contains the email addresses of your recipients and parameter values that should be applied for each recipient.  
- A Contributor, Member, or Admin role in that workspace. You know that you have the Contributor, Member, or Admin role in a workspace if you're able to edit reports or dashboards in that workspace. Read more about [Roles in workspaces](service-roles-new-workspaces.md).
- A Power BI semantic model that contains recipient data. Recipient data includes recipient email addresses and the parameters that you're interested in assigning for each recipient. 

## Create a dynamic subscription

Do you want to create one subscription that sends customized views of a report to your subscribers based on parameters that you set? Perhaps you're a training director and want to send a report to various managers, each interested in the completion progress of their employees. Now you can create a subscription and customize the report so that each manager only sees data related to their own employees. To do this, Power BI connects to a semantic model that defines the mapping between recipients and parameters. When it's time to send out the report, the latest data available in this semantic model determines which manager receives a report in their inbox, and what parameters are applied to that report.

For users familiar with SQL Server Reporting Services (SSRS), this feature is similar to data-driven subscriptions. 

Start with a paginated report that has parameters. You know that the report has parameters if you select **Parameters** and see dropdown options in the header. This report has a parameter for **Manager name** and a parameter for **Employee**. 

:::image type="content" source="media/dynamic-subscriptions/power-bi-choose-parameter.png" alt-text="Screenshot of the Power BI service showing two parameters.":::

### Connect to recipient data

1. Select **Subscribe to report**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-subscribe-icon.png" alt-text="Screenshot of the Power BI service showing Subscribe to report button.":::    


1. The **Subscriptions** window opens and there are no subscriptions yet. Select **Create a subscription**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-create-subscription.png" alt-text="Screenshot of the Power BI service showing the Subscriptions screen with no subscriptions yet.":::

1. Select **Dynamic per recipient (preview)**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-dynamic-option.png" alt-text="Screenshot of the Power BI service showing the New subscriptions screen and the option for Dynamic per recipient.":::

1. Highlight the Power BI semantic model that contains your recipient data. Recipient data includes columns for email address, parameters that can be varied per recipient, and optionally, attachment type and email subject. 

    In some organizations, there might be a corporate employee Power BI semantic model that fits the purpose. Or, you might need to create a new semantic model that contains email addresses, and values for report parameters. The critical piece of data is the email addresses. In order for you to set the parameters on a per-recipient basis, the semantic model needs to include the email addresses of all potential recipients. Select **Next**. In this example, our parameter mapping semantic model is named **Training data**. 

    :::image type="content" source="media/dynamic-subscriptions/power-bi-training-data.png" alt-text="Screenshot of the Power BI service showing Connect to recipient data step of the wizard, with Training data outlined in red.":::

### Select and filter data

The **Select and filter data** window lists the fields that can be set dynamically. In this example, we have a field for email address and we have several parameters. Select the columns from your semantic model that you want to be varied for each recipient. Email address and parameters can be set dynamically based on data in the Power BI semantic model. 

1. The **Select and filter data** window displays the list of fields from the *Training data* semantic model that can be used to dynamically filter your *Manager training* report subscription. In this example, we have **Email address**, **Email subject**, **Report parameters**, and **Attachment file type**. These fields from the *Training data* semantic model can be tied to the subscription. 

    Select the relevant fields that you'd like to be varied per recipient. Here we have **Email** and two fields for parameters: **Employee name** and **Manager name**. Optionally, add filters and change the method of aggregation by expanding the **Filter** and **Build** panes. As you add data, Power BI builds a table. In this window, narrow down who should receive the report. For our example, we select only those employees who are also managers. 

    :::image type="content" source="media/dynamic-subscriptions/power-bi-managers.png" alt-text="Screenshot of the Power BI service showing the Select and filter data page for dynamic subscriptions.":::

1. Select **Next** when you're satisfied with your selections.

### Enter email details

In the **Email details** window, name the subscription, add recipients separated by commas or semicolons, and a subject, and select the type of attachment to use. Many of these fields offer the option to use the dynamic parameters. In this example, **Recipients** are dynamically added from the *Training data* semantic model, using the **Email** field. And, the email **Subject** is dynamically set using the **Manager name** parameter. The link icon ![Image of the dynamic content link icon.](media/dynamic-subscriptions/power-bi-icon.png) lets you know that dynamic content is being used. 


1. Name your subscription. 
1. Manually enter recipient email addresses, or use the dropdown to select a value that dynamically selects recipients from the *Training data* semantic model.
1. Manually add an email subject, or use the dropdown to dynamically create individualized subjects using the Manager name field from the *Training data* semantic model.  

    :::image type="content" source="media/dynamic-subscriptions/power-bi-email.png" alt-text="Screenshot of the Power BI service showing dynamic parameter options on the Email details window.":::

1. Add optional details. Type a message to recipients. Use the toggles to add a link to the report in Power BI and to include a preview image of the report in the email.  The preview image is the first page of the report. The preview image shows the report with the recipient's unique parameters applied.

1. Select the **Attach full report** dropdown to display the list of options. Select a format. Sensitivity labels are applied to the email attachment and the attachment respects all privacy labels for the report. The size of the attachment is limited to less than 25 MB.  

1. Choose **Next**.  

### Select the parameters

The **Parameters** window displays all of your report parameters, and you choose which to set dynamically based on a column in the Power BI semantic model. Paginated reports allow you to specify the view of the report people receive in the subscription by setting the parameters in the **Parameters** window. For each parameter, decide whether to use the current value, default value, or dynamic value. For our scenario, sending training completion reports to managers, it makes sense to use the Manager name dynamic parameter and the Employee name dynamic parameter. But there are other scenarios where you might want to use a mix of static and dynamic parameters. For example, if your report had continent and country-region data, you might want to set the continent as South America and use dynamic parameters for the country-regions.

:::image type="content" source="media/dynamic-subscriptions/power-bi-employee-parameter.png" alt-text="Screenshot of the Power BI service showing dynamic parameter options on the Parameters window.":::

- **Current** uses the value from the currently selected active version of the report. To update the current values, re-render the paginated report with different values, open the **Subscribe to report** wizard, and select **Current**.
- **Default** uses the value set by the report author. For example, if the report author set expression-based parameters (for example, the default is always today's date), the subscription uses that as the default value. 
- **Get from data** lets you select a column from your semantic model to define a different parameter for each recipient.  

### Set the schedule

In the **Set the schedule** window, create a schedule for your dynamic subscription. 
1. Select a Start date and optionally, an End date for your subscription. By default, the start date is the date you created the subscription and the end date is one year later. You can change it to any date in the future at any time before the subscription ends. When a subscription reaches an end date, it stops until you re-enable it. You receive notifications before the scheduled end date to ask if you'd like to extend it.

1. Use the **Repeat** dropdown to select a frequency for your subscription. You might choose daily, weekly, or monthly. You also can adjust your time zone. 
 
    > [!TIP]
   > To receive a subscription email only on certain days, select Weekly and then select the week day checkboxes. If you select Monthly, enter the day(s) of the month you wish to receive the subscription email.

    
1. Choose a Scheduled Time for the subscription. You can have it run on the hour, or at 15, 30, or 45 minutes past for a specified time zone. 

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
- Your recipient semantic model has a limit of 1000 rows of recipients. If the recipient list exceeds 1000 rows at any point, only the first 1000 recipients receive the subscription email, and the subscription creator receives an error email.
- Receiving the subscription email doesn't guarantee access to the report. Report access must be set separately.
- [Parameter values attempt to map to the *value* and not to the *label*](../paginated-reports/parameters/associate-query-parameter-report-parameter-report-builder.md#associate-a-query-parameter-with-a-report-parameter).  
- As a Preview feature, it’s not available to customers located in Sovereign Clouds.  

## Related content

- [Troubleshoot Power BI subscriptions](service-troubleshoot-subscribe.yml).   
- [Search for and sort content](../consumer/end-user-search-sort.md).
