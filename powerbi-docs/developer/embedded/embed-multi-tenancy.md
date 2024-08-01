---
title: Use service principal profiles to manage customer data in multitenant apps
description: Create, import, update, and assign multitenant workspaces in embedded analytics using service principal profiles.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 08/01/2024
---

# Service principal profiles for multitenancy apps in Power BI Embedded

This article explains how an [ISV](pbi-glossary.md#independent-software-vendor-isv) or any other Power BI Embedded app owner with many customers can use service principal profiles to map and manage each customer's data as part of their Power BI *embed for your customers* solution. Service principal profiles allow the ISV to build scalable applications that enable better customer data isolation and establish [tighter security](#data-separation) boundaries between customers. This article discusses the advantages and the limitations of this solution.

> [!NOTE]
> The word *tenant* in Power BI can sometimes refer to a Microsoft Entra tenant. In this article, however, we use the term *multitenancy* to describe a solution where a single instance of a software application serves multiple customers or organizations (tenants) requiring physical and logical separation of data. For example, the Power BI app builder can allocate a separate workspace for each of its customers (or tenants) as we show below. These customers are not necessarily Microsoft Entra tenants, so don’t confuse the term *multitenant application* that we use here, with the [Microsoft Entra multitenant application](/azure/active-directory/develop/single-and-multi-tenant-apps).

A *service principal profile* is a profile created by a [service principal](./embed-service-principal.md). The ISV app calls the Power BI APIs using a service principal profile, as explained in this article.

The ISV application [service principal](pbi-glossary.md#service-principal) creates a different Power BI profile for each customer, or [tenant](./pbi-glossary.md#tenant). When a customer visits the ISV app, the app uses the corresponding profile to generate an [embed token](pbi-glossary.md#embed-token) that will be used to render a report in the browser.

Using service principal profiles enables the ISV app to host multiple customers on a single [Power BI tenant](pbi-glossary.md#power-bi-tenant). Each profile represents one customer in Power BI. In other words, each profile creates and manages Power BI content for one specific customer's data.

 :::image type="content" source="media/embed-multi-tenancy/multi-tenant-saas-profiles.png" alt-text="Diagram of SP Profiles and multitenancy.":::

>[!NOTE]
>This article is aimed at organizations that want to set up a multitenant app using service principal profiles.
>If your organization already has an app that supports multitenancy, and you want to migrate to the service principal profile model, see [Migrate to the service principal profiles model](migration-to-sp-profiles.md).

Setting up your Power BI content involves the following steps:

* [Create a profile](#create-a-profile)
* [Set the profile permissions](#profile-permissions)
* [Create a workspace](#create-a-workspace) for each customer
* [Import reports and semantic models](#import-reports-and-semantic-models) into the workspace
* [Set the semantic model connection details](#set-the-semantic-model-connection) to connect to the customer's data
* Remove permissions from the service principal (optional, but helps with [scalability](#scalability))
* [Embed a report](#embed-a-report) into the application

All the above steps can be fully automated using [Power BI REST APIs](/rest/api/power-bi/).

## Prerequisites

Before you can create service principal profiles, you need to:

* Set up the service principal by following the *first three steps* of [Embed Power BI content with service principal](embed-service-principal.md#step-1---create-an-azure-ad-app).
* From a Power BI tenant admin account, enable creating profiles in the tenant *using the same security group you used when you created the service principal*.

 :::image type="content" source="./media/embed-multi-tenancy/service-principal-profile-feature-switch.png" alt-text="Screenshot of Admin portal switch.":::

## Create a profile

Profiles can be created, updated, and deleted using [Profiles REST API](/rest/api/power-bi/).

For example, to create a profile:

```rest
POST https://api.powerbi.com/v1.0/myorg/profiles HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJK…UUPA
Content-Type: application/json; charset=utf-8

{"displayName":"ContosoProfile"}
```

A service principal can also call [GET Profiles REST API](/rest/api/power-bi/) to get a list of its profiles. For example:

```rest
GET https://api.powerbi.com/v1.0/myorg/profiles HTTP/1.1
Authorization: Bearer eyJ0eXA…UUPA
```

## Profile permissions

Any API that grants a user permission to Power BI items can also grant a profile permission to Power BI items. For example, [Add Group User API](/rest/api/power-bi/groups/add-group-user) can be used to grant a profile permission to a workspace.

The following points are important to understand when using profiles:

* A profile belongs to the service principal that created it, and can only be used by that service principal.
* A profile owner can't be changed after creation.
* A profile isn't a standalone identity. It needs the service principal [Microsoft Entra](pbi-glossary.md#azure-ad-azure-active-directory) token to call Power BI REST APIs.

ISV apps call Power BI REST APIs by providing the service principal Microsoft Entra token in the *Authorization* header, and the profile ID in the *X-PowerBI-Profile-Id* header. For example:

```rest
  GET https://api.powerbi.com/v1.0/myorg/groups HTTP/1.1
  Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUz.....SXBwasfg
  X-PowerBI-Profile-Id: 5f1aa5ed-5983-46b5-bd05-999581d361a5
```

## Create a workspace

Power BI [workspaces](pbi-glossary.md#workspace) are used to host Power BI items such as reports and semantic models.

Each profile needs to:

* Create at least one [Power BI workspace](../../collaborate-share/service-create-the-new-workspaces.md)

  ```rest
  POST https://api.powerbi.com/v1.0/myorg/groups HTTP/1.1
  Authorization: Bearer eyJ0eXA…ZUiIsg
  Content-Type: application/json; charset=utf-8
  X-PowerBI-Profile-Id: a4df5235-6f18-4141-9e99-0c3512f41306

  {
    "name": "ContosoWorkspace"
  }
  ```

* Grant [access permissions](/power-bi/consumer/end-user-workspaces#permissions-in-the-workspaces) to the workspace. The service principal profile must have *Admin* access to the workspace.

* [Assign the workspace to a capacity](azure-pbie-create-capacity.md)

  ```rest
  POST https://api.powerbi.com/v1.0/myorg/groups/f313e682-c86b-422c-a3e2-b1a05426c4a3/AssignToCapacity HTTP/1.1
  Authorization: Bearer eyJ0eXAiOiJK…wNkZUiIsg
  Content-Type: application/json; charset=utf-8
  X-PowerBI-Profile-Id: a4df5235-6f18-4141-9e99-0c3512f41306

  {
    "capacityId": "13f73071-d6d3-4d44-b9de-34590f3e3cf6"
  }
  ```

Read more about [Power BI workspaces](/power-bi/consumer/end-user-workspaces).

## Import reports and semantic models

Use [Power BI Desktop](../../transform-model/desktop-query-overview.md) to prepare reports that are connected to the customer's data or sample data. Then, you can use the [Import API](/rest/api/power-bi/imports) to import the content into the created workspace.

```rest
POST https://api.powerbi.com/v1.0/myorg/groups/f313e682-c86b-422c-a3e2-b1a05426c4a3/imports?datasetDisplayName=ContosoSales HTTP/1.1
Authorization: Bearer eyJ...kZUiIsg
Content-Type: multipart/form-data; boundary="8b071895-b380-4769-9c62-7e586d717ed7"
X-PowerBI-Profile-Id: a4df5235-6f18-4141-9e99-0c3512f41306
Fiddler-Encoding: base64

LS04YjA3MTg5NS1iMzgwLTQ3...Tg2ZDcxN2VkNy0tDQo=
```

Use [dataset parameters](/rest/api/power-bi/datasets/update-parameters-in-group) to create a semantic model that can connect to different customers' data sources.
Then, use the *Update parameters* API to define which customers' data the semantic model connects to.

## Set the semantic model connection

ISVs usually store their customers' data in one of two ways:

* [A separate database for each customer](#a-separate-database-for-each-customer)
* [A single multitenant database](#a-single-multitenant-database)

In either case, you should end up with single-tenant semantic models (one semantic model per customer) in Power BI.  

### A separate database for each customer

If the ISV application has a separate database for each customer, create single-tenant semantic models in Power BI. Provide each semantic model with connection details that point to its matching database. Use one of the following methods to avoid creating multiple identical reports with different connection details:

* **Semantic model parameters:** Create a semantic model with [parameters](/rest/api/power-bi/datasets/update-parameters-in-group) in the connection details (such as SQL server name, SQL database name). Then, import a report into a customer's workspace and change the [parameters](/rest/api/power-bi/datasets/update-parameters-in-group) to match the customer's database details.

* **Update Datasource API:** Create a .pbix that points to a data source with sample content. Then, import the .pbix into a customer's workspace and change the connection details using the [Update Datasource API](/rest/api/power-bi/datasets/update-datasources-in-group).

### A single multitenant database

If the ISV application uses one database for all its customers, separate the customers into different semantic models in Power BI as follows:

Create a report using [parameters](/rest/api/power-bi/datasets/update-parameters-in-group) that only retrieve the relevant customer's data. Then, import a report into a customer's workspace and change the [parameters](/rest/api/power-bi/datasets/update-parameters-in-group) to retrieve the relevant customer's data only.

## Embed a report

After the setup is complete, you can embed customer reports and other items into your application using an embed token.

When a customer visits your application, use the corresponding profile to call the [GenerateToken API](/rest/api/power-bi/embed-token). Use the generated embed token to embed a report or other items in the customer's browser.

To generate an embed token:

```rest
POST https://api.powerbi.com/v1.0/myorg/GenerateToken HTTP/1.1
Authorization: Bearer eyJ0eXAiOi…kZUiIsg
Content-Type: application/json; charset=utf-8
X-PowerBI-Profile-Id: a4df5235-6f18-4141-9e99-0c3512f41306

{
  "datasets": [
    {
      "id": "3b1c8f74-fbbe-45e0-bf9d-19fce69262e3"
    }
  ],
  "reports": [
    {
      "id": "3d474b89-f2d5-43a2-a436-d24a6eb2dc8f"
    }
  ]
}
```

## Design aspects

Before setting up a profile-based multitenant solution, you should be aware of the following issues:

* [Scalability](#scalability)
* [Automation & operational complexity](#automation-and-operational-complexity)
* [Multi-Geo needs](#multi-geo-needs)
* [Cost efficiency](#cost-efficiency)
* [Row level security](#row-level-security)

### Scalability

By separating the data into separate semantic models for each customer, you minimize the need for [large semantic models](/power-bi/enterprise/service-premium-large-models). When the capacity gets overloaded, it can evict unused semantic models to free memory for active semantic models. This optimization is impossible for a [single large semantic model](#row-level-security). By using multiple semantic models, you can also separate tenants into multiple Power BI capacities if necessary.

Without profiles, a service principal is limited to 1,000 [workspaces](pbi-glossary.md#workspace). To overcome this limit, a service principal can create multiple profiles, where each profile can access/create up to 1,000 workspaces. With multiple profiles, the ISV app can isolate each customer's content using distinct logical containers.

Once a service principal profile has access to a workspace, its parent service principal’s access to the workspace can be removed to avoid scalability problems.

Even with these advantages, you should consider the potential scale of your application. For example, the number of workspace items a profile can access is limited. Today, a profile has the same limits as a regular user. If the ISV application allows end users to save [a personalized copy](#customizing-and-authoring-content) of their embedded reports, a customer's profile will have access to all the created reports of all its users. This model can eventually exceed the limit.

### Automation and operational complexity

With Power BI profile-based separation, you might need to manage hundreds or thousands of items. Therefore, it's important to define the processes that frequently happen in your application lifecycle management, and ensure you have the right set of tools to do these operations at scale. Some of these operations include:

* Adding a new tenant
* Updating a report for some or all tenants
* Updating the semantic model schema for some or all tenants
* Unplanned customizations for specific tenants
* Frequency of semantic model refreshes

For example, creating a profile and a workspace for a new tenant is a common task, which can be [fully automated](https://www.powerbidevcamp.net/sessions/session11/) with the [Power BI REST API](/rest/api/power-bi/).

### Multi-Geo needs  

Multi-Geo support for Power BI Embedded means that ISVs and organizations that build applications using Power BI Embedded to embed analytics into their apps can now deploy their data in different regions around the world. To support different customers in different regions, assign the customer's workspace to a capacity in the desired region. This task is a simple operation that doesn't involve extra cost. However, if you have customers that need data from multiple regions, the tenant profile should duplicate all items into multiple workspaces that are assigned to different regional capacities. This duplication may increase both cost and management complexity.

For compliance reasons, you may still want to create multiple Power BI tenants in different regions. Read more about [multi-geo](../../admin/service-admin-premium-multi-geo.md).

### Cost efficiency

Application developers using Power BI Embedded need to [purchase a Power BI Embedded capacity](move-to-production.md). The profile-based separation model works well with capacities because:

* The smallest object you can independently assign to a capacity is a [workspace](pbi-glossary.md#workspace) (you can't assign a report, for example). By separating customers by profiles, you get different workspaces - one per customer. This way, you get full flexibility to manage each customer according to their performance needs, and optimize capacity utilization by scaling up or down. For example, you can manage large and essential customers with high volume and volatility in a separate capacity to ensure a consistent level of service, while grouping smaller customers in another capacity to optimize costs.

* Separating workspaces also means separating semantic models between tenants so that data models are in smaller chunks, rather than a single large semantic model. These smaller models enable the capacity to manage memory usage more efficiently. Small, unused semantic models can be evicted after a period of inactivity, in order to maintain good performance.

When buying a capacity, consider the limit on the number of parallel refreshes, as refresh processes might need extra capacity when you have multiple semantic models.

### Row Level Security

This article explains how to use profiles to create a separate semantic model for each customer. Alternatively, ISV applications can store all their customers' data in one large semantic model and use [Row-level security (RLS)](embedded-row-level-security.md) to protect each customer's data. This approach can be convenient for ISVs that have relatively few customers and small to medium-sized semantic models because:

* There's only one report and one semantic model to maintain
* The onboarding process for new customers can be simplified

Before using RLS, however, make sure you understand its limitations. All the data for all customers are in one large Power BI semantic model. This semantic model runs in a single capacity with its own scaling and other limitations.

Even if you use service principal profiles to separate your customers' data, you can still use RLS within a single customer's semantic model to give different groups access to different parts of the data. For example, you could use [RLS](/fabric/security/service-admin-row-level-security) to prevent members of one department from accessing data of another department in the same organization.

## Considerations and limitations

* Service Principal Profiles are only supported through the Power [BI REST API](/rest/api/power-bi/), the [Power BI .NET SDK](https://www.nuget.org/packages/Microsoft.PowerBI.Api/), and through the XMLA endpoint and the Tabular Object Model (TOM) when using Analysis Services client libraries version 16.0.139.27 or higher. Service Principal Profiles are not supported in Power BI through the XMLA endpoint or the Tabular Object Model (TOM) with older client libraries.
* Service principal profiles aren't supported with Azure Analysis Services (AAS) in live connection mode.
* The maximum [profiles](/rest/api/power-bi/profiles) a single service principal can have, is 100,000.

### Power BI capacity limitations

* Each capacity can only use its allocated memory and V-cores, according to the [SKU purchased](/power-bi/enterprise/service-premium-what-is). For the recommended semantic model size for each SKU, reference [Premium large semantic models](/power-bi/enterprise/service-premium-what-is#large-datasets).
* To use a semantic model larger than 10 GB, use a Premium capacity and enable the [Large semantic models](/power-bi/enterprise/service-premium-large-models) setting.
* For the number of refreshes that can run concurrently on a capacity, reference [resource management and optimization](/power-bi/enterprise/service-premium-what-is#capacity-nodes).

### Manage service principals

#### Change a service principal

In Power BI, a profile belongs to the service principal that created it. That means, a profile can't be shared with other principals. With this limitation, if you want to change the service principal for any reason, you'll need to recreate all the profiles and provide the new profiles access to the relevant workspaces.
Often, the ISV application needs to save a mapping between a profile ID and a customer ID in order to pick the right profile when needed. If you change the service principal and recreate the profiles, the IDs will also change, and you may need to update the mapping in the ISV application database.

#### Delete a service principal

> [!WARNING]
> Be very careful when deleting a service principal. You don't want to accidentally lose data from all its associated profiles.

If you delete the service principal in the active directory, all its profiles in Power BI will be deleted. However, Power BI won't delete the content immediately, so the tenant admin can still access the workspaces. Be careful when deleting a service principal used in a production system, especially when you created profiles using this service principal in Power BI.
If you do delete a service principal that has created profiles, be aware that you'll need to recreate all the profiles, provide the new profiles access to the relevant workspaces, and update the profile IDs in the ISV application database.

### Data separation

When data is separated by service principal profiles, a simple mapping between a profile and customer prevents one customer from seeing another customer's content. Using a single *service principal* requires that the service principal has access to all the different workspaces in all the profiles.

To add extra separation, assign a separate service principal to each tenant, instead of having a single service principal access multiple workspaces using different profiles. Assigning separate service principals has several advantages, including:

* Human error or a credential leak won't cause multiple tenants' data to be exposed.
* Certificate rotation can be done separately for each tenant.

However, using multiple service principals comes with a high management cost. Select this path only if you need the extra separation. Keep in mind that the configuration of which data to show an end user is defined when you [generate the embed token](/rest/api/power-bi/embedtoken), a backend-only process that end users can't see or change. Requesting an embed token using a tenant-specific profile will generate an embed token for that specific profile, which will give you customer separation in consumption.

#### One report, multiple semantic models

Generally, you have one report and one semantic model per tenant. If you have hundreds of reports, you'll have hundreds of semantic models. Sometimes, you might have one report format, with different semantic models (for example, different parameters or connection details). Each time you have a new version of the report, you'll need to update all the reports for all tenants. Although you can automate this, it's easier to manage if you have just one copy of the report. Create a workspace that contains the report to embed. During a session runtime, bind the report to the tenant-specific semantic model. Read [dynamic bindings](embed-dynamic-binding.md) for more details.

#### Customizing and authoring content

When you create content, carefully consider who has permission to edit it. If you allow multiple users in each tenant to edit, it's easy to exceed semantic model limitations. If you decide to give users editing capability, monitor their content generation closely, and scale up as needed. For the same reason, we don't recommend using this capability for content personalization, where each user can make small changes to a report and save it for themselves. If the ISV application allows content personalization, consider introducing workspace retention policies for user-specific content. Retention policies make it easier to delete content when users move to a new position, leave the company, or stop using the platform.

#### System-Managed identity

Instead of a service principal, you can use a user-assigned or system-assigned[managed identity](/azure/active-directory/managed-identities-azure-resources/overview) to create profiles. Managed identities reduce the need for secrets and certificates.

Be careful when using a system-managed identity because:

* If a system-assigned managed identity is accidentally turned off, you'll lose access to the profiles. This situation is similar to a case where a [service principal is deleted](#delete-a-service-principal).
* A system-assigned managed identity is connected to a resource in Azure (web app). If you delete the resource, the identity will be deleted.
* Using multiple resources (different web apps in different regions) will result in multiple identities that need to be managed separately (each identity will have its own profiles).

Due to the above considerations, we recommend that you use a user-assigned managed identity.

## Example

For an example of how to use service principal profiles to manage a multitenant environment with Power BI and App-Owns-Data embedding, download the [App owns data multitenant](https://github.com/PowerBiDevCamp/AppOwnsDataMultiTenant) repository from [Power BI Dev Camp](https://www.powerbidevcamp.net/) (third party site).

## Related content

* [Use the Power BI SDK with service principals](service-principal-profile-sdk.md)
* [Migrate multitenancy apps to the service principal profiles model](migration-to-sp-profiles.md)
* [Develop scalable multitenancy applications with Power BI embedding](/power-bi/guidance/develop-scalable-multitenancy-apps-with-powerbi-embedding)
