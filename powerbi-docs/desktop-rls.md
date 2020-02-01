---
title: Understand row-level security (RLS) with Power BI Desktop
description: How to configure row-level security for imported datasets, and DirectQuery, within Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.custom: ""
ms.date: 01/31/2020 
LocalizationGroup: Create reports
---

# Restrict data access with row-level security (RLS) for Power BI Desktop

You can use row-level security (RLS) with Power BI Desktop to restrict data access for given users. Filters restrict data at the row level. You can define filters within roles.

You can now configure RLS for data models imported into Power BI with Power BI Desktop. You can also configure RLS on datasets that are using [DirectQuery](desktop-use-directquery.md), such as SQL Server. Previously, you were only able to implement RLS within on-premises Analysis Services models outside Power BI. For Analysis Services live connections, you configure Row-level security on the on-premises model. The security option doesn't show up for live connection datasets.

> [!IMPORTANT]
> If you defined roles and rules within the Power BI service, you need to recreate those roles within Power BI Desktop and publish the report to the service. Learn more about options for [RLS within the Power BI service](service-admin-rls.md).

[!INCLUDE [include-short-name](./includes/rls-desktop-define-roles.md)]

[!INCLUDE [include-short-name](./includes/rls-desktop-view-as-roles.md)]

[!INCLUDE [include-short-name](./includes/rls-limitations.md)]

[!INCLUDE [include-short-name](./includes/rls-faq.md)]

## Next steps

[Row-level security (RLS) with the Power BI service](service-admin-rls.md)  

More questions? [Try asking the Power BI Community.](https://community.powerbi.com/).