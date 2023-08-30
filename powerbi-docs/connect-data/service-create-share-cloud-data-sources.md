---
title: Create and share cloud data sources in the Power BI service (Preview)
description: Learn how to create and share cloud data source connections in the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 08/30/2023
LocalizationGroup: Connect to data
---
# Create and share cloud data sources in the Power BI service (Preview)

With Power BI, you can create, share, and manage cloud connections for datasets and paginated reports, all within the Power BI service user experience.

This article shows you how to create a shareable cloud connection, and then shows you how to share that connection with others. Creating and sharing shareable cloud connections have many advantages, as described in [advantages of shareable cloud connections](service-connect-cloud-data-sources.md#advantages-of-shareable-cloud-connections).


## Create a shareable cloud connection

To create a shareable cloud connection, go to the Power BI service, select the **Settings** gear icon, and from the pane that appears select **Manage connections and gateways**.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-01.png" alt-text="Screenshot of selecting create shared connection from settings pane." lightbox="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-01.png":::

In the window that appears, select **New connection** and from the pane that appears, select **Cloud**.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-02.png" alt-text="Screenshot of creating a new shared connection.":::

Enter a name for the new connection, select the appropriate **connection type** from the drop-down list, and provide the connection details for your data source. Once you've filled in the information, select **Create**.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-03.png" alt-text="Screenshot of filling out new connection form." lightbox="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-03.png":::

With your connection created, you're ready to share it with others.


## Share a shareable cloud connection

To share a shareable cloud connection that you've already created, go to your **Connections** settings in the Power BI service, select the **More** menu (the ellipses) for the connection you want to share, and select **Manage users**.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-04.png" alt-text="Screenshot of adding users to a shareable connection.":::

The **Manage users** window appears, where you can search users by name or by their email address, and then grant them the permission level you want them to have. You must at least grant *User* permission level to any users whom you want to be able to use the connection.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-05.png" alt-text="Screenshot of applying user permission to a shareable cloud connection.":::

Once you've found the user and assigned permission, select **Share** at the bottom of the **Manage users** window to apply your selections.


## Assign a shared cloud connection to a dataset

Once you've created a shareable cloud connection, you can assign it to a dataset.

Open the settings for the dataset to which you want the shareable connection to apply, and expand the **Gateway and cloud connections** section. You'll notice that the connection is mapped to a *Personal Cloud Connection* by default.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-06.png" alt-text="Screenshot of cloud connection defaulting to personal cloud connection.":::

From the **Maps to** drop down, select the name of the shareable connection you create and want to use, then select **Apply**.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-07.png" alt-text="Screenshot of selecting a shareable cloud connection for a dataset.":::

That's it, you've now assigned your shareable cloud connection to the dataset.

If you haven't created a shareable cloud connection yet when you're using this screen, you can select the **Create a connection** option from the drop-down to be taken to the **Manage connections and gateways** experience, and all the connection details from the data source for which you selected the **Create a connection** drop-down are prepopulated in the **Create new cloud connection** form. 


## Next steps

For important information about shareable cloud connections, including limitations and considerations, read the following article:

[Connect to cloud data sources in the Power BI service (Preview)](service-connect-cloud-data-sources.md)