---
title: "Sample Power BI paginated reports"
description: In this article, you learn about how to download and use sample Power BI paginated reports.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'swgupt'
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 07/19/2021
---

# Sample Power BI paginated reports


[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-service](../includes/yes-service.md)] [!INCLUDE [yes-paginated](../includes/yes-paginated.md)] [!INCLUDE [yes-premium](../includes/yes-premium.md)] [!INCLUDE [no-desktop](../includes/no-desktop.md)]

This article provides information and links to several sample Power BI paginated reports to download and explore. They demonstrate typical ways you can use paginated reports.

## Prerequisites

- You can share these reports online, just as they are, with no editing. To do so, you need a Power BI Pro license. Sign up for a [free trial of a Power BI Pro license](../fundamentals/service-self-service-signup-for-power-bi.md#use-self-service-sign-up-to-start-an-individual-trial-of-power-bi-pro).
- You also need access to a Power BI workspace in a [Premium capacity](../admin/service-premium-what-is.md).
- To edit these reports, you need to [install Power BI Report Builder](https://aka.ms/pbireportbuilder) from the Microsoft Download Center.
- OK, you're ready to download these sample paginated reports from GitHub! You don't need a GitHub account. 

## Download the reports

To download the reports successfully, you need to download the repo as a zip file and then extract them. Paginated reports are .rdl files.

1. Open the [Reporting Services GitHub repo](https://github.com/microsoft/Reporting-Services).
1. Select the arrow on the green **Code** button > **Download ZIP**.

    :::image type="content" source="media/paginated-reports-samples/paginated-report-download-zip.png" alt-text="Screenshot of the GitHub repo containing the sample Power BI paginated reports.":::
    
1. Open the file, select **Extract all**, and choose a location for the files. By default, the folder name is **Reporting-Services-master**.
1. Open the **Reporting-Services-master** folder, then open the **PaginatedReportSamples** folder.

    >[!NOTE]
    >You can delete all the other folders in the **Reporting-Services-master** folder. They contain other samples you don't need.

1. Select one of the .rdl files to open it in Power BI Report Builder.
1. Now you can [publish the paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md).

## Invoice

:::image type="content" source="media/paginated-reports-samples/paginated-report-invoice.png" alt-text="Screenshot of sample Power BI paginated report invoice.":::


This paginated report is a self-contained invoice. The scenario for this report is that you want a pixel-perfect printable invoice. It needs to show the total sales with details listing item descriptions, quantities, discounts, and cost.

This sample highlights unique characteristics for creating real-world invoices, such as:  

- A tablix (the data region underlying both tables and matrixes). It displays dynamically generated user-specific content as well as theme.
- A rectangular data region placed at each row of the tablix of the report body.
- Report items such as text boxes and lines.
- A report parameter to select the content dynamically. The content that is shown applies to a specific subject by using expression placeholders. 

Data source: Included in the .rdl file

## Labels

:::image type="content" source="media/paginated-reports-samples/paginated-report-labels.png" alt-text="Screenshot of sample Power BI paginated report labels.":::

This is a self-contained paginated report sample. It's a multi-column report perfectly sized to fit the print layout of the mailing label template. 

Label reports are simple, but have a few unique characteristics to create a paginated label:

- A tablix with a fixed column count of three, with defined column spacing.
- A rectangular data region that repeats across rows and columns on the printed page.
- A report parameter to select the content to be shown in each rectangular data region.

Data source: Included in the .rdl

## Mailing letter

:::image type="content" source="media/paginated-reports-samples/paginated-report-letter.png" alt-text="Screenshot of sample Power BI paginated report letter.":::

This self-contained paginated report sample is designed for creating real world mailing letters. The scenario for this report is that you want a pixel-perfect printable letter with dynamic content.

This sample has unique characteristics, such as: 

- A rectangular data region is placed at different sections of the report body. 
- Images to personalize the letter. 
- A tablix data region (the data region underlying both tables and matrixes). The tablix displays dynamically generated user-specific content.
- Report items such as text boxes and lines.
- A report parameter to select the content dynamically. The content that is shown applies to a specific subject by using expression placeholders. 

Data source: Included in the .rdl

## Transcript

:::image type="content" source="media/paginated-reports-samples/paginated-report-transcript.png" alt-text="Screenshot of sample Power BI paginated report transcript.":::

The scenario for this report is that you want a pixel-perfect printable transcript. It needs to contain dynamic content listing program description details and dates for each student.

This self-contained paginated report sample has unique characteristics such as: 

- A tablix data region (the data region underlying both tables and matrixes). The tablix displays dynamically generated user-specific content using nested rows groups.
- Rectangular data regions are placed in different sections of the report body.
- Report items such as text boxes and lines.

Data source: Included in the .rdl

## Sales Performance

:::image type="content" source="media/paginated-reports-samples/paginated-report-sales-performance.png" alt-text="Screenshot of sample Power BI paginated report for Sales Performance.":::

Country Sales Performance is a self-contained paginated report sample. The scenario for this report is that you want a pixel-perfect printable invoice to see total sales and details. It showcases these features:

- The use of a parameter to expand details in the table.
- Headers and footers.
- Report items such as text boxes, lines, and rectangles using expression placeholders.
- Data bars.
- Trendlines.
- Gauge panels.

Data source: Included in the .rdl

## Regional Sales

:::image type="content" source="media/paginated-reports-samples/paginated-report-regional-sales.png" alt-text="Screenshot of sample Power BI paginated report for Regional Sales.":::

Regional Sales is a self-contained paginated report sample. The scenario for this report is that you want a pixel-perfect printable report to see total sales vs. quota. It showcases these features:

- The use of a parameter to show selected details in the table.
- Headers and footers.
- Report items such as text boxes, lines, and rectangles using expression placeholders.
- Gauge panels.
- Line chart placed inside the table.

Data source: Included in the .rdl

## Organization Expenditures

:::image type="content" source="media/paginated-reports-samples/paginated-report-organization-expenditures.png" alt-text="Screenshot of sample Power BI paginated report for Organization Expenditures.":::

Organization Expenditures is a self-contained paginated report sample. The scenario for this report is that you want a pixel-perfect printable expense report to see breakdown of expenses in your organization. It showcases these features:

- Headers and footers.
- Report items such as text boxes, lines, and rectangles using expression placeholders.
- Charts such as treemap and sun burst.

Data source: Included in the .rdl
  
## Next steps

[View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
