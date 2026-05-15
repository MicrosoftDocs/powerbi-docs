---
title: Power BI tenant migration patterns and strategies
description: Learn migration patterns for Power BI tenant scenarios including cross-tenant migrations, tenant splits, and regional relocations. Includes planning frameworks and implementation guidance.
author: eric-urban
ms.author: eur
ms.reviewer: winnieli
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: concept-article
ms.date: 05/14/2026
ai-usage: ai-assisted
---

# Power BI tenant migration patterns and strategies

Organizations face various tenant migration scenarios in Power BI, driven by mergers and acquisitions, company divestments, data residency requirements, or regional compliance needs. Tenant migrations are complex undertakings that require careful planning, comprehensive backup strategies, and systematic execution. This article provides guidance for enterprise-scale Power BI tenant migrations, including decision frameworks to help determine whether migration is necessary, and detailed implementation methodologies for different migration patterns.

> [!IMPORTANT]
> Tenant migrations carry significant risk and require extensive manual effort. Microsoft doesn't provide direct support for migrating content between tenants or within the same tenant during regional relocations. Before proceeding with any migration, carefully evaluate alternatives such as multi-geographic capacities that can address many scenarios without the complexity and risk of full tenant migration.

## Tenant migration scenarios

Power BI tenant migration covers three scenarios. Identify which one applies to your situation before you plan your migration.

| Scenario | Description | Typical trigger |
|---|---|---|
| **Side-by-side (cross-tenant) migration** | Two separate Microsoft 365 tenants operate in parallel. Artifacts are moved from the source tenant to the target tenant individually. | Mergers and acquisitions that consolidate two organizations into a single tenant. |
| **Tenant split** | A single Power BI tenant is separated into two independent tenants. Artifacts, workspaces, and users belonging to the departing business entity are selectively carved out. | Divestments and spin-offs. |
| **Tenant remap (tenant relocation)** | The Power BI tenant is deleted and recreated in a new home region within the same Microsoft 365 tenant. The Microsoft 365 tenant ID, domain, and user identities are preserved. For more information, see [Move Power BI between geographic regions](/power-bi/support/service-admin-region-move). | Data residency requirements that force the tenant home region to a specific country/region. |

Side-by-side migrations and tenant splits are *cross-tenant* operations. Tenant remap is a *region relocation* within the same Microsoft 365 tenant.


> [!NOTE]
> For considerations and limitations on tenant remapping (regional relocation) with Microsoft Support, see [Move your Power BI tenant to a different region](service-admin-region-move.md). Microsoft Support assistance is limited to deleting the previous tenant and remapping a new tenant to the specified region; migration assistance isn't provided. You must have a rehydration plan for both data and metadata, whether through scripted backup and restore, manual actions, or a recreation and reloading process. This procedure carries considerable risk, including potential data or artifact loss if backups are incomplete or artifacts are omitted. Downtime during tenant remapping can range from three to 24 hours, with more downtime required for restoration of artifacts.


## Evaluate alternatives before migrating

Tenant migration involves considerable risk and effort. Explore alternative options before proceeding. The following strategies might help you avoid a tenant migration or relocation.

### Multi-geo deployment

A [multi-geo deployment](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium) lets you deploy Power BI and Fabric capacity in a region of your choice while keeping your tenant home region unchanged. The data within those capacities stays close to your end users, and you can have multiple capacities in different regions under the same tenant.

Migrating artifacts to a capacity in a different region is simpler than migrating the tenant itself. To move a workspace to a different region, reassign the workspace from one capacity to another. The reassignment is seamless for Power BI items.

> [!IMPORTANT]
> Fabric items don't survive workspace reassignment across capacities in different regions. Delete Fabric items before the workspace reassignment and recreate them afterward, or use Git integration to back up and restore Fabric items.

Consider multi-geo deployment for the following requirements:

- **Data latency.** Place data and compute closer to end users by deploying capacity in their region.
- **Data residency.** Your data and compute are tied to your *capacity* region, not your tenant region. A multi-geo deployment keeps data within data residency boundaries for most workloads.

Only consider a tenant remap when data residency requirements are strict enough that even tenant metadata (workspace definitions, semantic model metadata, visual metadata, settings, policies) and Microsoft 365 user information must remain within data residency boundaries.

### Bring your own storage account for Dataflow Gen1

[Dataflow Gen1](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) writes its output to an Azure Data Lake Storage (ADLS) Gen2 account that, by default, sits in the Power BI tenant's home region. If Dataflow Gen1 storage location is your only residency concern, configure a bring-your-own ADLS Gen2 account in the desired region instead of relocating the tenant.

### Custom Azure relay for gateway region mismatch

