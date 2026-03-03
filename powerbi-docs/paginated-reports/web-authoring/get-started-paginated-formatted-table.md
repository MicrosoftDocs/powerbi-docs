---
title: Get Started Creating Paginated Reports in the Power BI Service
description: In this article, you learn all the ways your can start creating a paginated report in the Power BI service.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 12/01/2025
ai-usage: ai-assisted
---

# Get started creating paginated reports in the Power BI service

[!INCLUDE [applies-yes-service-no-report-builder-no-desktop](../../includes/applies-yes-service-no-report-builder-no-desktop.md)]

This article describes how to start creating a paginated report in the Power BI service. Use this feature to create paginated reports in any workspace in the Power BI service, including workspaces that aren't in a Power BI Premium capacity.

> [!IMPORTANT]
> The methods in this article create *new*, standalone paginated reports. You can't add paginated report pages to an existing Power BI report (.pbix file) or convert a Power BI report into a paginated report. Paginated reports and Power BI reports are separate report types with different file formats and capabilities. For ways to use both report types together, see [Use paginated reports with Power BI reports](#use-paginated-reports-with-power-bi-reports).

To create a paginated report from the Power BI service, you can start in a number of places:

- [List view in the Power BI service](#list-view-in-the-power-bi-service)
- [Data hub view in the Power BI service](#data-hub-view-in-the-power-bi-service)
- [The Dataset details page in the Power BI service](#the-dataset-details-page-in-the-power-bi-service)
- [Power BI Desktop](#power-bi-desktop)

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../../includes/power-bi-paginated-prerequisites.md)]

## List view in the Power BI service

1. Go to list view for any workspace, including **My Workspace**.
1. Select **More options (...)** for a Power BI semantic model, and then select **Create formatted table**. 

    :::image type="content" source="media/paginated-formatted-table/formatted-table-list-view-1.png" alt-text="Screenshot of Create paginated report in the Power BI service." lightbox="media/paginated-formatted-table/formatted-table-list-view-1.png":::

1. [Create your paginated report](paginated-formatted-table.md).

## Data hub view in the Power BI service

1. Go to Data hub view in the Power BI service.
1. Select **More options (...)** next to a dataset > **Create paginated report**.

    :::image type="content" source="media/paginated-formatted-table/formatted-table-data-hub-1.png" alt-text="Screenshot of Create paginated report in the Data hub." lightbox="media/paginated-formatted-table/formatted-table-data-hub-1.png":::

1. [Create your paginated report](paginated-formatted-table.md).

## The Dataset details page in the Power BI service

1. Select a dataset in the Data hub view of the Power BI service.
1. Under **Visualize this data**, select **Create a report** > **Paginated report**.

    :::image type="content" source="media/paginated-formatted-table/formatted-table-dataset-details-create-report-1.png" alt-text="Screenshot of Paginated report on the Dataset details page." lightbox="media/paginated-formatted-table/formatted-table-dataset-details-create-report-1.png":::

1. [Create your paginated report](paginated-formatted-table.md).

## Power BI Desktop

1. Open Power BI Desktop, and on the **Insert** tab, select **Visual gallery**. Scroll down to the **Other** section and select **Paginated report**.

    :::image type="content" source="media/get-started-paginated-formatted-table/create-paginated-desktop-visual-gallery.png" alt-text="Screenshot of creating a paginated report in Power BI Desktop." lightbox="media/get-started-paginated-formatted-table/create-paginated-desktop-visual-gallery.png":::
1. In the visual, select **Create paginated report**.

    :::image type="content" source="media/get-started-paginated-formatted-table/create-paginated-report-desktop.png" alt-text="Screenshot of select Create paginated report." lightbox="media/get-started-paginated-formatted-table/create-paginated-report-desktop.png":::

    The Power BI service opens. 

1. In the **Choose the data you want to connect** window, filter or browse to the dataset you want, and select **Connect**.

    :::image type="content" source="media/get-started-paginated-formatted-table/paginated-choose-data-sevice.png" alt-text="Screenshot of Choose the data you want to connect." lightbox="media/get-started-paginated-formatted-table/paginated-choose-data-sevice.png":::

1. [Create your paginated report](paginated-formatted-table.md).

## Use paginated reports with Power BI reports

Although paginated reports and Power BI reports are separate report types that can't be combined into a single file, you can integrate them in your workspace:

- **Publish both reports to the same workspace** in the Power BI service.
- **Link between reports**: Add buttons or links in your Power BI report that open the paginated report, or vice versa. For more information, see [Add a link to a URL in a report](../../create-reports/power-bi-hyperlinks-in-tables.md).
- **Include in an app**: When you publish a workspace as an app, you can include both Power BI reports and paginated reports in the same app for unified distribution.
- **Pin to dashboards**: You can pin visuals from both report types to the same dashboard for a unified view.

By using this approach, you can leverage the strengths of both report types: interactive analysis with Power BI reports and pixel-perfect, printable layouts with paginated reports.  

## Considerations and limitations

- You can create a paginated report in any workspace.
- You can't create a paginated report from Power BI semantic models based on a live connection to SQL Server Analysis Service (SSAS) or Azure Analysis Service (AAS). In this case, you should connect your paginated report directly to the underlying SSAS/AS database.
- The online editor doesn't replicate all existing Power BI Report Builder functionality.

## Related content

- [Create paginated reports that you can export in the Power BI service](paginated-formatted-table.md)
- [View a paginated report in the Power BI service](../../explore-reports/paginated-reports-view-power-bi-service.md)
