---
title: "Consume Azure Machine Learning models in Microsoft Power BI"
titleSuffix: Azure Machine Learning
description: Learn how to consume Azure Machine Learning models in Microsoft Power BI.
services: machine-learning
ms.service: machine-learning
ms.subservice: core
ms.topic: tutorial
ms.author: samuel100
author: samuel100
ms.reviewer: sdgilley
ms.date: 04/09/2020
---

# Consume Azure Machine Learning models in Microsoft Power BI

At the end of this how-to article you be able to:

> [!div class="checklist"]
> * Score machine learning models (deployed using Azure Machine Learning) in Microsoft Power BI

## Prerequisites

- Trained and deployed a machine learning model in Azure Machine Learning using either:
    - Option A: Code
    - Option B: Designer
    - Option C: AutoML UI
- An Introductory knowledge of Microsoft Power BI.
- A Microsoft Power BI Account ([a free trial is available](https://powerbi.microsoft.comget-started/)).
- Microsoft Power BI Desktop application, which can be [downloaded here](https://powerbi.microsoft.com/downloads).

## Create a Microsoft Power BI Report

Open Microsoft Power BI Desktop and select **Get Data**. In the Get Data dialog search for **web** and select the **Web** source followed by **Connect** as shown below:

:::image type="content" source="media/service-aml-integrate/pbi-get-data.png" alt-text="Screenshot showing web data":::

Next you will be asked to provide a URL - copy-and-paste the URL below into the box:

```txt 
https://www4.stat.ncsu.edu/~boos/var.select/diabetes.tab.txt
```

The **From Web** dialog should look as follows:

:::image type="content" source="media/service-aml-integrate/pbi-data.png" alt-text="Screenshot showing web url":::

Select **OK**, and then on the next screen select **Transform data**. By selecting transform data, you are taken to a **Power Query Editor** window.

In the Home ribbon of the Power Query Editor window, there is an **Azure Machine Learning** button:

:::image type="content" source="media/service-aml-integrate/aml-button.png" alt-text="Screenshot showing power query editor":::

Select the **Azure Machine Learning** button. After signing in to your Azure account using SSO, you can see a list of available services - select **my-sklearn-service**. After selecting the service the columns are automatically populated for you (in our schema for the service, you may remember that we had a Python decorator that specified the inputs). Select **OK**:

:::image type="content" source="media/service-aml-integrate/aml-pbi-run.png" alt-text="Screenshot showing Azure Machine Learning Models":::

Selecting **OK** will call the Azure Machine Learning service, which triggers a warning on data privacy for both the data and the endpoint:

:::image type="content" source="media/service-aml-integrate/data_privacy_warning.png" alt-text="Screenshot showing privacy warning":::

Select **Continue** and in the next screen select the **Ignore Privacy Levels checks for this file** checkbox followed by **Save**.

Once the data is scored, an additional column named **AzureML.my-diabetes-model**:

:::image type="content" source="media/service-aml-integrate/scored-data.png" alt-text="Screenshot showing added scored column":::

Notice the data returned by the service is a **list** (if you deployed a designer model you will see a **record**). To get the predictions you need to select the expand column button followed by **Expand to New Rows**.

After the expansion the predictions are shown in the AzureML.my-diabetes-model column:

:::image type="content" source="media/service-aml-integrate/after-expand.png" alt-text="Screenshot showing expansion":::

Next:

1. Rename the **AzureML.my-diabetes-model** column to **predicted**
1. Rename the **Y** column to **actual**
1. Change the type of the actual column by selecting **Transform** > **Data Type** > **Decimal Number**.
1. Change the type of the predicted column by selecting **Transform** > **Data Type** > **Decimal Number**.
1. Select **Close & Apply**

### Create some visualizations

You are now able to create some visualizations to show your data:

1. Add a **Line chart** to your report canvas
1. Drag-and-drop **AGE** to the **Axis**
1. Drag-and-drop **actual** to **Values**
1. Drag-and-drop **predicted** to **Values**

Your report will look as follows:

:::image type="content" source="media/service-aml-integrate/report-viz.png" alt-text="Screenshot showing report visualization":::

You can add more visualizations if you wish but in the interests of brevity, this tutorial will show you how to publish the report:

1. From the top ribbon, select **Publish**
1. Select **My Workspace** 

When the report has been published successfully the following pop-up will be shown:

:::image type="content" source="media/service-aml-integrate/publish-success.png" alt-text="Screenshot showing successful publish":::

Select the link **Open <MY_PBIX_FILE.pbix> in Power BI**, which will open your browser to the report.

### Enable Datasets to refresh

In a scenario where the data source is refreshed with new data to score you will need to update your credentials so the data can be scored. In the top-right corner select the three dots followed by **Settings**:

:::image type="content" source="media/service-aml-integrate/settings-pbi.png" alt-text="Screenshot showing settings":::

Select **Datasets** followed by **Edit Credentials**:

:::image type="content" source="media/service-aml-integrate/data-refresh.png" alt-text="Screenshot showing credential refresh":::

Follow the instructions for both **azureMLFunctions** and **Web** (ensure you select a privacy level). You can now set a **Scheduled refresh** of the data by following the onscreen instructions:

:::image type="content" source="media/service-aml-integrate/schedule-refresh.png" alt-text="Screenshot showing dataset and scoring refresh":::

>[!NOTE]
> When the data is refreshed it will also send the data to your Azure Machine Learning endpoint for scoring.

## Clean up resources

>[!IMPORTANT]
>The resources that you created can be used as prerequisites to other Azure Machine Learning tutorials and how-to articles. 


If you don't plan to use the resources that you created, delete them so you don't incur any charges:

1. In the Azure portal, select **Resource groups** on the far left.
 
1. From the list, select the resource group that you created.

1. Select **Delete resource group**.

   ![Screenshot of the selections to delete a resource group in the Azure portal.](./media/service-aml-integrate/delete-resources.png)

1. Enter the resource group name. Then select **Delete**.

## Next steps

In this tutorial series, you learnt how you can set up a schedule in Power BI so that new data can be scored by your scoring endpoint in Azure Machine Learning.
