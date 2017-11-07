---
title: 'Create a new report from a dataset '
description: Create a new Power BI report from a dataset.
services: powerbi
documentationcenter: ''
author: mihart
manager: erikre
backup: ''
editor: ''
tags: ''
qualityfocus: monitoring
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/28/2017
ms.author: mihart

---
# Create a new Power BI report by importing a dataset
You've read [Reports in Power BI](powerbi-service-reports.md) and now you want to create your own. There are many different ways to create a report, and in this article we'll start by creating a very basic report from an Excel dataset. Once you understand the basics of creating a report, the **Next steps** at the bottom will direct you to more-advanced report topics.  

> **TIP**: To create a report by copying an existing report, see [Copy a report](powerbi-service-copy-a-report.md)
> 
> 

## Import the dataset
This method of creating a report starts with a dataset and a blank report canvas. To follow along, [download the Retail Analysis sample Excel dataset](http://go.microsoft.com/fwlink/?LinkId=529778) and save it to OneDrive for Business (preferred) or locally.

1. We'll create the report in a Power BI service workspace, so select an existing workspace or create a new one.
   
   ![](media/powerbi-service-create-a-new-report/power-bi-workspaces2.png)
2. From the bottom of the left navbar, select **Get data**.
   
   ![](media/powerbi-service-create-a-new-report/power-bi-get-data3.png)
3. Select **Files** and navigate to the location where you saved the Retail Analysis sample.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-select-files.png)
4. For this exercise, select **Import**.
   
   ![](media/powerbi-service-create-a-new-report/power-bi-import.png)
5. Once the dataset is imported, select **View dataset**.
   
   ![](media/powerbi-service-create-a-new-report/power-bi-view-dataset.png)
6. Viewing a dataset actually opens the report editor.  You'll see a blank canvas and the report editing tools.
   
   ![](media/powerbi-service-create-a-new-report/power-bi-blank-report.png)

> **TIP**: If you're unfamiliar with the report editing canvas, or need a refresher, [Take a tour of the report editor ](powerbi-service-the-report-editor-take-a-tour.md) before continuing.
> 
> 

## Add a Radial Gauge to the report
Now that our dataset is imported, let's start answering some questions.  Our Chief Marketing Officer (CMO) wants to know how close we are to meeting this year's sales goals. A Gauge is a [good visualization choice](powerbi-service-visualizations-for-reports.md) for displaying this type of information.

1. In the Fields pane, select **Sales** > **This Year Sales** > **Value**.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-report-step1.png)
2. Convert the visual to a Gauge by selecting the Gauge template ![](media/powerbi-service-create-a-new-report/powerbi-gauge-icon.png) from the **VIsualizations** pane.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-report-step2.png)
3. Drag **Sales** > **This Year Sales** > **Goal** to the **Target value** well. Looks like we're very close to our goal.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-report-step3.png)
4. Now would be a good time to [save your report](powerbi-service-save-a-report.md).
   
   ![](media/powerbi-service-create-a-new-report/powerbi-save.png)

## Add an area chart and slicer to the report
Our CMO has some additional questions for us to answer. She'd like to know how sales this year compare to last year. And, she'd like to see the findings by district.

1. First, let's make some room on our canvas. Select the Gauge and move it into the top-right corner. Then grab and drag one of the corners and make it smaller.
2. Deselect the gauge. In the Fields pane, select **Sales** > **This Year Sales** > **Value** and select **Sales** > **Last Year Sales**.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-report-step4.png)
3. Convert the visual to an Area chart by selecting the Area chart template ![](media/powerbi-service-create-a-new-report/power-bi-areachart-icon.png) from the **VIsualizations** pane.
4. Select **Time** > **Period** to add it to the **Axis** well.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-report-step5.png)
5. To sort the visualization, select the ellipses and choose **Sort by Period**.
6. Now let's add the slicer. Select an empty area on the canvas and choose the Slicer ![](media/powerbi-service-create-a-new-report/power-bi-slicer-icon.png)    template. This adds an empty slicer to our canvas.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-report-step6.png)    
7. From the Fields pane, select **District** > **District**. Move and resize the slicer.
   
    ![](media/powerbi-service-create-a-new-report/power-bi-report-step7.png)  
8. Use the slicer to look for patterns and insights by District.
   
   ![](media/powerbi-service-create-a-new-report/power-bi-slicer-video2.gif)  
9. Optionally, continue adding visualizations.

## Next steps
* [Create a copy of a report](powerbi-service-copy-a-report.md)
* [Save the report](powerbi-service-save-a-report.md)    
* [Add a new page to the report](powerbi-service-add-a-page-to-a-report.md)  
* Learn how to [pin visualizations to a dashboard](powerbi-service-pin-a-tile-to-a-dashboard-from-a-report.md)    
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

