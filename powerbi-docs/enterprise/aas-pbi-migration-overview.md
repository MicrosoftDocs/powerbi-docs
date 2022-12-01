---
title: Migrate Azure Analysis Services to Power BI 
description: Describes how to migrate Azure Analysis Services models to a Power BI workspace.
author: minewiskan
ms.author: owend
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 10/18/2022
LocalizationGroup: Premium
ms.custom: engagement-fy23
---

# Migrate Azure Analysis Services to Power BI (preview)

This article describes the Microsoft Azure Analysis Services to Microsoft Power BI Premium migration feature in Power BI. This feature provides model database migration from Azure Analysis Services to dataset in Power BI Premium, Power BI Premium Per User, and Power BI Embedded workspaces.

Before beginning a migration, be sure to review [Migrate from Azure Analysis Services to Power BI Premium](../guidance/migrate-azure-analysis-services-to-powerbi-premium.md) and [Migration scenarios](../guidance/migrate-azure-analysis-services-to-powerbi-premium-migration-scenarios.md). These *Guidance* articles provide a detailed comparison of both platforms and can help you determine a migration strategy that best suits your organization.

> [!IMPORTANT]
> The Azure Analysis Services to Power BI Premium migration feature is currently in **preview**. While in preview, functionality and documentation are likely to change.

## Understanding migration

### Prerequisites

Ensure each environment meets the following prerequisites:

**In Azure Analysis Services**

- The Azure Analysis Services server that you're migrating from and the Power BI workspace that you're migrating to must be in the same tenant.

- You must have [Server administrator](/azure/analysis-services/analysis-services-server-admins) permissions and belong to the Owner and/or Contributor roles for the subscription.

- Azure Analysis Services must have an [Azure Storage account](/azure/storage/common/storage-account-create) with a container configured and backup enabled for the server as described in [Azure Analysis Services database backup and restore](/azure/analysis-services/analysis-services-backup).

