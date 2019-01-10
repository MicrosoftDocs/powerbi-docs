---
title: Create template apps in Power BI
description: How to create template apps in Power BI that you can distribute to any Power BI customer.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 01/08/2019
ms.author: maggies
---

# Create a template app in Power BI

Power BI template apps are a new capability that enables Power BI partners to build Power BI apps with little or no coding, and deploy them to any Power BI customer.  This article contains step-by-step instructions to create a Power BI template app. 

If you can create Power BI reports and dashboards, you can become a *template app builder* who builds and packages analytical content into an *app*. You can then deploy your app to other Power BI tenants through any available platform, such as AppSource, or by using it in your own web service. As a builder you can create a protected analytics package for distribution. 

Power BI tenant admins govern and control who in their organization is authorized to install a template app. Those who are authorized can install your template app, then modify it and distribute it to the Power BI consumers in their organization.

## Prerequisites 

The requirements for building a template app are few:  

- A [Power BI pro license](service-self-service-signup-for-power-bi.md)
- An [installation of Power BI Desktop](desktop-get-the-desktop.md) (optional)
- Familiarity with the [basic concepts of Power BI ](service-basic-concepts.md)

## Create the template app workspace

To create a template app you can distribute to other Power BI tenants, you need to be in App Developer mode. Otherwise, you're just creating an app for Power BI consumers in your own organization.
 
1. In the  Power BI service, go to **Settings** > **General** > **Developer** > **Enable template app development mode**.
2. Select **Apply**.

2. Select **Workspaces** > **Create app workspace**. 

3. In **Create an app workspace**, in **Preview improved workspaces**, select **Try now**.

5. Enter a name, description (optional), and logo image (optional) for your app workspace.

4. Select **Develop a template app**.

## Create the content in your template app

As with a regular Power BI app workspace, you create the contents in the workspace.  In this preview version of template apps, we support only up to one of each type: one dataset, one report, and one dashboard.

- [Create your Power BI content](power-bi-creator-landing.md) in your app workspace.

As a best practice, if you're using parameters in Power Query, make sure they have well defined type (for example, Text).

## Create the test template app
 
Now that you have content in your workspace, you are ready to package it in a template app. The first step is to create a test template app, accessible only from within your organization on your tenant.  

1. In the template app workspace, select **Create template app**. 
 
    Here, you fill in additional parameters for your template app, in three categories. 

    Branding:

    - App name 
    - Description
    - App logo (optional)
    - App color 

    Content: 

    - App landing page (optional): Define a report or dashboard to be the landing page of your app.  
    
    Permissions: 

    - Content restrictions: You can set restrictions for your app, such as whether those who install it can download its .pbix files.
    - Test app permissions (valid only for the test app): set permissions to specific users of your organization. 
 

    Don't worry, you can always come back and change these settings later.  

2. Select **Save and close** to save your settings for the app. 

## Manage the template app release

Before you release this template app publicly, you want to make sure it's ready to go. Power BI has created the release management pane, where you can follow and inspect the full app release path. You can also trigger the transition from stage to stage. The common stages are: 

- Generate test app: for testing only in your organization. 
- Promote the test package to pre-production stage: test outside of your organization.
- Promote pre-production package to Production: production version. 
- Delete any package or start over from previous stage. 

Let's go through the stages.

1. In the template app workspace, select **Release Management**.
2. Select the dot next to **Workapace** > **Create test app**. 

    Wait for the notification window to pop up.
 
9. Copy the link in the notification window and paste it to a new browser window to trigger an installation.
 
10.	In the dialog box, select **Install**.

    When installation succeeds, you see a notification that the new app is ready. 
 
11. Select **Go to app**.
 
12. In **Get started with your new app**, select one of three options:

    - **Explore app**: Basic sample data exploration
    - **Connect data**: Explore your own data
    - **Go to workspace**: Make any changes allowed by app builder
		
    Details about these options are available in [Install, customize, and distribute template apps in your organization](service-template-apps-install-distribute.md). 

13. Select **Explore App** to verify the test app.

1. Make any changes to the original workspace and recreate test apps until you're satisfied.

9. When you're ready to promote your app to pre-production and/or production stages for further testing it with your customers or sharing via AppSource, go back to the **Release Management** pane, right-click **Testing** > **Promote to preproduction**. 

If you're interested in making your app widely available to thousands of Power BI users in the world, we encourage you to submit it to AppSource. See “Submitting template apps to AppSource.” 

Template apps are the next generation of service content packs. If you own any content packs, see “Migrating content packs to template apps.” 

## Next steps

Known limitations of template apps (preview)

[Install, customize, and distribute template apps in your organization](service-template-apps-install-distribute.md)






