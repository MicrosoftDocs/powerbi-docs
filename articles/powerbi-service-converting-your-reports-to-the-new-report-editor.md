<properties
   pageTitle="Converting your Preview reports to the new report editor"
   description="Converting your reports to the new report editor"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/15/2015"
   ms.author="mihart"/>

# Converting your reports to the new report editor  

All classic reports will be automatically upgraded to the current report editor on January 19, 2016.  For best results, follow these steps to migrate your classic reports now.

![](media/powerbi-service-converting-your-reports-to-the-new-report-editor/pbi_sunsetting.png)   

If you have any reports that use the classic report format, you'll notice a new notification that appears when you open that report. On January 19, 2016 we will be retiring the classic report editor.  You can either convert your report prior to that date or, on January 19th, we'll convert it for you. /([Take a tour of the report editor](powerbi-service-the-report-editor-take-a-tour.md)/).

>**NOTE**: If Power BI converts the report for you, any unsupported visuals will be removed.

## Preparing to convert your report to the new report editor

Migrating to the new report editor is not difficult and offers many advantages over the original.

The new editor is great, but your old reports and visualizations may not transition perfectly.  For example, there may be features in your classic reports that either aren't currently supported in the new report editor or that can't be automatically migrated (see list at bottom of this article).  

>**Note:**  
>Our plan is to eventually add all of these features back into Power BI and the new report editor.  Your feedback will help us prioritize which to reintroduce first.

## Converting your reports  
When you open your report, Power BI will automatically convert it and show you the new report experience. You'll get a notification that you're seeing the new version.

![](media/powerbi-service-converting-your-reports-to-the-new-report-editor/pbi_sunsetting.png)   

If you choose to edit the report, you'll be working in the new report canvas. When you select **Save**, your report is saved in the new format.

When you open a report that does have one of the unsupported features listed above, you'll see error messages on your report canvas.

Remove (and optionally re-create) any unsupported visuals (grey boxes) before you save the report. You'll be reminded of this when you try and save:  
![](media/powerbi-service-converting-your-reports-to-the-new-report-editor/unabletosave.png)

>**NOTE**: Remember, if you don't save your report, it won't be converted.  It will remain in the classic format until January 19, 2016 and on that date Power BI will do the conversion for you.  Any unsupported visuals will be removed.

## Unsupported features  
Some visuals aren't supported and will show up as grey boxes in the new reporting canvas:

-   **Small Multiples** - these are the small, side-by-side charts that share an axis

-   **Play axis** - this is the bubble chart with trails showing changes over time. You'd only have this in your report if you had created it using Power View in Excel.

-   **Tiles** - these are a container that you can put other charts inside. You'd only have this in your report if you had created it using Power View in Excel.

Some other report features aren't supported in the new reporting canvas. The visualization may still display in the new canvas, but these specific features and functions will not work:

-   **Hierarchies** - these organize your data in levels. You'd only have these if you'd uploaded an Excel workbook with a Power Pivot model.

-   **Images from your model** - you could show images from your model in slicers and in tables. You'd only have these if you'd uploaded an Excel workbook with images in a Power Pivot model and a Power View worksheet. Images are still supported if you’re using a URL to reference them rather than storing them in your model.

## See also  
Read more about [reports in Power BI](powerbi-service-reports.md)  
[Get started with Power BI](powerbi-service-get-started.md)  
[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)﻿  
