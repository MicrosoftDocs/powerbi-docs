---
title: What are Power BI template apps?
description: Content Pack Certification Program
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 01/09/2019
ms.author: maggies
---

# What are Power BI template apps?

The new Power BI *template apps* enable Power BI partners to build Power BI apps with little or no coding, and deploy them to any Power BI customer.  This article contains step-by-step instructions to create a Power BI template app. 

If you can create Power BI reports and dashboards, you can become a *template app builder* who builds and packages analytical content into an *app*. You can then deploy your app to other Power BI tenants through any available platform, such as AppSource, or by using it in your own web service. As a builder you can create a protected analytics package for distribution. 

Power BI tenant admins govern and control who in their organization is authorized to install a template app. Those who are authorized can install your template app, then modify it and distribute it to the Power BI consumers in their organization.

## Overview
The general process to develop and submit an template content pack involves multiple steps.

 ![Process](media/service-content-pack-overview/developer-content-pack-overview.png)

1. Create the template app workspace in the Power BI service (app.powerbi.com).
2. Create Power BI reports and save them to the template app workspace.
3. Create a dashboard in the template app workspace.
4. Create a pre-production version of the template app and test it in your tenant.
5. When it passes the test, create a production version and test it outside your tenant.
6. When it passes the external test, release it to your customers, either directly or in AppSource. 

<a name="requirements"></a>

## Requirements
To build and submit a content pack to be published in the PowerBI service and AppSource, you must meet the following requirements:

* You have a SaaS application used by business users.
* Your SaaS application has user data that can be visualized in Power BI.
* Your SaaS application has an API that is accessible through public internet. Ideally the API is a REST based API or an OData feed. Power BI content packs support multiple authentication types like Basic Authentication, OAuth 2.0 and API Key. 
* Your SaaS application is approved for publishing a content pack. Submit your request to pbiservicesapps@microsoft.com. We will review each submission on relevance and expected usage. 
* Signed partner agreement. You will do that in the [submission step](template-content-pack-testing.md#submission).

Please review the [authoring](template-content-pack-authoring.md) section for more details on the technical requirements.

## Business scenario
Content packs provide insights and metrics focused on a specific business scenario. Understanding your audience and the benefit they'll receive from the content pack will help ensure your users are successfully with the content you provide.

### Tips
* Identify your audience and the task they're trying to accomplish  
* Focus on a certain time period (last 90 days) or the last N results  
* Only import the tables/columns related to your scenario  
* Consider offering more than one content pack for separate unique scenarios  

## Frequently asked questions
**Can I as a third party, build a Power BI Service content pack for a SaaS application that I don’t own?**

We require signing a partner agreement with the owner of the SaaS application prior to publishing a content pack in the service. As a third-party, you will need to facilitate signing of the partner agreement with the SaaS application owner.

**I don’t have a public developer API for my service. Can I still build a Power BI service content pack that pulls the data directly from the data storage?**

No, Power BI service content packs require a developer API that is accessible through public Internet.

**What kind of APIs are supported by service content packs and what authentication types can they work with?**

Power BI service content packs support any REST API or OData feed. Power BI can work with multiple authentication types including Basic Authentication, OAuth2.0 and Web API Key. More details on the technical requirements in the [Authoring](template-content-pack-authoring.md#dashboard) article.

**I have a content pack published in Power BI. How can I update it?**

Published content packs can be updated once a month. Update requests submitted to [pbiservicesapps@microsoft.com](mailto:pbiservicesapps@microsoft.com) before the last day of the current month, will be published in the first week of the following month.

**I have more questions about service Content Packs. How can I contact you?**

Feel free to email us your questions at [pbiservicesapps@microsoft.com](mailto:pbiservicesapps@microsoft.com)

## Support
For support during development, please use [https://powerbi.microsoft.com/support](https://powerbi.microsoft.com/support). This is actively monitored and managed. Customer incidents quickly find their way to the appropriate team.

## Next step
[Authoring](template-content-pack-authoring.md)