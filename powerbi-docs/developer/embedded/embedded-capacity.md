---
title: Capacity and SKUs in Power BI embedded analytics
description: Understand capacity and SKUs in Power BI embedded analytics.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 06/09/2021
---

# Capacity and SKUs in Power BI embedded analytics

When moving to production, Power BI embedded analytics requires a capacity (*A*, *EM*, or *P* SKU) for publishing embedded Power BI content.

Capacity is a dedicated set of resources reserved for exclusive use. It enables you to publish dashboards, reports, and datasets to users, without having to purchase per-user licenses. It also offers dependable, consistent performance for your content.

>[!NOTE]
>For publishing, you'll need one Power BI Pro or Premium Per User (PPU) account.

## What is embedded analytics?

Power BI embedded analytics includes two solutions:

* *Power BI Embedded*  - Azure offering

* Embedding Power BI as part of *Power BI Premium*  - Microsoft Office offering

### Power BI Embedded

Power BI Embedded is for ISVs and developers who want to embed visuals into their applications.

Applications using Power BI Embedded allow users to consume content stored on Power BI Embedded capacity.

>[!NOTE]
>Power BI Embedded recently released a new version, called **Embedded Gen2**. Embedded Gen2 will simplify the management of embedded capacities, and improve the Power BI Embedded experience. For more information, see [Power BI Embedded Generation 2](power-bi-embedded-generation-2.md).

### Power BI Premium

[Power BI Premium](../../admin/service-premium-what-is.md) is geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers.

Power BI Premium is a SaaS product that allows users to consume content through mobile apps, internally developed apps, or at the Power BI portal (Power BI service). This enables Power BI Premium to provide a solution for both internal and external customer facing applications.

## Capacity and SKUs

Each capacity offers a selection of SKUs, and each SKU provides different resource tiers for memory and computing power. The type of SKU you require, depends on the type of solution you wish to deploy.

To understand which workloads are supported for each tier, refer to the [Configure workloads in a Premium capacity](../../admin/service-admin-premium-workloads.md) article.

To plan and test your capacity, use these links:
* [Capacity planning](embedded-capacity-planning.md)
* [Testing approaches](../../admin/service-premium-capacity-optimize.md#testing-approaches)

### Power BI Embedded SKUs

Power BI Embedded is shipped with an [*a* SKU](../../admin/service-admin-premium-purchase.md#purchase-a-skus-for-testing-and-other-scenarios).

### Power BI Premium SKUs

Power BI premium offers two SKUs, *P* and *EM*.
* [Understand the differences between the *P* and *EM* SKUs](../../admin/service-premium-what-is.md#subscriptions-and-licensing)
* [Buy a Premium SKU](../../admin/service-admin-premium-purchase.md)

### Which SKU should I use?

The table below provides a summary of features, the capacity they require, and the specific SKU that is needed for each one.

In this table, a custom app refers to a web app created using embedded analytics. When you embed to a custom web app as a developer (using the JavaScript or .NET SDKs, or the REST APIs), you have the ability to control and customize the UX. This ability is not available when you use other embedding options, such as Power BI service and Power BI Mobile.

| Scenario | Azure   | Office          |
|----------|---------|-----------------|
|          | (A SKU) | (P and EM SKUs) |
|[Embed for your customers](embed-sample-for-customers.md)</br>(app owns data)     |✔        |✔        |
|[Embed for your organization](embed-sample-for-your-organization.md)</br>(user owns data)     |✖        |✔         |
|Microsoft 365 apps</br>(formerly known as Office 365 apps)<ul><li>[Embed in Teams](../../collaborate-share/service-embed-report-microsoft-teams.md)</li><li>[Embed in SharePoint](../../collaborate-share/service-embed-report-spo.md)</li></ul>     |✖        |✔        |
|[Secure URL embedding](../../collaborate-share/service-embed-secure.md)</br>(embed from Power BI service)     |✖        |✔        |

>[!NOTE]
>* A [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md) or Premium Per User (PPU) license is needed for publishing content to a Power BI app workspace.
>* Only the **P SKU** allows free Power BI users to consume Power BI apps and shared content, in Power BI service.

### Capacity considerations

The table below lists payment and usage considerations per capacity.

</br>
<table>
<tbody>
<tr>
<td></td>
<td style="text-align: center;"><p><strong>Power BI Embedded</strong></p></td>
<td style="text-align: center;" colspan="2"><p><strong>Power BI Premium</strong></p></td>
</tr>
<tr>
<td><p><strong>Offer</strong></p></td>
<td style="text-align: center"><p>Azure</p></td>
<td style="text-align: center" colspan="2"><p>Office</p></td>
</tr>
<tr>
<td><p><strong>SKU</strong></p></td>
<td style="text-align: center"><p>A</p></td>
<td style="text-align: center"><p>EM</p></td>
<td style="text-align: center"><p>P</p></td>
</tr>
<tr>
<td><p><strong>Billing</strong></td>
<td style="text-align: center">Hourly</td>
<td style="text-align: center">Monthly</td>
<td style="text-align: center">Monthly</td>
</tr>
<tr>
<td><p><strong>Commitment</strong></td>
<td style="text-align: center">None</td>
<td style="text-align: center">Yearly</td>
<td style="text-align: center">Monthly or yearly</td>
</tr>
<tr>
<td valign="top"><p><strong>Usage</strong></td>
<td style="text-align: center">Azure resources can be:<li><a href="azure-pbie-scale-capacity.md">Scaled up or down</a></li><li><a href="azure-pbie-pause-start.md">Paused and resumed</a>
</td></li>
<td style="text-align: center">Embed in apps, and in</br> Microsoft applications</td>
<td style="text-align: center">Embed in apps, and</br> in Power BI service</td>
</tr>
</tbody>
</table>

### SKU memory and computing power

The table below describes the resources and limits of each SKU.

| Capacity Nodes | Total v-cores | Backend v-cores | RAM (GB) | Frontend v-cores | DirectQuery/Live Connection (per sec) | Model Refresh Parallelism |
| --- | --- | --- | --- | --- | --- | --- |
| EM1/A1 | 1 | 0.5 | 2.5 | 0.5 | 3.75 | 1 |
| EM2/A2 | 2 | 1 | 5 | 1 | 7.5 | 2 |
| EM3/A3 | 4 | 2 | 10 | 2 | 15 | 3 |
| P1/A4 | 8 | 4 | 25 | 4 | 30 | 6 |
| P2/A5 | 16 | 8 | 50 | 8 | 60 | 12 |
| P3/A6 | 32 | 16 | 100 | 16 | 120 | 24 |
| P4 | 64 | 32 | 200 | 32 | 240 | 48 |
| P5 | 128 | 64 | 400 | 64 | 480 | 96 |
| | | | | | | |

#### Embedded Gen 2 memory enhancements (preview)

The amount of memory available on each node size is described in the *RAM (GB)* column in the [SKU memory and computing power](#sku-memory-and-computing-power) table. With [Power BI Embedded Generation 2](power-bi-embedded-generation-2.md) (also known as Embedded Gen 2), this amount of memory is set to the memory footprint limit of a single Power BI item (such as a dataset, report or dashboard), and not to the cumulative consumption of memory. For example, in an Embedded Gen2 A4 capacity, only a single dataset size is limited to 25 GB, in comparison to the original Power BI Embedded capacity, where the total memory footprint of the datasets being handled at the same time is limited to 25 GB.

## Next steps

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)

> [!div class="nextstepaction"]
> [Embed from apps](./index.yml)