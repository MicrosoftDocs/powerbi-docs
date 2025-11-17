---
title: Display Images in a Table, Matrix, or Slicer in a Report
description: Find out how to display images dynamically, based on your data, in tables, matrices, slicers, and multi-row cards in Power BI reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/07/2025
ai-usage: ai-assisted
LocalizationGroup: Visualizations
# customer intent: As a Power BI user, I want to find out how to configure Power BI Desktop to display images, not the URLs of image links, so that I can add dynamic images to my reports.
---
# Display images in a table, matrix, or slicer in a report

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

You can enhance your Power BI reports by adding images to them. Static images on the page are suitable for some purposes. However, sometimes you want dynamic images that relate to the data that's currently displayed in your report.

This article shows you how to display dynamic images in a table, matrix, slicer, or multi-row card.

:::image type="content" source="media/power-bi-images-tables/power-bi-matrix-url-images.png" alt-text="Screenshot of a matrix in Power BI Desktop that shows crop yields by state. Each row lists a crop and an image. Each column lists a state." lightbox="media/power-bi-images-tables/power-bi-matrix-url-images.png":::

## Add images to your report

1. Create a column with the URLs of the images. For image requirements, see [Considerations](#considerations), later in this article.

1. In **Table** view, select that column. On the ribbon, go to the **Column tools** tab. Next to **Data category**, select **Image URL**.

   :::image type="content" source="media/power-bi-images-tables/power-bi-set-url-image.png" alt-text="Screenshot of Table view in Power BI Desktop. A column of image URLs is selected. In the expanded Data category list, Image URL is highlighted." lightbox="media/power-bi-images-tables/power-bi-set-url-image.png":::

1. Add the column to a table, matrix, slicer, or multi-row card.

   :::image type="content" source="media/power-bi-images-tables/power-bi-url-images-card-slicer.png" alt-text="Screenshot of a slicer that lists crop images and a card that shows crop yields. Each card line lists a crop, the yield, and an image of the crop." lightbox="media/power-bi-images-tables/power-bi-url-images-card-slicer.png":::

### Format the images

1. On the report canvas, select the visual that contains images.

1. On the **Visualizations** pane, select the paintbrush :::image type="icon" source="media/power-bi-images-tables/paintbrush-icon.png":::, and then go to the **Visual** tab.

1. Expand **Image size**, and then set the **Height** and **Width** values.

   :::image type="content" source="media/power-bi-images-tables/image-size-height-width.png" alt-text="Screenshot of a table visual next to the Visualizations pane. On the pane, the expanded Image size section contains Height and Width settings." lightbox="media/power-bi-images-tables/image-size-height-width.png":::

### Add images from OneDrive for home

Images in your report need to be anonymously accessible.

Exceptions to this rule are images that are hosted on OneDrive for home. You can sometimes generate an embed code that points directly to a OneDrive for home image. The image can then appear in Power BI Desktop or the Power BI service, even though it isn't anonymous.

Power BI mobile apps don't support such images. For the Power BI mobile apps to be able to display an image, the image URL must be anonymously accessible.

1. On your OneDrive site, locate the image that you want to add to a report. Next to the image name, select **More Actions** :::image type="icon" source="media/power-bi-images-tables/more-actions-icon.png":::, and then select **Embed**.

   :::image type="content" source="media/power-bi-images-tables/power-bi-onedrive-embed.png" alt-text="Screenshot of a OneDrive for home folder. Next to an image file, the More Actions icon is highlighted. In its shortcut menu, Embed is highlighted." lightbox="media/power-bi-images-tables/power-bi-onedrive-embed.png":::

1. Select **Generate**.

   :::image type="content" source="media/power-bi-images-tables/power-bi-onedrive-embed-generate.png" alt-text="Screenshot of the Embed window. Text states that no sign-in is needed to view the image via the embed code. The Generate button is highlighted." lightbox="media/power-bi-images-tables/power-bi-onedrive-embed-generate.png":::

1. Select **Copy embed code**, and then paste the URL in the **Image URL** column.

   :::image type="content" source="media/power-bi-images-tables/power-bi-onedrive-embed-copy-url.png" alt-text="Screenshot of the Embed window that shows an image of farmland and a URL. The Copy embed code button is highlighted." lightbox="media/power-bi-images-tables/power-bi-onedrive-embed-copy-url.png":::

## Considerations

- The image needs to be in one of these file formats: BMP, JPG, JPEG, GIF, PNG, or SVG.
- The URL must be anonymously accessible. It can't lead to a site that requires a sign-in, such as SharePoint or OneDrive for work or school.
- The Power BI mobile apps display the image only if the image URL is anonymously accessible. The image can't be hosted on a site that requires a sign-in, such as SharePoint, even if you can access the image in Power BI Desktop or in the service.

## Related content

- [Enhance Power BI report designs for the user experience](/training/modules/power-bi-effective-user-experience/)
- [Basics of the Power BI service](../fundamentals/service-basic-concepts.md)
- [Power BI forums](https://community.fabric.microsoft.com/t5/Power-BI-forums/ct-p/powerbi/)
