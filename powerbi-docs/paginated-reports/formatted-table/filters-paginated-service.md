---
title: "Add filters when you create paginated reports in the Power BI service | Microsoft Docs"
description:  Learn how to add filters while you author a paginated report on the service.
ms.date: 02/21/2023
ms.service: powerbi 
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: nirusrin
---

# Add filters when you create paginated reports in the Power BI service

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-service](../includes/yes-service.md)] [!INCLUDE [no-desktop](../includes/no-desktop.md)]

This article introduces you to filtering paginated reports that you author in the Power BI service. This functionality doesn't apply to paginated reports that you author in Power BI Report Builder.  Filters exclude all but the data you want to focus on. When you author the report on the service, you can filter the data using the **Filters** pane on the canvas.

:::image type="content" source="../media/paginated-formatted-table/paginated-filter-pane.png" alt-text="Screenshot of filter pane for a paginated report.":::

You can filter data at the *report* level, which means that the filter applies to *all* the pages of the report. 

## Add a field/column to the Filters pane

There are two ways to add a column to the Filters pane.

- Add a column to the filter pane by selecting the column from the **Fields** pane. Adding the column in this way also adds the field to the editing canvas. 
- Add the column to the **Add data fields** section of the **Filters** pane from the **Fields** pane by dragging the column, without selecting the column. Adding the column in this way doesn't add the field to the editing canvas, but you can still filter your report based on this column.

:::image type="content" source="../media/paginated-formatted-table/paginated-add-data-fields.png" alt-text="Screenshot of area to add data fields.":::

## Filtering

Filters show a list of all the column values. You can select the value from the list.

:::image type="content" source="../media/paginated-formatted-table/paginated-select-values.png" alt-text="Screenshot of selected values for columns.":::

You can also search for the value that you are looking for.

:::image type="content" source="../media/paginated-formatted-table/paginated-search.png" alt-text="Screenshot of searching for filter values.":::

## Considerations and limitations

- Once you apply filters on a report that you author in the service, and then you edit it on Power BI Report Builder, you can no longer edit the report in the service.
- You can't specify conditions such as greater than, less than, date ranges, and so on, to filter reports yet.
- You can't search within numeric and date fields in the Filters pane.
- You can't search in fields that are numeric.
- Authors can't make the Filters pane visible to consumers.
- Consumers and viewers of the report can't modify filters. 

## Next steps

[Create exportable paginated reports in the Power BI service](../paginated-formatted-table.md)
