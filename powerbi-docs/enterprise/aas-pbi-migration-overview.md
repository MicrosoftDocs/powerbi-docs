---
title: Migrate Azure Analysis Services to Power BI 
description: Describes how to migrate Azure Analysis Services models to a Power BI workspace.
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 07/12/2023
LocalizationGroup: Premium
ms.custom: engagement-fy23
---

# Migrate Azure Analysis Services to Power BI

This article describes the Microsoft Azure Analysis Services to Microsoft Power BI Premium migration feature in Power BI. This feature provides model database migration from Azure Analysis Services to semantic model in Power BI Premium, Power BI Premium Per User, and Power BI Embedded workspaces.

Before beginning a migration, be sure to review [Migrate from Azure Analysis Services to Power BI Premium](../guidance/migrate-azure-analysis-services-to-powerbi-premium.md) and [Migration scenarios](../guidance/migrate-azure-analysis-services-to-powerbi-premium-migration-scenarios.md). These *Guidance* articles provide a detailed comparison of both platforms and can help you determine a migration strategy that best suits your organization.

After the migration, you can make modifications to the [server properties in Analysis Services](/analysis-services/server-properties/server-properties-in-analysis-services) if needed.

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

- You must have an [Azure Data Lake Storage Gen 2 (ADLS Gen 2)](/azure/storage/blobs/data-lake-storage-introduction) storage account in the same tenant and the [workspace you're migrating to must be connected](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md#connect-to-an-azure-data-lake-gen-2-at-a-workspace-level) to that storage account. For the best performance, your ADLS Gen 2 storage should be located in the same region as the workspace capacity.

- [Large semantic model storage format](service-premium-large-models.md) must be enabled for the workspace.

- The XMLA endpoint must be [Enabled for read-write](service-premium-connect-tools.md#enable-xmla-read-write) for the capacity.

- If a Microsoft on-premises data gateway is configured for the Azure Analysis Services server to connect to on-premises data sources, you must also [install and configure a gateway in Power BI](/power-bi/connect-data/service-gateway-onprem).

### Pairing

When using the Azure Analysis Services to Power BI Premium migration feature in Power BI, after ensuring all prerequisites are met, you begin a migration by first creating a *connection* between an Azure Analysis Services server and a workspace. The connection is a unique pairing between a server resource in Azure Analysis Services and a workspace in Power BI. Only one pairing connection can exist between a particular server and workspace. When a migration pair is created, you can then migrate one or more model databases from the server to the workspace as a semantic model.

### Migration

When migrating, a backup of the model database is created in the Azure storage account specified in the Azure Analysis Services server backup settings. The backup is then copied to the ADLS Gen 2 storage account connected to the workspace. The backup is then restored to the workspace. Build and Write permissions for the model are then configured.

Migration includes:

- Model metadata.
- Model data, as of the latest refresh.
- Model *roles* in Azure Analysis Services, such as those used for object-level and row-level security. UPNs are also included.
- Semantic model Build permissions are set for members of Read model roles.
- Semantic model Write permissions are set for members of Administrator model roles.

Migration doesn't include:

- Service principals configured for the Azure Analysis Services server and model database aren't included in the restored model in Power BI.
- Server redirection enabling client applications, tools, and automation processes to be automatically redirected to the newly migrated model in Power BI are not included in the migration step. Redirection is enabled separately, after migration is completed.

After migration, the model in Power BI is backwards compatible with the same tools used with Azure Analysis Services. Modifying model metadata requires [XMLA endpoint-based client tools](service-premium-connect-tools.md#client-applications-and-tools) such as Visual Studio with Analysis Services projects, SQL Server Management Studio, ALM Toolkit, and Tabular Editor. Like other models in Power BI that have metadata modified through the XMLA endpoint, migrated models can't be downloaded as a Power BI Desktop file. To learn more about model management through the XMLA endpoint, see [Advanced data model management](../guidance/powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md).

### Redirection

Server *redirection* enables [XMLA endpoint-based client tools](service-premium-connect-tools.md#client-applications-and-tools) and automation processes to continue to work without having to change the server name reference in the connection string. Client applications, tools, and automation processes are automatically redirected to the migrated model in Power BI. If a server alias is configured for the Azure Analysis Services server, it too will redirect to the migrated model in Power BI.

Client applications and tools connecting to a migrated model must use the following minimum or higher Analysis Services [client library](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true) versions:

|Client library  |File version  |Product version |
|---------|---------|-------|
|MSOLAP     |    2022.160.35.23    | 16.0.35.23 |
|AMO      |   16.0.35.23      | 19.42.0.4 |
|ADOMD     |  16.0.35.23 | 19.42.0.4 |

The following applications connecting to a migrated model through redirection must meet or exceed minimum versions:

| Application | Minimum version |
|-----|-----|
|Microsoft Excel | 16.0.15826.10000 |
|PowerShell cmdlets | To be determined |
|Server Profiler | 19.0.2 |
|SQL Server Management Studio (SSMS) | 19.0.2 |
| Visual Studio with Analysis Services projects (SSDT) | 3.0.6 |

> [!NOTE]
> PowerShell cmdlets are currently pending release.

Server redirection for a migration can be enabled by using an On/Off setting. When you enable server redirection, the Azure Analysis Services server must exist and can't be paused. The current user must be both server administrator and workspace administrator.

When Redirection status for the migration shows Server Redirection Enabled, you can then pause your server in the Azure portal or by using the Azure Analysis Services REST API. Client applications, tools, and processes are redirected to the model in Power BI. You aren't billed while your server is paused. Deleting servers with server redirect is currently not supported. To learn more, see [Enable redirection](#enable-redirection) later in this article.

### Rebind

Unlike server redirection, which redirects XMLA endpoint-based client tools to the new model in Power BI, *rebind* redirects live connect reports in the Power BI service to use the new model in Power BI.

Like server redirection, it's not something done for you automatically as part of the migration. It's something you have control over after your migration has completed. You can enable rebind, check the status of a rebind, or undo the rebind and revert reports back to querying model data in Azure Analysis Services. To learn more, see [Enable rebind](#enable-rebind) later in this article.

## Important considerations

- Models migrated by using the Azure Analysis Services to Power BI Premium migration feature in Power BI can't be downloaded as a .pbix file. To modify model metadata, use Visual Studio, the open-source ALM Toolkit, or the open-source Tabular Editor.

- Table and PowerQuery M expressions having the same name are not allowed in Power BI models. Prior to migration, ensure model database tables and any PowerQuery M expressions in the model don't have the same name. For any duplicate names, you can rename either the expression or the table, however, in most cases it's easiest to rename the expression. If any duplicate names are present during migration, the restore operation will fail and an error is returned.

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

1. In **Migration Details**, verify your Azure Analysis Services server and Power BI Premium workspace settings. Any prerequisites not met are shown. Model databases on the server that can be migrated are shown in **Semantic models**.

    :::image type="content" source="media/aas-pbi-migration-overview/migration-details2.png" alt-text="Screenshot of migration details.":::

1. For each model database you want to migrate, under **Include in Migration**, toggle the slider button to **Yes**.

    Model databases are migrated in parallel, to reduce impact on your target capacity the maximum number of model databases that can be migrated concurrently is five.

1. Select **Migrate**. If prerequisites are met, migration will begin. The migration process can take some time while the source model database is saved to backup storage, copied to ADLS Gen 2 storage, and restored to the workspace. You can leave this page and continue to use Power BI while migration is in process.

    Server redirection isn't enabled during migration. Clients will continue to connect to the model database in Azure Analysis Services until server redirection is enabled. Before enabling server redirection, it's recommended you thoroughly test connecting to the migrated model in Power BI.

#### Monitor migration

On the **Migration Details** page, in **Semantic models**, select the model database you are migrating to show the **Migration Details** flyout. The flyout shows important details about your migration including status and migration progress. Remember, migration can take some time depending on the size and complexity of the model database being migrated.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-details-progress.png" alt-text="Model migration details showing progress.":::

When the migration process is completed, any issues are shown.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-details-complete.png" alt-text="Model migration details showing completion.":::

#### Enable redirection

After a migration has successfully completed, you can then enable server redirection. When server redirection is complete, client applications and tools that meet the minimum version requirements along with automation processes are automatically redirected to the model in Power BI.

To enable redirection, on the **Azure Analysis Services to Power BI Premium** page, under **All migrations**, for the migration pair you want to redirect, in the **Server redirection enabled** column, set the slider to **Enable**.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-enable-redirection2.png" alt-text="Enable redirection.":::

Redirection can take some time. You can leave the page and continue to use Power BI while redirection is in process. To check the status of server redirection, select **More options**, and then select **Redirection status**.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-redirection-status2.png" alt-text="Check redirection status from More options menu.":::

The **Server Redirection** flyout shows the status of redirection.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-redirection-status-flyout.png" alt-text="Redirection status flyout.":::

To disable server redirection, on the **Azure Analysis Services to Power BI Premium** page, under **All migrations**, simply move the **Server Redirection Enabled** slider to Off.

#### Enable rebind

If you have reports in the Power BI service that connected to and queried your data model in Azure Analysis Services, after your migration has successfully completed, you can then rebind reports in the Power BI service to query the model in Power BI.

To rebind reports, on the **Azure Analysis Services to Power BI Premium** page, under **All migrations** > **Azure Analysis Services server**, select your server migration. Then, on the **Migration details** page, for your newly migrated model, select **Rebind reports**.

:::image type="content" source="media/aas-pbi-migration-overview/dataset-migration-details-rebind2.png" alt-text="Migration server connection":::

The rebind operation can take a few minutes to complete. To check the status of your rebind, select **Rebind status**.

To undo the rebind and revert reports back to querying model data in Azure Analysis Services, select **Undo rebind**.

#### Pause server

After you've verified a successful migration, you can **pause** your Azure Analysis Services server either in the Azure portal or by using the Azure Analysis Services REST API.

If your server remains started after you’ve enabled server redirection, existing Azure Analysis Services models can still be queried by setting the **AsAzureRedirection** connection string property to **Disabled**.

## Community

Power BI has a vibrant community where MVPs, BI pros, and peers share expertise in discussion groups, videos, blogs and more. When learning about migration, be sure to check out these additional resources:

- [Power BI Community](https://community.powerbi.com/)  
- [Search "Migrate Azure Analysis Services to Power BI" on Bing](https://www.bing.com/search?q=migrate+azure+analysis+services+to+power+bi)

## Related content

- [Azure Analysis Services database backup and restore](/azure/analysis-services/analysis-services-backup)  
- [Azure Data Lake Storage Gen 2 (ADLS Gen 2)](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md)
