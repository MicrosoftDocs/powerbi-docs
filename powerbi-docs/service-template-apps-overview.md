---
title: What are Power BI template apps?
description: Content Pack Certification Program
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 01/22/2019
ms.author: maggies
---

# What are Power BI template apps?

The new Power BI *template apps* enable Power BI partners to build Power BI apps with little or no coding, and deploy them to any Power BI customer.  This article is an overview of the Power BI template app program.

Template apps are a replacement for the current service content packs. As a Power BI partner, you create a set of out-of-the-box content your customers can use to gain insights from a source immediately.  

You build template apps that allow your customers to connect and instantiate with their own accounts. As domain experts, they can unlock the data in a way that's easily consumable by their business users.  

You submit your partner-built template apps to Cloud Partner Portal. The apps then become publicly available in the Power BI App gallery (app.powerbi.com/getdata/services) and on Microsoft AppSource (appsource.microsoft.com). Here's an example of the public template app experience.  

## Overview
The general process to develop and submit an template app involves multiple steps.


|Power BI Desktop |  |Power BI service  |  |Cloud Partner Portal  |
|---------|--|---------|---------|---------|
|Build a data model and report in a .pbix file |  | Create a workspace. Import .pbix file. Create complementary content: a dashboard and dataflow  |  | Register as a partner |
|   |  |         |  | |
|   |  | Craete a test package and run internal validation        |  | |
|   |  |         |  | |
|   |  | Promote the test package to preproduction for validation outside your Power BI tenant, and submit it to AppSource  |  | With your preproduction package, create a Power BI template app offer and start the validation process |
|   |  |         |  | |
|   |  | Promote the preproduction package to production |  | Go live |
 

1. [Review the requirements](#requirements) to make sure you meet them. 

1. Build a report in Power BI Desktop. Use parameters so you can save it as a template (.pbit). 

1. Create a workspace for your template app in the Powerbi.com tenant. 

1. Import and add content to your app. 

1. Create a test package to test the template app yourself within your organization 

1. Promote the Test app to Pre-production to submit the app for validation in AppSource and to test outside your own tenant. 

1. Submit the content to Cloud Partner Platform for publishing. 

1. Make your offer go 'Live' in AppSource and move your App to production in Power BI.
2. Now you can start developing the next version. 

## Requirements
To publish a template app to the Power BI service and AppSource, you must meet the requirements for [becoming a Cloud Marketplace Publisher](https://docs.microsoft.com/azure/marketplace/become-publisher).

## Tips 
- Make sure your app includes sample data to get everyone started in a click 
- Carefully examine your Application by installing it in your tenant and in a secondary tenant. Make sure customers only see what you want them to see. 
- Use AppSource as your online store to host your application. This way everyone using Power BI will get to find your app. 
- Consider offering more than one template app for separate unique scenarios. 
- Enable data customization, for example support custom connection and parameters configuration by the installer.


## Frequently asked questions
**Can I as a third party, build a Power BI Service content pack for a SaaS application that I don’t own?**

We require signing a partner agreement with the owner of the SaaS application prior to publishing a content pack in the service. As a third-party, you will need to facilitate signing of the partner agreement with the SaaS application owner.

**I don’t have a public developer API for my service. Can I still build a Power BI service content pack that pulls the data directly from the data storage?**

No, Power BI service content packs require a developer API that is accessible through public Internet.

**What kind of APIs are supported by service content packs and what authentication types can they work with?**

Power BI service content packs support any REST API or OData feed. Power BI can work with multiple authentication types including Basic Authentication, OAuth2.0 and Web API Key. More details on the technical requirements are in the [Authoring](template-content-pack-authoring.md#dashboard) article.

**I have a content pack published in Power BI. How can I update it?**

Published content packs can be updated once a month. Update requests submitted to [pbiservicesapps@microsoft.com](mailto:pbiservicesapps@microsoft.com) before the last day of the current month, will be published in the first week of the following month.

**I have more questions about service Content Packs. How can I contact you?**

Feel free to email us your questions at [pbiservicesapps@microsoft.com](mailto:pbiservicesapps@microsoft.com)

## Known limitations

| Feature | Known Limitation |
|---------|---------|
|Contents:  Datasets   | Exactly one dataset should be present |
|Contents: Reports     | Up to one report    |
| Contents: Dashboards | Up to one non-empty dashboard |
| Contents: Dataflows | No support for dataflows |
| Contents from files | Only PBIX files are allowed. These file types aren't supported: .rdl files (paginated reports), Excel workbooks   |
| Data sources | DirectQuery isn't allowed <br>Live connections aren’t allowed (no AS Azure\on-premises) <br>On-premises data sources aren't allowed(Personal\Enterprise gateways aren’t supported) <br>Real Time not allowed (no support for pushdataset) <br>Composite models |
| Dataset: cross-workspace | No cross-workspace datasets are allowed  |
| Content: Dashboards | Real Time tiles aren’t allowed (in other words, no support for PushDataset or pubnub) |
| Query parameters | Parameters of type “Any”\”Binary” type  will block refresh operation for dataset |
| Custom visuals | Only public-store-origin custom visuals are allowed. Organization store visuals not supported |



## Support
For support during development, please use [https://powerbi.microsoft.com/support](https://powerbi.microsoft.com/support). This is actively monitored and managed. Customer incidents quickly find their way to the appropriate team.

## Next step
[Authoring](template-content-pack-authoring.md)