---
title: Learn how to create a Lakehouse for Direct Lake in Power BI and Microsoft Fabric
description: Describes how to create a Lakehouse for Direct Lake in Power BI and Microsoft Fabric.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/07/2023
LocalizationGroup: Admin
---

# Create a Lakehouse for Direct Lake

This article describes how to create a Lakehouse, create a delta table in the Lakehouse, and then create a basic semantic model for the Lakehouse in a Microsoft Fabric or Power BI workspace.

Before getting started creating a Lakehouse for Direct Lake, be sure to read [Direct Lake overview](directlake-overview.md).

## Create a Lakehouse

1. In your Microsoft Fabric or Power BI workspace, select **New** > **Show all**, and then in **Data engineering**, select the **Lakehouse** tile.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-lakehouse-tile.png" border="false" alt-text="Screenshot showing Lakehouse tile.":::

2. In the **New Lakehouse** dialog box, enter a name, and then select **Create**. The name can only contain alphanumeric characters and underscores.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-new-lakehouse.png" border="false" alt-text="Screenshot showing New Lakehouse dialogue.":::

3. Verify the new Lakehouse is created and opens successfully.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-verify-lakehouse.png" border="false" alt-text="Screenshot showing verify lakehouse screen.":::

## Create a delta table in Lakehouse

After creating a new Lakehouse, you must then create at least one delta table so Direct Lake can access some data. Direct Lake can read parquet-formatted files, but for the best performance, it's best to compress the data by using the VORDER compression method. VORDER compresses the data using the Power BI engine’s native compression algorithm. This way the engine can load the data into memory as quickly as possible.

There are multiple options to load data into a Lakehouse, including data pipelines and scripts. The following steps use PySpark to add a delta table to a Lakehouse based on an [Azure Open Dataset](/azure/open-datasets/dataset-catalog):

1. In the newly created Lakehouse, select **Open notebook**, and then select **New notebook**.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-lakehouse-new-notebook.png" border="true" alt-text="Screenshot showing new notebook in Lakehouse.":::

1. Copy and paste the following code snippet into the first code cell to let SPARK access the open model, and then press **Shift + Enter** to run the code.

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

    :::image type="content" source="media/directlake-create-lakehouse/directlake-remote-blob-path.png" border="false" alt-text="Screenshot showing remote blob path output.":::

1. Copy and paste the following code into the next cell, and then press **Shift + Enter**.

    ```python
    # Read Parquet file into a DataFrame.
    df = spark.read.parquet(wasbs_path)
    print(df.printSchema())

    ```

1. Verify the code successfully outputs the DataFrame schema.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-dataframe-schema.png" border="false" alt-text="Screenshot showing schema dataframe.":::

1. Copy and paste the following lines into the next cell, and then press **Shift + Enter**. The first instruction enables the VORDER compression method, and the next instruction saves the DataFrame as a delta table in the Lakehouse.

    ```python
    # Save as delta table 
    spark.conf.set("spark.sql.parquet.vorder.enabled", "true")
    df.write.format("delta").saveAsTable("holidays")
    
    ```

1. Verify all SPARK jobs complete successfully. Expand the SPARK jobs list to view more details.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-spark-jobs-list.png" border="false" alt-text="Screenshot showing Spark jobs list.":::

1. To verify a table has been created successfully, in the upper left area, next to **Tables**, select the ellipsis (**…**), then select **Refresh**, and then expand the **Tables** node.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-tables-node.png" border="false" alt-text="Screenshot showing Tables node.":::

1. Using either the same method as above or other supported methods, add more delta tables for the data you want to analyze.

## Create a basic Direct Lake model for your Lakehouse

1. In your Lakehouse, select **New semantic model**, and then in the dialog, select tables to be included.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-new-dataset.png" border="false"  alt-text="Screenshot showing New model.":::

1. Select **Confirm** to generate the Direct Lake model. The model is automatically saved  in the workspace based on the name of your Lakehouse, and then opens the model.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-open-dataset.png" border="false" alt-text="Screenshot showing open model in Power BI.":::

1. Select **Open data model** to open the Web modeling experience where you can add table relationships and DAX measures.

    :::image type="content" source="media/directlake-create-lakehouse/directlake-web-modeling.png" alt-text="Screenshot showing Web modeling in Power BI.":::

When you're finished adding relationships and DAX measures, you can then create reports, build a composite model, and query the model through XMLA endpoints in much the same way as any other model.

## Related content

- [Specify a fixed identity for a Direct Lake model](directlake-fixed-identity.md)
- [Direct Lake overview](directlake-overview.md)  
- [Analyze query processing for Direct Lake datasets](directlake-analyze-qp.md)  
