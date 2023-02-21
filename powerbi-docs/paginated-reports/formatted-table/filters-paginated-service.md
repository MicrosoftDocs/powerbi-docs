---
title: "Use filters and create paginated reports on the Power BI Service | Microsoft Docs"
description:  Learn how to add filters while authoting a paginated report on the service.
ms.date: 02/17/2023
ms.service: powerbi 
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: nirusrin
---

***Use filters and create paginated reports on the Power BI Service ***

This article introduces you to filtering paginated reports which are authored on the service. This does not apply to paginated reports authored on Power BI Report Builder.  Filters exclude all but the data you want to focus on. When you author the report on the service, you can filter the data using the “Filters” pane on the canvas.

:::image type="content" source="../media/paginated-filter-pane.png" alt-text="Screenshot of filter pane":::

You can filter data at a “Report” level. This means that the filter will apply to all pages of the report. 

***Adding a field/column to the filter pane***
You can add a column to the filter pane by selecting the column from the “Fields” pane. Doing this will also add the field to the editing canvas. Alternately, you can also add the column from the “Fields” pane by dragging the column to the “Add data fields” section of the “Filters” pane (without selecting the column). Doing this will not add the field to the editing canvas, however you can still filter your report based on this column.

:::image type="content" source="../media/paginated-add-data-fields.png" alt-text="Screenshot of area to add data fields":::

***Filtering***
Filters show a list of all the column values. You can select the value from the list.

:::image type="content" source="../media/paginated-select-values.png" alt-text="Screenshot of selected values for columns":::

You can also search for the value that you are looking for.

:::image type="content" source="../media/paginated-search.png" alt-text="Screenshot of searching for filter values":::

***Limitations***
  - Once filters are applied on a report authored on the service and you edit it on Power BI Report Builder, the report cannot be edited on the service.
  - You cannot specify conditions such as greater than, lesser than, date ranges etc. to filter reports yet.
  - You cannot search within numeric and date fields in the filter pane.
  - You cannot search in fields that are numeric.
  - Authors cannot make the filter pane visible to consumers.
  - Consumers/ Viewers of the report cannot modify filters. 

