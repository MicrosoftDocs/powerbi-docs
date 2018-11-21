---
title: Overview of the Power BI service content pack program
description: Content Pack Certification Program
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 11/20/2018
ms.author: maggies
---

# Overview of the Power BI service content pack program
A content pack is a set of out-of-box content allowing users to immediately gain insights from a source. A content pack is typically focused on a specific business scenario providing insights for a role, domain, or workflow.

ISVs can build template content packs that allow customers to connect and instantiate with their own accounts. As domain experts, they can unlock the data in a way that is easily consumable by business users. The content packs offer adhoc monitoring and analysis to your customers without investing heavily in reporting infrastructure.

These ISV built template content packs can be submitted to the Power BI team to become publicly available in the Power BI content pack gallery (app.powerbi.com/getdata/services) and on Microsoft AppSource (appsource.microsoft.com). An example of the public content pack experience can be found [here](template-content-pack-experience.md).

## Overview
The general process to develop and submit a template content pack involves multiple steps.

 ![Process](media/service-content-pack-overview/developer-content-pack-overview.png)

1. [Review the requirements](#requirements) and make sure you meet them
2. [Build content](template-content-pack-authoring.md#queries) in the Power BI Desktop
3. [Create a dashboard](template-content-pack-authoring.md#dashboard) in PowerBI.com
4. [Test the content pack](template-content-pack-testing.md) yourself within your organization
5. [Submit](template-content-pack-testing.md#submission) the content to Power BI for publishing

<a name="requirements"></a>

## Requirements
To build and submit a content pack to be published in the PowerBI service and AppSource, you must meet the following requirements:

* You have a SaaS application used by business users.
* Your SaaS application has user data that can be visualized in Power BI.
* Your SaaS application has an API that is accessible through public internet. Ideally the API is a REST-based API or an OData feed. Power BI content packs support multiple authentication types like Basic Authentication, OAuth 2.0 and API Key. 
* Your SaaS application is approved for publishing a content pack. Submit your request to pbiservicesapps@microsoft.com. We will review each submission on relevance and expected usage. 
* Signed partner agreement. You will do that in the [submission step](template-content-pack-testing.md#submission).

Review the [authoring](template-content-pack-authoring.md) section for more details on the technical requirements.

## Business scenario
Content packs provide insights and metrics focused on a specific business scenario. Understanding your audience and the benefit they receive from the content pack helps ensure your users are successful with the content you provide.

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
For support during development, use [https://powerbi.microsoft.com/support](https://powerbi.microsoft.com/support). Customer incidents quickly find their way to the appropriate team.

## Next step
[Authoring](template-content-pack-authoring.md)