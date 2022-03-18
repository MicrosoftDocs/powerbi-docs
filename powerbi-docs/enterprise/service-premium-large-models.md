---
title: Large datasets in Power BI Premium
description: The large dataset storage format allows datasets in Power BI Premium to grow beyond 10 GB in size.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 03/02/2022
ms.custom: references_regions
LocalizationGroup: Premium
---

# Large datasets in Power BI Premium

Power BI datasets can store data in a highly compressed in-memory cache for optimized query performance, enabling fast user interactivity. With Premium capacities, large datasets beyond the default limit can be enabled with the **Large dataset storage format** setting. When enabled, dataset size is limited by the Premium *capacity* size or the maximum size set by the administrator.

Large datasets can be enabled for all Premium P SKUs, Embedded A SKUs, and with Premium Per User (PPU). The large dataset size limit in Premium is comparable to Azure Analysis Services, in terms of data model size limitations.

While required for datasets to grow beyond 10 GB, enabling the Large dataset storage format setting has other benefits. If you're planning to use XMLA endpoint-based tools for dataset write operations, be sure to enable the  setting, even for datasets that you wouldn't necessarily characterize as a *large* dataset. When enabled, the large dataset storage format can improve XMLA write operations performance.

Large datasets in the service do not affect the Power BI Desktop model upload size, which is still limited to 10 GB. Instead, datasets can grow beyond that limit in the service on refresh.

> [!IMPORTANT]
> Power BI Premium does support large datasets. Enable the **Large dataset storage format** option to use datasets in Power BI Premium that are larger than the default limit. 


## Enable large datasets

Steps here describe enabling large datasets for a new model published to the service. For existing datasets, only step 3 is necessary.

1. Create a model in Power BI Desktop. If your dataset will become larger and progressively consume more memory, be sure to configure [Incremental refresh](../connect-data/incremental-refresh-overview.md).

1. Publish the model as a dataset to the service.

1. In the service > dataset > **Settings**, expand **Large dataset storage format**, click the slider to **On**, and then click **Apply**.

    :::image type="content" source="media/service-premium-large-models/enable-large-dataset.png" alt-text="Enable large dataset slider":::

1. Invoke a refresh to load historical data based on the incremental refresh policy. The first refresh could take a while to load the history. Subsequent refreshes should be faster, depending on your incremental refresh policy.

## Set default storage format

All new datasets created in a workspace assigned to Premium capacity can have the large dataset storage format enabled by default.

1. In the workspace, click **Settings** > **Premium**.

1. In **Default storage format**, select **Large dataset storage format**, and then click **Save**.

    :::image type="content" source="media/service-premium-large-models/default-storage-format.png" alt-text="Enable default storage format":::

### Enable with PowerShell

You can also enable large dataset storage format by using PowerShell. You must have capacity admin and workspace admin privileges to run the PowerShell cmdlets.

1. Find the dataset ID (GUID). On the **Datasets** tab for the workspace, under the dataset settings, you can see the ID in the URL.

    ![Dataset GUID](media/service-premium-large-models/dataset-guid.png)

1. From a PowerShell admin prompt, install the [MicrosoftPowerBIMgmt](/powershell/module/microsoftpowerbimgmt.data/) module.

    ```powershell
    Install-Module -Name MicrosoftPowerBIMgmt
    ```

1. Run the following cmdlets to sign in and check the dataset storage mode.

    ```powershell
    Login-PowerBIServiceAccount

    (Get-PowerBIDataset -Scope Organization -Id <Dataset ID> -Include actualStorage).ActualStorage
    ```

    The response should be the following. The storage mode is ABF (Analysis Services backup file), which is the default.

    ```
    Id                   StorageMode

    --                   -----------

    <Dataset ID>         Abf
    ```

1. Run the following cmdlets to set the storage mode. It can take a few seconds to convert to Premium Files.

    ```powershell
    Set-PowerBIDataset -Id <Dataset ID> -TargetStorageMode PremiumFiles

    (Get-PowerBIDataset -Scope Organization -Id <Dataset ID> -Include actualStorage).ActualStorage
    ```

    The response should be the following. The storage mode is now set to Premium Files.

    ```
    Id                   StorageMode
    
    --                   -----------
    
    <Dataset ID>         PremiumFiles
    ```

You can check the status of dataset conversions to and from Premium Files by using the [Get-PowerBIWorkspaceMigrationStatus](/powershell/module/microsoftpowerbimgmt.workspaces/get-powerbiworkspacemigrationstatus) cmdlet.

## Dataset eviction

