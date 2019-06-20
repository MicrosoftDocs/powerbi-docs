---
title: What are Power BI template apps?
description: This article is an overview of the Power BI template app program. Learn how to build Power BI apps with little or no coding, and deploy them to any Power BI customer.  
author: teddybercovitz
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 06/10/2019
ms.author: tebercov
---

# What are Power BI template apps?

The new Power BI *template apps* enable Power BI partners to build Power BI apps with little or no coding, and deploy them to any Power BI customer.  This article is an overview of the Power BI template app program.

Template apps are a replacement for the current service content packs. As a Power BI partner, you create a set of out-of-the-box content your customers, and publish it yourself.  

You build template apps that allow your customers to connect and instantiate with their own accounts. As domain experts, they can unlock the data in a way that's easily consumable by their business users.  

You submit your template apps to the Cloud Partner Portal. The apps then become publicly available in the Power BI App gallery (app.powerbi.com/getdata/services) and on Microsoft AppSource (appsource.microsoft.com). Here's a high-level look at the public template app creation experience.  

## Process
The general process to develop and submit a template app involves several stages. Some stages can include more than one activity at the same time.


| Stage | Power BI Desktop |  |Power BI service  |  |Cloud Partner Portal  |
|---|--------|--|---------|---------|---------|
| **One** | Build a data model and report in a .pbix file |  | Create a workspace. Import .pbix file. Create a complementary dashboard  |  | Register as a partner |
| **Two** |  |  | Create a test package and run internal validation        |  | |
| **Three** | |  | Promote the test package to preproduction for validation outside your Power BI tenant, and submit it to AppSource  |  | With your preproduction package, create a Power BI template app offer and start the validation process |
| **Four** | |  | Promote the preproduction package to production |  | Go live |

## Before you begin

To create the template app, you need permissions to create one. See the Power BI admin portal, Template app settings for details. 

To publish a template app to the Power BI service and AppSource, you must meet the requirements for [becoming a Cloud Marketplace Publisher](https://docs.microsoft.com/azure/marketplace/become-publisher).
 
## High-level steps

Here are the high-level steps. 

1. [Review the requirements](#requirements) to make sure you meet them. 

1. Build a report in Power BI Desktop. Use parameters so you can save it as a file other people can use. 

1. Create a workspace for your template app in your tenant on the Power BI service (app.powerbi.com). 

1. Import your .pbix file and add content such as a dashboard to your app. 

1. Create a test package to test the template app yourself within your organization. 

1. Promote the test app to pre-production to submit the app for validation in AppSource, and to test outside your own tenant. 

1. Submit the content to Cloud Partner Platform for publishing. 

1. Make your offer goes 'Live' in AppSource, and move your app to production in Power BI.
2. Now you can start developing the next version in the same workspace, in preproduction. 

## Requirements

To create the template app, you need permissions to create one. See the Power BI [admin portal, Template app settings](service-admin-portal.md#template-apps-settings) for details. 

To publish a template app to the Power BI service and AppSource, you must meet the requirements for [becoming a Cloud Marketplace Publisher](https://docs.microsoft.com/azure/marketplace/become-publisher).
 > [!NOTE] 
 > Template apps submissions are managed in [Cloud Partner Portal](https://cloudpartner.azure.com). Use the same Microsoft Developer Center registration account to sign in. You should have only one Microsoft account for your AppSource offerings. Accounts shouldn't be specific to individual services or offers.

## Tips 

- Make sure your app includes sample data to get everyone started in a click. 
- Carefully examine your application by installing it in your tenant and in a secondary tenant. Make sure customers only see what you want them to see. 
- Use AppSource as your online store to host your application. This way everyone using Power BI can find your app. 
- Consider offering more than one template app for separate unique scenarios. 
- Enable data customization, for example support custom connection and parameters configuration by the installer.

See [Tips for authoring template apps in Power BI](service-template-apps-tips.md) for more suggestions.

## Support
For support during development, use [https://powerbi.microsoft.com/support](https://powerbi.microsoft.com/support). We actively monitor and manage this site. Customer incidents quickly find their way to the appropriate team.

## Next steps

[Create a template app](service-template-apps-create.md)
