---
title: "Create parameters for paginated reports in the Power BI service"
description: In this article, you learn how to create parameters for a paginated report using the interactive editor in the Power BI service.
author: maggiesMSFT
ms.author: nisrinivasan
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 06/24/2024
---

# Create parameters for paginated reports that you create in the Power BI service
[!INCLUDE [applies-yes-service-no-report-builder-no-desktop](../../includes/applies-yes-service-no-report-builder-no-desktop.md)]


You can use the feature to create paginated reports in any workspace in the Power BI service, including workspaces that aren't in a Power BI Premium capacity.

This article introduces you to defining parameters for paginated reports that you author in the Power BI service. This functionality doesn't apply to paginated reports that you author in Power BI Report Builder. You can use filters and parameters in the report that you author. However, a field **cannot be both** a filter and a parameter.  

## Prerequisites
See the Prerequisites section of [Get started creating paginated reports in the Power BI service](get-started-paginated-formatted-table#prerequisites).

## Create parameters

1. To create/define a parameter, you must have a field in the **Filters** pane.

:::image type="content" source="media/paginated-formatted-table/paginated-field-in-filter-pane.png" alt-text="Screenshot of fields in filter pane.":::

2. Select **Create parameter** under More options **(...)** in the Filters pane.

   :::image type="content" source="media/paginated-formatted-table/paginated-create-parameter.png" alt-text="Screenshot to create parameter.":::

3. This will promote the field as a parameter which will appear in the **Preview** portion of the screen.

:::image type="content" source="media/paginated-formatted-table/paginated-create-parameter-preview.png" alt-text="Screenshot of parameters in the Preview pane.":::

4. You can create several paramters by repeating the steps described above.

:::image type="content" source="media/paginated-formatted-table/paginated-create-multiple-parameters-preview.png" alt-text="Screenshot of multiple parameters in the Preview pane.":::

## Save report

To save the report with parameters, select **Save** in the File menu.

## Remove parameters

To remove a paramter, click on more options **(...)** and Remove paramter in the Filter pane.

:::image type="content" source="media/paginated-formatted-table/paginated-remove-parameter-preview.png" alt-text="Screenshot of remove parameters in the Preview pane.":::
 
 ## Considerations and Limitations

1. You can't define default or hidden parameters for paginated reports create on the Power BI service.
2. Cascading parameters are not supported.
3. Once a field has been promoted to a paramter, you can't use it as a filter.  
 


