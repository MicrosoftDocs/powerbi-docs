---
title: Create the new workspaces (preview) - Power BI
description: Learn how to create the new workspaces, collections of dashboards and reports built to deliver key metrics for your organization.
author: maggiesMSFT
manager: kfile

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 06/01/2018
ms.author: maggies

LocalizationGroup: Share your work
---
# Create the new workspaces (preview) in Power BI

In Power BI, you can create *workspaces*, places to collaborate with colleagues to create and refine collections of dashboards and reports. Then you bundle those together into *apps* which you can distribute to your whole organization or to specific people or groups. 

![Power BI apps](media/service-create-workspaces/power-bi-apps-left-nav.png)

Now Power BI is introducing a new workspace experience. When you create one of the new workspaces, you're not creating an underlying, associated Office 365 group. All the group administration is in Power BI, not in Office 365. You can add an Office 365 group to the workspace if you want, along with security groups and distribution lists. 

You can add colleagues to these workspaces as members or admins. All app workspace members and admins need Power BI Pro licenses. In the workspace you can all collaborate on dashboards, reports, and other articles that you plan to publish to a wider audience, or even to your entire organization. 

When you distribute an app from a new workspace, app recipients can save a copy of the app to their own My Workspace. They can modify their own copy independent of the app you distributed. Their copy still maintains its connection to the underlying dataset. If you update and redistribute your app, you're not updating their version.

Your coworkers can get your apps in a few different ways. You can install them automatically in your coworkers' Power BI accounts if your Power BI administrator gives you permission. Otherwise, they can find and install your apps from Microsoft AppSource, or you can send them a direct link. They get updates automatically and you can control how frequently the data refreshes. 

## App workspaces

When the content is ready, you choose which dashboards and reports you want to publish, and then you publish the app. You can send a direct link to that wider audience, or they can find your app from the Apps tab by going to **Download and explore more apps from AppSource**. Those people can’t modify the contents of the app, but they can interact with it either in the Power BI service, or one of the mobile apps -– filtering, highlighting, and sorting the data themselves. 


Read more about the [app experience for business users](service-install-use-apps.md).

## Licenses for apps
Each member of an app workspace needs a Power BI Pro license. For app users, there are two options.

* Option 1: All business users need **Power BI Pro** licenses to view your app. 
* Option 2: Free users in your organization can view app content if your app resides in a Power BI Premium capacity. Read [What is Power BI Premium?](service-premium.md) for details.

## Video: Apps and app workspaces
<iframe width="640" height="360" src="https://www.youtube.com/embed/Ey5pyrr7Lk8?showinfo=0" frameborder="0" allowfullscreen></iframe>


## Roles in the new workspaces

The new workspaces offer more roles than the old workspaces had: admins, members, and contributors.

**Admins can:**

- Update and delete the workspace. 
- Add/remove people, including other admins.
- Delete the workspace.
- Change metadata.

**Members can:** 

– Add members or others with lower permissons.
- Publish and update apps.
- Share items and share apps.

**Contributors can:** 

– Create, edit, and delete content in the workspace. 
- Publish reports to the workspace, delete content.
- Can’t give new people access to content; can’t share new content, but can share with someone with whom the app is already shared; 
- Can’t modify the members of the group

## Rolling out new workspaces

During the preview period, old and new workspaces can coexist side by side, and you can create either. When the new workspaces preview ends and they're generally available, old workspaces can still exist for a time. You won't be able to create them, and you'll need to prepare to convert the ones you want to keep.

## Converting old workspaces to new workspaces

During the preview period, you can convert your old workspaces to new ones manually. When the new workspaces are generally available, you can opt in to migrate the old ones automatically. At some point after GA, you'll have to migrate them.


## Create one of the new workspaces

1. Start by creating the workspace. Select **Workspaces** > **Create app workspace**.
   
     ![Create app workspace](media/service-create-workspaces/power-bi-create-app-workspace.png)
   
    This will be the place to put content that you and your colleagues collaborate on.

2. Give the workspace a name. If the corresponding **Workspace ID** isn't available, edit it to come up with a unique ID.
   
     This will be the name of the app, too.
   
     ![Name the workspace](media/service-create-workspaces/power-bi-apps-create-workspace-name.png)

3. You have a few options to set. If you choose **Public**, anyone in your organization can see what’s in the workspace. **Private**, on the other hand, means only members of the workspace can see its contents.
   
     ![Set Private or Public](media/service-create-workspaces/power-bi-apps-create-workspace-private-public.png)
   
    You can't change the Public/Private setting after you've created the group.

4. You can also choose if members can **edit** or have **view-only** access.
   
     ![Set edit or view-only](media/service-create-workspaces/power-bi-apps-create-workspace-members-edit.png)
   
     Only add people to the app workspace so they can edit the content. If they're only going to view the content, don't add them to the workspace. You can include them when you publish the app.

5. Add email addresses of people you want to have access to the workspace, and select **Add**. You can’t add group aliases, just individuals.

