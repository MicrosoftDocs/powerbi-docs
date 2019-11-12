---
title: Use R in Power Query Editor
description: Use R in Power BI Desktop Query Editor for advanced analytics
author: davidiseminger
ms.reviewer: ''

ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 09/06/2019
ms.author: davidi

LocalizationGroup: Connect to data
---
# Use R in Query Editor

[**R**](https://mran.microsoft.com/documents/what-is-r) is a powerful programming language that many statisticians, data scientists, and data analysts use. You can use **R** in Power BI Desktop's **Query Editor** to:

* Prepare data models

* Create reports

* Do data cleansing, advanced data shaping, and dataset analytics, which include missing data completion, predictions, clustering, and more.  

## Install R

You can download  **R** for free from the [Revolution Open download page](https://mran.revolutionanalytics.com/download/) and the [CRAN Repository](https://cran.r-project.org/bin/windows/base/).

### Install mice

You need to have the [**mice** library](https://www.rdocumentation.org/packages/mice/versions/3.5.0/topics/mice) installed in your R environment. Without **mice**, the sample script code won't work properly. The **mice** package implements a method to deal with missing data.

To install **mice**:

1. Launch the R.exe program (for example, C:\Program Files\Microsoft\R Open\R-3.5.3\bin\R.exe)  

2. Run the install command:

   ``` 
   >  install.packages('mice') 
   ```

## Use R in Query Editor

To demonstrate using **R** in **Query Editor**, we'll use an example stock market dataset contained in  a .csv file and work through the following steps:

1. [Download the **EuStockMarkets_NA.csv** file](https://download.microsoft.com/download/F/8/A/F8AA9DC9-8545-4AAE-9305-27AD1D01DC03/EuStockMarkets_NA.csv). Remember where you save it.

1. Load the file into **Power BI Desktop**: from the **Home** ribbon, select **Get Data > Text/CSV**.

   ![](media/desktop-r-in-query-editor/r-in-query-editor_1.png)

1. Select the file and then **Open**. The CSV data is displayed in the **Text/CSV file** dialog.

   ![](media/desktop-r-in-query-editor/r-in-query-editor_2.png)

1. Once the data is loaded, you can see it in the **Fields** pane.

   ![](media/desktop-r-in-query-editor/r-in-query-editor_3.png)

1. To open **Query Editor**, from the **Home** ribbon select **Edit Queries**.

   ![](media/desktop-r-in-query-editor/r-in-query-editor_4.png)

1. In the **Transform** ribbon, select **Run R Script**. The **Run R Script** editor appears.  

   Rows 15 and 20 have missing data, as do other rows you can't see in the image. The steps below show how R completes those rows for you.

   ![](media/desktop-r-in-query-editor/r-in-query-editor_5d.png)

1. For this example, enter the following script code. Be sure to replace '&lt;Your File Path&gt;' with the path to **EuStockMarkets_NA.csv** on your local file system, for example, C:/Users/John Doe/Documents/Microsoft/EuStockMarkets_NA.csv

    ```r
       dataset <- read.csv(file="<Your File Path>/EuStockMarkets_NA.csv", header=TRUE, sep=",")
       library(mice)
       tempData <- mice(dataset,m=1,maxit=50,meth='pmm',seed=100)
       completedData <- complete(tempData,1)
       output <- dataset
       output$completedValues <- completedData$"SMI missing values"
    ```

    > [!NOTE]
    > You may need to overwrite a variable named *output* to properly create the new dataset with the filters applied.

7. After selecting **OK**, **Query Editor** displays a warning about data privacy.

   ![](media/desktop-r-in-query-editor/r-in-query-editor_6.png)
8. For the R scripts to work properly in the Power BI service, you need to set all data sources **public**. For more information about privacy settings and their implications, see [Privacy Levels](desktop-privacy-levels.md).

   ![](media/desktop-r-in-query-editor/r-in-query-editor_7.png)

   After selecting **Save**, the script runs. Notice a new column in the **Fields** pane called **completedValues**. Notice there are a few missing data elements, such as on row 15 and 18. Take a look at how R handles that in the next section.

   With just five lines of R script, **Query Editor** filled in the missing values with a predictive model.

## Create visuals from R script data

Now we can create a visual to see how the R script code using the **mice** library completed the missing values, as shown in the following image:

![](media/desktop-r-in-query-editor/r-in-query-editor_8a.png)

You can save all completed visuals in one **Power BI Desktop** .pbix file and use the data model and its R scripts in the Power BI service.

> [!NOTE]
> You can [download a .pbix file](https://download.microsoft.com/download/F/8/A/F8AA9DC9-8545-4AAE-9305-27AD1D01DC03/Complete%20Values%20with%20R%20in%20PQ.pbix) with all these steps completed.

Once you've uploaded the .pbix file to the Power BI service, you need to take additional steps to enable service data refresh and updated visuals:  

* **Enable scheduled refresh for the dataset** - to enable scheduled refresh for the workbook containing your dataset with R scripts, see [Configuring scheduled refresh](refresh-scheduled-refresh.md), which also includes information about **Personal Gateway**.

* **Install the Personal Gateway** - you need a **Personal Gateway** installed on the machine where the file and **R** are located. The Power BI service accesses that workbook and re-renders any updated visuals. For more information, see [install and configure Personal Gateway](service-gateway-personal-mode.md).

## Limitations

There are some limitations to queries that include R scripts created in **Query Editor**:

* All R data source settings must be set to **Public**. All other steps in a **Query Editor** query must also be public. To get to data source settings, in **Power BI Desktop**, select **File > Options and settings > Data source settings**.

  ![](media/desktop-r-in-query-editor/r-in-query-editor_9.png)

  In the **Data Source Settings** dialog, select the data source(s) and then **Edit Permissions...**.  Set the **Privacy Level**  to **Public**.

  ![](media/desktop-r-in-query-editor/r-in-query-editor_10.png)    
* To enable scheduled refresh of your R visuals or dataset, you need to enable **Scheduled refresh** and have a **Personal Gateway** installed on the computer containing the workbook and **R**. For more information on both, see the previous section in this article, which provides links to learn more about each.

There are all sorts of things you can do with R and custom queries, so explore and shape your data just the way you want it to appear.

## Next Steps

* [Introduction to R](https://mran.microsoft.com/documents/what-is-r) 

* [Run R scripts in Power BI Desktop](desktop-r-scripts.md) 

* [Use an external R IDE with Power BI](desktop-r-ide.md) 

* [R packages in the Power BI service](service-r-packages-support.md)
