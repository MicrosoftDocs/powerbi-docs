<properties
   pageTitle="Power BI Pro content - what is it?"
   description="Power BI Premium is dedicated capacity for your organization or team, giving you more dependable performance and larger data volumes, without requiring you to purchase per-user licenses."
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/31/2017"
   ms.author="asaxton"/>

# Power BI Premium - what is it?

Power BI Premium is a dedicated resource for your organization or team, giving you more dependable performance and larger data volumes, without requiring you to purchase per-user licenses.

You can take advantage of Power BI Premium by assigning workspaces to a Premium capacity. *Premium capacity* is a dedicated resource for your organization. For workspaces that are not assigned to a premium capacity, these will be in a shared capacity.

*Shared capacity* is the experience you are used to with Power BI, where your workloads run on computational resources shared by other customers.

## Capacity tiers

There are two types of capacity within Power BI. Shared capacity and Power BI Premium capacity. Here is a look at what the differences are between them.

||Shared capacity|Power BI Premium capacity|
|---------|---------|---------|
|**Refresh rate**|8/day|Not restricted|
|**Isolation with dedicated hardware**|![](media/common/not-available.png "Not available")|![](media/common/available.png "Available")|
|**Enterprise Distribution to** ***all users***|||
|Apps|![](media/common/not-available.png "Not available")|![](media/common/available.png "Available")<sup>1</sup>|
|Embedded API and controls|![](media/common/not-available.png "Not available")|![](media/common/available.png "Available")<sup>2</sup>|
|**Publish Power BI reports on-premises**|![](media/common/not-available.png "Not available")|![](media/common/available.png "Available")|

*<sup>1</sup> Free user consumption in apps includes viewing content in web and mobile, using Q&A, Quick Insights and Cortana.*  
*<sup>2</sup> Future enhancements coming to Power BI Premium post GA.*

### Premium capacity

To start using a Power BI Premium capacity, you need to assign a workspace to a capacity. For more information on how to assign a workspace to a premium capacity, see [Manage Power BI Premium](powerbi-admin-premium-manage.md).

When a workspace is backed by premium capacity, you enjoy the benefits of Power BI Premium.

- Noisy neighbors isolation
- Huge dataset storage with no user quotas
- Higher dataset refresh rates

If an App workspace is backed by premium capacity, the published app can then be used by any user in your organization regardless of the license they are assigned. This means that even Power BI Free users can use those published apps.

### Shared capacity

By default, your workspace will be in shared capacity. This includes your personal *My workspace* along with App workspaces. A Shared capacity is the experience you are used to with Power BI, where your workloads run on computational resources shared by other customers.

### Premium capacity nodes

Power BI Premium is available in node configurations with different v-core capacities. For more information about specific SKU offereings and cost, see [Power BI pricing](https://powerbi.microsoft.com/pricing/). A [cost calculator](https://powerbi.microsoft.com/calculator/) is also available.

- P nodes can be used for embedded (Platform as a Service - PaaS) or service (Software as a Service - SaaS) deployments

|Capacity Node|Total cores<br/>*(Backend + frontend)*|Backend Cores|Frontend Cores|
|---------|---------|---------|---------|
|P1|8 v-cores|4 cores, 25GB RAM|4 cores|
|P2|16 v-cores|8 cores, 50GB RAM|8 cores|
|P3|32 v-cores|16 cores, 100GB RAM|16 cores|

* The frontend cores are responsible for the web service, dashboard and report document management, access rights management, scheduling, APIs, uploads and downloads, and generally for everything that relates to the user experience.

* The backend cores are responsible for the heavy lifting: query processing, cache management, running R servers, data refresh, natural language processing, real-time feeds, and server-side rendering of reports and images. With the backend cores, a certain amount of memory is reserved as well. Having sufficient memory becomes especially important when dealing with large data models or with a large number of active datasets.

> [AZURE.NOTE] The current cost calculator will be updated soon to reflect ISV pricing.

## Free vs. Pro tiers

*All users* in the service are either Free or Pro. While Pro users can publish content to both shared and Premium capacity, only Pro users can publish content to Premium capacity. Free users can now connect to all data sources through all connectivity options such as DirectQuery, live connection and the use of the data gateway.

## Power BI Report Server

Power BI Premium includes the right to run Power BI Report Server on-premises. For more infomation, see [Get started with Power BI Report Server](report-server/reportserver-get-started.md).

## Next steps

[Power BI Premium FAQ](powerbi-premium-faq.md)  
[How to purchase Power BI Premium](powerbi-admin-premium-purchase.md)  
[Managing Power BI Premium](powerbi-admin-premium-manage.md)  
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  
[Administering Power BI in your organization](powerbi-admin-administering-power-bi-in-your-organization.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)