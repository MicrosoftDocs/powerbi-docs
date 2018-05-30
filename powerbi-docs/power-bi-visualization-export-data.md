---
title: Export data from a Power BI visualization
description: Export data from a report visualization and dashboard visualization and view it in Excel.
author: mihart
manager: kfile
ms.reviewer: ''
featuredvideoid: jtlLGRKBvXY

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 05/25/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Export data from visualizations
If you'd like to see the data that is used to create a visualization, you can [display that data in Power BI](service-reports-show-data.md) or export that data to Excel as an .xlsx or .csv file.   

Watch Will export the data from one of the visualizations in his report, save it as an .xlsx file, and open it in Excel. Then follow the step-by-step instructions below the video to try it out yourself.

<iframe width="560" height="315" src="https://www.youtube.com/embed/KjheMTGjDXw" frameborder="0" allowfullscreen></iframe>

## From a visualization on a Power BI dashboard
1. Select the ellipses in the top right corner of the visualization.
   
    ![](media/power-bi-visualization-export-data/pbi-export-tile3.png)
2. Choose the  **Export data** icon.
   
    ![](media/power-bi-visualization-export-data/pbi_export_dash.png)
3. The data is exported to a .csv file. If the visual is filtered, then the downloaded data will also be filtered.    
4. Your browser will prompt you to save the file.  Once saved, open the .csv file in Excel.
   
    ![](media/power-bi-visualization-export-data/pbi-export-to-excel.png)

## From a visualization in a report
To follow along, open the [Procurement analysis sample report](sample-procurement.md) in [Editing view](service-reading-view-and-editing-view.md). [Add a new blank report page](power-bi-report-add-page.md). Then follow the steps below to add an aggregation and a visualization-level filter.

1. Create a new column chart.  From the Fields pane, select **Location > City** and **Invoice > Discount Percent**.  You may have to move **Discount Percent** into the Value well. 
   
    ![](media/power-bi-visualization-export-data/power-bi-export-data3.png)
2. Change the aggregation for **Discount Percent** from **Count** to **Average**. In the Value well, select the arrow to the right of **Discount Percent** (it may say **Count of Discount Percent**), and choose **Average**.
   
    ![](media/power-bi-visualization-export-data/power-bi-export-data6.png)
3. Add a filter to **City** to remove **Atlanta**.
   
   ![](media/power-bi-visualization-export-data/power-bi-export-data4.png)
   
   Now we're ready to try out both options for exporting data.
4. Select the ellipses in the top right corner of the visualization. Choose  **Export data**.
   
   ![](media/power-bi-visualization-export-data/power-bi-export-data2.png)
5. If your visualization has an aggregate (one example would be if you changed **Count** to *average*, **sum** or *minimum*),  you'll have two options: **Summarized data** and **Underlying data**. For help understanding aggregates, see [Aggregates in Power BI](service-aggregates.md).
   
    ![](media/power-bi-visualization-export-data/power-bi-export-data5.png)
6. Select **Summarized data** > **Export** and choose either .xlsx or .csv. Power BI exports the data.  If you have applied filters to the visualization, the exported data will export as filtered. When you select  **Export**, your browser prompts you to save the file. Once saved, open the file in Excel.
   
   **Summarized data**: select this option if you don't have an aggregate or if you do have an aggregate but don't want to see the complete breakdown. For example, if you have a bar chart showing 4 bars, you will get 4 rows of data. Summarized data is available as .xlsx and .csv.
   
   In this example, our Excel export shows one total for each city. Since we filtered out Atlanta, it is not included in the results.  The first row of our spreadsheet shows the filters that were used when extracting the data from Power BI.
   
   ![](media/power-bi-visualization-export-data/power-bi-export-data7.png)
7. Now try selecting **Underlying data** > **Export** and choosing .xlsx. Power BI exports the data. If you had applied filters to the visualization, the exported data will export as filtered. When you select  **Export**, your browser prompts you to save the file. Once saved, open the file in Excel.
   
   >[!WARNING]
   >Exporting underlying data allows users to see all the detailed data -- every column in the data. Power BI service administrators can turn this off for their organization. If you are a dataset owner, you can set proprietary columns to "hidden" so that they don't show up in the Field list in Desktop or Power BI service.
   
   
   **Underlying data**: select this option if your visualization does have an aggregate and you'd like to see all the underlying details. Basically, selecting *Underlying data* removes the aggregate. When you select **Export**, the data is exported to an .xlsx file and your browser prompts you to save the file. Once saved, open the file in Excel.
   
   In this example, our Excel export shows one row for every single City row in our dataset, and the discount percent for that single entry. In other words, the data is flattened and not aggregated. The first row of our spreadsheet shows the filters that were used when extracting the data from Power BI.  
   
   ![](media/power-bi-visualization-export-data/power-bi-export-data8.png)

## Limitations and considerations
* The maximum number of rows that can be exported from **Power BI Desktop** and **Power BI service** to .csv is 30,000.
* The maximum number of rows that can be exported to .xlsx is 150,000.
* Export using *Underlying data* will not work if the data source is an Analysis Services live connection and the version is older than 2016 and the tables in the model do not have a unique key.  
* Export using *Underlying data* will not work if the *Show items with no data* option is enabled for the visualization being exported.
* When using DirectQuery, the maximum amount of data that can be exported is 16 MB. This may result in exporting less than the maximum number of rows, especially if there are many columns, data that is difficult to compress, and other factors that increase file size and decrease number of rows exported.
* Power BI only supports export in visuals that use basic aggregates. Export is not available for visuals using model or report measures.
* Custom visuals and R visuals, are not currently supported.
* Export data is not available for users outside of your organization who are using a dashboard that has been shared with them. 
* In Power BI, a field (column) can be renamed by double-clicking the field and typing a new name.  This new name is referred to as an *alias*. It is possible that a Power BI report can end up with duplicate field names but Excel does not allow duplicates.  So when the data is exported to Excel, the field aliases revert to their original field (column) names.  
* If there is unicode character in the .csv file, the text in Excel may not display properly. Although, opening it in Notepad will work fine. Examples of unicode characters are currency symbols and foreign words. The workaround for this is to import the csv into Excel, instead of opening the csv directly. To do this:
  
  1. Open Excel
  2. From the **Data** tab, select **Get external data** > **From text**.
* Power BI admins have the ability to disable the export of data.

## Next steps
[Dashboards in Power BI](service-dashboards.md)  
[Reports in Power BI](service-reports.md)  
[Power BI - Basic Concepts](service-basic-concepts.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

