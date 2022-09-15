---
title: Publish an app in Power BI
description: Learn how to publish the new apps, which are collections of dashboards and reports with built-in navigation.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.custom: contperf-fy21q3
ms.date: 09/14/2022

LocalizationGroup: Share your work
---
# Publish an app in Power BI

In Power BI, you can create official packaged content, then distribute it to a broad audience as an *app*. You [create apps in *workspaces*](service-create-the-new-workspaces.md), where you can collaborate on Power BI content with your colleagues. Then you can publish the finished app to large groups of people in your organization. The [app consumer view](#app-consumer-view) section of this article outlines the app consumer experience.

![Screenshot of Power BI apps.](media/service-create-distribute-apps/power-bi-new-apps.png)

Your business users often need multiple Power BI dashboards, reports, and other content to run their business. With Power BI apps, you can create collections of content, and publish these collections as apps to your whole organization or to specific people or groups. You can create multiple *audiences* for your app, and show or hide different content to each audience. For you as a report creator or admin, apps and audiences make managing permissions on these collections easier.

Business users get your apps in a few different ways:

- They can find and install apps from Apps marketplace or AppSource.
- You can send them a direct link.
- You can install it automatically in your coworkers' Power BI accounts if your Power BI administrator gives you permission.
- If you distribute your app to external users, those users receive an email with a direct link. Power BI doesn't send any email to internal users when you distribute or update an app.

Your app consumers can't modify the contents of the app. They can interact with it either in the Power BI service, or one of the mobile apps: filtering, highlighting, and sorting the data. You can also give them permission to share datasets and create their own content in the app. 

## Licenses for apps
To create or update an app, you need a Power BI Pro or Premium Per User (PPU) license. For app *consumers*, there are two options.

* **The workspace for this app is *not* in a Power BI Premium capacity**: All business users need Power BI Pro or Premium Per User (PPU) licenses to view your app. 
* **The workspace for this app *is* in a Power BI Premium capacity**: Business users without Power BI Pro or Premium Per User (PPU) licenses in your organization can view app content. However, they can't copy the reports, or create reports based on the underlying datasets. Read [What is Power BI Premium?](../enterprise/service-premium-what-is.md) for details.

## Create and publish your app
When the content in your workspace is ready, you can start the publishing process. You decide how many different audience groups you need. Then you choose which content you want to publish to each audience. You can create up to ten audience groups in one app. 

1. In the workspace list view, select **Create app** to start the process of creating and publishing an app from the workspace.
   
    ![Screenshot of the Create app button.](media/service-create-distribute-apps/power-bi-apps-publish-button.png)

1. On **Setup**, give it a name and add a description to help people find the app. You can also set a theme color, add a link to a support site, and specify contact information.
   
    ![Screenshot of Setup for your app.](media/service-create-distribute-apps/power-bi-apps-build-your-apps.png)

1. Select **Next: Add content**.

### Add content to the app

On the **Content** tab, you add the content from the workspace to the app. 

1. Select **Add content** on the **Content** tab, and select the contents that you want to add from the current workspace.
 
    Screenshot of add content button.
     
    Screenshot of pop-up window showing a list of content.

    > [!NOTE]
    > When you publish an app, it includes all app content by default for each audience group. However, when you update an app, newly added content isn't included by default.

1. You can also add links to other websites. Select **Add a link** from the drop-down menu next to **Add content**.

    ![Screenshot of Add link button.](media/service-create-distribute-apps/power-bi-apps-navigation.png)

    After you've added the content, you can change the order of the content:

    - Drag the content up or down in the list.
    - Select the **Move up** or **Move down** options next to each item.

1. Select **Next: Add audience**.

### Create and manage audiences

On the **Audience** tab, you create and manage audience groups within the app.

1. To create an audience, select **New Audience**.

1. Double-click the default audience label to change the audience name.
    
1. Select the hide/show icon next to each item in the workspace to determine the content that this app audience can see.

1. In the **Manage audience access** pane, specify groups or users to add to the current audience group. 

    Screenshot of Manage audience access tab.
    
    >[!IMPORTANT]
    >If your app relies on datasets from other workspaces, make sure that all app users have access to the underlying datasets.
    >
    >If the app or report is in the same workspace as the dataset, make sure you add the report associated with the dataset to the app as well.
     
1. For each audience group, grant access to either all people in your organization or specific users or groups. You can also expand the **Advanced** option to configure the following settings per audience group: 

    **Allow users to share the datasets in this app**: This option gives app consumers permission to share the app and underlying datasets of the app audience.
    
    **Allow users to build content with the datasets in this app**: This option lets your app consumers create their own reports and dashboards based on the app audience datasets.
    
    :::image type="content" source="media/service-create-distribute-apps/advance-options-manage-audience-access-pane.png" alt-text="Screenshot of Advanced settings in Manage audience access pane.":::

    > [!NOTE]
    > The advanced settings apply to all the audiences, but not to members of the workspace. They can share the datasets and build content with the datasets in this app as long as they have at least the Contributor role in the workspace. See [Roles in workspaces](service-roles-new-workspaces.md) for more about roles.

### Publish the app

Now that you've decided on the audiences and the content for each audience, it's time to publish your app. You can install the app automatically for the recipients, if your Power BI admin has enabled this setting for you in the Power BI Admin Portal. Read more about [automatically installing an app](#automatically-install-apps-for-end-users) in this article.

1. Select **Publish app**. 

    Screenshot of publish app.
    
1. After you've successfully published the app, you see a **Successfully published** message that includes a shareable app link. You can copy and share that link with your app consumers. 
   
    ![Screenshot of successfully published app.](media/service-create-distribute-apps/power-bi-apps-success.png)

    You can also share the published app by selecting the **Copy link** button at the bottom of the **Setup** page. That creates a shareable app link to share with your app consumers.
    
Your app consumers can also request access to your app by searching for the app from Apps marketplace or AppSource. See the [app consumer view](#app-consumer-view) section of this article for more about the app experience for consumers.

## Manage app access requests

After you publish an app, you can manage app permission.

- In the **Apps** list page, select **More options** (...) next to an app, then select **Manage permissions**.
 
    Screenshot of manage permissions option.

You also see a notification banner in the workspace if there are any pending access requests. Select **View** to access the app permission management page directly. 
 
Screenshot of access pending notification banner.

The Permission management page contains these tabs:

- **Direct access**: Lists all the users who already have access to the app.
- **Pending access**: Lists all pending requests.

    Screenshot of manage permission page.
 
## Change your published app

After you publish your app, you may want to change or update it. 

1. Open the workspace that corresponds to the app. If you're a workspace Admin or Member, you can also open the workspace right from the app, by selecting the **Edit app** pencil.
   
    ![Screenshot of the Open the workspace pencil from the associated app.](media/service-create-distribute-apps/power-bi-apps-open-workspace.png)

2. Make any changes you want to the content of your app.
 
    The workspace is your staging area, so your changes aren't live in the app until you publish again. This lets you make changes without affecting the published apps.  
 
    > [!IMPORTANT]
    > If you remove a report and update the app, even if you add the report back to the app, your app consumers lose all customizations they've made, such as bookmarks, comments, and so on.  
 
3. Select **Update app** in the Workspace content view.

    Screenshot of update app from the associated workspace.
    
4. Update **Setup**, **Content**, and **Audience**, if you need to, then select **Update app**.

    The people you've published the app to automatically see the updated version of the app.

## Automatically install apps for end users
If an admin gives you permission, you can install apps automatically, pushing them to app consumers. This push functionality makes it easier to distribute the right apps to the right people or groups. Your app appears automatically in your end users' Apps content list. They don't have to find it from the Apps marketplace or Microsoft AppSource or follow an installation link. See how admins enable [pushing apps to end users](../admin/service-admin-portal-content-pack-app.md#push-apps-to-end-users) in the Power BI admin portal article.

### How to push an app automatically to end users
Once the admin has assigned you permissions, you have a new option to **install the app automatically**. When you check the box and select **Publish app** (or **Update app**), the app is pushed to all audience groups defined in the **Audience** tab of the app.

![Screenshot shows Power B I Publish app option with Install app automatically selected.](media/service-create-distribute-apps/power-bi-apps-access.png)

### How users get the apps that you push to them
After you push an app, it shows up in their Apps list automatically. In this way, you can curate the apps that specific users or job roles in your organization need to have at their fingertips.

![Screenshot shows Power B I apps with your published app included.](media/service-create-distribute-apps/power-bi-apps-left-nav.png)

### Considerations for automatically installing apps
Keep these things in mind when pushing apps to end users:

* You can't automatically install an app for an entire organization. You notice that when you select the checkbox for **install app automatically**, the option for **entire organization** becomes inactive.

* Installing an app automatically to users can take time. Most apps install immediately for users, but pushing apps can take time.  It depends on the number of items in the app and the number of people given access. We recommend pushing apps during off hours with plenty of time before users need them. Verify with several users before sending broad communication about the apps' availability.

* If users don't immediately see the app in the **Apps** list, they should refresh or close and reopen their browser.

* Try not to overwhelm users. Be careful not to push too many apps, so your users perceive the pre-installed apps are useful to them. It's best to control who can push apps to end users to coordinate timing. Establish a point of contact for getting apps in your organization pushed to end users.

* Guest users who haven't accepted an invite don't get apps automatically installed for them.  

## App consumer view
App consumers can only see the content based on the access permissions for their respective audience groups. Consumers who have access to multiple audience groups see group tabs on the top bar to switch between different audience views easily, as shown in the following image. By default, consumers see the All tab view, which is a consolidated view showing all content that they have access to. App consumers can browse different audience group tabs to see the content for each group. 

Screenshot showing All view for app consumers.

Read more about how [app consumers experience apps](../consumer/end-user-app-view.md).

## Unpublish an app
Any Admin or Member of a workspace can unpublish the app.

* In a workspace, select  **More options (...)** > **Unpublish app**.
  
    ![Screenshot of Select the Unpublish app button.](media/service-create-distribute-apps/power-bi-app-unpublish.png)

This action uninstalls the app for everyone you've published it to, and they no longer have access to it. This action doesn't delete the workspace or its contents.

>[!IMPORTANT]
>When you unpublish an app, app consumers lose their customizations, even if you republish the app later. They lose any personal bookmarks, comments, and so on associated with content in the app. Only unpublish an app if you need to remove it.
> 

## Considerations and limitations
Things to keep in mind about publishing apps:

* AppSource is an external service that only has public-facing service apps. For organizational apps, users can just go to Apps marketplace to find them. Template apps are also available from Apps marketplace.
* You can create up to ten audience groups per app.
* We have temporarily relaxed the access list limit from 100 to 1000 users or groups per audience group for the app. However, please note that this is temporary, and we might change the limit in the near future. We still recommend you use one or more user groups that contain all the desired users.
* If the user you added to the app access list already has access to the app through the workspace, they're not shown in the access list for the app.  
* When you select a tile in a dashboard in a published app, you're directed to the underlying report in the app. If the app creator chose not to include a report that has a related dashboard in the app, you're not directed to the underlying report when you select the related tile.
* The support site URL is shown in the item information card.
* By default, all the newly added content, to an already published app, is marked as invisible. You must go to each audience group and manually unhide it.
* As of now we have disabled “Save a copy” feature. We are working on providing a better offering. 
* Currently, Workspace Contributors can add/delete a content in the app, but they cannot change the visibility of the content. As a Workaround, Workspace Admins/members can update the visibility of the content added. This is a temporary limitation, and we will soon allow contributors to change the visibility of the content in the Audience tab. 
* Apps can have a maximum of 200 dashboards. 

## Next steps

* [Create apps in *workspaces*](service-create-the-new-workspaces.md)
* [Install and use apps in Power BI](../consumer/end-user-apps.md)
* [Power BI apps for external services](../connect-data/service-connect-to-services.md)
* [Power BI Admin Portal](../admin/service-admin-portal.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
