---
title: Where is my Power BI tenant located?
description: Learn where your Power BI tenant is located and how that location is selected. This is important to understand as it can impact interactions you have with the service.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 10/31/2018
ms.author: mblythe

LocalizationGroup: Administration
---

# Where is my Power BI tenant located?

<iframe width="560" height="315" src="https://www.youtube.com/embed/0fOxaHJPvdM?showinfo=0" frameborder="0" allowfullscreen></iframe>

Learn where your Power BI tenant is located and how that location is selected. Understanding the location is important, because it can impact the interactions you have with the service.

## How to determine where your Power BI tenant is located

To find the region your tenant is in, follow these steps.

1. In the Power BI service, in the top menu, select help (**?**) then **About Power BI**.

1. Look for the value next to **Your data is stored in**. This is the region where your tenant is located.

    ![Data region](media/service-admin-where-is-my-tenant-located/power-bi-data-region.png)

## How the data region is selected

The data region is based on the country you select when you create the tenant. This applies to sign up for Office 365 in addition to Power BI, because this information is shared. If this is a new tenant, select the appropriate country from the list when you sign up.

![Country selection](media/service-admin-where-is-my-tenant-located/sign-up-country-selection.png)

Power BI picks a data region closest to this selection, which determines where data is stored for your tenant.

> [!IMPORTANT]
> You cannot change this selection after you create the tenant.

More questions? [Try the Power BI Community](http://community.powerbi.com/)

