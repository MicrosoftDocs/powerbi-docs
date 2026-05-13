---
title: Power BI Tenant Migration Patterns and Strategies
description: Learn migration patterns for Power BI tenant scenarios including cross-tenant migrations, tenant splits, and regional relocations. Includes planning frameworks and implementation guidance.
author: eric-urban
ms.author: eur
ms.reviewer: hfeng
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: concept-article
ms.date: 05/10/2026
ms.custom:
  - subject-moving-resources
ai-usage: ai-assisted
---

# Power BI tenant migration patterns and strategies

Organizations face various tenant migration scenarios in Power BI, driven by mergers and acquisitions, company divestments, data residency requirements, or regional compliance needs. Tenant migrations are complex undertakings that require careful planning, comprehensive backup strategies, and systematic execution. This article provides guidance for enterprise-scale Power BI tenant migrations, including decision frameworks to help determine whether migration is necessary, and detailed implementation methodologies for different migration patterns.

> [!IMPORTANT]
> Tenant migrations carry significant risk and require extensive manual effort. Microsoft doesn't provide direct support for migrating content between tenants or within the same tenant during regional relocations. Before proceeding with any migration, carefully evaluate alternatives such as Multi-Geo capacities that can address many scenarios without the complexity and risk of full tenant migration.

## Migration scenario overview

Tenant migrations typically arise for two primary reasons: organizational acquisitions requiring the consolidation of separate tenants, and relocations driven by data residency requirements necessitating proximity to a new geographical region.

### Cross-tenant migration

In acquisition scenarios, a side-by-side **cross-tenant migration** is implemented, involving parallel operation of both tenants and gradual transfer from one to the other. Two separate Microsoft 365 tenants operate simultaneously, requiring artifacts, users, and permissions to be migrated individually from the source tenant to the target tenant.

This scenario commonly occurs during migrations resulting from acquisitions. Two separate tenants operate simultaneously, requiring you to move artifacts individually. Although this process can be lengthy and demanding, it carries a low risk of data or artifact loss and minimal downtime for end users, since you can decide when users transition to the new tenant. During a side-by-side migration, licensing and capacity must be maintained in both tenants for the duration of the migration, which can temporarily increase cost while both environments run in parallel. User and group migration must also be considered in this scenario.

### Tenant relocation (regional move)

