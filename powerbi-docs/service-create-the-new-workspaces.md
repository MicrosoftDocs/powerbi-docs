---
title: Create the new workspaces - Power BI
description: Learn how to create the new workspaces, collections of dashboards and reports built to deliver key metrics for your organization.
author: maggiesMSFT
manager: kfile
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 04/02/2019
ms.author: maggies

LocalizationGroup: Share your work
---
# Create the new workspaces in Power BI

Power BI is introducing a new workspace experience. Workspaces are still places to collaborate with colleagues to create collections of dashboards and reports, which you can bundle into *apps* and distribute to your whole organization or to specific people or groups. 

In the new workspaces, you can:

- Assign workspace roles to user groups: security groups, distribution lists, Office 365 groups, and individuals.
- Create a workspace in Power BI without creating an Office 365 group.
- Use more granular workspaces roles for more flexible permissions management in a workspace.

For more background, see the [new workspaces](service-new-workspaces.md) article.

## Create one of the new app workspaces

1. Start by creating the app workspace. Select **Workspaces** > **Create app workspace**.
   
     ![Create app workspace](media/service-create-the-new-workspaces/power-bi-create-app-workspace.png)

2. You're automatically creating an upgraded workspace, unless you opt to **Revert to classic**.
   
     ![New workspace experience](media/service-create-the-new-workspaces/power-bi-new-workspace.png)
     
     If you select **Revert to classic**, you create a workspace based on an Office 365 Group. Use this option if you need the **Members can only view Power BI content** option to enforce row-level security (RLS) for workspace members.

2. Give the workspace a name. If the name isn't available, edit it to come up with a unique name.
   
     The app for the workspace will have the same name and icon as the workspace.
   
1. Here are some optional items you can specify for your workspace:

    Upload an image. The file size has to be less than 45 KB.
    
    Add a **Contact list**. By default, the workspace admins are the contacts. 
    
    Specify a **Workspace OneDrive**. In this step, you're not creating a OneDrive location. You're specifying an existing location.

    Assign the workspace to a **Dedicated capacity**.
     
    ![Name the workspace, add an image, and other details](media/service-create-the-new-workspaces/power-bi-new-workspace-details.png)

1. Select **Save**.

    Here in the **Welcome** screen for your new workspace, you can add data. 

    ![New workspace Welcome screen](media/service-create-the-new-workspaces/power-bi-workspace-welcome-screen.png)

1. For example, select **Samples** > **Customer Profitability Sample**.

7. Now in the workspace content list, because you're an admin, you also see a new action, **Access**.

    ![Workspaces content list](media/service-create-the-new-workspaces/power-bi-workspace-content-list.png)

1. Select **Access**.

1. Add security groups, distribution lists, Office 365 groups, or individuals to these workspaces as members, contributors, or admins. See [Roles in the new workspaces](service-new-workspaces.md#roles-in-the-new-workspaces) for an explanation of the different roles.

    ![Workspaces add members, admins, contributors](media/service-create-the-new-workspaces/power-bi-access-add-members.png)

9. Select **Add** > **Close**.

1. Power BI creates the workspace and opens it. You see it in the list of workspaces you’re a member of. Because you’re an admin, you can select the ellipsis (…) to go back and make changes to workspace settings, adding new members, or changing their permissions. If you specified a Workspace Onedrive, a files option is shown as well.

     ![Edit settings and access for a workspace](media/service-create-the-new-workspaces/power-bi-edit-workspace.png)

## Add content to your app workspace

After you've created an new workspace experience workspace, it's time to add content to it. Adding content is similar in the new and classic workspaces, with one exception. While in either app workspace, you can upload or connect to files, just as you would in your own My Workspace. In the new workspaces, you can't connect to organizational content packs, or third-party content packs such as Microsoft Dynamics CRM, Salesforce, or Google Analytics. In classic workspaces, you can connect to content packs.

When you view content in the content list of an app workspace, the app workspace name is listed as the owner.

### Connecting to third-party services in new workspaces

In the new workspaces experience, we're making a change to focus on *apps*. Apps for third-party services make it easy for users to get data from the services they use, such as Microsoft Dynamics CRM, Salesforce, or Google Analytics.
Organizational apps give your users the internal data they need. We plan to add capabilities to organizational apps so users can customize the content they find within the apps. That capability will remove the need for content packs. 

In the new workspace experience, you can't create or consume organizational content packs. Instead you can use the apps provided to connect to third-party services, or ask your internal teams to provide apps for any content packs you’re currently using. 

## Distribute an app

When the content is ready, you choose which dashboards and reports you want to publish, and then you publish it as an *app*. You can create one app from each workspace. Your coworkers can get your app in a few different ways. You can install it automatically in your coworkers' Power BI accounts if your Power BI administrator gives you permission. Otherwise, they can find and install your app from Microsoft AppSource, or you can send them a direct link. They get updates automatically and you can control how frequently the data refreshes. See [Publish an app from the new workspaces in Power BI](service-create-distribute-apps.md) for details.


## Next steps
* Read about [organizing work in the new workspaces experienc in Power BI](service-new-workspaces.md)
* [Create classic workspaces](service-create-workspaces.md)
* [Publish an app from the new workspaces in Power BI](service-create-distribute-apps.md)
* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