If your capacity is deployed in a different region from your tenant home region, the default on-premises data gateway endpoint routes traffic back to the home region. To keep gateway traffic in your capacity region, configure a [custom Azure relay](/data-integration/gateway/service-gateway-azure-relay). A gateway region mismatch alone shouldn't trigger a tenant migration.

### Review the business case

If a tenant migration is driven by a business need (for example, billing consolidation), weigh the effort and risk against the outcome. A small tenant might be straightforward to migrate; a large tenant with significant Fabric content might warrant revisiting the business need before proceeding.


## What's supported for migration

Most Power BI items support definition export through the [Power BI Admin API](/rest/api/power-bi/admin) or [Workspace Scanner API](/power-bi/enterprise/service-admin-metadata-scanning) and can be scripted. Most Fabric items don't support definition export and must be manually recreated.

The following table summarizes the migration path for each artifact type.

| Order | Artifact | Migration path |
|---|---|---|
| 1 | Gateways | No migration path. Must be reconfigured in the target tenant by a Power BI admin. |
| 2 | Workspaces | No migration path. Must be recreated in the target tenant. Bulk creation is possible using the Power BI Admin API. |
| 3 | Fabric items | Items that support [Git integration](/fabric/cicd/git-integration/intro-to-git-integration) can be backed up by committing to Git, unlinking from the source workspace, and relinking to a new workspace in the target tenant. Only the definition is backed up; data isn't included. Items that don't support Git integration must be recreated manually. For Lakehouse, only metadata is preserved; delta tables and schemas don't transfer. |
| 4 | Dataflows | Download the definition JSON and reimport into the target tenant. Scripting is possible using the Admin API. |
| 5 | Semantic models / datasets | Use [backup and restore](/power-bi/enterprise/service-premium-backup-restore-dataset) to an ADLS Gen2 storage account, or download the definition and reimport. Scripting is possible using the Admin API. |
| 6 | Reports | Owners or admins [download the .pbix](/power-bi/create-reports/service-export-to-pbix) and republish to the target tenant. Alternatively, export the JSON definition. Scripting is possible using the Admin API. |
| 7 | Dashboards | No migration path. Must be manually recreated. |
| 8 | Power BI apps | No migration path. Must be manually recreated. |
| 9 | Paginated reports | Owners or admins download the RDL file and [publish](/power-bi/guidance/publish-reporting-services-power-bi-service) to the target tenant. |

> [!IMPORTANT]
> Always recreate artifacts in this order. Downstream artifacts depend on upstream artifacts, and skipping the order can lead to broken references during execution. Performing a Git sync wipes all items in the workspace that don't exist in the repo. 

## Migration methodology

Consider the following reference activities. Most steps apply to all three scenarios. Steps that are specific to a scenario are called out in their headings.

### Step 1: Discovery and inventory assessment

Build a complete inventory of artifacts and dependencies, and identify what you can, can't, or shouldn't migrate.

**Activities**

- Run tenant-wide discovery by using a combination of:
  - Power BI Admin APIs
  - Fabric Admin APIs
  - Activity logs (workspaces, reports, datasets, refreshes)
  - Manual documentation for items not exposed by APIs
- Capture:
  - Workspaces (type, capacity, region)
  - Reports, semantic models (especially large storage format), dataflows
  - Fabric items (Lakehouse, Warehouse, Eventhouse, notebooks)
  - Gateways, data sources, credentials
  - Row-level security (RLS) roles, workspace permissions, sharing links
- Classify each workspace by migration complexity (low, medium, high) based on the artifacts it contains and dependencies.

**Outputs**

- A primary inventory spreadsheet.
- A migration complexity classification for every workspace.


### Step 2: User and security discovery

Capture user identity, licensing, and permissions, and map them between tenants when required.

In a tenant remap, user object IDs are preserved. For a side-by-side migration or tenant split, users have different object IDs in the target tenant. Map each source-tenant identity to its target-tenant identity. Reassign Power BI license assignments (Free, Pro, PPU). Mirror security groups in the new Microsoft 365 tenant.

**Activities**

Identify and record:

- Power BI license assignments (sourced from [Microsoft Graph](/graph/api/resources/licensedetails))
- User object IDs in the source tenant
- User object IDs in the target tenant (side-by-side or split only)
- User permissions and workspace access levels
- Current tenant-level settings (capture manually through the admin portal)
- Current governance configurations (sensitivity labels, endorsement policies)

You can extract workspace and artifact permissions by using the Power BI Admin APIs and the [Workspace Scanner API](/power-bi/enterprise/service-admin-metadata-scanning).

### Step 3: Stakeholder communication and change management

Communicate the migration plan early to reduce resistance and support load.

