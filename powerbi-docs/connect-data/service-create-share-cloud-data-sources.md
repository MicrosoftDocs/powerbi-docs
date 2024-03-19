---
title: Create and share cloud data sources in the Power BI service
description: Learn how to create and share cloud data source connections in the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/28/2024
LocalizationGroup: Connect to data
---
# Create and share cloud data sources in the Power BI service

With Power BI, you can create, share, and manage cloud connections for semantic models and paginated reports, datamarts, and dataflows, as well as Power Query Online experiences in *Get data*, all within the Power BI service user experience.

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

The **Manage users** window appears, where you can search users by name or by their email address, and then grant them the permission level you want them to have. You must at least grant *User* permission to allow users to connect their artifacts to the connection's data source.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-05.png" alt-text="Screenshot of applying user permission to a shareable cloud connection.":::

Once you've found the user and assigned permission, select **Share** at the bottom of the **Manage users** window to apply your selections.


## Assign a shared cloud connection to a semantic model

Once you've created a shareable cloud connection, you can assign it to a semantic model.

Open the settings for the semantic model to which you want the shareable connection to apply, and expand the **Gateway and cloud connections** section. You'll notice that the connection is mapped to a *Personal Cloud Connection* by default.

:::image type="content" source="media/service-create-share-cloud-data-sources/service-create-share-cloud-data-sources-06.png" alt-text="Screenshot of cloud connection defaulting to personal cloud connection.":::

From the **Maps to** drop down, select the name of the shareable connection you created and want to use, then select **Apply**.

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
