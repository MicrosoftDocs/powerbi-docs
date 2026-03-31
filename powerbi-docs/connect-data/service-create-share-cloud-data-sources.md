---
title: Create and share cloud data sources in the Power BI service
description: Learn how to create a shareable cloud connection in the Power BI service, share it with others, and assign it to a semantic model.
author: kgremban
ms.author: kgremban
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 03/31/2026
LocalizationGroup: Connect to data
ms.custom: sfi-image-nochange
ai-usage: ai-assisted
# customer intent: As a Power BI user, I want to find out how to use shareable cloud connections in the Power BI service so that I can set up multiple connections to the same data source, share my connections with others, and centralize data source connection management.
---

# Create and share cloud data sources in the Power BI service

In the Power BI service, you can create, share, and manage cloud connections for various artifacts and experiences:

- Semantic models
- Paginated reports
- Datamarts
- Dataflows
- Power Query Online experiences that you access by selecting **Get data**

This article shows you how to create a shareable cloud connection, share it with others, and assign it to a semantic model. For more information about the benefits, see [Advantages of shareable cloud connections](service-connect-cloud-data-sources.md#advantages-of-shareable-cloud-connections).

> [!NOTE]
> When you publish a `.pbix` file with a cloud data source from Power BI Desktop, a cloud connection is created automatically.

## Create a shareable cloud connection

To create a shareable cloud connection, take the following steps:

1. Go to the Power BI service, select **Settings** :::image type="icon" source="media/service-create-share-cloud-data-sources/settings-icon.png":::, and then select **Manage connections and gateways**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/service-settings-manage-connections.png" alt-text="Screenshot of the home page of the Power BI service. In the expanded Settings menu, Manage connections and gateways is highlighted." lightbox="media/service-create-share-cloud-data-sources/service-settings-manage-connections.png":::

1. On the **Manage Connections and Gateways** page, go to the **Connections** tab, and then select **New**.

1. In the **New connection** dialog, take the following steps:
   1. Select **Cloud**.
   1. Under **Connection name**, enter a name for the new connection.
   1. Under **Connection type**, select the type of connection that you want to create.

   :::image type="content" source="media/service-create-share-cloud-data-sources/new-connection-dialog-select-cloud.png" alt-text="Screenshot of the New connection dialog in the Power BI service. Three types of connections are listed. Among them, Cloud is highlighted.":::

   The dialog expands to include fields for configuring the selected connection type.

1. In the expanded **New connection** dialog, enter connection information for your data source, and then select **Create**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/new-connection-dialog-enter-information.png" alt-text="Screenshot of the New connection dialog. Fields like the name, type, and server are filled out. An authentication method of Basic is selected." lightbox="media/service-create-share-cloud-data-sources/new-connection-dialog-enter-information.png":::

1. Scroll to the top of the dialog and check for notifications about the connection status.

After Power BI creates your connection, you can share it with others.

## Share a shareable cloud connection

To share a shareable cloud connection, take the following steps:

1. In the Power BI service, select **Settings** :::image type="icon" source="media/service-create-share-cloud-data-sources/settings-icon.png":::, and then select **Manage connections and gateways**.

1. Locate the connection that you want to share. Next to it, select **More actions** :::image type="icon" source="media/service-create-share-cloud-data-sources/ellipsis-icon.png":::, and then select **Manage users**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/manage-connections-gateways-manage-users.png" alt-text="Screenshot of the Manage Connections and Gateways page. In the connection list, Manage users is highlighted in the shortcut menu for MyDemoConnection.":::

1. In the **Manage users** dialog, search for the people you want to share the connection with. You can search by name or email address. Grant the permission level that each person needs. To let users connect their artifacts to the data source, grant at least *User* permission.

   :::image type="content" source="media/service-create-share-cloud-data-sources/manage-users-share-connection-dialog.png" alt-text="Screenshot of the Manage users dialog that shows a search box and a Shared with list. Available permissions are User, User with resharing, and Owner.":::

1. Select **Share**.

## Assign a shareable cloud connection to a semantic model

After you create a shareable cloud connection, you can assign it to a semantic model.

1. Go to the workspace that contains the semantic model that you want to connect.

1. Locate the semantic model in the list. Next to the model name, select **More options** :::image type="icon" source="media/service-create-share-cloud-data-sources/more-options-icon.png":::, and then select **Settings**.

1. On the settings page, expand the **Gateway and cloud connections** section. By default, the data source maps to a personal cloud connection.

   :::image type="content" source="media/service-create-share-cloud-data-sources/semantic-model-cloud-connection-default-settings.png" alt-text="Screenshot of the gateway and cloud connection settings for a semantic model. The data source is mapped to a personal cloud connection.":::

1. In the **Maps to** list, select the shareable connection that you want to use, and then select **Apply**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/semantic-model-cloud-connection-select-new-connection.png" alt-text="Screenshot of the gateway and cloud connection settings for a semantic model. In the data source mapping list, myDemoConnection is selected.":::

   Power BI assigns the shareable cloud connection to the semantic model.

If you open the **Gateway and cloud connections** settings for a semantic model before you create a shareable connection, you can select **Maps to** > **Create a connection** to open the **New connection** dialog. The fields are prepopulated with information about the semantic model's data source.

## Granular access control

Power BI always enforces granular access control for shareable cloud connections. For other data access scenarios, you can turn on granular access control at the tenant, workspace, and semantic model levels.

You can find the setting at the following levels:

- **Tenant level**: In the Power BI service, go to **Settings** > **Admin portal** > **Tenant settings**. Search for the granular access control setting under **Integration settings**.
- **Workspace level**: Open the workspace, select **Settings**, and look for the granular access control option.
- **Semantic model level**: Go to the semantic model's **Settings** page, and then expand **Data access**.

The following image shows the settings at those three levels:

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-08.png" alt-text="Screenshots of tenant, workspace, and dataset granular access control settings, combined into one image. Each screenshot shows a toggle or checkbox." lightbox="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-08.png":::

Power BI applies these settings in the following order:

- If a tenant admin turns on granular access control for all connection types, Power BI enforces it across the organization. Workspace admins and artifact owners can't override a tenant-level setting.
- If granular access control isn't enforced at the tenant level, workspace admins can enforce it for their workspaces.
- If workspace admins don't enforce it, artifact owners can decide whether to enforce it for each artifact.

By default, granular access control is turned off at all three levels. When it isn't enforced at the tenant or workspace level, artifact owners can turn it on for individual artifacts. However, enabling it at the workspace level is often easier to manage.

## Related content

For important information about shareable cloud connections, including limitations and considerations, see [Connect to cloud data sources in the Power BI service](service-connect-cloud-data-sources.md).