- If Firewall is enabled for your server, ensure [Allow access from the Power BI Service](/azure/analysis-services/analysis-services-qs-firewall#configure-a-firewall) is set to On, or disable Firewall during migration.

- Your server must be started during migration. You can pause your server after migration is complete.

**In Power BI**

- To migrate to Power BI, you must have a [Power BI Premium per Capacity](service-premium-features.md), [Power BI Premium per User](service-premium-per-user-faq.yml), or [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md) license.

- You must have [Workspace administrator](../collaborate-share/service-roles-new-workspaces.md) permission. Power BI admins can view migrations for their tenant, however, they can't perform migrations unless they also have Workspace administrator permission.

- You must have an [Azure Data Lake Storage Gen 2 (ADLS Gen 2)](/azure/storage/blobs/data-lake-storage-introduction) storage account in the same tenant and the [workspace you're migrating to must be connected](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md#connecting-to-an-azure-data-lake-gen-2-at-a-workspace-level) to that storage account. For the best performance, your ADLS Gen 2 storage should be located in the same region as the workspace capacity.

- [Large dataset storage format](service-premium-large-models.md) must be enabled for the workspace.

- The XMLA endpoint must be [Enabled for read-write](service-premium-connect-tools.md#enable-xmla-read-write) for the capacity.

- If a Microsoft on-premises data gateway is configured for the Azure Analysis Services server to connect to on-premises data sources, you must also [install and configure a gateway in Power BI](/power-bi/connect-data/service-gateway-onprem).

### Pairing

When using the Azure Analysis Services to Power BI Premium migration feature in Power BI, after ensuring all prerequisites are met, you begin a migration by first creating a *connection* between an Azure Analysis Services server and a workspace. The connection is a unique pairing between a server resource in Azure Analysis Services and a workspace in Power BI. Only one pairing connection can exist between a particular server and workspace. When a migration pair is created, you can then migrate one or more model databases from the server to the workspace as a dataset.

### Migration

When migrating, a backup of the model database is created in the Azure storage account specified in the Azure Analysis Services server backup settings. The backup is then copied to the ADLS Gen 2 storage account connected to the workspace. The backup is then restored to the workspace. Build and Write permissions for the dataset are then configured.

Migration includes:

- Model metadata.
- Model data, as of the latest refresh.
- Model *roles* in Azure Analysis Services, such as those used for object-level and row-level security. UPNs are also included.
- Dataset Build permissions are set for members of Read model roles.
- Dataset Write permissions are set for members of Administrator model roles.

Migration doesn't include:

- Service principals configured for the Azure Analysis Services server and model database aren't included in the restored dataset in Power BI.
- Server redirection enabling client applications, tools, and automation processes to be automatically redirected to the newly migrated dataset in Power BI are not included in the migration step. Redirection is enabled separately, after migration is completed.

After migration, the dataset in Power BI is backwards compatible with the same tools used with Azure Analysis Services. Modifying dataset metadata requires [XMLA endpoint-based client tools](service-premium-connect-tools.md#client-applications-and-tools) such as Visual Studio with Analysis Services projects, SQL Server Management Studio, ALM Toolkit, and Tabular Editor. Like other datasets in Power BI that have metadata modified through the XMLA endpoint, migrated datasets can't be downloaded as a Power BI Desktop file. To learn more about dataset management through the XMLA endpoint, see [Advanced data model management](../guidance/powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md).

### Redirection

Server *redirection* enables [XMLA endpoint-based client tools](service-premium-connect-tools.md#client-applications-and-tools) and automation processes to continue to work without having to change the server name reference in the connection string. Client applications, tools, and automation processes are automatically redirected to the migrated dataset in Power BI. If a server alias is configured for the Azure Analysis Services server, it too will redirect to the migrated dataset in Power BI.

Client applications and tools connecting to a migrated dataset must use the following minimum or higher Analysis Services [client library](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true) versions:

|Client library  |File version  |Product version |
|---------|---------|-------|
|MSOLAP     |    2022.160.35.23    | 16.0.35.23 |
|AMO      |   16.0.35.23      | 19.42.0.4 |
|ADOMD     |  16.0.35.23 | 19.42.0.4 |

The following applications connecting to a migrated dataset through redirection must meet or exceed minimum versions:

| Application | Minimum version |
|-----|-----|
|Microsoft Excel | 16.0.15826.10000 |
|PowerShell cmdlets | To be determined |
|Server Profiler | 19 Preview 4 (Not yet released) |
|SQL Server Management Studio (SSMS) | 19 Preview 4 (Not yet released) |
| Visual Studio with Analysis Services projects (SSDT) | 3.0.6 |

> [!NOTE]
> PowerShell cmdlets, SQL Server Management Studio, and Server Profiler (installed with SSMS) versions that support server redirect are currently pending release.

Server redirection for a migration can be enabled by using an On/Off setting. When you enable server redirection, the Azure Analysis Services server must exist and can't be paused. The current user must be both server administrator and workspace administrator.

When Redirection status for the migration shows Server Redirection Enabled, you can then pause your server in the Azure portal or by using the Azure Analysis Services REST API. Client applications, tools, and processes are redirected to the dataset in Power BI. You aren't billed while your server is paused. Deleting servers with server redirect is currently not supported.

> [!CAUTION]
> **During preview**, do not delete your Azure Analysis Services server! Doing so will cause redirection to fail and there is no way to recover redirection.

### Report rebind

**During preview**, Live connect reports in the Power BI service connected to an Azure Analysis Services model database being migrated with the feature aren't automatically rebound to the new dataset in Power BI. Use the [Reports - Rebind Report](/rest/api/power-bi/reports/rebind-report) Power BI REST API to create a new binding to the new dataset.

After rebind by using the API, changes to the Live connect reports can only be made in the Power BI service. Currently, you can't make report changes in a Power BI Desktop file that was previously bound to the model in Azure Analysis Services and then republish to the service.

## Important considerations

- **During preview**, if you use the [Reports - Rebind Report](/rest/api/power-bi/reports/rebind-report) Power BI REST API to create a new binding to the migrated dataset, you can't make changes to reports in a Power BI Desktop .pbix that were previously bound to the model in Azure Analysis Services and then republish to Power BI. Report changes for a migrated dataset can be made in the Power BI service.

- **During preview**, do not delete your Azure Analysis Services server! Doing so will cause redirection to fail and there is no way to recover redirection.

- Datasets migrated by using the Azure Analysis Services to Power BI Premium migration feature in Power BI can't be downloaded as a .pbix file. To modify dataset metadata, use Visual Studio, the open-source ALM Toolkit, or the open-source Tabular Editor.

## To migrate from Azure Analysis Services to Power BI

Before beginning a migration, first ensure [prerequisites](#prerequisites) are met. Open pages for both your Azure Analysis Services server and Power BI in your browser.

### Create a migration pairing

1. In Power BI, select **Settings** > **Azure Analysis Services migrations**.

    :::image type="content" source="media/aas-pbi-migration-overview/settings-manage-azure-as-migrations.png" alt-text="Screenshot shown Manage Azure AS migrations in settings menu.":::

1. On the **Azure Analysis Services to Power BI Premium** page, select **+ New Migration**.

1. On the **Create Azure Analysis Services migration** flyout, select **Connect to Azure**.

1. Select the Azure **Subscription**, **Resource group**, and **Server name** with one or more model databases you want to migrate.

1. In the **Workspace** listbox, select an existing workspace to migrate to, or to create a new workspace, select  **Create a new Premium workspace**, and then enter a workspace name, description, and select a license mode.

    For example, if creating a new migration connection with a new PPU workspace, the Create AAS migration flyout should look like the below image:

    :::image type="content" source="media/aas-pbi-migration-overview/create-migration-flyout.png" alt-text="Screenshot of Create migration flyout.":::

1. Verify your settings, and then select **Create**.

#### Migrate

1. On the **Azure Analysis Services to Power BI Premium** page, select **All migrations** to refresh and show migration connection pairs created for your tenant.

1. Under **Azure Analysis Services Server**, select the server containing one or more model databases you want to migrate to the paired Power BI workspace.

1. In **Migration Details**, verify your Azure Analysis Services server and Power BI Premium workspace settings. Any prerequisites not met are shown. Model databases on the server that can be migrated are shown in **Datasets**.

    :::image type="content" source="media/aas-pbi-migration-overview/migration-details.png" alt-text="Screenshot of migration details.":::

1. For each model database you want to migrate, under **Include in Migration**, toggle the slider button to **Yes**.

    Model databases are migrated in parallel, to reduce impact on your target capacity the maximum number of model databases that can be migrated concurrently is five.

1. Select **Migrate**. If prerequisites are met, migration will begin. The migration process can take some time while the source model database is saved to backup storage, copied to ADLS Gen 2 storage, and restored to the workspace. You can leave this page and continue to use Power BI while migration is in process.

    Server redirection isn't enabled during migration. Clients will continue to connect to the model database in Azure Analysis Services until server redirection is enabled. Before enabling server redirection, it's recommended you thoroughly test connecting to the migrated dataset in Power BI.

#### Monitor migration

On the **Migration Details** page, in **Datasets**, select the model database you are migrating to show the **Dataset Migration Details** flyout. The flyout shows important details about your migration including status and migration progress. Remember, migration can take some time depending on the size and complexity of the model database being migrated.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-details-progress.png" alt-text="Dataset migration details showing progress.":::

When the migration process is completed, any issues are shown.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-details-complete.png" alt-text="Dataset migration details showing completion.":::

#### Enable redirection

After a migration has successfully completed, you can then enable server redirection. When server redirection is complete, client applications and tools that meet the minimum version requirements along with automation processes are automatically redirected to the dataset in Power BI.

To enable redirection, on the **Azure Analysis Services to Power BI Premium** page, under **All migrations**, for the migration pair you want to redirect, in the **Server redirection enabled** column, set the slider to **Enable**.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-enable-redirection.png" alt-text="Enable redirection.":::

Redirection can take some time. You can leave the page and continue to use Power BI while redirection is in process. To check the status of server redirection, select **More options**, and then select **Redirection status**.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-redirection-status.png" alt-text="Check redirection status from More options menu.":::

The **Server Redirection** flyout shows the status of redirection.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-redirection-status-flyout.png" alt-text="Redirection status flyout.":::

To disable server redirection, on the **Azure Analysis Services to Power BI Premium** page, under **All migrations**, simply move the **Server Redirection Enabled** slider to Off.

#### Rebind

**During preview**, Live connect reports in the Power BI service connected to an Azure Analysis Services model database being migrated aren't automatically rebound to the new dataset in Power BI. Use the [Reports - Rebind Report](/rest/api/power-bi/reports/rebind-report) Power BI REST API to create a binding to the new dataset.

#### Pause server

After you've verified a successful migration, you can **pause** your Azure Analysis Services server either in the Azure portal or by using the Azure Analysis Services REST API.

> [!CAUTION]
> **During preview**, do not delete your Azure Analysis Services server! Doing so will cause redirection to fail and there is no way to recover redirection.

If your server remains started after you’ve enabled server redirection, existing Azure Analysis Services models can still be queried by setting the **AsAzureRedirection** connection string property to **Disabled**.

## Community

Power BI has a vibrant community where MVPs, BI pros, and peers share expertise in discussion groups, videos, blogs and more. When learning about migration, be sure to check out these additional resources:

- [Power BI Community](https://community.powerbi.com/)  
- [Search "Migrate Azure Analysis Services to Power BI" on Bing](https://www.bing.com/search?q=migrate+azure+analysis+services+to+power+bi)

## See also

[Azure Analysis Services database backup and restore](/azure/analysis-services/analysis-services-backup)  
[Azure Data Lake Storage Gen 2 (ADLS Gen 2)](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md)
