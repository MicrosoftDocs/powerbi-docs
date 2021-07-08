---
title: Display images in a table or matrix in a report
description: In Power BI Desktop, you create a column with hyperlinks to images. Then in either Power BI Desktop or the Power BI service, add those hyperlinks to a report table, matrix, slicer, or multi-row card to display the image.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 07/02/2021
LocalizationGroup: Visualizations
---
# Display images in a table, matrix, or slicer in a report

A good way to enhance your reports is to add images to them. Static images on the page are good for some purposes. But sometimes you want images that relate to the data in your report. This topic teaches you how to display images in a table, matrix, slicer, or multi-row card. 

![URL images in a table](media/power-bi-images-tables/power-bi-url-images-table.png)

## Add images to your report

1. Create a column with the URLs of the images. See [Considerations](#considerations) later in this article for requirements.

1. Select that column. On the **Column tools** ribbon, for **Data category**, select **Image URL**.

    ![Set Data category to Image URL](media/power-bi-images-tables/power-bi-set-url-image.png)

1. Add the column to a table, matrix, slicer, or multi-row card.

    ![Slicer with images](media/power-bi-images-tables/power-bi-url-images-slicer.png)

## Considerations

- The image needs to be in one of these file formats: .bmp, .jpg, .jpeg, .gif, .png, or  .svg
- The URL needs to be anonymously accessible, not on a site that requires a sign-in, such as SharePoint. However, if images are hosted on SharePoint or OneDrive, you may be able to get an embed code that points directly to them. 


## Next steps

[Page layout and formatting](/learn/modules/visuals-in-power-bi/12-formatting)

[Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
