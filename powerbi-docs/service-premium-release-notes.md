---
title: Power BI Premium release notes
description: Read release notes for Power BI Premium, a dedicated capacity for your organization or team.
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
ms.topic: get-started-article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/11/2017
ms.author: asaxton

---
# Power BI Premium release notes
These are the release notes for Power BI Premium, a dedicated capacity giving your organization or team more dependable performance, larger data volumes, and the ability to distribute content without per-user licenses for viewers.

* Users with Power BI Free licenses can now view dashboards shared with them from Premium workspaces in the Power BI service.
* Capacity admins now automatically get capacity assignment permissions.
* Dynamic row-level security (RLS) is now available for embedded use cases. For more information, see [Row-level security (RLS) with embedded analytics](developer/embedded-row-level-security.md).
* Distributing Power BI apps to users in other AAD tenants using powerbi.com is not yet supported. We are working on enabling this.
* Users of the Personal Gateway must upgrade to the latest version in order to continue refreshing their data in Premium workspaces.
* Imported datasets greater than 1 GB are not supported in Premium capacity at initial release. We are working on enabling this.
* Users must log in at least once to the Power BI service before they can be assigned as capacity admins or given workspace assignment permissions.
* You may see transient cases where you achieve more Direct Query/live connection queries per second than what is included in your capacity SKU. You shouldn't rely on throughput above what is included in your capacity SKU.

## Next steps
[Power BI Premium FAQ](service-premium-faq.md)  
[How to purchase Power BI Premium](service-admin-premium-purchase.md)  
[Managing Power BI Premium](service-admin-premium-manage.md)  
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  
[Administering Power BI in your organization](service-admin-administering-power-bi-in-your-organization.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

