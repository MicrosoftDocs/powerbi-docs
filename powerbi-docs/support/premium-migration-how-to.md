---
title: "Migrate Workspaces From Power BI Premium to Microsoft Fabric"
description: "Learn how to migrate workspaces from Power BI Premium P SKUs to Microsoft Fabric F SKUs using the admin portal or capacity migration notebook. Start now."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: winnieli, rabuchep, erikbohn, chwebb, sraut
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: how-to
ms.date: 07/22/2026
ai-usage: ai-assisted
#customer intent: As a Fabric or Power BI administrator, I want a step-by-step procedure to inventory, reassign, validate, and decommission workspaces during the P SKU to F SKU migration so that I can complete the move with minimal downtime, including in cross-region and special-handling scenarios.
---

# Migrate workspaces from Power BI Premium to Microsoft Fabric

This article guides Fabric and Power BI administrators through the process of moving workspaces from Power BI Premium per-capacity SKUs (P SKUs) to Microsoft Fabric capacity SKUs (F SKUs). It covers the standard same-region path, the cross-region path with special handling for large semantic models and Fabric items, and validation and decommissioning steps.

The migration happens at the workspace level. Reassign each workspace from a P SKU capacity to an F SKU capacity. There's no tenant-wide flip. Reassign workspaces individually through the Fabric admin portal or in bulk through the capacity migration notebook.

Before you start, decide which F SKU to buy, which region to use, and when to migrate. For that guidance, see [Power BI Premium P SKU migration decision guide](premium-migration-decision-guide.md). For the end-to-end journey context, see [Power BI Premium to Microsoft Fabric migration overview](premium-migration-overview.md).

## Prerequisites

Confirm the following prerequisites before you begin:

