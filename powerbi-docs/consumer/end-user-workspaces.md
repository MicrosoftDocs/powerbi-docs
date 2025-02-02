---
title: How content is organized in workspaces
description: Learn about the types of Power BI workspaces and which permissions and licensing you need to access them.
author: kfollis
ms.author: kfollis
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/11/2025
ms.custom: licensing support
LocalizationGroup: Consumers
---

# Collaborate in workspaces

 *Workspaces* are places to collaborate with colleagues on specific content. Power BI *designers* create workspaces to hold collections of dashboards and reports. The designer can then share the workspace with colleagues. Designers can also bundle a collection of dashboards and reports into an *app* and distribute it to the entire community, to their organization, or to specific people or groups. Certain types of apps called *template apps*, create a workspace when the app is installed. [Learn more about apps](end-user-apps.md).

 Everyone using the Power BI service also has a **My workspace**. My workspace is your personal sandbox where you can create content for yourself.

 You can see your workspaces in Power BI by selecting **Workspaces** from your navigation pane.

 :::image type="content" source="media/end-user-workspaces/power-bi-home-workspaces.png" alt-text="Screenshot shows the navigation pane with two types of workspaces.":::

## Types of workspaces
**My Workspace** stores all the content that you own and create. Think of it as your personal sandbox or work area for your own content. For many Power BI *business users*, **My workspace** remains empty because your job doesn't involve creating new content. *Business users*, by definition, consume data created by others and use that data to make business decisions. If you find that you're creating content, consider reading [the Power BI articles for designers](../create-reports/index.yml) instead.

**Workspaces** contain content that can be use by one person or many. Because the designer of the workspace can assign permissions to a workspace, it's a great place for collaboration. Designers can share the workspace, invite collaborators, and even create and distribute apps based on the workspace contents. 

When a *designer* creates an app, they bundle together all the content that's necessary for that app to be utilized. Content might include dashboards, reports, and semantic models. Not every app contains these three pieces of content. An app might contain only one dashboard, or three of each content type, or even 20 reports. It all depends on what the *designer* includes in the app. Commonly, app workspaces shared with *business users* don't include the semantic models.

The following **Azure Decom** workspace contains several reports and a dashboard.

:::image type="content" source="media/end-user-workspaces/power-bi-app-workspaces.png" alt-text="Screenshot shows how a workspace appears under the Workspaces menu item and contains reports and a dashboard.":::

## Permissions in the workspaces

Access permissions determine what you can do in a workspace, so teams can collaborate. When *designers* grant access to a workspace, they add individuals or groups to one of the workspace roles: **Viewer**, **Member**, **Contributor**, or **Admin**. 

As a Power BI *business user*, you typically interact in workspaces using the **Viewer** role. But *designers* can also assign you to the **Member** or **Contributor** role. The Viewer role lets you view and interact with content (dashboards, reports, apps) created by others and shared with you. And because the Viewer role can't access the underlying semantic model, it's a safe way to interact with content and not have to worry that you'll "hurt" the underlying data.

For a detailed list of what you can do as a *business user* with the Viewer role, see [Power BI features for business users](end-user-features.md).

For a detailed list of all four roles and their capabilities, see [Workspace roles](../collaborate-share/service-roles-new-workspaces.md).


## Licensing, workspaces, and capacity
Licensing also plays a part in determining what you can and can't do in a workspace. Many sharing and collaborating features require that the user has a Power BI *Pro* or *Premium Per User (PPU)* license or for the workspace to be stored in Premium capacity. 

Often, *business users* work with a free license. [Learn more about licensing](end-user-license.md). If the content isn't stored in Premium capacity, the business user doesn't have access.

If the workspace is stored in Premium capacity, *business users* who are granted permission by the designer, are able to view and interact with the content in that workspace. This icon :::image type="icon" source="media/end-user-workspaces/power-bi-diamond-icon.png"::: identifies Premium workspaces. This icon :::image type="icon" source="media/end-user-workspaces/power-bi-PPU-icon.png"::: identifies Premium Per User workspaces.

:::image type="content" source="media/end-user-workspaces/power-bi-diamond.png" alt-text="Screenshot showing a list of Workspaces with Premium icons outlined.":::

To learn more, see [Which license do I have?](end-user-license.md).


## Related content

* [Apps in Power BI](end-user-apps.md)

* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)