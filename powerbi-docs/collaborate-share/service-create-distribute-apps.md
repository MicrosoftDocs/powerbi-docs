---
title: Publish an app in Power BI
description: Learn how to publish the new apps, which are collections of dashboards and reports with built-in navigation.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: Publish an app in Power BI
ms.topic: how-to
ms.custom: contperf-fy21q3
ms.date: 05/02/2023

LocalizationGroup: Share your work
---
# Publish an app in Power BI

In Power BI, you can create official packaged content, then distribute it to a broad audience as an *app*. You [create apps in *workspaces*](service-create-the-new-workspaces.md), where you can collaborate on Power BI content with your colleagues. Then you can publish the finished app to large groups of people in your organization. The [app consumer view](#app-consumer-view) section of this article outlines the app consumer experience in the Power BI service and in the Power BI mobile apps.

:::image type="content" source="media/service-create-distribute-apps/power-bi-apps.png" alt-text="Screenshot of Power Bi Apps":::

Here are the steps to publishing an app in power BI:

- [Create the app](#create-and-publish-your-app)
- [Add content to the app](#add-content-to-the-app)
- [Create and manage multiple audiences](#create-and-manage-multiple-audiences)
- [Publish the app](#publish-the-app)

Your business users often need multiple Power BI dashboards, reports, and other content to run their business. With Power BI apps, you can create collections of content and publish these collections as apps, to your whole organization or to specific people or groups. You can create multiple *audiences* for your app, and show or hide different content to each audience. For you as a report creator or admin, apps and audiences make managing permissions on these collections easier.

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
   
    :::image type="content" source="media/service-create-distribute-apps/create-app-button.png" alt-text="Screenshot of the Create app button.":::

1. On **Setup**, give it a name and add a description to help people find the app. You can also set a theme color, add a link to a support site, and specify contact information.
   
    :::image type="content" source="media/service-create-distribute-apps/setup-page.png" alt-text="Screenshot of Setup for your app.":::

1. Select **Next: Add content**.

### Add content to the app

On the **Content** tab, you add the content from the workspace to the app. 

1. Select **Add content** on the **Content** tab.
 
    :::image type="content" source="media/service-create-distribute-apps/content-tab.png" alt-text="Screenshot of add content button.":::

1. Select the contents that you want to add from the current workspace.

    :::image type="content" source="media/service-create-distribute-apps/pop-up-add-content.png" alt-text="Screenshot of pop-up window showing a list of content.":::

    > [!NOTE]
    > When you publish an app, it includes all app content by default for each audience group. However, when you update an app, newly added content isn't included by default.

1. You can also add links to other websites. Select **Add a link** from the drop-down menu next to **Add content**.

     :::image type="content" source="media/service-create-distribute-apps/add-new-section.png" alt-text="Screenshot of Add link button.":::

    After you've added the content, you can change the order of the content:

    - Drag the content up or down in the list.
    
    :::image type="content" source="media/service-create-distribute-apps/drag-drop-content.png" alt-text="Screenshot of Drag & Drop content.":::
    
    - Select the **Move up** or **Move down** options next to each item.
    
    :::image type="content" source="media/service-create-distribute-apps/moveup-move-down-content.png" alt-text="Screenshot of Move up or Move down content.":::

1. Select **Next: Add audience**.

### Create and manage multiple audiences

On the **Audience** tab, you create and manage audience groups within the app.

1. To create an audience, select **New Audience**.

1. Double-click the default audience label to change the audience name.
    
1. Select the hide/show icon next to each item in the workspace to determine the content that this app audience can see.

    
    >[!IMPORTANT]
    >Hiding content from the audience will make it unavailable in the published app.
    >
    >Dashboard tiles pointing at reports that are hidden from the audience will no longer work, instead they will display an error: “The report shown in this tile doesn’t exist or you don’t have permission to view it.”.
    >
    >Paginated reports with subreport will not display the content of the subreport if it is hidden from the audience.
    >
    >To address such issues, make sure that all the dependent reports are available for the audience.
     
1. In the **Manage audience access** pane, specify groups or users to add to the current audience group. 

    :::image type="content" source="media/service-create-distribute-apps/audience-tab.png" alt-text="Screenshot of Manage audience access tab.":::
    
    >[!IMPORTANT]
    >If your app relies on datasets from other workspaces, make sure that all app users have access to the underlying datasets.
    >
    >If the app or report is in the same workspace as the dataset, make sure you add the report associated with the dataset to the app as well.
     
1. For each audience group, grant access to either all people in your organization or specific users or groups. You can also expand the **Advanced** option to configure the following settings per audience group: 

    **Allow users to share the datasets in this app**: This option gives app consumers permission to share the underlying datasets of the app audience.
    
    **Allow users to build content with the datasets in this app**: This option lets your app consumers create their own reports and dashboards based on the app audience datasets.
    
    :::image type="content" source="media/service-create-distribute-apps/advance-options-manage-audience-access-pane.png" alt-text="Screenshot of Advanced settings in Manage audience access pane.":::

    > [!NOTE]
    > - The advanced settings apply to all the audiences, including the workspace users. They can share the datasets and build content with the datasets in this app as long as they have at least the Contributor role in the workspace. See [Roles in workspaces](service-roles-new-workspaces.md) for more about roles.
    > - Build permissions only apply to datasets _in the same workspace_ as the app. If datasets are in other workspaces, you must explicitly grant build permissions on those datasets, or add the users as at least the Contributor Role in that workspace.

### Allow saving a copy of a report

You can allow app users who have build permissions to save copies of reports to their workspace. Once they save the reports, the app users can customize the reports copies to meet their needs. 

To enable your app users to save a copy, select the **Allow users to make a copy of the reports in the app** checkbox on the **Setup** tab.

:::image type="content" source="media/service-create-distribute-apps/save-copy.png" alt-text="Screenshot of save a copy checkbox in Setup tab.":::
    
When you select that, your app users who have build permissions can save a copy of a report from the app consumer view. You can also grant build permissions to your app users through the app using **Advanced** option under **Manager audience access** pane. 

### Publish the app

Now that you've decided on the audiences and the content for each audience, it's time to publish your app. You can install the app automatically for the recipients, if your Power BI admin has enabled this setting for you in the Power BI Admin Portal. Read more about [automatically installing an app](#automatically-install-apps-for-end-users) in this article.

1. Select **Publish app**. 

   :::image type="content" source="media/service-create-distribute-apps/publish-app-button.png" alt-text="Screenshot of publish app.":::
    
1. After you've successfully published the app, you see a **Successfully published** message that includes a shareable app link. You can copy and share that link with your app consumers. 
   
    :::image type="content" source="media/service-create-distribute-apps/app-successfully-published.png" alt-text="Screenshot of successfully published app.":::

    You can also share the published app by selecting the **Copy link** button at the bottom of the **Setup** page. That creates a shareable app link to share with your app consumers.

    :::image type="content" source="media/service-create-distribute-apps/app-link.png" alt-text="Screenshot showing Copy link option.":::

Your app consumers can also request access to your app by searching for the app from Apps marketplace or AppSource. See the [app consumer view](#app-consumer-view) section of this article for more about the app experience for consumers.

#### Publish the app to your entire organization

You can add your entire organization to any of the app audience groups when you publish your app.

- In **Manage audience access**, select **Entire organization**.

However, this option is disabled in these three scenarios:

- You've selected **Install this app automatically** on the **Setup** tab. We don't allow automatic installation of an app for an entire organization 
- You're a guest user who has been assigned a workspace role. 
- Your admin doesn't allow you to assign an app to your entire organization. You can ask your admin to change this setting in the [Content pack and app tenant settings](../admin/service-admin-portal-content-pack-app.md#publish-content-packs-and-apps-to-the-entire-organization) section of tenant settings in the Admin portal. 

## Manage app access requests

After you publish an app, you can manage app permission.

- In the **Apps** list page, select **More options** (...) next to an app, then select **Manage permissions**.
 
    :::image type="content" source="media/service-create-distribute-apps/installed-apps-list.png" alt-text="Screenshot of manage permissions option.":::

You also see a notification banner in the workspace if there are any pending access requests. Select **View** to access the app permission management page directly. 
 
:::image type="content" source="media/service-create-distribute-apps/pending-access-requests.png" alt-text="Screenshot of access pending notification banner.":::

The Permission management page contains these tabs:

- **Direct access**: Lists all the users who already have access to the app.
- **Pending access**: Lists all pending requests.

  :::image type="content" source="media/service-create-distribute-apps/access-permission-page.png" alt-text="Screenshot of manage permission page.":::

## Change your published app

After you publish your app, you may want to change or update it. 

1. Open the workspace that corresponds to the app. If you're a workspace Admin or Member, you can also open the workspace right from the app, by selecting the **Edit app** pencil.
   
    :::image type="content" source="media/service-create-distribute-apps/edit-pencil-app-consumption-view.png" alt-text="Screenshot of the Open the workspace pencil from the associated app.":::

2. Make any changes you want to the content of your app.
 
    The workspace is your staging area, so your changes aren't live in the app until you publish again. This lets you make changes without affecting the published apps.  
 
    > [!IMPORTANT]
    > If you remove a report and update the app, even if you add the report back to the app, your app consumers lose all customizations they've made, such as bookmarks, comments, and so on.  
 
3. Select **Update app** in the Workspace content view.

     :::image type="content" source="media/service-create-distribute-apps/update-app-button.png" alt-text="Screenshot of update app from the associated workspace.":::
    
4. Update **Setup**, **Content**, and **Audience**, if you need to, then select **Update app**.

    The people you've published the app to automatically see the updated version of the app.
    
    > [!Note]
    > If you removed app permissions as part of the update, new app installers won't get those permissions. However, **the update won't remove the permissions from users who already have them.** To remove such existing access, go to the Direct access tab on the datasets manage permissions page and remove the permissions manually. 

## Automatically install apps for end users
If an admin gives you permission, you can install apps automatically, pushing them to app consumers. This push functionality makes it easier to distribute the right apps to the right people or groups. Your app appears automatically in your end users' Apps content list. They don't have to find it from the Apps marketplace or Microsoft AppSource or follow an installation link. See how admins enable [pushing apps to end users](../admin/service-admin-portal-content-pack-app.md#push-apps-to-end-users) in the Power BI admin portal article.

### How to push an app automatically to end users
Once the admin has assigned permissions to you, you have a new option to **install the app automatically**. When you check the box and select **Publish app** (or **Update app**), the app is pushed to all audience groups defined in the **Audience** tab of the app.

:::image type="content" source="media/service-create-distribute-apps/install-app-automatically.png" alt-text="Screenshot shows Power B I Publish app option with Install app automatically selected.":::

### How users get the apps that you push to them
After you push an app, it shows up in their Apps list automatically. In this way, you can curate the apps that specific users or job roles in your organization need to have at their fingertips.

:::image type="content" source="media/service-create-distribute-apps/get-app.png" alt-text="Screenshot shows Power B I apps with your published app included.":::

### Considerations for automatically installing apps
Keep these things in mind when pushing apps to end users:

* You can't automatically install an app for an entire organization. You notice that when you select the checkbox for **install app automatically**, the option for **entire organization** becomes inactive.

* Installing an app automatically to users can take time. Most apps install immediately for users, but pushing apps can take time.  It depends on the number of items in the app and the number of people given access. We recommend pushing apps during off hours with plenty of time before users need them. Verify with several users before sending broad communication about the apps' availability.

* If users don't immediately see the app in the **Apps** list, they should refresh or close and reopen their browser.

* Try not to overwhelm users. Be careful not to push too many apps, so your users perceive the pre-installed apps are useful to them. It's best to control who can push apps to end users to coordinate timing. Establish a point of contact for getting apps in your organization pushed to end users.

* Guest users who haven't accepted an invite don't get apps automatically installed for them.  

## App consumer view
App consumers in the Power BI service and in the Power BI mobile apps only see the content based on the access permissions for their respective audience groups. Consumers who have access to multiple audience groups see group tabs on the top bar to switch between different audience views easily. For example, if the user is part of both product team and sales team groups, they will see three view tabs, as shown in the following image. By default, consumers see the All tab view, which is a consolidated view showing all content that they have access to. App consumers can browse different audience group tabs to see the content for each group. 

**The consolidated *All* view**
:::image type="content" source="media/service-create-distribute-apps/audience-all-view.png" alt-text="Screenshot showing All view for app consumers.":::

**Audience group one, *Product Team***
:::image type="content" source="media/service-create-distribute-apps/audience-product-team-view.png" alt-text="Screenshot showing Product team view for app consumers.":::

**Audience group two, *Sales Team***
:::image type="content" source="media/service-create-distribute-apps/audience-sales-team-view.png" alt-text="Screenshot showing Sales team view for app consumers.":::

Read more about how [app consumers experience apps](../consumer/end-user-app-view.md).

## Unpublish an app
Any Admin or Member of a workspace can unpublish the app.

* In a workspace, select  **More options (...)** > **Unpublish app**.
  
  :::image type="content" source="media/service-create-distribute-apps/unpublish-app.png" alt-text="Screenshot of Select the Unpublish app button.":::

This action uninstalls the app for everyone you've published it to, and they no longer have access to it. This action doesn't delete the workspace or its contents.

>[!IMPORTANT]
>When you unpublish an app, app consumers lose their customizations, even if you republish the app later. They lose any personal bookmarks, comments, and so on associated with content in the app. Only unpublish an app if you need to remove it.
> 

## Considerations and limitations
Things to keep in mind about publishing apps:

* AppSource is an external service that only has public-facing service apps. For organizational apps, users can just go to Apps marketplace to find them. Template apps are also available from Apps marketplace.
* You can create up to ten audience groups per app.
* We have temporarily relaxed the access list limit from 100 users or groups per audience group for the app. However, please note that this is temporary, and we might change the limit in the near future. We still recommend you use one or more user groups that contain all the desired users.
* If the user you added to the app access list already has access to the app through the workspace, they're not shown in the access list for the app.  
* You can either pin an entire report page to a dashboard using Live pin or pin a single visual as a tile from a report to the dashboard. 
* When you select a visual pinned as a tile in a dashboard in a published app, you're directed to the underlying report in the app. If the app creator chose not to include a report that has a related dashboard in the app, you're not directed to the underlying report when you select the related tile.
* In order to see an entire report page pinned as a live pin to a dashboard or a drill-down report to work, the app creators have to include the report in the app audience. 
* The support site URL is shown in the item information card.
* By default, all the newly added content, to an already published app, is marked as invisible. You must go to each audience group and manually unhide it.
* Having multiple audiences isn't fully supported in deployment pipelines. Content visibility of new content that you add to an org app must still be managed manually via audience management.
* You can't open an added link or see its content if you chose to open the link in the content area.
* Apps can have a maximum of 200 dashboards.
* If you include a report that uses chained datasets, also known as [DirectQuery for Power BI datasets and Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md), in an organizational app, when you add a user to an organizational app audience, make sure to give permissions to all the datasets in the chain. 

## Next steps

* [Create apps in *workspaces*](service-create-the-new-workspaces.md)
* [Install and use apps in Power BI](../consumer/end-user-apps.md)
* [Power BI apps for external services](../connect-data/service-connect-to-services.md)
* [Power BI Admin Portal](../admin/service-admin-portal.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
