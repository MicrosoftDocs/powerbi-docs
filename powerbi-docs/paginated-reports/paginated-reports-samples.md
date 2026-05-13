---
title: Sample Power BI Paginated Reports
description: Learn how to download and use sample Power BI paginated reports from GitHub, including invoice, label, mailing letter, transcript, and sales performance templates.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: 'swgupt'
ms.service: powerbi
ms.subservice: report-builder
ms.topic: concept-article
ms.date: 12/01/2025
ai-usage: ai-assisted
---

# Sample Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)]

This article provides information and links to several sample Power BI paginated reports to download and explore. They demonstrate typical ways you can use paginated reports.

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../includes/power-bi-paginated-prerequisites.md)]

Now you're ready to download these sample paginated reports from GitHub. You don't need a GitHub account.

## Download the reports

To successfully download the reports, you need to download the repo as a zip file and then extract the files. Paginated reports are .rdl files.

1. Open the [Reporting Services GitHub repo](https://github.com/microsoft/Reporting-Services).
1. Select the arrow on the green **Code** button > **Download ZIP**.

    :::image type="content" source="media/paginated-reports-samples/paginated-report-download-zip.png" alt-text="Screenshot of the GitHub repo containing the sample Power BI paginated reports." lightbox="media/paginated-reports-samples/paginated-report-download-zip.png":::

1. Open the file, select **Extract all**, and choose a location for the files. By default, the folder name is **Reporting-Services-master**.
1. Open the **Reporting-Services-master** folder, then open the **PaginatedReportSamples** folder.

    >[!NOTE]
    >You can delete all the other folders in the **Reporting-Services-master** folder. They contain other samples you don't need.

1. Select one of the .rdl files to open it in Power BI Report Builder.
1. Now you can [publish the paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md).

## Invoice

:::image type="content" source="media/paginated-reports-samples/paginated-report-invoice.png" alt-text="Screenshot of the sample Power BI paginated report invoice." lightbox="media/paginated-reports-samples/paginated-report-invoice.png":::

This paginated report is a self-contained invoice. The scenario for this report is that you want a print-ready invoice. It needs to show the total sales with details listing item descriptions, quantities, discounts, and cost.

This sample highlights unique characteristics for creating real-world invoices, such as:

- A tablix (the data region underlying both tables and matrixes). It displays dynamically generated user-specific content as well as theme.
- A rectangular data region placed at each row of the tablix of the report body.
- Report items such as text boxes and lines.
- A report parameter to select the content dynamically. The content that is shown applies to a specific subject by using expression placeholders.

Data source: Included in the .rdl file

## Labels

:::image type="content" source="media/paginated-reports-samples/paginated-report-labels.png" alt-text="Screenshot of the sample Power BI paginated report labels." lightbox="media/paginated-reports-samples/paginated-report-labels.png":::

This is a self-contained paginated report sample. It's a multicolumn report perfectly sized to fit the print layout of the mailing label template.

### View the report

When you run this report in Report Builder, it appears to have only one column.

- Select **Print Layout** to see what it looks like when you print it.

    :::image type="content" source="media/paginated-reports-samples/report-builder-print-layout.png" alt-text="Screenshot of the Print Layout option in Report Builder." lightbox="media/paginated-reports-samples/report-builder-print-layout.png":::

Likewise, when you upload this report to the Power BI service and open it, it opens with only one column.

- Select **View** > **Print Layout** to see the multicolumn view.

    :::image type="content" source="media/paginated-reports-samples/paginated-view-print-layout.png" alt-text="Screenshot of the View menu with the Print Layout option." lightbox="media/paginated-reports-samples/paginated-view-print-layout.png":::

### Report characteristics

Label reports are simple, but they have a few unique characteristics that create a paginated label:

- A tablix with a fixed column count of three, with defined column spacing.
- A rectangular data region that repeats across rows and columns on the printed page.
- A report parameter to select the content to show in each rectangular data region.

Data source: Included in the .rdl

## Mailing letter

:::image type="content" source="media/paginated-reports-samples/paginated-report-letter.png" alt-text="Screenshot of the sample Power BI paginated report letter." lightbox="media/paginated-reports-samples/paginated-report-letter.png":::

This self-contained paginated report sample is designed for creating real world mailing letters. The scenario for this report is that you want a print-ready letter with dynamic content.

This sample has unique characteristics, such as:

- A rectangular data region is placed at different sections of the report body.
- Images to personalize the letter.
- A tablix data region (the data region underlying both tables and matrixes). The tablix displays dynamically generated user-specific content.
- Report items such as text boxes and lines.
- A report parameter to select the content dynamically. The content that is shown applies to a specific subject by using expression placeholders.

Data source: Included in the .rdl

## Transcript

:::image type="content" source="media/paginated-reports-samples/paginated-report-transcript.png" alt-text="Screenshot of the sample Power BI paginated report transcript." lightbox="media/paginated-reports-samples/paginated-report-transcript.png":::

The scenario for this report is that you want a print-ready transcript. It needs to contain dynamic content listing program description details and dates for each student.

This self-contained paginated report sample has unique characteristics such as:

- A tablix data region (the data region underlying both tables and matrixes). The tablix displays dynamically generated user-specific content using nested rows groups.
- Rectangular data regions are placed in different sections of the report body.
- Report items such as text boxes and lines.

Data source: Included in the .rdl

## Sales Performance

:::image type="content" source="media/paginated-reports-samples/paginated-report-sales-performance.png" alt-text="Screenshot of the sample Power BI paginated report for Sales Performance." lightbox="media/paginated-reports-samples/paginated-report-sales-performance.png":::

Country Sales Performance is a self-contained paginated report sample. The scenario for this report is that you want a print-ready invoice to see total sales and details. It showcases these features:

- The use of a parameter to expand details in the table.
- Headers and footers.
- Report items such as text boxes, lines, and rectangles that use expression placeholders.
- Data bars.
- Trendlines.
- Gauge panels.

Data source: Included in the .rdl

## Regional Sales

:::image type="content" source="media/paginated-reports-samples/paginated-report-regional-sales.png" alt-text="Screenshot of the sample Power BI paginated report for Regional Sales." lightbox="media/paginated-reports-samples/paginated-report-regional-sales.png":::

Regional Sales is a self-contained paginated report sample. The scenario for this report is that you want a print-ready report to see total sales versus quota. It showcases these features:

- The use of a parameter to show selected details in the table.
- Headers and footers.
- Report items such as text boxes, lines, and rectangles that use expression placeholders.
- Gauge panels.
- Line chart placed inside the table.

Data source: Included in the .rdl

## Organization Expenditures

:::image type="content" source="media/paginated-reports-samples/paginated-report-organization-expenditures.png" alt-text="Screenshot of the sample Power BI paginated report for Organization Expenditures." lightbox="media/paginated-reports-samples/paginated-report-organization-expenditures.png":::

Organization Expenditures is a self-contained paginated report sample. The scenario for this report is that you want a print-ready expense report to see a breakdown of expenses in your organization. It showcases these features:

- Headers and footers.
- Report items such as text boxes, lines, and rectangles that use expression placeholders.
- Charts such as treemap and sunburst.

Data source: Included in the .rdl

## Related content

[View a paginated report in the Power BI service](../explore-reports/paginated-reports-view-power-bi-service.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