**Key stakeholder groups**

- Executive sponsors
- Workspace owners and report authors
- End users
- IT, security, and identity teams

**Activities**

- Develop a communication plan covering:
  - Migration overview and rationale.
  - What is and isn't migrated (for example, personal workspaces, idle workspaces).
  - What changes (URLs, access, refresh timing). Downstream Power Apps and SharePoint links that reference Power BI URLs are also affected.
  - What doesn't change (data semantics, visuals, business logic).
- Communicate key dates:
  - Freeze windows (typically about one week of no changes in the source tenant during final backup).
  - Expected downtime (for tenant remap scenarios).
  - Validation periods for stakeholders to verify their own reports in the target tenant.
  - Cutover milestones and decommissioning dates for the source tenant (side-by-side scenarios).

**Outputs**

- A stakeholder briefing deck.
- An end-user FAQ.

### Step 4: Submit a tenant remap request (tenant remap only)

When the migration date is locked, submit a [support ticket](/power-bi/support/service-admin-region-move#request-the-region-move) and specifically select the tenant remap option. A Microsoft support engineer takes the request.

**Activities**

- Submit the support ticket.
- Complete the readiness checklist provided by Microsoft.
- Agree on a migration date and time slot, including a backup time slot.
- Delete existing capacity before the tenant remap takes place.

**Expected outcomes**

- A typical remap takes about three hours, but delays of up to 24 hours are possible if complications occur.
- After remap completes, the new tenant has the same tenant ID and is located in the requested region.

### Step 5: Target tenant readiness

A newly created or newly remapped tenant isn't immediately ready to receive content. Configure it first.

**Activities**

- Configure Power BI tenant settings:
  - Workspace creation controls
  - Sharing and external access policies
  - Custom visuals governance
  - Sensitivity labels and information protection
  - Audit log and monitoring enablement
- Purchase Fabric capacities of equal or higher SKU than the source.
- Configure and validate gateways, gateway clusters, and data connectivity.
- For side-by-side or tenant split scenarios:
  - Create a user in the target tenant for every user in the source tenant, and record the user mapping.
  - Recreate user groups from the source tenant.
  - Assign Power BI licenses in the target tenant.
- Align governance: sensitivity labels, Microsoft Purview integration, and endorsement policies.

### Step 6: Migration pilot

Run a test migration on a representative sample workspace before the production migration.

For side-by-side migrations, the source tenant remains available as a fallback for retries. For tenant remap, content that wasn't backed up correctly before the remap is unrecoverable. A successful pilot is the principal way to de-risk the remap path.

**Pilot workspace selection criteria**

- Contains a mix of artifacts: reports, semantic models, dataflows, and Fabric items.
- Uses realistic data sources and refresh schedules.
- Has workspace-level permissions and ideally RLS.
- Is actively used but not mission-critical.

### Step 7: Migration execution

Execute the migration. Supported items are scripted first; unsupported items are recreated manually.

For large tenants, write scripts that wrap the Power BI Admin API to bulk-export and bulk-recreate artifacts.

Recreate artifacts in the order defined in [What's supported for migration](#whats-supported-for-migration). Skipping the order breaks dependencies.

### Step 8: Validation and testing

Validate that the content is migrated successfully and behaves correctly.

Exported semantic model definitions don't include the underlying data. Every imported semantic model needs at least one manual refresh in the target tenant.

> [!TIP]
> Consider temporarily scaling to a higher capacity SKU during validation. A large number of concurrent refreshes can otherwise saturate the target capacity.

**Activities**

- Validate data: row counts, key aggregates, refresh success.
- Validate security: RLS rules, workspace access, sharing scopes.
- Validate performance: report load times, query responsiveness, capacity headroom.

### Step 9: User cutover and adoption

Move users to the target tenant and update downstream applications.

**Activities**

- Grant users access to workspaces and artifacts in the target tenant.
- Update embedded report URLs, SharePoint links, Power Apps connections, and Power Automate flows that reference Power BI content.
- Disable editing in the source tenant (read-only phase) before final decommissioning.
- Run short enablement sessions covering what changed and where to find content.

## Related content

- [Move Power BI between geographic regions](service-admin-region-move.md)
- [Multi-geo support for Power BI Premium](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium)
- [Power BI tenant setup](/power-bi/guidance/powerbi-implementation-planning-tenant-setup)
- [Power BI semantic model backup and restore](/power-bi/enterprise/service-premium-backup-restore-dataset)
- [Configure a custom Azure relay for an on-premises data gateway](/data-integration/gateway/service-gateway-azure-relay)
- [Dataflows: Connect to your own ADLS Gen2 storage](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration)