---
title: Power BI capacity table
description: See specifications for various Power BI Embedded capacity SKUs, including the v-core count, the max memory per semantic model and query, and other information.
services: powerbi
author: JulCsc
ms.author: juliacawthra
ms.topic: include
ms.date: 11/13/2023
ms.custom: include file
---

| SKU<sup>1</sup>               | Capacity Units (CU) | Power BI SKU      | Power BI v-cores |
| ----------------- | ------------------- | ----------------- | ---------------- |
| F2                |                   2 | N/A               |              N/A |
| F4                |                   4 | N/A               |              N/A |
| F8                |                   8 | EM1/A1            |                1 |
| F16               |                  16 | EM2/A2            |                2 |
| F32               |                  32 | EM3/A3            |                4 |
| F64               |                  64 | P1/A4             |                8 |
| F128              |                 128 | P2/A5             |               16 |
| F256              |                 256 | P3/A6             |               32 |
| F512<sup>2</sup>  |                 512 | P4/A7             |               64 |
| F1024<sup>2</sup> |               1,024 | P5/A8             |              128 |
| F2048<sup>2</sup> |               2,048 | N/A               |              N/A |

<sup>1</sup> In the Microsoft 365 or [Embed for your organization](/power-bi/developer/embedded/embedded-analytics-power-bi#embed-for-your-customers) (user owns data) scenario, SKUs that are smaller than F64 require a Pro or Premium Per User (PPU) license, or a Power BI individual trial to consume Power BI content.

<sup>2</sup> These SKUs aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.
