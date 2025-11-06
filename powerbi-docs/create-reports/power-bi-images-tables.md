---
title: Display Images in a Table, Matrix, or Slicer in a Report
description: Learn how to create a column with hyperlinks to images in Power BI Desktop and add those hyperlinks to report tables, matrices, slicers, or multi-row cards to display images dynamically based on your data.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Visualizations
---
# Display images in a table, matrix, or slicer in a report

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

You can enhance your Power BI reports by adding images to them. Static images on the page are suitable for some purposes. However, sometimes you want images that relate to the data in your report. This article shows you how to display images in a table, matrix, slicer, or multi-row card.

:::image type="content" source="media/power-bi-images-tables/power-bi-matrix-url-images.png" alt-text="Screenshot of a matrix in Power BI Desktop that shows crop yields by state. Each row lists a crop and an image. Each column lists a state." lightbox="media/power-bi-images-tables/power-bi-matrix-url-images.png":::

## Add images to your report

1. Create a column with the URLs of the images. For image requirements, see [Considerations](#considerations), later in this article.

1. In **Table** view, select that column. On the ribbon, go to the **Column tools** tab. Next to **Data category**, select **Image URL**.

   :::image type="content" source="media/power-bi-images-tables/power-bi-set-url-image.png" alt-text="Screenshot of Table view in Power BI Desktop. A column of image URLs is selected. In the expanded Data category list, Image URL is highlighted." lightbox="media/power-bi-images-tables/power-bi-set-url-image.png":::

1. Add the column to a table, matrix, slicer, or multi-row card.

   :::image type="content" source="media/power-bi-images-tables/power-bi-url-images-card-slicer.png" alt-text="Screenshot of a slicer that lists crop images and a card that shows crop yields. Each card line lists a crop, the yield, and an image of the crop." lightbox="media/power-bi-images-tables/power-bi-url-images-card-slicer.png":::

### Format the images

1. On the canvas, select the visual that contains images.

1. On the **Visualizations** pane, select the paintbrush :::image type="icon" source="media/power-bi-images-tables/paintbrush-icon.png":::, and then go to the **Visual** tab.

1. Expand **Image size**, and then set the **Height** and **Width** values.

   ::image type="content" source="media/power-bi-images-tables/image-size-height-width.png" alt-text="Screenshot of a table visual next to the Visualizations pane. On the pane, the expanded Image size section contains Height and Width settings." lightbox="media/power-bi-images-tables/image-size-height-width.png":::

### Add images from a personal OneDrive storage

Images in your report need to be anonymously accessible. However, for images that are hosted on a personal OneDrive storage, you may be able to get an embed code that points directly to them. The Power BI mobile apps don't support such images, however. For the Power BI mobile apps to be able to display an image, the image URL must be anonymously accessible, regardless of whether or not the image uses an embed code.

1. On your OneDrive site, open an image, select **More** :::image type="icon" source="media/power-bi-images-tables/more-icon.png":::, and then select **Embed**.

    :::image type="content" source="media/power-bi-images-tables/power-bi-onedrive-embed.png" alt-text="Screenshot of an image on OneDrive. The More icon is highlighted. In its shortcut menu, Embed is highlighted.":::

1. Select **Generate**.

    :::image type="content" source="media/power-bi-images-tables/power-bi-onedrive-embed-generate.png" alt-text="Screenshot of the Embed window, highlighting Generate.":::

1. Copy the URL and paste it in the **Image URL** column.

    :::image type="content" source="media/power-bi-images-tables/power-bi-onedrive-embed-copy-url.png" alt-text="Screenshot of the generated embed image URL.":::

## Considerations

- The image needs to be in one of these file formats: .bmp, .jpg, .jpeg, .gif, .png, or .svg
- The URL must be anonymously accessible, not on a site that requires a sign-in, such as SharePoint or OneDrive for work or school.
- The Power BI mobile apps display the image only if the image URL is anonymously accessible. The image cannot be hosted on a site that requires a sign-in, such as SharePoint, even if you can see the image in Power BI Desktop or in the service.

## Related content

- [Page layout and formatting](/training/modules/visuals-in-power-bi/12-formatting)
- [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)
- More questions? [Try the Power BI community](https://community.powerbi.com/)
