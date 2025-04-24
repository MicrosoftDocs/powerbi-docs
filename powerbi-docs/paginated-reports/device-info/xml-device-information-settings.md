---
title: "XML device information settings for Power BI paginated reports"
description: Learn details about the various device information settings you can use to render Power BI paginated reports in XML format.
ms.date: 01/05/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
---
# XML device information settings for Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  The following table lists the device information settings for rendering Power BI paginated reports in XML format.  

## Settings 

|Setting|Values|Details|  
|-------------|------------|-------------|  
|**MIMEType**|The Multipurpose Internet Mail Extensions (MIME) type of the XML file.||  
|**UseFormattedValues**|**true**<br /><br /> **false**|Indicates whether to render the formatted value of a text box when generating the XML data.<br /><br /> A value of false indicates that the underlying value of the text box is used.|  
|**Indented**|**true**<br /><br /> **false**|Indicates whether to generate indented XML. The default value of **false** generates non-indented, compressed XML.|  
|**OmitNamespace**|**true**<br /><br /> **false**|Indicates whether to omit the default namespace from the XML.<br /><br /> If true, the XML does not specify a default namespace.<br /><br /> If false, the XML specifies a default namespace with the value of the report's DataSchema property. The DataSchema property defaults to the report name.<br /><br /> The default value is **false**.|  
|**OmitSchema**|**true**<br /><br /> **false**|Indicates whether to omit the schema location from the XML. The location is the SchemaLocation attribute.<br /><br /> The default value of OmitSchema depends on the value of OmitNamespace:<br /><br /> If OmitNamespace = False, then OmitSchema = **False** by default. The user can override the default by setting OmitSchema = True.<br /><br /> If OmitNamespace = True, then OmitSchema will function as **True** regardless of the value explicitly configured for OmitShema.|  
|**Encoding**|The Internet Assigned Numbers Authority (IANA) name of a character encoding that is supported by the .NET Framework.|The default value is **UTF-8**. Examples of other values include ASCII, UTF-7, and UTF-16.|  
|**FileExtension**|The file extension to use for the generated file.||  
|**Schema**|A value of **true** indicates that an XML schema is rendered. The default value is **false**.|Indicates whether the XML schema definition (XSD) is rendered or whether the actual XML data is rendered.|  
  
## Next steps

- [Specify Device Information Settings in a URL](/sql/reporting-services/specify-device-information-settings-in-a-url)

  
  
