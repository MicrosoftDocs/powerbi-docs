---
title: Connect to the samples in the Power BI service
description: Learn to install and explore the samples in the Power BI service.
author: maggiesMSFT
manager: kfile
ms.reviewer: amac
ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 07/09/2019
ms.author: maggies

LocalizationGroup: Samples
---
#  Connect to the samples in the Power BI service

This tutorial shows you how to: 
- Import a sample content pack, add it to the Power BI service, and open the contents. A *content pack* is a type of sample where the dataset is bundled with a dashboard and report. 
- Open a sample .pbix file in Power BI Desktop.

If you'd like more background information, see [Sample datasets for Power BI](sample-datasets.md). In that article you'll learn all about the samples: how to get them, where to save them, how to use them, and some of the stories each sample can tell. 

## Prerequisites
The samples are available for the Power BI service and Power BI Desktop. To follow along, we'll be using the Retail analysis sample.

The *Retail Analysis* sample content pack used in this tutorial consists of a dashboard, report, and dataset.
To familiarize yourself with this particular content pack and its scenario, see
 [Retail Analysis sample for Power BI: Take a tour](sample-retail-analysis.md) before you begin.

## Samples and the Power BI service

1. Open the Power BI service (app.powerbi.com), sign in, and open the workspace where you want to save the sample. 

    If you don't have a Power BI Pro license, you can save the sample to your My Workspace.

2. Select **Get Data** at the bottom of the left navigation pane. 

   ![Select Get Data](media/sample-datasets/power-bi-get-data.png)

   If you don't see **Get Data**, expand the navigation pane by selecting the following icon at the top of the pane: ![hamburger icon](media/sample-tutorial-connect-to-the-samples/expand-nav.png).

5. On the **Get Data** page that appears, select **Samples**.
   
6. Select **Retail Analysis Sample**, and then choose **Connect**.   
   
   ![Connect button](media/sample-tutorial-connect-to-the-samples/pbi_retailanalysissampleconnect.png)

## What was imported?
With the sample content packs, when you select **Connect**, Power BI gets a copy of that content pack and stores it for you in the cloud. Because the person who created the content pack included a dataset, a report, and a dashboard, that's what you get when you select **Connect**. 

1. When you select **Connect**, Power BI creates the new dashboard and lists it on your **Dashboards** tab. 
   
   ![Retail Analysis Sample entry](media/sample-retail-analysis/retail-entry.png)
2. Open the **Reports** tab. Here, you'll see a new report named *Retail Analysis Sample*.
   
   ![Retail Analysis Sample report entry](media/sample-tutorial-connect-to-the-samples/power-bi-new-report.png)
   
   Check out the **Datasets** tab; there's a new dataset there as well.
   
   ![Retail Analysis Sample dataset entry](media/sample-tutorial-connect-to-the-samples/power-bi-new-dataset.png)

## Explore your new content
Now explore the dashboard, dataset, and report on your own. There are many different ways to navigate to your dashboards, reports, and datasets. One of these ways is described in the following procedure.  

1. Navigate back to the **Dashboards** tab, and then select the **Retail Analysis Sample** dashboard to open it.       

   The dashboard opens, which has a variety of visualization tiles.   
 
1. Select one of the tiles in the dashboard to open the underlying report. In this example, we'll select the area chart, **This Year's Sales, Last Year's Sales by Fiscal Month**.  

   ![Retail Analysis Sample dashboard with visual highlighted](media/sample-tutorial-connect-to-the-samples/power-bi-dashboards2new.png)

   The report opens to the page that contains the area chart you selected; in this case, the **District Monthly Sales** page of the report.
   
   ![District Monthly Sales report page](media/sample-tutorial-connect-to-the-samples/power-bi-report.png)
   
   > [!NOTE]
   > If the tile was created by using [Power BI Q&A](power-bi-tutorial-q-and-a.md), the Q&A page will open instead. If the tile was [pinned from Excel](service-dashboard-pin-tile-from-excel.md), Excel Online will open inside of Power BI.
   > 
   > 
