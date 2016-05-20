<properties
   pageTitle="Export data from a visualization"
   description="Export data from a report visualization and dashboard visualization"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="04/06/2016"
   ms.author="mihart"/>

# Export data from Power BI visualizations
Data can be exported from visuals on a dashboard and in reports.  

>**NOTE**: The maximum number of rows that can be downloaded is 10,000.

## Export a dashboard visual's data

1. Select the ellipses in the top right corner of the visualization.

    ![](media/powerbi-service-export-data/pbi-export-tile3.png)

2. Choose the  **Export data** icon.

    ![](media/powerbi-service-export-data/pbi_export_dash.png)

    The data is exported to a CSV file. If the visual is filtered, then the downloaded data will also be filtered.

3. Open the CSV file in Excel.

    ![](media/powerbi-service-export-data/pbi-export-to-excel.png)
    
    >**NOTE**: If there is unicode in the .csv file, the text in Excel may not display properly. Although, opening it in Notepad will work fine.


## Export a report visual's data

1. Select the ellipses in the top right corner of the visualization. Choose  **Export data**.

    ![](media/powerbi-service-export-data/pbi_export_dialog.png)
    
    >**NOTE**: The option to remove a visual is only available in [report Editing View](powerbi-service-go-from-reading-view-to-editing-view.md).

2. See step 3 above.


## See also

[Dashboards in Power BI](powerbi-service-dashboards.md)

[Reports in Power BI](powerbi-service-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
