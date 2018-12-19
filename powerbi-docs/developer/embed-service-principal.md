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

To access resources that secure an Azure AD tenant, the entity that requires access represents a security principal. This action is true for both users (user principal) and applications (service principal).

The security principal defines the access policy and permissions for the user/application in the Azure AD tenant. This access policy enables core features such as authentication of the user/application during sign-in, and authorization during resource access.

When an application gives permissions to access resources in Power BI upon registration or consent, a service principal object is created.

**Power BI APIs** and **Power BI .NET SDK** now support calls using service principal.

## Application registration

When you register an Azure AD application in the Azure portal, two objects are created in your Azure AD tenant:

- An application object
- A service principal object

### Application and service principal relationship

Consider the application object as the *global* representation of your application for use across all tenants, and the service principal as the *local* representation for use in a specific tenant.

The application object serves as the template from which common and default properties are *derived* for use in creating corresponding service principal objects. 

A service principal must be created in each tenant where the application is used, enabling it to establish an identity for sign-in and/or access to resources being secured by the tenant. A single-tenant application has only one service principal (in its home tenant), created and consented for use during application registration.

## Using service principal vs a Power BI Pro account

There are differences between using service principal versus a standard Power BI Pro login (master) account for authenticating into your Power BI Embedded application.

With service principal, you can hide your account information within your application by using an application ID (app ID) and an application secret (app secret). However, you can't use the app ID and the app secret. A service principal token can create workspaces, add users to groups, and remove users, work with APIs, can be viewed in the PBI portal, only works with PBI workspace version 2, can't access the PBI portal, not necessary to have a pro license, need dedicated capacity, can import reports, can't install an on-premises gateway, can edit credentials, can refresh on demand.

## Configure service principal

- Create a web app service principal and secret
- Service principal an instance of that class
- Can create an instance of an application
- Register the application in multiple tenants
- Only allow apps that the PBI admin approves
    - Additional tenant settings
    - Access PBI with the app
    - Function similar like the new workspace settings
    - Only through the REST APIs

## Limitations and considerations

- Assigning a workspace to a capacity API isn't implemented yet
    - You can do it from the Power BI admin portal, or using a user token API call
- Can't be a capacity admin
- Using an Analysis Services live connection data source, or using Azure Analysis Services aren't supported
- Can't install an on-premises data gateway
- Can't be an on-premises data gateway admin
- Only works with **app workspaces *version 2***
- **My Workspace** isn't supported.
- Can't sign in to the Power BI portal
- There are no APIs that can be used with the service principal to create dashboards
- Can't import or export application

## Next steps

- [Power BI Embedded for your customers](embed-sample-for-customers.md)
- [Registering an app](register-app.md)