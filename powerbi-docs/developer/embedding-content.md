---
title: How to embed your Power BI dashboards, reports and tiles
description: Learn about the steps you need to take to embed Power BI content within your application.
author: markingmyname
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-developer
ms.topic: conceptual
ms.date: 03/12/2018
ms.author: maghan
---
# Embed your Power BI dashboards, reports and tiles

Learn about the steps you need to take to embed Power BI content within your application.

Microsoft [announced Power BI Premium](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/), a new capacity-based licensing model that increases flexibility for how users access, share and distribute content. The offering also delivers additional scalability and performance to the Power BI service. Power BI Embedded was also announced that allows for creating capacity within Microsoft Azure. Power BI Embedded is focused on your application and your customers. 

This article will look at embedding your Power BI content for both your organization and your customers. The steps are similar between the two scenarios. Callouts will be made when a step is specific to embedding for your customer.

There are a few steps you have to do with your application to make this possible. We will go through the steps needed to allow you to create and use embedded content within your application.

> [!NOTE]
> The Power BI APIs still refer to app workspaces as groups. Any references to groups mean that you are working with app workspaces.

## Step 1: Setup your embedded analytics development environment

Before you start embedding dashboards and reports into your application, you need to make sure your environment is setup to allow for embedding. As part of the setup, you will need to do the following.

