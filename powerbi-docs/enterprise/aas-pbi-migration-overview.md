---
title: Migrate Azure Analysis Services to Power BI 
description: Describes how to migrate Azure Analysis Services models to a Power BI workspace.
author: ogetchie
ms.author: ogetchie
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/08/2022
LocalizationGroup: Premium
---

# Migrate Azure Analysis Services to Power BI

This article describes the Microsoft Azure Analysis Services to Microsoft Power BI Premium migration feature in Power BI. The feature provides model database migration from Azure Analysis Services to dataset in Power BI Premium, Power BI Premium Per User, and Power BI Embedded workspaces.

Before beginning a migration, be sure to review [Migrate from Azure Analysis Services to Power BI Premium](../guidance/migrate-azure-analysis-services-to-powerbi-premium.md) and [Migration scenarios](../guidance/migrate-azure-analysis-services-to-powerbi-premium-migration-scenarios.md). These *Guidance* articles provide a detailed comparison of both platforms and can help you determine a migration strategy that best suits your organization.

> [!IMPORTANT]
> The Azure Analysis Services to Power BI Premium migration feature is currently in **preview**. When in preview, functionality and documentation are likely to change.

## Understanding migration

### Prerequisites

Ensure each environment meets the following prerequisites:

**In Azure Analysis Services**

- You must have [**Server administrator**](/azure/analysis-services/analysis-services-server-admins) permissions.

- Azure Analysis Services must have an Azure Storage account with a container configured and [**Backup must be enabled**](/azure/analysis-services/analysis-services-backup) for the server.