When compliance requirements mandate regional relocation, the process involves [deleting the existing tenant and recreating it in the desired region](service-admin-region-move.md) within the same Microsoft 365 environment. This is distinct from cross-tenant migration because it maintains the same tenant identity but changes the Power BI tenant [home region](/power-bi/guidance/powerbi-implementation-planning-tenant-setup#home-region).

To relocate the home tenant region while maintaining the same Microsoft 365 tenant (and retaining your @company.com domain), you must request a tenant remap through Microsoft Support. The process entails complete deletion of the existing Power BI tenant, followed by creation of a new, empty tenant in the desired home region, which is then linked to the original Microsoft 365 tenant. This ensures that your Power BI or Fabric tenant ID and user access remain unchanged.

Microsoft Support assistance is limited to deleting the previous tenant and remapping a new tenant to the specified region; migration assistance isn't provided. You must have a rehydration plan for both data and metadata, whether through scripted backup and restore, manual actions, or a recreation and reloading process. This procedure carries considerable risk, including potential data or artifact loss if backups are incomplete or artifacts are omitted. Downtime during tenant remapping can range from three to 24 hours, with additional downtime required for restoration of artifacts.

> [!NOTE]
> For step-by-step guidance on tenant remapping (regional relocation) with Microsoft Support, see [Move your Power BI tenant to a different region](service-admin-region-move.md).

### Tenant split

A tenant split typically occurs during company divestments or spin-offs, where a single Power BI tenant needs to be separated into two independent tenants. This scenario requires selectively carving out artifacts, data, workspaces, and users that belong to the departing business entity while leaving the rest untouched. This adds an extra layer of complexity, as dependencies, shared semantic models, gateways, and capacity assignments must be carefully untangled. User and group migrations to the new tenant must also be considered.

### Scenario comparison

The following table compares the three migration scenarios to help you identify which pattern applies to your situation:

| Aspect | Cross-tenant migration | Tenant relocation (regional move) | Tenant split |
|--------|------------------------|-----------------------------------|---------------|
| **Use case** | Mergers and acquisitions | Data residency and regional compliance | Company divestments and spin-offs |
| **Tenant identity** | Two separate tenants operate in parallel | Same tenant ID, new home region | One tenant becomes two independent tenants |
| **User accounts** | Different user object IDs between tenants | Same user object IDs maintained | Users split between two tenants with different object IDs |
| **Downtime** | Minimal—users cutover when ready | 3-24 hours during remap plus restoration time | Minimal for remaining tenant, variable for new tenant |
| **Risk level** | Low—source tenant remains available | High—tenant deletion with no rollback | Medium to high—dependencies must be untangled |
| **Cost impact** | Higher—dual licensing and capacity during migration | Lower—single tenant, temporary capacity deletion | Variable—depends on split complexity |
| **Complexity** | High—manual migration of artifacts, users, and permissions | High—complete backup and restore required | Very high—selective carving with dependency management |
| **Microsoft Support** | No direct migration support | Limited to tenant deletion and remap only | No direct migration support |

## Evaluate alternatives before migrating

Tenant migration involves considerable risk and effort. Explore alternative options before proceeding. The following strategies might help you avoid a tenant migration or relocation.

### Multi-Geo deployment

Consider a [multi-geo deployment](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium) first. A multi-geo deployment allows you to deploy your Power BI or Fabric capacity in the desired region, so that the data within those capacities remains close to your end users. Your Power BI or Fabric home tenant region remains in the original location where the Power BI tenant was first created. The home tenant region continues to store tenant-related metadata and user information. You can have multiple Power BI or Fabric capacities in different regions under the same tenant.

Migrating your artifacts to a capacity in a different region is much easier than migrating your entire tenant to a different region. In this scenario, you simply reassign your workspace from one capacity to another and migration happens seamlessly, with the exception of Fabric items, which must be deleted before the workspace reassignment and recreated after.

### Data latency considerations

If you're trying to resolve data latency by placing your data closer to your end users, consider a [multi-geo deployment](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium). As part of migrating your capacity to a new region, you also need to move your data gateway to the new desired location, which might cause issues during gateway setup. See the Gateway provisioning considerations section in this article for remediation steps.

### Data residency requirements

If your move is motivated by data residency laws, consider a [multi-geo deployment](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium) first to move data within data residency boundaries. Your actual data and compute are tied to your capacity region, not the tenant region, with the exception of Dataflow Gen1. In Dataflow Gen1, output is written to an Azure Data Lake Storage (ADLS) Gen2 account that by default is in the Power BI tenant's home region. In this scenario, you can [bring your own ADLS Gen2 account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) to specify another storage account you created in the desired region.

Only consider a tenant migration if data residency laws require that tenant metadata (workspace definitions, semantic model metadata, visual metadata, settings, and policies) and Microsoft 365 user information (users, groups, and permissions) also reside within data residency boundaries.

### Gateway provisioning considerations

If you deployed your capacity in a different region from your home tenant region, you might encounter data gateway setup issues due to the region mismatch. This can be resolved by setting up a [custom Azure relay](/data-integration/gateway/service-gateway-azure-relay). A custom Azure relay endpoint allows your data to remain in your desired region instead of traveling back to your home tenant region (where the default endpoint is set up). Gateway issues shouldn't prompt a tenant migration because they can be mitigated.

### Business considerations

If a business need triggered a tenant migration (for example, migrating your Power BI tenant to a different tenant for billing consolidation), weigh the efforts against the outcomes. If your Power BI tenant is small and straightforward to migrate, you can proceed with the migration. However, if your Power BI tenant is large and migration is complex and high risk, consider reviewing the business need to determine if there's any possibility to avoid a tenant migration. Tenant migration should be the last resort due to the considerable risk and business disruption involved.

## Migration complexity and limitations

Migrating a Power BI tenant is a complex process with no direct support from Microsoft. The process relies on scripting and automation where possible, combined with manual actions. In situations where downloads aren't feasible with Admin APIs—such as with Lakehouse artifacts—manual recreation of the artifact is required. Items that require manual recreation include Power BI Apps, Power BI dashboards, and all Fabric items.

## Migration methodology

If you confirmed that a tenant migration is unavoidable, follow the recommended steps for executing a tenant migration. Most steps apply to all scenarios, but some are specific to tenant remap or side-by-side migrations.

### Step 1: Discovery and inventory assessment

In every migration project, start with a full audit of your tenant to understand what you're working with. The Power BI Scanner API, Power BI Admin API, and Fabric Admin API perform a full tenant discovery. Most Power BI items support definition export and can be backed up and migrated straightforwardly, whereas most Fabric items don't support this and require manual recreation.

#### Objectives

This step aims to:

- Establish a complete inventory of artifacts and dependencies.
- Identify what can, can't, or shouldn't be migrated.

#### Activities

Run tenant-wide discovery using a combination of:

- Power BI Admin APIs
- Fabric Admin APIs
- Activity logs (workspaces, reports, semantic models, refreshes)
- Manual documentation

Capture the following information:

- Workspaces (type, capacity, region)
- Reports, semantic models (especially large storage format semantic models), dataflows
- Fabric items (Lakehouse, Warehouse, Eventhouse, notebooks)
- Gateways, data sources, credentials
- Row-level security (RLS) roles, workspace permissions, sharing links

Assess:

- What can be migrated easily (artifacts that support definition export)
- What can't be migrated easily (Fabric items, large storage format semantic models)
- What shouldn't be migrated (old artifacts that haven't been used for months)

