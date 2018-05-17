---
title: Conditional table formatting in Power BI Desktop
description: Apply customized formatting to tables
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 05/08/2018
ms.author: davidi

LocalizationGroup: Create reports
---
# Conditional formatting in tables
With conditional formatting for tables, you can specify customized cell background colors based on cell values, or based on other values or fields, and you can use gradient colors. To access conditional formatting, in the **Fields** well of the **Visualizations** pane in Power BI Desktop, select the down-arrow beside the value in the **Values** well that you want to format (or right-click the field). You can only manage conditional formatting for fields in the **Values** area of the **Fields** well.

![conditional table formatting](media/desktop-conditional-table-formatting/table-formatting_1.png)

In the dialog that appears, you can configure the color, as well as the *Minimum* and *Maximum* values. If you select the **Diverging** box, you can configure an optional *Center* value as well.

![diverging colors](media/desktop-conditional-table-formatting/table-formatting_2.png)

You can also base the color gradient on a field from your data model. In addition, you can specify the aggregation type for the selected field (the field selected is specified in the **Apply color to** field, so you can keep track).

![base colors off a field](media/desktop-conditional-table-formatting/table-formatting_2b.png)

When applied to a table, the customized formatting applied using the steps outlined above overrides any custom table styles applied to the conditionally formatted cells.

![table formatting](media/desktop-conditional-table-formatting/table-formatting_3.png)

You can also apply conditional formatting to text and date fields, as long as you choose a numeric value as the basis of the formatting. 

To remove conditional formatting from a visualization, just right-click the field again, and select **Remove Conditional Formatting**.

![remove table formatting](media/desktop-conditional-table-formatting/table-formatting_4.png)

