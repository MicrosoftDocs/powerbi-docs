---
title: "Add a data-bound image to a paginated report"
description: Learn how to reference an image that is stored in a database to display the image in your paginated reports in Power BI Report Builder.
ms.date: 03/31/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---
# Add a data-bound image to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

A paginated report can include a reference to an image that is stored in a database. Such an image is known as a *data-bound image*. The pictures that appear alongside product names in a product list are examples of data-bound images.  
  
Adding a data-bound image to a page header or page footer requires additional steps. For more information, see [Page Headers and Footers &#40;Report Builder and SSRS&#41;](./page-headers-footers-report-builder-service.md).
    
## To add a data-bound image  
  
1.  In report design view, create a table with a data source connection and a dataset with a field that contains binary image data. For more information, see [Tables &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/tables-report-builder-and-ssrs).  
  
2.  Insert a column in your table. For more information, see [Insert or Delete a Column &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/insert-or-delete-a-column-report-builder-and-ssrs).
  
3.  On the **Insert** menu, click **Image**, and then click in the data row of the new column.  
  
4.  On the General page of the **Image Properties** dialog box, type a name in the **Name** text box or accept the default.  
  
5.  (Optional) In the **Tooltip** text box, type text to display when the user hovers over the image in the report rendered for HTML.  
  
6.  In **Select the image source**, select **Database**.  
  
7.  In **Use this Field**, select the field that contains images in your report.  
  
8.  In **Use this MIME type**, select the MIME type, or file format, of the image-for example, bmp.  
  
9.  Select **OK**.
  
     An image placeholder appears on the report design surface.  
  
## Next steps  
 [Images &#40;Power BI Report Builder and service&#41;](./images-report-builder-and-service.md)   
 [Embed an Image in a Report &#40;Power BI Report Builder and service&#41;](./embed-an-image-in-a-report-report-builder-and-service.md)   
 [Add an External Image &#40;Power BI Report Builder and service&#41;](./add-an-external-image-report-builder-and-service.md)   
 
