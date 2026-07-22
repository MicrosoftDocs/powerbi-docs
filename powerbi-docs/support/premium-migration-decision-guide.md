---
title: "Power BI Premium P SKU to Fabric F SKU Migration Decision Guide"
description: "Learn when and how to migrate from Power BI Premium P SKUs to Microsoft Fabric F SKUs. Migrate your Power BI workloads now."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: winnieli, rabuchep, erikbohn, sraut
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: concept-article
ms.date: 07/22/2026
ai-usage: ai-assisted
#customer intent: As an IT architect or Fabric administrator, I want a migration decision guide so that I can decide when and how to migrate from Power BI Premium P SKUs to Microsoft Fabric F SKUs.
---

# Power BI Premium P SKU to Fabric F SKU migration decision guide

Microsoft is retiring Power BI Premium P SKUs at the end of each customer's current agreement term. This guide helps IT architects and Microsoft Fabric administrators decide which Fabric F SKU to choose and whether same-region migration is the right approach. For an end-to-end view of the migration journey, see [Power BI Premium to Microsoft Fabric migration overview](premium-migration-overview.md). For step-by-step procedures, see [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md).

> [!IMPORTANT]
> Plan to complete your migration before your P SKU subscription ends. After your subscription ends, you have a 30-day grace period during which your capacity keeps running at its current size. Starting on day 31, access is throttled (interactive operations are delayed). On day 91 and beyond, all operations are rejected - your data is retained but inaccessible until you migrate the workspaces to a Fabric F SKU capacity or delete the capacity. Reassign your workspaces to a Fabric F SKU capacity before your P SKU subscription ends to preserve access.

> [!NOTE]
> **Enterprise Agreement customers.** If your Enterprise Agreement is still active, you can continue running existing P SKU capacity and renew it annually through your agreement until the EA term ends. Customers with expiring Enterprise Agreements or Microsoft Cloud Agreements can't add or purchase new P SKU capacity through their agreement. Confirm your specific contract terms with your Microsoft account representative before deciding when to migrate.

## Understand the P SKU retirement timeline

The following table summarizes the key dates and what they mean for your organization.

| Phase | Timing | What happens |
| --- | --- | --- |
| **Retirement** | End of your current agreement term | Your P SKU subscription ends and isn't renewable. |
| **Grace period** | Days 1–30 after subscription end | Your capacity continues to run at its current size at no charge. You can still reassign workspaces to a new F SKU capacity during this period. |
| **Throttled access** | Days 31–90 after subscription end | Access is throttled. Interactive operations are delayed. You can still export and recover data during this period. |
| **Full block** | Day 91 onward, until you take action | All operations are rejected. Data is retained but inaccessible until you migrate the workspaces to a Fabric F SKU capacity or delete the capacity. |

Migrate now if your P SKU is still active. The grace and throttled access periods are a safety net, not a planned migration window.

> [!NOTE]
> Sovereign cloud customers aren't affected by this retirement because Microsoft Fabric isn't yet available in sovereign clouds. Microsoft will provide additional guidance when Fabric becomes available in those environments.

## Decide when to migrate from P SKU to F SKU

Migrate now if your P SKU subscription is still active. Microsoft no longer sells new P SKUs, and customers with expiring Enterprise Agreements or Microsoft Cloud Agreements can no longer add or renew P SKU capacity through their agreement. Plan to move your remaining P SKU capacity to a Fabric F SKU before your agreement term ends.

If you're already running a [Fabric trial](/fabric/get-started/fabric-trial) and have baseline consumption data from the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app), you're ready to size and purchase your F SKU. Use the [SKU mapping](#map-your-p-sku-to-an-f-sku) and [right-sizing guidance](#right-size-your-f-sku) sections.

## Map your P SKU to an F SKU

The following table shows the equivalent F SKU for each P SKU. The mapping is based on capacity units (CUs), which measure compute power. Each P SKU v-core corresponds to 8 CUs.

| P SKU | F SKU equivalent | CUs | v-cores (P SKU) | Typical use case |
| --- | --- | --- | --- | --- |
| P1 | F64 | 64 | 8 | Small to mid-size organizations, departmental deployments |
| P2 | F128 | 128 | 16 | Mid-size organizations, distributed team reporting |
| P3 | F256 | 256 | 32 | Large organizations, high-concurrency environments |
| P4 | F512 | 512 | 64 | Enterprise-scale deployments, high-volume data refreshes |
| P5 | F1024 | 1,024 | 128 | Very large organizations, maximum-scale deployments |

> [!NOTE]
> This table provides a reference for comparing compute capacity. Don't interpret it as functional or licensing equivalence. For the authoritative SKU comparison, see [Capacity and SKUs](/fabric/enterprise/licenses#capacity-license).

## Right-size your F SKU

The equivalent F SKU is a safe starting point, but you might right-size to a different capacity. Use the following approach:

1. **Review your current utilization.** Open the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) for your P SKU capacity and review the maximum period available in the Metrics App. Take into account Autoscale consumption on Premium. For forward-looking sizing, complement Metrics App data with the [Fabric SKU Estimator](/fabric/enterprise/fabric-sku-estimator), which models future consumption based on your workload profile.
1. **Identify peak usage.** Look for days or periods when CU utilization is consistently near 100%. Sustained peaks suggest you need the equivalent or larger F SKU.
1. **Identify low-utilization periods.** If your capacity runs at low utilization for most of the day, an F SKU with pause and resume capability lets you reduce costs during off-hours.
1. **Factor in workload growth.** If you plan to add Fabric workloads (Lakehouses, Warehouses, Notebooks, Pipelines) after migration, account for the additional CU consumption they'll introduce.
1. **Consult your Microsoft account representative.** Your representative can review your consumption data and recommend the right SKU size.

