---
title: Power BI Embedded create capacity parameters
description: A list of parameters for creating a Power BI capacity
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 06/11/2020
ms.custom: include file
---

* **Subscription** - The subscription you would like to create the capacity against.

* **Resource group** - The resource group that contains this new capacity. Pick from an existing resource group, or create another. For more information, see [Azure Resource Manager overview](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview).

* **Resource name** - The resource name of the capacity.

* **Location** - The location where Power BI is hosted for your tenant. Your default location is your home region, but you can change the location using [Multi-Geo options](../developer/embedded/embedded-multi-geo.md).

* **Size** - The [A SKU](../admin/service-admin-premium-purchase.md#purchase-a-skus-for-testing-and-other-scenarios) you require. For more information see [SKU memory and computing power](../developer/embedded/embedded-capacity.md#sku-memory-and-computing-power).

* **Power BI capacity administrator** - An admin for the capacity.
    >[!NOTE]
    >* By default, the capacity administrator is the user creating the capacity.
    >* You can select a different user or service principal, as capacity administrator.
    >* The capacity administrator must belong to the tenant where the capacity is provisioned. Business to business users cannot be capacity administrators.