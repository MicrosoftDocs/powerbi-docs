---
title: Export your reports to PDF format from Power BI Desktop
description: Easily export to PDF from Power BI Desktop, and easily print those PDF reports
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/12/2021
LocalizationGroup: Create reports
ROBOTS: NOINDEX
---
# Export reports to PDF from Power BI Desktop
In **Power BI Desktop** or the Power BI service, you can export reports to a PDF file, and thereby easily share or print your reports from that PDF.

![Export to PDF](media/desktop-export-to-pdf/export-to-pdf_01.png)

The process of exporting your report from **Power BI Desktop** to a PDF, so that you can print the PDF or share that PDF document with others, is straightforward. Simply select **File** > **Export** > **Export to PDF** from Power BI Desktop.

The **Export to PDF** process will export all *visible* pages in the report, with each report page exporting to a single page in the PDF. Report pages that are currently not visible, such as any tooltips or hidden pages, are not exported to the PDF file. 

![Export to PDF in process](media/desktop-export-to-pdf/export-to-pdf_02.png)

When you select **File** > **Export** > **Export to PDF** the export is initiated, and a dialog appears that shows the export process is underway. The dialog remains on the screen until the export process completes. During the export process, all interaction with the report being exported is disabled. The only way to interact with the report is to wait until the export process completes, or to cancel the export. 

When the export completes, the PDF is loaded into the default PDF viewer on the computer. 

## Considerations and limitations
There are a few considerations to keep in mind with the **Export to PDF** feature:

* Visuals with scrollbars are exported in their default state.  The visual will display all possible rows, starting with the first row. Even if you have the visual scrolled down, when exported, the visual will display unscrolled.

    ![Export visual with scrollbars.](media/desktop-export-to-pdf/export-to-pdf-03.png)

* The feature does export Power BI visuals, but it does *not* export any wallpaper you may have applied to the report.

    Since wallpaper is not exported to the PDF, you should pay special attention to reports that use dark wallpaper. If the text in your report is light or white, to have it stand out against your dark wallpaper, it will be difficult to read or unreadable in the export to PDF process since the wallpaper will not be exported with the rest of the report. 



## Next steps
There are all sorts of interesting visual elements and features in **Power BI Desktop**. For more information in information, check out the following resources:

* [Use visual elements to enhance Power BI reports](desktop-visual-elements-for-reports.md)
* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