* [Make sure you have an Azure Active Directory tenant](embedding-content.md#azureadtenant)
* [Create your Power BI Pro account](embedding-content.md#proaccount)
* [Register your Azure Active Directory application and permissions](embedding-content.md#appreg)

> [!NOTE]
> Power BI capacity is not required for development of your application. The developers of the application will need to have a Power BI Pro license.

### <a name="azureadtenant"></a>Azure Active Directory tenant

You will need an Azure Active Directory (Azure AD) tenant in order to embed items from Power BI. This tenant must have at least one Power BI Pro user. You will also need to define an Azure AD app within the tenant. You can make use of an existing Azure AD tenant or create a new one specifically for embedding purposes.

You will need to determine what tenant setup to use if you are embedding for your customers.

* Use your existing corporate Power BI tenant?
* Use a separate tenant for your application?
* Use a separate tenant for each customer?

If you do not want to use an existing tenant, you can decide to create a new tenant for your application, or one for each customer, see [Create an Azure Active Directory tenant](create-an-azure-active-directory-tenant.md) or [How to get an Azure Active Directory tenant](https://docs.microsoft.com/azure/active-directory/develop/active-directory-howto-tenant).

### <a name="proaccount"></a>Create a Power BI Pro user account

You only need a single Power BI Pro account to embed content. However, you may want to have a few different users that have specific access to items. Here is a look at possible users to consider within your tenant.

The following accounts will need to exist within your tenant and have a Power BI Pro license assigned to them. A Power BI Pro license is required to work with app workspaces within Power BI.

#### An organization/tenant admin user

It is recommended that your organization/tenant Global Admin user should not be used as account your application uses if embedding for your customers. This is to minimize access that the application account has within your tenant. It is recommended that the admin user be an admin of all app workspaces created for the purpose of embedding.

#### Accounts for analysts that will create content

You may have multiple users that create content for Power BI. You will need a Power BI Pro account for each analyst that is creating and deploying content to Power BI.

#### An application *master* user account for embedding for your customers

The master account is the account your application will use when embedding content for your customers. The scenario is typically for ISV applications. The master account is really the only required account you need within your organization. It can also be used as the admin and analyst account, but it is not recommended. Your application's backend will store the credentials for this account and use it for acquiring an Azure AD auth token for use with the Power BI APIs. This account will be used to generate an embed token for the application to use for your customers.

The master account is just a regular user with a Power BI Pro license that you use with your application. The account must be an admin of the app workspace that is being used for embedding.

### <a name="appreg"></a> App registration and permissions

You will need to register your application with Azure AD in order to make REST API calls. For more information, see [Register an Azure AD app to embed Power BI content](register-app.md).

### Create app workspaces

If you are embedding dashboards and reports for your customers, those dashboards and reports have to be placed within an app workspace. The *master* account, that was mentioned above, must be an admin of the app workspace.

[!INCLUDE [powerbi-service-create-app-workspace](../includes/powerbi-service-create-app-workspace.md)]

> [!NOTE]
> A non-admin user can only create up to 250 app workspaces. To create more app workspaces, you need to use a tenant admin account.
>

### Create and upload your reports

You can create your reports and datasets using Power BI Desktop and then publish those reports to an app workspace. The end user publishing the reports need to have a Power BI Pro license in order to publish to an app workspace.

You can go through the new [Onboarding experience tool](https://aka.ms/embedsetup) to quickly setup your embedded analytics development environment.

## Step 2: Embed your content

Within your application, you will need to authenticate with Power BI. If you are embedding content for your customers, you will store the credentials for the *master* account within your application. For more information, see [Authenticate users and get an Azure AD access token for your Power BI app](get-azuread-access-token.md).

Once authenticated, within your application, use the Power BI REST APIs and JavaScript APIs to embed dashboards and reports into your application. 

For **embedding for your organization**, see the following walkthroughs:

* [Integrate a dashboard into an app](integrate-dashboard.md)
* [Integrate a tile into an app](integrate-tile.md)
* [Integrate a report into an app](integrate-report.md)

For **embeding with your customers**, which is typical for ISVs, see the following:

* [Integrate a dashboard, tile, or report into your application](embed-sample-for-customers.md)

When embedding for your customers, an embed token is required. To learn more see, [GenerateToken](https://msdn.microsoft.com/library/mt784614.aspx).

## Step 3: Promote your solution to production

Moving to production requires a few extra steps.

### Embedding for your organization

If you are embedding for your organization, you only need to let people know how to get to your application. 

Free users can consume content that is embedded from an app workspace (group), if that workspace is backed by capacity. List the Free user as a member of app workspace (group), otherwise you receive a 401 unauthorized error. The following table lists the available Power BI Premium SKUs available within Office 365.

| Capacity Node | Total cores<br/>*(Backend + frontend)* | Backend Cores | Frontend Cores | DirectQuery/live connection limits | Max page renders at peak hour |
| --- | --- | --- | --- | --- | --- |
| EM3 |4 v-cores |2 cores, 10GB RAM |2 cores | |601-1,200 |
| P1 |8 v-cores |4 cores, 25GB RAM |4 cores |30 per second |1,201-2,400 |
| P2 |16 v-cores |8 cores, 50GB RAM |8 cores |60 per second |2,401-4,800 |
| P3 |32 v-cores |16 cores, 100GB RAM |16 cores |120 per second |4,801-9600 |

> [!NOTE]
> You must be a Global or Billing Admin, within your tenant, in order to purchase Power BI Premium. For information on how to purchase Power BI Premium, see [How to purchase Power BI Premium](../service-admin-premium-purchase.md).

### Embedding for your customers

If you are embedding for your customers, do the following.

* If you are using a separate tenant for development, then you must make sure your app workspaces, along with dashboards and reports, are available in your production environment. Make sure that you create the application in Azure AD for your production tenant and assign the proper app permissions as indicated in Step 1.
* Purchase a capacity that fits your needs. You can use the table below to understand which Power BI Embedded capacity SKU you may need. For more details, see [Embedded analytics capacity planning whitepaper](https://aka.ms/pbiewhitepaper). When you are ready to purchase, you can do so within the [Microsoft Azure portal](https://portal.azure.com). For details on how to create Power BI Embedded capacity, see [Create Power BI Embedded capacity in the Azure portal](https://docs.microsoft.com/azure/power-bi-embedded/create-capacity).

> [!IMPORTANT]
> Because embed tokens are intended for development testing only, the number of embed tokens a Power BI master account can generate is limited. A [capacity must be purchased](https://docs.microsoft.com/power-bi/developer/embedded-faq#technical) for production embedding scenarios. There is no limit to embed token generation when a capacity is purchased. Go to [Get Available Features](https://msdn.microsoft.com/en-us/library/mt846473.aspx) to check for how many free embed tokens have been used.

| Capacity Node | Total cores<br/>*(Backend + frontend)* | Backend Cores | Frontend Cores | DirectQuery/live connection limits | Max page renders at peak hour |
| --- | --- | --- | --- | --- | --- |
| A1 |1 v-cores |.5 cores, 3GB RAM |.5 cores | 5 per second |1-300 |
| A2 |2 v-cores |1 core, 5GB RAM |1 core | 10 per second |301-600 |
| A3 |4 v-cores |2 cores, 10GB RAM |2 cores | 15 per second |601-1,200 |
| A4 |8 v-cores |4 cores, 25GB RAM |4 cores |30 per second |1,201-2,400 |
| A5 |16 v-cores |8 cores, 50GB RAM |8 cores |60 per second |2,401-4,800 |
| A6 |32 v-cores |16 cores, 100GB RAM |16 cores |120 per second |4,801-9600 |

* Edit the app workspace and assign it to a capacity under advanced.

    ![Assign app workspace to capacity](media/embedding-content/powerbi-embedded-premium-capacity.png)

* Deploy your updated application to production and begin embedding Power BI dashboards and reports.

## Admin settings

Global Admins, or Power BI service administrators, can turn the ability to use the REST APIs, on or off for a tenant. Power BI admins can set this setting for the entire organization, or for individual security groups. It is enabled for the entire organization by default. This is done through the [Power BI admin portal](../service-admin-portal.md).

## Next steps

[Embedding with Power BI](embedding.md)  
[How to migrate Power BI Embedded workspace collection content to Power BI](migrate-from-powerbi-embedded.md)  
[Power BI Premium - what is it?](../service-premium.md)  
[How to purchase Power BI Premium](../service-admin-premium-purchase.md)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
[Embedded analytics capacity planning whitepaper](https://aka.ms/pbiewhitepaper)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

