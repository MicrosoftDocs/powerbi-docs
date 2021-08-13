---
title: "URL parameters in paginated reports - Power BI Report Builder"
description: Learn how to send commands to paginated reports in Power BI by adding a parameter to a URL, which you can include in an email or Web page.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.reviewer: "cfinlan"
ms.custom: ""
ms.date: 12/15/2020
---

# URL parameters in paginated reports in Power BI

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] 

You can send commands to paginated reports in Power BI by adding a parameter to a URL. For example, you may have viewed the report using a specific set of report parameter values. You encapsulate this information in the URL by using predefined URL access parameters. You further customize how Power BI processes the report by embedding parameters for rendering formats, or for the look and feel of the report toolbar. You then paste this URL directly into an email or Web page so others experience your report in the same manner in the browser. 

Here are actions you can perform through URL access parameters: 

- Send report parameters to a report. 
- Initiate the export of the report content in a supported file format. 
- Hide or view the parameters pane. 
- Specify DeviceInfo setting. 

For the complete list of commands and settings available through URL access, see [URL access parameter reference](#url-access-parameter-reference) later in this article. 

## URL access concepts 

URL requests to Power BI contain parameters that are processed by the service. The way in which the service handles URL requests depends on the parameters, parameter prefixes, and types of items that are included in the URL. Paginated report URL functionality is compatible with most browsers and applications that support standard URL addressing. 

## URL access syntax 

URL requests can contain multiple parameters, listed in any order. Parameters are separated by an ampersand (&). Name and value pairs are separated by an equal sign (=). For example:

```
powerbiserviceurl?rp:parametervalueh&rdl:parameter=value  
```

## Syntax description 

### powerbiserviceurl 

The Web service URL of your Power BI tenant. For example: 

**&**
Used to separate name and value pairs of URL access parameters.

**prefix**
A prefix for the URL parameter (for example, rp: or rdl:) that specifies an action in the Power BI service. 

> [!NOTE]
> Report parameters require a parameter prefix and are case-sensitive. 

**parameter** 
The parameter name. 

### value 

URL text corresponding to the value of the parameter being used. 

For examples of passing report parameters on the URL, see [Pass a report parameter in a URL](report-builder-url-pass-parameters.md).

## URL access parameter reference

You can use the following parameters as part of a URL to configure the look and feel of your paginated reports in Power BI. The most common parameters are listed in this section. Parameters are case-insensitive and begin with the parameter prefix `rdl:` if related to the output format.  

### Report commands (`rdl:`) 

**Export format**
Specifies the format in which to render and export a report.

Example: rdl:format=PDF

Available values are:
 
- PPTX (PowerPoint)
- MHTML 
- IMAGE 
- EXCELOPENXML (EXCEL) 
- WORDOPENXML (WORD) 
- CSV 
- PDF 
- ACCESSIBLEPDF (PDF)
- XML 

**Report View**
Specifies the type of view use to displayed the report.

-	rdl:reportView

    - 'interactive' (default): load the report in interactive mode.
    - 'pageView': load the report in page view mode.

**Parameter panel**
Specifies whether the parameter panel is closed or open when the report loads, or is hidden altogether.

-	rdl:parameterPanel

    - 'collapsed': load the report with parameter panel closed. The parameter button is enabled so that users can click the button to expand;
    - 'hidden': load the report with parameter panel closed and the parameter button disabled;
    - 'expanded' (default): load the report with parameter panel open and the parameter button enabled;

**Device Info**
You may specify additional output parameters for the following export formats. 

PDF / ACCESSIBLEPDF:

- rdl:AccessiblePDF=true/false
- rdl:Columns=integer
- rdl:ColumnSpacing=decimal(in)
- rdl:DpiX=integer
- rdl:DpiY=integer
- rdl:EndPage=integer
- rdl:HumanReadablePDF=true/false
- rdl:MarginBottom=decimal(in)
- rdl:MarginLeft=decimal(in)
- rdl:MarginRight=decimal(in)
- rdl:MarginTop=decimal(in)
- rdl:PageHeight=decimal(in)
- rdl:PageWidth=decimal(in)
    - rdl:StartPage=integer
    
CSV:

- rdl:Encoding=string
- rdl:ExcelMode=true/false
- rdl:FieldDelimiter=string
- rdl:NoHeader=true/false
- rdl:Qualifier=string
- rdl:RecordDelimiter=string
- rdl:SuppressLineBreaks=true/false
    - rdl:UseFormattedValues=true/false
    
WORDOPENXML (WORD):

- rdl:AutoFit=string -> True/False/Never/Default
- rdl:ExpandToggles=true/false
- rdl:FixedPageWidth=true/false
- rdl:OmitHyperlinks=true/false
- rdl:OmitDrillthroughs=true/false

EXCELOPENXML (EXCEL):

- rdl:OmitDocumentMap=true/false
- rdl:OmitFormulas=true/false
    - rdl:SimplePageHeaders=true/false
    
PPTX (PowerPoint):
 
- rdl:Columns=integer
- rdl:ColumnSpacing=decimal(in)
- rdl:DpiX=integer
- rdl:DpiY=integer
- rdl:EndPage=integer
- rdl:MarginBottom=decimal(in)
- rdl:MarginLeft=decimal(in)
- rdl:MarginRight=decimal(in)
- rdl:MarginTop=decimal(in)
- rdl:PageHeight=decimal(in)
- rdl:PageWidth=decimal(in)
- rdl:StartPage=integer
    - rdl:UseReportPageSize=true/false

XML:

- rdl:UseFormattedValues=true/false
- rdl:Indented=true/false
- rdl:OmitNamespace=true/false
- rdl:OmitSchema=true/false
- rdl:Encoding=string
- rdl:Schema=true/false

**Open hyperlink in same browser window**
You can append 'rdl:targetSameWindow=true' to the hyperlink URL in your report to make Power BI to open this hyperlink in the same browser window. For information on adding hyperlinks to a report, see [Add a hyperlink to a URL](/sql/reporting-services/report-design/add-a-hyperlink-to-a-url-report-builder-and-ssrs) in the SQL Server Reporting Services documentation.

## Next steps

- [Pass a report parameter in a URL for a paginated report in Power BI](report-builder-url-pass-parameters.md)
- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)
