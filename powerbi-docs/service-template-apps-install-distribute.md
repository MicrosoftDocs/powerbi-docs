---
title: Distribute template apps in your organization - Power BI
description: Learn about installing, customizing, and distributing template apps in your organization in Power BI.
author: teddybercovitz
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 09/14/2019
ms.author: tebercov
---

# Install and distribute template apps in your organization - Power BI

Are you a Power BI analyst? If so, this article explains how you install *template apps* to connect to many of the services you use to run your business, such as Salesforce, Microsoft Dynamics, and Google Analytics. You can modify the dashboard and reports to meet the needs of your organization, and then distribute them to your colleagues as an *app*. 

![Power BI apps installed](media/service-template-apps-install-distribute/power-bi-get-apps.png)

If you're interested in creating template apps to distribute yourself, see [Create a template app in Power BI](service-template-apps-create.md). Power BI partners can build Power BI apps with little or no coding, and deploy them to Power BI customers. 

## Prerequisites  

Here are the requirements for installing, customizing, and distributing a template app: 

- A [Power BI pro license](service-self-service-signup-for-power-bi.md)
- Familiarity with the [basic concepts of Power BI ](service-basic-concepts.md)
- Valid installation link from the template app creator or AppSource. 
- Permissions to install template apps. 

## Install a template app

You may receive a link to a template app. Otherwise, you can search AppSource for one that interests you. Either way, after you install it, you can modify it and distribute it to your own organization.

### Search AppSource from a browser

In a browser, select this link to open AppSource filtered to Power BI apps:

- https://appsource.microsoft.com/marketplace/apps?product=power-bi

### Search AppSource from the Power BI service

1. In the left navigation pane in the Power BI service, select **Apps** > **Get apps**.

    ![Get apps](media/service-template-apps-install-distribute/power-bi-get-apps-arrow.png)

2. In AppSource, select **Apps**.

    ![Search in AppSource](media/service-template-apps-install-distribute/power-bi-appsource.png)

3. Browse or search for the app, then select **Get it now**.

4. In the dialog box, select **Install**.

    ![Install app](media/service-template-apps-install-distribute/power-install-dialog.png)
    If you have a Power BI Pro license, the app is installed with its associated app workspace. You customize the app in the associated workspace.

    When installation succeeds, you see a notification that your new app is ready.
4. Select **Go to app**.
5. In **Get started with your new app**, select one of three options:

    ![Get started with your app](media/service-template-apps-create/power-bi-template-app-get-started.png)

    - **Explore app**: Basic sample data exploration. Start here to get the look and feel of the app. 
    - **Connect data**: Change the data source from the sample data to your own data source. You can redefine dataset parameters and data source credentials. See [Known limitations](service-template-apps-tips.md#known-limitations) in the template apps tips article. 
    - **Go to workspace** (most advanced option): you can make any changes allowed by the app builder.

    Or skip this dialog box and access the associated workspace directly via **Workspaces** in the left navigation pane.
    >[!NOTE]
    >Installing a template app installed both an *organizational app* and an *app workspace*. Read more about [distributing apps in Power BI](service-create-distribute-apps.md).
 
6. Before you share it with your coworkers, you'll want to connect to your own data. You may also want to modify the report or dashboard to make it work for your organization. You can also add other reports or dashboards at this point.

   If you select an installation link for an app that isn't listed on AppSource, you get the validation dialog box asking you to confirm your choice.

   ![Install app](media/service-template-apps-install-distribute/power-install-unvalidated-dialog.png)

   >[!NOTE]
   >In order to install template apps which are not listed on AppSource you need to request from your admin permissions. See the Power BI [admin portal, Template app settings](service-admin-portal.md#template-apps-settings) for details.

## Customize and publish the app

After you've updated the app for your organization, you're ready to publish it. The steps are the same as for publishing any other app.

1. When you've finished customizing, in the workspace list view select **Update app** in the upper-right corner.  

    ![Start app installation](media/service-template-apps-install-distribute/power-bi-start-install-app.png)

2. In **Details**, you can modify the description and background color.

   ![Set app description and color](media/service-template-apps-install-distribute/power-bi-install-app-details.png)

3. In **Navigation**, you can use the new navigation builder (See [Design the navigation experience](service-create-distribute-apps.md#design-the-navigation-experience) for your app in this article for details) or select a landing page, either the dashboard or the report.

   ![Set app landing page](media/service-template-apps-install-distribute/power-bi-install-app-content.png)

4. In **Access**, you give access either to selected users or to your whole organization.  

   ![Set app access](media/service-template-apps-install-distribute/power-bi-install-access.png)

5. Select **Update app**. 

6. After it's successfully published, you can copy the link and share it with whomever you've given access to. If you've shared it with them, they also see it on the **My organization** tab in AppSource.

## Update a template app

A template app can be updated when a new version is released via AppSource or a direct link. You can update the template app when reinstalling the app with the same or newer version.

  >[!NOTE]
  >Any changes performed to the reports or dashboards will be overwritten with the new installed version. You can **save as** the reports or dashboards before overwriting.

1. **Overwrite an existing version:** Will overwrite the existing workspace with the updated version of the template app.

   ![Update template app](media/service-template-apps-install-distribute/power-bi-update-app-overwrite.png)

1. **Install to a new workspace:** will install a fresh version of the workspace and app that will require reconfiguration.

### Overwrite behavior:

 * Overwriting updates the reports, dashboards, and dataset inside the workspace, republishing must be performed to share the update with the app users.
 * Overwriting will keep configured parameters and authentication. After update, a dataset refresh will automatically start (if possible) - note you will see sample data until refresh completes.
* Overwrites never deletes **new** reports or dashboard added to the workspace, it will overwrite according to the changes made by the author.

>[!IMPORTANT]
>Remember to [update app](#customize-and-publish-the-app) after performing overwrite in order for changes in the reports and dashboard to be shared with the app users.

## Next steps

[Create workspaces with your colleagues in Power BI](service-create-workspaces.md)
