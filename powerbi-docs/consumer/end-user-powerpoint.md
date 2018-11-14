---
title: Export reports from Power BI to PowerPoint (Preview)
description: Learn how to export a Power BI report to PowerPoint.
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 11/13/2018
ms.author: mihart

LocalizationGroup: Share your work
---
# Export reports from Power BI to PowerPoint (Preview)
With Power BI, you can publish your report to **Microsoft PowerPoint**, and easily create a slide deck based on your Power BI report. When you **export to PowerPoint**, the following occurs:

* Each page in the Power BI report becomes an individual slide in PowerPoint
* Each page in the Power BI report is exported as a single high resolution image in PowerPoint
* A link is created in PowerPoint that links to the Power BI report

Getting your **Power BI report** exported into **PowerPoint** is quick. Just follow the steps outlined in the next section.

## How to export your Power BI report to PowerPoint
In the Power BI service, select a report to display it on the canvas. You can also select a report from your **Home** page, **Apps** or any other section on your left navpane.

![](media/service-publish-to-powerpoint/power-bi-publish.png)

When the report you want to export to PowerPoint is displayed on the canvas, select **File > Export to PowerPoint (Preview)** from the menu bar in the Power BI service.

![](media/service-publish-to-powerpoint/powerbi_to_powerpoint_1.png)

You'll see a notification banner in the upper right corner of the Power BI service browser window that the report is being exported to PowerPoint. This might take a few minutes, and you can continue to work in Power BI while the report is being exported.

![](media/service-publish-to-powerpoint/powerbi_to_powerpoint_2.png)

Once complete, the notification banner changes to let you know that the Power BI service has finished the export process.

![](media/service-publish-to-powerpoint/powerbi_to_powerpoint_3.png)

Your file is then available where your browser displays downloaded files. In the following image, it's shown as a download banner along the bottom of the browser window.

![](media/service-publish-to-powerpoint/powerbi_to_powerpoint_4.png)

And that's all there is to it. You can download the file, open it with PowerPoint, and then modify or enhance it just like you would any other PowerPoint deck.

## Checking out your exported PowerPoint file
When you open the PowerPoint file that Power BI exported, you find a few cool and useful elements. Take a look at the following image, then check out the numbered elements below that describe some of those cool features.

![](media/service-publish-to-powerpoint/powerbi_to_powerpoint_5.png)

1. The first page of the slide deck includes the name of your report, and a link so that you can **View in Power BI** the report on which the slide deck is based.
2. You get some useful information about the report, too, including the *last data refresh* on which the exported report is based, and the *downloaded at* time and date, which is the time and date when the Power BI report was exported into a PowerPoint file.
3. Each report page is a separate slide, as shown in the left navigation pane.
4. Your published report is rendered in the language according to your Power BI settings, or otherwise by the locale setting of your browser. To see or set your language preference, select the cog icon ![](media/service-report-subscribe/power-bi-settings-icon.png) **> Settings > General > Language**. For locale information, see [Supported languages and countries/regions for Power BI](supported-languages-countries-regions.md).
5. The PowerPoint presentation includes a cover slide with the exported time in the correct time zone.

When you go into an individual slide, you'll notice that each report page is an independent image.

>[!NOTE]
> Having one visual for each report page is new behavior. The previous behavior, which provided an independent image for each visual, is no longer implemented. 
 

![](media/service-publish-to-powerpoint/powerbi_to_powerpoint_6.png)

What you do with your PowerPoint deck from there, or any of the high resolution images, is up to you!

## Limitations
There are a few considerations and limitations to keep in mind when working with the **Export to PowerPoint** feature.

* **R visuals** are not currently supported. Any such visuals are exported as a blank image into PowerPoint with an error message that states the visual is not supported.
* **Custom visuals** that have been **certified** are supported. For more information on certified custom visuals, including how to get a custom visual certified, see [getting a custom visual certified](power-bi-custom-visuals-certified.md). Custom visuals that have not been certified are not supported, and are exported as a blank image into PowerPoint with an error message that states the visual is not supported.
* Reports with more than 15 report pages can't currently be exported.
* The process of exporting the report to PowerPoint may take a few minutes to complete, so please be patient. Factors that can impact the time required include the structure of the report, and the current load on the Power BI service.
* If the **Export to PowerPoint (Preview)** menu item isn't available in the Power BI service, it's likely because your tenant administrator has disabled the feature. Please contact your tenant administrator for details.
* Background images will be cropped with the chart's bounding area. It's highly recommended that you remove background images before exporting to PowerPoint.
* **In-session interactivity** such as highlighting and filtering, drill-down, and so on, are not yet supported when exporting to PowerPoint. The exported PowerPoint shows the original visuals as they were saved in the report.
* Pages in PowerPoint are always created in the standard 9:16 size, regardless of the original page sizes or dimensions in the Power BI report.
* Reports that are owned by a user outside your Power BI tenant domain (such as, a report owned by someone outside your organization, and shared with you) cannot be published to PowerPoint.
* If you share a dashboard with someone outside of your organization (and thereby, a user who is not in your Power BI tenant), that user will not be able to export the shared dashboard's associated reports to PowerPoint. For example, if you are aaron@contoso.com, you can share with david@cohowinery.com. But david@cohowinery.com cannot export the associated reports to PowerPoint.
* As previously mentioned, each report page is exported as a single image in the PowerPoint file.
* The Power BI service uses your Power BI language setting as the language for the PowerPoint export. To see or set your language preference, select the cog icon ![](media/service-report-subscribe/power-bi-settings-icon.png) **> Settings > General > Language**.
* The **Downloaded at** time on the cover slide for the exported PowerPoint file is set to your computer's time zone at the time of the export.

## Next steps
[Analyze in Excel](service-analyze-in-excel.md)

[Excel data in Power BI](service-excel-workbook-files.md)

[Getting a custom visual certified](power-bi-custom-visuals-certified.md)

