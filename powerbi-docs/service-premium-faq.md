---
title: Power BI Premium FAQ
description: Browse a list of frequently asked questions and answers about the Power BI Premium offering.
author: minewiskan
ms.author: owend
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 02/05/2019

LocalizationGroup: Premium
---
# Power BI Premium FAQ

This article addresses questions frequently asked about Power BI Premium. For an overview, see [What is Power BI Premium?](service-premium.md).

* If you have other questions, [try asking the Power BI Community](http://community.powerbi.com/).
* Still have an issue? Please visit the [Power BI support page](https://powerbi.microsoft.com/support/).

**What is Power BI Premium?**  
Power BI Premium is a capacity-based offering that includes:

* Flexibility to publish reports broadly across an enterprise, without requiring recipients to be licensed individually per user.
* Greater scale and performance than shared capacity in the Power BI service.
* The ability to maintain BI assets on-premises with Power BI Report Server.
* One API surface, a consistent set of capabilities, and access to the latest features for embedded analytics.

**What does Power BI Premium do? How does it work?**  
Power BI Premium consists of capacity in the Power BI service exclusively allocated to each organization. The capacity is supported by dedicated hardware fully managed by Microsoft. Organizations can choose to apply their dedicated capacity broadly, or allocate it to assigned workspaces based on the number of users, workload needs, or other factors—and scale up or down as requirements change.

**How is Power BI Pro different than Power BI Premium?**  
Power BI Premium is a capacity-based license, while Power BI Pro is a user-based license. Power BI Pro is for those users publishing reports, sharing dashboards, collaborating with colleagues in workspaces and engaging in other related activities – such as the ability to:

* Edit and save customized views
* Create personal dashboards (pin to new dashboard)
* Analyze data in Excel or Power BI Desktop
* Share with Excel Web App support
* Share dashboards and collaborate with Office 365 Groups
* Integrate content with Microsoft Teams

**Do I need Power BI Pro to use Power BI Premium?**  
Yes. Power BI Pro is required to publish reports, share dashboards, collaborate with colleagues in workspaces and engage in other related activities. Power BI Pro isn't required to consume content in Premium capacity.

**Can you outline a scenario of how Power BI Pro and Power BI Premium work to cover an organization for Modern BI?**  
The following examples outline how customers can meet their BI needs using a combination of Power BI Pro and Power BI Premium.

| Scenario 1 | Scenario 2 | Scenario 3 | Scenario 4 |
| --- | --- | --- | --- |
| An organization or department wants every employee to have self-service BI and collaborate with each other – sharing dashboards, performing ad hoc analysis, and publishing reports. | An organization or department has a combination of users who require self-service BI and collaboration as well as users who only need to consume BI content. | An organization or department has users who require self-service BI and collaboration as well as the requirement to keep reports on-premises. | A finance department is actively working to analyze several large datasets in advance of an earnings announcement and requires unthrottled and isolated capacity to manage the workloads. |
| **Solution:**<br/><br/>1. Power BI Pro for every user<br/><br/>2. Look to expand the opportunity by adding Power BI Premium – see the additional scenarios |**Solution:**<br/><br/>1. Power BI Pro for users that require self-service BI and collaboration<br/><br/>2. Add Power BI Premium to be able to distribute BI content to users who only need to consume |**Solution:**<br/><br/>1. Power BI Pro for users that require self-service BI and collaboration<br/><br/>2. Add Power BI Premium to be able to publish reports on-premises – and move to the cloud as appropriate |**Solution:**<br/><br/>1. Power BI Pro for every user in the finance department<br/><br/>2. Add Power BI Premium for the dedicated resources – in the cloud – to be used exclusively by the finance team, providing larger scale and greater performance |

**How much does Power BI Premium cost? How many SKUs will you make available?**  
Power BI Premium is purchased based on the number of virtual cores. You can see prices at the [Power BI pricing page](https://powerbi.microsoft.com/pricing/). For more information on nodes and v-cores, see the [Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper). Also use this [calculator](https://powerbi.microsoft.com/calculator/) to get an estimate of how much Premium capacity you may need.

**What do you mean by "capacity"?**  
A capacity is a grouping of one or more nodes that is provisioned by an admin through the Power BI Premium capacity admin portal. See the [Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper) for more information.

**How is Power BI Premium billed?**  
Power BI Premium is billed monthly with an annual commitment.

**How do I buy Power BI Premium?**  
Power BI Premium is available from the Microsoft 365 admin center. For more information, see [How to purchase Power BI Premium](service-admin-premium-purchase.md). You can also contact your Microsoft representative for more information.

**How do I know how much Power BI Premium capacity I need to purchase?**  
Use the [cost calculator](https://powerbi.microsoft.com/calculator/) to estimate how much Power BI Premium capacity you may need.

**Is Power BI Premium available with Office 365 E5?**  
Power BI Premium is available as an add-on to Power BI Pro. Office 365 E5 includes Power BI Pro. E5 customers can purchase Premium as an add-on to their existing Pro licenses.

**What is Power BI Report Server? Does this mean you’re making Power BI available on-premises?**

Power BI Report Server is an on-premises server that allows the deployment and distribution of interactive Power BI reports, and paginated reports, completely within the boundaries of the organization’s firewall. Power BI Report Server is available through Power BI Premium or as a benefit for customers with SQL Server Enterprise Edition with Software Assurance. Contact your Microsoft representative for more information.

With Power BI Premium. the same number of virtual cores an organization provisions in the cloud can also be deployed on-premises through Power BI Report Server. There is no need to split the capacity. Organizations can choose Power BI in the cloud, or elect to keep reports on-premises with Power BI Report Server and move to the cloud at their pace.

For more information, see [Get started with Power BI Report Server](report-server/get-started.md).

**Next steps**

[What is Power BI Premium?](service-premium.md)
[Power BI Premium release notes](service-premium-release-notes.md)
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)
[Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)
[Extended Pro Trial activation](service-extended-pro-trial.md)
[Power BI Embedded FAQ](developer/embedded-faq.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)