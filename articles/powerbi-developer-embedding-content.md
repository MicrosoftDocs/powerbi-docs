<properties
   pageTitle="How to embed your Power BI dashboards, reports and tiles"
   description="Learn about the steps you need to take to embed Power BI content within your application."
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="07/21/2017"
   ms.author="asaxton"/>

# How to embed your Power BI dashboards, reports and tiles

Learn about the steps you need to take to embed Power BI content within your application.

Microsoft recently [announced Power BI Premium](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/), a new capacity-based licensing model that increases flexibility for how users access, share and distribute content. The offering also delivers additional scalability and performance to the Power BI service.

With the introduction of Power BI Premium, Power BI Embedded and the Power BI service are converging to advance how Power BI content is embedded in apps. This means you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and app workspaces – when embedding your content. Moving forward you’ll be able to start with Power BI Desktop and move to deployment with Power BI Premium, which will be generally available late in the second quarter of 2017.

This article will look at embedding your Power BI content for both users of Power BI and non-Power BI users. The steps are similar between the two. Callouts will be made when a step is specific to embedding for non-Power BI users.

There are a few steps you have to do with your application to make this possible. We will go through the steps needed to allow you to create and use embedded content within your application.

> [AZURE.NOTE] The Power BI APIs still refer to app workspaces as groups. Any references to groups mean that you are working with app workspaces.

## Step 1: Setup your embedded analytics development environment

Before you start embedding dashboards and reports into your application, you need to make sure your environment is setup to allow for embedding. As part of the setup, you will need to do the following.

