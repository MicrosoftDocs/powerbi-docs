---
title: Create the new workspaces (preview) - Power BI
description: Learn how to create the new workspaces, collections of dashboards and reports built to deliver key metrics for your organization.
author: maggiesMSFT
manager: kfile
ms.reviewer: lukaszp
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 12/19/2018
ms.author: maggies

LocalizationGroup: Share your work
---
# Create the new workspaces (preview) in Power BI

Power BI is introducing a new workspace experience as a preview. Workspaces are still places to collaborate with colleagues to create collections of dashboards and reports, which you can bundle into *apps* and distribute to your whole organization or to specific people or groups. 

![Power BI new workspaces preview](media/service-create-the-new-workspaces/power-bi-new-workspaces-preview.png)

With the new workspaces preview you can now:

- Assign workspace roles to user groups: security groups, distribution lists, Office 365 groups, and individuals.
- Create a workspace in Power BI without creating an Office 365 group.
- Use more granular workspaces roles for more flexible permissions management in a workspace.

Read more background about the [new workspaces (preview)](service-new-workspaces.md).

## Create one of the new app workspaces

1. Start by creating the app workspace. Select **Workspaces** > **Create app workspace**.
   
     ![Create app workspace](media/service-create-the-new-workspaces/power-bi-create-app-workspace.png)

2. In **Preview improved workspaces**, select **Try now**.
   
     ![Preview improved workspaces](media/service-create-the-new-workspaces/power-bi-preview-improved-workspaces.png)

2. Give the workspace a name. If the name isn't available, edit it to come up with a unique ID.
   
     The app will have the same name as the workspace.
   
1. Add an image, if you want. The file size has to be less than 45 KB.
 
    ![Name the workspace and add an image](media/service-create-the-new-workspaces/power-bi-name-workspace.png)

1. Select **Save**.

    Here in the **Welcome** screen for your new workspace, you can add data. 

    ![New workspace Welcome screen](media/service-create-the-new-workspaces/power-bi-workspace-welcome-screen.png)

1. For example, select **Samples** > **Customer Profitability Sample**.

    Now in the workspace content list, you see **New workspaces preview**. Because you're an admin, you also see a new action, **Access**.

    ![Workspaces preview content list](media/service-create-the-new-workspaces/power-bi-workspaces-preview-content-list.png)

1. Select **Access**.

1. Add security groups, distribution lists, Office 365 groups, or individuals to these workspaces as members, contributors, or admins. See [Roles in the new workspaces](#roles-in-the-new-workspaces) later in this article for an explanation of the different roles.

    ![Workspaces add members, admins, contributors](media/service-create-the-new-workspaces/power-bi-access-add-members.png)

9. Select **Add** > **Close**.

1. Power BI creates the workspace and opens it. It appears in the list of workspaces you’re a member of. Because you’re an admin, you can select the ellipsis (…) to go back and make changes to workspace settings, adding new members, or changing their permissions.

     ![Edit settings and access for a workspace](media/service-create-the-new-workspaces/power-bi-edit-workspace.png)

## Add content to your app workspace

After you've created an app workspace of the new style, it's time to add content to it. Adding content is similar in the new and old style workspaces, with one exception. While in either app workspace, you can upload or connect to files, just as you would in your own My Workspace. In the new workspaces, you can't connect to organizational content packs, or third-party content packs such as Microsoft Dynamics CRM, Salesforce, or Google Analytics. In the current workspaces you can connect to content packs.

When you view content in the content list of an app workspace, the app workspace name is listed as the owner.

### Connecting to third-party services in new workspaces (preview)

In the new workspaces experience, we are making a change to focus on *apps*. Apps for third-party services make it easy for users to obtain data from the services they use, such as Microsoft Dynamics CRM, Salesforce, or Google Analytics.
Organizational apps give your users the internal data they need. We plan to add capabilities to organizational apps so users can customize the content they find within the apps. That will remove the need for content packs. 

With the new workspaces preview, you can't create or consume organizational content packs. Instead you can use the apps provided to connect to third-party services, or ask your internal teams to provide apps for any content packs you’re currently using. 

## Distribute an app

When the content is ready, you choose which dashboards and reports you want to publish, and then you publish it as an *app*. You can create one app from each workspace. Your coworkers can get your app in a few different ways. You can install it automatically in your coworkers' Power BI accounts if your Power BI administrator gives you permission. Otherwise, they can find and install your app from Microsoft AppSource, or you can send them a direct link. They get updates automatically and you can control how frequently the data refreshes. See [Publish apps with dashboards and reports in Power BI](service-create-distribute-apps.md) for details.

## Convert old app workspaces to new app workspaces

During the preview period, you can't automatically convert your old app workspaces to new ones. You can however create a new app workspace and publish your content to the new location. 

When the new workspaces are generally available (GA), you can opt in to migrate the old ones automatically. At some point after GA, you'll have to migrate them.

## Next steps
* [Create the current workspaces](service-create-workspaces.md)
* [Install and use apps in Power BI](service-create-distribute-apps.md)
* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
