---
title: Register an Azure AD app using service principal to embed Power BI content
description: Learn how to register an application within Azure Active Directory using service principal for use with embedding Power BI content.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ""
ms.component: power-bi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 01/31/2018
---

# Service principal for use with Power BI Embedded applications

To access resources that secure an Azure AD tenant, the entity that requires access represents a security principal. This action holds true for both users (user principal) and applications (service principal).

A security principal defines the access policy and permissions for the user/application in the Azure AD tenant. This access policy enables core features such as authentication of the user/application during sign-in, and authorization during resource access.

When an application gives permissions to access resources in Power BI upon registration or consent, a service principal object is created.

**Power BI APIs** and **Power BI .NET SDK** now support calls using service principal.

## Application registration

When you [register an Azure AD application](register-app.md) in the Azure portal, two objects are created in your Azure AD tenant:

- An application object
- A service principal object

### Application and service principal relationship

Consider the application object as the *global* representation of your application for use across all tenants, and the service principal as the *local* representation for use in a specific tenant.

The application object serves as the template from which common and default properties are *derived* for use in creating corresponding service principal objects.

A service principal must be created in each tenant where the application is used, enabling it to establish an identity for sign-in and/or access to resources being secured by the tenant. A single-tenant application has only one service principal (in its home tenant), created and consented for use during application registration.

## Service principal with Power BI Embedded

With service principal, you can mask your account information in your application by using an application ID (app ID) and an application secret (app secret). You don't have to hard-code a master user account into your application to authenticate. You can only use a service principal if your Power BI artifacts and resources are stored in a Power BI workspace version two. A service principal can't be used to login to the Power BI service. You can't install an On-premises data gateway using just a service principal. However, you can edit the credentials of the gateway using a service principal. You can set up notifications using a service principal to pull history. You can generate embed tokens with service principal. A service principal can't be used with an Analysis Services live connection data source, or an Azure Analysis Services data source. A service principal doesn't replace `Effectiveidentity` with a user. A service principal has Azure Resource Management (ARM) API capacities. Currently, service principal doesn't allow multi-tenant applications. You can't import or export an application using service principal in Azure.

Other functions that a service principal token provides:

- Work with APIs
- Can create workspaces
- Add users to workspaces
- Remove users from workspaces
- Can import reports
- Can be viewed in the PBI portal

## Service principal vs. Power BI Pro account

There are differences between using a service principal token versus a standard Power BI Pro login (master) account for authenticating into your Power BI Embedded application.

You can only use a service principal if your Power BI artifacts and resources are stored in a Power BI workspace version two. Whereas when using a master account you can use either version of a workspace. The main difference between using service principal over a master account is that service principal can't be used to login to Power BI. So to see any of your Power BI resources you need a Power BI account. Unlike a master account that can be used with just a Power BI pro license for testing, a service principal token requires a [dedicated capacity](azure-pbie-create-capacity.md) to be purchased. You can't install an On-premises data gateway using just a service principal. Installing an On-premises data gateway still requires a Power BI account. However, you can edit the credentials of the gateway using the service principal. You can set up notifications using a service principal to pull history. You can generate embed tokens with service principal. 

## Configure service principal

- Create a web app service principal and secret
- Service principal an instance of that class
- Can create an instance of an application
- Register the application in multiple tenants
- Only allow apps that the PBI admin approves
    - Additional tenant settings
    - Access PBI with the app
    - Functions like the new workspace settings
    - Only through the REST APIs

## Limitations and considerations

- Only works with **app workspaces *version two (2)***
- **My Workspace** isn't supported.
- Assigning a workspace to a capacity API isn't implemented yet
    - You can do it from the Power BI admin portal, or using a user token API call
- Can't be a capacity admin
- Using an Analysis Services live connection data source, or using Azure Analysis Services aren't supported
- Can't install an on-premises data gateway
- Can't be an on-premises data gateway admin
- Can't sign in to the Power BI portal
- No APIs can be used to create dashboards
- Can't import or export application
- Need dedicated capacity
- It is not required to own a pro license

## Next steps

- [Power BI Embedded for your customers](embed-sample-for-customers.md)
- [Register an app](register-app.md)