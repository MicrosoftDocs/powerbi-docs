---
title: Power BI capacity table
description: See specifications for various Power BI Embedded capacity SKUs, including the v-core count, the max memory per semantic model and query, and other information.
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 01/12/2023
ms.custom: include file
---

| Capacity          |     | Semantic model |        |     |       | Dataflow |
| ----------------- | --- | ------- | ------ | --- | ----- | -------- |
| **Capacity SKUs** | **V-cores** | **Max memory (GB)**<sup>1, 2, 3</sup> | **DirectQuery/Live connection (per second)**<sup>1, 2</sup> | **Max memory per query (GB)**<sup>1, 2</sup> | **Model refresh parallelism**<sup>2</sup> | **Dataflow parallel tasks**<sup>5</sup>  |
| EM1/A1            |   1 |   3 |   3.75 |  1  |   5  |  4 |
| EM2/A2            |   2 |   5 |   7.5  |  2  |  10  |  8 |
| EM3/A3            |   4 |  10 |  15    |  5  |  20  | 16 |
| P1/A4             |   8 |  25 |  30    |  10  |  40  | 32 |
| P2/A5             |  16 |  50 |  60    |  10  |  80  | 64 |
| P3/A6             |  32 | 100 | 120    | 10  | 160  | 64 |
| P4/A7<sup>4</sup> |  64 | 200 | 240    | 20  | 320  | 64 |
| P5/A8<sup>4</sup> | 128 | 400 | 480    | 40  | 640  | 64 |

<sup>1</sup> The [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the semantic model workload per capacity.

<sup>3</sup> The *Max memory (GB)* column under the *Semantic model* header represents an upper bound for the semantic model size. However, an amount of memory must be reserved for operations such as refreshes and queries on the semantic model. The maximum semantic model size permitted on a capacity might be smaller than the numbers in this column. For more information, see [Memory allocation](./../enterprise/service-premium-what-is.md#semantic-model-memory-allocation).

<sup>4</sup> These SKUs aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

<sup>5</sup> Learn more about [parallel tasks in dataflows](/power-query/dataflows/what-licenses-do-you-need-in-order-to-use-dataflows#power-bi-premium).
