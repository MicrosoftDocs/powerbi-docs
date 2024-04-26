---
title: "Develop scalable multitenancy applications with Power BI embedding"
description: "Learn how to embed Power BI content for multitenancy applications and achieve the highest levels of scalability, performance, and security."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 01/16/2023
---

# Develop scalable multitenancy applications with Power BI embedding

This article describes how to develop a multitenancy application that embeds Power BI content while achieving the highest levels of scalability, performance, and security. By designing and implementing an application with *service principal profiles*, you can create and manage a multitenancy solution comprising tens of thousands of customer tenants that can deliver reports to audiences of over 100,000 users.

*Service principal profiles* is a feature that makes it easier for you to manage organizational content in Power BI and use your capacities more efficiently. However, using service principal profiles can add complexity to your application design. Therefore, you should only use them when there's a need to achieve significant scale. We recommend using service principal profiles when you have many workspaces and more than 1,000 application users.

> [!NOTE]
> The value of using service principal profiles increases as your need to scale increases as well as your need to achieve the highest levels of security and tenant isolation.

You can achieve Power BI embedding by using two different embedding scenarios: *Embed for your organization* and *Embed for your customer*.

The **Embed for your organization** scenario applies when the application audience comprises *internal* users. Internal users have organizational accounts and must authenticate with Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)). In this scenario, Power BI is software-as-a-service (SaaS). It's sometimes referred to as *User owns data*.

The **Embed for your customer** scenario applies when the application audience comprises *external* users. The application is responsible for authenticating users. To access Power BI content, the application relies on an embedding identity (Microsoft Entra service principal or master user account) to authenticate with Microsoft Entra. In this scenario, Power BI is platform-as-a-service (PaaS). It's sometimes referred to as *App owns data*.

> [!NOTE]
> It's important to understand that the service principal profiles feature was designed for use with the *Embed for your customer* scenario. That's because this scenario offers ISVs and enterprise organizations the ability to embed with greater scale to a large number of users and to a large number of customer tenants.

## Multitenancy application development

If you're familiar with Microsoft Entra, the word *tenant* might lead you think of a Microsoft Entra tenant. However, the concept of a tenant is different in the context of building a multitenancy solution that embeds Power BI content. In this context, a *customer tenant* is created on behalf of each customer for which the application embeds Power BI content by using the *Embed for your customer* scenario. You typically provision each customer tenant by creating a single Power BI workspace.

To create a scalable multitenancy solution, you must be able to automate the creation of new customer tenants. Provisioning a new customer tenant typically involves writing code that uses the Power BI REST API to create a new Power BI workspace, create semantic models ([previously known as datasets](../connect-data/service-datasets-rename.md)) by importing Power BI Desktop (.pbix) files, update data source parameters, set data source credentials, and set up scheduled semantic model refresh. The following diagram shows how you can add Power BI items, such as reports and semantic models, to workspaces to set up customer tenants.

:::image type="content" source="media/develop-scalable-multitenancy-apps-with-powerbi-embedding/set-up-powerbi-multitenancy-environment.png" alt-text="Diagram that shows a setup for three tenants. Each tenant has its own data source and workspace." border="false":::

When you develop an application that uses the *Embed for your customer* scenario, it's possible to make [Power BI REST API](/rest/api/power-bi/) calls by using an embedding identity that's either a master user account or a service principal. We recommend using a service principal for production applications. It provides the highest security and for this reason it's the approach recommended by Microsoft Entra. Also, it supports better automation and scale and there's less management overhead. However, it requires Power BI admin rights to [set up and manage](/power-bi/enterprise/read-only-apis-service-principal-authentication).

By using a service principal, you can avoid common problems associated with master user accounts, such as authentication errors in environments where users are required to sign in by using multifactor authentication (MFA). Using a service principal is also consistent with the idea that the *Embed for your customer* scenario is based on embedding Power BI content by using a PaaS mindset as opposed to a SaaS mindset.

### 1,000-workspace limitation

