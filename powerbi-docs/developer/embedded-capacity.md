---
title: Frequently asked questions about Power BI Embedded
description: Browse a list of frequently asked questions and answers about Power BI Embedded.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 12/04/2019 
---

# Capacity in Power BI embedded analytics

Power BI embedded analytics is divided into two solutions, *Power BI Premium*, and *Power BI Embedded*. Both solutions require buying a *capacity*, which is a dedicated set of resources reserved for exclusive use.

Dedicated capacity enables you to publish dashboards, reports, and datasets to users, without having to purchase per-user licenses. It also offers dependable, consistent performance for your content.


## Power BI Premium

Power BI Premium is geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers.

Power BI Premium is a SaaS product that allows users to consume content through mobile apps, internally developed apps, or at the Power BI portal (Power BI service).

## Power BI Embedded

Power BI Embedded is for ISVs and developers who want to embed visuals into their applications.

Applications using Power BI Embedded allow users to consume content stored on Power BI Embedded capacity, including anyone inside or outside the organization.

## Capacity recommendations

When you buy a Power BI Embedded capacity, you have to use an A SKU.

When you buy a Power BI Premium capacity, you can choose between EM and P SKUs.

The table below lists Microsoft's capacity recommendations. The recommendations depend on the type of customer and solution you wish to deploy. The table also lists payment and usage considerations per capacity.

</br>
<table>
<tbody>
<tr>
<td colspan="2" rowspan="2"></td>
<td style="text-align: center;">
<p><strong>Power BI Embedded</strong></p>
</td>
<td style="text-align: center;" colspan="2">
<p><strong>Power BI Premium</strong></p>
</td>
</tr>
<tr>
<td style="text-align: center;">
<p><em>A SKUs</br>(Azure)</em></p>
</td>
<td style="text-align: center;">
<p><em>EM SKUs</br>(Office)</em></p>
</td>
<td style="text-align: center;">
<p><em>P SKUs</br>(Office)</em></p>
</td>
</tr>
<tr>
<td rowspan="2">
<p><strong>Customer type</strong></p>
</td>
<td>Enterprise</td>
<td style="text-align: center;">Enterprises that want to</br> build external facing apps</td>
<td style="text-align: center;">✔</td>
<td style="text-align: center;">✔</td>
</tr>
<tr>
<td>ISV</td>
<td style="text-align: center;">✔</td>
<td style="text-align: center;">✖</td>
<td style="text-align: center;">Large ISVs that want to use</br>Power BI in the organization</td>
</tr>
<tr>
<td rowspan="3">
<p><strong>Considerations</strong></p>
</td>
<td>Billing</td>
<td style="text-align: center;">Hourly</td>
<td style="text-align: center;">Monthly</td>
<td style="text-align: center;">Monthly</td>
</tr>
<tr>
<td>Commitment</td>
<td style="text-align: center;">None</td>
<td style="text-align: center;">Yearly</td>
<td style="text-align: center;">Monthly or yearly</td>
</tr>
<tr>
<td>Usage</td>
<td style="text-align: center;">Azure resources can be:</br>- Scaled up or down</br>- Paused and resumed
</td>
<td style="text-align: center;">Embed online, and in</br> Microsoft applications</td>
<td style="text-align: center;">Embed in apps, and</br> in Power BI service</td>
</tr>
</tbody>
</table>

>[!NOTE]
>Customers have no restriction on which product to buy.

## Which SKU should I use?

This table provides a summary of features, the capacity they require, and the specific SKU that is required for each one. 

</br>
<table>
<col width="20%">
<col width="20%">
<col width="20%">
<col width="20%">
<col width="20%">
<tbody>
<tr>
<td style="text-align: center"; colspan="2"><p><b>Feature</b></p></td>
<td style="text-align: center">
<p><b>Power BI Embedded</b></p>
</td>
<td style="text-align: center"; colspan="2">
<p><b>Power BI Premium</b></p>
</td>
</tr>
<tr>
<td><p><em>What is consumed?</em><p></td>
<td><p><em>What  is consuming?</em><p></td>
<td style="text-align: center"><p><em>A SKUs</br>(Azure)</em></p></td>
<td style="text-align: center"><p><em>EM SKUs</br>(Office)</em></p></td>
<td style="text-align: center"><p><em>P SKUs</br>(Office)</em></p></td>
</tr>
<tr>
<td>Embed artifacts from a Power BI workspace</td>
<td>
</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td rowspan="2">Power BI reports</td>
<td>An embedded application for your organization</br>(user owns data)</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td>An embedded application for your customers</br>(app owns data)</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td rowspan="3">Power BI content<br>(with a free Power BI license)</td>
<td>Power BI service</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td>Power BI mobile</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td>MS Office apps</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td rowspan="3">Power BI reports</td>
<td>SharePoint</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td>Dynamics</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
<tr>
<td>Teams</br>(excludes mobile app)</td>
<td style="text-align: center">✖</td>
<td style="text-align: center">✔</td>
<td style="text-align: center">✔</td>
</tr>
</tbody>
</table>
