---
title: "Power BI Premium to Microsoft Fabric Migration Overview"
description: "Get an end-to-end view of migrating from Power BI Premium P SKUs to Microsoft Fabric F SKUs. Migrate your Power BI workloads now."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: winnieli, rabuchep, erikbohn, chwebb, sraut
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: overview
ms.date: 07/22/2026
ai-usage: ai-assisted
#customer intent: As an IT architect or Fabric administrator, I want a single end-to-end overview of the P SKU to F SKU migration so that I can understand the full journey from planning through validation and decide what to read next.
---

# Power BI Premium to Microsoft Fabric migration overview

Microsoft is retiring Power BI Premium per-capacity SKUs (P SKUs). Each P SKU subscription ends at the end of its current agreement term, and Microsoft no longer sells new P SKUs. To keep your Power BI workloads running, migrate to Microsoft Fabric capacity SKUs (F SKUs). This article gives you an end-to-end view of the migration: why Fabric F SKUs are the path forward, what changes and what stays the same for end users and administrators, the stages of a typical migration, and the scenarios that determine how complex your migration is.

This article is for Fabric administrators, Power BI administrators, IT architects, and capacity owners who plan and run the migration.

> [!IMPORTANT]
> Plan to complete your migration before your P SKU subscription ends. After your subscription ends, your capacity enters a 30-day grace period. Starting on day 31, access is throttled (interactive operations are delayed). On day 91 and beyond, all operations are rejected - your data is retained but inaccessible until you migrate the workspaces to a Fabric F SKU capacity or delete the capacity. To avoid disruption, reassign your workspaces to a Fabric F SKU capacity before your P SKU subscription ends. For the procedure, see [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md).

> [!NOTE]
> **Enterprise Agreement customers.** If your Enterprise Agreement is still active, you can continue running existing P SKU capacity and renew it annually through your agreement until the EA term ends. Customers with expiring Enterprise Agreements or Microsoft Cloud Agreements can't add or purchase new P SKU capacity through their agreement. Confirm your specific contract terms with your Microsoft account representative before deciding when to migrate.

> [!NOTE]
> This retirement has two important scope limits:
>
> - **Per-user licenses aren't affected.** **Power BI Pro** and **Power BI Premium Per User (PPU)** continue as-is. For details, see [Is Power BI Premium Per User (PPU) being retired too](premium-migration-faq.md#is-power-bi-premium-per-user-ppu-being-retired-too)?
> - **Embedded licenses (EM, A) aren't affected.** These SKUs aren't part of this retirement.
> - **Sovereign clouds aren't affected yet.** Microsoft Fabric isn't available in sovereign clouds, so P SKUs remain supported there. Microsoft provides separate guidance when Fabric becomes available in those environments.

## Why migrate to Microsoft Fabric

The retirement of P SKUs is the immediate driver, but Fabric F SKUs also deliver capabilities P SKUs can't:

- **Pay only for what you use.** F SKUs default to pay-as-you-go Azure billing, with optional yearly or multiyear reservations for predictable workloads. You can also pause a capacity when it's idle to stop billing during off-hours and later resume it on demand.
- **Scale up or down at any time.** Resize capacities through the Azure portal as your workloads change, instead of committing to a fixed size for the term of a subscription.
- **Use the Azure-native operating model.** Provision and manage capacity through the Azure portal, apply Azure tags for chargeback, and count Fabric spend toward your Microsoft Azure Consumption Commitment (MACC). Many Fabric workloads (such as Lakehouses, Warehouses, Notebooks, and Data Factory pipelines) run on either P or F capacities, but the Azure operating model is F-only.
- **Use Power BI Embedded without separate SKUs.** Embedded scenarios are covered by every F SKU, so you don't need separate EM or A SKUs.
- **Use Azure-native security and operations.** Managed private endpoints, trusted workspace access, Azure Monitor, and Microsoft Cost Management are all available with F SKUs.

