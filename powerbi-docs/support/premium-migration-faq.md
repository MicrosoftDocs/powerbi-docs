---
title: "Power BI Premium to Microsoft Fabric Migration FAQ"
description: "Get answers to frequently asked questions about migrating from Power BI Premium P SKUs to Microsoft Fabric F SKUs. Learn about timeline, cost, and SKU sizing."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: winnieli, rabuchep, erikbohn, chwebb, sraut
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: faq
ms.date: 07/22/2026
ai-usage: ai-assisted
#customer intent: As an IT architect or Fabric administrator, I want short, authoritative answers to common P SKU to F SKU migration questions so that I can quickly resolve specific blockers without reading the full guide.
---

# Power BI Premium to Microsoft Fabric migration FAQ

This article answers the most frequent customer questions about migrating from Power BI Premium per-capacity SKUs (P SKUs) to Microsoft Fabric capacity SKUs (F SKUs). For broader context, see [Power BI Premium to Microsoft Fabric migration overview](premium-migration-overview.md). For decisions, see [Power BI Premium P SKU migration decision guide](premium-migration-decision-guide.md). For procedures, see [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md).

## Timeline and retirement

### When are Power BI Premium P SKUs retired?

Each P SKU subscription retires at the end of its current agreement term. Microsoft no longer sells new P SKUs, and customers with expiring Enterprise Agreements or Microsoft Cloud Agreements can't add or renew P SKU capacity through their agreement. After your subscription ends, content stays accessible for a 30-day grace period. Starting on day 31, access is throttled (interactive operations are delayed). On day 91 and beyond, all operations are rejected. Your data is retained but inaccessible until you migrate the workspaces to a Fabric F SKU capacity or delete the capacity. For the full timeline, see [Understand the P SKU retirement timeline](premium-migration-decision-guide.md#understand-the-p-sku-retirement-timeline).

### Can I still purchase new Power BI Premium P SKUs, or can I only renew existing ones?

No. Microsoft no longer sells new P SKUs, and customers with expiring Enterprise Agreements or Microsoft Cloud Agreements can no longer add or renew P SKU capacity through their agreement. To stay on a Microsoft-supported capacity, purchase a Microsoft Fabric F SKU.

### Is the P-to-F migration automatic at renewal, or do I need to manually purchase an F SKU and reassign workspaces?

Migration isn't automatic. You manually purchase an F SKU capacity in Azure and reassign each workspace from the P SKU to the new F SKU. For step-by-step procedures, see [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md).

### What happens to my Power BI content if I cancel my P SKU before purchasing an F SKU?

Avoid this sequence. If your P SKU ends without an F SKU in place, your content enters the 30-day grace period. Starting on day 31, access is throttled (interactive operations are delayed). On day 91 and beyond, all operations are rejected. Your data is retained but inaccessible until you migrate the workspaces to a Fabric F SKU capacity or delete the capacity. To avoid disruption, **purchase the F SKU first, reassign and validate workspaces, and then cancel the P SKU**. For the full timeline, see [Understand the P SKU retirement timeline](premium-migration-decision-guide.md#understand-the-p-sku-retirement-timeline).

### Does the P SKU retirement affect sovereign cloud customers?

No. Microsoft Fabric isn't available in sovereign clouds yet, so P SKUs remain supported in those environments. Microsoft provides separate guidance when Fabric becomes available there.

## SKU sizing and mapping

### Which F SKU is equivalent to my current P SKU?

Map by capacity units (CUs): P1→F64, P2→F128, P3→F256, P4→F512, P5→F1024. Right-size from there based on actual consumption with the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app). For the full table and right-sizing guidance, see [Map your P SKU to an F SKU](premium-migration-decision-guide.md#map-your-p-sku-to-an-f-sku) and [Right-size your F SKU](premium-migration-decision-guide.md#right-size-your-f-sku).

### How do I use the Microsoft Fabric Capacity Metrics app to right-size my F SKU?

Install the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app), point it at your P SKU capacity, and review the past 30 to 45 days of CU consumption. Sustained peaks near 100% CU utilization suggest you need the equivalent or larger F SKU. Long low-utilization periods suggest you can use a smaller F SKU with pause and resume to reduce cost. Account for any new Fabric workloads (Lakehouses, Warehouses, Notebooks, Pipelines) you plan to add after migration.

