---
title: "URL parameters in paginated reports - Power BI Report Builder"
description: This topic describes the common uses for Power BI Paginated Report Builder report parameters, the properties you can set, and much more.
ms.service: powerbi
ms.subservice: report-builder
ms.custom: 
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ""
ms.custom: ""
ms.date: 08/28/2019
---

# URL Parameters – paginated reports 

You can send commands to paginated reports in Power BI by adding parameter to a URL. For example, you may have viewed the report using a specific set of report parameter values. You can encapsulate this information in the URL using predefined URL access parameters. You can further customize how Power BI processes the report by embedding parameters for rendering formats or for the look and feel of the report toolbar. You can then paste this URL directly into an email or Web page to let others to access your report in the same manner in the browser. 

Here are the actions you can perform through URL access: 

- Send report parameters to a report. 
- Initiate the export of the report content in a supported file format. 
- Hide/View the parameters pane. 
- Specify DeviceInfo setting. 

For the complete list of commands and settings available through URL access, see URL Access Parameter Reference. 

## URL Access Concepts 

URL requests to Power BI contain parameters that are processed by the service. The way in which the service handles URL requests depends on the parameters, parameter prefixes, and types of items that are included in the URL. Paginated reports URL functionality is compatible with most Internet browsers or applications that support standard URL addressing. 

## URL Access Syntax 

URL requests can contain multiple parameters, listed in any order. Parameters are separated by an ampersand (&). Name/value pairs are separated by an equal sign (=). For example:

```
powerbiserviceurl?rp:parametervalueh&rdl:parameter=value  
```

## Syntax Description 

```
powerbiserviceurl 
```
The Web service URL of the report server. For native mode, it is the Web service URL of the report server instance configured in Reporting Services Configuration Manager (see Configure Report Server URLs (SSRS Configuration Manager)). For example: 

### &
 
Used to separate name and value pairs of URL access parameters. 

### prefix
 
A prefix for the URL parameter (for example, rp: or rdl:) that specifies a specific action in the Power BI service. 

> [!NOTE]
> Report parameters require a parameter prefix and are case-sensitive. 

### parameter 
The parameter name. 

```
value 
```

URL text corresponding to the value of the parameter being used. 

> [!NOTE]
> For examples passing report parameters on the URL, see Pass a Report Parameter Within a URL.    

## Next steps

- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)  
 
 
