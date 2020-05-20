---
title: Capacity and SKUs in Power BI embedded analytics
description: Understand capacity and SKUs in Power BI embedded analytics.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 05/17/2020 
---

# Capacity and SKUs in Power BI embedded analytics

When moving to production, Power BI embedded analytics requires a dedicated capacity (*A*, *EM*, or *P* SKU) for publishing embedded Power BI content.

Capacity is a dedicated set of resources reserved for exclusive use. It enables you to publish dashboards, reports, and datasets to users, without having to purchase per-user licenses. It also offers dependable, consistent performance for your content.

>[!NOTE]
>For publishing, you'll need one Power BI Pro account.

## What is embedded analytics?

Power BI embedded analytics includes two solutions:
* *Power BI Embedded*  - Azure offering
* Embedding Power BI as part of *Power BI Premium*  - Office offering

### Power BI Embedded

Power BI Embedded is for ISVs and developers who want to embed visuals into their applications.

Applications using Power BI Embedded allow users to consume content stored on Power BI Embedded capacity.

### Power BI Premium

[Power BI Premium](../../admin/service-premium-what-is.md) is geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers.

Power BI Premium is a SaaS product that allows users to consume content through mobile apps, internally developed apps, or at the Power BI portal (Power BI service). This enables Power BI Premium to provide a solution for both internal and external customer facing applications.

## Capacity and SKUs

Each capacity offers a selection of SKUs, and each SKU provides different resource tiers for memory and computing power. The type of SKU you require, depends on the type of solution you wish to deploy.

To understand which workloads are supported for each tier, refer to the [Configure workloads in a Premium capacity](../../admin/service-admin-premium-workloads.md) article

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

</br>
<table>
<col width="40%">
<col width="15%">
<col width="15%">
<col width="15%">
<col width="15%">
<tbody>
<tr>
<td rowspan="2" valign="top"><b>Feature</b></td>
<td rowspan="2" valign="top" style="text-align: center"><b>Embedded analytics</b></td>
<td style="text-align: center"><b>Azure</b></td>
<td colspan="2" style="text-align: center"><b>Office</b></td>
</tr>
<tr>
<td style="text-align: center">A</td>
<td style="text-align: center">EM</td>
<td style="text-align: center">P</td>
</tr>
<tr>
<td><a href="embed-sample-for-customers.md">Embed for your customers</a></br>(app owns data)</td>
<td style="text-align: center">Yes</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td><a href="embed-sample-for-your-organization.md">Embed for your organization</a></br>(user owns data)</td>
<td style="text-align: center">Yes</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td>Microsoft 356 apps</br>(formerly known as Office apps)
<ul>
<li><a href="../../collaborate-share/service-embed-report-spo.md">Embed in Teams</a></li>
<li><a href="../../collaborate-share/service-embed-report-microsoft-teams.md">Embed in SharePoint</a></li>
<li><a href="../../collaborate-share/embed-paginated-reports-customers.md">Embed paginated reports</a></li>
</ul>
</td>
<td style="text-align: center">No</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td><a href="../../collaborate-share/service-embed-secure.md">Secure URL embedding</a></br>(embed in Power BI service)</td>
<td style="text-align: center">No</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td><a href="https://github.com/microsoft/PowerBI-JavaScript/wiki/Embed-For-Mobile">Power BI Mobile</a></td>
<td style="text-align: center">No</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
</tr>
</tbody>
</table>

>[!NOTE]
>A [Power BI Pro license](../../admin/service-admin-purchasing-power-bi-pro.md) is needed for publishing or authoring app content.
>* **App owns data** - Doesn't require a Power BI license, or an Azure AD registration per user.
> * **User owns data** - Requires a [free Power BI license](../../admin/service-admin-licensing-organization.md#license-types-and-capabilities), and an Azure AD registration per user.
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
<td style="text-align: center">Azure resources can be:</br>- <a href="azure-pbie-scale-capacity.md">Scaled up or down</a></br>- <a href="azure-pbie-pause-start.md">Paused and resumed</a>
</td>
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

## Next steps

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)

> [!div class="nextstepaction"]
> [Embed from apps](embed-from-apps.md)