### Should I separate dev/test and production workloads onto different F SKU capacities?

Splitting can improve cost control and isolation, but only if total CU consumption fits within each smaller capacity. Use the Capacity Metrics app to baseline current usage before deciding. Two common patterns when migrating from a single P1:

- **Keep one F64** for production and use a smaller, paused-when-idle F SKU for dev/test to reduce cost.
- **Split into two F SKUs** of different sizes when production workloads consistently approach the P1 ceiling.

Don't split a capacity that's already near 100% utilization without first scaling up. Doing so creates capacity overloads. Microsoft has no fixed recommendation for split sizes; the right sizes depend on your measured workload.

## Cost and licensing

### What's the cost difference between P SKUs and F SKUs?

F SKUs use **regional pricing** (the same SKU size can cost different amounts in different Azure regions), default to **pay-as-you-go billing** (per second, one-minute minimum) with optional yearly or multi-year reservations for significant discounts, and support **pause/resume and scale up/down** through Azure, so you pay only for what you use. For your specific regions and SKUs, use the [Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/). For the full feature and billing comparison, see [Key differences between Power BI Premium P SKUs and Fabric F SKUs](premium-migration-decision-guide.md#key-differences-between-power-bi-premium-p-skus-and-fabric-f-skus).

> [!IMPORTANT]
> Regional pricing differences shouldn't drive cross-region migration decisions. Regional prices can change over time, and the operational complexity of a cross-region move (such as recreating large storage format semantic models, recreating Fabric items, and reconfiguring gateways) usually outweighs short-term pricing differences. For more information, see [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md).

### Do I still need Power BI Pro licenses for report consumers after migrating to an F SKU?

It depends on the F SKU size. On **F64 and larger**, users with a Fabric Free license and the Viewer role can view content, the same as on P SKUs. On **F2 through F32**, every viewer needs a Power BI Pro or PPU license. Authors and editors always need Pro or PPU regardless of capacity size.

### What are the key differences between PPU, P SKU, and F SKU?

| License | Purchased per | Status | Best for |
| --- | --- | --- | --- |
| **Power BI Pro** | User | Active | Individual authors and viewers without Premium or Fabric capacity. |
| **Premium Per User (PPU)** | User | Active (not affected by P SKU retirement) | Users who need Premium features without an organizational capacity. |
| **Power BI Premium per capacity (P SKU)** | Capacity (Microsoft 365 commitment) | **Retiring at the end of each customer's current agreement term.** No new purchases, add-ons, or renewals through expiring Enterprise Agreements or Microsoft Cloud Agreements. | Replaced by Fabric F SKUs. |
| **Microsoft Fabric capacity (F SKU)** | Capacity (Azure pay-as-you-go or reservation) | Active. The replacement for P SKUs. | Capacity-based licensing. F64 and larger unlock Power BI Premium features for free viewer access. |

For the full comparison, see [Microsoft Fabric licenses](/fabric/enterprise/licenses).

### Is Power BI Premium Per User (PPU) being retired too?

No. The retirement applies only to **Power BI Premium per-capacity** SKUs (P1–P5). PPU is a separate per-user license that remains active, and your users don't need a license change as part of this migration. If you encounter older articles that refer to "Power BI Premium" without specifying *per capacity* or *per user*, the retirement applies only to per-capacity SKUs.

### Why does Fabric capacity cost differ by region?

Fabric capacities run in Azure datacenters. Operating costs for datacenters vary by region based on hardware, energy, taxes, and local supply and demand. Each Azure region has its own published Fabric SKU price.

> [!IMPORTANT]
> This is the same guidance shown under [What's the cost difference between P SKUs and F SKUs?](#whats-the-cost-difference-between-p-skus-and-f-skus). Cross-region moves are usually not worth chasing regional price deltas.

### Is the Microsoft Fabric F SKU available in my Azure region?

Fabric F SKU availability and pricing vary by Azure region. Before you finalize sizing, confirm that your target F SKU size is available in your preferred region by using the [Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/) or by attempting to create the capacity in the [Azure portal](https://portal.azure.com). If your preferred region doesn't offer your target F SKU, either choose a nearby region that does (and review [Choose between same-region and cross-region migration](premium-migration-decision-guide.md#choose-between-same-region-and-cross-region-migration) before purchasing) or work with your Microsoft account representative to plan an alternative.

## Feature parity

### What Power BI Premium features behave differently on F SKUs?

| Capability | P SKU | F SKU |
| --- | --- | --- |
| **Autoscale** | Optional, billed per 24-hour period | Doesn't exist on F SKUs. Use on-demand resizing (manual scale up or down through the Azure portal) plus capacity overage protection. |
| **Pause and resume** | Not available | Available |
| **Power BI Embedded** | Included only when buying EM SKUs | Included with every F SKU |
| **Azure-native security and networking (managed VNets, private endpoints, trusted workspace access)** | Not available | Available |
| **Free user content consumption** | Free users with Viewer role can view content | Same, on F64 and larger only |
| **Power BI Report Server** | Included | Included with a Fabric reserved license or SQL Server EE with Software Assurance |

For the full table, see [Key differences between Power BI Premium P SKUs and Fabric F SKUs](premium-migration-decision-guide.md#key-differences-between-power-bi-premium-p-skus-and-fabric-f-skus).

### Is Power BI Embedded included with F SKUs, or do I still need EM or A SKUs?

Power BI Embedded is included with every F SKU. You don't need to keep separate EM or A SKUs for embedded scenarios after you migrate.

### How do I access Power BI Report Server after migrating from a P SKU to an F SKU?

Power BI Report Server is available through a [Fabric capacity reservation](/azure/cost-management-billing/reservations/fabric-capacity) or SQL Server Enterprise Edition with Software Assurance. After migration, the Report Server key is on the **Fabric capacity** tab under **Capacity settings** in the Power BI admin portal. Verify your Report Server licensing *before* you cancel your P SKU subscription.

### How do capacity pause/resume and on-demand resizing on F SKUs compare to Autoscale on P SKUs?

F SKUs support manual or scripted scale-up and scale-down through the Azure portal at any time, plus pause and resume to stop billing during idle periods. P SKU Autoscale, which added extra v-cores billed per 24-hour period from your Azure subscription, is replaced by these F SKU capabilities. For details, see [Scale your capacity](/fabric/enterprise/scale-capacity) and [Pause and resume your capacity](/fabric/enterprise/pause-resume).

### How do Direct Lake guardrails differ between P SKUs and F SKUs?

Direct Lake guardrails (maximum rows per table, maximum parquet files, and maximum model size) scale with capacity size. The same guardrail rules apply on the equivalent F SKU. For example, the F64 guardrails match the P1 guardrails. For the current per-SKU values, see [Direct Lake overview](/fabric/fundamentals/direct-lake-overview).

## Migration steps

### How do I migrate workspaces from a P SKU to an F SKU?

See [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md), which covers inventory, F SKU provisioning, pilot, reassignment (portal and notebook), validation, and decommissioning. For the underlying decisions, see [Power BI Premium P SKU migration decision guide](premium-migration-decision-guide.md).

### Can I use a Fabric trial capacity to test before committing to an F SKU?

Yes. A [Fabric trial](/fabric/get-started/fabric-trial) lets you provision a trial capacity to test workloads and validate behavior before you purchase. Trial capacities have time limits and other constraints, so use the trial for testing only, not as a long-term migration target.

### Are active jobs canceled when I reassign a workspace from a P SKU to an F SKU?

Active refreshes and queries can be interrupted during reassignment. Schedule reassignments outside refresh windows and after long-running jobs complete. Scheduled refreshes and pipelines resume automatically on the new F SKU capacity after reassignment.

### Should I plan for downtime?

For a same-region reassignment of standard Power BI items, expect zero downtime apart from any active refreshes. For a cross-region reassignment of workspaces that contain large storage format semantic models or Fabric items, expect downtime on those items equal to the time to back them up, delete them, reassign the workspace, and recreate them in the new region. After reassignment, it can take up to an hour for users to be able to create Fabric items on the new capacity.

## Workspace impact

### If my P SKU and F SKU are in different Azure regions, what happens during migration?

Standard Power BI items (reports, small or default-format semantic models, dashboards) survive a cross-region reassignment. **Large storage format semantic models** and **all Fabric items** (Lakehouses, Warehouses, Notebooks, Data Factory pipelines, and similar items) don't survive. You must back them up or capture their definitions before reassignment, then recreate them in the new region after reassignment. For step-by-step handling, see [Cross-region migrations: special handling](premium-migration-how-to.md#cross-region-migrations-special-handling).

### What happens to deployment pipelines, workspace apps, and CI/CD workflows after migration?

Deployment pipelines, workspace apps, and CI/CD workflows continue to work after a same-region reassignment. Workspaces keep their pipeline assignments and app configurations. For cross-region migrations, plan to reconnect Git integration in the new region after recreating any Fabric items. For details on Git integration, see [Fabric Git integration](/fabric/cicd/git-integration/intro-to-git-integration).

## Semantic model impact

### Will my existing semantic models, incremental refresh policies, and scheduled refreshes continue to work after migrating?

Yes, these features work on the equivalent F SKU in the same region. Semantic models, incremental refresh policies, and scheduled refresh schedules transfer with the workspace. Validate by triggering an on-demand refresh after reassignment and confirming the next scheduled refresh succeeds.

### What happens to Dataflow Gen1 workloads after migrating to an F SKU? Do I need to migrate to Dataflow Gen2?

Dataflow Gen1 continues to work on F SKU capacities. You aren't required to migrate to Dataflow Gen2 as part of the P-to-F migration. Migrating to Dataflow Gen2 is a separate modernization decision that you can make at your own pace after the capacity migration. For the comparison, see [Differences between Dataflow Gen1 and Dataflow Gen2](/fabric/data-factory/dataflows-gen2-overview).

## Admin and governance

### After migration, do admin portal settings, tenant configurations, and governance policies carry over?

Tenant-level settings in the Power BI and Fabric admin portal (tenant settings, sensitivity label policies, sharing controls, and similar) aren't tied to your capacity, so they carry over without changes. Capacity-level settings are configured on the new F SKU capacity, including workload settings, capacity admins, and any per-capacity governance you applied to the P SKU. Plan to:

1. Add capacity administrators on the new F SKU before you reassign any workspace.
1. Recreate any P SKU capacity workload settings you depend on (for example, semantic model memory limits) on the new F SKU.
1. Review tenant settings related to Fabric workloads (for example, *Users can create Fabric items*) and confirm they match your governance intent before migration.

### Does the "Users can create Fabric items" tenant switch affect my existing Power BI workloads after migration?

The *Users can create Fabric items* tenant setting controls whether users can create non-Power BI Fabric items (such as Lakehouses, Warehouses, and Notebooks). It doesn't affect existing Power BI reports, semantic models, dashboards, or refresh schedules. If you want to restrict Fabric item creation during or after migration, you can disable the setting for the tenant or specific security groups. For the setting reference, see [Power BI tenant settings](/fabric/admin/tenant-settings-index).

### How do I govern departments that manage their own workloads within a shared F SKU capacity after migrating from a centrally managed P SKU?

A shared F SKU capacity uses the same governance building blocks as a shared P SKU: workspace roles (Admin, Member, Contributor, Viewer), item-level permissions, deployment pipelines, sensitivity labels, and tenant settings. F SKUs add two areas worth planning for:

- **Fabric domains.** Group related workspaces (for example, by business area) so you can apply federated governance at the domain level. See [Fabric domains](/fabric/governance/domains).
- **Chargeback and cost allocation.** Use Azure tags on the Fabric capacity, Microsoft Cost Management, and the Fabric chargeback approach to allocate spend back to departments. See [Microsoft Cost Management](/azure/cost-management-billing/cost-management-billing-overview).

If departments need autonomy over capacity sizing or pause-resume schedules, give each one its own F SKU instead of sharing a single larger capacity.

## Related content

- [Power BI Premium to Microsoft Fabric migration overview](premium-migration-overview.md)
- [Power BI Premium P SKU migration decision guide](premium-migration-decision-guide.md)
- [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md)
- [Power BI tenant migration patterns and strategies](tenant-migration-patterns.md)
- [Microsoft Fabric licenses](/fabric/enterprise/licenses)
- [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app)
