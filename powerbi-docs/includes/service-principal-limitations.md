---
title: Service principal limitations
description: Service principal limitations
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 06/06/2020
ms.custom: include file
---

## Considerations and limitations

* Service principal only works with [new workspaces](../collaborate-share/service-create-the-new-workspaces.md).
* **My Workspace** isn't supported when using service principal.
* A capacity is required when moving to production.
* You can't sign into the Power BI portal using service principal.
* Power BI admin rights are required to enable service principal in developer settings within the Power BI admin portal.
* [Embed for your organization](../developer/embedded/embed-sample-for-your-organization.md) applications can't use service principal.
* [Dataflows](../transform-model/service-dataflows-overview.md) management is not supported.
* Service principal currently does not support any admin APIs.
* When using service principal with an [Azure Analysis Services](/azure/analysis-services/analysis-services-overview) data source, the service principal itself must have an Azure Analysis Services instance permissions. Using a security group that contains the service principal for this purpose, doesn't work.