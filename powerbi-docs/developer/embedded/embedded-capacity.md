---
title: Capacity and SKUs in Power BI embedded analytics
description: Understand capacity and SKUs in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 06/07/2023
---

# Capacity and SKUs in Power BI embedded analytics

Power BI embedded analytics requires a capacity (*A*, *EM*, *P*, or *F* SKU) in order to publish embedded Power BI content.

[!INCLUDE [what is capacity](../../includes/what-is-capacity.md)]

>[!NOTE]
>You need a Power BI Pro or Premium Per User (PPU) account to publish content.  
>You can publish content without a Pro or PPU license by using a service principal executing the REST API, [Post Import In Group](/rest/api/power-bi/imports/post-import-in-group).

## What are the different capacities?

Power BI embedded analytics offers two publishing solutions. Each solution requires different SKUs.

* [*Power BI Embedded*](#power-bi-embedded)  is an Azure offering aimed at ISVs and developers who want to embed visuals into their applications. Power BI Embedded uses *A* SKUs.

* [*Power BI Premium*](#power-bi-premium) is a Microsoft Office offer that includes Embedding Power BI. It's geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers. Power BI Premium uses *EM*, or *P* SKUs.

* [Microsoft Fabric](/fabric) brings together new and existing components from Power BI, Azure Synapse, and Azure Data Explorer into a single integrated environment. Power BI items can be *F* SKUs are part of Microsoft Fabric and support all Fabric items while the other SKUs support only Power BI items. To read more about *F* SKUs see [Microsoft Fabric licenses](/fabric/enterprise/licenses).

### Power BI Embedded

Power BI Embedded is for ISVs and developers who want to embed visuals into their applications.

Applications using Power BI Embedded allow users to consume content stored on Power BI Embedded capacity.
Power BI Embedded is shipped with an [*A* SKU](../../enterprise/service-admin-premium-purchase.md#purchase-a-skus-for-testing-and-other-scenarios).

### Power BI Premium

[Power BI Premium](../../enterprise/service-premium-what-is.md) is geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers.

Power BI Premium is a SaaS product that allows users to consume content through mobile apps, internally developed apps, or at the Power BI portal (Power BI service). This enables Power BI Premium to provide a solution for both internal and external customer facing applications.

Power BI premium offers two SKUs, *P* and *EM*.

* [Understand the differences between the *P* and *EM* SKUs](../../enterprise/service-premium-what-is.md#subscriptions-and-licensing)
* [Buy a Premium SKU](../../enterprise/service-admin-premium-purchase.md)

### Fabric

*F* SKUs are part of Microsoft Fabric and support all Fabric items while the other SKUs support only Power BI items. To read more about *F* SKUs see [Microsoft Fabric licenses](/fabric/enterprise/licenses).

## Capacity and SKUs

[!INCLUDE [capacity and SKUs](../../includes/capacity-and-skus.md)]

To understand which workloads are supported for each tier, refer to the [Configure workloads in a Premium capacity](../../enterprise/service-admin-premium-workloads.md) article.

To plan and test your capacity, see [Capacity planning](embedded-capacity-planning.md).

### Which SKU should I use?

The table below provides a summary of features, the capacity they require, and the specific SKU that is needed for each one.

In this table, a custom app refers to a web app created using embedded analytics. When you embed to a custom web app as a developer (using the JavaScript or .NET SDKs, or the REST APIs), you can control and customize the UX. This ability isn't available with other embedding options, such as Power BI service and Power BI Mobile.

| Scenario | Azure   | Azure           | Office          |
|----------|---------|-----------------|-----------------|
|          | (A SKU) | (F AKU)         | (P and EM SKUs) |
|[Embed for your customers](embed-sample-for-customers.md)</br>(app owns data)     |✔        |✔        |✔        |
|[Embed for your organization](embed-sample-for-your-organization.md)</br>(user owns data)     |✖        |✔         |✔         |
|Microsoft 365 apps</br>(formerly known as Office 365 apps)<ul><li>[Embed in Teams](../../collaborate-share/service-embed-report-microsoft-teams.md)</li><li>[Embed in SharePoint](../../collaborate-share/service-embed-report-spo.md)</li><li>[Embed in PowerPoint](../../collaborate-share/service-embed-report-spo.md)</li></ul>     |✖        |✔        |✔         |
|[Secure URL embedding](../../collaborate-share/service-embed-secure.md)</br>(embed from Power BI service)     |✖        |✔        |✔         |

>[!NOTE]
>
>* A [Power BI Pro](../../enterprise/service-admin-purchasing-power-bi-pro.md) or Premium Per User (PPU) license is needed for publishing content to a Power BI app workspace.
>* Only the **P SKU** allows free Power BI users to consume Power BI apps and shared content, in Power BI service.

### Capacity considerations

For development testing, you can use free embed trial tokens with a Pro license. To embed in a production environment, you must use a capacity.

> [!IMPORTANT]
> Free trial tokens are limited to development testing only. Once going to production, a capacity must be purchased. Until a capacity is purchased, the *Free trial version* banner will continue to appear at the top of the embedded report.

The table below lists payment and usage considerations per capacity.

| **Payment and usage** | **Power BI Embedded** | **Power BI Premium** | **Power BI Premium** |
|-----------------------|-----------------------|----------------------|----------------------|
| **Offer**             | Azure                 | Office               | Office               |
| **SKU**               | A                     | EM                   | P                    |
| **Billing**           | Hourly                | Monthly              | Monthly              |
| **Commitment**        | None                  | Yearly               | Monthly or yearly    |
| **Usage**             | Azure resources can be: <li>[Scaled up or down](azure-pbie-scale-capacity.md)</li><li>[Paused and resumed](azure-pbie-pause-start.md)  | Embed in apps, and in Microsoft applications    | Embed in apps, and in Power BI service |

### SKU memory and computing power

The table below describes the resources and limits of each SKU.

[!INCLUDE [Power BI capacity and SKUs](../../includes/capacity-table.md)]

<sup>1</sup> The [Power BI Premium Utilization and Metrics app](../../enterprise/service-premium-install-app.md) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the datasets workload per capacity.

<sup>3</sup> The *RAM per dataset (GB)* column (also called the *model size limit*) represents an upper bound for the dataset size. However, some memory must be reserved for operations such as dataset refreshes and queries. The maximum dataset size permitted on a capacity may be smaller than the numbers in this column.

<sup>4</sup> SKUs greater than 100 GB aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

<sup>5</sup> Learn more about [parallel tasks in dataflows](/power-query/dataflows/what-licenses-do-you-need-in-order-to-use-dataflows#power-bi-premium).

<sup>6</sup> See [Export Power BI report to file](export-to.md) for more information about Power BI interactive (not paginated) reports.

Note the amount of memory available on each node size described in the *RAM (GB)* column of the table. It's set to the memory footprint limit of a single Power BI item (such as a dataset, report or dashboard), and not to the cumulative consumption of memory. For example, in an Embedded A4 capacity, a *single dataset* size is limited to 25 GB, and not the total memory footprint of *all* datasets handled at the same time.

### Embedded memory enhancements

The amount of memory available on each node size is described in the RAM (GB) column in the SKU memory and computing power table. It's set to the memory footprint limit of a single Power BI item (such as a dataset, report or dashboard), and not to the cumulative consumption of memory. For example, in an Embedded Premium A4 capacity, a single dataset size is limited to 25 GB.

## Next steps

* [Embed for your customers](embed-sample-for-customers.md)
* [Embed for your organization](embed-sample-for-your-organization.md)
* [Embed from apps](./index.yml)

