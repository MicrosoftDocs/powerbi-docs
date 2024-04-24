---
title: "Embed an image in a Power BI paginated report"
description: Make an image readily available to a paginated report. Use an image that's embedded in the report and listed in the Report Data pane of Power BI Report Builder.
ms.date: 04/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---
# Embed an image in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

A Power BI paginated report can include an embedded image. Embedding an image ensures that the image is always available to a report, but can affect the size of the report definition, the file that defines the report. The images embedded in a report are listed in the Report Data pane.  
  
You might want to embed an image in the report definition before adding the image to the design surface. For more information, see [Add a Background Image &#40;Power BI Report Builder&#41;](./add-background-image-report-builder-service.md).

## Embed an image in a report  
  
1. In report design view, on the **Insert** tab, select **Image**.  
  
1. On the design surface, select and then drag a box to the desired size of the image.  
  
1. In the **General** page of the **Image Properties** dialog box, type a name in the **Name** text box or accept the default.  
  
1. (Optional) In the **ToolTip** text box, type the text that you want to appear when the user hovers over the image in the rendered report.  
  
1. In **Select the image source**, select **Embedded**.  
  
1. Select the **Import** button next to the **Use this image** text box.
  
1. In **Files of type**, select the image file type, navigate to the file, and then select **Open**.  
  
1. In the **Image Properties** dialog box, select **OK**.  
  
     The image is displayed in the box you drew on the design surface, and the file is displayed under the Images folder in the Report Data pane.  
  
    > [!NOTE]  
    >  The MIME type (for example, bmp) is derived automatically when the image is imported. To change the MIME type, see the next procedure.  
  
## (optional) Change the MIME type of an imported image  
  
1. Open the report in Design view.  
  
1. Select the image on the design surface. The **Properties** pane displays the image properties.  
  
    > [!NOTE]  
    >  If the Properties pane is not visible, on the **View** tab, select **Properties**.  
  
1. Select in the text box next to the **MIMEType** property and select a new MIME type from the drop-down list.  
  
## Related content

- [Images &#40;Power BI Report Builder and service&#41;](./images-report-builder-service.md)
- [Add a Data-Bound Image &#40;Power BI Report Builder and service&#41;](./add-data-bound-image-report-builder-service.md)