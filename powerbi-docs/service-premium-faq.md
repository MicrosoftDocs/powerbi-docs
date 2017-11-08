---
title: Power BI Premium FAQ
description: Browse a list of frequently asked questions and answers about the Power BI Premium offering.
services: powerbi
documentationcenter: ''
author: guyinacube
manager: erikre
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/20/2017
ms.author: asaxton

---
# Power BI Premium FAQ
Browse a list of frequently asked questions and answers about the Power BI Premium offering.

* If you have other questions, [try asking the Power BI Community](http://community.powerbi.com/).
* Still have an issue? Please visit the [Power BI support page](https://powerbi.microsoft.com/support/).
* Or click the **Contact Me** icon ![](media/service-premium-faq/power-bi-contact-me-icon.png) in the lower-right corner of this browser window.

## Power BI Premium
**What is Power BI Premium?**  
Power BI Premium is a new capacity-based offering that includes:

* Flexibility to publish reports broadly across an enterprise, without requiring recipients to be licensed individually per user.
* Greater scale and performance from dedicated capacity in the Power BI service.
* The ability to maintain BI assets on-premises with Power BI Report Server.
* One API surface, a consistent set of capabilities and access to the latest features for embedded analytics.

**What does Power BI Premium do? How does it work?**  
Power BI Premium consists of capacity in the Power BI service exclusively allocated to each organization and supported by dedicated hardware fully managed by Microsoft. Organizations can choose to apply their dedicated capacity broadly, or allocate it to assigned workspaces based on the number of users, workload needs or other factors—and scale up or down as requirements change.

**How is Power BI Pro different than Power BI Premium? Why is Power BI Premium necessary?**  
Power BI Premium is a capacity-based license, while Power BI Pro is a user-based license.

Power BI Premium consists of capacity in the Power BI service exclusively allocated to each organization and supported by dedicated hardware fully managed by Microsoft—removing restrictions on dataset sizes and refresh rates, and supporting isolation due to the dedicated hardware. Power BI Premium also provides the flexibility to publish reports broadly across an enterprise, without requiring recipients to be licensed individually per user.

Power BI Pro is for those users publishing reports, sharing dashboards, collaborating with colleagues in workspaces and engaging in other related activities – such as the ability to:

* Edit and save customized views
* Create personal dashboards (pin to new dashboard)
* Analyze data in Excel or Power BI Desktop
* Share with Excel Web App support
* Share dashboards and collaborate with Office 365 Groups
* Integrate content with Microsoft Teams

**Do I need Power BI Pro to use Power BI Premium?**  
Yes. Power BI Pro is required to publish reports, share dashboards, collaborate with colleagues in workspaces and engage in other related activities.

**How much will Power BI Premium cost? How many SKUs will you make available?**  
Power BI Premium can be purchased based on the number of virtual cores. You can see prices at the [Power BI pricing page](https://powerbi.microsoft.com/pricing/). For more information on nodes and v-cores, see the [Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper). Also use this [calculator](https://powerbi.microsoft.com/calculator/) to get an estimate of how much Premium capacity you may need.

**What do you mean by "capacity"?**  
"Capacity" refers to a named capacity provisioned by an admin through the Power BI Premium capacity admin portal. A capacity is a grouping of one or more nodes. See the [Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper) for more information.

**How is Power BI Premium billed?**  
Power BI Premium is billed monthly with an annual commitment.

**How will I buy Power BI Premium?**  
Power BI Premium is available as an add-on to Power BI Pro in the O365 admin center. For more information, see [How to purchase Power BI Premium](service-admin-premium-purchase.md). You can also contact your Microsoft representative for more information.

**How do I know how much Power BI Premium capacity I need to purchase?**  
Use this cost [calculator](https://powerbi.microsoft.com/calculator/) to estimate how much Power BI Premium capacity you may need.

**When will Power BI Premium be available? Will it be available simultaneously across all geographies?**  
Power BI Premium will be generally available in late Q2 of 2017 for all geographies currently supported by the Power BI service.

**Will Power BI Premium meet certification and regulatory compliance at the time of release? What about national clouds?**  
Power BI Premium will be generally available in late Q2 of 2017 for all geographies currently supported by the Power BI service. National clouds—specifically Germany, China and the U.S. government—are planned to be available in Q3 of 2017. Power BI’s certification and regulatory compliance standards will apply to Power BI Premium at the time of general availability.

**Is Power BI Premium available with Office 365 E5?**  
Power BI Premium is available as an add-on to Power BI Pro. Office 365 E5 includes Power BI Pro. E5 customers can purchase Premium as an add-on to their existing Pro licenses.

**Can you outline a scenario of how Power BI Pro and Power BI Premium work to cover an organization for Modern BI?**  
The follow examples outline how customers can meet their BI needs using a combination of Power BI Pro + Power BI Premium.

| Scenario 1 | Scenario 2 | Scenario 3 | Scenario 4 |
| --- | --- | --- | --- |
| An organization / department wants every employee to have self-service BI and collaborate with each other – sharing dashboards, performing ad hoc analysis, and publishing reports |An organization / department has a combination of users who require self-service BI and collaboration as well as users who only need to consume BI content |An organization / department has users who require self-service BI and collaboration as well as the requirement to keep reports on-premises |A finance department is actively working to analyze several large datasets in advance of an earnings announcement and requires unthrottled and isolated capacity to manage the workloads |
| **Solution:**<br/><br/>1. Power BI Pro for every user<br/><br/>2. Look to expand the opportunity adding Power BI Premium – see the additional scenarios |**Solution:**<br/><br/>1. Power BI Pro for users requiring self-service BI and collaboration<br/><br/>2. Add Power BI Premium to be able to distribute BI content to users who only need to consume |**Solution:**<br/><br/>1. Power BI Pro for users requiring self-service BI and collaboration<br/><br/>2. Add Power BI Premium to be able to publish reports on-premises – and move to the cloud at their own pace |**Solution:**<br/><br/>1. Power BI Pro for every user in the finance department<br/><br/>2. Add Power BI Premium for the dedicated resources – in the cloud – to be used exclusively by the finance team providing larger scale and greater performance |

**What is Power BI Report Server? Does this mean you’re making Power BI available on-premises?**  
Power BI Report Server is available as part of Power BI Premium and compatible with SQL Server Reporting Services reports, allowing the deployment and distribution of interactive Power BI reports, and paginated reports, on-premises within the boundaries of an organization’s firewall. Organizations can choose Power BI in the cloud, or elect to keep reports on-premises with Power BI Report Server and move to the cloud at their pace.

Power BI capabilities such as real-time dashboards, natural language query, and others in the Power BI service are not available as part of Power BI Report Server. 

For more information about Power BI Report Server, see [Get started with Power BI Report Server](report-server/get-started.md).

**Is Power BI Report Server the feature Microsoft made available as the Power BI Reports for SSRS technical preview? Why is this now part of Power BI when it appeared to be a feature of SQL?**  
Power BI Report Server is available as part of Power BI Premium and compatible with SQL Server Reporting Services reports, allowing the deployment and distribution of interactive Power BI reports, and paginated reports, on-premises within the boundaries of an organization’s firewall.

The announcement of Power BI Premium is the first time we’ve disclosed how this functionality will be brought to market.

For more information about Power BI Report Server, see [Get started with Power BI Report Server](report-server/get-started.md).

**What are Power BI Apps?**  
We are evolving content packs into Power BI apps to improve how users discover and explore insights at enterprise scale. Available today, Power BI apps offer a simplified way of deploying dashboards and reports to specific people, groups or an entire organization. Business users can easily install these apps and navigate them with ease, centralizing content in one place and updating automatically. 

For more information about Apps, see [What are apps in Power BI?](service-install-use-apps.md).

**Are you making changes to Power BI Pro, Power BI Free, Power BI Desktop, et al. as part of the Power BI Premium rollout?**  
Today we’re also simplifying the distinction between Power BI Pro and the free service. We’ve received feedback that while the free service is intended for personal use and Power BI Pro enables collaboration, functional differences between them have created confusion for users. Going forward, we will improve the free service to have the same functionality as Power BI Pro, but will limit sharing and collaboration features to only Power BI Pro users.

Users of the free Power BI service will benefit from access to all data sources, increased workspace storage limits, and higher refresh and streaming rates. These changes will be effective June 1, 2017, and you can read more at [Self-service sign up for Power BI](service-self-service-signup-for-power-bi.md). Power BI Desktop remains available for free.

For information regarding the Extended Pro Trial offering, see [Extended Pro Trial activation](service-extended-pro-trial.md).

## Power BI Free
**What capabilities are being added to the free service?**  
Beginning June 1, 2017, the free service will have capabilities equivalent to Power BI Pro, except for sharing, enterprise distribution, and collaboration. This includes the same 10 GB workspace limit, up to 8 daily scheduled refreshes for datasets, and maximum 1M/hour streaming data rate. We’re also including access to all data sources, including those available through the on-premises data gateway.

**Which Power BI Pro capabilities are not available with the free service?**  
Peer-to-peer dashboard sharing, app workspaces (previously referred to as group workspaces), Analyze in Excel and Power BI Apps (unless backed by Premium capacity) are capabilities limited to Power BI Pro.

**When will these changes go into effect?**  
Changes to the free service will go into effect on June 1, 2017.

**How will impacted users of the free service be notified of these changes?**  
Active users of the free service impacted by the changes on June 1, 2017 will receive an email communication from Microsoft, as well as notifications when they sign into the Power BI service beginning May 3, 2017.

Existing users of the free service who have been active within the past year can take advantage of the free, 12-month extended trial of Power BI Pro. The offer will deliver the full capabilities of Power BI Pro to ensure users have the appropriate time to adjust how you use the service. For information regarding the Extended Pro Trial offering, see [Extended Pro Trial activation](service-extended-pro-trial.md).

**Will users lose access to their content (dashboards, reports) at that time?**  
No. They will not lose access to any content they’ve uploaded to the Power BI service. Content shared with others may no longer be accessible by recipients on June 1, 2017. Likewise, at that time they may no longer have access to content others have shared with them.

Existing users of the free service who have been active within the past year can take advantage of the free, 12-month extended trial of Power BI Pro. The offer will deliver the full capabilities of Power BI Pro to ensure users have the appropriate time to adjust how you use the service. For information regarding the Extended Pro Trial offering, see [Extended Pro Trial activation](service-extended-pro-trial.md).

**How do users know if they’re eligible for the extended Power BI Pro trial?**  
Please refer to the Extended Pro Trial [terms and conditions](https://aka.ms/power-bi-trial).

For information regarding the Extended Pro Trial offering, see [Extended Pro Trial activation](service-extended-pro-trial.md).

**What should users do if they’re not eligible for the extended Power BI Pro trial?**  
Sign up for a standard 60-day Power BI Pro trial [here](https://app.powerbi.com/signupredirect?pbi_source=web).

**Does the introduction of Power BI Premium change the capabilities of the free service?**  
Users of the free service with access to dedicated capacity in Power BI Premium will have the ability to receive content distributed to them by Power BI Pro users via published Apps.

## Power BI Pro
**What is changing with Power BI Pro?**  
No changes are coming to Power BI Pro.

**What about Office – is Power BI Pro still included in Office 365 E5?**  
Yes. Power BI Pro will continue to be included in Office 365 E5.

**Do I have the option to return my Power BI Pro licenses if I want to switch to Power BI Premium?**  
No. Power BI Premium is an add-on to Power BI Pro; therefore Premium requires Pro licenses.

**Why is Power BI Pro necessary? Shouldn’t I just buy Power BI Premium?**  
Power BI Premium is a capacity-based license, while Power BI Pro is a user-based license intended for quick, easy-to-use self-service analytics for users requiring collaboration, dashboard sharing, ad hoc analysis, and report publishing – such as the ability to:

* Edit and save customized views
* Create personal dashboards (pin to new dashboard)
* Analyze data in Excel or Power BI Desktop
* Share and view Excel workbooks with Excel Web App support
* Share dashboards and collaborate with Office 365 Groups
* Integrate content with Microsoft Teams

## Power BI Embedded
**What’s changed with Power BI Embedded?**  
As part of Power BI Premium we are converging Power BI Embedded with the Power BI service to deliver one API surface, a consistent set of capabilities and access to the latest features. Moving forward we encourage those interested in embedding Power BI in their apps to start with Power BI Desktop and move to deployment with Power BI Premium.

**What are the benefits of Power BI Premium for embedding analytics in apps?**  
Power BI Premium is a capacity-based offering that runs on dedicated hardware and is fully managed by Microsoft as part of the Power BI service. When you think about your application development lifecycle, Power BI Premium will offer new benefits like flexible and predictable costs, improved content management for developers and the full availability of Power BI capabilities for embedded scenarios.

**Do I need to migrate my existing app built on Power BI Embedded?**  
Power BI Embedded will continue to be available for existing apps per the following schedule:

| Licensing agreement | Availability of Power BI Embedded |
| --- | --- |
| Enterprise Agreement |Until expiration of existing agreement |
| Direct and CSP |One year from General Availability of Power BI Premium |

Yes, you should start thinking about migrating your embedded analytics solution to Power BI Premium. For more information, see [How to migrate Power BI Embedded workspace collection content to Power BI](powerbi-developer-migrate-from-powerbi-embedded.md).

**How do I migrate my existing app built on Power BI Embedded?**  
Refer to the [migration documentation](powerbi-developer-migrate-from-powerbi-embedded.md) for guidance on migrating apps.

**Is Microsoft going back on its commitment to Power BI Embedded Free?**  
Under the previous model, we offered a limited number of sessions for developing and testing. In the new scenario, customers will continue having options available to them to start developing and testing for free in their way to be production ready. Customers will benefit from a 2-month Power BI Pro trial to get started with dev & test. Power BI Desktop, the data exploration and report authoring tool, will continue to be available for free.

**Is Power BI Embedded still an Azure Service? Where will I purchase, provision and manage Power BI Embedded?**  
Power BI Embedded is converging with Power BI service and therefore it will be purchased, provisioned and managed as such moving forward. For more information, see [Embedding with Power BI](powerbi-developer-embedding.md).

## Power BI Desktop
**What changes are you making to Power BI Desktop?**  
No changes are being made to Power BI Desktop.

## Power BI Report Server
**Why is Power BI Report Server included in Power BI Premium rather than being sold as a separate product?**  
Power BI Premium introduces the ability to maintain BI assets on-premises with Power BI Report Server. Power BI Report Server is an on-premises server that allows the deployment and distribution of interactive Power BI reports, and paginated reports, completely within the boundaries of the organization’s firewall. With Power BI Premium the same number of virtual cores an organization provisions in the cloud can also be deployed on-premises through Power BI Report Server, without the need to split the capacity. Organizations can choose Power BI in the cloud, or elect to keep reports on-premises with Power BI Report Server and move to the cloud at their pace.

For more information, see [Get started with Power BI Report Server](report-server/get-started.md).

**How can customers get access to Power BI Report Server?**  
Power BI Report Server is available through Power BI Premium or as a benefit for customers with SQL Server EE with SA. Contact your Microsoft representative for more information.

**Why is Power BI Report Server not available as benefit for SQL Server Standard or Enterprise Edition customers?**  
Power BI Report Server is available to SQL Server customers with EE + SA licenses or for purchase through Power BI Premium. Power BI is a SaaS service, and Power BI Report Server will follow the same subscription-based delivery model.

## Next steps
[Power BI Premium - what is it?](service-premium.md)  
[Power BI Premium release notes](service-premium-release-notes.md)  
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  
[Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)  
[Extended Pro Trial activation](service-extended-pro-trial.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

