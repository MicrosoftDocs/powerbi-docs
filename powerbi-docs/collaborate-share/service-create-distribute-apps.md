---
title: Publish an app in Power BI
description: Learn how to publish apps, which are collections of dashboards and reports with built-in navigation.
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: Publish an app in Power BI
ms.topic: how-to
ms.date: 01/30/2025

LocalizationGroup: Share your work
---

# Publish an app in Power BI

In Power BI, you can create official packaged content then distribute it to a broad audience as an *app*. You [create apps in *workspaces*](service-create-the-new-workspaces.md), where you can collaborate on Power BI content with your colleagues. The finished app can be published to large groups of people in your organization. The [app user view](#app-user-view) section of this article outlines the app user's experience in the Power BI service and in the Power BI mobile apps.

:::image type="content" source="media/service-create-distribute-apps/power-bi-apps.png" alt-text="Screenshot of Power BI Apps." lightbox="media/service-create-distribute-apps/power-bi-apps.png":::

Here are the steps to publishing an app in Power BI:

- [Create the app](#create-and-publish-your-app)
- [Add content to the app](#add-content-to-the-app)
- [Create and manage multiple audiences](#create-and-manage-multiple-audiences)
- [Publish the app](#publish-the-app)

Business users often need access to multiple Power BI dashboards, reports, and other content to get data insights. With Power BI apps, you can create collections of content and publish these collections as apps. These apps can be available to your whole organization or only to specific people or groups. You can create multiple *audiences* for your app, and show or hide different content to each audience. Apps and audiences helps make managing permissions on these collections easier for report creators and admins.

Business users get your apps in a few different ways:

- They can find and install apps from Apps marketplace or AppSource.
- You can send them a direct link.
- If your Fabric admin has given you permissions, you can install the app automatically in users' Power BI accounts.
- If you distribute your app to external users, those users receive an email with a direct link. Power BI doesn't send any email to internal users when you distribute or update an app.

App users can't modify the contents of the app. They can interact with apps in the Power BI service or mobile apps and can filter, highlight, and sort the data. App owners can grant permission to other users, allowing them to share semantic models and create their own content in the app. 

## Licenses for apps

To create or update an app, you need a Power BI Pro or Premium Per User (PPU) license. For app *users*, there are two options.

- **If the workspace for this app is *not* in a Power BI Premium capacity**: All business users need Power BI Pro or Premium Per User (PPU) licenses to view your app.
- **If the workspace for this app *is* in a Power BI Premium capacity/F64 or higher Fabric capacity**: Business users without Power BI Pro or Premium Per User (PPU) licenses in your organization can view app content. However, users can't copy the reports, or create reports based on the underlying semantic models. Read these articles for details:

  - [What is Power BI Premium?](../enterprise/service-premium-what-is.md)
  - [Microsoft Fabric concepts and licenses](/fabric/enterprise/licenses)

## Create and publish your app

When the content in your workspace is ready, you can start the publishing process. Determine how many different audience groups you need, then choose which content you want to publish to each audience. You can create up to 25 audience groups in one app. 

### Set up the app

1. In the workspace list view, select **Create app** to start the process of creating and publishing an app from the workspace.

    :::image type="content" source="media/service-create-distribute-apps/create-app-button.png" alt-text="Screenshot of the Create app button.":::

1. On the **Setup** tab, give the app a name and add a description to help people find the app. You can also set a theme color, add a link to a support site, and specify contact information.

    :::image type="content" source="media/service-create-distribute-apps/setup-page.png" alt-text="Screenshot of Setup for your app.":::

1. Select **Next: [Add content](#add-content-to-the-app)**.

#### Allow saving a copy of a report

In the **Setup** tab, decide if you want to allow app users who have build permissions to save copies of reports to their workspace. After they save the reports, app users can customize their report copies to meet their needs. 

1. Expand **Advanced settings** and select **Allow users to make a copy of the reports in this app**.

    :::image type="content" source="media/service-create-distribute-apps/allow-copying-reports.png" alt-text="Screenshot of save a copy checkbox in Setup tab.":::

    This setting allows app users who have build permissions to save a copy of a report from the app user view. You can also grant build permissions to your app users through the app by using the **Advanced** option under the **Manage audience access** pane. 

1. Select **Next: [Add content](#add-content-to-the-app)**.

#### Allow access to hidden content

The **Setup** tab also includes an option to grant users access to hidden content.

> [!CAUTION]
> If users have a direct link to *any* of the content in your app, they can access the hidden content, even if that item is visually hidden in the navigation pane for that audience.

1. Expand **Advanced settings**.

1. Under **Access to hidden content**, toggle the setting to **On**.

    :::image type="content" source="media/service-create-distribute-apps/access-hidden-content.png" alt-text="Screenshot showing turning on Access to hidden content.":::

1. Select **Next: [Add content](#add-content-to-the-app)**.

### Add content to the app

On the **Content** tab, you add the content from the workspace to the app.

1. Select **Add content** on the **Content** tab.
 
    :::image type="content" source="media/service-create-distribute-apps/content-tab.png" alt-text="Screenshot of add content button.":::

1. Select the contents that you want to add from the current workspace.

    :::image type="content" source="media/service-create-distribute-apps/pop-up-add-content.png" alt-text="Screenshot of pop-up window showing a list of content.":::

    > [!NOTE]
    > When you publish an app, it includes all app content by default for each audience group. However, when you update an app, newly added content isn't included by default.

1. You can add links to other websites to the app. Select **Add a link** from the drop-down menu next to **Add content**.

     :::image type="content" source="media/service-create-distribute-apps/add-new-section.png" alt-text="Screenshot of Add link button.":::

    After you add the content, you can change the order of the content:

    - Drag the content up or down in the list.
    
    :::image type="content" source="media/service-create-distribute-apps/drag-drop-content.png" alt-text="Screenshot of Drag & Drop content.":::
    
    - Select the **Move up** or **Move down** options next to each item.
    
    :::image type="content" source="media/service-create-distribute-apps/moveup-move-down-content.png" alt-text="Screenshot of Move up or Move down content.":::

1. Select **Next: Add audience**.

#### Add Power BI reports with paginated report visuals

If you include Power BI reports that have paginated report visuals, we recommend including the referred paginated reports in the app. The published Power BI report will then work with the published version of the paginated report instead of the report stored in the workspace.

During publishing, Power BI can detect reports with visuals that reference missing paginated reports:

:::image type="content" source="media/service-create-distribute-apps/app-successfully-published-with-warning.png" alt-text="Screenshot of successfully published app with warning.":::

You can address the issue in one of two ways:

- Include the paginated report in the app and make sure the audience that has access to the Power BI report also has access to the paginated report.

- Make sure the audience has access to the paginated report in the workspace.

### Create and manage multiple audiences

On the **Audience** tab, you create and manage audience groups within the app.

1. To create an audience, select **New Audience**.

1. Select the default audience label to change the audience name.
    
1. Select the hide/show icon next to each item in the workspace to determine the content that this app audience can see.

    
    >[!IMPORTANT]
    >
    >- Hiding content from the audience makes it unavailable in the published app for that audience. However, if you select [Allow access to hidden content](#allow-access-to-hidden-content), a user with a direct link to *any* of the content in the app can access the hidden content, even if that item is visually hidden in the navigation pane for that audience.
    >- Dashboard tiles pointing to reports that aren't added to the app, or are added but hidden from the audience, won't work. These dashboard tiles display an error: "The report shown in this tile doesn’t exist or you don’t have permission to view it."
    >- If you only add dashboards with report tiles to your app, the app doesn't display anything to your audience. Be sure to add the reports related to added dashboards and make them visible to the audience or select **Allow access to hidden content**.
    >- Paginated reports with subreports don't display the content of the subreport if it's hidden from the audience.
    >- Users of drillthrough reports can't navigate to the destination reports if the destination reports are hidden.
    >
    >To address these issues, make sure that all the dependent reports are added to the app and visible for the audience. If they're hidden from the audience, select **Allow access to hidden content**.
     
1. In the **Manage audience access** pane, specify groups or users to add to the current audience group. 

    :::image type="content" source="media/service-create-distribute-apps/audience-tab.png" alt-text="Screenshot of Manage audience access tab.":::
    
    >[!IMPORTANT]
    >
    >- If your app relies on semantic models from other workspaces, make sure that all app users have access to the underlying semantic models.
    >- If the app or report is in the same workspace as the semantic model, make sure you add the report associated with the semantic model to the app as well.
     
1. For each audience group, grant access to either everyone in your organization or only to specific users or groups. You can also expand the **Advanced** option to configure the following settings per audience group: 

    **Allow users to share the semantic models in this app**: This option gives app users permission to share the underlying semantic models of the app audience.
    
    **Allow users to build content with the semantic models in this app**: This option lets your app users create their own reports and dashboards based on the app audience semantic models.
    
    :::image type="content" source="media/service-create-distribute-apps/advance-options-manage-audience-access-pane.png" alt-text="Screenshot of Advanced settings in Manage audience access pane.":::

    > [!NOTE]
    > - The advanced settings apply to all the audiences, including the workspace users. They can share the semantic models and build content with the semantic models in this app as long as they have at least a Viewer role in the workspace. See [Roles in workspaces](service-roles-new-workspaces.md) for more about roles.
    > - Build permissions only apply to semantic models _in the same workspace_ as the app. If semantic models are in other workspaces, you must explicitly grant build permissions on those semantic models, or at least add the users to the Viewer role in the other workspace.

### Publish the app

After you set up the audiences and the content for each audience, you're ready to publish your app. You can install the app automatically for users if your Fabric admin has enabled this setting for you in the Fabric Admin Portal. Read more about [automatically installing an app](#automatically-install-apps-for-end-users) in this article.

1. Select **Publish app**. 

   :::image type="content" source="media/service-create-distribute-apps/publish-app-button.png" alt-text="Screenshot of publish app.":::
    
1. After you successfully publish the app, you see a **Successfully published** message that includes a shareable app link. You can copy and share that link with your app users. 
   
    :::image type="content" source="media/service-create-distribute-apps/app-successfully-published.png" alt-text="Screenshot of successfully published app.":::

    You can also share the published app by selecting the **Copy link** button at the bottom of the **Setup** page. That creates a shareable app link to share with your app consumers.

    :::image type="content" source="media/service-create-distribute-apps/app-link.png" alt-text="Screenshot showing Copy link option.":::

App users can also request access to your app by searching for the app from Apps marketplace or AppSource. See the [app user view](#app-user-view) section of this article for more about the app experience for end users.

#### Publish the app to your entire organization

You can add your entire organization to any of the app audience groups when you publish your app.

- In **Manage audience access**, select **Entire organization**.

However, the option to add the entire organization is disabled in these three scenarios:

- You've selected **Install this app automatically** on the **Setup** tab. Automatic installation of an app for an entire organization isn't allowed.
- You're a guest user who has been assigned a workspace role. 
- Your admin doesn't allow you to assign an app to your entire organization. You can ask your admin to change this setting in the [App tenant settings](/fabric/admin/service-admin-portal-app#publish-apps-to-the-entire-organization) section of tenant settings in the Admin portal. 

## Change the settings for users who don't have access

You can control what users see when they attempt to view an app but they don't have access. The default setting triggers the access request flow. Users see that they're denied access and can submit a request for access. 

By default, access requests to come to you in email. See the section in this article for more on [managing access requests](/power-bi/collaborate-share/service-create-distribute-apps?source=recommendations).

You can also display a custom message to users when access to an app is denied. 

### Customize the access request behavior

Some organizations have processes and systems outside of Power BI for reviewing and managing access requests. The custom message setting lets you explain or provide a link to how a user can get access to the Power BI app. You can change the default access request behavior for a Power BI app by going to the Power BI app settings and configuring the **Access requests** options as desired. Select **Replace with automated custom message**.

:::image type="content" source="media/service-create-distribute-apps/custom-message-blank.png" alt-text="Screenshot of a blank custom message.":::

You can create your own custom message and include a link for users to request access. This option lets you provide instructions about how a user can get access to your Power BI app, rather than receiving requests via email. You might choose this option, for example, if your organization uses an automated system for handling access requests. When users who don't have access to your Power BI app try to view it, they see a message with the instructions you provide. 

:::image type="content" source="media/service-create-distribute-apps/create-access-request-form.png" alt-text="Screenshot of a draft custom message.":::

The **Custom message** text area in the **Access requests** example shows sample instructions. Instructions can be rich text with formatting and links. The following example shows the message users see when they try to view a Power BI app they don’t have access to. 

:::image type="content" source="media/service-create-distribute-apps/request-access-instructions.png" alt-text="Screenshot of the message your users see.":::

> [!NOTE]
> Custom messages aren't supported in Power BI mobile apps for iOS and Android. If you choose to show a custom message to users who don't have access to your Power BI app, users on mobile still see the default access request flow. 

## Manage app access requests

After you publish an app, you can manage app permissions.

- In the **Apps** list page, select **More options** (...) next to an app, then select **Manage permissions**.
 
    :::image type="content" source="media/service-create-distribute-apps/installed-apps-list.png" alt-text="Screenshot of manage permissions option.":::

A notification banner in the workspace displays if there are any pending access requests. Select **View** to access the app permission management page directly. 
 
:::image type="content" source="media/service-create-distribute-apps/pending-access-requests.png" alt-text="Screenshot of access pending notification banner.":::

The Permission management page contains these tabs:

- **Direct access**: Lists all the users who already have access to the app.
- **Pending access**: Lists all pending requests.

  :::image type="content" source="media/service-create-distribute-apps/access-permissions-page.png" alt-text="Screenshot of manage permission page.":::

## Change your published app

Follow these steps to modify a published app. 

1. Open the workspace that corresponds to the app. If you're a workspace Admin or Member, you can also open the workspace from the app, by selecting the **Edit app** pencil.
   
    :::image type="content" source="media/service-create-distribute-apps/edit-pencil-app-consumption-view.png" alt-text="Screenshot of the Open the workspace pencil from the associated app.":::

2. Make changes to the content of your app.
 
    The workspace is your staging area, so your changes aren't live in the app until you publish again. This lets you make changes without affecting the published apps.  
 
    > [!IMPORTANT]
    > If you remove a report and update the app, app users lose all customizations they've made, such as bookmarks, comments, and so on. These customizations can't be restored, even if you add the report back to the app.
 
3. Select **Update app** in the Workspace content view.

     :::image type="content" source="media/service-create-distribute-apps/update-app-button.png" alt-text="Screenshot of update app from the associated workspace.":::
    
4. Update **Setup**, **Content**, and **Audience**, if you need to, then select **Update app**.

    The people you've published the app to automatically see the updated version of the app.
    
    > [!Note]
    > If you removed app permissions as part of the update, new app installers won't get those permissions. However, **the update won't remove the permissions from users who already have them.** To remove such existing access, go to the Direct access tab on the semantic model's manage permissions page and remove the permissions manually. 

## Copy a link to a specific item in an app

### Prerequisite to copying a link

Before you can copy a link to an item in an app, you have to publish the app. The **Copy link** in the Content tab for the item doesn't appear until the app is published.

### Items you can copy a link to

You can copy a link to these items in an app:

- A Power BI report
- A paginated report
- A dashboard
- A scorecard

You can't copy a link to an Excel workbook in an app.

### Copy the link

1. In the app, select **More options (...)** next to the item that you want to copy the link to.

1. Select **Copy link**.

    :::image type="content" source="../collaborate-share/media/service-create-distribute-apps/copy-link-app.png" alt-text="Screenshot showing the Copy link option on the More options list.":::

1. In the **App link** dialog box, select **Copy** and then **Close** or **Go to app**.

    :::image type="content" source="media/service-create-distribute-apps/consumer-app-link-copy.png" alt-text="Screenshot showing Copy the app link and Close.":::

## Automatically install apps for end users

If an admin gives you permission, you can install apps automatically when you publish them, and push the apps to users. This push functionality makes it easier to distribute the right apps to the right people or groups. Your app appears automatically in your end users' Apps content list. They don't have to search for it from the Apps marketplace or Microsoft AppSource or follow an installation link. See how admins enable [publishing apps to end users](/fabric/admin/service-admin-portal-app#push-apps-to-end-users) in the Fabric admin portal article.

### How to publish an app automatically to end users

After the admin has assigned permissions to you, you have a new option to **install the app automatically**. When you check the box and select **Publish app** (or **Update app**), the app is published to all audience groups defined in the **Audience** tab of the app.

:::image type="content" source="media/service-create-distribute-apps/install-app-automatically.png" alt-text="Screenshot shows Power B I Publish app option with Install app automatically selected.":::

### How users get published apps

After you publish an app to your users, it shows up in their Apps list automatically. This lets you identify the apps that specific users or job roles in your organization need to have available.

:::image type="content" source="media/service-create-distribute-apps/get-app.png" alt-text="Screenshot shows Power B I apps with your published app included.":::

### Considerations for automatically installing apps

Keep these things in mind when publishing apps and pushing them automatically to end users:

- You can't automatically install an app for an entire organization. If you select the checkbox for **install app automatically**, the option for **entire organization** becomes inactive.

- Installing an app automatically to users can take time. Most apps install immediately for users, but publishing apps can take time, depending on the number of items in the app and the number of people given access. We recommend publishing apps during off hours with plenty of time before users need them. Verify with several users before sending broad communication about app availability.

- If users don't immediately see the app in the **Apps** list, they should refresh or close and reopen their browser.

- Try not to overwhelm users. Be careful not to publish too many apps to your users, so they perceive the pre-installed apps are useful to them. It's best to control who can publish apps to end users to coordinate timing. Establish a point of contact for getting apps in your organization published to end users.

- Guest users who haven't accepted an invite don't get apps automatically installed for them.  

## App user view
App users in the Power BI service and in the Power BI mobile apps only see the content based on the access permissions for their respective audience groups. Users who have access to multiple audience groups see group tabs on the top bar to switch between different audience views easily. For example, if the user is part of both product team and sales team groups, they see three view tabs, as shown in the following image. By default, users see the All tab view, which is a consolidated view showing all content that they have access to. App users can browse different audience group tabs to see the content for each group. 

**The consolidated *All* view**
:::image type="content" source="media/service-create-distribute-apps/audience-all-view.png" alt-text="Screenshot showing All view for app consumers.":::

**Audience group one, *Product Team***
:::image type="content" source="media/service-create-distribute-apps/audience-product-team-view.png" alt-text="Screenshot showing Product team view for app consumers.":::

**Audience group two, *Sales Team***
:::image type="content" source="media/service-create-distribute-apps/audience-sales-team-view.png" alt-text="Screenshot showing Sales team view for app consumers.":::

Read more about how [app users experience apps](../consumer/end-user-app-view.md).

## Unpublish an app
Any Admin or Member of a workspace can unpublish the app.

- In a workspace, select  **More options (...)** > **Unpublish app**.
  
  :::image type="content" source="media/service-create-distribute-apps/unpublish-app.png" alt-text="Screenshot of Select the Unpublish app button.":::

This action uninstalls the app for everyone you've published it to, and they no longer have access to it. This action doesn't delete the workspace or its contents.

>[!IMPORTANT]
>When you unpublish an app, users lose their customizations, even if you republish the app later. They lose any personal bookmarks, comments, and so on associated with content in the app. Only unpublish an app if you need to remove it.
> 

## Considerations and limitations
To maintain app reliability and performance here are some app, audience group, and access limits to consider:
- You can create one app per workspace.
- App publish and update operations have a timeout of 1 minute. If your app is running into timeout error during update, consider reducing the number of items included in the app.
- In some cases, the Power BI Support team may need to block updates for large apps. Before blocking app updates, the Power BI Support team sends a message to  admins using Microsoft 365 communictions, with an ask to optimize large apps. To optimize a large app, try: reducing the number of items in the app, converting reports in the app to a different format like [Power BI Project](../developer/projects/projects-overview.md), or recreating the app as an [org app](../consumer/org-app-items/org-app-items.md). If update is blocked for a large app, a message is shown asking customers to contact Power BI Support for help with optimizing the app and then unblocking update.
- You can create up to 25 audience groups per app.
- A total of 10,000 users and user groups combined can have access to an app.
- Each user group is counted as one entry against the 10,000 total.
- You can add up to 1,000 users or user groups per audience group (please note the total app user and user groups limit above). We recommend you use one or more user groups that contain all the users who should have access.
- If a user you added to an audience group already has access to the app through the workspace, they're not shown in the access list for the app.
- Each workspace user or user group is counted per audience group. For example, if you have four workspace users and five app audience groups those four workspace users will be counted per audience group (4x5), accounting for 20 users against the 10,000 users or user groups limit per app. Additionally, each workspace user or user group is counted against the 1,000 users or user groups per audience group.
- Consider how many workspace users or user groups have access to the app and how many users and user groups you have added to audience groups when creating additional audience groups. It is possible to hit the maximum number of 10,000 users or user groups per app before hitting the limit of 25 audience groups per app. For example, if you create 10 audience groups and have 1,000 users per audience group (accounting for workspace users too) you would hit the 10,000 app user or user groups limit and any additional audience groups with additional users or user groups will block the app from publishing or updating.
- If you include a report that uses chained semantic models in an app, also known as [DirectQuery for Power BI semantic models and Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md), when you add a user to an audience group, make sure to give permissions to all the semantic models in the chain. We recommend using Microsoft Entra Security Groups to manage permissions here. For more information, visit [Strategy for using groups](../guidance/powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups). The same consideration should be made for semantic models in a different workspace other than the app, make sure to give permissions to semantic models in a different workspace.
- If you include a paginated report that uses a semantic model, in an app, when you add a user to an audience group, make sure to give permission to the semantic model.


Additional things to keep in mind about publishing apps:
- AppSource is an external service that only has public-facing service apps. For organizational apps, users can just go to Apps marketplace to find them. Template apps are also available from Apps marketplace.
- You can either pin an entire report page to a dashboard using Live pin or pin a single visual as a tile from a report to the dashboard. 
- When you select a visual pinned as a tile in a dashboard in a published app, you're directed to the underlying report in the app. If the app creator chose not to include a report that has a related dashboard in the app, you're not directed to the underlying report when you select the related tile.
- To see an entire report page pinned as a live pin to a dashboard or a drill-down report to work, the app creators have to include the report in the app audience. 
- The support site URL is shown in the item information card.
- By default, all the newly added content, to an already published app, is marked as invisible. You must go to each audience group and manually unhide it.
- Having multiple audiences isn't fully supported in deployment pipelines. Content visibility of new content that you add to an org app must still be managed manually via audience management.
- When using "Add a Link", you can only open embed links in the content area.
- Apps can have a maximum of 200 dashboards.
- Creating a subscription from a scorecard from within an app isn't supported. As a workaround, workspace admins or item owners can create subscriptions from the source scorecard and add app consumers as recipients, recipients can manage their subscriptions in preferences > notifications.

## Related content

- [Create apps in *workspaces*](service-create-the-new-workspaces.md)
- [Install and use apps in Power BI](../consumer/end-user-apps.md)
- [Power BI apps for external services](../connect-data/service-connect-to-services.md)
- [Power BI Admin Portal](../admin/service-admin-portal.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
