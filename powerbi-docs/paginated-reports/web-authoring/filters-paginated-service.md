---
title: "Add filters when you create paginated reports in the Power BI service | Microsoft Docs"
description:  Learn how to add filters while you author a paginated report on the service.
ms.date: 10/09/2023
ms.service: powerbi 
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: nirusrin
---

# Add filters when you create paginated reports in the Power BI service

[!INCLUDE [applies-yes-service-no-report-builder-no-desktop](../../includes/applies-yes-service-no-report-builder-no-desktop.md)]

This article introduces you to filtering paginated reports that you author in the Power BI service. This functionality doesn't apply to paginated reports that you author in Power BI Report Builder.  Filters exclude all but the data you want to focus on. When you author the report on the service, you can filter the data using the **Filters** pane on the canvas.

:::image type="content" source="media/filters-paginated-service/paginated-filter-pane.png" alt-text="Screenshot of filter pane for a paginated report." lightbox="media/filters-paginated-service/paginated-filter-pane.png":::

You can filter data at the *report* level, which means that the filter applies to *all* the pages of the report. 

## Add a field or column to the Filters pane

There are two ways to add a column to the Filters pane.

- Add a column to the **Filters** pane by selecting the column from the **Data** pane. Adding the column in this way also adds the field to the editing canvas. 
- Add the column to the **Add data fields** section of the **Filters** pane from the **Data** pane by dragging the column, without selecting the column. Adding the column in this way doesn't add the field to the editing canvas, but you can still filter your report based on this column.

:::image type="content" source="media/filters-paginated-service/paginated-add-data-fields.png" alt-text="Screenshot of area to add data fields." lightbox="media/filters-paginated-service/paginated-add-data-fields.png":::

## Basic and Advanced filtering

You can use either **Basic** or **Advanced** Filtering from the dropdown in the Filter pane. When you select **Basic filtering**, you can select  from the list of all the column values. When you select **Advanced filtering**, you can specify conditions that will determine what's visible on the report.

:::image type="content" source="media/filters-paginated-service/paginated-advanced-basic.png" alt-text="Screenshot of selected values for columns." lightbox="media/filters-paginated-service/paginated-advanced-basic.png":::

You can also search for the value that you are looking for.

:::image type="content" source="media/filters-paginated-service/paginated-search.png" alt-text="Screenshot of searching for filter values." lightbox="media/filters-paginated-service/paginated-search.png":::

## Considerations and limitations

- Once you apply filters on a report that you author in the service, and then you edit it on Power BI Report Builder, you can no longer edit the report in the service.
- You can't search within numeric and date fields in the Filters pane.
- You can't search in fields that are numeric.
- You can add up to two conditions when you use **Advanced filtering**.
- Authors can't make the Filters pane visible to consumers.
- Consumers and viewers of the report can't modify filters. 

## Related content

- [Create exportable paginated reports in the Power BI service](../web-authoring/paginated-formatted-table.md)
