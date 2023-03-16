---
title: Learn about DirectLake in Power BI
description: Describes using DirectLake to analyze very large datasets in Power BI.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 02/03/2023
LocalizationGroup: Admin
---
# DirectLake (Private preview)

> [!IMPORTANT]
> DirectLake is currently in **private preview** in the MSIT environment. When in private preview, you are bound by the terms in your Non-Disclosure Agreement (NDA) with Microsoft. Functionality and documentation are likely to change. Before testing, be sure to read [Known issues and private preview limitations](#known-issues-and-private-preview-limitations) later in this article.

*DirectLake* mode is a groundbreaking new engine capability for analyzing very large datasets in Power BI. This technology is based on loading parquet-formatted files directly from a data lake without having to query a Data Warehouse or Lakehouse endpoint, and without having to import or duplicate data into a Power BI dataset. DirectLake is a fast-path to load the data from the lake straight into the Power BI engine, ready for analysis. The following diagram shows how classic import and DirectQuery modes compare with the new DirectLake mode.

:::image type="content" source="media/directlake-overview/directlake-intro-diagram.png" border="false" alt-text="DirectLake feature diagram.":::

In DirectQuery mode, the Power BI engine queries the data at the source, which can be slow but avoids having to copy the data. Any changes at the source are immediately reflected in the query results. On the other hand, with import mode, performance can be better because the data is readily available in memory without having to query the data source each time. However, the Power BI engine must first copy the data into the dataset during refresh. Any changes at the source are only picked up with the next data refresh. DirectLake mode eliminates this import requirement by loading the data directly from the files into memory. Because there's no explicit import process, it's possible to pick up any changes at the data source as they occur, combining the advantages of DirectQuery and import mode while avoiding their disadvantages. DirectLake mode is the ideal choice for analyzing very large datasets and datasets with frequent updates at the data source.

## Prerequisites

Before using DirectLake, you need one or more of the following in a Power BI Premium Per User (PPU) or Power BI Premium workspace:

- Warehouse with one or more tables.
- Lakehouse with one or more delta tables.

#### Warehouse

Before getting started with DirectLake mode, you must provision a warehouse in a Premium Per User (PPU) or Power BI Premium workspace. Although DirectLake mode doesn't query the warehouse endpoint, the warehouse is required because it provides the storage location for your parquet-formatted files. The warehouse also provides the access point to launch Power BI Web modeling to create a DirectLake dataset. During Private Preview, DirectLake datasets can only be created by using Web modeling launched through arehouse.

In scenarios where warehouse specific security constructs such as OLS, RLS, CLS, CLE, or views used in the warehouse can't be read via DirectLake, the DirectLake datasets seamlessly fall back to DirectQuery.

To learn how to create a warehouse, see [Create a warehouse](/fabric/data-warehouse/create-warehouse?branch=release-public-preview).

#### Lakehouse

Before getting started with DirectLake mode, you must provision a Lakehouse in a Premium Per User (PPU) or Power BI Premium workspace. Although DirectLake mode doesn't query the Lakehouse endpoint, the Lakehouse is required because it provides the storage location for your parquet-formatted files. The Lakehouse also provides the access point to launch Power BI Web modeling to create a DirectLake dataset. **During Private Preview**, DirectLake datasets can only be created by using Web modeling launched through Lakehouse.

##### To create a Lakehouse in a PPU or Premium workspace

1. In your Power BI workspace, select **New** > **Show all**, and then under **Data engineering**, select the **Lakehouse** tile.

    :::image type="content" source="media/directlake-overview/directlake-lakehouse-tile.png" border="false" alt-text="Screenshot showing Lakehouse tile.":::

2. In the New Lakehouse dialog box, type a name for your Lakehouse, and then select Create. The name can only contain alphanumeric characters and underscores.

    :::image type="content" source="media/directlake-overview/directlake-new-lakehouse.png" border="false" alt-text="Screenshot showing New Lakehouse dialogue.":::

3. Verify that Power BI creates and opens the Lakehouse successfully.

    :::image type="content" source="media/directlake-overview/directlake-verify-lakehouse.png" border="false" alt-text="Screenshot showing verify lakehouse screen.":::

#### Delta table in Lakehouse

After creating a new Lakehouse, you must then create at least one delta table so DirectLake can access some data. DirectLake can read parquet-formatted files, but for the best performance, it's best to compress the data by using the VORDER compression method. VORDER compresses the data using the Power BI engine’s native compression algorithm so the Power BI engine can load the data into memory as quickly as possible.

There are multiple options to load data into a Lakehouse, including data pipelines and scripts. The following steps use on PySpark to add a delta table to a Lakehouse based on an [Azure Open Dataset](/azure/open-datasets/dataset-catalog):

##### To add a delta table to Lakehouse

1. With the newly created Lakehouse still open, select **Open notebook**, and then select **New notebook**.

    :::image type="content" source="media/directlake-overview/directlake-lakehouse-new-notebook.png" border="false" alt-text="Screenshot showing new notebook in Lakehouse.":::

1. Paste the following code snippet into the first code cell to let SPARK access the desired open dataset.

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

1. Press **Shift + Enter** to run the code and verify that it successfully outputs the remote blob path.

    :::image type="content" source="media/directlake-overview/directlake-remote-blob-path.png" border="false" alt-text="Screenshot showing remote blob path output.":::

1. Paste the following code into the next cell.

    ```python
    # Read Parquet file into a DataFrame.
    df = spark.read.parquet(wasbs_path)
    print(df.printSchema())
        
    ```

1. Press **Shift + Enter** to run the code and verify that it successfully outputs the schema of the DataFrame.

    :::image type="content" source="media/directlake-overview/directlake-dataframe-schema.png" border="false" alt-text="Screenshot showing schema dataframe.":::

1. Paste the following lines into the next cell to save the DataFrame as a delta table in the Lakehouse. The first instruction enables the VORDER compression method.

    ```python
    # Save as delta table 
    spark.conf.set("spark.sql.parquet.vorder.enabled", "true")
    df.write.format("delta").saveAsTable("holidays")
    
    ```

1. Press **Shift + Enter** to run the code and verify that all SPARK jobs completed successfully. Expand the SPARK jobs list to view more details.

    :::image type="content" source="media/directlake-overview/directlake-spark-jobs-list.png" border="false" alt-text="Screenshot showing Spark jobs list.":::

1. To verify a table has been created successfully, in the upper left area, next to Tables, select on the Ellipsis (**…**) link and then select Refresh, and expand the Tables node.

    :::image type="content" source="media/directlake-overview/directlake-tables-node.png" border="false" alt-text="Screenshot showing Tables node.":::

1. Using either the same method as above or other supported methods, add more delta tables for the data you want to analyze.

## Create a basic dataset in DirectLake mode

After you've created delta tables in your Lakehouse, you can then create any number of basic DirectLake datasets by using the Lakehouse Web modeling experience in Power BI. The basic Web modeling experience allows you to select the tables you want to add to your dataset and then define table relationships and create DAX measures. **During private preview**, you can't modify the table selection after a DirectLake dataset is created. You must create a new dataset if you wish to include different tables.

#### To create a basic DirectLake dataset for your Lakehouse

1. In your Lakehouse, select **New dataset**, and then in the **New dataset** dialog, select tables to be included in the dataset.

    :::image type="content" source="media/directlake-overview/directlake-new-dataset.png" border="false"  alt-text="Screenshot showing New dataset.":::

1. Select **Continue** to generate the DirectLake dataset. Power BI automatically saves the dataset in the workspace based on the name of your Lakehouse and then opens the dataset in Power BI.

    :::image type="content" source="media/directlake-overview/directlake-open-dataset.png" border="false" alt-text="Screenshot showing open dataset in Power BI.":::

1. Select **Open data model** to open the Power BI Web modeling experience where you can add table relationships and DAX measures.

    :::image type="content" source="media/directlake-overview/directlake-web-modeling.png" alt-text="Screenshot showing Web modeling in Power BI.":::

When you're finished adding relationships and DAX measures, you can then create reports, build a composite model, and access the dataset through XMLA endpoints in much the same way as any other dataset. During **private preview**, XMLA write operations aren't supported.

## Known issues and private preview limitations

DirectLake provides dataset creators with an innovative way to deliver better query performance for very large data volumes. It also brings together system integrators, data scientists, and data analysts in the enterprise because any workload integration with Lakehouse can read and write parquet files. Still, not all features are available during this early **private preview**. For example, you can't yet create DirectLake datasets by using Power BI Desktop. You must use the Web modeling experience integrated into the Lakehouse UI.

The following are known issues and limitations **during private preview**:

- You must use the Web modeling experience integrated into Lakehouse to generate DirectLake datasets. Creating DirectLake datasets by using Power BI Desktop or XMLA-based automation tools aren't yet supported.
- The Lakehouse doesn't yet keep DirectLake datasets in sync with the underlying data. You must invoke a refresh either manually or by using the REST API for the dataset to show the latest data. The refresh operation in this case is essentially a metadata operation to point to the latest Delta-Parquet log version, so it should be quick. There's no movement of actual data. Consider configuring a refresh schedule. 
- You can't change the table selection for DirectLake datasets. You must create a new dataset and select the desired tables prior to dataset creation.
- Analyze in Excel isn't yet supported against DirectLake datasets. However, you can connect to basic DirectLake datasets in read-only mode using XMLA-based data visualization tools and scripts.
- DirectLake datasets don't yet support lake views. You must build your datasets on top of delta tables.
- When working with DirectLake datasets, you might encounter an error stating that the data source is missing credentials and cannot be accessed. To work around this issue, go to this dataset's settings page and enter Azure Active Directory (AAD) credentials for the DirectLake data source.
- When generating a DirectLake dataset in a QSO-enabled workspace, you must sync the dataset manually using the following PowerShell commands with the Power BI Management cmdlets installed (replace WorkspaceID and DatasetID with the GUIDs of your workspace and dataset):

    ```powershell
    Login-PowerBI
    Invoke-PowerBIRestMethod -Url 'groups/WorkspaceId/datasets/DatasetId/sync' -Method Post | ConvertFrom-Json | Format-List
    
    ```

- DirectLake datasets have maximum storage limits depending on the capacity SKU. **During private preview**, the following max storage limits apply to capacities in the MSIT environment:

    |Capacity SKU |Max storage (in GB) per dataset in MSIT  |
    |---------|---------|
    |EM1/A1     |    1     |
    |EM2/A2     |    2     |
    |EM3/A3    |    2    |
    |P1/A4     |    50     |
    |P2/A5     |    100     |
    |P3/A6     |    200     |
    |P4/A72     |   400      |
    |P5/A82     |   800      |
