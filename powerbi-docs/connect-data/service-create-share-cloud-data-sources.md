---
title: Create and Share Cloud Data Sources in the Power BI Service
description: Find out how to create a shareable cloud connection in the Power BI service, share that connection with others, and assign it to a semantic model. 
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 10/01/2025
LocalizationGroup: Connect to data
ms.custom: sfi-image-nochange
# customer intent: As a Power BI user, I want to find out how to use shareable cloud connections in the Power BI service so that I can set up multiple connections to the same data source, share my connections with others, and centralize data source connection management.
---

# Create and share cloud data sources in the Power BI service

In the Power BI service, you can create, share, and manage cloud connections for various artifacts and experiences:

- Semantic models
- Paginated reports
- Datamarts
- Dataflows
- Power Query Online experiences that you access by selecting **Get data**

This article shows you how to create a shareable cloud connection and share that connection with others. Creating and sharing shareable cloud connections have many advantages, as described in [Advantages of shareable cloud connections](service-connect-cloud-data-sources.md#advantages-of-shareable-cloud-connections).

## Create a shareable cloud connection

To create a shareable cloud connection, take the following steps:

1. Go to the Power BI service, select **Settings** :::image type="icon" source="media/service-create-share-cloud-data-sources/settings-icon.png":::, and then select **Manage connections and gateways**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/service-settings-manage-connections.png" alt-text="Screenshot of the home page of the Power BI service. In the expanded Settings menu, Manage connections and gateways is highlighted." lightbox="media/service-create-share-cloud-data-sources/service-settings-manage-connections.png":::

1. On the **Manage Connections and Gateways** page, go to the **Connections** tab, and then select **New**.

1. In the **New connection** dialog, take the following steps:
   1. Select **Cloud**.
   1. Under **Connection name**, enter a name for the new connection.
   1. Under **Connection type**, select an appropriate type.

   :::image type="content" source="media/service-create-share-cloud-data-sources/new-connection-dialog-select-cloud.png" alt-text="Screenshot of the New connection dialog in the Power BI service. Three types of connections are listed. Among them, Cloud is highlighted.":::

   The dialog expands as several fields are added for configuring the connection.

1. In the expanded **New connection** dialog, enter connection information for your data source, and then select **Create**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/new-connection-dialog-enter-information.png" alt-text="Screenshot of the New connection dialog. Fields like the name, type, and server are filled out. An authentication method of Basic is selected." lightbox="media/service-create-share-cloud-data-sources/new-connection-dialog-enter-information.png":::

1. Scroll to the top of the dialog and check for notifications about the connection status.

After Power BI creates your connection, you can share it with others.

> [!NOTE]
> When you publish a .pbix file with a cloud data source from Power BI Desktop, a cloud connection is created automatically.

## Share a shareable cloud connection

To share a shareable cloud connection, take the following steps:

1. In the Power BI service, select **Settings** :::image type="icon" source="media/service-create-share-cloud-data-sources/settings-icon.png":::, and then select **Manage connections and gateways**.

1. Locate the connection that you want to share. Next to it, select **More actions** :::image type="icon" source="media/service-create-share-cloud-data-sources/ellipsis-icon.png":::, and then select **Manage users**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/manage-connections-gateways-manage-users.png" alt-text="Screenshot of the Manage Connections and Gateways page. In the connection list, Manage users is highlighted in the shortcut menu for MyDemoConnection.":::

1. In the **Manage users** dialog, search for users you want to share the connection with. You can search by their name or email address. Grant them the permission level you want them to have. You must at least grant *User* permission to allow users to connect their artifacts to the connection's data source.

   :::image type="content" source="media/service-create-share-cloud-data-sources/manage-users-share-connection-dialog.png" alt-text="Screenshot of the Manage users dialog that shows a search box and a Shared with list. Available permissions are User, User with resharing, and Owner.":::

1. Select **Share** to apply your selections.

## Assign a shared cloud connection to a semantic model

After you create a shareable cloud connection, you can assign it to a semantic model.

1. Go to the workspace that contains the semantic model that you want to apply the shareable connection to.

1. Locate the semantic model in the list. Next to the name of the model, select **More options** :::image type="icon" source="media/service-create-share-cloud-data-sources/more-options-icon.png":::, and then select **Settings**.

1. On the settings page, expand the **Gateway and cloud connections** section. The connection is mapped to a personal cloud connection by default.

   :::image type="content" source="media/service-create-share-cloud-data-sources/semantic-model-cloud-connection-default-settings.png" alt-text="Screenshot of the gateway and cloud connection settings for a semantic model. The data source is mapped to a personal cloud connection.":::

1. In the **Maps to** list, select the name of the shareable connection that you want to use, and then select **Apply**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/semantic-model-cloud-connection-select-new-connection.png" alt-text="Screenshot of the gateway and cloud connection settings for a semantic model. In the data source mapping list, myDemoConnection is selected.":::

   Power BI assigns your shareable cloud connection to the semantic model.

If you open the **Gateway and cloud connections** settings of a semantic model before you create a shareable connection, you can select **Maps to** > **Create a connection**. The **New connection** dialog opens, as described earlier in [Create a shareable cloud connection](#create-a-shareable-cloud-connection). The input fields are prepopulated with information about the data source of the semantic model.

## Granular access control

Power BI enforces granular access control for shareable cloud connections. For all other data types, you can turn on access control at the tenant, workspace, and semantic model level. The following image combines screenshots of the settings at those three levels:

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-08.png" alt-text="Screenshots of tenant, workspace, and dataset granular access control settings, combined into one image. Each screenshot shows a toggle or checkbox." lightbox="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-08.png":::

Each setting provides granular access control. Power BI applies the settings in the following way:

- If a tenant admin turns on granular access control for all connection types, Power BI enforces granular access control for the entire organization. Workspace admins and artifact owners can't overrule granular access control that's turned on at the tenant level.
- If granular access control isn't enforced at the tenant level, workspace admins can enforce granular access control for their workspaces.
- If workspace admins don't enforce granular access control, artifact owners can decide whether to enforce granular access control for each of their artifacts independently.

By default, granular access control is turned off at all three levels. As a result, individual artifact owners can enforce granular access control for each data connection type selectively. However, it's likely more efficient to enable granular access control on a workspace-by-workspace basis.

## Related content

For important information about shareable cloud connections, including limitations and considerations, see [Connect to cloud data sources in the Power BI service](service-connect-cloud-data-sources.md).
