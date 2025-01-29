---
title: "Add or remove a page header or footer in a paginated report"
description: Find out how you can add static text, images, lines, rectangles, and borders to paginated report page headers or footers in Power BI Report Builder.
ms.date: 03/22/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---

# Add or remove a page header or footer in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can add static text, images, lines, rectangles, and borders to paginated report page headers or footers. You can place expressions and data-bound images in a textbox if you want variable or computed data in a header or footer.  
  
> [!NOTE]  
> Each rendering extension processes page headers and footers differently. For more information, see [Page Headers and Footers &#40;Report Builder)](./page-headers-footers-report-builder-service.md) and [Pagination in Reporting Services &#40;Report Builder  and SSRS&#41;](/sql/reporting-services/report-design/pagination-in-reporting-services-report-builder-and-ssrs).
  
## Add a page header or footer  
  
1. Open a report in Power BI Report Builder.  
  
1. On the design surface, right-click the report, point to **Insert**, and then select **Header** or **Footer**.  
  
> [!NOTE]  
> The **Header** and **Footer** options appear only when a header or footer is not already part of the report.  
  
## Configure a page header or footer  
  
1. On the design surface, right-click the page header or footer.  
  
1. Point to **Insert**, and then select one of the following items to add it to the header or footer area:  
  
    - **Textbox**
    - **Line**
    - **Rectangle**  
    - **Image**  
  
1. Right-click the page header, and then select **Header Properties** to add borders, background images, or colors, or to adjust the width of the header. Then select **OK**.  
  
1. Right-click the page footer, and then select **Footer Properties** to add borders, background images, or colors, or to adjust the width of the footer. Then select **OK**.  
  
## Remove a page header or footer  
  
1. Open the report in Power BI Report Builder.  
  
1. On the design surface, right-click the page header or footer, and then select **Delete**.  
  
> [!NOTE]  
> When you remove a page header or footer, you delete it from the report. Any items that you previously added to the page header or footer will not reappear if you subsequently add the header or footer again.  
  
## Related content

- [Page headers and footers in a paginated report](page-headers-footers-report-builder-service.md)  
  
  