1. When someone shares a content pack with colleagues, they typically want to share only the insights, rather than provide direct access to the data. On the **Datasets** tab, you have several options for exploring your dataset. However, you won't be able to view the rows and columns of your data, as you can in Power BI Desktop or Excel. 
   
   ![Retail Analysis Sample dataset entry](media/sample-tutorial-connect-to-the-samples/power-bi-new-dataset.png)
   
1. One way of exploring the dataset is by creating your own visualizations and reports from scratch. Select the chart icon ![Chart icon](media/sample-tutorial-connect-to-the-samples/power-bi-chart-icon4.png) to open the dataset in report editing mode.
     
   ![Brand-new report](media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png)

1. Another way of exploring the dataset is to run [quick insights](consumer/end-user-insights.md). Select the ellipses (...), and then choose **Get quick insights**. When the insights are ready, select **View insights**.
     
    ![Insights report](media/sample-tutorial-connect-to-the-samples/power-bi-insights.png)

## Samples and Power BI Desktop 
When you first open the sample .pbix file in Power BI Desktop, it displays in Report view where you can explore, create, and modify any number of report pages with visualizations. Report view provides almost the same design experience as a report’s Editing view in the Power BI service. You can move visualizations around, copy and paste, merge, and so on. Unlike Editing view in the Power BI service, when you use Power BI Desktop in Report view, you can work with your queries and model your data to ensure your data supports the best insights in your reports. You can then save your Power BI Desktop file wherever you like, whether it's to your local drive or to the cloud.

1. Open the [Retail Analysis sample .pbix file](http://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) in Power BI Desktop. 

    ![Sample in Power BI report view](media/sample-tutorial-connect-to-the-samples/power-bi-samples-desktop.png)

1. The file opens in Report view. Notice the four tabs at the bottom of the report editor; these tabs represent the four pages in this report. For this example, the **New Stores** page is currently selected. 

    ![New Stores tab highlighted](media/sample-tutorial-connect-to-the-samples/power-bi-sample-tabs.png).

1. For a deep dive into the report editor, see [Take a tour of the report editor](service-the-report-editor-take-a-tour.md).

## What was imported?
When you open the sample .pbix file in Power BI Desktop, Power BI gets a copy of that data and stores it for you in the cloud. From Power BI Desktop, you have access to the report *and the underlying dataset*. When the data is loaded, Power BI Desktop attempts to find and create relationships for you.  

1. Switch to [Data view](desktop-data-view.md) by selecting the table icon ![table icon](media/sample-tutorial-connect-to-the-samples/power-bi-data-icon.png).
 
    ![Desktop data view](media/sample-tutorial-connect-to-the-samples/power-bi-desktop-sample-data.png)

    Data view helps you to inspect, explore, and understand data in your Power BI Desktop model. It's different from how you view tables, columns, and data in Query editor. With Data view, you’re looking at your data after it's been loaded into the model.

    When you’re modeling your data, sometimes you want to see what's actually in the rows and columns of a table, without creating a visual on the report canvas. This is especially true when you’re creating measures and calculated columns, or you need to identify a data type or data category.

1. Switch to [Relationships view](desktop-relationship-view.md) by selecting the following icon: ![Relationship view icon](media/sample-tutorial-connect-to-the-samples/power-bi-desktop-relationship-icon.png).
 
    ![Relationship view in Power BI Desktop](media/sample-tutorial-connect-to-the-samples/power-bi-relationships.png)

    Relationship view shows all of the tables, columns, and relationships in your model. From here you can view, change, and create relationships.

## Next steps
This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always select **Get Data** for a new copy of this sample.

We hope this tour has shown how Power BI dashboards, datasets, relationships, and reports can provide insights into sample data. Now it's your turn; connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started with the Power BI service](service-get-started.md) and [Get started with Power BI Desktop](desktop-getting-started.md).  

For more information, see:  
- [Basic concepts for designers in the Power BI service](service-basic-concepts.md)
- [Samples for the Power BI service](sample-datasets.md)
- [Data sources for Power BI](service-get-data.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
