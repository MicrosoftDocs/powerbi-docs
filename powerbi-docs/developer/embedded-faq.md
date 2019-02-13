---
title: Frequently asked questions about Power BI Embedded
description: Browse a list of frequently asked questions and answers about Power BI Embedded.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 02/05/2019 
---

# Frequently asked questions about Power BI Embedded

* If you have other questions, [try asking the Power BI Community](http://community.powerbi.com/).
* Still have an issue? Visit the [Power BI support page](https://powerbi.microsoft.com/support/).

## General

### What is Power BI Embedded?

[Microsoft Power BI Embedded (PBIE)](azure-pbie-what-is-power-bi-embedded.md) allows application developers to embed stunning, fully interactive reports, into applications without the time and expense of building their own data visualizations and controls from the ground-up.

### Who is the target audience for Power BI Embedded?

Developers and software companies making their applications referred to as independent software vendors (ISVs).

### How is Power BI Embedded different from Power BI the service?

Power BI Embedded is intended for ISVs or developers who are building applications and want to embed visuals into those applications to help their customers make decisions without building an analytics’ solution from the ground up. [Embedded analytics](embedding.md) enables business users to access the business data and perform queries to generate insights using this data within the application.

Power BI is a software-as-a-service analytics solution that gives organizations a single view of their most critical business data.

### What is the difference between Power BI Premium and Power BI Embedded?

Power BI Premium is capacity geared toward enterprises, who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers. Power BI Premium helps your organization make decisions. Power BI Premium is a SaaS product and comes with the ability for users to consume content through the Power BI portal, mobile app, and through internally developed apps.

Power BI Embedded is for ISVs or developers who are building applications and want to embed visuals into those applications. Power BI Embedded helps your customers make decisions because Power BI Embedded is for application developers, customers of that application can consume content stored on Power BI Embedded capacity, including anyone inside or outside the organization. Power BI Embedded capacity content can't be shared through one-click publish to Web or one-click publish to SharePoint, and it doesn't support SSRS reports.

### What is the Microsoft recommendation for when a customer should buy Power BI Premium vs. Power BI Embedded?

Microsoft recommends that enterprises buy Power BI Premium, an enterprise-grade, self-service cloud BI solution, and ISVs buy Power BI Embedded, cloud-powered embedded analytics components. However, there are no restrictions on which product a customer can buy.

There may be some cases where an ISV (typically large) wants to use a P SKU to get the additional benefits of the pre-packaged Power BI service within their organization as well as embed in their applications. Some enterprises may decide to use A SKUs in Azure if they're only interested in building line-of-business applications and embedding analytics into them and aren't interested in using the pre-packaged Power BI service.

### How many embed tokens can I create?

Embed tokens with PRO license are intended for development testing, so the number of embed tokens a Power BI master account or [service principal](embed-service-principal.md) can generate is limited. [Purchase a capacity](#technical) for embedding in a production environment. There's no limit to how many embed tokens you can generate when a capacity is purchased. Go to [Available Features](https://docs.microsoft.com/rest/api/power-bi/availablefeatures) to check the usage value that indicates the current embedded usage in percentage.

## Technical

### What is the difference between the A SKUs in Azure and the EM SKUs in Office 365?

PowerBI.com is an enterprise solution that includes many capabilities like social collaboration, email subscription, and other features. in a Software as a Service offering

Power BI Embedded is a set of APIs available for developers to create an embedded analytics solution in a Platform as a Service offering. For the Embedded analytics scenario, PowerBI.com helps ISVs and developers manage their embedded analytics solution content and tenant level settings.

Here is a partial list of differences you may use with each.

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
|Differentiation |Full elasticity- can scale up/ down, pause/ resume resources in Azure portal or through API  |Can be used to embed content in SharePoint Online and Microsoft Teams (excludes mobile app) |Combine embedding in applications and use the Power BI Service in the same capacity |

### What are the prerequisites to create a PBIE capacity in Azure?

* Sign in to your organizational directory (MSA accounts are not supported).
* You need to have a Power BI tenant, that is, at least one user in your directory has signed up to Power BI. 
* You need to have an Azure subscription in your organizational directory.

### How can I monitor Power BI Embedded capacity consumption?

* Using the [Power BI Admin portal](../service-admin-portal.md#power-bi-embedded).

* Downloading the [metric app](https://review.docs.microsoft.com/power-bi/service-admin-premium-monitor-capacity) in Power BI.

* Using [Azure diagnostic logging](azure-pbie-diag-logs.md).

### Can my capacity scale automatically to adjust to the consumption of my app?

While there is no automatic scaling now, all the APIs are available to scale at any time.

### Why creating/scaling/resuming a capacity results in putting the capacity into a suspended state?

The provisioning of a capacity (scale/resume/create) may fail. The caller of the provisioning call should check the ProvisioningState of a capacity using Get Details API: [Capacities - Get Details](https://docs.microsoft.com/rest/api/power-bi-embedded/capacities/getdetails).

### Can I only create Power BI Embedded capacities in a specific region?

With the [Multi-geo (Preview)](embedded-multi-geo.md) feature, you can purchase a [Power BI Embedded capacity](azure-pbie-create-capacity.md) in a different region than your Power BI home tenant location

### How can I find what is my PBI tenant region?

You can use the PBI portal to understand what is your PBI Tenant region.

https://app.powerbi.com/ > ? > About Power BI

![About Power BI](media/embedded-faq/about-01.png)
![Tenant region](media/embedded-faq/tenant-location-01.png)

### What is supported by the Cloud Solution Provider (CSP) channel?

* You can create PBIE for your tenant with subscription type CSP
* Partner account can sign in to customer tenant and purchase PBIE for customer tenant, specify customer tenant user as Power BI capacity admin

### Why do I get an unsupported account message?

Power BI requires you to sign up with an organizational account. Trying to sign up for Power BI using an MSA (Microsoft account) isn't supported.

### Can I use APIs to create & manage Azure capacities?

Yes, there are Powershell cmdlets and Azure Resource Manager APIs you can use to create & manage PBIE resources.

* Rest APIs - https://docs.microsoft.com/rest/api/power-bi-embedded/
* Powershell cmdlets - https://docs.microsoft.com/powershell/module/azurerm.powerbiembedded/

### What is the PBI Embedded dedicated capacity role in a PBI Embedded solution?

To [promote your solution to production](https://docs.microsoft.com/power-bi/developer/embedding-content#step-3-promote-your-solution-to-production), you need the Power BI content (app workspace that you are using in your application to be assigned to a Power BI Embedded (A SKU) capacity.

### What are the Azure regions PBI Embedded is available?

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

### What is the authentication model for Power BI Embedded?

Power BI Embedded continues to use Azure AD for authentication of the master user (a designated Power BI Pro licensed user), or with [service principal](embed-service-principal.md) for authenticating the application inside Power BI.  

The authentication and authorization of application users implemented by the ISV, the ISV can implement their authentication for their applications.

If you already have an Azure AD tenant, you can use your existing directory, or you can create a new Azure AD tenant for your embedded application content security.

To get an AAD token, you can use one of the [Azure Active Directory Authentication Libraries](https://docs.microsoft.com/azure/active-directory/develop/active-directory-authentication-libraries). There are client libraries available for multiple platforms.

### My Application already uses AAD for User Authentication. How can we use this Identity when authenticating to Power BI in a "User Owns Data" scenario?

It is standard OAuth on-behalf-of flow (https://docs.microsoft.com/azure/active-directory/develop/active-directory-authentication-scenarios#web-application-to-web-api)
The Application needs to be configured to require permissions to Power BI service (with the required scopes), and once you have a user token to your app, you simply call to ADAL API AcquireTokenAsync using the user access token and specify Power BI resource URL as the resource ID, see below a code snippet showing how this can be done:

```csharp
var context = new AD.AuthenticationContext(authorityUrl);
var userAssertion = new AD.UserAssertion(userAccessToken);
var clientAssertion = new AD.ClientAssertionCertificate(MyAppId, MyAppCertificate)
var authenticationResult = await context.AcquireTokenAsync(resourceId, clientAssertion, userAssertion);
```

### How is Power BI Embedded different from other Azure services?

The ISV/developer must have a Power BI account before the purchase of Power BI Embedded in Azure. Your Power BI Embedded deploys region determines your Power BI account. Manage your Power BI Embedded resource in Azure to:

* Scale up/down
* Add capacity admins
* Pause/resume of service

Use PowerBI.com to assign/un-assign workspaces to your Power BI Embedded capacity.

### What deploy regions are supported?

Australia Southeast, Brazil South, Canada Central, East US 2, India West, Japan East, North Central US, North Europe, South Central US, Southeast Asia, UK South, West Europe, West US, and West US 2.

### What type of content pack data can be embedded?

**Dashboards** and **tiles** that are built from content pack datasets *cannot* be embedded, however, **reports** built from a content pack dataset *can* be embedded.

### What is the difference between using RLS vs. JavaScript filters?

There’s often confusion around when to use RLS vs. JavaScript filters, because one method is about controlling what a specific user can see, and the other is about optimizing the user's view.

For RLS, the ISV developer controls the data filtering as part of the model creation and embed token generation. The end user sees only what the ISV allows the user to see. In this case, the user can choose to see less than what's being filtered, but won’t be able to bypass the RLS configuration and see more than what's allowed.

For client-side filtering (JavaScript), the ISV might decide what the end user sees at the initial view, but the ISV cannot control changes the end user might apply to the view itself. Even though data filtering can happen on the backend, it’s triggered by the JavaScript client code, and therefore it can be changed by an end user, and cannot be considered secure.

Reference [RLS vs JavaScript filters](embedded-row-level-security.md#using-rls-vs-javascript-filters) for more details.

### How do I manage permissions for service principals with Power BI?

Once you enable [service principal](embed-service-principal.md) to be used with Power BI, the application's AD permissions don't take effect anymore. The application's permissions are then managed through the Power BI admin portal.

Service principals inherit the permissions for all Power BI tenant settings from their security group. To restrict permissions, create a dedicated security group for service principals and add it to the 'Except specific security groups' list for the relevant, enabled Power BI settings.

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

### What happens if I already purchased Power BI Premium and now I want some of the benefits of Power BI Embedded in Azure?

Customers continue to pay for any existing Power BI Premium purchases until the end of their current agreement term and then may switch their Power BI Premium purchases as necessary at that point.

### Do I still have to buy Power BI Premium to get access to Power BI Embedded?

No, Power BI Embedded includes the Azure-based capacity that you need to deploy and distribute your solution to customers.

### What’s the purchase commitment for Power BI Embedded?

Customers may change their usage on an hourly basis. There is no monthly or annual commitment for the Power BI Embedded service.

### How does the usage of Power BI Embedded show up on my bill?

Power BI Embedded bills on a predictable hourly rate based on the type of node(s) deployed. As long as your resource is active, you are billed even if there is no usage. To stop being billed, you need to pause your resource actively.

### Who needs a Power BI Pro license for Power BI Embedded and why?

Any developer that requires the use of the REST APIs needs a Power BI Pro license or [service principal](embed-service-principal.md). Any analyst that needs to add reports to a Power BI workspace can either have a Power BI Pro license or use service principal. Any tenant admin that needs to manage the Power BI tenant and capacity is required to have a Power BI Pro license.

Because Power BI Embedded allows the use of the Power BI portal for managing and validating embedded content, the Power BI Pro license is required to authenticate the App inside PowerBI.com to get access to the reports in the right repositories.

However, for [creating/editing embedded reports](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Create-Report-in-Embed-View) inside your application, the end user does not need a Pro license as the user isn't required to be a Power BI user at all.

### Can I get started for free?

Yes, you can use your [Azure credits](https://azure.microsoft.com/free/) for Power BI Embedded.

### Can I get a trial experience for Power BI Embedded in Azure?

Since Power BI Embedded is a part of Azure, it is possible to use the service with the [$200 credit received when signing up for Azure](https://azure.microsoft.com/free/).

### Is Power BI Embedded available for sovereign clouds (US Government, Germany, China)?

Power BI Embedded is available for some [sovereign clouds](embed-sample-for-customers-sovereign-clouds.md). It still is **NOT** available for the China cloud.

### Is Power BI Embedded available for non-profits and educational?

Non-profit and educational entities can purchase Azure. There is no special pricing for these types of customers in Azure.

## Power BI Workspace Collection

### What is Power BI Workspace Collection?

**Power BI Workspace Collection** (**Power BI Embedded** Version 1) is a solution that is based on the **Power BI Workspace Collection** Azure resource. This solution allows you to create **Power BI Embedded** applications for your customers using Power BI content under the **Power BI Workspace Collection** solution, dedicated APIs, and workspace collection keys to authenticate the application to Power BI.

### Can I migrate from Power BI Workspace Collection to Power BI Embedded?

1. You can use the migration tool to clone **Power BI Workspace Collection** content to Power BI - https://docs.microsoft.com/power-bi/developer/migrate-from-powerbi-embedded#content-migration.

2. Start with the **Power BI Embedded** application POC that uses Power BI content.

3. Once you are ready for production, purchase a **Power BI Embedded** dedicated capacity and assign your Power BI content (workspace) to that capacity.

    > [!Note]
    > You can continue to use **Power BI Workspace Collection** while building in parallel with a **Power BI Embedded** solution. Once you are ready, you can move your customer to the new **Power BI Embedded** solution and retire the **Power BI Workspace Collection** solution.

For more information,  please reference [How to migrate Power BI Workspace Collection content to Power BI Embedded](https://docs.microsoft.com/power-bi/developer/migrate-from-powerbi-embedded)

### Is Power BI Workspace Collection on a path to be deprecated?

Yes, but customers that are already using the **Power BI Workspace Collection** solution can continue to use it until it is deprecated. Customers can also create new workspace collections and any **Power BI Embedded** applications that still use the **Power BI Workspace Collection** solution.

However, this also means that new features aren't added to any **Power BI Workspace Collection** solutions and that customers are encouraged to plan their migration to the new **Power BI Embedded** solution.

### When is Power BI Workspace Collection support discontinued?

Customers that are already using the **Power BI Workspace Collections** solution can continue to use it until the end of June 2018 or until the end of their support agreement.

### In what regions can PBI Workspace Collection be created?

The available regions are Australia Southeast, Brazil South, Canada Central, East US 2, Japan East, North Central US, North Europe, South Central US, Southeast Asia, UK South, West Europe, West India, and West US.

### Why should I migrate from PBI Workspace Collection to Power BI Embedded?

Some new features and capabilities are introduced in the **Power BI Embedded** solution that you can't do with **Power BI Workspace Collection**.

Some of the features are:

* All the PBI data sources are supported as opposed to the two data sources that are with **Power BI Workspace Collection**). 
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

You can learn how to edit AAD registered applications [here](https://docs.microsoft.com/azure/active-directory/develop/active-directory-integrating-applications#updating-an-application).

### How can I edit my Power BI user profile or data?

You can learn how to edit your Power BI data [here](https://docs.microsoft.com/power-bi/service-basic-concepts).

For more information, see [Troubleshooting your embedded application](embedded-troubleshoot.md).

More questions? [Try the Power BI Community](http://community.powerbi.com/)