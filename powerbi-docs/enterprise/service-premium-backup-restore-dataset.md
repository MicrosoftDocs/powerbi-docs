---
title: How to Backup and restore Power BI Premium semantic models
description: Learn about the backup and restore feature for semantic models with a Power BI Premium or Premium Per User license.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 07/25/2024
LocalizationGroup: Premium
---

# Backup and restore semantic models with Power BI Premium

You can use the **Backup and Restore** feature with Power BI semantic models if you have a Power BI Premium or Premium Per User (PPU) license, similar to the backup and restore operations available in tabular models for Azure Analysis Services.

You can use [SQL Server Management Studio (SSMS)](/sql/ssms/download-sql-server-management-studio-ssms), [Analysis Services cmdlets for PowerShell](https://www.powershellgallery.com/packages/Az.AnalysisServices), and other tools to perform backup and restore operations in Power BI using [XMLA endpoints](service-premium-connect-tools.md). The following sections describe backup and restore concepts for Power BI semantic models, requirements, and considerations.

:::image type="content" source="media/service-premium-backup-restore-datasets/premium-backup-restore-datasets-01.png" alt-text="Screenshot of the SSMS window, back up is selected from the databases menu. The backup database dialog is open, OK is selected.":::

The ability to backup and restore Power BI semantic models provides a migration path from Azure Analysis Services workloads to Power BI Premium. Backup and restore also enables semantic model backups for multiple reasons, including corruption or loss, data retention requirements, and tenant movement, among others.

## Using semantic model backup and restore

The **Backup and Restore** feature uses existing connections between Power BI and Azure, such as the ability to register an Azure Data Lake Gen2 (ADLS Gen2) storage account at the tenant or workspace level to facilitate dataflow storage and operations. Since Backup and Restore uses the same connection, no other storage account is required.

You can perform offline backups, downloading the files from your ADLS Gen2 storage account. To download, use the file system, Azure Storage Explorer, .NET tools, and PowerShell cmdlets, such as the *Get-AzDataLakeGen2ItemContent* cmdlet. The following image shows a workspace with three semantic models and their corresponding backup files in Azure Storage Explorer.

:::image type="content" source="media/service-premium-backup-restore-datasets/premium-backup-restore-datasets-02.png" alt-text="Screenshot of Azure Storage Explorer with a backup selected. A portion of the Power BI window shows the settings dialog.":::

To learn how to configure Power BI to use an ADLS Gen2 storage account, see [configuring dataflow storage to use Azure Data Lake Gen 2](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md).

### Multi-geo considerations

Backup and Restore relies on the Azure connections infrastructure in Power BI to register an Azure Data Lake Gen2 (ADLS Gen2) storage account at the tenant or workspace level. You should provision the storage account in the region of your Power BI Premium capacity to avoid data transfer costs across regional boundaries. Check your data residency requirements before configuring your workspaces on a multi-geo Premium capacity with a storage account.

### Who can perform backup and restore

With an ADLS Gen2 storage account associated with a workspace, workspace admins who have write or admin permissions can conduct *backups*. Users with these permissions might be an admin, a member, or a contributor, or might not be part of the workspace level roles, but have direct write permission to the semantic model.  

To *restore* an existing semantic model, users who have write or admin permission to the dataset can conduct a *restore* operation. To *restore* a new semantic model, the user must be an admin of the workspace.

To *browse the backup/restore filesystem* using Azure Storage Explorer (the *Browse...* button in SSMS), a user must be an admin, or a member or contributor of the workspace.

Power BI associates workspaces with their backup directories based on the workspace name. With owner permissions at the storage account level, you can download backup files or copy them from their original location to the backup directory of a different workspace, and restore them there if you're a workspace admin in the target workspace as well.

Storage account owners have unrestricted access to the backup files, so ensure storage account permissions are set and maintained carefully.

### How to perform backup and restore

**Backup and Restore** requires using XMLA-based tools, such as [SQL Server Management Studio (SSMS)](/sql/ssms/download-sql-server-management-studio-ssms). There's no backup or restore facility or option in the Power BI user interface. Because of the XMLA dependency, **Backup and Restore** currently requires your semantic models to reside on a Premium or PPU capacity.

The storage account settings for **Backup and Restore** can be applied at either the **tenant** or the **workspace** level.

For **Backup and Restore**, Power BI creates a new container called *power-bi-backup* in your storage account, and creates a backup folder using the same name as your workspace in the *power-bi-backup* container. If you configure a storage account at the **tenant** level, Power BI only creates the *power-bi-backup* container. Power BI creates the backup folder at the time you attach the storage account to a workspace. If you configure a storage account at the **workspace** level, Power BI creates the *power-bi-backup* container and creates the backup folder.

During backup and restore, the following actions apply:

* Backup files are placed into the backup folder in the *power-bi-backup* container
* For restore, you must place the backup files (.abf files) into the folder before conducting a restore

If you rename a workspace, the backup folder in the *power-bi-backup* container is automatically renamed to match. However, if you have an existing folder with the same name as the renamed workspace, the automatic renaming for the backup folder fails.

## Considerations and limitations

When using the **Backup and Restore** feature with Power BI, keep the following in mind.

* Power BI must be able to access your ADLS Gen2 directly. Your ADLS Gen2 can't be located in a VNET and the firewall can't be turned on.

* If your ADLS Gen2 is already working with **Backup and Restore**, and you disconnect and later reconfigure it to work with **Backup and Restore** again. You must first rename or move the previous backup folder, or the attempt will result in errors and failure.

* **Restore** only supports restoring the database as a **Large Model (Premium)** database.

* Only **enhanced format model (V3 model)** is allowed to be restored.

* When access to account key on your storage account is [disabled](/azure/storage/common/shared-key-authorization-prevent#disable-shared-key-authorization), you might get this error: *you might get the following error: *Key based authentication is not permitted on this storage account*.

* The property, `ignoreIncompatibilities` for the `restore` command addresses Row-level security (RLS) incompatibilities between Azure Analysis Services (AAS) and Power BI Premium. Power BI Premium only supports the read permission for roles, but AAS supports all permissions. If you try to restore a backup file for which some roles don't have *read* permissions, you must specify the `ignoreIncompatibilities` property in the `restore` command. If not specified, restore can fail. When specified, the role without the *read* permission is dropped. Currently, there's no setting in SSMS that supports the `ignoreIncompatibilities` property, however, you can specify it in a `restore` command using Tabular Model Scripting Language (TMSL). For example:

    ```json
      {
        "restore": {
          "database": "DB",
          "file": "/Backup.abf",
          "allowOverwrite": true,
          "security": "copyAll",
          "ignoreIncompatibilities": true
        }
      }
    ```

* You can restore a corrupt database. As long as you backup the database periodically, restoring the database is the most robust way to recover it. Use the following `restore` command in an XMLA query to restore a database:

    ```xml
      <Restore xmlns="http://schemas.microsoft.com/analysisservices/2003/engine">
        <File>DatabaseBackup.abf</File>
        <DatabaseName>DatabaseName</DatabaseName>
        <AllowOverwrite>true</AllowOverwrite>
      </Restore>
    ```

* When restoring a database, you might get the following error:
 
    "*We cannot restore the semantic model backup right now because there is not enough memory to complete this operation. Please use the /forceRestore option to restore the semantic model with the existing semantic model unloaded and offline.*"

    In these cases, with the `restore` command, add the `forceRestore` property to trigger a forced restore operation. For example, when using TMSL:
    
    ```json
        {
          "restore": {
          "database": "DB",
          "file": "/Backup.abf",
          "allowOverwrite": true,
          "security": "copyAll",
          "forceRestore": true
          }
        }
    ```

## Related content

* [Analysis Services cmdlets for PowerShell](https://www.powershellgallery.com/packages/Az.AnalysisServices)

* [Semantic model connectivity with the XMLA endpoint](service-premium-connect-tools.md)

* [Configuring tenant and workspace storage](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md)
