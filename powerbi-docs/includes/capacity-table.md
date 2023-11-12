---
title: Power BI capacity table
description: See specifications for various Power BI Embedded capacity SKUs, including the v-core count, the max memory per semantic model and query, and other information.
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 11/05/2023
ms.custom: include file
---

| SKU   | Capacity Units (CU) | Power BI SKU      | Power BI v-cores | Rows per table (millions)<sup>1</sup> |Max model size on disk/OneLake1 (GB)<sup>1</sup> |
| ----- | ------------------- | ----------------- | ---------------- | ------------------------- | --------- |
| F2    |                   2 | N/A               |              N/A |    300                    | 10        |
| F4    |                   4 | N/A               |              N/A |    300                    | 10        |
| F8    |                   8 | EM1/A1            |                1 |    300                    | 10        |
| F16   |                  16 | EM2/A2            |                2 |    300                    | 20        |
| F32   |                  32 | EM3/A3            |                4 |    300                    | 40        |
| F64   |                  64 | P1/A4             |                8 |  1,500                    | Unlimited |
| F128  |                 128 | P2/A5             |               16 |  3,000                    | Unlimited |
| F256  |                 256 | P3/A6             |               32 |  6,000                    | Unlimited |
| F512  |                 512 | P4/A7<sup>2</sup> |               64 | 12,000                    | Unlimited |
| F1024 |               1,024 | P5/A8<sup>2</sup> |              128 | 24,000                    | Unlimited |
| F2048 |               2,048 | N/A               |              N/A | 24,000                    | Unlimited |

<sup>1</sup> Guardrail values that affect [fallback](../enterprise/directlake-overview.md) to DirectQuery.

<sup>2</sup> These SKUs aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

guardrail columns that affect fallback to DQ with a learn more link (to Owen’s doc).