6. Decide whether each person is a member or an admin.
   
     ![Set Member or Admin](media/service-create-workspaces/power-bi-apps-create-workspace-admin.png)
   
    Admins can edit the workspace itself, including adding other members. Members can edit the content in the workspace, unless they have view-only access. Both admins and members can publish the app.

7. If your organization has Premium, 
8. Select **Save**.

Power BI creates the workspace and opens it. It appears in the list of workspaces you’re a member of. Because you’re an admin, you can select the ellipsis (…) to go back and make changes to it, adding new members or changing their permissions.

You can tell you're in a new workspace by the banner at the top: New Workspaces Preview.

![Edit workspace](media/service-create-workspaces/power-bi-apps-edit-workspace-ellipsis.png)


## Create an app workspace based on an Office 365 group

For now, you can still create an app workspace built on an Office 365 group.

[!INCLUDE [powerbi-service-create-app-workspace](./includes/powerbi-service-create-app-workspace.md)]

When you first create it, you may need to wait an hour or so for the workspace to propagate to Office 365. 

### Add an image to your Office 365 app workspace (optional)
By default, Power BI creates a little colored circle for your app, with the app's initials. But maybe you want to customize it with an image. To add an image, you need an Exchange Online license.

1. Select **Workspaces**, select the ellipsis (...) next to the name of the workspace, then **Members**. 
   
     ![Select Workspace Members](media/service-create-distribute-apps/power-bi-apps-workspace-members.png)
   
    The Office 365 Outlook account for the workspace opens in a new browser window.
2. When you hover over the colored circle in the upper left, it turns into a pencil icon. Select it.
   
     ![Office 365 pencil icon](media/service-create-distribute-apps/power-bi-apps-workspace-edit-image.png)
3. Select the pencil icon again, and find the image you want to use.
   
     ![Select the pencil again](media/service-create-distribute-apps/power-bi-apps-workspace-edit-group.png)

4. Select **Save**.
   
     ![Select Save](media/service-create-distribute-apps/power-bi-apps-workspace-save-image.png)
   
    The image replaces the colored circle in the Office 365 Outlook window. 
   
     ![Customized image](media/service-create-distribute-apps/power-bi-apps-workspace-image-in-office-365.png)
   
    In a few minutes, it will appear in the app in Power BI, too.
   
     ![Customized image](media/service-create-distribute-apps/power-bi-apps-image.png)

## Add content to your app workspace

After you've created an app workspace of either the new or old style, it's time to add content to it. Adding content is just like adding content to your My Workspace, except the other people in the workspace can see and work on it, too. A big difference is that when you get done, you can publish the content as an app. While in the app workspace, you can upload or connect to files, or connect to third-party services, just as you would in your own My Workspace. For example:

* [Connect to services](service-connect-to-services.md) such as Microsoft Dynamics CRM, Salesforce, or Google Analytics.
* [Get data from files](service-get-data-from-files.md) such as Excel, CSV, or Power BI Desktop (PBIX) files.

When you view content in an app workspace, the owner is shown as the name of the app workspace.

## Publish your app
When the dashboards and reports in your app workspace are ready, you publish them as an app. Remember that you don't have to publish all the reports and dashboards in the workspace. You can just publish the ones that are ready.

## Power BI apps FAQ
### How are the new app workspaces different from existing app workspaces?
* Creating app workspaces won't create corresponding entities in Office 365 like group workspaces do. You can create any number of app workspaces without worrying about different Office 365 groups being created behind the scenes (you can still add an Office 365 group to your workspace). 
* In existing app workspaces, you can add only individuals to the members and admin lists. In the new app workspaces, you can add multiple AD security groups, distribution lists, or Office 365 groups to these lists to allow for easier management. 
- You can still create an organizational content pack from an existing app workspace. You can't create one from the new app workspaces. 

### How are apps different from organizational content packs?
Apps are the evolution of organizational content packs. If you have organizational content packs already, they'll continue to work side by side with apps. Apps and content packs have a few major differences. 

* After business users install a content pack, it loses its grouped identity: it's just a list of dashboards and reports interspersed with other dashboards and reports. Apps, on the other hand, maintain their grouping and identity even after installation. This makes it easy for business users to continue to navigate to them over time.
* You can create multiple content packs from any workspace, but an app has a 1:1 relationship with its workspace. 
* Over time we plan to deprecate organizational content packs, so we recommend you create apps from now on.  


## Other planned new app workspace features

 Some other new app workspace features are planned, but not there yet, during preview:
- No **Leave workspace** button
- Usage metrics are hidden
- B2B
- How Premium works – you can assign and create them in Prem capacity, but an esoteric workflow doesn’t work.


## Next steps
* [Install and use apps in Power BI](service-install-use-apps.md)
* [Power BI apps for external services](service-connect-to-services.md)
* [Power BI Admin Portal](https://docs.microsoft.com/en-us/power-bi/service-admin-portal)
* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
