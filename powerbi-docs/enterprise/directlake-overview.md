---
title: Learn about Direct Lake in Power BI
description: Describes using Direct Lake to analyze very large datasets in Power BI.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 02/03/2023
LocalizationGroup: Admin
---
# Direct Lake (Preview)

> [!IMPORTANT]
> Direct Lake is currently in **Preview**. Functionality and documentation are likely to change. Before testing in your environment, be sure to read [Known issues and preview limitations](#known-issues-and-preview-limitations) later in this article.

*Direct Lake* mode is a groundbreaking new dataset capability for analyzing very large data volumes in Power BI. Direct Lake is based on loading parquet-formatted files directly from a data lake without having to query a Data Warehouse or Lakehouse endpoint, and without having to import or duplicate data into a Power BI dataset. Direct Lake is a fast-path to load the data from the lake straight into the Power BI engine, ready for analysis. The following diagram shows how classic import and DirectQuery modes compare with the new Direct Lake mode.

:::image type="content" source="media/directlake-overview/directlake-diagram.png" border="false" alt-text="Direct Lake feature diagram.":::

In DirectQuery mode, the Power BI engine queries the data at the source, which can be slow but avoids having to copy the data. Any changes at the data source are immediately reflected in the query results.

On the other hand, with import mode, performance can be better because the data is cached and optimized for business-intelligence queries without having to query the data source for each DAX query submitted by a report. However, the Power BI engine must first copy the data into the dataset during refresh. Any changes at the source are only picked up with the *next* dataset refresh.

Direct Lake mode eliminates the import requirement by loading the data directly from OneLake. Unlike DirectQuery, there is no translation to other query languages or query execution on other database systems, yielding performance similar to import mode. Because there's no explicit import process, it's possible to pick up any changes at the data source as they occur, combining the advantages of both DirectQuery and import modes while avoiding their disadvantages. Direct Lake mode can be the ideal choice for analyzing very large datasets and datasets with frequent updates at the data source.

## Prerequisites

Direct Lake is supported on Power BI Premium F and P SKUs only. It's not supported on Power BI Pro, Premium Per User, or Power BI Embedded A SKUs.

#### Lakehouse

Before using Direct Lake, you must provision a Lakehouse with one or more delta tables in a workspace hosted on a supported Power BI Premium or Microsoft Fabric capacity. The Lakehouse is required because it provides the storage location for your parquet-formatted files in OneLake. The Lakehouse also provides an access point to launch Power BI Web modeling to create a Direct Lake dataset.

To learn how to provision a Lakehouse, create a delta table in the Lakehouse, and create a dataset for the Lakehouse, see [Create a Lakehouse](#create-a-lakehouse) later in this article.

#### SQL endpoint

As part of provisioning a Lakehouse, a SQL endpoint for SQL querying and a default dataset for reporting are created and updated with any tables added to the Lakehouse. While Direct Lake mode doesn't query the SQL endpoint when loading data directly from OneLake, it's required when a Direct Lake dataset must seamlessly fall back to DirectQuery mode, such as when the data source uses specific features like advanced security or views that can't be read through Direct Lake.

#### Data warehouse

As an alternative to a Lakehouse with SQL endpoint, you can also provision a Data Warehouse and add tables by using SQL statements or data pipelines. The procedure to provision a standalone Data Warehouse is almost identical to the below procedure for a Lakehouse.

To learn how to provision a Data Warehouse, create a table in the warehouse, and create a Power BI dataset for the warehouse, see [Create a Data Warehouse](#create-a-data-warehouse) later in this article.

## Create a Lakehouse

Complete the following steps to create a Lakehouse, a delta table, and a dataset in a Premium workspace.

#### To create a Lakehouse

1. In your Power BI premium workspace, select **New** > **Show all**, and then in **Data engineering**, select the **Lakehouse** tile.

    :::image type="content" source="media/directlake-overview/directlake-lakehouse-tile.png" border="false" alt-text="Screenshot showing Lakehouse tile.":::

2. In the **New Lakehouse** dialog box, enter a name, and then select **Create**. The name can only contain alphanumeric characters and underscores.

    :::image type="content" source="media/directlake-overview/directlake-new-lakehouse.png" border="false" alt-text="Screenshot showing New Lakehouse dialogue.":::

3. Verify Power BI creates and opens the new Lakehouse successfully.

    :::image type="content" source="media/directlake-overview/directlake-verify-lakehouse.png" border="false" alt-text="Screenshot showing verify lakehouse screen.":::

#### Create a delta table in Lakehouse

After creating a new Lakehouse, you must then create at least one delta table so Direct Lake can access some data. Direct Lake can read parquet-formatted files, but for the best performance, it's best to compress the data by using the VORDER compression method. VORDER compresses the data using the Power BI engine’s native compression algorithm. This way the engine can load the data into memory as quickly as possible.

There are multiple options to load data into a Lakehouse, including data pipelines and scripts. The following steps use PySpark to add a delta table to a Lakehouse based on an [Azure Open Dataset](/azure/open-datasets/dataset-catalog).

##### To add a delta table to Lakehouse

1. In the newly created Lakehouse, select **Open notebook**, and then select **New notebook**.

    :::image type="content" source="media/directlake-overview/directlake-lakehouse-new-notebook.png" border="true" alt-text="Screenshot showing new notebook in Lakehouse.":::

1. Copy and paste the following code snippet into the first code cell to let SPARK access the open dataset, and then press **Shift + Enter** to run the code.

    ```python
    # Azure storage access info
    blob_account_name = "azureopendatastorage"
    blob_container_name = "holidaydatacontainer"
    blob_relative_path = "Processed"
    blob_sas_token = r""
    
    # Allow SPARK to read from Blob remotely
    wasbs_path = 'wasbs://%s@%s.blob.core.windows.net/%s' % (blob_container_name, blob_account_name, blob_relative_path)
    spark.conf.set(
      'fs.azure.sas.%s.%s.blob.core.windows.net' % (blob_container_name, blob_account_name),
      blob_sas_token)
    print('Remote blob path: ' + wasbs_path)

    ```

1. Verify the code successfully outputs a remote blob path.

    :::image type="content" source="media/directlake-overview/directlake-remote-blob-path.png" border="false" alt-text="Screenshot showing remote blob path output.":::

1. Copy and paste the following code into the next cell, and then press **Shift + Enter**.

    ```python
    # Read Parquet file into a DataFrame.
    df = spark.read.parquet(wasbs_path)
    print(df.printSchema())

    ```

1. Verify the code successfully outputs the DataFrame schema.

    :::image type="content" source="media/directlake-overview/directlake-dataframe-schema.png" border="false" alt-text="Screenshot showing schema dataframe.":::

1. Copy and paste the following lines into the next cell, and then press **Shift + Enter**. The first instruction enables the VORDER compression method, and the next instruction saves the DataFrame as a delta table in the Lakehouse.

    ```python
    # Save as delta table 
    spark.conf.set("spark.sql.parquet.vorder.enabled", "true")
    df.write.format("delta").saveAsTable("holidays")
    
    ```

1. Verify all SPARK jobs complete successfully. Expand the SPARK jobs list to view more details.

    :::image type="content" source="media/directlake-overview/directlake-spark-jobs-list.png" border="false" alt-text="Screenshot showing Spark jobs list.":::

1. To verify a table has been created successfully, in the upper left area, next to **Tables**, select the ellipsis (**…**), then select **Refresh**, and then expand the **Tables** node.

    :::image type="content" source="media/directlake-overview/directlake-tables-node.png" border="false" alt-text="Screenshot showing Tables node.":::

1. Using either the same method as above or other supported methods, add more delta tables for the data you want to analyze.

##### To create a basic Direct Lake dataset for your Lakehouse

1. In your Lakehouse, select **New dataset**, and then in the **New dataset** dialog, select tables to be included in the dataset.

    :::image type="content" source="media/directlake-overview/directlake-new-dataset.png" border="false"  alt-text="Screenshot showing New dataset.":::

1. Select **Confirm** to generate the Direct Lake dataset. Power BI automatically saves the dataset in the workspace based on the name of your Lakehouse, and then opens the dataset in Power BI.

    :::image type="content" source="media/directlake-overview/directlake-open-dataset.png" border="false" alt-text="Screenshot showing open dataset in Power BI.":::

1. Select **Open data model** to open the Power BI Web modeling experience where you can add table relationships and DAX measures.

    :::image type="content" source="media/directlake-overview/directlake-web-modeling.png" alt-text="Screenshot showing Web modeling in Power BI.":::

When you're finished adding relationships and DAX measures, you can then create reports, build a composite model, and query the dataset through XMLA endpoints in much the same way as any other dataset. During **Preview**, XMLA write operations are not yet supported.

## Create a Data Warehouse

Complete the following steps to create a Data Warehouse, a table with data, and a dataset in a Premium workspace.

#### To create a Data Warehouse

1. In your Power BI workspace, select **New** > **Show all**, and then under **Data Warehouse**, select the **Warehouse** tile.

    :::image type="content" source="media/directlake-overview/directlake-datawarehouse-tile.png" border="false" alt-text="Screenshot showing Data Warehouse tile.":::

1. In the **New warehouse** dialog box, enter a name for your warehouse, and then select **Create**. The name can only contain alphanumeric characters and underscores.

    :::image type="content" source="media/directlake-overview/directlake-new-warehouse.png" border="false" alt-text="Screenshot showing New warehouse dialogue.":::

1. Verify Power BI creates and opens the new warehouse successfully.

#### To add a table to the warehouse

1. With the newly created warehouse open, select **Get data with new data pipeline**.

    :::image type="content" source="media/directlake-overview/directlake-buildwarehouse-getdata.png" alt-text="Screenshot showing Get data with new data pipeline.":::

1. In the **New pipeline** dialog, accept the default name, and then select **Create**.

    :::image type="content" source="media/directlake-overview/directlake-new-pipeline.png" alt-text="Screenshot showing New pipeline dialog box.":::

1. After the new pipeline is created and opened, in **Copy data into Data warehouse** > **Choose data source**, select the **Retail Data Model from Wide World Importers** tile, and then select **Next**.

    :::image type="content" source="media/directlake-overview/directlake-copydata-retaildatamodel.png" alt-text="Screenshot showing Retail Data Model from Wide World Importers tile.":::

1. In **Copy data into Data warehouse** > **Connect to data source**, verify the dataset, and then select **Next**.

    :::image type="content" source="media/directlake-overview/directlake-copydata-preview-retaildatamodel.png" alt-text="Screenshot showing Preview data: Retail Data Model from Wide World Importers tile.":::

1. In **Copy data into Data warehouse** > **Choose data destination**, verify the correct warehouse is selected, and then select **Next**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-copydata-choosedatadestination.png" alt-text="Screenshot showing Preview data in Copy data into Data Warehouse dialog.":::

1. In **Copy data into Data warehouse** > **Connect to data destination**, accept the defaults to load the data into a new table, and then select **Next**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-copydata-connectdatadestination.png" alt-text="Screenshot showing column mappings in Copy data into Data Warehouse dialog.":::

1. In **Copy data into Data warehouse** > **Settings**, next to **Staging account connection**, select **New**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-copydata-settings-new.png" alt-text="Screenshot showing Staging account connection setting in Settings.":::

1. In the **New connection** dialog, select an option for the storage account you're planning to use, such as **Azure Data Lake Storage Gen2**, and then select **Continue**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-newconnection-azuredatalakestorage.png" alt-text="Screenshot showing Azure Data Lake Storage Gen2 in New connection dialog.":::

1. In **New connection** > **Connection settings**, specify your connection settings, and then select **Create**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-newconnection-settings.png" alt-text="Screenshot showing Connection settings in New connection dialog.":::

1. In **New connection** > **Settings** > **Storage Path**, select **Browse**, then select a blob container, and then select **OK**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-newconnection-storagepath.png" alt-text="Screenshot showing New connection, storage path in Connection settings.":::

1. In **New connection** > **Settings**, verify your storage account configuration, and then select **Next**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-newconnection-verify-storagepath.png" alt-text="Screenshot showing New connection Review and save copy summary.":::

1. In **New connection** > **Review + save**, select the **Start data transfer immediately** option, and then select **Save + Run**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-newconnection-saveandrun.png" alt-text="Screenshot showing New connection, Copy summary, Save & Run.":::

#### To create a basic Direct Lake dataset from a Data Warehouse

By using the Warehouse user interface, you can launch the table selection dialog box to create a basic Direct Lake dataset.

1. Open the warehouse you created and loaded in the previous steps, such as My_Warehouse, and then switch to the **Reporting** ribbon.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-dataset-reportingtab.png" alt-text="Screenshot showing Reporting tab in the warehouse.":::

1. In the Reporting ribbon, select **New Power BI dataset**, and then in the **New dataset** dialog, select tables to be included, and then select **Confirm**.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-dataset-newdataset.png" alt-text="Screenshot showing New dataset dialog box.":::

1. Power BI automatically saves the dataset in the workspace based on the name of your warehouse, and then opens the dataset in Power BI.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-dataset-in-powerbi.png" alt-text="Screenshot showing new dataset in Power BI.":::

1. Select **Open data model** to open the Power BI Web modeling experience where you can add table relationships and DAX measures.

    :::image type="content" source="media/directlake-overview/directlake-warehouse-dataset-open-model.png" alt-text="Screenshot showing new dataset in Power BI web modeling.":::

## Known issues and preview limitations

The following are known issues and limitations during **Preview**:

- Direct Lake size limits are likely to change during **Preview**. More definitive limits will be determined and described in this article by GA (General Availability). If limits are reached, queries are executed in DirectQuery mode.

    | Sku      | # of Row (Million) per table used by the query |
    |----------|------------------------------------------------|
    | F2       | 300                                            |
    | F4       | 300                                            |
    | F8       | 300                                            |
    | F16      | 300                                            |
    | F32      | 700                                            |
    | P1/F64   | 1500                                           |
    | P2/F128  | 3000                                           |
    | P3/F256  | 6000                                           |
    | P4/F512  | 12000                                          |
    | P5/F1024 | 24000                                          |
    
- You must use the Web modeling experience integrated into Lakehouse to generate Direct Lake datasets. Creating Direct Lake datasets by using Power BI Desktop or XMLA-based automation tools aren't yet supported.

- Direct Lake datasets don't support lake views. You must build your datasets on top of delta tables.

- When generating a Direct Lake dataset in a QSO-enabled workspace, you must sync the dataset manually using the following PowerShell commands with the Power BI Management cmdlets installed (replace WorkspaceID and DatasetID with the GUIDs of your workspace and dataset):

    ```powershell
    Login-PowerBI
    Invoke-PowerBIRestMethod -Url 'groups/WorkspaceId/datasets/DatasetId/sync' -Method Post | ConvertFrom-Json | Format-List
    
    ```

- Complex columns are not supported.

- Some data types may not be supported.

- Only Single Sign-On (SSO) is supported.

- Embedded scenarios are not supported.

- The dataset user interface might display a warning icon on a table even though the table has no issues. This will be addressed in a future update.
