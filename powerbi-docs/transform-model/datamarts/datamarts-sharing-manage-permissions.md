---
title: Sharing Power BI datamarts and managing permissions
description: Learn how to share Power BI datamarts and manage permissions effectively to provide users with specific access and enhance collaboration.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: concept-article
ms.date: 09/30/2024
ms.custom: FY25Q1-Linter
LocalizationGroup: Data from files
#customer intent: As a Power BI user I want to learn how to share Power BI datamarts and manage permissions.
---

# Sharing datamarts and managing permissions (preview)

This article describes the ways you can share your datamarts and manage its permissions to provide users with specific access.

## Sharing datamarts for consumption

Once a datamart has been created, you can share it for downstream consumption by other users in your organization. Sharing a datamart enables the recipient to access the datamart in the following ways:  

* **SQL connection string:** Connect to the datamart’s underlying SQL connection string and query the datamart from SQL client tools.

* **Auto-generated semantic model:** Build content based on the datamart’s underlying semantic model, by providing *Build* permissions.

There are a few ways to share a datamart, described in the following sections.

### Share from a workspace

While in the workspace, select the **Share** option from the datamart’s context menu, as shown in the following image.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-01.png" alt-text="Screenshot of sharing a datamart from a workspace." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-01.png":::

### Share from the data hub

To share a datamart from the data hub, select **Share** from the datamart’s context menu within the data hub. You can perform this sharing from any of tabs in that window: **All**, **My data**, **Trusted in your org** or **Recommended**.

The following image shows selecting the context menu from within the data hub, and selecting **Share**.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-02.png" alt-text="Screenshot of sharing a datamart from the data hub." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-02.png":::

### Share from datamart information page

To share a datamart from the information page in the data hub, select the **Share** button from the ribbon at the top of the page.

The following image shows the **Share** button from the ribbon.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-03.png" alt-text="Screenshot of sharing a datamart from the ribbon within the data hub using the ribbon.":::

You can also select the **Share datamart** button from the information panel itself, within the data hub. The following image highlights the **Share** button on the information panel.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-04.png" alt-text="Screenshot of sharing a datamart from the information panel in the data hub using a button on the datamart information screen." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-04.png":::

### The share datamart process

Regardless of which way you choose to share a datamart, the **Grant people access** window appears so you can enter the names or email addresses of the people or groups (distribution groups or security groups) in your organization with whom you want to grant access to the datamart.

You can choose whether recipients can reshare the datamart with others in the organization, by selecting the checkbox next to **Allow recipients to share this datamart**. There's an option to allow users to create Power BI reports (from scratch, autocreate, paginated reports) on top of the default semantic model that is connected to the datamart by selecting the checkbox next to **Build reports on the default semantic model**. Both of these options are selected by default.

You can also choose to send recipients a message to provide more context, by typing a message into the **Add a message (optional)** field in the **Grant people access** window.

The following image shows the **Grant people access** window.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-06.png" alt-text="Screenshot of sharing a datamart from the information panel in the data hub.":::

Once you grant access, recipients receive an email stating they've been granted access to the datamart. The email includes a button titled **Open this datamart** that opens the datamart's information page.

When recipients open the link or otherwise navigate to the shared datamart, its information page shows the SQL connection string for connecting to the datamart. Users can use client tools other than Power BI, such as SSMS, to query the datamart using T-SQL.

The following image highlights the **SQL connection string** in a datamart information window.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-07.png" alt-text="Screenshot of SQL connection string for a datamart." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-07.png":::

Users can build reports with the datamart or use Analyze in Excel, and can also connect to the datamart or underlying semantic model from Power BI Desktop.

The following image highlights the **Create a report** entry point in a datamart information window.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-05.png" alt-text="Screenshot of Create a report for a datamart." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-05.png":::

> [!NOTE]
> Sharing a datamart allows the recipient to access the datamart for downstream consumption and not to collaborate on the datamart creation. To enable other creators to collaborate on the datamart, you must provide Member, Admin or Contributor access to the workspace where the datamart is created.  

## Manage permissions

The Manage permissions page shows the list of users who have been given access by either assigning to Workspace roles or item permissions (as described earlier in this article).

If you're an Admin or Member, go to your workspace and select **More options** which shows the context menu and select **Manage permissions**.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-08_2.png" alt-text="Screenshot of selecting Manage Permissions from the workspace context menu." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-08_2.png":::

For users who were provided workspace roles, it shows the corresponding user, workspace role, and permissions. Admin and Members have **Read**, **Write**, and **Reshare** access to datamarts in this workspace. Contributors have **Read** and **Write** permissions. Viewers have **Read** permissions and can query all objects within the datamart. For users with whom a datamart was shared, item permissions such as **Read** and **Reshare** are provided by default.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-09_2.png" alt-text="Screenshot of the datamart Manage Permissions page." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-09_2.png":::

You can choose to add or remove permissions using the **Manage permissions** experience. **Remove reshare** removes the *Reshare* permissions. **Remove access** removes all item permissions and stops sharing the datamart with the specified user.

:::image type="content" source="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-10_2.png" alt-text="Screenshot of the Remove reshare permission selected from the datamart Manage Permissions page." lightbox="media/datamarts-sharing-manage-permissions/datamarts-sharing-manage-permissions-10_2.png":::

## Related content

This article provided information about creating reports using datamarts.

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Sharing and discovering data using datamarts](datamarts-sharing-manage-permissions.md)
* [Understand datamarts](datamarts-understand.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Access control in datamarts](datamarts-access-control.md)
* [Datamart administration](datamarts-administration.md)

For more information about dataflows and transforming data, see the following articles:

* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)
