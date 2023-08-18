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

Dynamic per recipient subscriptions let you send out a unique view of a paginated report to each recipient. Based on the mapping defined in a Power BI dataset, you define which view of the report an individual receives by specifying what parameters should be applied to their version of the report. 
Customize the paginated report subscriptions you create by recipient. Choose one or more report parameters from a dataset so that your recipients see only data that they need. Their view of the report changes based on the set of parameters that you've selected. The dynamic subscription parameters are stored in a separate database that xyz <who creates this database?>. In order for you to set the parameters on a per-recipient basis, the dataset includes all potential recipient email aliases.

:::image type="content" source="media/dynamic-subscriptions/power-bi-paginated-report.png" alt-text="Screenshot of a paginated report.":::

> [!IMPORTANT]
> Dynamic subscriptions is currently in PREVIEW and only available for paginated reports.
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.



## Prerequisites
- A paginated report with parameters to share.
- Creating a dynamic subscription requires that the workspace is saved in a Power BI Premium capacity or a Fabric capacity. 
- A Contributor, Member, or Admin role in that workspace. You know that you have the Contributor, Member, or Admin role in a workspace if you're able to edit reports or dashboards in that workspace. Read more about [roles in workspaces](service-roles-new-workspaces).
- A Power BI dataset that contains recipient data. Recipient data includes recipient email addresses and the parameters that you're interested in assigning for each recipient. 
- Your Fabric admin can enable and disable this preview feature in your admin portal tenant settings. For Dynamic subscriptions to work, your admin must leave this feature enabled.  

## Create a dynamic subscription



Have you wanted to create one subscription that sends customized views of the report to your subscribers based on a set of parameters that you set?  Perhaps you're a training director and want to send a report to team managers showing the completion status of only their employees.  Now you can create a subscription and customize the report by selecting parameters from a separate dataset. 

Start with a paginated report that has parameters. You'll know that it has parameters if you select **Parameters** and see dropdown options in the header.  This report has a parameter for **Manager name** and a parameter for **Employee**. 

:::image type="content" source="media/dynamic-subscriptions/power-bi-parameters.png" alt-text="Screenshot of the Power BI service showing two parameters.":::

### Connect to recipient data

1. Select **Subscribe to report**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-subscribe-icon.png" alt-text="Screenshot of the Power BI service showing Subscribe to report button.":::    


1. The **Subscriptions** window opens and we see that there are no subscriptions yet. Select **Create a subscription**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-create-subscription.png" alt-text="Screenshot of the Power BI service showing the Subscriptions screen with no subscriptions yet.":::

1. Select **Dynamic per recipient**.

    :::image type="content" source="media/dynamic-subscriptions/power-bi-dynamic-option.png" alt-text="Screenshot of the Power BI service showing the New subscriptions screen and the option for Dynamic per recipient.":::

1. Highlight the Power BI dataset that contains your recipient data and select **Next**. In this example, our training dataset is named **Training data**. 

    :::image type="content" source="media/dynamic-subscriptions/power-bi-training-data.png" alt-text="Screenshot of the Power BI service showing Connect to recipient data step of the wizard, with Training data outlined in red.":::

### Select and filter data

1. The **Select and filter data** window displays the list of fields from the *Training data* dataset that can be used to dynamically filter your *Manager training* report subscription. In this example, we have **Email address**, **Email subject**, **Report parameters**, and **Attachment file type**. These fields from the *Training data* dataset can be tied to the subscription. 

    Select the relevant columns from the dataset that you'd like to filter dynamically. As you add data, it builds a table. In this window, you can narrow down who should receive the report. For our example we're selecting only those employees who are also managers. 

    :::image type="content" source="media/dynamic-subscriptions/power-bi-managers.png" alt-text="Screenshot of the Power BI service showing the Select and filter data page for dynamic subscriptions.":::

1. Select **Next** when you're satisfied with your selections.

### Enter email details

1. On the **Email details page**, name your subscription, select recipients using the dropdown, 
1. select the email subject. This can be dynamically set to equal a column in the dataset if you'd like each recipient to get a unique subject.

 :::image type="content" source="media/dynamic-subscriptions/power-bi-email.png" alt-text="Screenshot of the Power BI service showing dynamic parameter options on the Email details window.":::

1. Add a message
1. Provide the link.

### Select the parameters


### Set the schedule


### Review and finish creating the dynamic subscription




## Considerations and limitations
- Rendering the report uses some of your capacity. 
- Your recipient dataset has a limit of 50 rows of recipients. If the recipient list exceeds this at any point, only the first 50 recipients will receive the subscription email and the subscription creator will receive an error email. 
- Receiving the subscription email doesn't guarantee access to the report.  Report access must be set separately.

## Next steps

[Troubleshoot Power BI subscriptions](service-troubleshoot-subscribe.yml)   
[Search for and sort content](../consumer/end-user-search-sort.md)