#### Outputs

- Master inventory spreadsheet.
- Migration complexity classification for each workspace (Low/Medium/High).

> [!TIP]
> Use the Power BI Scanner API to automate tenant discovery and create a comprehensive inventory. This API provides detailed information about workspaces, reports, semantic models, dataflows, and dependencies, which can be exported to a spreadsheet for analysis and migration planning.

#### Remediation approaches

For Fabric items, Git integration can be used to back up and restore Fabric items by backing up a workspace, unlinking the workspace from the Git repository, and re-linking the Git repository with a new workspace to restore the items. This works better for some Fabric items than others. For Fabric Lakehouses, only metadata is preserved; delta tables and schemas don't migrate. For large storage format semantic models, assess the actual semantic model size. For models under 10 GB, convert them back to a standard semantic model and migrate as usual. For models over 10 GB, use a backup and restore option or recreate the semantic model in the new tenant.

### Step 2: User and security discovery

Consider user permissions when migrating workspaces in the new tenant. For a tenant remap, your user object IDs remain the same. For a side-by-side tenant migration, your users have different object IDs and their object ID from the source tenant must be mapped to their object ID in the target tenant. User licensing (free, Pro, PPU) must also be reassigned in the target tenant to allow a seamless side-by-side tenant migration.

Workspace and artifact permissions can be extracted using Power BI Admin APIs and the Workspace Scanner API. However, Power BI licenses aren't exposed through Power BI APIs and must be sourced from Microsoft Graph, where license assignments are managed at the Microsoft 365 level.

#### Objectives

This step aims to:

- Understand who uses what and how users map to the new tenant (if performing a side-by-side tenant migration).
- Capture current tenant settings and governance strategies.

#### Activities

Identify and record the following items:

- Licensing assigned to Power BI users
- User object ID in old tenant
- User object ID in new tenant
- User permissions (access level for workspaces)
- Current tenant-level settings (manual screen capture)
- Current governance configurations (sensitivity labels, endorsement policies)

#### Outputs

- User and group mapping document (for side-by-side migrations).
- Licensing inventory by user.
- Workspace permission matrix.
- Tenant settings documentation.

### Step 3: Stakeholder communication and change management

Stakeholders (report creators, end users) should receive communication on the migration and what to expect to ensure there are no surprises.

#### Objectives

This step aims to:

- Set expectations early.
- Reduce resistance and support load.

#### Key stakeholder groups

- Executive sponsors
- Workspace owners and report authors
- End users
- IT, security, and identity teams

