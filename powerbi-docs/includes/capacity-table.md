---
title: Power BI capacity table
description: See specifications for various Power BI Embedded capacity SKUs, including the v-core count, the max memory per dataset and query, and other information.
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 01/12/2023
ms.custom: include file
---

| Capacity          |     | Dataset |        |     |       | Dataflow | Export API |
| ----------------- | --- | ------- | ------ | --- | ----- | -------- | ---------- |
| **Capacity SKUs** | **V-cores** | **Max memory (GB)**<sup>1, 2, 3</sup> | **DirectQuery/Live connection (per second)**<sup>1, 2</sup> | **Max memory per query (GB)**<sup>1, 2</sup> | **Model refresh parallelism**<sup>2</sup> | **Dataflow parallel tasks**<sup>5</sup>  | **Max concurrent pages**<sup>6</sup> |
| EM1/A1            |   1 |   3 |   3.75 |  1  |   5  |  4 |  20 |
| EM2/A2            |   2 |   5 |   7.5  |  2  |  10  |  8 |  25 |
| EM3/A3            |   4 |  10 |  15    |  2  |  20  | 16 |  35 |
| P1/A4             |   8 |  25 |  30    |  6  |  40  | 32 |  55 |
| P2/A5             |  16 |  50 |  60    |  6  |  80  | 64 |  95 |
| P3/A6             |  32 | 100 | 120    | 10  | 160  | 64 | 175 |
| P4/A7<sup>4</sup> |  64 | 200 | 240    | 10  | 320  | 64 | 200 |
| P5/A8<sup>4</sup> | 128 | 400 | 480    | 10  | 640  | 64 | 200 |

<sup>1</sup> The [Power BI Premium Utilization and Metrics app](./../enterprise/service-premium-install-app.md) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the dataset workload per capacity.

<sup>3</sup> The *Max memory (GB)* column under the *Dataset* header represents an upper bound for the dataset size. However, an amount of memory must be reserved for operations such as refreshes and queries on the dataset. The maximum dataset size permitted on a capacity might be smaller than the numbers in this column. For more information, see [Memory allocation](./../enterprise/service-premium-what-is.md#dataset-memory-allocation).

<sup>4</sup> These SKUs aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

<sup>5</sup> Learn more about [parallel tasks in dataflows](/power-query/dataflows/what-licenses-do-you-need-in-order-to-use-dataflows#power-bi-premium).

<sup>6</sup> See [Export Power BI report to file](./../developer/embedded/export-to.md) for more information about Power BI interactive (not paginated) reports.
