<properties
   pageTitle="Power BI Premium release notes"
   description="Read release notes for Power BI Premium, a dedicated capacity for your organization or team."
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
   ms.date="06/23/2017"
   ms.author="asaxton"/>

# Power BI Premium release notes

These are the June release notes for Power BI Premium, a dedicated capacity giving your organization or team more dependable performance, larger data volumes, and the ability to distribute content without per-user licenses for viewers.

## June release notes

- Usage metrics for the capacity admin portal may misreport usage in the capacity. The memory thrashing metric in particular may over-report the memory pressure on your capacity. We are working on increasing the accuracy of the usage metrics.
- Dynamic row-level security (RLS) is not yet available for embedded use cases. We are working on enabling this.
- Distributing Power BI apps to users in other AAD tenants using powerbi.com is not yet supported. We are working on enabling this.
- Users of the Personal Gateway must upgrade to the latest version in order to continue refreshing their data in Premium workspaces.
- Imported datasets greater than 1 GB are not supported in Premium capacity at initial release. We are working on enabling this.
- Users must log in at least once to the Power BI service before they can be assigned as capacity admins or given workspace assignment permissions.
- When you republish an existing dataset to Premium capacity, Q&A may take 1-2 hours to reflect the changes. This also applies to scheduled refreshes for datasets in Premium capacity. We are working on improving this.
- Quick Insights are not yet available for datasets in workspaces assigned to a Premium capacity. We are working on enabling this.
- You may see transient cases where you achieve more Direct Query/live connection queries per second than what is included in your capacity SKU. You shouldn't rely on throughput above what is included in your capacity SKU.


## Next steps

[Power BI Premium FAQ](powerbi-premium-faq.md)  
[How to purchase Power BI Premium](powerbi-admin-premium-purchase.md)  
[Managing Power BI Premium](powerbi-admin-premium-manage.md)  
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  
[Administering Power BI in your organization](powerbi-admin-administering-power-bi-in-your-organization.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)