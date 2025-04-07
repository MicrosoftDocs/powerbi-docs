---
title: "Export Power BI paginated report to a PDF File (Power BI Report Builder) | Microsoft Docs"
description: In Power BI Report Builder, the PDF rendering extension renders Power BI paginated reports to files that can be opened in Adobe Acrobat and other third-party PDF viewers.
ms.date: 08/26/2024
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Export Power BI paginated report to a PDF File (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

The PDF rendering extension renders paginated reports to files that can be opened in Adobe Acrobat and other third-party PDF viewers that support PDF 1.3. Although PDF 1.3 is compatible with Adobe Acrobat 4.0 and later versions, Reporting Services supports Adobe Acrobat 11.0 or later. The rendering extension does not require Adobe software to render the report. However, PDF viewers such as Adobe Acrobat are required to view or print a report in PDF format.  
  
 The PDF rendering extension supports ANSI characters and can translate Unicode characters from Japanese, Korean, Traditional Chinese, Simplified Chinese, Cyrillic, Hebrew, and Arabic with certain limitations. For more information about the limitations, see [Export reports &#40;Power BI Report Builder&#41;](export-reports-report-builder.md). The PDF rendering extension also conforms to  ISO 14289-1 (PDF/UA) standards for Accessible PDF. See [PDF rendering extension conformance to ISO 14289-1, Power BI Report Server](/power-bi/report-server/rendering-extension-support) for details. Accessible PDF is supported only on Power BI service.
  
 The PDF renderer is a physical page renderer and, therefore, has pagination behavior that differs from other renderers such as HTML and Excel. This topic provides PDF renderer-specific information and describes exceptions to the rules.  
  
> [!NOTE]  
>  You can create and modify Power BI paginated report definition (.rdl) files in Power BI Report Builder
  
##  <a name="FontRequirements"></a> Font embedding  
 When possible, the PDF rendering extension embeds the subset of each font that is needed to display the report in the PDF file. When the Power BI service generates a report in PDF format, it uses the information stored in the font referenced by the report to create character mappings within the PDF file. If the referenced font is not available in the default set that comes with Windows 11 server OS, the resulting PDF file might not contain the correct mappings and might not display correctly when viewed.  
  
 Fonts are embedded in the PDF file when the following conditions apply:  
  
-   Font embedding privileges are granted by the font author. Installed fonts include a property that indicates whether the font author intends to allow embedding a font in a document. If the property value is EMBED_NOEMBEDDING, the font is not embedded in the PDF file. For more information, see "TTGetEmbeddingType" on msdn.microsoft.com.  
  
-   The Font is TrueType.  
  
-   Fonts are referenced by visible items in a report. If a font is referenced by an item that has the Hidden property set to True, the font is not needed to display rendered data and will not be included in the file. Fonts are embedded only when they are needed to display the rendered report data.  
  
 If all of these conditions are met for a font, the font is embedded in the PDF file. If one or more of these conditions is not met, the font is not embedded in the PDF file.  
  
> [!NOTE]  
>  Although the conditions are met, there is one circumstance under which fonts are not embedded in the PDF file. If the fonts used are the ones in the PDF specification that are commonly known as standard type 1 fonts or the base fourteen fonts, then fonts are not embedded for ANSI content.  
  
  
### Fonts on the client computer  
 When a font is embedded in the PDF file, the computer that is used to view the report (the client computer) does not need to have the font installed for the report to display correctly.  
  
 When a font is not embedded in the PDF file, the client computer must have the correct font installed for the report to display correctly. If the font is not installed on the client computer, the PDF file displays a question mark character (?) for unsupported characters.  
  
### Verifying fonts in a PDF file  
 Differences in PDF output occur most often when a font that does not support non-Latin characters is used in a report and then non-Latin characters are added to the report. You should test the PDF rendering output on both the Power BI service and the client computers to verify that the report renders correctly.  
  
 Don't rely on viewing the report in Preview or exporting to HTML. The report will look correct due to automatic font substitution performed by Power BI Report Builder or by the browser, respectively. If Unicode Glyphs are missing in the default set that comes with Windows 11 server OS, you may see characters replaced with a question mark (?). If a font is missing on the client, you may see characters replaced with boxes (□).  
  
 The fonts that are embedded in the PDF file are included in the Fonts property that is saved with the file, as metadata.
 
Windows 10 and 11 introduced a recommended Universal Windows Platform (UWP) font set that's common across all editions that support UWP, including Desktop, Server, and Xbox. Check this list for supported fonts: [Font list Windows 11 - typography | Microsoft Docs](/typography/fonts/windows_11_font_list#introduction).

> [!IMPORTANT]  
> When using Power BI paginated reports in the Power BI service and exporting to a PDF file, the only fonts supported are those included in the **Introduction** font list of [Font list Windows 11 - typography | Microsoft Docs](/typography/fonts/windows_11_font_list#introduction). 

##  <a name="Metadata"></a> Metadata  
 In addition to the report layout, the PDF rendering extension writes the following metadata to the PDF document information dictionary.  
  
|PDF property|Created from|  
|------------------|------------------|  
|**Title**|The **Name** attribute of the **Report** RDL element.|  
|**Author**|The **Author** RDL element.|  
|**Subject**|The **Description** RDL element.|  
|**Creator**|Reporting Services product name and version.|  
|**Producer**|Rendering extension name and version.|  
|**CreationDate**|Report execution time in PDF **datetime** format.|  
  
  
##  <a name="Interactivity"></a> Interactivity  
 Some interactive elements are supported in PDF. The following is a description of specific behaviors.  
  
### Show and hide  
 Dynamic show and hide elements are not supported in PDF. The PDF document is rendered to match the current state of any items in the report. For example, if the item is displayed when the report is run initially, then the item is rendered. Images that can be toggled are not rendered, if they are hidden when the report is exported.  
  
### Document map  
 If there are any document map labels present in the report, a document outline is added to the PDF file. Each document map label appears as an entry in the document outline in the order that it appears in the report. In Acrobat, a target bookmark is added to the document outline only if the page it is on is rendered.  
  
 If only a single page is rendered, no document outline is added. The document map is arranged hierarchically to reflect the level of nesting in the report. The document outline is accessible in Acrobat under the Bookmarks tab. Clicking an entry within the document outline causes the document to go to the bookmarked location.  
  
### Bookmarks  
 Bookmarks are not supported in PDF rendering.  
  
### Drillthrough links  
 Drillthrough links are not supported in PDF rendering. The drillthrough links are not rendered as clickable links and drillthrough reports cannot connect to the target of the drillthrough.  
  
### Hyperlinks  
 Hyperlinks in reports are rendered as clickable links in the PDF file. When clicked, Acrobat will open the default client browser and navigate to the hyperlink URL.  
  
  
##  <a name="Compression"></a> Compression  
 Image compression is based on the original file type of the image. The PDF rendering extension compresses PDF files by default.  
  
 To preserve any compression for images included in the PDF file when possible, JPEG images are stored as JPEG and all other image types are stored as BMP.  
  
> [!NOTE]  
> - PDF files don't support embedding PNG images.
> - Reporting Services PDF exports don't support CMYK color format images.  
  
  
##  <a name="DeviceInfo"></a> Device information settings  
 You can change some default settings for this renderer by changing the device information settings. For more information, see [PDF device information settings](../device-info/pdf-device-information-settings.md).  
  
  
## Related content

- [Pagination in Reporting Services &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/pagination-in-reporting-services-report-builder-and-ssrs)   
- [Rendering Behaviors &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/rendering-behaviors-report-builder-and-ssrs)   
- [Interactive Functionality for Different Report Rendering Extensions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/interactive-functionality-different-report-rendering-extensions)   
- [Rendering Report Items &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/rendering-report-items-report-builder-and-ssrs)   
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../report-builder-tables-matrices-lists.md)  
  
  
