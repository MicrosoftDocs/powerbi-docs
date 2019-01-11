---
title: Migrate a content pack to a template app in Power BI
description: How to migrate existing content packs in Power BI to template apps that you can distribute to any Power BI customer.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 01/10/2019
ms.author: maggies
---

# Migrate a content pack to a template app

The new Power BI *template apps* enable Power BI partners to build Power BI apps with little or no coding, and deploy them to any Power BI customer. Prior to template apps, you may have created Power BI service content packs for services like Salesforce or Microsoft Dynamics. This article explains how to migrate from an existing content pack to a Power BI template app. 

## Prerequisites 

The requirements for migrating a content pack to a template app are few:  

- A [Power BI pro license](service-self-service-signup-for-power-bi.md)
- Familiarity with the [basic concepts of Power BI ](service-basic-concepts.md)
- An existing service content pack .pbit template file.

## Download the .pbit template file

1. Open the .pbit file in Power BI Desktop with the necessary URL and credentials.  
2. Select **Connect**.
3. Make sure the data is refreshable.  
4. If the query has parameters, you need to edit the parameters to make sure they have a specific type, for example, "Text". Make sure none has the type "Any", which is the default in .pbit files. 
5. Save the file locally as a .pbix file.

## Create the app workspace

Before you can create an app workspace for a template app, you need to Enable app developer mode. You also need one of the new app workspaces.   

1. Open the Power BI service in a browser.

1. Select **Workspaces** > **Create app workspace**. 

3. In **Create an app workspace**, in **Preview improved workspaces**, select **Try now**.

5. Enter a name, description (optional), and logo image (optional) for your app workspace.

4. Select **Develop a template app**.

## Create the template app content

1. Upload the new report .pbix file you created in Power BI Desktop. 

1. Make sure dataset is refreshable in service  

3. Create the dashboard by pinning tiles from your report, and lay them out the way you want them. 

## Manage the template app release

Now that you have content in your workspace, you're ready to package it in a template app. From here, the process is the same as creating a template app from scratch. 

[Create the test template app](service-template-apps-create.md#create-the-test-template-app)
 
[Manage the template app release](service-template-apps-create.md#manage-the-template-app-release)

## Next steps

[Create a template app in Power BI](service-template-apps-create.md)

[Install, customize, and distribute template apps in your organization](service-template-apps-install-distribute.md)

Known limitations of template apps (preview)