#### Activities

Devise a communication plan containing:

- Migration overview and rationale
- What changes (URLs, access, refresh timing) - this impacts linkage to other Power Apps or SharePoint if applicable
- What doesn't change (data, visuals, semantics)

Inform on key dates:

- Freeze windows (about one week of no changes in the source tenant during final backup)
- Expected downtime for tenant remap scenarios
- Validation periods (stakeholders validate reports they own in the target tenant)
- Cutover milestones (begin decommissioning of source tenant for side-by-side tenant scenarios)

#### Outputs

- Stakeholder briefing deck
- End-user FAQ

### Step 4: Submit a tenant remap request (tenant remap scenario only)

When you're ready to confirm a date for your tenant migration, submit a [support ticket](service-admin-region-move.md#request-the-region-move) to Microsoft Support, and select the tenant remap option. A member from Microsoft Support contacts you.

#### Objectives

This step aims to:

- Submit a formal request for Microsoft to delete and recreate your existing tenant.

#### Activities

- Submit a support ticket to Microsoft Support
- Complete the readiness checklist provided by Microsoft
- Agree on migration date and time slot (including a backup time slot)
- Delete existing capacity before tenant remap takes place

> [!WARNING]
> The tenant remap process involves permanent deletion of your existing Power BI tenant. Ensure all artifacts are backed up completely before proceeding. There is no rollback option once the deletion begins. Verify your backup integrity by testing restore procedures during your pilot phase.

#### Outputs

A typical remap takes three hours to complete. However, expect delays up to 24 hours if there are complications. After remap completes, your new tenant should have the same tenant ID and be in the desired region.

### Step 5: Target tenant readiness

Once your new tenant is set up, it might not be immediately ready for content to land.

#### Objectives

This step aims to:

- Ensure the new tenant is ready before content arrives.

#### Activities

Configure Power BI tenant settings:

- Workspace creation controls
- Sharing and external access policies
- Custom visuals governance
- Sensitivity labels and information protection
- Audit log and monitoring enablement

Additional activities:

- Purchase Fabric capacities (of equal or higher SKU)
- Configure and validate gateways, gateway clusters, and data connectivity
- For side-by-side tenant migration or tenant split scenarios, create a user in your target tenant for every user in the source tenant and record the user mapping
- For side-by-side tenant migration or tenant split scenarios, recreate all your user groups that are in use in the source tenant in the new target tenant
- Configure user licensing in target tenant
- Align governance (sensitivity labels and Purview integration, endorsement policies)

#### Outputs

- Fully configured target tenant ready to receive content.
- Documented tenant settings baseline.
- Provisioned capacities and gateways.

### Step 6: Migration pilot

Perform a test migration of some workspaces before performing the actual tenant migration. For a side-by-side tenant migration, there's more room for error because the source tenant always exists for a retry. However, for a tenant remap, if artifacts weren't backed up properly, those artifacts are permanently lost after a tenant remap. Test the migration first and become fully familiar with backing up the items and reimporting them.

#### Objectives

This step aims to:

- Validate the end-to-end migration approach in a low-risk, controlled manner.
- Confirm target tenant readiness across security, data connectivity, capacity, and performance for a side-by-side migration scenario.
- De-risk the full migration by identifying issues early and refining the runbook.

#### Activities

Select a representative sample workspace from the source tenant for migration testing. Perform a test run of the migration with this workspace.

#### Selection criteria

- Contains a mix of artifacts including reports, semantic models, dataflows, or Fabric items
- Uses realistic data sources and refresh schedules
- Preferably includes workspace-level permissions or RLS
- Actively used, but non-mission-critical

> [!WARNING]
> For tenant remap scenarios, the pilot phase is critical. If you discover backup gaps or restoration issues during the pilot, those same issues will occur during the production migration—but with no source tenant to fall back on. Treat the pilot as your final validation before the irreversible remap process.

#### Outputs

- Validated migration runbook with timings.
- Identified issues and remediation steps.
- Confirmation of target tenant readiness.

### Step 7: Migration execution