For the full feature-by-feature comparison, see [Key differences between Power BI Premium P SKUs and Fabric F SKUs](premium-migration-decision-guide.md#key-differences-between-power-bi-premium-p-skus-and-fabric-f-skus).

## What changes and what stays the same

The migration primarily involves a licensing and infrastructure change. End-user experiences and most administrative behaviors stay the same. Some operational areas change.

| Area | Change? | After you migrate to F SKU |
| --- | --- | --- |
| **Reports, semantic models, dashboards** | Same | Continue to work unchanged on F64 or larger capacities. |
| **User licenses (Pro, PPU, Free)** | Same | Unchanged. On F64 and larger, users with a Fabric Free license and the Viewer role can view content, the same as on P SKUs. On F2 through F32, every viewer needs a Pro or PPU license. |
| **Workspaces and apps** | Same | Workspaces are reassigned to the new capacity. Workspace apps, deployment pipelines, and Git integration continue to work. |
| **Refresh schedules and pipelines** | Same | Continue to run on the new capacity. Active refreshes might be interrupted during reassignment. |
| **Power BI Report Server** | Same, with license change | Still available, with a Fabric capacity reservation or SQL Server Enterprise Edition with Software Assurance. |
| **Power BI Embedded** | Same, simpler | Included with every F SKU. Separate EM and A SKUs aren't required. |
| **Purchase and billing** | Changes | Move from Microsoft 365 commitment billing to Azure billing. F SKUs support pay-as-you-go and yearly or multiyear reservations. |
| **Capacity management** | Changes | Primarily managed through the Fabric portal (workspace assignments and capacity-level settings). Pause, resume, scale up, and scale down operations are performed through the Azure portal. |
| **Autoscale** | Changes | P SKU Autoscale doesn't exist on F SKUs. Instead, F SKUs use **on-demand resizing** - you scale up or down manually through the Azure portal. |
| **Capacity governance** | New capabilities | New cost-governance features are available on F SKUs, such as workspace-level surge protection and capacity overage protection. Use them to control consumption and prevent runaway costs. |
| **Cross-region item support** | New consideration | Standard Power BI items survive a cross-region reassignment. Large storage format semantic models require back-up and restore or clearing and conversion to small storage format before reassignment. All Fabric items (Lakehouses, Warehouses, Notebooks, Data Factory pipelines) cause reassignment to fail. |

## The migration journey at a glance

In its purest form, P-to-F migration is a 1:1 move to the equivalent F SKU in the same Azure region. Customers often use the migration as an opportunity to consolidate capacities, move across regions, or resize. Each of these changes adds complexity and risk. Treat these changes as separate workstreams that run after the licensing migration completes.

The migration follows the same five stages regardless of size or complexity.

1. **Decide.** Choose when to migrate, which F SKU to start with, and whether to stay in the same Azure region. See [Power BI Premium P SKU migration decision guide](premium-migration-decision-guide.md).
1. **Plan.** Inventory workspaces, baseline CU consumption by using the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app), and estimate future consumption with the [Fabric SKU Estimator](/fabric/enterprise/fabric-sku-estimator). Register the `Microsoft.Fabric` resource provider in Azure and pick a pilot workspace. For hands-on validation before purchase, provision a [Fabric trial](/fabric/get-started/fabric-trial) capacity to test workloads.
1. **Provision.** Buy the F SKU before you reassign anything. Choose pay-as-you-go or a reservation, and verify Power BI Report Server licensing if you use it.
1. **Migrate and validate.** Reassign workspaces in the Fabric admin portal or by using the [capacity migration notebook](https://github.com/microsoft/semantic-link-labs). For cross-region moves, recreate large storage format semantic models and Fabric items in the new region. Validate refreshes, reports, and gateways. See [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md).
1. **Decommission and operate.** P SKU cancellation is manual - Fabric doesn't automatically decommission your P SKU when you provision an F SKU. After you validate the migration, explicitly cancel the P SKU subscription in the Microsoft 365 admin center. Then set up cost monitoring by using [Microsoft Cost Management](/azure/cost-management-billing/cost-management-billing-overview), and take advantage of pause, resume, and scaling flexibility in Fabric.

## Migration scenarios

Most customers fall into one of the following four scenarios. The first three scenarios follow the standard migration steps in [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md).

| Scenario | Complexity | Notes |
| --- | --- | --- |
| **Same tenant, same region** | Low | The recommended default. Reassign each workspace to the new F SKU. Zero expected downtime apart from any active refreshes. |
| **Same tenant, cross region** | Moderate to high | Follows the standard migration steps, but large storage format semantic models and Fabric items must be backed up or captured to Git, deleted, and recreated in the new region. See [Cross-region migrations: Special handling](premium-migration-how-to.md#cross-region-migrations-special-handling). |
| **Multigeo (multiple F SKUs in different regions, same tenant)** | Moderate | Follows the standard migration steps, but you purchase F SKUs in each target region and plan governance for region-specific content. See [Multigeo migrations](premium-migration-how-to.md#multigeo-migrations). |
| **Cross-tenant** | High; not supported as a one-click migration | Doesn't follow the standard migration steps. Requires manual recreation of gateways, semantic models, workspaces, reports, apps, and dashboards. Consider multigeo first. See [Cross-tenant migrations](premium-migration-how-to.md#cross-tenant-migrations). |

> [!CAUTION]
> Cross-region migrations involve significantly more effort than same-region migrations. Beyond the item types that don't survive cross-region reassignment, plan for:
>
> - **Fabric items don't survive cross-region moves.** Lakehouses, Warehouses, Notebooks, and Data Factory pipelines cause reassignment to fail. Capture their definitions to Git (or export them) before reassignment, and then recreate them in the target region.
> - **Report rebinding.** When you back up and restore (or delete and redeploy) a large storage format semantic model, the recreated model gets a new GUID. Reports that referenced the original model need to be rebound to the recreated model.
> - **Gateway overhead.** Cross-region targets often require additional on-premises data gateway configuration and validation, especially if your gateways use Azure relays under Bring Your Own Relay (BYOR), because relay endpoints are region-bound.
>
> Choose cross-region migration only when data residency or another hard constraint requires it. Same-region migration is the recommended default.

## After you migrate

After you reassign workspaces and validate that reports and refreshes work on the new F SKU, give yourself a stabilization window before you cancel the P SKU and before you take on any optional modernization work. The following activities help you confirm the migration landed cleanly and decide what to do next.

### Stabilize cost

F SKU spend is predictable if you leave capacities running around the clock. Your monthly cost stays stable, though pay-as-you-go rates are typically higher than the equivalent P SKU. Use reservations to lock in savings for steady workloads, and use pause and resume for capacities that are genuinely idle for parts of the day. To stabilize cost:

- Track spend daily for the first 30 days by using [Microsoft Cost Management](/azure/cost-management-billing/cost-management-billing-overview).
- Set Azure budgets and alerts on the capacity's resource group so you're notified before spend exceeds plan.
- Evaluate a [yearly Fabric capacity reservation](/azure/cost-management-billing/reservations/fabric-capacity) once daily consumption is steady. Reservations typically discount predictable workloads.
- Pause capacities that are idle outside business hours to stop billing during those windows.

### Stabilize performance

For a 1:1 in-region migration to the equivalent F SKU, CU consumption should closely match your P SKU baseline after stabilization. Expect performance variation when the migration includes a configuration change - a different region, a different SKU size, or workload consolidation - and validate before you decommission the P SKU. **Reported overloads after migration are often caused by workload changes (a burst of refreshes, added content, changed refresh schedules) rather than the migration itself. Check usage patterns before you assume the F SKU is the cause.** To stabilize performance:

- Monitor the new capacity with the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) for one to two weeks after cutover.
- Compare against the baseline you captured on the P SKU. Investigate large deltas in refresh frequency, dataset size, or interactive load before you resize.
- Scale up on demand through the Azure portal if you see sustained throttling. See [Scale your capacity](/fabric/enterprise/scale-capacity).
- Validate across a full business cycle - include month-end and quarterly close - before you treat the baseline as final.
- Recheck the baseline whenever you add significant new content or change refresh schedules.
- Revalidate after any configuration change on your end (SKU size, region, workload assignment).
- For broader guidance on planning capacity growth and governance, see [Microsoft Fabric capacity planning guide](/fabric/enterprise/capacity-planning-manage-capacity-growth-governance).

### Review operations and governance

Some operational settings don't carry over automatically when workspaces move to an F SKU. Review the following:

- Confirm Azure RBAC assignments on the capacity resource so the right administrators can manage it.
- Reapply capacity-level workload settings (for example, semantic model memory limits) in the Fabric admin portal if they were customized on the P SKU.
- Recheck the **Users can create Fabric items** tenant setting and any capacity-scoped delegations.
- Apply Azure tags to the capacity resource so chargeback and showback reports attribute spend to the right cost center.
- Evaluate new capacity-usage governance features available on F SKUs (such as workspace-level surge protection and capacity overage protection) to set guardrails before you open the capacity to broader consumption.

### Explore modernization opportunities

Many Fabric modernization scenarios are technically possible on P SKUs too. What changes on F SKUs is the **operating model**: Azure-native cost management, capacity governance features (such as surge and overage protection), and unified Azure RBAC make it easier to take on these scenarios with clearer cost guardrails and better operational confidence. These options are *optional follow-ups*, not migration requirements:

- Bring existing data into OneLake by using [Mirroring](/fabric/database/mirrored-database/overview) and [Shortcuts](/fabric/onelake/onelake-shortcuts).
- Convert DirectQuery semantic models to [Direct Lake](/fabric/fundamentals/direct-lake-overview) where workloads benefit.
- Adopt [OneLake security](/fabric/onelake/security/get-started-security) for unified data access controls across Fabric workloads.

Treat these options as separate workstreams that run after the licensing migration completes. They don't block migration and shouldn't extend its timeline.

## Related content

- [Power BI Premium P SKU migration decision guide](premium-migration-decision-guide.md)
- [Migrate workspaces from Power BI Premium to Microsoft Fabric](premium-migration-how-to.md)
- [Power BI Premium to Microsoft Fabric migration FAQ](premium-migration-faq.md)
- [Power BI tenant migration patterns and strategies](tenant-migration-patterns.md)
- [Microsoft Fabric licenses](/fabric/enterprise/licenses)
- [Buy a Microsoft Fabric subscription](/fabric/enterprise/buy-subscription)
