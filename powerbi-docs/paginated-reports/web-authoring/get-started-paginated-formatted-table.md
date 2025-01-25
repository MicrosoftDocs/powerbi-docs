---
title: "Get started creating paginated reports in the Power BI service"
description: In this article, you learn all the ways your can start creating a paginated report in the Power BI service.
author: kfollis
ms.author: kfollis
ms.reviewer: nisrinivasan
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 09/22/2023
---

# Get started creating paginated reports in the Power BI service

[!INCLUDE [applies-yes-service-no-report-builder-no-desktop](../../includes/applies-yes-service-no-report-builder-no-desktop.md)]

In this article, you learn all the ways your can start creating a paginated report in the Power BI service. You can use the feature to create paginated reports in any workspace in the Power BI service, including workspaces that aren't in a Power BI Premium capacity.

To create a paginated report from the Power BI service, you can start in a number of places:

- [List view in the Power BI service](#list-view-in-the-power-bi-service)
- [Data hub view in the Power BI service](#data-hub-view-in-the-power-bi-service)
- [The Dataset details page in the Power BI service](#the-dataset-details-page-in-the-power-bi-service)
- [Power BI Desktop](#power-bi-desktop)

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../../includes/power-bi-paginated-prerequisites.md)]

## List view in the Power BI service

1. Go to list view for any workspace, including My Workspace.
1. Select **More options (...)** for a Power BI semantic model, then select **Create formatted table**. 

    :::image type="content" source="media/paginated-formatted-table/formatted-table-list-view-1.png" alt-text="Screenshot of Create paginated report in the Power BI service.":::

1. [Create your paginated report](paginated-formatted-table.md).

## Data hub view in the Power BI service

1. Go to Data hub view in the Power BI service.

1. Select **More options (...)** next to a dataset > **Create paginated report**.

    :::image type="content" source="media/paginated-formatted-table/formatted-table-data-hub-1.png" alt-text="Screenshot of Create paginated report in the Data hub.":::

1. [Create your paginated report](paginated-formatted-table.md).

## The Dataset details page in the Power BI service

1. Select a dataset in the Data hub view of the Power BI service.

1. Under **Visualize this data**, select **Create a report** > **Paginated report**.

    :::image type="content" source="media/paginated-formatted-table/formatted-table-dataset-details-create-report-1.png" alt-text="Screenshot of Paginated report on the Dataset details page.":::

1. [Create your paginated report](paginated-formatted-table.md).

## Power BI Desktop

1. Open Power BI Desktop, and on the **Insert** tab, select **Visual gallery**. Scroll down to the **Other** section > select **Paginated report**.

    :::image type="content" source="media/get-started-paginated-formatted-table/create-paginated-desktop-visual-gallery.png" alt-text="creating a paginated report in Power BI Desktop.":::
1. In the visual, select **Create paginated report**.

    :::image type="content" source="media/get-started-paginated-formatted-table/create-paginated-report-desktop.png" alt-text="select Create paginated report.":::

    The Power BI service opens. 

1. In the **Choose the data you want to connect**, filter or browse to the dataset you want, and **Connect**.

    :::image type="content" source="media/get-started-paginated-formatted-table/paginated-choose-data-sevice.png" alt-text="Choose the data you want to connect.":::

1. [Create your paginated report](paginated-formatted-table.md).

## Considerations and limitations

- You can create a paginated report in any workspace.
- You can't create a paginated report from Power BI semantic models based on a live connection.
- The online editor does *not* replicate all existing Power BI Report Builder functionality.  

## Related content

- [Create paginated reports that you can export in the Power BI service](paginated-formatted-table.md)
- [View a paginated report in the Power BI service](../../consumer/paginated-reports-view-power-bi-service.md)
