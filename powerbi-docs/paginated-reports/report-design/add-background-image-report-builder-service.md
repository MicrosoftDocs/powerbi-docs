---
title: "Add a background image to a Power BI paginated report"
description: Discover how to embed an image in the paginated report definition to add the image to a variety of report items including text boxes, lists, and page header.
ms.date: 04/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---
# Add a background image to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can add a background image to a Power BI paginated report item such as a rectangle, text box, list, matrix, table, and some parts of a chart, or a report section such as the page header, page footer, or report body. You can define a background image for any selected item on the report design surface that displays **BackgroundImage** in the Properties pane. Like other images, the background image can be a URL to an image on the internet, an image from a dataset field, or an image embedded in the report definition. To use an image embedded in the report, you must first add the image to the report definition before you can add the image to the design surface.  
   
## Embed an image in the report definition  
  
1. In the Report Data pane, right-click the **Images** node, and then select **Add Image**.  
  
    > [!NOTE]  
    >  If the Report Data pane is not visible, on the **View** tab, select **Report Data**.  
  
1. Navigate to the image you want to embed in your report definition, and then select **OK**.  
  
## Add a background image  
  
1. In report design view, select the report item to which you want to add a background image.  
  
1. If the Properties pane is not visible, on the **View** tab, select **Properties**.  
  
1. In the Properties pane, expand **BackgroundImage**, and then do the following:  
  
    - For an embedded image:  
  
         Set **Source** to **Embedded**.  
  
         Set **Value** to the name of an image that is embedded in the report.  
  
    - For an external image:  
  
         Set **Source** to **External**.  
  
         Set **Value** to a valid path to an image that is available without needing authentication or additional sign-in over the internet. For more information, see [Add an External Image &#40;Report Builder and service&#41;](add-external-image-report-builder-service.md).
  
    - For an image that's contained in a field in the database to which the report item is connected:  
  
         Set **Source** to **Database**.  
  
         Set **Value** to the name of a field in the report dataset. For more information, see [Add a Data-Bound Image &#40;Report Builder and service&#41;](add-data-bound-image-report-builder-service.md).
  
         For **MIMEType**, or file format, select the appropriate MIME type for the image-for example, .bmp.  
  
        > [!NOTE]  
        >  MIMEType applies only if the **Source** property is set to **Database**. If the **Source** property is set to **External** or **Embedded**, the value of **MIMEType** is ignored.  
  
    - For **BackgroundRepeat**, select an expression, **Default**, **Repeat**, **RepeatX**, or **RepeatY**, or **Clip**.  
  
         For background images in a chart, **BackgroundRepeat** can be set to **Default**, **Repeat**, **Fit**, and **Clip**, but not **RepeatX** or **RepeatY**.  
  
## Related content

- [Images &#40;Power BI Report Builder and service&#41;](images-report-builder-service.md)
 
