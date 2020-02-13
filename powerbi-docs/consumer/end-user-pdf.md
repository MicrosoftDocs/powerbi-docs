---
title: Export reports to PDF
description: Learn how to export a Power BI report to PDF.
author: mihart
ms.custom:  
ms.reviewer: cmfinlan

ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 1/16/2020
ms.author: mihart

LocalizationGroup: Share your work
---
# Export reports from Power BI to PDF

[!INCLUDE [power-bi-service-new-look-include](../includes/power-bi-service-new-look-include.md)]

With Power BI, you can publish your report to PDF format and easily create a document based on your Power BI report. When you export to PDF, each page in the Power BI report becomes an individual page in your PDF document.

## Export your Power BI report to PDF
In the Power BI service, select a report to display it on the canvas. You can also select a report from your **Home** page, **Apps**, or any other container from the nav pane.

1. Select **Export** > **PDF** from the menu bar.

    ![Select Export from the menu bar](media/end-user-pdf/power-bi-export.png)

    A pop-up appears where you have the option to select **Current values** or **Default values**. **Current values** exports the report in the current state, which includes the active changes you made to slicer and filter values. Most users select this option. Alternatively, selecting **Default values** exports the report in its original state, as the *designer* shared it, and doesn't reflect any changes you made to that original state.
    
    Additionally, there's a check box to select whether or not to export the hidden tabs of a report. Select this check box if you want to export only report tabs that are visible to you in your browser. If you prefer to get all the hidden tabs as part of your export, you can leave this check box cleared. If the check box is grayed out, there are no hidden tabs in the report. After you make your selections, select **Export** to continue.
    
    A progress bar displays in the upper-right corner. Exporting might take a few minutes. You can continue to work in Power BI while the report is being exported.

    ![Export progress message](media/end-user-pdf/power-bi-export-progress.png)

    After the Power BI service finishes the export process, the notification banner changes to let you know.

2. Your file is then available where your browser displays downloaded files. In the following image, it's shown as a download banner along the bottom of the browser window.

    ![Downloaded file location](media/end-user-pdf/power-bi-export-done.png)

And that's all there is to it. You can download the file and open it with any PDF viewer, like the one available in Microsoft Edge.


## Limitations and considerations
There are a few considerations and limitations to keep in mind when you work with the **Export to PDF** feature.

* R visuals aren't currently supported. In the PDF, these visuals are blank and display an error message. 
* Custom visuals that have been certified are supported. For more information on certified custom visuals, including how to get a custom visual certified, see [Get a custom visual certified](../developer/power-bi-custom-visuals-certified.md). Custom visuals that haven't been certified aren't supported. In the PDF, they display with an error message. 
* Reports with more than 30 report pages currently can't be exported.
* The process of exporting the report to PDF might take a few minutes to complete, so be patient. Factors that can affect the time required include the structure of the report and the current load on the Power BI service.
* If the **Export to PDF** menu item isn't available in the Power BI service, it's likely because your tenant administrator disabled the feature. Contact your tenant administrator for details.
* Background images are cropped with the chart's bounding area. We recommend that you remove background images before you export to PDF.
* Reports that are owned by a user outside your Power BI tenant domain, such as a report owned by someone outside your organization and shared with you, can't be published to PDF.
* If you share a dashboard with someone outside of your organization, and thereby, a user who isn't in your Power BI tenant, that user can't export the shared dashboard's associated reports to PDF. For example, if you're aaron@contoso.com, you can share with cassie@cohowinery.com. But cassie@cohowinery.com can't export the associated reports to PDF.
* When you export to PDF with reports that contain a background image, you might see a distorted image in the export if you use the **Normal** or **Fill** options for the **Page Background**. For best results, use the **Fit** option to avoid issues with your exported document.
* The Power BI service uses your Power BI language setting as the language for the PDF export. To see or set your language preference, select the cog icon ![Cog icon](media/end-user-powerpoint/power-bi-settings-icon.png) > **Settings** > **General** > **Language**.
* URL filters aren't currently respected when you choose **Current Values** for your export.
* Reports with unusual custom page sizes may experience issues in export scenarios. For best results, consider switching to a standard page size for your report.
* When exporting to PDF, reports using themes with custom fonts will have the custom font replaced with a default font.
* While we look to provide a consistent experience, we can't guarantee the exported PDF from the Power BI service will always match the exported PDF from a local Power BI Desktop file.

## Next steps
[Print a report](end-user-print.md)
