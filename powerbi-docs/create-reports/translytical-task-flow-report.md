---
title: Tutorial - Build a report with translytical task flow
description: In this tutorial, learn how to create Power BI reports that integrate translytical task flows that enable data write-back.
author: kgremban
ms.author: kgremban
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: tutorial
ms.date: 05/05/2025
LocalizationGroup: Create reports
#customer intent:
---

# Tutorial: Build a Power BI report with a translytical task flow (preview)

In part two of this end-to-end scenario, you create a Power BI report that includes a user data function to write back to a SQL database.

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Enable preview features in Power BI.
> * Create a Power BI report that integrates with a translytical task flow.
> * Run and test the report.

## Prerequisites

* This tutorial builds on the resources that you created in [Tutorial: Create a translytical task flow](./translytical-task-flow-create.md). If you haven't completed that tutorial, do so now.
* Power BI Desktop. If you don't have Power BI Desktop installed on your device, follow the instructions in [Get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md).

## Create a Power BI report and connect the data source

In this section, you create a Power BI report that pulls data from the SQL database you created in the previous article.

1. In Power BI Desktop, create a new report.
1. Select **Get data** > **More...**.

   :::image type="content" source="./media/translytical-task-flow-report/report-get-data.png" alt-text="Screenshot that shows selecting 'get data' on an empty Power BI report in Power BI Desktop.":::

1. In the **Get Data** window, select **Microsoft Fabric** > **SQL database**. Then, select **Connect**.

   :::image type="content" source="./media/translytical-task-flow-report/sql-database-connect.png" alt-text="Screenshot that shows selecting Fabric SQL database as the data source.":::

1. Select the database that you created in the previous article. For example, **AdventureWorksLT**. Then, select **Connect**.

1. Follow any prompts to authenticate to the database.

1. Once you successfully connect to the database, the **Navigator** window opens. Select the following tables, then select **Load**:

   * `SalesLT.ProductDescription`
   * `SalesLT.ProductModel`
   * `SalesLT.ProductModelProductDescription`

   :::image type="content" source="./media/translytical-task-flow-report/navigator-load-tables.png" alt-text="Screenshot that shows loading three tables from the sample dataset into the Power BI report.":::

1. When prompted, choose **DirectQuery** as the connection mode, then select **Ok**.

   DirectQuery mode is a live connection that enables the report to refresh the data and reflect any data modifications. For more information, see [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md).

## Build the Power BI report

In this section, build visuals with the data that you loaded into your Power BI report.

1. In the **Data** menu, select the following columns:

   * `SalesLT.ProductModel` > `Name`
   * `SalesLT.ProductModelProductDescription` > `ProductModelID`

   :::image type="content" source="./media/translytical-task-flow-report/report-select-columns.png" alt-text="Screenshot that shows selecting the 'Name' and 'ProductModelID' columns to add to the report.":::

   A two-column table appears in your report window.

   :::image type="content" source="./media/translytical-task-flow-report/report-1.png" alt-text="Screenshot that shows the Power BI report with one table added to it.":::

1. In the **Visualizations** menu, select the **Text slicer** icon.

   :::image type="content" source="./media/translytical-task-flow-report/text-slicer.png" alt-text="Screenshot that shows selecting the 'text slicer' visualization to add to the report.":::

   >[!TIP]
   >If you don't see the text slicer icon, make sure that the **Text slicer** preview feature is enabled in Power BI Desktop. For more information, see [Required preview features](./translytical-task-flow-overview.md#required-preview-features).

   A text slicer visual appears in your report window.

   :::image type="content" source="./media/translytical-task-flow-report/report-2.png" alt-text="Screenshot that shows the Power BI report with a text slicer added to it.":::

1. Select the text slicer and use the **Format visual** > **General** > **Title** options to give the text slicer the following title: `Write a new product description`.

1. On the taskbar, select the **Insert** menu and add a **Blank** button to the report. Drag the button under the text slicer.

   :::image type="content" source="./media/translytical-task-flow-report/report-3.png" alt-text="Screenshot that shows the Power BI report with a button added to it.":::

1. Select the button and expand the **Style** options in the **Format button** pane. Turn the **Text** radio button to **On** and label your button `Enter`.

1. Select the button and expand the **Action** options in the **Format button** pane. Turn the **Action** radio button to **On**.

1. Provide the following values for your button:

   | Parameter | Value |
   | **Type** | Select **Data function** |
   | **Workspace** | Select the workspace that contains the user data function you made in the previous article. |
   | **Function Set** | Select the function set that contains your data function. For example, **sqlwriteback**. |
   | **Data function** | Select your data function. For example, **write_one_to_sql_db**. |

   >[!TIP]
   >If you don't see the **Data function** option, make sure that the **Translytical task flows** preview feature is enabled in Power BI desktop.
   >
   >If you do see the **Data function** option but don't see your user data function, make sure that your data function returns a string.

1. Once you select your data function, additional parameters appear to represent the parameters that the function takes. Provide the following values:

   | Parameter | Value |
   | **productDescription** | Select the text slicer from your report, **Write a new product description**. |
   | **productModelId** | Select the **Conditional formatting** (**fx**) button. A new window opens.<br><br>For the **Formal style** parameter, keep the default **Field value** value.<br><br>For the **What field should we base this on?** parameter, select **All data** > **SalesLT.ProductModel** > **ProductModelID**. |
   | **Summarization** | Select **Maximum**. |

1. Select **OK** to complete the action configuration. The **Action** details should look like the following example:

   :::image type="content" source="./media/translytical-task-flow-report/button-action.png" alt-text="Screenshot that shows the final action configuration details.":::

1. In the **Visualizations** pane, select the **Table** icon to insert a new table.

1. In the **Data** pane, select the following columns to add to your table:

   * `SalesLT.ProductModel` > `Name`
   * `SalesLT.ProductDescription` > `Description`
   * `SalesLT.ProductDescription` > `ModifiedDate`

   :::image type="content" source="./media/translytical-task-flow-report/report-4.png" alt-text="Screenshot that shows the Power BI report with a second table added to it.":::

## Optional report modifications


## Publish your report

1. In the **Home** toolbar menu, select **Publish**.

1. Select the Power BI workspace where you want to publish this report, then select **Select**.

1. Once your report finishes publishing, select the link to **Open <REPORT_NAME>.pbix in Power BI**.

Now, you have a translytical task flow in a Power BI report that's available in the Power BI service.