Power BI uses dynamic memory management to evict inactive datasets from memory. Power BI evicts datasets so it can load other datasets to address user queries. Dynamic memory management allows the sum of dataset sizes to be significantly greater than the memory available on the capacity, but a single dataset must fit into memory. For more info on dynamic memory management, see [How capacities function](service-premium-what-is.md#how-capacities-function).

You should consider the impact of eviction on large models. Despite relatively fast dataset load times, there could still be a noticeable delay for users if they have to wait for large evicted datasets to be reloaded. For this reason, in its current form, the large models feature is recommended primarily for capacities dedicated to enterprise BI requirements rather than capacities mixed with self-service BI requirements. Capacities dedicated to enterprise BI requirements are less likely to frequently trigger eviction and need to reload datasets. Capacities for self-service BI on the other hand can have many small datasets that are more frequently loaded in and out of memory.

## Checking dataset size

After loading historical data, you can use [SSMS](/sql/ssms/download-sql-server-management-studio-ssms) through the [XMLA endpoint](service-premium-connect-tools.md) to check the estimated dataset size in the model properties window.

![Estimated dataset size](media/service-premium-large-models/estimated-dataset-size.png)

You can also check the dataset size by running the following DMV queries from SSMS. Sum the DICTIONARY\_SIZE and USED\_SIZE columns from the output to see the dataset size in bytes.

```sql
SELECT * FROM SYSTEMRESTRICTSCHEMA
($System.DISCOVER_STORAGE_TABLE_COLUMNS,
 [DATABASE_NAME] = '<Dataset Name>') //Sum DICTIONARY_SIZE (bytes)

SELECT * FROM SYSTEMRESTRICTSCHEMA
($System.DISCOVER_STORAGE_TABLE_COLUMN_SEGMENTS,
 [DATABASE_NAME] = '<Dataset Name>') //Sum USED_SIZE (bytes)
```

## Default segment size

For datasets using the large dataset storage format, Power BI automatically sets the default segment size to 8 million rows to strike a good balance between memory requirements and query performance for large tables. This is the same segment size as in Azure Analysis Services. Keeping the segment sizes aligned helps ensure comparable performance characteristics when migrating a large data model from Azure Analysis Services to Power BI.

## Checking column usage

Large dataset format allows identifying usage pattern and state of the models by querying DMV. Using the below query, you can get Temperature and Last Accessed statistic for each column in the dataset. Temperature indicates the usage frequency wile Last Accessed is the last date when the column was queried. This is enabled by default when Large dataset mode is enabled. The dataset will have to be refreshed for the statistic to populate. You can read more about this feature [here](https://powerbi.microsoft.com/en-us/blog/announcing-on-demand-loading-capabilities-for-large-models-in-power-bi/).

```sql
SELECT * from SYSTEMRESTRICTSCHEMA ($System.DISCOVER_STORAGE_TABLE_COLUMN_SEGMENTS, [DATABASE_NAME] = ‘<Dataset Name>’)
```

## Considerations and limitations

Keep in mind the following restrictions when using large datasets:

- **New workspaces are required**: Large datasets only work with [New workspaces](../collaborate-share/service-create-the-new-workspaces.md).

- **Download to Power BI Desktop**: If a dataset is stored on Premium Files, [downloading as a .pbix](../create-reports/service-export-to-pbix.md) file will fail.

- **Supported regions**: Large datasets are supported in all Azure regions that support Premium Files Storage. To learn more, see [Products available by region](https://azure.microsoft.com/global-infrastructure/services/?products=storage), and consult the table in the following section.

- **Setting maximum dataset size**: Maximum dataset size can be set by administrators. For more information see *Max Memory* in [Datasets](service-admin-premium-workloads.md#datasets).

- **Refreshing large datasets**: Datasets that are close to half the size of the capacity size (for example, a 12 GB dataset on a 25 GB capacity size) may exceed the available memory during refreshes. Using an [XMLA endpoint](service-premium-connect-tools.md) you can configure fine grained data refreshes, so that the memory needed by the refresh can be minimized to fit within your capacity's size.

- **Push datasets**: Push datasets do not support the large dataset storage format.

- You cannot enable large datasets using the REST API.

## Region availability

Large datasets in Power BI are only available in certain Azure regions that support [Azure Premium Files Storage](/azure/storage/files/storage-files-planning#storage-tiers).

The following list provides regions where large datasets in Power BI are available. Regions not in the following list are not supported for large models.

>[!NOTE]
>Once a large dataset is created in a workspace, it must stay in that region. You cannot reassign a workspace with a large dataset to a Premium capacity in another region.

| Azure region        | Azure region abbreviation |
|---------------------|---------------------------|
| Australia East      | australiaeast             |
| Australia Southeast | australiasoutheast        |
| Canada East         | canadaeast                |
| Canada Central      | canadacentral             |
| Central India       | centralindia              |
| Central US          | centralus                 |
| East Asia           | eastasia                  |
| East US             | eastus                    |
| East US 2           | eastus2                   |
| France Central      | francecentral             |
| France South        | francesouth               |
| Japan East          | japaneast                 |
| Japan West          | japanwest                 |
| Korea Central       | koreacentral              |
| Korea South         | koreasouth                |
| North Central US    | northcentralus            |
| North Europe        | northeurope               |
| South Central US    | southcentralus            |
| Southeast Asia      | southeastasia             |
| Switzerland North   | switzerlandnorth          |
| Switzerland West    | switzerlandwest           |
| UK South            | uksouth                   |
| UK West             | ukwest                    |
| West Europe         | westeurope                |
| West India          | westindia                 |
| West US             | westus                    |
| West US 2           | westus2                   |

## Next steps

The following links provide information that can be useful for working with large models:

> [!div class="nextstepaction"]
> [Azure Premium Files Storage](/azure/storage/files/storage-files-planning#storage-tiers)

> [!div class="nextstepaction"]
> [Configure Multi-Geo support for Power BI Premium](../admin/service-admin-premium-multi-geo.md)

> [!div class="nextstepaction"]
> [Bring your own encryption keys for Power BI](service-encryption-byok.md)

> [!div class="nextstepaction"]
> [How capacities function](service-premium-what-is.md#how-capacities-function)

> [!div class="nextstepaction"]
> [Incremental refresh for datasets](../connect-data/incremental-refresh-overview.md)

> [!div class="nextstepaction"]
> [Power BI Premium Generation 2](service-premium-what-is.md#power-bi-premium-generation-2).
