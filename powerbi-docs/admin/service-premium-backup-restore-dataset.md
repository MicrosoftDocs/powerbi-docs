---
title: Backup and restore Power BI Premium datasets
description: Learn how to backup and restore datasets in Power BI Premium spaces
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 10/19/2021
LocalizationGroup: Premium
---
# Backup and restore datasets with Power BI Premium

You can use the **Backup and Restore** feature with Power BI datasets if you have a Power BI Premium or Premium Per User (PPU) license, similar to the backup and restore operations available in tabular models for Azure Analysis Services (Azure AS).

You can use [SQL Server Management Studio (SSMS)](/sql/ssms/download-sql-server-management-studio-ssms), [Analysis Services cmdlets for PowerShell](https://www.powershellgallery.com/packages/Az.AnalysisServices), and other tools to perform backup and restore operations in Power BI using [XMLA endpoints](service-premium-connect-tools.md). The following sections describe backup and restore concepts for Power BI datasets, certain requirements, and other considerations.

:::image type="content" source="media/service-premium-backup-restore-datasets/premium-backup-restore-datasets-01.png" alt-text="Screenshot of backing up database":::

The ability to backup and restore Power BI datasets provides a migration path from Azure Analysis Services workloads to Power BI Premium. It also enables dataset backups for multiple reasons, including corruption or loss, data retention requirements, and tenant movement, among others.

## Using dataset backup and restore

The **Backup and Restore** feature uses existing connections between Power BI and Azure, such as the ability to register an Azure Data Lake Gen2 (ADLS Gen2) storage account at the tenant- or workspace-level to facilitate dataflow storage and operations. Since Backup and Restore uses the same connection, no other storage account is required. 

You can also perform offline backups, downloading the files from your ADLS Gen2 storage account using the file system, Azure Storage Explorer, .NET tools, and PowerShell cmdlets, such as the *Get-AzDataLakeGen2ItemContent* cmdlet. The following image shows a workspace with three datasets and their corresponding backup files in Azure Storage Explorer.

:::image type="content" source="media/service-premium-backup-restore-datasets/premium-backup-restore-datasets-02.png" alt-text="Screenshot of Azure Storage Explorer with backups":::

To learn how to configure Power BI to use an ADLS Gen2 storage account, see [configuring dataflow storage to use Azure Data Lake Gen 2](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md).

### Multi-geo considerations

Backup and Restore relies on the Azure connections infrastructure in Power BI to register an Azure Data Lake Gen2 (ADLS Gen2) storage account at the tenant or workspace level. As such, you should provision the storage account in the region of your Power BI Premium capacity to avoid data transfer costs across regional boundaries. Check your data residency requirements before configuring your workspaces on a multi-geo Premium capacity with a storage account.

### Who can perform backup and restore

With an ADLS Gen2 storage account associated with a workspace, workspace admins who have write or administrator permissions can conduct *backups*. Users with such permissions may be an admin, a member, or a contributor, or may not be part of the workspace level roles, but has direct write permission to the dataset.  

To *restore* an existing dataset, users who have write or admin permission to the dataset can conduct a *restore* operation. To *restore* a new dataset, the user must be an admin, member, or contributor of the workspace.

To *browse the backup/restore filesystem* using Azure Storage Explorer (the *Browse...* button in SSMS), a user must be a admin, or a member or contributor of the workspace.

Power BI associates workspaces with their backup directories based on the workspace name. With owner permissions at the storage account level, you can download backup files or copy them from their original location to the backup directory of a different workspace, and restore them there if you are a workspace administrator in the target workspace as well. 

Storage account owners have unrestricted access to the backup files, so ensure storage account permissions are set and maintained carefully.

### How to perform backup and restore

**Backup and Restore** requires using XMLA-based tools, such as [SQL Server Management Studio (SSMS)](/sql/ssms/download-sql-server-management-studio-ssms). There is no backup or restore facility or option in the Power BI user interface. Because of the XMLA dependency, **Backup and Restore** currently requires your datasets to reside on a Premium or PPU capacity.

The storage account settings for **Backup and Restore** can be applied at either the **tenant** or the **workspace** level.

For **Backup and Restore**, Power BI creates a new container called *power-bi-backup* in your storage account, and creates a backup folder using the same name as your workspace in the *power-bi-backup* container. If you configure a storage account at the **tenant** level, Power BI only creates the *power-bi-backup* container. Power BI creates the backup folder at the time you attach the storage account to a workspace. If you configure a storage account at the **workspace** level, Power BI creates the *power-bi-backup* container and creates the backup folder.

During backup and restore, the following actions apply:

* Backup files are placed into the backup folder in the *power-bi-backup* container
* For restore, you must place the backup files (.abf files) into the folder before conducting a restore

If you rename a workspace, the backup folder in the *power-bi-backup* container is automatically renamed to match. However, if you have an existing folder with the same name as the renamed workspace, the automatic renaming for the backup folder will fail. 

## Limitations and considerations

When using the **Backup and Restore** feature with Power BI, keep the following considerations in mind.

* Power BI must be able to access your ADLS Gen2 directly. Your ADLS Gen2 cannot be located in a VNET.
* If your ADLS Gen2 is already working with **Backup and Restore**, if you disconnect and later reconfigure it to work with **Backup and Restore** again, you must first rename or move the previous backup folder, or the attempt will result in errors and failure. 
* **Restore** only supports restoring the database as a **Large Model (Premium)** database.
* Only the **enhanced format model (V3 model)** is allowed to be restored.
* **Password** encryption in the backup command is not supported


## Next steps

* [What is Power BI Premium?](service-premium-what-is.md)
* [SQL Server Management Studio (SSMS)](/sql/ssms/download-sql-server-management-studio-ssms)
* [Analysis Services cmdlets for PowerShell](https://www.powershellgallery.com/packages/Az.AnalysisServices)
* [Dataset connectivity with the XMLA endpoint](service-premium-connect-tools.md)
* [Using Autoscale with Power BI Premium](service-premium-auto-scale.md)
* [Power BI Premium FAQ](service-premium-faq.yml)
* [Power BI Premium Per User FAQ](service-premium-per-user-faq.yml)
* [Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)
* [Configuring tenant and workspace storage](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
