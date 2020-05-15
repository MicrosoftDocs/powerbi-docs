---
title: Create the new workspaces - Power BI
description: Learn how to create the new workspaces, collections of dashboards, reports, and paginated reports built to deliver key metrics for your organization.
author: maggiesMSFT
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/15/2020
ms.author: maggies
ms.custom: contperfq4

LocalizationGroup: Share your work
---
# Create the new workspaces in Power BI

This article explains how to create one of the *new workspaces* instead of a *classic* workspace. Both kinds of workspaces are places to collaborate with colleagues on collections of dashboards, reports, and paginated reports. If you want, you can also bundle that collection into an *app* and distribute it to a broader audience.

Here's how the new workspaces are different from the old. In the new workspaces, you can:

- Assign workspace roles to user groups and individuals.
- Create a workspace in Power BI without creating a Microsoft 365 Group.
- Use more granular workspace roles for more flexible permissions management.

For more background, see the [new workspaces](service-new-workspaces.md) article.

Ready to migrate your classic workspace? See [Upgrade classic workspaces to the new workspaces in Power BI](service-upgrade-workspaces.md) for details.

> [!NOTE]
> To enforce row-level security (RLS) for Power BI Pro users browsing content in a workspace, assign the users the Viewer Role.

## Create one of the new workspaces

1. Start by creating the workspace. Select **Workspaces** > **Create workspace**.
   
     ![Create workspace](media/service-create-the-new-workspaces/power-bi-workspace-create.png)

2. You're automatically creating an upgraded workspace, unless you opt to **Revert to classic**.
   
     ![New workspace experience](media/service-create-the-new-workspaces/power-bi-new-workspace.png)
     
     If you select **Revert to classic**, you [create a classic workspace](service-create-workspaces.md) based on a Microsoft 365 Group.

2. Give the workspace a unique name. If the name isn't available, edit it to come up with a unique name.
   
     The app you create from the workspace will have the same name and icon as the workspace.
   
1. Here are some optional items you can set for your workspace:

    Upload a **Workspace image**. Files can be .png or .jpg format. File size has to be less than 45 KB.
    
    [Add a **Contact list**](#create-a-contact-list). By default, the workspace admins are the contacts. 
    
    [Specify a **Workspace OneDrive**](#set-a-workspace-onedrive) to use a Microsoft 365 Group's file storage location. 

    To assign the workspace to a **Dedicated capacity**, on the **Premium** tab select **Dedicated capacity**.
     
    ![Dedicated capacity](media/service-create-the-new-workspaces/power-bi-workspace-premium.png)

1. Select **Save**.

    Power BI creates the workspace and opens it. You see it in the list of workspaces you’re a member of. 

## Create a contact list

You can specify which users receive notification about issues occurring in the workspace. By default, any user or group specified as a workspace admin is notified, but you can add others to the *contact list*. Users or groups in the contact list are listed in the user interface (UI) to help users get help related to the workspace.

1. Access the new **Contact list** setting in one of two ways:

    In the **Create a workspace** pane when you first create it.

    In the nav pane, select the arrow next to **Workspaces**, select **More options** (...) next to the workspace name > **Workspace settings**. The **Settings** pane opens.

    ![Workspace settings](media/service-create-the-new-workspaces/power-bi-workspace-new-settings.png)

2. Under **Advanced** > **Contact list**, accept the default, **Workspace admins**, or add your own list of **Specific users or groups**. 

    ![Workspace contacts](media/service-create-the-new-workspaces/power-bi-workspace-contacts.png)

3. Select **Save**.

## Set a workspace OneDrive

The Workspace OneDrive feature allows you to configure a Microsoft 365 Group whose SharePoint Document Library file storage is available to workspace users. You create the group outside of Power BI first. 

Power BI doesn't synchronize permissions of users or groups who are configured to have workspace access with the Microsoft 365 Group membership. The best practice is to give the same Microsoft 365 Group, whose file storage you configure in this setting Microsoft 365 Group, [access to the workspace](#give-access-to-your-workspace). Then manage workspace access by managing membership of the Microsoft 365 Group. 

1. Access the new **Workspace OneDrive** setting in one of two ways:

    In the **Create a workspace** pane when you first create it.

    In the nav pane, select the arrow next to **Workspaces**, select **More options** (...) next to the workspace name > **Workspace settings**. The **Settings** pane opens.

    ![Workspace settings](media/service-create-the-new-workspaces/power-bi-workspace-new-settings.png)

2. Under **Advanced** > **Workspace OneDrive**, type the name of the Microsoft 365 Group that you created earlier. Type just the name, not the URL. Now this workspace can use that Power BI automatically picks up the OneDrive for the group.

    ![Specify a OneDrive location](media/service-create-the-new-workspaces/power-bi-new-workspace-onedrive.png)

3. Select **Save**.

### Access the workspace OneDrive location

After you've configured the OneDrive location, you get to it in the same way you get to other data sources in the Power BI service.

1. In the nav pane, select **Get Data**, then in the **Files** box select **Get**.

    ![Get data, get files](media/service-create-the-new-workspaces/power-bi-get-data-files.png)

1.  The **OneDrive – Business** entry is your own OneDrive for Business. The second OneDrive is the one you added.

    ![Workspace files location - get data](media/service-create-the-new-workspaces/power-bi-new-workspace-get-data-onedrive.png)

### Connect to apps in new workspaces

The new workspace experiences create and consume *apps* instead of content packs. Apps are collections of dashboards, reports, and datasets that connect to third-party services and organizational data. Apps make it easy to get data from the services such as Microsoft Dynamics CRM, Salesforce, and Google Analytics.

In the new workspace experience, you can't create or consume organizational content packs. Ask your internal teams to provide apps for any content packs you’re currently using. 

## Give access to your workspace

Anyone who has an admin role in a workspace can give others access to the workspace.

1. Because you're an admin, on the workspace content list page, you see **Access**.

    ![Workspaces content list](media/service-create-the-new-workspaces/power-bi-workspace-access-icon.png)

1. Add security groups, distribution lists, Microsoft 365 Groups, or individuals to these workspaces as admins, members, contributors, or viewers. See [Roles in the new workspaces](service-new-workspaces.md#roles-in-the-new-workspaces) for an explanation of the different roles.

    ![Workspaces add members, admins, contributors](media/service-create-the-new-workspaces/power-bi-workspace-add-members.png)

9. Select **Add** > **Close**.


## Distribute an app

If you want to distribute official content to a large audience in your organization, you can publish an *app* from your workspace.  When the content is ready, you choose which dashboards and reports you want to publish, and publish it as an app. You can create one app from each workspace.

Read about how to [publish an app from the new workspaces](service-create-distribute-apps.md).

## Next steps
* Read about [organizing work in the new workspaces experience in Power BI](service-new-workspaces.md)
* [Create classic workspaces](service-create-workspaces.md)
* [Publish an app from the new workspaces in Power BI](service-create-distribute-apps.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
