---
title: "Tutorial: Consume an Azure Machine Learning model in Power BI"
titleSuffix: Azure Machine Learning
description: Learn how to consume Azure Machine Learning models in Power BI.
services: machine-learning
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: tutorial
ms.author: samkemp
author: samuel100
ms.reviewer: sdgilley, maggies
ms.date: 02/17/2021
---

# Tutorial: Consume Azure Machine Learning models in Power BI

This tutorial walks you through creating a Power BI report based on a machine learning model. By the end of this tutorial, you'll be able to:

> [!div class="checklist"]
> * Score machine learning models (deployed using Azure Machine Learning) in Power BI.
> * Connect to an Azure Machine Learning model in the Power Query Editor.
> * Create a report with a visualization based on that model.
> * Publish that report to the Power BI service.
> * Set up scheduled refresh for the report.

## Prerequisites

Before starting this tutorial, you need to:

- Train and deploy a machine learning model in Azure Machine Learning. Use one of these three Azure Machine Learning tutorials: 

    - [Option A: Code](/azure/machine-learning/tutorial-power-bi-custom-model)
    - [Option B: Designer](/azure/machine-learning/tutorial-power-bi-designer-model)
    - [Option C: Automated ML](/azure/machine-learning/tutorial-power-bi-automated-model)

