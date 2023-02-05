---
title: Create a dataset from Log Analytics
description: Learn how to create a Power BI dataset directly from Log Analytics.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/05/2023
ms.custom:
LocalizationGroup: Visualizations
---
# Create a Power BI dataset directly from Log Analytics

You can quickly create a Power BI dataset directly from Log Analytics. The dataset will be full-fledged Power BI dataset that you can use to create reports, analyze in Excel, and more.

Creating a dataset directly from Log Analytics is an easy and quick way to share a dataset, because if you save it to a shared workspace, everyone with the sufficient permissions in the workspace can use it. You can also use [dataset sharing](./service-datasets-share.md) to share it with other users who don’t have a role in the workspace.

This feature creates a dataset in the Power BI service directly from a Log Analytics. If you need to model or transform the data in ways that aren't available in the service, you can also export the query from Log Analytics, paste it into Power BI Desktop, and do your advanced modeling there. For more information, see [Integrate queries](/azure/azure-monitor/logs/log-powerbi#integrate-queries).

## Prerequisites

You must have a Power BI account to be able to use this functionality.

## Create a dataset from Log Analytics

To create a Power BI dataset from Log Analytics:
1. Open and run the Log Analytics query you want to use to create the Power BI database.

1. In the actions bar, select **Export > Export to Power BI**.

    :::image type="content" source="./media/create-dataset-log-analytics/export-to-power-bi-log-analytics-option.png" alt-text="Screenshot showing Export to Power BI option in the Log Analytics Export menu.":::

1. Power BI will open and a dialog will ask you to name the dataset and choose a workspace to save it in. By default the dataset will be given the same name as the query and saved to My workspace. You can choose your own name and destination workspace. If you are a [free user](../fundamentals/service-features-license-type.md#free-per-user-license) in Power BI, you will only be able to save to My workspace.

    :::image type="content" source="./media/create-dataset-log-analytics/name-dataset-dialog.png" alt-text="Screenshot of a dialog where you name the dataset and choose a workspace.":::

    The dialog also shows the URL of the Log Analytics data source. To prevent inadvertently exposing sensitive data, make sure that you recognize the data source and are familiar with the data. Select **Review data** if you want to check the Log Analytic results before allowing export to continue. For more information about when reviewing the data might be a good idea, see [Reviewing the Log Analytics data](#reviewing-the-log-analytics-data).

1. Select **Continue**. Your dataset will be created, and you'll be taken to the details page of the new dataset. From there you can do all the things you can do with a regular Power BI dataset - refresh the data, share the dataset, create new reports, and more. See [dataset details](./service-dataset-details-page.md) for more information.

    > [!NOTE]
    > If you've connected to Log Analytics from Power BI before, you'll be asked to choose which credentials to use to for the connection between Power BI and Log Analytics before being taken to the dataset details page. For help deciding which credentials to choose, see [Choosing which credentials to authenticate with](#choosing-which-credentials-to-authenticate-with).

    :::image type="content" source="./media/create-dataset-log-analytics/dataset-details-page.png" alt-text="Screenshot of the dataset details page of the newly created dataset.":::

To keep the data fresh after you've created the dataset, either refresh the data manually or set up scheduled refresh.

## Reviewing the Log Analytics data

When you export data from Log Analytics to Power BI, a redirect URL is created that includes all the parameters needed to launch the create dataset process in Power BI. If you're the person who selected **Export to BI** in Log Analytics, you probably don't need to worry about reviewing the data because you most likely are familiar with the data you're exporting.

Reviewing the data is important if you weren't the one who exported the Log Analytics data, but rather received a link from someone for creating a dataset from Log Analytics. In such a case, you might not be familiar with the data that is being exported, and hence it's important to review it to make sure that no sensitive data is inadvertently being exposed.

## Choosing which credentials to authenticate with

When you export data from Log Analytics to Power BI, Power BI connects to Log Analytics to get the data. In order to connect, it needs to authenticate with Log Analytics.

If you get the following dialog, it means that you've already established a connection to Log Analytics in the past. The credentials you used at that time may or may not be different than the credentials of your current sign in. You need to choose whether to continue using the sign-in details you used the last time you connected (*The credentials I used to connect to Power BI last time*), or whether the connection should use your current sign-in credentials from now on (*My current credentials (these may be the same or different)*).

:::image type="content" source="./media/create-dataset-log-analytics/choose-credentials-dialog.png" alt-text="Screenshot showing choose credentials dialog.":::

**Why is this important?**

The Power BI view of the Log Analytics data is determined by the permissions of the account used to establish the Power BI connection to the Log Analytics data source.

If you let Power BI use the sign-in details you used last time for the connection, the data you'll see in the dataset you're creating may differ from what you see in Log Analytics. This is because the data that is shown in the dataset is what the account with the credentials you used last time can see in Log Analytics.

If you replace the credentials you used last time with your current sign-in credentials, the data you see in the dataset you're creating will be exactly the same as what you see in Log Analytics. **However, since the connection now uses your current login credentials, views of the data in datasets you might have created previously from that Log Analytics query might also change, and this could affect reports and other downstream items that users might have created based on those datasets**.

Take the above considerations into account when you make your choice.

If you've never previously connected to Log Analytics from Power BI, Power BI will automatically use your current credentials to establish the connection, and you won't see this dialog.

## Next steps

* [Log Analytics integration with Power BI](/azure/azure-monitor/logs/log-powerbi)
* [Dataset details](./service-dataset-details-page.md)
* [Share access to a dataset](./service-datasets-share.md)