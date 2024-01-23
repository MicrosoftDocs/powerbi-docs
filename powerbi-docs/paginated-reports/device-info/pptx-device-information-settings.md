---
title: "PPTX device information settings for Power BI paginated reports"
description: Learn details about the device information settings for rendering Power BI paginated reports in the PPTX format. 
ms.date: 01/05/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
---
# PPTX device information settings for Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  The following table lists the device information settings for rendering Power BI paginated reports in the PPTX format.  

## Settings 

|Setting|Value|  
|-------------|-----------|  
|**Columns**|The number of columns to set for the report. This value overrides the report's original settings.|  
|**ColumnSpacing**|The column spacing to set for the report. This value overrides the report's original settings.|  
|**DpiX**|The horizontal resolution of the output image. The default value is **96**. Applies to **BMP**, **GIF**, **PNG**, and **TIFF** output formats.|  
|**DpiY**|The vertical resolution of the output image. The default value is **96**. Applies to **BMP**, **GIF**, **PNG**, and **TIFF** output formats.|  
|**EndPage**|The last page of the report to render. The default value is the value for **StartPage**.|  
|**MarginBottom**|The bottom margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, **1in**). This value overrides the report's original settings.|  
|**MarginLeft**|The left margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, **1in**). This value overrides the report's original settings.|  
|**MarginRight**|The right margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, **1in**). This value overrides the report's original settings.|  
|**MarginTop**|The top margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, **1in**). This value overrides the report's original settings.|  
|**PageHeight**|The page height, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, **11in**). This value overrides the report's original settings.|  
|**PageWidth**|The page width, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, **8.5in**). This value overrides the report's original settings.|  
|**StartPage**|The first page of the report to render. A value of **0** indicates that all pages are rendered. The default value is **1**.|  
|**UseReportPageSize**|If UseReportPageSize =**false** then the default slide size is PowerPoint's default of 13.333" x 7.5" (16:9 aspect ratio). If UseReportPageSize =true, then the default slide size is the define page size of the report.<br /><br /> The default value is **false**<br /><br /> Note, the PageWidth and PageHeight settings override the default width and height.|  
  
## Related content

- [Specify Device Information Settings in a URL](/sql/reporting-services/specify-device-information-settings-in-a-url)

  
  