- **Azure access.** You have permissions on the Azure subscription to register the `Microsoft.Fabric` resource provider and to create and manage Fabric capacities. Follow the principle of least privilege: instead of assigning the broad Owner or Contributor role, use a custom role that grants only the `Microsoft.Fabric` actions you need (for example, `Microsoft.Fabric/register/action` and `Microsoft.Fabric/capacities/*`). For the full list of available actions, see [Microsoft.Fabric permissions](/azure/role-based-access-control/permissions/analytics#microsoftfabric). To create the custom role, see [Create or update Azure custom roles using the Azure portal](/azure/role-based-access-control/custom-roles-portal).
- **Fabric admin role.** You have the Fabric administrator (previously Power BI administrator) role in the tenant.
- **Capacity admin rights.** You're a capacity administrator on the source P SKU capacity, so you can reassign workspaces away from it. For more information, see [Manage capacity admins](/fabric/admin/capacity-settings#manage-your-capacity).
- **Workspace or Fabric admin rights.** You're a workspace admin on each workspace you plan to reassign, or you perform reassignments as a tenant admin.
- **Quota.** Your target Azure region has enough Fabric capacity unit (CU) quota to provision the F SKU you choose. If not, [request a quota increase](/fabric/enterprise/fabric-quotas#request-a-quota-increase) ahead of time. For more information, see [Microsoft Fabric capacity quotas](/fabric/enterprise/fabric-quotas).
- **Microsoft Fabric Capacity Metrics app installed.** Use it to baseline current P SKU consumption and validate F SKU consumption after migration. See [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app).

## Step 1: Inventory your workspaces and items

To avoid surprises during migration, asset discovery is the most effective step. Inventory every workspace assigned to your P SKU capacities and flag items that need special handling.

For each workspace, record:

- Workspace name and ID
- Owners and primary business contact
- Power BI items: reports, semantic models (and their storage format), dataflows, paginated reports, dashboards
- Fabric items: Lakehouses, Warehouses, Notebooks, Data Factory pipelines, Eventstreams, KQL databases, Dataflows Gen2
- Scheduled refresh windows and any pipelines that run on a schedule
- Gateway dependencies

Flag the following items because they need special handling on a cross-region move:

- **Large storage format semantic models.** These models don't survive a cross-region reassignment as is. See [Handle large storage format semantic models on cross-region migrations](#handle-large-storage-format-semantic-models-on-cross-region-migrations).
- **Any Fabric item.** Fabric items don't survive a cross-region reassignment. See [Handle Fabric items on cross-region migrations](#handle-fabric-items-on-cross-region-migrations).

> [!TIP]
> Even if your organization licensed only Power BI Premium, users might have created Fabric items during a Fabric trial. Run discovery against every workspace, not just the ones you expect to contain Fabric items.

To extract workspace and item metadata, use the [Power BI admin REST APIs](/rest/api/power-bi/admin) or the [Semantic Link Labs admin functions](https://github.com/microsoft/semantic-link-labs/blob/main/src/sempy_labs/admin/_items.py).

## Step 2: Create the F SKU capacity in Azure

Purchase the F SKU before you reassign any workspaces. Keep the P SKU active until reassignment and validation succeed.

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Confirm that the `Microsoft.Fabric` resource provider is registered on your subscription. In the subscription pane, select **Resource providers**, find `Microsoft.Fabric`, and select **Register** if it isn't already registered.
1. Create a Microsoft Fabric capacity by following [Buy a Microsoft Fabric subscription](/fabric/enterprise/buy-subscription). Choose the region, SKU size, and billing model (pay-as-you-go or reservation) you decided on in the [decision guide](premium-migration-decision-guide.md).
1. Add a capacity administrator on the new capacity in the Fabric admin portal before you reassign any workspaces to it.

> [!NOTE]
> Power BI Premium features are unlocked only on F64 and larger capacities. Free users can view content with the Viewer role only on F64 and larger. If you size down to F32 or smaller, plan for Pro licenses for every report viewer.

## Step 3: Pilot a low-impact workspace

Migrate one non-critical workspace first. This pilot validates your prerequisites and surfaces any quirks before you touch business-critical content.

1. Choose a test or low-impact workspace with at least one report, one scheduled refresh, and one gateway connection.
1. Reassign the workspace by following [Step 4: Reassign workspaces](#step-4-reassign-workspaces).
1. Validate the pilot workspace by following [Step 5: Validate the migration](#step-5-validate-the-migration).
1. Resolve any issues before you continue with the rest.

## Step 4: Reassign workspaces

Reassign workspaces from the source P SKU to the new F SKU. Choose the method that fits the scale of your migration. For a few workspaces, use the Fabric admin portal. For many workspaces or multiple target capacities, use the capacity migration notebook.

> [!IMPORTANT]
> If you're migrating across regions, back up or capture definitions for items that can't survive a cross-region reassignment *before* you reassign the workspace. Skipping this step causes data loss. For procedures, see [Handle large storage format semantic models](#handle-large-storage-format-semantic-models-on-cross-region-migrations) and [Handle Fabric items](#handle-fabric-items-on-cross-region-migrations).

# [Fabric admin portal](#tab/portal)

Use this method when you have a small number of workspaces or when you want a manual, auditable step-by-step process. Reassign workspaces in bulk through the **Capacity settings** page in the Fabric admin portal:

1. Sign in to the [Power BI service](https://app.powerbi.com) as a Fabric or Power BI administrator.
1. Open **Admin portal** > **Capacity settings**, select the **Fabric capacity** tab, and select your new F SKU capacity.
1. Under **Workspaces assigned to this capacity**, select **Assign workspaces** > **Specific workspaces**, choose the workspaces to move from your P SKU, and select **Apply**.

The reassignment of a single workspace typically completes in seconds. Repeat for each batch of workspaces.

For the full set of reassignment options (including single-workspace reassignment from workspace settings, the User and Admin APIs, and per-capacity-type permission requirements), see [Reassigning a workspace to another capacity](/fabric/admin/portal-workspace-capacity-reassignment#reassigning-a-workspace-to-another-capacity).

# [Capacity migration notebook](#tab/notebook)

Use this method when you have many workspaces, when you're splitting one P SKU across multiple F SKUs, or when you want a repeatable, scriptable process.

1. Import the [Capacity Migration notebook from semantic-link-labs](https://github.com/microsoft/semantic-link-labs/blob/main/notebooks/Capacity%20Migration.ipynb) into a workspace on your new F SKU capacity.
1. Open the notebook in the Fabric portal.
1. Set the parameters in the first cell. At a minimum, provide the source P SKU capacity ID and the target F SKU capacity ID. To split across multiple target capacities, provide the workspace-to-capacity mapping the notebook expects.
1. Run the notebook end-to-end.
1. Run the cells that apply to your migration scenario (such as "Migrate a single source capacity to a target capacity").
1. Review the notebook's output log and confirm successful reassignment or any follow-up needed.

---

> [!IMPORTANT]
> Active refreshes and queries can be interrupted at the moment of reassignment. Schedule reassignments outside of refresh windows and after long-running jobs complete. After reassignment, users might need to wait up to an hour before they can create Fabric items in the migrated workspaces on the new capacity.

## Step 5: Validate the migration

Validate every batch of workspaces before you continue. Don't decommission the P SKU until validation succeeds across all workspaces.

> [!IMPORTANT]
> If you're migrating across regions, restore or recreate the items you backed up before reassignment *before* you validate. For procedures, see [Handle large storage format semantic models](#handle-large-storage-format-semantic-models-on-cross-region-migrations) and [Handle Fabric items](#handle-fabric-items-on-cross-region-migrations).

For each migrated workspace, confirm:

1. The workspace shows the new F SKU capacity name under workspace settings.
1. Business-critical reports load for end users.
1. Scheduled refreshes succeed on the new capacity. Trigger an on-demand refresh if you can't wait for the next scheduled run.
1. Gateway connections work. Most gateway configurations persist through reassignment, but you might need to update some.
1. Deployment pipelines, workspace apps, and CI/CD jobs still publish and update content as expected.
1. Item counts in the new capacity match the inventory you captured in [Step 1](#step-1-inventory-your-workspaces-and-items). Re-run your discovery script and compare the results.

Watch the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) for the first 24 to 48 hours after migration. Look for sustained periods at or near 100% CU utilization, which indicate the SKU is undersized.

## Step 6: Decommission the P SKU

After all workspaces pass validation, cancel the P SKU subscription. Don't cancel until reassignment is complete and validated. For the post-cancellation grace, throttled access, and data-loss timeline, see [Understand the P SKU retirement timeline](premium-migration-decision-guide.md#understand-the-p-sku-retirement-timeline).

To cancel:

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) as a billing or global administrator.
1. Open **Billing** > **Your products**, find the Power BI Premium P SKU subscription, and follow the cancellation prompts. If you're asked to provide a reason, cite migration to Microsoft Fabric.
1. Confirm that no workspaces remain assigned to the canceled capacity.

If you use Power BI Report Server, verify your Report Server licensing before you cancel. After migration, the Report Server key is available on the **Fabric capacity** tab under **Capacity settings** in the admin portal.

## Cross-region migrations: Special handling

If your target F SKU must be in a different Azure region (for example, for data residency or significant latency benefits), two categories of items need extra handling: large storage format semantic models and Fabric items. **Same-region reassignment is the recommended default.** For the decision criteria, see [Choose between same-region and cross-region migration](premium-migration-decision-guide.md#choose-between-same-region-and-cross-region-migration). For the complete list of movable and nonmovable item types, see [Restrictions on moving workspaces around](/fabric/admin/portal-workspace-capacity-reassignment#restrictions-on-moving-workspaces-around).

The cross-region migration uses the same six steps as a same-region migration. The handling steps in this section run *before* and *after* [Step 4: Reassign workspaces](#step-4-reassign-workspaces) for affected workspaces.

### Handle large storage format semantic models on cross-region migrations

Large storage format semantic models are tied to the region of the workspace where they were created. They don't survive a cross-region reassignment.

You have two options:

- **Delete and redeploy.** Back up the model definition (for example, by using XMLA endpoint tooling or your source-control copy), delete the model in the source workspace, reassign the workspace to the F SKU in the new region, and then redeploy the model to the workspace as if it were new. The redeployed model gets a new GUID, so reports that referenced the original model need to be rebound to the redeployed model.
- **Back up and restore.** Follow [Back up and restore Power BI Premium semantic models](/power-bi/enterprise/service-premium-backup-restore-dataset). Back up on the source, reassign the workspace, and then restore into the new region. The restored model gets a new GUID, so reports that referenced the original model need to be rebound to the restored model.

Plan for downtime on each affected model equal to the redeploy or restore time plus the refresh time.

### Handle Fabric items on cross-region migrations

Fabric items, such as Lakehouses, Warehouses, Notebooks, Data Factory pipelines, Eventstreams, KQL databases, and Dataflows Gen2, don't survive a cross-region reassignment. You must remove them before reassignment and recreate them in the new region afterward.

The most common pattern:

1. **Capture item definitions to Git.** Connect the source workspace to Git through [Fabric Git integration](/fabric/cicd/git-integration/intro-to-git-integration) and commit. Git captures item *definitions*, not the underlying data.
1. **Back up data separately.** Export or copy any data you need to preserve (for example, Lakehouse files, Warehouse tables) to a location outside the workspace.
1. **Delete the Fabric items.** Remove the Fabric items from the source workspace.
1. **Reassign the workspace.** Move the workspace to the new F SKU capacity by following [Step 4: Reassign workspaces](#step-4-reassign-workspaces).
1. **Recreate the items in the new region.** Restore from Git into a *new, separate workspace* on the new capacity to avoid Git sync overwriting other items. After verification, move or republish items into the target workspace.
1. **Reload data.** Reload the source data into the recreated items.

> [!CAUTION]
> Syncing a workspace with Git can remove any item in the workspace that isn't present in the Git repository. Always restore Fabric items into a separate workspace from the one you migrated, and verify item counts before moving them.

## Multigeo migrations

If your current Premium footprint uses multigeo P capacities, provision a matching F SKU in each target region. Reassign workspaces in each region to the F SKU in their corresponding region, and apply the same special-handling rules per region. After migration, manage governance, content placement, and capacity sizing per region.

## Cross-tenant migrations

Cross-tenant migration (for example, after an acquisition) isn't supported as a workspace reassignment. You must manually recreate gateways, semantic models, workspaces, reports, apps, and dashboards in the target tenant. For most multi-region needs, multigeo within a single tenant is simpler. See [Power BI tenant migration patterns and strategies](tenant-migration-patterns.md).

## Troubleshoot common issues

| Symptom | Likely cause | What to do |
| --- | --- | --- |
| **You can't reassign a workspace to the new capacity** | You aren't an admin on the target capacity, or the `Microsoft.Fabric` resource provider isn't registered. | Add yourself as a capacity admin in the Fabric admin portal, and register the resource provider in the Azure subscription. |
| **A workspace reassignment fails with a region error** | The workspace contains items that can't move across regions (large storage format models or Fabric items). | Follow [Cross-region migrations: special handling](#cross-region-migrations-special-handling). |
| **Reports load slowly after migration** | The new F SKU is undersized for current workloads. | Use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) to confirm CU utilization, and scale up on demand through the Azure portal. |
| **Free users can't view reports anymore** | The new F SKU is F32 or smaller, where Free viewer access isn't enabled. | Scale up to F64 or larger, or assign Pro or PPU licenses to viewers. |
| **Scheduled refreshes fail after migration** | A gateway is no longer reachable, or refresh credentials need to be reauthorized after the workspace moved. | In the workspace, open the semantic model settings, reauthorize the data source, and verify the gateway binding. |
| **Users can't create Fabric items in a migrated workspace for up to an hour** | Expected behavior. The Fabric workload needs time to initialize on the new capacity. | Wait up to an hour and retry. |

For reassignment errors not listed here (such as **Unsupported migration**, **Retries exhausted**, or **DB Migration error**, which can occur with Private Link or customer-managed key configurations), see [Resolving common capacity reassignment issues](/fabric/admin/portal-workspace-capacity-reassignment#resolving-common-capacity-reassignment-issues).

## Related content

- [Power BI Premium to Microsoft Fabric migration overview](premium-migration-overview.md)
- [Power BI Premium P SKU migration decision guide](premium-migration-decision-guide.md)
- [Power BI Premium to Microsoft Fabric migration FAQ](premium-migration-faq.md)