## Choose between same-region and cross-region migration

In most cases, migrate to an F SKU capacity in the same Azure region as your current P SKU capacity. It's the simplest path: purchase the F SKU in the same region, and then reassign workspaces from the P SKU capacity to the new F SKU capacity.

Consider a cross-region move only when a business driver requires it. Common triggers:

- **Colocate with your Azure estate.** Your other Azure resources (data sources, gateways, network hubs) live in a different region, and running Fabric there reduces latency, egress cost, and operational complexity.
- **Regional pricing.** Fabric pay-as-you-go rates in your current region push migration cost above what you'd pay in another supported region, and the savings justify the added migration effort.

Before you commit to a cross-region move, confirm you've:

- Reviewed the implications of cross-region workspace reassignment, including the deletion of large storage format semantic models and all Fabric items during the move.
- Built a backup and recovery plan for those items.

> [!IMPORTANT]
> A cross-region reassignment doesn't move every item type. Standard Power BI items (reports, small or default-format semantic models, and dashboards) survive the reassignment. **Large storage format semantic models** and all **Fabric items** (such as Lakehouses, Warehouses, Notebooks, and Data Factory pipelines) don't survive a cross-region move. You must back them up or capture their definitions before reassignment, and then recreate them in the new region. For step-by-step instructions, see [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md). For multi-tenant or multi-region alternatives, see [Power BI tenant migration patterns and strategies](tenant-migration-patterns.md).

## Key differences between Power BI Premium P SKUs and Fabric F SKUs

Before you migrate, review these key differences between P SKUs and F SKUs so you can update your operational processes and cost management.

| Capability | P SKU | F SKU |
| --- | --- | --- |
| **Purchase channel** | Microsoft 365 admin center (active Enterprise Agreement only; no new purchases) | Azure portal |
| **Billing model** | Monthly or yearly commitment, billed monthly | Pay-as-you-go; optional reservation |
| **Pricing model** | Global pricing | Regional pricing |
| **Scaling** | Fixed size; optional autoscale with additional v-cores | On-demand resizing through the Azure portal (manual scale up or down); pause and resume can be a cost reduction strategy if your usage pattern allows it |
| **Power BI Report Server** | Included | Included with a Fabric Reservation of F64 or higher |
| **Power BI Embedded** | Included | Included |
| **Azure-native features** | Not available | Available: Trusted workspace access, Managed private endpoints, Azure Monitor, and Microsoft Cost Management |
| **Free-user content consumption** | Users with a Fabric Free license can view content (with Viewer role) | Users with a Fabric Free license can view content on F64 or larger (with Viewer role) |
| **Autoscale** | Optional: additional v-cores billed per 24-hour period to your Azure subscription | Doesn't exist. F SKUs use on-demand resizing (manual scale up or down through the Azure portal) plus capacity overage protection. |
| **Usage governance** | None | Workspace surge protection, mission critical, and capacity surge protection |


### Billing and cost management for Fabric F SKUs

After migration, your F SKU costs appear in your Azure subscription. Use [Microsoft Cost Management](/azure/cost-management-billing/cost-management-billing-overview) and [Azure Monitor](/azure/azure-monitor/essentials/data-platform-metrics) to track consumption and set up alerts. Take advantage of significant savings compared to pay-as-you-go when making a [Fabric capacity reservation](/azure/cost-management-billing/reservations/fabric-capacity).

### Power BI Report Server

If you use Power BI Report Server, verify your license before canceling your P SKU. Report Server is available through a [Fabric capacity reservation](/azure/cost-management-billing/reservations/fabric-capacity) or SQL Server Enterprise Edition with Software Assurance. After migration, the Report Server key is on the **Fabric capacity** tab under **Capacity settings** in the admin portal.

### User licenses

Your existing per-user licenses (Pro, PPU, Free) don't change when you migrate from a P SKU to an F SKU. On F64 or larger capacities, users with only a Fabric Free license and the Viewer role can still view Power BI content—the same behavior as on P SKUs. The retirement applies only to **per-capacity** SKUs (P1–P5); **Power BI Pro** and **Power BI Premium Per User (PPU)** aren't affected.

## Decision summary

Use the following table to summarize your migration decision.

| Decision | Guidance |
| --- | --- |
| **When to migrate** | Migrate now if your P SKU is still active. The grace period isn't a planned migration window. |
| **Which F SKU to start with** | Match your current P SKU by using the [SKU mapping table](#map-your-p-sku-to-an-f-sku), and then right-size based on capacity metrics. |
| **Region** | Use the same region as your P SKU capacity, unless data residency requirements mandate otherwise. |
| **Billing** | Switch to pay-as-you-go billing in Azure, or purchase a yearly reservation to reduce costs. |
| **Safe migration sequence** | Buy the F SKU first, reassign all workspaces, validate, and then cancel the P SKU subscription. Don't cancel the P SKU before completing reassignment. |
| **Report Server** | Verify Report Server licensing before canceling your P SKU. |

## Related content

- [Power BI Premium to Microsoft Fabric migration overview](premium-migration-overview.md)
- [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md)
- [Power BI Premium to Microsoft Fabric migration FAQ](premium-migration-faq.md)
- [Power BI tenant migration patterns and strategies](tenant-migration-patterns.md)
