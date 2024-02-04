---
title: Use R in Power Query Editor
description: Use R in Power BI Desktop Power Query Editor for advanced analytics. You can prepare data models, create reports, and do data cleansing.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 11/20/2023
LocalizationGroup: Connect to data
---
# Use R in Power Query Editor

The R language is a powerful programming language that many statisticians, data scientists, and data analysts use. You can use R in Power BI Desktop's Power Query Editor to:

* Prepare data models.
* Create reports.
* Do data cleansing, advanced data shaping, and semantic model analytics, which include missing data completion, predictions, clustering, and more.  

## Install R

You can download R for free from the [CRAN Repository](https://cran.r-project.org/bin/windows/base/).

## Install mice

As a prerequisite, you must install the [mice library](https://www.rdocumentation.org/packages/mice/versions/3.5.0/topics/mice) in your R environment. Without mice, the sample script code doesn't work properly. The mice package implements a method to deal with missing data.

To install the mice library:

1. Launch the `R.exe` program, for example, `C:\Program Files\Microsoft\R Open\R-3.5.3\bin\R.exe`.  

2. Run the install command from the R prompt:

   ```r
   install.packages('mice') 
   ```

## Use an R script in Power Query Editor

To demonstrate using R in Power Query Editor, this example uses a stock market semantic model contained in a .csv file.

1. [Download the EuStockMarkets_NA.csv file](https://download.microsoft.com/download/F/8/A/F8AA9DC9-8545-4AAE-9305-27AD1D01DC03/EuStockMarkets_NA.csv). Remember where you save it.

1. Load the file into Power BI Desktop. From the **Home** tab, select **Get data** > **Text/CSV**.

   ![Screenshot shows the Get data option where you can select Text/CSV.](media/desktop-r-in-query-editor/r-in-query-editor_1.png)

1. Select the *EuStockMarkets_NA.csv* file, and then choose **Open**. The CSV data is displayed in the **Text/CSV file** dialog.

   ![Screenshot shows the contents of the selected .csv file.](media/desktop-r-in-query-editor/r-in-query-editor_2.png)

1. Select **Load** to load the data from the file. After Power BI Desktop has loaded the data, the new table appears in the **Fields** pane.

   ![Screenshot shows data in the Fields pane.](media/desktop-r-in-query-editor/r-in-query-editor_3.png)

1. To open Power Query Editor, from the **Home** ribbon select **Transform data**.

   ![Screenshot shows the Home ribbon with Transform data highlighted.](media/desktop-r-in-query-editor/r-in-query-editor_4.png)

1. From the **Transform** tab, select **Run R script**. The **Run R script** editor appears. Rows 15 and 20 have missing data, as do other rows you can't see in the image. The following steps show how R completes those rows for you.

   :::image type="content" source="media/desktop-r-in-query-editor/r-in-query-editor_5d.png" alt-text="[Screenshot shows Power Query Editor with Run R Script selected." lightbox="media/desktop-r-in-query-editor/r-in-query-editor_5d.png":::

1. For this example, enter the following script code in the **Script** box of the **Run R script** window.

    ```r
       library(mice)
       tempData <- mice(dataset,m=1,maxit=50,meth='pmm',seed=100)
       completedData <- complete(tempData,1)
       output <- dataset
       output$completedValues <- completedData$"SMI missing values"
    ```

    > [!NOTE]
    > You might need to overwrite a variable named *output* to properly create the new semantic model with the filters applied.

1. Select **OK**. Power Query Editor displays a warning about data privacy.

   :::image type="content" source="media/desktop-r-in-query-editor/r-in-query-editor_6.png" alt-text="Screenshot shows data privacy warning with a Continue option." lightbox="media/desktop-r-in-query-editor/r-in-query-editor_6.png":::

1. Inside the warning message, select **Continue**. In the **Privacy levels** dialog that appears, set all data sources to **Public** for the R scripts to work properly in the Power BI service.

   ![Screenshot shows the Privacy levels dialog with Public privacy selected.](media/desktop-r-in-query-editor/r-in-query-editor_7.png)

   For more information about privacy settings and their implications, see [Power BI Desktop privacy levels](../enterprise/desktop-privacy-levels.md).

1. Select **Save** to run the script.

   When you run the script, you see the following result:

   :::image type="content" source="media/desktop-r-in-query-editor/r-in-query-editor-11.png" alt-text="Screenshot of results of R script.":::
   
   When you select **Table** next to **Output** in the table that appears, the table is presented, as shown in the following image.

   :::image type="content" source="media/desktop-r-in-query-editor/r-in-query-editor-12.png" alt-text="Screenshot of table results from R script.":::
   
   Notice the new column in the **Fields** pane called **completedValues**. The SMI missing values column has a few missing data elements. Take a look at how R handles that in the next section.

   With just five lines of R script, Power Query Editor filled in the missing values with a predictive model.

## Create visuals from R script data

We can now create a visual to see how the R script code with the mice library completes the missing values.

:::image type="content" source="media/desktop-r-in-query-editor/r-in-query-editor_8a.png" alt-text="Screenshot shows an R script visual that includes missing values and completed values." lightbox="media/desktop-r-in-query-editor/r-in-query-editor_8a.png":::

You can save all completed visuals in one Power BI Desktop .pbix file and use the data model and its R scripts in the Power BI service.

> [!NOTE]
> You can [download a .pbix file](https://download.microsoft.com/download/F/8/A/F8AA9DC9-8545-4AAE-9305-27AD1D01DC03/Complete%20Values%20with%20R%20in%20PQ.pbix) with all these steps completed.

After you've uploaded the .pbix file to the Power BI service, you need to take other steps to enable service data refresh and updated visuals:  

* **Enable scheduled refresh for the semantic model**: To enable scheduled refresh for the workbook containing your semantic model with R scripts, see [Configuring scheduled refresh](refresh-scheduled-refresh.md). This article also includes information about on-premises data gateways.

* **Install a gateway**: You need an on-premises data gateway (personal mode) installed on the machine where the file and R are located. The Power BI service accesses that workbook and re-renders any updated visuals. For more information, see [use personal gateways in Power BI](service-gateway-personal-mode.md).

## Considerations and limitations

There are some limitations to queries that include R scripts created in Power Query Editor:

* All R data source settings must be set to **Public**. All other steps in a Power Query Editor query must also be public.

   To get to the data source settings, in Power BI Desktop, select **File** > **Options and settings** > **Data source settings**.

   ![Screenshot shows the Options and Settings dialog where you can select Data source settings.](media/desktop-r-in-query-editor/r-in-query-editor_9.png)

   In the **Data source settings** dialog, select one or more data sources, and then select **Edit Permissions**. Set the **Privacy Level** to **Public**.
  
   :::image type="content" source="media/desktop-r-in-query-editor/r-in-query-editor_10.png" alt-text="Screenshot shows Data source settings dialog where you can edit permissions." lightbox="media/desktop-r-in-query-editor/r-in-query-editor_10.png":::

* To schedule refresh of your R visuals or semantic model, enable scheduled refresh and install an on-premises data gateway (personal mode) on the computer containing the workbook and R. You can't use an enterprise gateway to refresh semantic models containing R scripts in Power Query.

## Related content

There are all sorts of things you can do with R and custom queries. Explore and shape your data just the way you want it to appear.

* [Run R scripts in Power BI Desktop](desktop-r-scripts.md)
* [Use an external R IDE with Power BI](desktop-r-ide.md)
* [Create visuals by using R packages in the Power BI service](service-r-packages-support.md)