- If Firewall is enabled for your server, ensure [**Allow access from the Power BI Service**](/azure/analysis-services/analysis-services-qs-firewall#configure-a-firewall) is set to **On** or disable the firewall during migration.

**In Power BI**

- In order to migrate to Power BI, you must have a **Power BI Premium per Capacity**, **Power BI Premium per User**, or **Power BI Embedded** license.

- You must have **Workspace administrator** permissions. Tenant admins can view migrations for their tenant, however, they may not be able to perform migrations unless they also have Workspace administrator permissions.

- You must have an [**Azure Data Lake Storage Gen 2 (ADLS Gen 2)**](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md) storage account enabled in the same tenant.

- [**Large dataset storage format**](service-premium-large-models.md) must be enabled for the capacity.

- The XMLA endpoint must be [**Enabled for read-write**](service-premium-connect-tools.md#enable-xmla-read-write) .

- If a Microsoft On-premises data gateway is configured for the Azure Analysis Services server to connect to on-premises data sources, you must also [install and configure a gateway in Power BI](/power-bi/connect-data/service-gateway-onprem).

### Pairing

When using the Azure Analysis Services to Power BI Premium migration feature in Power BI, you begin a migration by first creating a *connection* between an Azure Analysis Services server and a workspace. The connection is a unique pairing between a  server resource in Azure Analysis Services and a workspace in Power BI. Only one pairing can exist between a particular server and workspace. When a migration pair is created, you can then migrate one or more model databases from the server to the workspace as a dataset.

### Migration

Provided [prerequisites](#prerequisites) are met, when migrating, a backup of the model database is created in the Azure storage account specified in the Azure Analysis Services server backup settings. The backup is then copied to an ADLS Gen 2 storage account connected to the workspace. The backup is then restored to the workspace.

Migration includes:

- Model metadata.
- Model data, as of the latest refresh.
- Model *roles* in Azure Analysis Services, such as those used for object-level and row-level security. UPNs are also included.
- Dataset Build permissions are set for members of Read model roles.
- Dataset Write permissions are set for members of Server administrator roles.

Migration doesn't include:

- Service principals configured for the Azure Analysis Services model database aren't included in the restored dataset.
- B2B guest accounts configured for the Azure Analysis Services model database aren't included in the restored dataset.

Server redirection enabling client applications, tools, and automation processes to be automatically redirected to the newly migrated dataset in Power BI aren't included in the migration step.

### Redirection

Server *redirection* enables [XMLA endpoint-based client tools](service-premium-connect-tools.md#client-applications-and-tools) and automation processes to continue to work without having to change the server name reference in the connection string. Client applications, tools, and automation processes are automatically redirected to the migrated dataset in Power BI. If a server alias is configured for the Azure Analysis Services server, it too will redirect to the dataset in Power BI.

Client applications and tools must use the following minimum or higher [client library](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true) versions:

|Client library  |Min version  |
|---------|---------|
|MSOLAP     |    xx.x.xx.xx     |
|AMO      |   xx.xx.x.x      |
|ADOMD     |   xx.x.x.x      |

When enabling server redirection for a migration, the Azure Analysis Services server must exist and can't be paused. The current user must be both server administrator and workspace administrator.

After enabling server redirection, you can then pause your  server in the Azure portal or by using the Azure Analysis Services REST API. Client applications, tools, and processes are redirected to the dataset in Power BI. You aren't billed while your server is paused. Deleting servers with server redirect is currently not supported.

> [!CAUTION]
> **During preview**, do not delete your Azure Analysis Services server! Doing so will cause redirection to fail and there is no way to recover redirection.

### Report rebind

**During preview**, Live connect reports in the Power BI service  connected to an Azure Analysis Services model database being migrated with the feature aren't automatically rebound to the new dataset in Power BI. Use the [Reports - Rebind Report](/rest/api/power-bi/reports/rebind-report) Power BI REST API to create a new binding to the new dataset.

## To migrate from Azure Analysis Services to Power BI

### Create a migration pairing

1. In Power BI, click **Settings** > **Manage Azure AS migrations**.
:::image type="content" source="media/aas-pbi-migration-overview/settings-manage-azure-as-migrations.png" alt-text="Manage Azure AS migrations in settings menu":::

1. Click **+ New Migration**.

1. On the **Create AAS Migration** flyout, click **Connect to Azure**.

1. Select the Azure **Subscription**, **Resource group**, and **Server name** with one or more model databases you want to migrate.

1. In the **Workspace** listbox, select an existing workspace to migrate to, or to create a new workspace, click **Create a new Premium workspace**, and then enter a workspace name, description, and select a license mode.

    For example, if creating a new migration connection with a new PPU workspace, the Create AAS migration flyout should look similar to the following:

    :::image type="content" source="media/aas-pbi-migration-overview/create-migration-flyout.png" alt-text="Create migration flyout":::

1. Verify your settings, and then click **Create**. After you've created a migration connection, it will appear on the **All migrations** page.

#### Migrate

1. Click **All migrations** to show migration pairs created for your tenant.

1. Under **Azure Analysis Services Server**, click on the server containing one or more model databases you want to migrate to the paired Power BI workspace.

1. In **Migration Details**, verify your Azure Analysis Services server and Power BI Premium workspace settings. Any prerequisites not met are shown. Model databases on the server that can be migrated are shown in **Datasets**.

1. For each model database you want to migrate, under **Include in Migration**, click the slider button to **Yes**.

1. Click **Migrate**. If prerequisites are met, migration will begin. The migration process can take some time while the source model database is saved to backup storage, copied to ADLS Gen 2 storage, and restored to the workspace.

    Server redirection isn't enabled during migration. Clients will continue to connect to the model database in Azure Analysis Services until server redirection is enabled. Before enabling server redirection, it's recommended you thoroughly test connecting to the migrated dataset in Power BI.

#### Enable redirection

After a migration has successfully completed, you can then enable server redirection. When server redirection is complete, client applications and tools that meet the minimum version requirements along with automation processes are automatically redirected to the dataset in Power BI.

On the **All migrations** page, for the migration pair you want to redirect, in the **Server redirection enabled** column, click the slider to **Enable**.

Redirection can take some time. To check the status of server redirection, click **More options**, and then click **Redirection status**.

#### Report rebind

**During preview**, Live connect reports in the Power BI service  connected to an Azure Analysis Services model database being migrated aren't automatically rebound to the new dataset in Power BI. Use the [Reports - Rebind Report](/rest/api/power-bi/reports/rebind-report) Power BI REST API to create a binding to the new dataset.

#### Pause server

After you've verified a successful migration, **pause** your Azure Analysis Services server either in the Azure portal or by using the REST API. During preview, do not delete your server because it could break server redirection. 

## See also

[Azure Analysis Services documentation](/azure/analysis-services/)  
