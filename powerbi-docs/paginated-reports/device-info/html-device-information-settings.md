---
title: "HTML Device Information Settings for Power BI paginated reports| Microsoft Docs"
description: Learn about the various device information settings that are available for rendering in HTML format.
ms.date: 01/05/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
---

# HTML Device Information Settings
The following table lists the device information settings for rendering in HTML format.  
  
|Setting|Value|  
|-------------|-----------|  
|**AccessibleTablix**|Indicates whether to render with additional accessibility metadata for use with screen readers. The additional accessibility metadata causes the rendered report to be compliant with the following technical standards in the "Web-based Intranet and Internet Information and Applications" section (1194.22) of the Electronic and Information Technology Accessibility Standards (Section 508) document:<br /><br /> (g) Row and column headers shall be identified for data tables.<br /><br /> (h) Markup shall be used to associate data cells and header cells for data tables that have two or more logical levels of row or column headers.|  
|**BookmarkID**|The bookmark ID to jump to in the report.|  
|**DocMap**|Indicates whether to show or hide the report document map. The default value of this parameter is **true**.|  
|**ExpandContent**|Indicates whether the report should be enclosed in a table structure which constricts horizontal size.|  
|**FindString**|The text to search for in the report. The default value of this parameter is an empty string.|  
|**HTMLFragment**|Indicates whether an HTML fragment is created in place of a full HTML document. An HTML fragment includes the report content in a TABLE element and omits the HTML and BODY elements. The default value is **false**.|  
|**ImageConsolidation**|Indicates whether to consolidate the rendered chart, map, gauge, and indicator images into one large image. The consolidation of images helps improve the performance of the report in the client browser when the report contains many data visualization items. The default value is **true** for most modern browsers.|  
|**JavaScript**|Indicates whether JavaScript is supported in the rendered report. The default value is **true**.|  
|**LinkTarget**|The target for hyperlinks in the report. You can target a window or frame by providing the name of the window, like **LinkTarget**=*window_name*, or you can target a new window using **LinkTarget**=_blank. Other valid target names include _self, _parent, and _top.|  
|**OutlookCompat**|Indicates whether to render with extra metadata that makes the report look better in Outlook. For others, the default value is **false**.|  
|**Parameters**|Indicates whether to show or hide the parameters area of the toolbar. If you set this parameter to a value of **true**, the parameters area of the toolbar is displayed. The default value of this parameter is **true**.|  
|**PrefixId**|When used with **HTMLFragment**, adds the specified prefix to all **ID** attributes in the HTML fragment that is created.|  
|**StyleStream**|Indicates whether styles and scripts are created as a separate stream instead of in the document. The default value is **false**.|  
|**Toolbar**|Indicates whether to show or hide the toolbar. The default of this parameter is **true**. If the value of this parameter is **false**, all remaining options (except the document map) are ignored. If you omit this parameter, the toolbar is automatically displayed for rendering formats that support it.<br /><br /> The Report Viewer toolbar is rendered when you use URL access to render a report. The toolbar is not rendered through the SOAP API. However, the **Toolbar** device information setting affects the way that the report is displayed when using the SOAP **Render** method. If the value of this parameter is **true** when using SOAP to render to HTML, only the first section of the report is rendered. If the value is **false**, the entire HTML report is rendered as a single HTML page.|  
|**UserAgent**|The **user-agent** string of the browser that is making the request, which is found in the HTTP request.|  
|**Zoom (\*)**|The report zoom value as an integer percentage or a string constant. Standard string values include **Page Width** and **Whole Page**. The default value of this parameter is **100**.|  
|**DataVisualizationFitSizing**|Indicates data visualization fit behavior when inside a tablix. This includes chart, gauge, and map.<br /><br /> The possible values are **Approximate** and **Exact**.<br /><br /> The default value is **Approximate**.
<br /><br /> Enabling **Exact** may have performance impact because the processing to determine the exact size may take longer.|  
  
## Next steps

- [Specify Device Information Settings in a URL](/sql/reporting-services/specify-device-information-settings-in-a-url)