The migration order of settings and artifacts is important because artifacts have dependencies on one another. If you have a large number of workspaces and items, you can write scripts to help bulk export and bulk recreate artifacts using the Power BI Admin API.

#### Objectives

This step aims to:

- Migrate all your artifacts into the new tenant as soon as possible to minimize downtime.

#### Activities

Migration is executed for all supported items first, then unsupported items are migrated manually.

> [!TIP]
> For large-scale migrations with hundreds of workspaces, consider developing PowerShell scripts using the Power BI Admin API to automate artifact export and import. This significantly reduces manual effort and ensures consistency across the migration.

Artifacts must be recreated in the following order:

| Order | Object | Migration Path |
|-------|--------|----------------|
| 1 | Gateways | No migration path—must be reconfigured in the new tenant by a Power BI Admin |
| 2 | Workspaces | No migration path—must be recreated in the new tenant by a Power BI Admin (scripted creation possible using Admin API) |
| 3 | Fabric Items | Fabric items that support Git integration can be backed up and restored using Git (only definition is backed up, not the data itself), but this wipes all other items in the workspace, so this must be performed first before any artifacts land. There's no migration path for Fabric items that aren't Git integrated and they must be recreated manually in the new tenant. In the second case, perform Fabric item recreation as the last step. |
| 4 | Dataflows | Download definition JSON and reimport into new tenant (scripting possible using Admin API) |
| 5 | Semantic Model/Dataset | Use [Backup and Restore](/power-bi/enterprise/service-premium-backup-restore-dataset) to ADLS Gen2 Storage account, or download definition JSON and reimport into new tenant (scripting possible using Admin API) |
| 6 | Report—Configuration | Report Owners/admin [download the PBIX](/power-bi/create-reports/service-export-to-pbix) and then republish to the new tenant (scripting possible using Admin API) |
| 7 | Report—Data—Import Mode | No migration path—must be refreshed in the new tenant after semantic model definition is imported |
| 8 | Dashboards | No migration path—must be manually recreated in the new tenant |
| 9 | Power BI Apps | No migration path—must be manually recreated in the new tenant |
| 10 | Paginated Reports | Report Owners download the RDL file and then [publish](/power-bi/guidance/publish-reporting-services-power-bi-service?context=%2Fpower-bi%2Fcreate-reports%2Fcontext%2Fcontext&tabs=reporting-services) to the new tenant |

#### Outputs

- All artifacts migrated to target tenant.
- Migration log documenting successes and issues.
- List of items requiring manual recreation.

### Step 8: Validation and testing

Always validate the migration. Exported semantic model definitions aren't migrated with the actual data after import, so they all need to be refreshed manually to retrieve data from the source again. Consider switching to a higher capacity during this period to avoid bottlenecking when many background refreshes are happening simultaneously.

#### Objectives

This step aims to:

- Validate that contents were migrated successfully and operate as expected.

#### Activities

- Ensure data validation (row counts, aggregates, refresh success)
- Test security (RLS, workspace access)
- Performance testing (load times, query responsiveness)

#### Outputs

- Validation report confirming successful migration.
- List of any discrepancies requiring remediation.
- Performance baseline for target tenant.

### Step 9: User cutover and adoption

In this step, migrate the users onto the new tenant and give them the correct access level. If other applications (SharePoint, Power Automate) are connected to previous reports, they need to point to a new URL.

#### Objectives

This step aims to:

- Move users confidently to the new tenant.
- Minimize dual-tenant usage duration (for side-by-side migrations).

#### Activities

- Grant users access to workspaces and artifacts in target tenant
- Update embedded URLs, SharePoint links, Power BI apps
- Disable editing in old tenant (read-only phase)
- Provide brief enablement sessions on "What changed" and "Where to go now"

#### Outputs

- Users actively working in target tenant.
- Updated documentation and links pointing to new tenant.
- Decommission plan for source tenant (side-by-side scenarios).

## Related content

- [Move your Power BI tenant to a different region](service-admin-region-move.md)
- [Multi-Geo support for Power BI Premium](/fabric/admin/service-admin-premium-multi-geo)
- [Power BI tenant setup](/power-bi/guidance/powerbi-implementation-planning-tenant-setup)
