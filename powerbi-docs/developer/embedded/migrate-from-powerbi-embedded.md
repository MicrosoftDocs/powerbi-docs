---
title: How to migrate Power BI Workspace Collection content to the Power BI embedded analytics
description: Learn how to migrate from Power BI Workspace Collection to the Power BI Embedded and leverage advances for embedding in apps.
author: KesemSharabi
ms.author: kesharab
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/30/2018
---

# How to migrate Power BI Workspace Collection content to Power BI Embedded

Learn how to migrate from Power BI Workspace Collection to Power BI Embedded and leverage advances for embedding in apps.

Microsoft recently [announced Power BI Embedded](https://powerbi.microsoft.com/blog/power-bi-embedded-capacity-based-skus-coming-to-azure/), a new capacity-based licensing model that increases flexibility for how users access, share and distribute content. The offering also delivers additional scalability and performance.

With Power BI Embedded, you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and workspaces – when embedding your content. Moving forward you'll be able to start with Power BI Desktop and move to deployment with Power BI Embedded.

The current Power BI Workspace Collection will continue to be available for a limited time. Customers under an Enterprise Agreement will have access through the expiration of their existing agreements; customers that acquired Power BI Workspace Collection through Direct or CSP channels will maintain access for one year from the General Availability release of Power BI Embedded.  This article will provide some guidance for migrating from Power BI Workspace Collection to the new Power BI Embedded experience and what to expect for changes in your application.

> [!IMPORTANT]
> While the migration will take a dependency on Power BI Embedded, there is not a dependency on Power BI for the users of your application when using an **embed token**. They do not need to sign up for Power BI to view the embedded content in your application. You can use this embedding approach to Embedded non-Power BI users.

![Embed flow](media/migrate-from-powerbi-embedded/powerbi-embed-flow.png)

Before you get started migrating to the new Power BI Embedded, you can quickly go through a walkthrough that helps you set up your new Power BI Embedded environment using the [Embedding setup tool](https://aka.ms/embedsetup).

Choose the solution that is right for you:
* **Embed for your customers** - when you are interested in an *app owns data* solution. [Embedding for your customers](embedded-analytics-power-bi.md#embed-for-your-customers) provides the ability to embed dashboards and reports to users who don't have an account for Power BI. 

* **Embed for your organization** - when you are interested in a *user owns data* solution. [Embedding for your organization](embedded-analytics-power-bi.md#embed-for-your-organization) allows you to extend the Power BI service.

## Prepare for the migration

There are a few things you need to do to prepare for migrating from Power BI Workspace Collection to Power BI Embedded. You will need a tenant available, along with a user that has a Power BI Pro license.

1. Make sure you have access to an Azure Active Directory (Azure AD) tenant.

    You need to determine which tenant setup to use.

   * Use your existing corporate Power BI tenant?
   * Use a separate tenant for your application?
   * Use a separate tenant for each customer?

     If you decide to create a new tenant for your application, or each customer, see [Create an Azure Active Directory tenant](create-an-azure-active-directory-tenant.md) or [How to get an Azure Active Directory tenant](/azure/active-directory/develop/active-directory-howto-tenant).
2. Create a user within this new tenant that will act as your application "master" account. That account needs to sign up for Power BI and needs to have a Power BI Pro license assigned to it.

## Accounts within Azure AD

The following accounts will need to exist within your tenant.

> [!NOTE]
> These accounts will need to have Power BI Pro licenses in order to use workspaces.

1. A Power BI admin.

    It is recommended that this user be a member of all workspaces created for the purpose of embedding.

2. Accounts for analysts that will create content.

    These users should be assigned to workspaces as needed.

3. An application *master* user account, or Embedded account.

    The applications backend will store the credentials for this account and use it for acquiring an Azure AD token for use with the Power BI REST APIs. This account will be used to generate the embed token for the application. This account also needs to be an admin of the workspaces created for embedding.

> [!NOTE]
> This is just a regular user account in your organization that will be used for the purposes of embedding.

## App registration and permissions

You will need to register an application within Azure AD and grant certain permissions.

### Register an application

You will need to register your application with Azure AD in order to make REST API calls. This includes going to the Azure portal to apply additional configuration in addition to the Power BI app registration page. For more information, see [Register an Azure AD app to embed Power BI content](register-app.md).

You should register the application using the application **master** account.

## Create workspaces (Required)

You can take advantage of workspaces to provide better isolation if your application is servicing multiple customers. Dashboards and reports would be isolated between your customers. You could then use a Power BI account per workspace to further isolate application experiences between your customers.

> [!IMPORTANT]
> You cannot use a personal workspace to take advantage of embedding to non-Power BI users.

You will need a user that has a Pro license in order to create a workspace within Power BI. The Power BI user that creates the workspace will be an admin of that workspace by default.

> [!NOTE]
> The application *master* account needs to be an admin of the workspace.

## Content migration

Migrating your content from your workspace collections to Power BI Embedded can be done in parallel to your current solution and doesn't require any downtime.

A **migration tool** is available for you to use in order to assist with copying content from Power BI Workspace Collection to Power BI Embedded. Especially if you have a lot of content. For more information, see [Power BI Embedded migration tool](migrate-tool.md).

Content migration relies mainly on two APIs.

1. Download PBIX - this API can download PBIX files which were uploaded to Power BI after October 2016.
2. Import PBIX - this API uploads any PBIX to Power BI.

For some related code snippets, see [Code snippets for migrating content from Power BI Workspace Collection](migrate-code-snippets.md).

### Report types

There are several types of reports, each requiring a somewhat different migration flow.

#### Cached dataset & report

Cached datasets refer to PBIX files that had imported data as opposed to a live connection or DirectQuery connection.

**Flow**

1. Call Download PBIX API from PaaS workspace.
2. Save PBIX.
3. Call Import PBIX to SaaS workspace.

#### DirectQuery dataset & report

**Flow**

1. Call GET `https://api.powerbi.com/v1.0/collections/{collection_id}/workspaces/{wid}/datasets/{dataset_id}/Default.GetBoundGatewayDataSources` and save connection string received.
2. Call Download PBIX API from PaaS workspace.
3. Save PBIX.
4. Call Import PBIX to SaaS workspace.
5. Update connection string by calling - POST  `https://api.powerbi.com/v1.0/myorg/datasets/{dataset_id}/Default.SetAllConnections`
6. Get GW and datasource identifiers by calling - GET `https://api.powerbi.com/v1.0/myorg/datasets/{dataset_id}/Default.GetBoundGatewayDataSources`
7. Update user's credentials by calling - PATCH `https://api.powerbi.com/v1.0/myorg/gateways/{gateway_id}/datasources/{datasource_id}`

#### Old dataset & reports

These are datasets/reports created before October 2016. Download PBIX doesn't support PBIXs which were uploaded before October 2016

**Flow**

1. Get PBIX from your development environment (your internal source control).
2. Call Import PBIX to SaaS workspace.

#### Push Dataset & report

Download PBIX doesn't support *Push API* datasets. Push API dataset data can't be ported from PaaS to SaaS.

**Flow**

1. Call "Create dataset" API with dataset Json to create dataset in SaaS workspace.
2. Rebuild report for the created dataset*.

It is possible, using some workarounds, to migrate the push api report from PaaS to SaaS by trying the following.

1. Uploading some dummy PBIX to PaaS workspace.
2. Clone the push api report and bind it to the dummy PBIX from step 1.
3. Download push API report with the dummy PBIX.
4. Upload dummy PBIX to your SaaS workspace.
5. Create push dataset in your SaaS workspace.
6. Rebind report to push api dataset.

## Create and upload new reports

In addition to the content you migrated from the Power BI Workspace Collection, you can create your reports and datasets using Power BI Desktop and then publish those reports to a workspace. The end user publishing the reports need to have a Power BI Pro license in order to publish to a workspace.

## Rebuild your application

1. You will need to modify your application to use the Power BI REST APIs and the report location inside powerbi.com.
2. Rebuild your AuthN/AuthZ authentication using the *master* account for your application. You can take advantage of using an [embed token](/rest/api/power-bi/embedtoken) to allow this user to act on behalf of other users.
3. Embed your reports from powerbi.com into your application.

## Map your users to a Power BI user

Within your application, you will map users that you manage within the application to a *master* Power BI credential for the purposes of your application. The credentials for this Power BI *master* account will be stored within your application and be used to creating embed tokens.

## What to do when you are ready for production

When you are ready to move to production, you will need to do the following.

* If you are using a separate tenant for development, then you will need to make sure your workspaces, along with dashboards and reports, are available in your production environment. You will also need to make sure that you created the application in Azure AD for your production tenant and assigned the proper app permissions as indicated in Step 1.
* Purchase a capacity that fits your needs. To better understand how the amount and type of capacity you need, see the [Power BI Embedded analytics capacity planning whitepaper](./embedded-capacity-planning.md). You can [purchase capacity](https://portal.azure.com/#create/Microsoft.PowerBIDedicated) in Azure.
* Edit the workspace and assign it to a Premium capacity under advanced.

    ![Premium capacity](media/migrate-from-powerbi-embedded/powerbi-embedded-premium-capacity02.png)

* Deploy your updated application to production and begin embedding reports from the Power BI Embedded.

## After migration

You should do some cleanup within Azure.

* Remove all workspaces off of the deployed solution within the Azure Embedded of Power BI Workspace Collection.
* Delete any Workspace Collections that exist within Azure.

## Next steps

[Embedding with Power BI](embedded-analytics-power-bi.md)  
[Power BI Workspace Collection migration tool](migrate-tool.md)  
[Code snippets for migrating content from Power BI Workspace Collection](migrate-code-snippets.md)  
[How to embed your Power BI dashboards, reports and tiles](embed-sample-for-your-organization.md)  
[Power BI Premium - what is it?](../../admin/service-premium-what-is.md)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
[Workspace Collection analytics capacity planning whitepaper](./embedded-capacity-planning.md)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)