* [Define your Azure Active Directory tenant](powerbi-developer-embedding-content.md#azureadtenant)
* [Create your Power BI Pro account](powerbi-developer-embedding-content.md#proaccount)
* [Register your Azure Active Directory application and permissions](powerbi-developer-embedding-content.md#appreg)

> [AZURE.NOTE] Power BI Premium is not required for development of your application. The developers of the application will need to have a Power BI Pro license.

### <a name="azureadtenant"></a>Azure Active Directory tenant

You will need an Azure Active Directory (Azure AD) tenant in order to embed items from Power BI. This tenant must have at least one Power BI Pro user. You will also need to define an Azure AD app within the tenant. You can make use of an existing Azure AD tenant or create a new one specifically for embedding purposes.

You will need to determine what tenant setup to use.

* Use your existing corporate Power BI tenant?
* Use a separate tenant for your application?
* Use a separate tenant for each customer?

If you decide to create a new tenant for your application, or one for each customer, see [Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md) or [How to get an Azure Active Directory tenant](https://docs.microsoft.com/azure/active-directory/develop/active-directory-howto-tenant).

> [AZURE.NOTE] It is recommended to create a new Azure AD tenant if you will be embedding for non-Power BI users. 

### <a name="proaccount"></a>Create a Power BI Pro user account

You only need a single Power BI Pro account to embed content. However, you may want to have a few different users that have specific access to items. Here is a look at possible users to consider within your tenant.

The following accounts will need to exist within your tenant and have a Power BI Pro license assigned to them.

> [AZURE.NOTE] These accounts will need to have Power BI Pro licenses in order to use App workspaces.

#### An organization/tenant admin user

It is recommended that your organization/tenant Global Admin user should not be used as the account your application uses. This is to minimize access that the application account has within your organization. It is recommended that the admin user be an admin of all App workspaces created for the purpose of embedding.

#### Accounts for analysts that will create content

You may have multiple users that create content for Power BI. You will need a Power BI Pro account for each analyst that is creating and deploying content to Power BI.

#### An application *master* user account for non-Power BI users

This is the account your application will use when embedding content for non-Power BI users. This is really the only required account you need within your organization. It can also be used as the admin and analyst account, but it is not recommended. Your application's backend will store the credentials for this account and use it for acquiring an Azure AD auth token for use with the Power BI APIs. This account will be used to generate an embed token for the application to use for non-Power BI users.

This account must be an admin of the app workspace that is being used for embedding.

### <a name="appreg"></a> App registration and permissions

You will need to register your application with Azure AD in order to make REST API calls. For more information, see [Register an Azure AD app to embed Power BI content](powerbi-developer-register-app.md).

### Create app workspaces

If you are embedding dashboards and reports for non-Power BI users (app owns data), those dashboards and reports have to be placed within an app workspace. For information on how to create an app workspace, see [Create and distribute an app in Power BI](powerbi-service-create-apps.md).

> [AZURE.IMPORTANT] The *master* account, that was mentioned above, needs to be an admin of the app workspace.

### Create and upload your reports

You can create your reports and datasets using Power BI Desktop and then publish those reports to an app workspace. The end user publishing the reports need to have a Power BI Pro license in order to publish to an app workspace.

## Step 2: Embed your content

Within your application, you will need to authenticate with Power BI. If you are embedding content for non-Power BI users, this will require you to store the credentials for the *master* account within your application. For more information, see [Authenticate users and get an Azure AD access token for your Power BI app](powerbi-developer-get-azuread-access-token.md).

After you have authenticated, within your application, use the Power BI and JavaScript APIs to embed dashboards and reports into your application. 

For embedding with Power BI users (users own data), see the following:

- [Integrate a dashboard into an app (user owns data)](powerbi-developer-integrate-dashboard.md)
- [Integrate a tile into an app (user owns data)](powerbi-developer-integrate-tile.md)
- [Integrate a report into an app (user owns data)](powerbi-developer-integrate-report.md)

For embeding with non-Power BI users (app owns data), which is typical for ISV scenarios, see the following:

- [Integrate a dashboard, tile, or report into your application (app owns data)](powerbi-developer-embed-sample-app-owns-data.md)

When embedding for non-Power BI users (app owns data), an embed token is required. To learn more see, [GenerateToken](https://msdn.microsoft.com/library/mt784614.aspx).

## Step 3: Promote your solution to production

When you are ready to move to production, you will need to do the following.

### Power BI users (user owns data)

If you are embedding for Power BI users, you only need to let people know how to get to your application. 

Free users can consume content that is embedded from a group (app workspace), if that workspace is backed by a Premium capacity. The Free user needs to be listed as a member of group (app workspace), otherwise you will receive a 401 unauthorized error.

### Non-Power BI users (app owns data)

If you are embedding for non-Power BI users, you will want to do the following.

* While you can use your organizations production tenant, it is recommended to create a new embedded analytics environment for production. For more information, see Step 1 above.

* If you are using a separate tenant for development, then you will need to make sure your app workspaces, along with dashboards and reports, are available in your production environment. You will also need to make sure that you created the application in Azure AD for your production tenant and assigned the proper app permissions as indicated in Step 1.

* Purchase a capacity that fits your needs. You can use the table below to understand which Premium capacity SKU you may need. For more details, see [Embedded analytics capacity planning whitepaper](https://aka.ms/pbiewhitepaper). When you are ready to purchase, you can do so within the [Office 365 admin center](https://portal.office.com/adminportal/home#/catalog).

|Capacity Node|Total cores<br/>*(Backend + frontend)*|Backend Cores|Frontend Cores|DirectQuery/live connection limits|Max page renders at peak hour|Availability|
|---------|---------|---------|---------|---------|---------|---------|
|EM1|1 v-cores|.5 cores, 3GB RAM|.5 cores||1-300|July 2017|
|EM2|2 v-cores|1 core, 5GB RAM|1 core||301-600|July 2017|
|EM3|4 v-cores|2 cores, 10GB RAM|2 cores||601-1,200|July 2017|
|P1|8 v-cores|4 cores, 25GB RAM|4 cores|30 per second|1,201-2,400|Available|
|P2|16 v-cores|8 cores, 50GB RAM|8 cores|60 per second|2,401-4,800|Available|
|P3|32 v-cores|16 cores, 100GB RAM|16 cores|120 per second|4,801-9600|Available|

> [AZURE.NOTE] You must be a Global or Billing Admin, within your tenant, in order to purchase Power BI Premium. For information on how to purchase Power BI Premium, see [How to purchase Power BI Premium](powerbi-admin-premium-purchase.md).

* Edit the App workspace and assign it to a Premium capacity under advanced.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-premium-capacity.png)

* Deploy your updated application to production and begin embedding reports from the Power BI service.

## Admin settings

Global Admins, or Power BI service administrators, can turn the ability to use the REST APIs, on or off. Admins can set this setting for the entire organization, or for individual security groups. It is enabled for the entire organization by default. This is done through the [Power BI admin portal](powerbi-admin-portal.md). 

## Next steps

[Embedding with Power BI](powerbi-developer-embedding.md)  
[How to migrate Power BI Embedded workspace collection content to Power BI](powerbi-developer-migrate-from-powerbi-embedded.md)  
[Power BI Premium - what is it?](powerbi-premium.md)  
[How to purchase Power BI Premium](powerbi-admin-premium-purchase.md)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
[Embedded analytics capacity planning whitepaper](https://aka.ms/pbiewhitepaper)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)