When you design a multitenancy environment that implements the *Embed for your customer* scenario, be sure to consider that the embedding identity can't be granted access to more than 1,000 workspaces. The Power BI service imposes this limitation to ensure good performance when making REST API calls. The reason for this limitation is related to how Power BI maintains security-related metadata for each identity.

Power BI uses metadata to track the workspaces and workspace items an identity can access. In effect, Power BI must maintain a separate access control list (ACL) for each identity in its authorization subsystem. When an identity makes a REST API call to access a workspace, Power BI must do a security check against the identity's ACL to ensure it's authorized. The time it takes to determine whether the target workspace is inside the ACL increases exponentially as the number of workspaces increases.

> [!NOTE]
> Power BI doesn't enforce the 1,000 workspace limitation through code. If you try, you add an embedding identity to more than 1,000 workspaces, and REST API calls will still execute successfully. However, your application will move into an *unsupported* state, which may have implications should you try to request help from Microsoft support.

Consider a scenario where two multi-tenant applications have each been set up to use a single service principal. Now consider that the first application has created 990 workspaces while the second application has created 1,010 workspaces. From a support perspective, the first application is within the supported boundaries while the second application isn't.

Now compare these two applications purely from a performance perspective. There's not that much difference because the ACLs for both service principals have let the metadata for their ACLs grow to a point where it will degrade performance to some degree.

Here's the key observation: The number of workspaces created by a service principal has a direct impact on performance and scalability. A service principal that's a member of 100 workspaces will execute REST API calls faster than a service principal that's a member of 1,000 workspaces. Likewise, a service principal that's a member of only 10 workspaces will execute REST API calls faster than a service principal that's a member of 100 workspaces.

> [!IMPORTANT]
> From the perspective of performance and scalability, the optimal number of workspaces for which a service principal is a member is *exactly one*.

### Manage isolation for semantic models and data source credentials

Another important aspect when designing a multitenancy application is to isolate customer tenants. It's critical that users from one customer tenant don't see data that belongs to another customer tenant. Therefore, you must understand how to manage semantic model ownership and data source credentials.

#### Semantic model ownership

Each Power BI semantic model has a single owner, which can be either a user account or a service principal. Semantic model ownership is required to set up scheduled refresh and set semantic model parameters.

> [!TIP]
> In the Power BI service, you can determine who the semantic model owner is by opening the semantic model settings.

If necessary, you can transfer ownership of the semantic model to another user account or service principal. You can do that in the Power BI service, or by using the REST API [`TakeOver`](/rest/api/power-bi/datasets/take-over-in-group) operation. When you import a Power BI Desktop file to create a new semantic model by using a service principal, the service principal is automatically set as the semantic model owner.

#### Data source credentials

To connect a semantic model to its underlying data source, the semantic model owner must set data source credentials. Data source credentials are encrypted and cached by Power BI. From that point, Power BI uses those credentials to authenticate with the underlying data source when refreshing the data (for import storage tables) or executing passthrough queries (for DirectQuery storage tables).

We recommend that you apply a common design pattern when provisioning a new customer tenant. You can execute a series of REST API calls by using the identity of the service principal:

1. Create a new workspace.
1. Associate the new workspace with a dedicated capacity.
1. Import a Power BI Desktop file to create a semantic model.
1. Set the semantic model source credentials for that semantic model.

On completion of these REST API calls, the service principal will be an admin of the new workspace and the owner of the semantic model and data source credentials.

> [!IMPORTANT]
> There's a common misconception that semantic model data source credentials are workspace-level scoped. That's not true. Data source credentials are scoped to the service principal (or user account) and that scope extends to all Power BI workspaces in the Microsoft Entra tenant.

It's possible for a service principal to create data source credentials that are shared by semantic models in different workspaces across customer tenants, as shown in the following diagram.

:::image type="content" source="media/develop-scalable-multitenancy-apps-with-powerbi-embedding/set-up-powerbi-multitenancy-environment-resuse-data-source-credentials.png" alt-text="Diagram that shows a setup for two tenants. Each tenant share the same data source credentials." border="false":::

