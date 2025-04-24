---
title: "Add a border to a Power BI paginated report | Microsoft Docs"
description: Define areas of a paginated report by adding borders to the headers, footers, and report body in Power BI Report Builder. 
ms.date: 06/27/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add a border to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can add a border to a Power BI paginated report by adding borders to the headers, footers, and report body themselves, without adding lines or rectangles.
    
 If you add a report border that appears on the page header and footer, do not suppress the header and footer on the first and last pages of the report. If you do, the border might appear cut off at the top or bottom of the first and last pages of the report. For more information, see [Page headers and footers (Power BI Report Builder)](/sql/reporting-services/report-design/page-headers-and-footers-report-builder-and-ssrs).    
    
## To add a border to a report    
    
1. Right-click in the header outside any items in the header, and select **Header Properties**. On the **Border** tab, add a left, top, and right border with the style you want.    
    
    > [!NOTE]    
    >  If your report doesn't have headers, you can place borders around just the report body, or you can add headers from the **Insert** tab.    
    
2. Right-click in the body outside any items on the design surface, and select **Body Properties**. On the **Border** tab, add a left and right border with the style you want.    
    
3. Right-click in the footer outside any items in the footer, and select **Footer Properties**. On the **Border** tab, add a left, bottom, and right border with the style you want.    
    
## Related content

- [Rectangles and lines (Power BI Report Builder)](/sql/reporting-services/report-design/rectangles-and-lines-report-builder-and-ssrs)