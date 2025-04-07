---
title: Power BI semantic model scale-out test
description: Learn how test the Power BI semantic model scale-out feature after it's enabled
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: tutorial
ms.date: 11/21/2023
LocalizationGroup: Premium
---

# Test semantic model scale-out

This article describes how you can test the semantic model scale-out feature.

## Step 1 - Create a scale-out query

1. Open Power BI Desktop and sign into your account.

2. Select **Transform data** to open the Power BI *Power Query Editor*.

    :::image type="content" source="media/service-premium-scale-out-test/transform-data.png" alt-text="A screenshot highlighting the transform data button in Power B I Desktop.":::

3. In the Power BI *Power Query Editor*, select **New Source**.

    :::image type="content" source="media/service-premium-scale-out-test/new-source.png" alt-text="A screenshot highlighting the new source button in the power query editor in Power B I Desktop.":::

4. In the *Get Data* pop-up window, select **Blank Query** and select **Connect**.

    :::image type="content" source="media/service-premium-scale-out-test/blank-query.png" alt-text="A screenshot highlighting the blank query option in the get data window in Power B I Desktop.":::

5. Select *Query 1*, and then select **Advanced editor**.

    :::image type="content" source="media/service-premium-scale-out-test/advanced-editor.png" alt-text="A screenshot highlighting the advanced editor button in the power query editor in Power B I Desktop.":::

6. Enter the following *M Formula language* code.

    ```
    let 
        Source = "Dataset last refreshed:",    
        #"Converted to Table" = #table(1, {{Source}}), 
        #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "RefreshInfo"}}) 
    in 
        #"Renamed Columns"

7. Select **Done**.

8. In the *Power Query Editor* select **Close & Apply**.

    :::image type="content" source="media/service-premium-scale-out-test/close-and-apply.png" alt-text="A screenshot showing the close and apply button in the power query editor in Power B I Desktop.":::

## Step 2 - Create a time column

1. In Power BI Desktop select **Data**.

    :::image type="content" source="media/service-premium-scale-out-test/data.png" alt-text="A screenshot showing the data button highlighted in Power B I Desktop.":::

2. In the *Fields* pane, select **Query 1**.

3. Select **New column**.

4. Enter the following DAX expression to define a new calculated column.

    ```dax
    Time = NOW()
    ```

    :::image type="content" source="media/service-premium-scale-out-test/time-now-dax-query.png" alt-text="A screenshot showing the time equals now dax query.":::

5. Select **Report**.

    :::image type="content" source="media/service-premium-scale-out-test/report.png" alt-text="A screenshot showing the report button highlighted in Power B I Desktop.":::

6. Select **Publish** and in the *Microsoft Power BI Desktop* pop-up window, select **Save**.

    :::image type="content" source="media/service-premium-scale-out-test/publish-dataset.png" alt-text="A screenshot showing the Microsoft Power B I Desktop pop up window after the publish button is selected. The publish and save buttons are highlighted.":::

7. in the *Publish to Power BI* pop-up window, select the workspace you want to enable scale-out for, and then select **Select**.

    :::image type="content" source="media/service-premium-scale-out-test/publish.png" alt-text="A screenshot showing the publish to Power B I pop up window in the Power B I Desktop.":::

## Step 3 - Connect to the read-write semantic model (optional)

By default, Power BI Desktop connects to a read-only replica. To connect to the read-write semantic model, follow these steps:

1. In SQL Server Management Studio (SSMS), expand *Databases* and select the uploaded Power BI semantic model.

2. Run a simple DAX query such as:

    ```dax
    Evaluate Query1
    ```

    :::image type="content" source="media/service-premium-scale-out-test/evaluate-query.png" alt-text="A screenshot showing the evaluate query 1 D A X query in S Q L Server Management Studio.":::

## Step 4 - Validate the read/write connection (optional)

If you followed step 3, you're connected to the read-write semantic model. You can validate this connection by following these steps:

1. In SQL Server Management Studio (SSMS), right-click your semantic model, select **Process Database**.

    :::image type="content" source="media/service-premium-scale-out-test/process-database.png" alt-text="A screenshot showing the process database option highlighted in S Q L Server Management Studio.":::

2. In the *Process Database* dialog box, select **OK**.

    :::image type="content" source="media/service-premium-scale-out-test/process-database-dialog.png" alt-text="A screenshot showing the process database window with the O K button highlighted.":::

3. Once the process completes successfully, select **Close** and close the *Process Database* window.

4. In the DAX query window, execute the query *Evaluate Query1* again. SQL Server Management Studio (SSMS) shows the latest refresh time because it's connected to the *read/write* replica.

## Related content

* [Power BI semantic model scale-out](service-premium-scale-out.md)

* [Configure semantic model scale-out](service-premium-scale-out-configure.md)

* [Synchronize scale-out replicas](service-premium-scale-out-sync-replica.md)

>* [Compare semantic model scale-out replicas](service-premium-scale-out-app.md)