When data source credentials are shared by semantic models that belong to different customer tenants, the customer tenants aren't fully isolated.

### Design strategies prior to service principal profiles

Understanding design strategies before the service principal profile feature became available can help you to appreciate the need for the feature. Before that time, developers built multitenancy applications by using one of the following three design strategies:

- Single service principal
- Service principal pooling
- One service principal per workspace

There are strengths and weakness associated with each of these design strategies.

The **single service principal** design strategy requires a once-off creation of a [Microsoft Entra app registration](/azure/active-directory/develop/howto-create-service-principal-portal#app-registration-app-objects-and-service-principals). Therefore, it involves less administrative overhead than the other two design strategies because there's no requirement to create more Microsoft Entra app registrations. This strategy is also the most straightforward to set up because it doesn't require writing extra code that switches the calling context between service principals when making REST API calls. However, a problem with this design strategy is that it doesn't scale. It only supports a multitenancy environment that can grow up to 1,000 workspaces. Also, performance is sure to degrade as the service principal is granted access to a larger number of workspaces. There's also a problem with customer tenant isolation because the single service principal becomes the owner of every semantic model and all data credentials across all customer tenants.

The **service principal pooling** design strategy is commonly used to avoid the 1,000-workspace limitation. It allows the application to scale to any number of workspaces by adding the correct number of service principals to the pool. For example, a pool of five service principals makes it possible to scale up to 5,000 workspaces; a pool of 80 service principals makes it possible to scale up to 80,000 workspaces, and so on. However, while this strategy can scale to a large number of workspaces, it has several disadvantages. First, it requires writing extra code and storing metadata to allow context switching between service principals when making REST API calls. Second, it involves more administrative effort because you must create Microsoft Entra app registrations whenever you need to increase the number of the service principals in the pool.

What's more, the service principal pooling strategy isn't optimized for performance because it allows service principals to become members of hundreds of workspaces. It also isn't ideal from the perspective of customer tenant isolation because the service principals can become owners of semantic model and data credentials shared across customer tenants.

The **one service principal per workspace** design strategy involves creating a service principal for each customer tenant. From a theoretical perspective, this strategy offers the best solution because it optimizes the performance of REST API calls while providing true isolation for semantic models and data source credentials at the workspace level. However, what works best in theory doesn't always work best in practice. That's because the requirement to create a service principal for each customer tenant is impractical for many organizations. That's because some organizations have formal approval processes or they involve excessive bureaucracy to create Microsoft Entra app registrations. These reasons can make it impossible to grant a custom application the authority it needs to create Microsoft Entra app registrations on-demand and in the automated way that your solution requires.

In less common scenarios where a custom application has been granted proper permissions, it can use the [Microsoft Graph API](/graph/overview) to create Microsoft Entra app registrations on demand. However, the custom application is often complex to develop and deploy because it must somehow track authentication credentials for each Microsoft Entra app registration. It must also gain access to those credentials whenever it needs to authenticate and acquire access tokens for individual service principals.

## Service principal profiles

The service principal profiles feature was designed to make it easier for you to manage organizational content in Power BI and use your capacities more efficiently. They help address three specific challenges that involve the lowest amount of developer effort and overhead. These challenges include:

- Scaling to a large number of workspaces.
- Optimizing performance of REST API calls.
- Isolating semantic models and data source credentials at the customer tenant level.

When you design a multitenancy application by using service principal profiles, you can benefit from the strengths of the three design strategies (described in the previous section) while avoiding their associated weaknesses.

Service principal profiles are local accounts that are created within the context of Power BI. A service principal can use the [`Profiles`](/rest/api/power-bi/profiles) REST API operation to create new service principal profiles. A service principal can create and manage its own set of service principal profiles for a custom application, as shown in the following diagram.

:::image type="content" source="media/develop-scalable-multitenancy-apps-with-powerbi-embedding/service-principal-creates-service-principal-profiles.png" alt-text="Diagram that shows a service principal creating three service principal profiles in Power BI." border="false":::

There's always a parent-child relationship between a service principal and the service principal profiles it creates. You can't create a service principal profile as a stand-alone entity. Instead, you create a service principal profile by using a specific service principal, and that service principal serves as the profile's parent. Furthermore, a service principal profile is never visible to user accounts or other service principals. A service principal profile can only be seen and used by the service principal that created it.

### Service principal profiles aren't known to Microsoft Entra

While the service principal itself and its underlying Microsoft Entra app registration are known to Microsoft Entra, Microsoft Entra ID doesn't know anything about service principal profiles. That's because service principal profiles are created by Power BI and they exist only in the Power BI service subsystem that controls Power BI security and authorization.

The fact that service principal profiles aren't known to Microsoft Entra ID has both advantages and disadvantages. The primary advantage is that an *Embed for your customer* scenario application doesn't need any special Microsoft Entra permissions to create service principal profiles. It also means that the application can create and manage a set of local identities that are separate from Microsoft Entra.

However, there are also disadvantages. Because service principal profiles aren't known to Microsoft Entra, you can't add a service principal profile to a Microsoft Entra group to implicitly grant it access to a workspace. Also, external data sources, such as an Azure SQL Database or Azure Synapse Analytics, can't recognize service principal profiles as the identity when connecting to a database. So, the **one service principal per workspace** design strategy (creating a service principal for each customer tenant) might be a better choice when there's a requirement to connect to these data sources by using a separate service principal with unique authentication credentials for each customer tenant.

### Service principal profiles are first-class security principals

While service principal profiles aren't known to Microsoft Entra, Power BI recognizes them as first-class security principals. Just like a user account or a service principal, you can add service principal profiles to a workspace role (as an Admin or Member). You can also make it a semantic model owner and the owner of data source credentials. For these reasons, creating a new service principal profile for each new customer tenant is a best practice.

:::image type="content" source="media/develop-scalable-multitenancy-apps-with-powerbi-embedding/create-service-principal-profiles-for-each-customer-tenant.png" alt-text="Diagram that shows multiple customer tenants, each with their own service principal profiles." border="false":::

> [!TIP]
> When you develop an *Embed for your customer* scenario application by using service principal profiles, you only need to create a single Microsoft Entra app registration to provide your application with a single service principal. This approach significantly lowers administrative overhead compared to other multitenancy design strategies, where it's necessary to create additional Microsoft Entra app registrations on an ongoing basis after the application is deployed to production.

### Execute REST API calls as a service principal profile

Your application can execute REST API calls by using the identity of a service principal profile. That means it can execute a sequence of REST API calls to provision and set up a new customer tenant.

1. When a service principal profile creates a new workspace, Power BI automatically adds that profile as a workspace admin.
1. When a service principal profile imports a Power BI Desktop file to create a semantic model, Power BI sets that profile as the semantic model owner.
1. When a service principal profile sets data source credentials, Power BI sets that profile as the owner of the data source credentials.

It's important to understand that a service principal has an identity in Power BI that's separate and distinct from the identities of its profiles. That provides you with choice as a developer. You can execute REST API calls by using the identity of a service principal profile. Alternatively, you can execute REST API calls without a profile, which uses the identity of the parent service principal.

We recommend that you execute REST API calls as the parent service principal when you're creating, viewing, or deleting service principal profiles. You should use the service principal profile to execute all other REST API calls. These other calls can create workspaces, import Power BI Desktop files, update semantic model parameters, and set data source credentials. They can also retrieve workspace item metadata and generate embed tokens.

Consider an example where you need to set up a customer tenant for a customer named *Contoso*. The first step makes a REST API call to create a service principal profile with its display name set to *Contoso*. This call is made by using the identity of the service principal. All remaining set up steps use the service principal profile to complete the following tasks:

1. Create a workspace.
1. Associate the workspace with a capacity.
1. Import a Power BI Desktop file.
1. Set semantic model parameters.
1. Set data source credentials.
1. Set up scheduled data refresh.

It's important to understand that access to the workspace and its content must be done by using the identity of the service principal profile that was used to create the customer tenant. It's also important to understand that the parent service principal doesn't need access to the workspace or its content.

> [!TIP]
> Remember: When making REST API calls, use the service principal to create and manage service principal profiles, and use the service principal profile to create, set up, and access Power BI content.

### Use the Profiles REST API operations 

The [**Profiles**](/rest/api/power-bi/profiles) REST API operation group comprises operations that create and manage service principal profiles:

- `Create Profile`
- `Delete Profile`
- `Get Profile`
- `Get Profiles`
- `Update Profile`

#### Create a service principal profile

Use the [Create Profile](/rest/api/power-bi/profiles/create-profile) REST API operation to create a service principal profile. You must set the `displayName` property in the request body to provide a display name for the new tenant. The value must be unique across all the profiles owned by the service principal. The call will fail if another profile with that display name already exists for the service principal.

A successful call returns the `id` property, which is a GUID that represents the profile. When you develop applications that use service principal profiles, we recommend that you store profile display names and their ID values in a custom database. That way, it's straightforward for your application to retrieve the IDs.

If you're programming with the [Power BI .NET SDK](https://www.nuget.org/packages/Microsoft.PowerBI.Api), you can use the `Profiles.CreateProfile` method, which returns a `ServicePrincipalProfile` object representing the new profile. It makes it straightforward to determine the `id` property value.

Here's an example of creating a service principal profile and granting it workspace access.

```csharp
// Create a service principal profile
string profileName = "Contoso";

var createRequest = new CreateOrUpdateProfileRequest(profileName);
var profile = pbiClient.Profiles.CreateProfile(createRequest);

// Retrieve the ID of the new profile
Guid profileId = profile.Id;

// Grant workspace access
var groupUser = new GroupUser {
    GroupUserAccessRight = "Admin",
    PrincipalType = "App",
    Identifier = ServicePrincipalId,
    Profile = new ServicePrincipalProfile {
        Id = profileId
    }
};

pbiClient.Groups.AddGroupUser(workspaceId, groupUser);
```

In the Power BI service, in the workspace **Access** pane, you can determine which identities, including security principals, have access.

:::image type="content" source="media/develop-scalable-multitenancy-apps-with-powerbi-embedding/workspace-access-with-service-principal-profile.png" alt-text="Screenshot that shows a screenshot of the workspace Access pane. It shows a service principal profile with a display name of Contoso that has admin permission." border="false":::

#### Delete a service principal profile

Use the [Delete Profile](/rest/api/power-bi/profiles/delete-profile) REST API operation to delete a service principal profile. This operation can only be called by the parent service principal.

If you're programming with the Power BI .NET SDK, you can use the `Profiles.DeleteProfile` method.

#### Retrieve all service principal profiles

Use the [Get Profiles](/rest/api/power-bi/profiles/delete-profile) REST API operation to retrieve a list of service principal profiles that belong to the calling service principal. This operation returns a JSON payload that contains the `id` and `displayName` properties of each service principal profile.

If you're programming with the Power BI .NET SDK, you can use the **Profiles.GetProfiles** method.

### Execute REST API calls by using a service principal profile

There are two requirements for making REST API calls by using a service principal profile:

- You must pass the access token for the parent service principal in the **Authorization** header.
- You must include a header named **X-PowerBI-profile-id** with the value of the service principal profile's ID.

If you're using the Power BI .NET SDK, you can set the **X-PowerBI-profile-id** header value explicitly by passing in the service principal profile's ID.

```csharp
// Create the Power BI client
var tokenCredentials = new TokenCredentials(GetACcessToken(). "Bearer");
var uriPowerBiServiceApiRoot = new Uri(uriPowerBiServiceApiRoot);
var pbiClient = new PowerBIClient(uriPowerBiServiceApiRoot, tokenCredentials);

// Add X-PowerBI-profile-id header for service principal profile
string profileId = "11111111-1111-1111-1111-111111111111";
pbiClient.HttpClient.DefaultRequestHeaders.Add("X-PowerBI-profile-id", profileId);

// Retrieve workspaces by using the identity of service principal profile
var workspaces = pbiClient.Groups.GetGroups();
```

As shown in the above example, once you add the **X-PowerBI-profile-id** header to the `PowerBIClient` object, it's straightforward to invoke methods, such as `Groups.GetGroups`, so they'll be executed by using the service principal profile.

There's a more convenient way to set the **X-PowerBI-profile-id** header for a `PowerBIClient` object. You can initialize the object by passing in the profile's ID to the constructor.

```csharp
// Create the Power BI client
string profileId = "11111111-1111-1111-1111-111111111111";

var tokenCredentials = new TokenCredentials(GetACcessToken(). "Bearer");
var uriPowerBiServiceApiRoot = new Uri(uriPowerBiServiceApiRoot);
var pbiClient = new PowerBiClient(uriPowerBiServiceApiRoot, tokenCredentials, profileId);
```

As you program a multitenancy application, it's likely that you'll need to switch between executing calls as the parent service principal and executing calls as a service principal profile. A useful approach to manage context switching is to declare a class-level variable that stores the `PowerBIClient` object. You can then create a helper method that sets the variable with the correct object.

```csharp
// Class-level variable that stores the PowerBIClient object
private PowerBIClient pbiClient;

// Helper method that sets the correct PowerBIClient object
private void SetCallingContext(string profileId = "") {

    if (profileId.Equals("")) {
        pbiClient = GetPowerBIClient();    
    }
    else {
        pbiClient = GetPowerBIClientForProfile(new Guid(profileId));
    }
}
```

When you need to create or manage a service principal profile, you can call the `SetCallingContext` method without any parameters. This way, you can create and manage profiles by using the identity of the service principal.

```csharp
// Always create and manage profiles as the service principal
SetCallingContext();

// Create a service principal profile
string profileName = "Contoso";

var createRequest = new CreateOrUpdateProfileRequest(profileName);
var profile = pbiClient.Profiles.CreateProfile(createRequest);
```

When you need to create and set up a workspace for a new customer tenant, you want to execute that code as a service principal profile. Therefore, you should call the `SetCallingContext` method by passing in the profile's ID. This way, you can create the workspace by using the identity of the service principal profile.

```csharp
// Always create and set up workspaces as a service principal profile
string profileId = "11111111-1111-1111-1111-111111111111";
SetCallingContext(profileId);

// Create a workspace
GroupCreationRequest request = new GroupCreationRequest(workspaceName);
Group workspace = pbiClient.Groups.CreateGroup(request);
```

After you've used a specific service principal profile to create and configure a workspace, you should continue to use that same profile to create and set up the workspace content. There's no need to invoke the `SetCallingContext` method to complete the setup.

## Developer sample

We encourage you to download a sample application named [**AppOwnsDataMultiTenant**](https://github.com/PowerBiDevCamp/AppOwnsDataMultiTenant).

This sample application was developed by using .NET 6 and ASP.NET, and it demonstrates how to apply the guidance and recommendations described in this article. You can review the code to learn how to develop a multitenancy application that implements the *Embed for your customer* scenario by using service principal profiles.

## Related content

For more information about this article, check out the following resources:

- [Service principal profiles for multitenancy apps in Power BI Embedded](/power-bi/developer/embedded/embed-multi-tenancy)
- [Migrate multi-customer applications to the service principal profiles model](/power-bi/developer/embedded/migration-to-sp-profiles)
- [Profiles Power BI REST API operation group](/rest/api/power-bi/profiles)
- - [AppOwnsDataMultiTenant sample application](https://github.com/PowerBiDevCamp/AppOwnsDataMultiTenant)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)
