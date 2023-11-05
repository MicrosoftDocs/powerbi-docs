---
title: Power BI capacity table
description: See specifications for various Power BI Embedded capacity SKUs, including the v-core count, the max memory per dataset and query, and other information.
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 11/05/2023
ms.custom: include file
---

| Capacity |       |                  |      | Dataset |        |     |       | Dataflow | Direct Lake |
| -------- | ----- | ---------------- | ---- | ------- | ------ | --- | ----- | -------- | ------------|
|**Fabric SKU** | **Capacity Units** | **Power BI SKU** | **Power BI v-cores** | **Max memory (GB)**<sup>1, 2, 3</sup> | **DirectQuery/Live connection (per second)**<sup>1, 2</sup> | **Max memory per query (GB)**<sup>1, 2</sup> | **Model refresh parallelism**<sup>2</sup> | **Dataflow parallel tasks**<sup>5</sup>  | **Direct Lake rows per table** (in millions) |
| F2       |     2 |                   |     |         |   2    |  1  |     1 |          |    300      |
| F4       |     4 |                   |     |         |   2    |  1  |     2 |          |    300      |
| F8       |     8 | EM1/A1            |   1 |   3     |   3.75 |  1  |     5 |  4       |    300      |
| F16      |    16 | EM2/A2            |   2 |   5     |   7.5  |  2  |    10 |  8       |    300      |
| F32      |    32 | EM3/A3            |   4 |  10     |  15    |  5  |    20 | 16       |    300      |
| F64      |    64 | P1/A4             |   8 |  25     |  30    | 10  |    40 | 32       |  1,500      |
| F128     |   128 | P2/A5             |  16 |  50     |  60    | 10  |    80 | 64       |  3,000      |
| F256     |   256 | P3/A6             |  32 | 100     | 120    | 10  |   160 | 64       |  6,000      |
| F512     |   512 | P4/A7<sup>4</sup> |  64 | 200     | 240    | 20  |   320 | 64       | 12,000      |
| F1024    | 1,024 | P5/A8<sup>4</sup> | 128 | 400     | 480    | 40  |   640 | 64       | 24,000      |
| F2048    | 2,048 |                   |     |         |        | 40  | 1,280 |          |             |

<sup>1</sup> The [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the dataset workload per capacity.

<sup>3</sup> The *Max memory (GB)* column under the *Dataset* header represents an upper bound for the dataset size. However, an amount of memory must be reserved for operations such as refreshes and queries on the dataset. The maximum dataset size permitted on a capacity might be smaller than the numbers in this column. For more information, see [Memory allocation](./../enterprise/service-premium-what-is.md#dataset-memory-allocation).

<sup>4</sup> These SKUs aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

<sup>5</sup> Learn more about [parallel tasks in dataflows](/power-query/dataflows/what-licenses-do-you-need-in-order-to-use-dataflows#power-bi-premium).
