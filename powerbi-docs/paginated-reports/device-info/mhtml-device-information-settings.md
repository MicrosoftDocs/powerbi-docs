---
title: MHTML Device Information Settings for Power BI Paginated Reports
description: Learn about the various device information settings for rendering Power BI paginated reports in Web archive (MHTML) format. 
ms.date: 12/01/2025
ai-usage: ai-assisted
ms.service: powerbi
ms.subservice: report-builder
ms.topic: concept-article
author: JulCsc
ms.author: juliacawthra
---
# MHTML device information settings for Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  The following table lists the device information settings for rendering Power BI paginated reports in Web archive (MHTML) format.  
 
## Settings 
 
|Setting|Value|  
|-------------|-----------|  
|**JavaScript**|Indicates whether JavaScript is supported in the rendered report.|  
|**OutlookCompat**|Indicates whether to render with extra metadata that makes the report look better in Outlook. The default value is **true**.|  
|**MHTML Fragment**|Indicates whether an MHTML fragment is created in place of a full MHTML document. An MHTML fragment includes the report content in a TABLE element and omits the HTML and BODY elements. The default value is **false**.|  
|**DataVisualizationFitSizing**|Indicates data visualization fit behavior when inside a tablix. This includes chart, gauge, and map.<br /><br /> The possible values are **Approximate** and **Exact**.<br /><br /> The default value is **Approximate**.<br /><br /> Enabling **Exact** might have performance impact because the processing to determine the exact size might take longer.|  
  
## Related content

- [URL parameters in paginated reports](../report-builder-url-parameters.md)
