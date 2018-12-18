---
title: Register an Azure AD app using service principle to embed Power BI content
description: Learn how to register an application within Azure Active Directory using service principle for use with embedding Power BI content.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ""
ms.component: power-bi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 01/31/2018
---

# Service principal for Power BI Embedded applications

To access resources that are secured by an Azure AD tenant, the entity that requires access must be represented by a security principal. This is true for both users (user principal) and applications (service principal).

The security principal defines the access policy and permissions for the user/application in the Azure AD tenant. This enables core features such as authentication of the user/application during sign-in, and authorization during resource access.

When an application is given permission to access resources in Power BI upon registration or consent, a service principal object is created.

**Power BI APIs** and **Power BI .NET SDK** now support calls using service principle.

## Application registration

When you register an Azure AD application in the Azure portal, two objects are created in your Azure AD tenant:

- An application object
- A service principal object

### Application and service principal relationship

Consider the application object as the *global* representation of your application for use across all tenants, and the service principal as the *local* representation for use in a specific tenant.

The application object serves as the template from which common and default properties are *derived* for use in creating corresponding service principal objects. 

A service principal must be created in each tenant where the application is used, enabling it to establish an identity for sign-in and/or access to resources being secured by the tenant. A single-tenant application has only one service principal (in its home tenant), created and consented for use during application registration.

## Using service principal

You should use service principle when you don't want to use an actual Power BI (master) account to be able to authenticate a Power BI Embedded application. Especially when using multi-factor authentication (MFA) with Azure.  It is more secure than just using a standard login account. 

## Service principal vs master account

There are a few differences between using service principle and master account for authenticating into your Power BI Embedded application.

With service principal, you can hide your account information within your application by using an application id (app id) and an application secret (app secret). However, you cannot use the app id and the app secret. SPN can create workspaces, add users to groups and remove users, work with APIs, can be viewed in the PBI portal, only works with PBI workspace version 2, cannot access the PBI portal, not neccessary to have a pro license, need dedicated capacity, can import reports, can't install an on-premises gateway, can edit credentials, can refresh on demand.

### Configure service pricniple

- Create a web app service principle and secret
- Service principle an instance of that class
- Can create an instance of an application
- Register the application in multiple tenants
- Only allow apps that the PBI admin approves
    - Additional tenant settings
    - Access PBI with the app
    - Function similar like the new workspace settings
    - Only through the REST APIs

## Limitations and considerations

- Assigning a workspace to a capacity API is not implemented yet
    - You can do it from the Power BI admin portal, or using a user token API call
- THe service principal app cannot be a capacity admin
- An embedded report using a live Analysis Services connection on-premises or using Azure Analysis Services are not supported
 Gateway APIs are not available with service principal
- SErvice principal cannot be an on-premises gateway admin
- App only token support is not supported for “My Workspace”.

## Next steps

* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Registering an app](register-app.md)