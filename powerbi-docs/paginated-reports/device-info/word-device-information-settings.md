---
title: "Word device information settings for Power BI paginated reports"
description: Learn about the device information settings that are available for rendering Power BI paginated reports in Microsoft Word format.
ms.date: 01/05/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
---
# Word device information settings for Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  The following table lists the device information settings for rendering Power BI paginated reports in Microsoft Word format.  

## Settings 

|Setting|Value|  
|-------------|-----------|  
|**AutoFit**|**False**. AutoFit is set to **false** set on any Word table.<br /><br /> **True**. AutoFit is set to **true** on every Word table.<br /><br /> **Never**. AutoFit values are not set on any Word table and behavior reverts to the Word default.<br /><br /> **Default**. AutoFit is set on tables that are narrower than the physical drawing area (physical page width excluding margins) per logical page.|  
|**ExpandToggles**|Indicates whether all items that can be toggled should render in their fully-expanded state. The default value is **false**.|  
|**FixedPageWidth**|Indicates whether the Page Width written to the DOC file will grow to accommodate the width of the largest page in the Report Body. The default value is **false**.|  
|**OmitHyperlinks**|Indicates whether to omit the Hyperlink action on all items where it is set. The default value is **false**|  
|**OmitDrillthroughs**|Indicates whether to omit the Drillthrough action on all items where it is set. The default value is **false**|  
  
## Next steps

- [Specify Device Information Settings in a URL](/sql/reporting-services/specify-device-information-settings-in-a-url)

  
  