- Sign up for a [free Power BI trial](https://app.powerbi.com/signupredirect?pbi_source=web).
- [Install Power BI Desktop](https://powerbi.microsoft.com/desktop/) on a local computer.

## Create the data model

Open Power BI Desktop and select **Get Data**. 
In the **Get Data** dialog box, search for **web**. Select the **Web** source > **Connect**.

:::image type="content" source="media/service-aml-integrate/pbi-get-data.png" alt-text="Screenshot showing web data.":::

In the **From Web** dialog box, copy and paste the following URL in the box:

```txt 
https://www4.stat.ncsu.edu/~boos/var.select/diabetes.tab.txt
```

:::image type="content" source="media/service-aml-integrate/pbi-data.png" alt-text="Screenshot showing web url.":::

Select **OK**.

In **Access Web content**, select **Anonymous** > **Connect**.

:::image type="content" source="media/service-aml-integrate/anonymous-access-web-content.png" alt-text="Screenshot showing anonymous access for Web content.":::

Select **Transform data** to open the **Power Query Editor** window.

In the Home ribbon of the Power Query Editor, select the **Azure Machine Learning** button.

:::image type="content" source="media/service-aml-integrate/aml-button.png" alt-text="Screenshot showing Power Query Editor.":::

After signing in to your Azure account using single sign-on, you see a list of available services. Select the **my-sklearn-service** that you created from the Train and deploy a machine learning model tutorial. 

Power Query populates the columns automatically for you. You remember that in our schema for the service, we had a Python decorator that specified the inputs. Select **OK**.

:::image type="content" source="media/service-aml-integrate/aml-pbi-run.png" alt-text="Screenshot showing Azure Machine Learning Models.":::

> [!NOTE]
> For time series models, Power BI may not automatically detect the date format for the time column. To proceed, convert the time column to Date/Time type in Power BI before invoking Azure Machine Learning.

Selecting **OK** calls the Azure Machine Learning service. It triggers a warning on data privacy for both the data and the endpoint.

:::image type="content" source="media/service-aml-integrate/data_privacy_warning.png" alt-text="Screenshot showing privacy warning.":::

Select **Continue**. In the next screen, select **Ignore Privacy Levels checks for this file** > **Save**.

Once the data is scored, Power Query creates an additional column named **AzureML.my-diabetes-model**.

:::image type="content" source="media/service-aml-integrate/scored-data.png" alt-text="Screenshot showing added scored column.":::

The data that the service returns is a **list**. 

> [!NOTE]
> If you deployed a designer model, you see a **record**.

To get the predictions, select the double-headed arrow in the **AzureML.my-diabetes-model** column header > **Expand to New Rows**.

:::image type="content" source="media/service-aml-integrate/expand-column.png" alt-text="Screenshot showing Expand column icon.":::

After the expansion, you see the predictions in the AzureML.my-diabetes-model column.

:::image type="content" source="media/service-aml-integrate/after-expand.png" alt-text="Screenshot showing expansion.":::

Follow these next steps to finish cleaning up your data model.

1. Rename the **AzureML.my-diabetes-model** column to **predicted**.
1. Rename the **Y** column to **actual**.
1. Change the type of the **actual** column: Select the column, then on the **Transform** ribbon select **Data Type** > **Decimal Number**.
1. Change the type of the **predicted** column: Select that column, then on the **Transform** ribbon select **Data Type** > **Decimal Number**.
1. On the **Home** ribbon, select **Close & Apply**.

## Create a report with visualizations

Now you can create some visualizations to show your data.

1. In the **Visualizations** pane, select a **Line chart**. 
1. With the line chart visual selected:
1. Drag the **AGE** field to the **Axis**.
1. Drag the **actual** field to **Values**.
1. Drag the **predicted** field to **Values**.

Resize the line chart to fill the page. Your report now has a single line chart with two lines, one for the predicted and one for the actual values, distributed by age.

:::image type="content" source="media/service-aml-integrate/report-viz.png" alt-text="Screenshot showing report visualization.":::

## Publish the report

You can add more visualizations if you wish. In the interest of brevity, in this tutorial we'll publish the report.

1. Save the report.
1. Select **File** > **Publish** > **Publish to Power BI**.
1. Sign in to the Power BI service.
1. Select **My Workspace**.
1. When the report is published successfully, select the **Open <MY_PBIX_FILE.pbix> in Power BI** link. The report opens the report in Power BI in your browser.

     :::image type="content" source="media/service-aml-integrate/publish-success.png" alt-text="Screenshot showing successful publish.":::

## Enable datasets to refresh

In a scenario where the data source is refreshed with new data to score, you need to update your credentials so the data can be scored. 

In My Workspace in the Power BI service, in the black header bar, select **More options (...)** > **Settings** > **Settings**.

:::image type="content" source="media/service-aml-integrate/settings-pbi.png" alt-text="Screenshot showing settings.":::

Select **Datasets**, expand **Data source credentials**, then select **Edit Credentials**.

:::image type="content" source="media/service-aml-integrate/data-refresh.png" alt-text="Screenshot showing credential refresh.":::

Follow the instructions for both **azureMLFunctions** and **Web**. Make sure that you select a privacy level. You can now set a **Scheduled refresh** of the data. Select a **Refresh frequency** and **Time zone**. You can also select an email address where Power BI can send refresh failure notifications.

:::image type="content" source="media/service-aml-integrate/schedule-refresh.png" alt-text="Screenshot showing dataset and scoring refresh.":::

Select **Apply**.

>[!NOTE]
> When the data is refreshed, it also sends the data to your Azure Machine Learning endpoint for scoring.

## Clean up resources

>[!IMPORTANT]
>You can use the resources that you created as prerequisites for other Azure Machine Learning tutorials and how-to articles.

If you don't plan to use the resources that you created, delete them so you don't incur any charges.

1. In the Azure portal, select **Resource groups** on the far left.
 
1. From the list, select the resource group that you created.

1. Select **Delete resource group**.

   ![Screenshot of the selections to delete a resource group in the Azure portal.](./media/service-aml-integrate/delete-resources.png)

1. Enter the resource group name. Then select **Delete**.
1. In My Workspace in the Power BI service, delete the report and the related dataset. You don't need to delete Power BI Desktop or the report on your computer. Power BI Desktop is free.

## Next steps

In this tutorial series, you learnt how to set up a schedule in Power BI so that new data can be scored by your scoring endpoint in Azure Machine Learning.
