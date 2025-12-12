---
title: "Export Power BI paginated report to an Image File (Power BI Report Builder) | Microsoft Docs"
description: In Power BI Report Builder, the Image rendering extension renders a Power BI paginated report to a bitmap or metafile. The default is a TIFF file viewable in multiple pages.
ms.date: 12/11/2025
ms.service: powerbi
ms.subservice: report-builder
ms.topic: concept-article
author: JulCsc
ms.author: juliacawthra
ms.reviewer: saurkumar
ai-usage: ai-assisted
---

# Export Power BI paginated report to an image file (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

The Image rendering extension renders a Power BI paginated report to a bitmap or metafile. By default, the Image rendering extension produces a TIFF file of the report, which you can view in multiple pages. When the client receives the image, it can display the image in an image viewer and print it. This article provides Image renderer-specific information and describes exceptions to the rendering rules.  

The Image rendering extension can generate files in any of the formats supported by GDI+: BMP, EMF, EMFPlus, GIF, JPEG, PNG, and TIFF. For the TIFF format, the file name of the primary stream is *ReportName*.tif. For all other formats, which render as a single page per file, the file name is *ReportName_Page.ext* where *.ext* is the file extension for the chosen format. To produce a file in another Image-supported format, specify any of the above listed strings in the **OutputFormatDeviceInfo** setting.  
  
> [!NOTE]  
> You can create and modify paginated report definition (.rdl) files in Power BI Report Builder.
  
## <a name="SupportedImageFormats"></a> Supported image formats

The following table shows the file extension and MimeType for each Image renderer format.  
  
|**Type**|**Extension**|**MIMEType**|  
|--------------|-------------------|------------------|  
|BMP|bmp|image/bmp|  
|GIF|gif|image/gif|  
|JPEG|jpeg|image/jpeg|  
|PNG|png|image/png|  
|TIFF|tif|image/tiff|  
|EMF|emf|image/emf|  
|EMFPlus|emf|image/emf|  
  
## <a name="RenderingMultiplePages"></a> Rendering multiple pages

TIFF is the only format that supports multiple page documents in a single file. Other formats, such as JPEG or PNG, output one page at a time and require a separate call to the rendering extension for each page.  
  
## <a name="Interactivity"></a> Interactivity

This renderer doesn't support interactivity in any generated image formats. The renderer doesn't render the following interactive elements:  
  
- Hyperlinks  
- Show or hide  
- Document map  
- Drillthrough or clickthrough links  
- End user sort  
- Fixed headers  
- Bookmarks  
  
## <a name="DeviceInfo"></a> Device information settings

You can change some default settings for this renderer by changing the device information settings. For more information, see [Image device information settings](../device-info/image-device-information-settings.md).  
  
## Related content

- [Pagination in Reporting Services &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/pagination-in-reporting-services-report-builder-and-ssrs)
- [Rendering Behaviors &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/rendering-behaviors-report-builder-and-ssrs)
- [Interactive Functionality for Different Report Rendering Extensions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/interactive-functionality-different-report-rendering-extensions)
- [Rendering Report Items &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/rendering-report-items-report-builder-and-ssrs)
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../report-builder-tables-matrices-lists.md)
