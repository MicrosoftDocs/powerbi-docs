---
title: Export data from a Power BI visual
description: Export data from a report visual and dashboard visual and view it in Excel.
author: mihart
ms.reviewer: 'cmfinlan'
featuredvideoid: jtlLGRKBvXY

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 01/22/2020
ms.author: mihart

LocalizationGroup: Consumers
---
# Export data from a visual

[!INCLUDE [power-bi-service-new-look-include](../includes/power-bi-service-new-look-include.md)]

If you'd like to see the data that is used to create a visual, [you can display that data in Power BI](end-user-show-data.md) or export that data to Excel. The option to export the data requires a certain type or license and edit permissions to the content. If you cannot export, check with your Power BI administrator. 

## From a visual on a Power BI dashboard

1. Start on a Power BI dashboard. Here we're using the dashboard from the ***Marketing and sales sample*** app. You can [download this app from AppSource.com](https://appsource.microsoft.com/product/power-bi/microsoft-retail-analysis-sample.salesandmarketingsample-preview?flightCodes=e2b06c7a-a438-4d99-9eb6-4324ce87f282).

    ![App dashboard](media/end-user-export/power-bi-dashboards.png)

2. Hover over a visual to reveal **More options** (...) and click to display the action menu.

    ![Menu that appears when select ellipses](media/end-user-export/power-bi-options-menu.png)

3. Select  **Export to .csv**.

4. What happens next depends on which browser you are using. You may be prompted to save the file or your may see a link to the exported file at the bottom of the browser. 

    ![Chrome browser showing exported file link](media/end-user-export/power-bi-dashboard-exports.png)

5. Open the file in Excel. 

    > [!NOTE]
    > If you don't have permissions to the data, you won't be able to export or open in Excel.  

    ![Total Units YTD in Excel](media/end-user-export/power-bi-excel.png)


## From a visual in a report
You can export data from a visual in a report as .csv or .xlsx (Excel) format. 

1. On a dashboard, select a tile to open the underlying report.  In this example, we're selecting the same visual as above, *Total Units YTD Var %*. 

    ![Highlighted dashboard tile](media/end-user-export/power-bi-export-reports.png)

    Since this tile was created from the *Sales and Marketing Sample* report, that is the report that opens. And, it opens to the page that contains the selected tile visual. 

2. Select the tile in the report. Notice the **Filters** pane to the right. This visual has filters applied. To learn more about filters, see [Use filters in a report](end-user-report-filter.md).

    ![Filter pane selected](media/end-user-export/power-bi-export-filter.png)


3. Select **More options (...)** from the upper right corner of the visualization. Choose **Export data**.

    ![Export data selected from dropdown](media/end-user-export/power-bi-export-report.png)

4. You'll see options to export Summarized data or Underlying data. If you're using the *Sales and marketing sample* app, **Underlying data** will be disabled. But you may encounter reports where both options are enabled. Here's an explanation of the difference.

    **Summarized data**: select this option if you want to export data for what you currently see in the visual.  This type of export shows you only the data that was used to create the current state of the visual. If the visual has filters applied, then the data you export will also be filtered. For example, for this visual, your export will include only data for 2014 and the central region, and only data for four of the manufacturers: VanArsdel, Natura, Aliqui, and Pirum. If your visual has aggregates (sum, average, etc.), the export will also be aggregated. 
  

    **Underlying data**: select this option if you want to export data for what you see in the visual **plus** additional data from the underlying dataset.  This may include data that is contained in the dataset but not used in the visual. If the visual has filters applied, then the data you export will also be filtered.  If your visual has aggregates (sum, average, etc.), the export will remove the aggregation; essentially flattening the data. 

    ![Menu where you choose underlying or summarized](media/end-user-export/power-bi-export-underlying.png)

5. What happens next depends on which browser you are using. You might be prompted to save the file or you might see a link to the exported file at the bottom of the browser. 

    ![Exported file displaying in Microsoft Edge browser](media/end-user-export/power-bi-export-edge-browser.png)

    > [!NOTE]
    > If you don't have permissions to the data, you won't be able to export or open in Excel.  


6. Open the file in Excel. Compare the amount of data exported to the data we exported from the same visual on the dashboard. The difference is that this export includes **Underlying data**. 

    ![Sample Excel](media/end-user-export/power-bi-underlying.png)

## Next steps

[Display the data used to create a visual](end-user-show-data.md)