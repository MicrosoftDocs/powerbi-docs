 -  -  - 
title: Multi - tenant SaaS application with embedded analytics
description: Design a multi - tenant SaaS application with embedded analytics.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi - developer
ms.topic: conceptual
ms.date: 01/07/2019
 -  -  - 

# Multi - tenant SaaS application

When designing a multi - tenant SaaS application, you must carefully choose the tenancy model that best fits the needs of your SaaS application. This is also true for Power BI as an embedded analytics part of your SaaS application. A tenancy model determines how each tenant’s data is mapped and managed within Power BI and within the storage account. Your choice of tenancy model impacts application design and management. Switching to a different model later might turn costly and disruptive. 

With Power BI Embedded there are 2 main fundamental approaches to maintaining separation between tenants.

   1. Workspace Based Isolation with a separate Power BI Workspace per tenant
   2. Row - Level Security Based Isolation where row level security on the underlying data is used to control and manage access to data

This article describes the different approaches and analyzes them according to several evaluation criteria.

## Concepts and terminology

AAD -  Azure Active Directory. Learn more.

AAD application -  an application identity in AAD. Required for authentication. 

SaaS application -  a software-as-a-service system implemented by an enterprise or ISV, usually an online Service and related software systems for serving multiple customer tenants (organizations). For this article, the SaaS application uses Power BI Embedded to serve analytics to its different tenants. Also note that Power BI Embedded can work for all types of applications as long as they have online connection. 

Tenant – A single customer (organization) that uses the SaaS application and any resources or data that customer brings to the SaaS application or the SaaS application allocates for serving that customer.

Power BI - The Power BI cloud service that serves as a platform for Power BI Embedded. Learn more.

Power BI Embedded - A set of public APIs built on top of the Power BI Service that allows developers to build applications that manage Power BI content and embed Power BI elements. Learn more.

Power BI Artifacts – there are several Power BI artifacts in Power BI workspaces such as dashboards, reports, datasets and dataflows.

Power BI Tenant - Is a set of Power BI resources associated with a single AAD tenant.

Power BI Workspace - A container for content in Power BI. Learn more.

Row - level security (RLS) - The ability to control user access to data for individual rows in a table which can be implemented in the data source or in the Power BI semantic model. Learn more.

Master user - The identity that represents the SaaS application in Power BI and that the SaaS application uses when calling Power BI APIs. Needs to be an AAD user with a Power BI Pro license.

AAD Application user (service principal) - The identity that represents the SaaS application in Power BI and that the SaaS application uses when calling Power BI APIs. Needs to be an AAD web application. Can replace the use of a ‘Master user’ to authenticate with Power BI.

Capacity - a set of resources dedicated to running the Power BI service. Power BI Premium capacities are intended for Enterprises using Power BI internally, while Power BI Embedded capacities are intended for application developers developing SaaS applications for third parties.

Power BI Pro license - is a user-based Power BI license which grants rights to publish content to app workspaces, consume apps without Premium capacity, share dashboards and subscribe to dashboards and reports. Learn more.

Data connectivity modes - Connecting data sources to Power BI can be done in different modes - Import data to Power BI, which is the most common way to get data, or connect directly to the data in its original source repository, known as DirectQuery.Another mode connects directly to Analysis Services data and called Live connection. Learn more on data connectivity modes.