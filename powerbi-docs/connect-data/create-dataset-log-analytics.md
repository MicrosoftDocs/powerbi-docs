---
title: Create a semantic model from Log Analytics
description: Learn how to create a Power BI semantic model directly from Log Analytics.
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 12/03/2025
ms.custom:
LocalizationGroup: Visualizations
---

# Create a Power BI semantic model directly from Log Analytics

You can create a Power BI semantic model directly from a Log Analytics query. The semantic model is a full-fledged Power BI semantic model that you can use to create reports, analyze in Excel, and more.

If you save the semantic model to a shared workspace, everyone with the sufficient permissions in the workspace can use it. You can also use [semantic model sharing](./service-datasets-share.md) to share it with other users who don't have a role in the workspace.

This feature creates a semantic model in the Power BI service directly from a Log Analytics query. Alternatively, you can export the query from Log Analytics, paste it into Power BI Desktop, and do your advanced modeling there. For more information, see [Create Power BI semantic models and reports from Log Analytics queries](/azure/azure-monitor/logs/log-powerbi#create-power-bi-datasets-and-reports-from-log-analytics-queries).

## Prerequisites

You must have a Power BI account to use this functionality.

## Create a dataset from Log Analytics

Use the following steps to create a Power BI dataset from a Log Analytics query:

1. Open and run the Log Analytics query that you want to use to create the Power BI database.

1. Select **KQL mode**.

1. In the actions bar, select **Share > Export to Power BI (new Dataset)**.

    :::image type="content" source="./media/create-dataset-log-analytics/export-to-power-bi-log-analytics-option.png" alt-text="Screenshot showing Export to Power BI option in the Log Analytics Export menu.":::

1. Power BI opens and a dialog asks you to name the semantic model and choose a workspace to save it in. If you're a [free user](../fundamentals/service-features-license-type.md#free-per-user-license) in Power BI, you can only save to **My workspace**.

    :::image type="content" source="./media/create-dataset-log-analytics/name-dataset-dialog.png" alt-text="Screenshot of a dialog where you name the semantic model and choose a workspace.":::

    The dialog also shows the URL of the Log Analytics data source. To prevent inadvertently exposing sensitive data, make sure that you recognize the data source and are familiar with the data. Select **Review data** if you want to check the Log Analytic query results before allowing export to continue. For more information about when reviewing the data might be a good idea, see [Review the Log Analytics data](#review-the-log-analytics-data).

1. Select **Continue**.

   Your semantic model is created, and you're taken to the details page of the new semantic model. From there you can do all the things you can do with a regular Power BI semantic model - refresh the data, share the semantic model, create new reports, and more. For more information, see [semantic model details](./service-dataset-details-page.md).

   > [!NOTE]
   > If you've connected to Log Analytics from Power BI before, you're asked to choose which credentials to use to for the connection between Power BI and Log Analytics. For help deciding which credentials to use, see [Choose which credentials to authenticate with](#choose-which-credentials-to-authenticate-with).

   :::image type="content" source="./media/create-dataset-log-analytics/dataset-details-page.png" alt-text="Screenshot of the semantic model details page of the newly created semantic model.":::

To keep the data fresh after you create the semantic model, either refresh the data manually or set up scheduled refresh.

## Review the Log Analytics data

When you export data from a Log Analytics query to Power BI, a redirect URL is created that includes all the parameters needed to create the semantic model in Power BI. If you're the person who selected **Export to BI** in Log Analytics, you probably don't need to worry about reviewing the data because you most likely are familiar with the data you're exporting.

Reviewing the data is important if you weren't the one who exported the Log Analytics data, but rather received a link from someone for creating a semantic model from Log Analytics. In such a case, you might not be familiar with the data that's being exported. You should review it to make sure that no sensitive data is inadvertently being exposed.

## Choose which credentials to authenticate with

When you export data from Log Analytics to Power BI, Power BI connects to Log Analytics to get the data. To connect, Power BI needs to authenticate with Log Analytics.

If you get the following dialog, it means that you established a connection to Log Analytics in the past. The credentials that you used at that time might be different from the credentials of your current sign in. You can choose to continue using the sign-in details you used the last time you connected (*The credentials I used to connect to Power BI last time*). Or, create the connection with your current sign-in credentials from now on (*My current credentials (these may be the same or different)*).

:::image type="content" source="./media/create-dataset-log-analytics/choose-credentials-dialog.png" alt-text="Screenshot showing choose credentials dialog.":::

### Why is this choice important?

The permissions of the account that established the connection determines the Power BI view of the Log Analytics data.

If you let Power BI use the sign-in details that you used last time for the connection, the data you see in the semantic model you're creating might differ from what you see in Log Analytics. This difference happens because the data that appears in the semantic model is what the account with the credentials you used last time can see in Log Analytics.

If you replace the credentials you used last time with your current sign-in credentials, the data you see in the semantic model that you're creating is the same as what you see in Log Analytics. However, since the connection now uses your current authentication credentials, views of the data in semantic models you might have created previously from that Log Analytics query might also change. This change could affect reports and other downstream items that users created based on those semantic models.

If you're connecting to Log Analytics from Power BI for the first time, then Power BI automatically uses your current credentials to establish the connection. You don't see this dialog.

## Considerations and limitations

* This flow doesn't support business-to-business (B2B) scenarios or scenarios where authentication takes place against a service principal.
* If the Azure Service Management API, the Log Analytics API service, or both, are configured to use multifactor authentication, then in order for this flow to work, Power BI must also be configured to use multifactor authentication. Consult your organization's IT support if you encounter a problem related to this consideration.  

## Related content

* [Log Analytics integration with Power BI](/azure/azure-monitor/logs/log-powerbi)
* [Semantic model details](./service-dataset-details-page.md)
* [Share access to a semantic model](./service-datasets-share.md)
