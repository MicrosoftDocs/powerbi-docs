---
title: Create a dataset from a SharePoint List
description: Learn how to create a Power BI dataset directly from a SharePoint Online list.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/25/2023
ms.custom:
LocalizationGroup: Visualizations
---
# Create a Power BI dataset directly from a SharePoint list

You can quickly create a dataset directly in the Power BI service from a SharePoint list. The dataset will be full-fledged Power BI dataset that you can use to create reports, analyze in Excel, and more.

Creating a dataset directly from a SharePoint list is an easy and quick way to share a dataset, because if you save it to a shared workspace, everyone with the sufficient permissions in the workspace can use it. You can also use [dataset sharing](./service-datasets-share.md) to share it with other users who don’t have a role in the workspace.

To keep the data fresh after you’ve created the dataset, either refresh the data manually or set up scheduled refresh. 

## Create a dataset from a SharePoint list

To create a Power BI dataset from a SharePoint list:
1. Open your SharePoint list

1. In the actions bar, select **Export > Export to Power BI**.

    :::image type="content" source="./media/create-dataset-sharepoint-online-list/export-to-power-bi-sharepoint-option.png" alt-text="Screenshot showing Export to Power BI option in SharePoint Export menu.":::

1. Power BI will open and a dialog will ask you to name the dataset and choose a workspace to save it in. By default the dataset will be given the same name as the SharePoint list and saved to My workspace. You can choose your own name and destination workspace.

    :::image type="content" source="./media/create-dataset-sharepoint-online-list/name-dataset-dialog.png" alt-text="Screenshot of a dialog where you name the dataset and choose a workspace.":::

    The dialog also shows the URL of the data source (SharePoint site) and name of the SharePoint list. To prevent inadvertently exposing sensitive data, make sure that you recognize the data source and are familiar with the data. Select **Review data** if you want to check the SharePoint list before allowing export to continue. For more information about when reviewing the data might be a good idea, see [Reviewing the SharePoint list data](#reviewing-the-sharepoint-list-data).

1. Select **Continue**. Your dataset will be created, and you'll be taken to the [details page](./service-dataset-details-page.md) of the new dataset. From there you can do all the things you can do with a regular Power BI dataset - refresh the data, share the dataset, create new reports, and more. See [dataset details](./service-dataset-details-page.md) for more information.

    :::image type="content" source="./media/create-dataset-sharepoint-online-list/dataset-details-page.png" alt-text="Screenshot of the dataset details page of the newly created dataset.":::

    > [!NOTE]
    > If you see the following dialog before you get to the dataset details page, it means that you already have a connection to the SharePoint site under login credentials that may be different from the credentials of your current login.
    > :::image type="content" source="./media/create-dataset-sharepoint-online-list/choose-credentials-dialog.png" alt-text="Screenshot of previous connection notification.":::
    > For more information, see [Choosing which credentials to authenticate with](#choosing-which-credentials-to-authenticate-with).

## Reviewing the SharePoint list data

When you export a SharePoint list to Power BI, a redirect URL is created that includes all the parameters needed to launch the create dataset process in Power BI. If you're the person who selected **Export to BI** in your SharePoint list, you probably don't need to worry about reviewing the data because you most likely are familiar with the data you're exporting.

Reviewing the data is important if you weren't the one who exported the SharePoint list, but rather received a link from someone for creating a dataset from a SharePoint list. In such a case, you might not be familiar with the data that is being exported, and hence it's important to review it to make sure that no sensitive data is inadvertently being exposed.

## Choosing which credentials to authenticate with

When you export a SharePoint list to Power BI, Power BI connects to the SharePoint site to get the data from the list. In order to connect, it needs to authenticate with SharePoint.

If you get the following dialog, it means that you've already established a connection to the SharePoint site in the past. The credentials you used at that time may or may not be different than the credentials of your current sign in. You need to choose whether to continue using the existing sign-in details for the connection (Use existing Power BI credentials), or whether the connection should use your current sign-in credentials from now on (Replace with current app credentials).

:::image type="content" source="{source}" alt-text="Screenshot showing choose credentials dialog.":::

**Why is this important?**

The Power BI view of the SharePoint list data is determined by the permissions of the account used to establish the Power BI connection to the SharePoint data source (that is, the SharePoint site).

If you let Power BI use the existing sign-in details for the connection, the data you see in the dataset you're creating may differ from what you see in the SharePoint list. This is because the data that is shown in the dataset is what the account with the existing credentials can see in the SharePoint list.

If you replace the existing credentials with your current sign-in credentials, the data you see in the dataset you're creating will be exactly the same as what you see in the SharePoint list. **However, since the connection now uses your current login credentials, views of the data in other datasets you might have created from that SharePoint site might also change, and this could affect reports and other downstream items that users might have created based on those datasets**.

Take the above considerations into account when you make your choice.

If no previous connection to the SharePoint site exists, Power BI will automatically use your current credentials to establish the connection, and you won't see this dialog.

## Considerations and limitations

* The dataset won't be created if the SharePoint list contains values with more than four digits after a decimal place (".")
* The sensitivity label (if any) of the SharePoint list isn't inherited by the dataset that is created.

## Next steps

* [Dataset details](./service-dataset-details-page.md)
* [Share access to a dataset](./service-datasets-share.md)