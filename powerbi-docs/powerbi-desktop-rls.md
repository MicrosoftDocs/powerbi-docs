---
title: Understand row-level security (RLS) with Power BI Desktop
description: How to configure row-level security for imported datasets, and DirectQuery, within Power BI Desktop.
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
ms.tgt_pltfrm: na
ms.workload: powerbi
ms.date: 10/12/2017
ms.author: asaxton

---
# Row-level security (RLS) with Power BI Desktop
Row-level security (RLS) with Power BI Desktop can be used to restrict data access for given users. Filters restrict data at the row level. You can define filters within roles.

You can now configure RLS for data models imported into Power BI with Power BI Desktop. You can also configure RLS on datasets that are using DirectQuery, such as SQL Server. Previously, you were only able to implement RLS within on-premises Analysis Services models outside of Power BI. For Analysis Services live connections, you configure Row-level security on the on-premises model. The security option will not show up for live connection datasets.

> [!IMPORTANT]
> If you defined roles/rules within the Power BI service, you will need to recreate those roles within Power BI Desktop and publish the report to the service.
> 
> 

Learn more about options for [RLS within the Power BI Service](service-admin-rls.md).

[!INCLUDE [include-short-name](includes/rls-desktop-define-roles.md)]

[!INCLUDE [include-short-name](includes/rls-desktop-view-as-roles.md)]

[!INCLUDE [include-short-name](includes/rls-limitations.md)]

[!INCLUDE [include-short-name](includes/rls-faq.md)]

## Next steps
[Row-level security (RLS) with the Power BI service](service-admin-rls.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

