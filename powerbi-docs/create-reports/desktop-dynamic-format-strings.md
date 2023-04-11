---
title: Use dynamic format strings in Power BI Desktop
description: Learn how to use dynamic format strings in Power BI Desktop measures.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/2/2022
LocalizationGroup: Create reports
---
# Use custom format strings in Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]


> [!NOTE]
> Dynamic format strings is currently in Preview. When in Preview, functionality and documentation are likely to change.

With *dynamic format strings*, you can conditionally customize how measures appear in visuals by applying a format string with a separate DAX expression. Dynamic format strings overcome an inherent disadvantage of using the FORMAT function. When using FORMAT, the measure keeps its data type and is not forced to change to a string data type. This applies different format strings to the measure depending on the context.

#### To specify a dynamic format string

1. In the **Data** pane, select the measure for which you want to specify a dynamic format string.
1. In the **Measure tools** ribbon > **Formatting** section > **Format** listbox, select **Dynamic**. A new listbox with **Format** already selected appears to the left of the DAX formula bar. This drop down is how you can switch between the static measure DAX expression and the dynamic format string DAX expression. Whatever the static format string was in use before switching to Dynamic is pre-populated as a string in the DAX formula bar.
:::image type="content" source="media/desktop-dynamic-format-strings/format-dropdown.png" alt-text="Format dropdown":::
1. Overwrite the string with a DAX expression that outputs the desired format string for your measure. For example, the following expression looks up the appropriate currency format string from a ‘Country Currency Format Strings’ table:
:::image type="content" source="media/desktop-dynamic-format-strings/format-dynamic-measure.png" alt-text="Dynamic format measure expression":::
1. Verify your dynamic format string works in a visual.

    To delete the dynamic format string and return to using a static format string, in the **Formatting** section > **Format** listbox, select a different format option. Because there is no undo to this action, a dialog appears asking if you want to proceed. If you want to go back to using a dynamic format string again, you must re-enter the DAX expression that outputs the desired format string.
    
    :::image type="content" source="media/desktop-dynamic-format-strings/format-change-warning.png" alt-text="Format change warning":::