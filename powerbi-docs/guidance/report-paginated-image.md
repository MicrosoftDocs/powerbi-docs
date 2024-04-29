---
title: Image use guidance for paginated reports
description: Guidance for using images in Power BI paginated reports.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/4/2022
---

# Image use guidance for paginated reports

This article targets you as a report author designing Power BI [paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md). It provides suggestions when working with images. Commonly, images in report layouts can display a graphic like a company logo, or pictures.

Images can be stored in three different locations:

- Within the report (embedded)
- On a web server (external)
- In a database, which can be retrieved by a dataset

They can then be used in a variety of scenarios in your report layouts:

- Free-standing logo, or picture
- Pictures associated with rows of data
- Background for certain report items:
  - Report body
  - Textbox
  - Rectangle
  - Tablix data region (table, matrix, or list)

## Suggestions

Consider the following suggestions to deliver professional report layouts, ease of maintenance, and optimized report performance:

- **Use smallest possible size**: We recommend you prepare images that are small in size, yet still look sharp, and crisp. It's all about a balance between quality and size. Consider using a graphics editor (like MS Paint) to reduce the image file size. 
- **Avoid embedded images**: First, embedded images can bloat the report file size, which can contribute to slower report rendering. Second, embedded images can quickly become a maintenance nightmare if you need to update many report images (as might be the case should your company logo change).
- **Use web server storage**: Storing images on a web server is a good option, especially for the company logo, which may be sourced from the company website. However, take care if your report users will access reports outside your network. In this case, be sure that the images are available over the Internet and do not require authentication or additional sign-in to access the image. Images stored on a web server must not exceed 4 MB in size or they will not load in the Power BI service.

    When images relate to your data (like pictures of your salespeople), name image files so a report expression can dynamically produce the image URL path. For example, you could name the salespeople pictures using each salesperson's employee number. Providing the report dataset retrieves the employee number, you can write an expression to produce the full image URL path.
- **Use database storage**: When a relational database stores image data, it makes sense to source the image data directly from the database tables—especially when the images are not too large.
- **Appropriate background images**: If you decide to use background images, take care not to distract the report user from your report data. 

    Also, be sure to use _watermark styled images_. Generally, watermark styled images have a transparent background (or have the same background color used by the report). They also use faint colors. Common examples of watermark styled images include the company logo, or sensitivity labels like "Draft" or "Confidential".

## Related content

For more information related to this article, check out the following resources:

- [What are paginated reports in Power BI?](../paginated-reports/paginated-reports-report-builder-power-bi.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
