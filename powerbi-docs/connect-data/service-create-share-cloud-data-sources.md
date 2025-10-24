---
title: Create and share cloud data sources in the Power BI service
description: Learn how to create and share cloud data source connections in the Power BI service.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/03/2024
LocalizationGroup: Connect to data
ms.custom: sfi-image-nochange
---
# Create and share cloud data sources in the Power BI service

With Power BI, you can create, share, and manage cloud connections for semantic models and paginated reports, datamarts, and dataflows, as well as Power Query Online experiences in *Get data*, all within the Power BI service user experience.

This article shows you how to create a shareable cloud connection, and then shows you how to share that connection with others. Creating and sharing shareable cloud connections have many advantages, as described in [advantages of shareable cloud connections](service-connect-cloud-data-sources.md#advantages-of-shareable-cloud-connections).

## Create a shareable cloud connection

To create a shareable cloud connection, take the following steps:

1. Go to the Power BI service, select **Settings** :::image type="icon" source="media/service-create-share-cloud-data-sources/settings-icon.png":::, and then select **Manage connections and gateways**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/service-settings-manage-connections.png" alt-text="Screenshot of the home page of the Power BI service. In the expanded Settings menu, Manage connections and gateways is highlighted." lightbox="media/service-create-share-cloud-data-sources/service-settings-manage-connections.png.png":::

1. On the **Manage Connections and Gateways** page, go to the **Connections** tab, select **New**, and then select **Cloud**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/new-connection-dialog-select-cloud.png" alt-text="Screenshot of the New connection dialog in the Power BI service. Three types of connections are listed. Among them, Cloud is highlighted.":::

1. In the **New connection** dialog, take the following steps:
   1. Under **Connection name**, enter aname for the new connection.
   1. Under **Connection type**, select an appropriate type.
   1. In the fields that appear, enter the connection details for your data source.
   1. Select **Create**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/new-connection-dialog-enter-information.png" alt-text="Screenshot of the New connection dialog. Fields like the name, type, and server are filled out. An authentication method of Basic is selected." lightbox="media/service-create-share-cloud-data-sources/new-connection-dialog-enter-information.png":::

With your connection created, you're ready to share it with others.

> [!NOTE]
> When you publish a .PBIX file with a cloud data source from Power BI Desktop, a cloud connection is created automatically.

## Share a shareable cloud connection

To share a shareable cloud connection, take the following steps:

1. In the Power BI service, select **Settings** :::image type="icon" source="media/service-create-share-cloud-data-sources/settings-icon.png":::, and then select **Manage connections and gateways**.

1. Locate the connection that you want to share. Next to it, select **More** :::image type="icon" source="media/service-create-share-cloud-data-sources/ellipsis-icon.png":::, and then select **Manage users**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/manage-connections-gateways-manage-users.png" alt-text="Screenshot of the Manage Connections and Gateways page. In the connection list, Manage users is highlighted in the shortcut menu for MyDemoConnection.":::

1. In the **Manage users** dialog, search for users you want to share the connection with. You can search by their name or email address. Grant them the permission level you want them to have. You must at least grant *User* permission to allow users to connect their artifacts to the connection's data source.

   :::image type="content" source="media/service-create-share-cloud-data-sources/manage-users-share-connection-dialog.png" alt-text="Screenshot of the Manage users dialog that shows a search box and a Shared with list. Available permissions are User, User with resharing, and Owner.":::

1. Select **Share** to apply your selections.

## Assign a shared cloud connection to a semantic model

After you create a shareable cloud connection, you can assign it to a semantic model.

1. Go to the workspace that contains the semantic model that you want to apply the shareable connection to.

1. Locate the semantic model in the list. Next to the name of the model, select **More** :::image type="icon" source="media/service-create-share-cloud-data-sources/ellipsis-icon.png":::, and then select **Settings**.

1. On the settings page, expand the **Gateway and cloud connections** section. The connection is mapped to a personal cloud connection by default.

   :::image type="content" source="media/service-create-share-cloud-data-sources/semantic-model-cloud-connection-default-settings.png" alt-text="Screenshot of the gateway and cloud connection settings for a semantic model. The data source is mapped to a personal cloud connection.":::

1. In the **Maps to** list, select the name of the shareable connection that you want to use, and then select **Apply**.

   :::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-07.png" alt-text="Screenshot of selecting a shareable cloud connection for a semantic model.":::

That's it, you've now assigned your shareable cloud connection to the semantic model.

If you haven't created a shareable cloud connection yet when you're using this screen, you can select the **Create a connection** option from the drop-down to be taken to the **Manage connections and gateways** experience, and all the connection details from the data source for which you selected the **Create a connection** drop-down are prepopulated in the **Create new cloud connection** form. 

## Granular access control

Power BI enforces granular access control for shareable cloud connections. Access control for all data types can be enabled at the tenant, workspace, and semantic model level. The following image shows how access control can be enforced at the tenant, the workspace, or the semantic model. Each setting provides granular access control, with different priority.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-08.png" alt-text="Screenshot of granular access control.":::

If a tenant admin enables granular access control for all connection types, then granular access control is enforced for the entire organization. Workspace admins and artifact owners can't overrule granular access control enabled at the tenant level. 

If granular access control isn't enforced at the tenant level, workspace admins can enforce granular access control for their workspaces. And if workspace admins don’t enforce granular access control, then artifact owners can decide whether to enforce granular access control for each of their artifacts independently. 

By default, granular access control is disabled at all three levels, enabling individual artifact owners to enforce granular access control for each data connection type selectively. However, it's likely more efficient to enable granular access control on a workspace-by-workspace basis.

## Related content

For important information about shareable cloud connections, including limitations and considerations, read the following article:

- [Connect to cloud data sources in the Power BI service](service-connect-cloud-data-sources.md)
