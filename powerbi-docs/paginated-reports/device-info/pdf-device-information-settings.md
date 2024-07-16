---
title: "PDF device information settings for Power BI paginated reports"
description: Learn about the device information settings that are available for rendering Power BI paginated reports in PDF format.
ms.date: 06/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
---
# PDF device information settings for Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  The following table lists the device information settings for rendering Power BI paginated reports in PDF format.  

## Settings 

|Setting|Value|  
|-------------|-----------|  
| **AccessiblePDF** | Indicates whether to render an accessible/tagged PDF, which is larger in size but easier for screen readers and other assistive technologies to read and navigate. The default value is **false**. [Available in Power BI Report Server (March 2018) and later] |
|**Columns**|The number of columns to set for the report. This value overrides the report's original settings.|  
|**ColumnSpacing**|The column spacing to set for the report. This value overrides the report's original settings.|  
|**EndPage**|The last page of the report to render. The default value is the value for **StartPage**.|  
|**HumanReadablePDF**|Indicates whether to render an uncompressed PDF file, which is larger in size but more human-readable in a plain-text editor. The default value is **false.**|  
|**MarginBottom**|The bottom margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, 1in). This value overrides the report's original settings.|  
|**MarginLeft**|The left margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, 1in). This value overrides the report's original settings.|  
|**MarginRight**|The right margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, 1in). This value overrides the report's original settings.|  
|**MarginTop**|The top margin value, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, 1in). This value overrides the report's original settings.|  
|**PageHeight**|The page height, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, 11in). This value overrides the report's original settings.|  
|**PageWidth**|The page width, in inches, to set for the report. You must include an integer or decimal value followed by "in" (for example, 8.5in). This value overrides the report's original settings.|  
|**StartPage**|The first page of the report to render. A value of **0** indicates that all pages are rendered. The default value is **1**.|  
  
## Related content

- [Specify Device Information Settings in a URL](/sql/reporting-services/specify-device-information-settings-in-a-url)
 
