---
title: Frequently asked questions about Power BI Embedded
description: Browse a list of frequently asked questions and answers about Power BI Embedded.
author: rkarlin
ms.author: rkarlin
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 05/27/2019 
---

# Frequently asked questions about Power BI Embedded

* If you have other questions, [try asking the Power BI Community](http://community.powerbi.com/).
* Still have an issue? Visit the [Power BI support page](https://powerbi.microsoft.com/support/).

## General

### What is Power BI Embedded?

[Microsoft Power BI Embedded (PBIE)](azure-pbie-what-is-power-bi-embedded.md) allows application developers to embed stunning, fully interactive reports into their applications without having to build their own data visualizations and controls from scratch.

### Who is the target audience for Power BI Embedded?

Developers and software companies, also known as independent software vendors (ISVs), coding applications.

### How is Power BI Embedded different from Power BI the service?

Power BI is a software-as-a-service analytics solution that gives organizations a single view of their most critical business data.

Microsoft developed Power BI Embedded for ISVs wanting to embed visuals into their applications to help their customers make analytic decisions. This spares ISVs from having to build their own analytics’ solution themselves. [Embedded analytics](embedding.md) enables business users to access business data and execute queries against it to generate insights within the application.


### What is the difference between Power BI Premium and Power BI Embedded?

Power BI Premium is capacity geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers. Power BI Premium helps your organization make decisions. Power BI Premium is a SaaS product that allows users to consume content through mobile apps, internally developed apps, or at the Power BI portal.

Power BI Embedded is for ISVs who want to embed visuals into their applications. Power BI Embedded helps your customers make decisions because Power BI Embedded is for application developers, customers of that application can consume content stored on Power BI Embedded capacity, including anyone inside or outside the organization. You can't share Power BI Embedded capacity content through one-click publish to Web or one-click publish to SharePoint.

### What is the Microsoft recommendation for when a customer should buy Power BI Premium vs. Power BI Embedded?

Microsoft recommends that enterprises buy Power BI Premium, an enterprise-grade, self-service cloud BI solution. We recommend ISVs buy Power BI Embedded for its cloud-powered embedded analytics components. However, a customer has no restriction on which product to buy.

There may be some cases where an ISV (typically large), in addition to app embedding, wants to use a P SKU to get the additional benefits of the pre-packaged Power BI service within their organization. Some enterprises may decide to use A SKUs in Azure if they're only interested in building line-of-business applications and embedding analytics into them and aren't interested in using the pre-packaged Power BI service.

### How many embed tokens can I create?

Embed tokens with PRO license are intended for development testing, so a Power BI master account or [service principal](embed-service-principal.md) can only generate a limited number of tokens. [Purchase a capacity](#technical) for embedding in a production environment. There's no limit to how many embed tokens you can generate when you purchase a capacity. Go to [Available Features](https://docs.microsoft.com/rest/api/power-bi/availablefeatures) to check the usage value that indicates the current embedded usage in percentage.

## Technical

### What is the difference between the A SKUs in Azure and the EM SKUs in Office 365?

PowerBI.com is an enterprise Software as a Service (SaaS) solution with many capabilities such as social collaboration, email subscription, and other features. PowerBI.com helps ISVs manage their embedded analytics solution content and tenant level settings.

Power BI Embedded is a Platform as a Service (PaaS) set of APIs developers can use to create an embedded analytics solution.

Here is a partial list of feature differences.

| Feature | Power BI Embedded | Power BI Premium Capacity | Power BI Premium Capacity |
|----------------------------------------------------------------------------------|-------------------|---------------------------|---------------------------|
|   | (A SKUs) | (EM SKUs) | (P SKUs) |
| Embed artifacts from a Power BI App workspace | Azure capacity | Office 365 capacity | Office 365 capacity |
| Consume Power BI reports in an   Embedded application | Yes | Yes | Yes |
| Consume Power BI reports in SharePoint | No | Yes | Yes |
| Consume Power BI reports in Dynamics | No | Yes | Yes |
| Consume Power BI reports in Teams (excludes mobile app) | No | Yes | Yes |
| Access content with a FREE Power BI license in Powerbi.com   and Power BI mobile | No | No | Yes |
| Access content with a FREE Power BI license embedded in MS Office apps | No | Yes | Yes |

### Power BI now offers three SKUs for embedding: A SKUs, EM SKUs, and P SKUs. Which one should I purchase for my scenario?

|  |A SKU (Power BI Embedded)  |EM SKU (Power BI Premium)  |P SKU (Power BI Premium)  |
|---------|---------|---------|---------|
|Purchase  |Azure portal |Office |Office |
|Use cases | Embed content in your own application | <li> Embed content in your own application <br><br><br> <li> Embed content in MS Office applications: <br> - [SharePoint](https://powerbi.microsoft.com/blog/integrate-power-bi-reports-in-sharepoint-online/) <br> - [Teams (excludes mobile app)](https://powerbi.microsoft.com/blog/power-bi-teams-up-with-microsoft-teams/) <br> - [Dynamics 365](https://docs.microsoft.com/dynamics365/customer-engagement/basics/add-edit-power-bi-visualizations-dashboard) | <li> Embed content in your own application <br><br><br> <li> Embed content in MS Office applications: <br> - [SharePoint](https://powerbi.microsoft.com/blog/integrate-power-bi-reports-in-sharepoint-online/) <br> - [Teams (excludes mobile app)](https://powerbi.microsoft.com/blog/power-bi-teams-up-with-microsoft-teams/) <br> - [Dynamics 365](https://docs.microsoft.com/dynamics365/customer-engagement/basics/add-edit-power-bi-visualizations-dashboard) <br><br><br> <li> Share content with Power BI users through the [Power BI service](https://powerbi.microsoft.com/)  |
|Billing |Hourly |Monthly |Monthly |
|Commitment  |No commitment |Yearly  |Monthly/Yearly |
|Differentiation |Full elasticity- can scale up/ down, pause/ resume resources in Azure portal or through API  |You can use to embed content in SharePoint Online and Microsoft Teams (excludes mobile app) |Combine embedding in applications and use the Power BI Service in the same capacity |

### What are the prerequisites to create a PBIE capacity in Azure?

* Sign in to your organizational directory (Microsoft accounts aren't supported).
* You need to have a Power BI tenant, that is, at least one user in your directory has signed up for Power BI. 
* You need to have an Azure subscription in your organizational directory.

### How can I monitor Power BI Embedded capacity consumption?

* Using the [Power BI Admin portal](../service-admin-portal.md#power-bi-embedded).

* Downloading the [metric app](https://review.docs.microsoft.com/power-bi/service-admin-premium-monitor-capacity) in Power BI.

* Using [Azure diagnostic logging](azure-pbie-diag-logs.md).

### Can my capacity scale automatically to adjust to my app consumption?

While there's no automatic scaling now, all the APIs are available to scale at any time.

### Why creating/scaling/resuming a capacity results in putting the capacity into a suspended state?

Capacity provisioning (scale/resume/create) may fail. You can use the Get Details API to check a capacity's ProvisioningState: [Capacities - Get Details](https://docs.microsoft.com/rest/api/power-bi-embedded/capacities/getdetails).

### Can I only create Power BI Embedded capacities in a specific region?

With the [Multi-geo (Preview)](embedded-multi-geo.md) feature, you can purchase a [Power BI Embedded capacity](azure-pbie-create-capacity.md) in a different region than your Power BI home tenant location

### Why can’t I see a workspace although I have permissions?

When a user is granted permissions to a workspace, app, or artifact, it might not be immediately available through API calls.
The result can either be a missing artifact in a 'GET' API response, or an error when trying to use the artifact.
The user can resolve this issue by calling [refreshUserPermissions API](https://docs.microsoft.com/rest/api/power-bi/users/refreshuserpermissions), which updates the user permissions.


### How can I find my PBI tenant region?

You can use the PBI portal to find your PBI Tenant region.

https://app.powerbi.com/ > ? > About Power BI

![About Power BI](media/embedded-faq/about-01.png)
![Tenant region](media/embedded-faq/tenant-location-01.png)

### What does the Cloud Solution Provider (CSP) channel support?

* You can create PBIE for your tenant with subscription type CSP
* Partner account can sign in to customer tenant and purchase PBIE for customer tenant, specify customer tenant user as Power BI capacity admin

### Why do I get an unsupported account message?

Power BI requires you to sign up with an organizational account. Trying to sign up for Power BI using a Microsoft account isn't supported.

### Can I use APIs to create and manage Azure capacities?

Yes, there are Powershell cmdlets and Azure Resource Manager REST APIs you can use to create and manage PBIE resources.

* [Rest APIs](https://docs.microsoft.com/rest/api/power-bi-embedded/) 
* [Powershell cmdlets](https://docs.microsoft.com/powershell/module/azurerm.powerbiembedded/)

### What is the PBI Embedded dedicated capacity role in a PBI Embedded solution?

To [promote your solution to production](embed-sample-for-customers.md#move-to-production), you need to assign the Power BI content (app workspace) your application uses to a Power BI Embedded (A SKU) capacity.

### In what Azure regions is PBI Embedded available?

[PAM](https://ecosystemmanager.azurewebsites.net/home) (EcoManager) - see Product availability manager

Available regions (16 - same regions as Power BI)

* US (6) - East US, East US 2, North Central US, South Central US, West US, West US 2
* Europe (2) - North Europe, West Europe
* Asia Pacific (2) - Southeast Asia, East Asia
* Brazil (1) - Brazil South
* Japan (1) - Japan East
* Australia (1) - Australia Southeast
* India (1) - West India
* Canada (1) - Canada Central
* United Kingdom (1) - UK South

### What is Power BI Embedded's authentication model?

Power BI Embedded continues to use Azure AD for master user (a designated Power BI Pro licensed user) authentication, or with [service principal](embed-service-principal.md) for authenticating the application inside Power BI.  

 An ISV can implement their own authentication and authorization for their applications.

You can use your existing directory if you already have an Azure AD tenant. You can also create a new Azure AD tenant for your embedded application content security.

To get an AAD token, you can use one of the [Azure Active Directory Authentication Libraries](https://docs.microsoft.com/azure/active-directory/develop/active-directory-authentication-libraries). There are client libraries available for multiple platforms.

### My Application already uses AAD for User Authentication. How can we use this Identity when authenticating to Power BI in a "User Owns Data" scenario?

It's standard OAuth on-behalf-of flow (<https://docs.microsoft.com/azure/active-directory/develop/web-api>). You need to configure your application to require Power BI service (with the required scopes) permissions. Once you have a user token to your app, you simply call to ADAL API AcquireTokenAsync using the user access token and specify the Power BI resource URL as the resource ID:

```csharp
var context = new AD.AuthenticationContext(authorityUrl);
var userAssertion = new AD.UserAssertion(userAccessToken);
var clientAssertion = new AD.ClientAssertionCertificate(MyAppId, MyAppCertificate)
var authenticationResult = await context.AcquireTokenAsync(resourceId, clientAssertion, userAssertion);
```

### What object ID is the service principal object ID?

The *Object ID* from the main screen of a registered app is the object ID for the app.

The object ID found in the *Managed application in local directory > Properties* section is the service principal object ID you need to use. This object ID is to reference a service principal for operations or to make changes to the service principal object ID. Such as applying a service principal as an admin to a workspace.

### How is Power BI Embedded different from other Azure services?

You must have a Power BI account before purchasing Power BI Embedded in Azure. Your Power BI Embedded deployed region determines your Power BI account. Manage your Power BI Embedded resource in Azure to:

* Scale up/down
* Add capacity admins
* Pause/resume service

Use PowerBI.com to assign/un-assign workspaces to your Power BI Embedded capacity.

### What content pack data types can you embed?

You *can't* embed **Dashboards** and **tiles** built from content pack datasets. However, you *can* embed **reports** built from a content pack dataset.

### What is the difference between using row-level security (RLS) vs. JavaScript filters?

There’s often confusion around when to use RLS versus JavaScript filters, because one method is about controlling what a specific user can see, and the other is about optimizing the user's view.

For RLS, the ISV developer controls the data filtering as part of the model creation and embed token generation. The end user sees only what the ISV allows the user to see. In this case, the user can choose to see less than what's being filtered, but won’t be able to bypass the RLS configuration and see more than what's allowed.

For client-side filtering (JavaScript), the ISV might decide what the end user sees at the initial view, but they can't control changes the end user might apply to the view itself. Since user Javascript client code can trigger data filtering on the backend, it can't be considered secure.

Reference [RLS vs JavaScript filters](embedded-row-level-security.md#using-rls-vs-javascript-filters) for more details.

### How do I manage permissions for service principals with Power BI?

Once you enable [service principal](embed-service-principal.md) to use with Power BI, the application's AD permissions don't take effect anymore. The application's permissions are then managed through the Power BI admin portal.

Service principals inherit the permissions for all Power BI tenant settings from their security group. To restrict permissions, create a dedicated security group for service principals and add it to the **Except specific security groups** list for the relevant, enabled Power BI settings.

This situation matters when you add the service principal as an **admin** to the new workspace. You can manage this task through the [APIs](https://docs.microsoft.com/rest/api/power-bi/groups/addgroupuser) or with the Power BI service.

### When to use an application ID vs. a service principal object ID?

The **[application ID](embed-sample-for-customers.md#application-id)** is used to create the access token when passing the application ID for authentication.

To reference a service principal for operations or to make changes you use the **[service principal object ID](embed-service-principal.md#how-to-get-the-service-principal-object-id)** — for example, applying a service principal as an admin to a workspace.

### Can you manage an On-premises data gateway with service principal?

You can't manage an On-premises data gateway (data gateway) using [service principal](embed-service-principal.md) like you can with a master account.

With a master account, you can install a data gateway, add users to the gateway, connect to data sources, and do other administrative tasks.

With service principal, you can configure [row-level security (RLS)](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal-preview) using an SQL Server Analysis Services (SSAS) on-premises live connection data source. This way you can manage users and their access to data in SSAS when integrating with **Power BI Embedded** using a service principal.

### Can you sign into the Power BI service with service principal?

No - you can't sign into Power BI using service principal.

Also, you can’t consume content as a user in external applications (SaaS embed), only when you generate an embed token.

### What are the best practices to improve performance?

[Power BI Embedded performance](embedded-performance-best-practices.md)

## Licensing

### How do I purchase Power BI Embedded?

Power BI Embedded is available through Azure.

### What happens if I already purchased Power BI Premium and now I want some Power BI Embedded in Azure benefits?

Customers continue to pay for any existing Power BI Premium purchases until the end of their current agreement term and then, at that point, may switch their Power BI Premium purchases as necessary.

### Do I still have to buy Power BI Premium to get access to Power BI Embedded?

No, Power BI Embedded includes the Azure-based capacity that you need to deploy and distribute your solution to customers.

### What’s the purchase commitment for Power BI Embedded?

Customers may change their usage on an hourly basis. There's no monthly or annual commitment for the Power BI Embedded service.

### How does the usage of Power BI Embedded show up on my bill?

Power BI Embedded bills on a predictable hourly rate based on the type of node(s) deployed. You are billed as long as your resource is active, even if there's no usage. You need to pause your resource to stop billing.

### Who needs a Power BI Pro license for Power BI Embedded and why?

You need a Power BI Pro license or [service principal](embed-service-principal.md) to use REST APIs. To add reports to a Power BI workspace, an analyst needs either a Power BI Pro license or service principal. To manage  Power BI tenant and capacity, an admin is required have a Power BI Pro license.

Because Power BI Embedded allows Power BI portal use for managing and validating embedded content, the Power BI Pro license is required to authenticate the app inside PowerBI.com to get access to the reports in the right repositories.

However, for [creating/editing embedded reports](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Create-Report-in-Embed-View) inside your application, the end user does not need a Pro license as the user isn't required to be a Power BI user at all.

### Can I get started for free?

Yes, you can use your [Azure credits](https://azure.microsoft.com/free/) for Power BI Embedded.

### Can I get a trial experience for Power BI Embedded in Azure?

Since Power BI Embedded is a part of Azure, it's possible to use the service with the [$200 credit received when signing up for Azure](https://azure.microsoft.com/free/).

### Is Power BI Embedded available for national clouds (US Government, Germany, China)?

Power BI Embedded is also available for [national clouds](embed-sample-for-customers-national-clouds.md).

### Is Power BI Embedded available for non-profits and educational?

There's no special Azure pricing for non-profit and educational entities.

## Power BI Workspace Collection

### What is Power BI Workspace Collection?

**Power BI Workspace Collection** (**Power BI Embedded** Version 1) is a solution based on the **Power BI Workspace Collection** Azure resource. This solution allows you to create **Power BI Embedded** applications for your customers using Power BI content under the **Power BI Workspace Collection** solution, dedicated APIs, and workspace collection keys to authenticate the application to Power BI.

### Can I migrate from Power BI Workspace Collection to Power BI Embedded?

1. You can use the migration tool to clone **Power BI Workspace Collection** content to Power BI - https://docs.microsoft.com/power-bi/developer/migrate-from-powerbi-embedded#content-migration.

2. Start with the **Power BI Embedded** application POC that uses Power BI content.

3. Once you are ready for production, purchase a **Power BI Embedded** dedicated capacity and assign your Power BI content (workspace) to that capacity.

    > [!Note]
    > You can continue to use **Power BI Workspace Collection** while building in parallel with a **Power BI Embedded** solution. Once you are ready, you can move your customer to the new **Power BI Embedded** solution and retire the **Power BI Workspace Collection** solution.

For more information,  please reference [How to migrate Power BI Workspace Collection content to Power BI Embedded](https://docs.microsoft.com/power-bi/developer/migrate-from-powerbi-embedded)

### Is Power BI Workspace Collection on a deprecation path?

Yes, but customers that are already using the **Power BI Workspace Collection** solution can continue to use it until deprecation. Customers can also create new workspace collections and any **Power BI Embedded** applications that still use the **Power BI Workspace Collection** solution.

However, this also means that new features aren't added to any **Power BI Workspace Collection** solutions. We encourage customers to plan their migration to the new **Power BI Embedded** solution.

### When is Power BI Workspace Collection support discontinued?

Customers that are already using the **Power BI Workspace Collections** solution can continue to use it until the end of June 2018 or until the end of their support agreement.

### In what regions can I create a PBI Workspace Collection?

The available regions are Australia Southeast, Brazil South, Canada Central, East US 2, Japan East, North Central US, North Europe, South Central US, Southeast Asia, UK South, West Europe, West India, and West US.

### Why should I migrate from PBI Workspace Collection to Power BI Embedded?

There are some new **Power BI Embedded** solution features and capabilities  that you can't do with **Power BI Workspace Collection**.

Some of the features are:
* All the PBI data sources are supported. Only  two **Power BI Workspace Collection** data sources are supported. 
* New features such as Q&A, refresh, bookmarks, embedding dashboards & tiles, and custom menus are only supported in the **Power BI Embedded** solution.
* Capacity billing model.

## Embedding setup tool

### What is the Embedding setup tool?

The [Embedding setup tool](https://aka.ms/embedsetup) allows you to quickly get started and download a sample application to begin embedding with Power BI.

### Which solution should I choose?

* [Embedding for your customers](embedding.md#embedding-for-your-customers) provides the ability to embed dashboards and reports to users who don't have an account for Power BI. Run the [Embed for your customers](https://aka.ms/embedsetup/AppOwnsData) solution.
* [Embedding for your organization](embedding.md#embedding-for-your-organization) allows you to extend the Power BI service. Run the [Embed for your organization](https://aka.ms/embedsetup/UserOwnsData) solution.

### I've downloaded the sample app, which solution do I choose?

If you're working with the **Embed for your customers** experience, save and unzip the *PowerBI-Developer-Samples.zip* file. Then open the *PowerBI-Developer-Samples-master\App Owns Data* folder and run the *PowerBIEmbedded_AppOwnsData.sln* file.

If you're working with the **Embed for your organization** experience, save and unzip the *PowerBI-Developer-Samples.zip* file. Then open the *PowerBI-Developer-Samples-master\User Owns Data\integrate-report-web-app* folder and run the *pbi-saas-embed-report.sln* file.

### How can I edit my registered application?

To learn how to edit Azure AD-registered applications, see [Quickstart: Update an application in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/quickstart-v1-update-azure-ad-app).

### How can I edit my Power BI user profile or data?

You can learn how to edit your Power BI data [here](https://docs.microsoft.com/power-bi/service-basic-concepts).

For more information, see [Troubleshooting your embedded application](embedded-troubleshoot.md).

More questions? [Try the Power BI Community](http://community.powerbi.com/)
