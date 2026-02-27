---
title: Create and use an input slicer
description: Learn how to create and customize an input slicer in Power BI for dynamic data filtering. Follow step-by-step instructions to enhance your reports with interactive text-based filters.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ai-usage: ai-assisted
ms.date: 02/15/2026
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the input slicer feature in Power BI, including how to create and customize it, so I can enhance my reports with interactive filtering options.
---

# Create and use an input slicer

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The input slicer visual in Power BI filters data shown in other visuals on the report using free-form text input. Unlike other slicer visuals that display predefined categories, the input slicer is ideal for typing in or pasting values to filter the report. You can also use the input slicer without a data column to collect input from consumers when used with [translytical task flows](../create-reports/translytical-task-flow-overview.md).

> [!NOTE]
> The input slicer was called "*text slicer*" during preview and is now generally available as the *input slicer*.

## Input slicer modes

The input slicer behaves differently depending on whether you add a data column to it:

### With a data column (filtering mode)

When you add a data column to the input slicer, it functions as a filter. The slicer filters your report visuals based on the entered text strings and the selected filter operator. This mode is ideal for searching and filtering data when you don't know the exact values in advance.

### Without a data column (input mode)

When you don't add a data column to the input slicer, it acts as a pure input control. In this mode, filtering is disabled and the slicer becomes a parameter input mechanism. This configuration is useful for passing parameters to [translytical task flows](../create-reports/translytical-task-flow-button.md), such as comments, annotations, or values for writebacks and approvals.

## Filter operators

The input slicer provides multiple filter operators that control how entered text values match data in your report.

To access filter operators, select the filter operator dropdown on the slicer visual. You can configure whether the dropdown displays as an icon only or shows both the icon and text.

The following filter operators are available:

| Filter operator | Description |
|-----------------|-------------|
| **Contains all** | Returns records that contain all entered text values. |
| **Contains any** | Returns records that contain at least one of the entered text values. This is the default operator. |
| **Does not contain any** | Excludes records that contain any of the entered text values. |
| **Starts with any** | Returns records that start with any of the entered text values. |
| **Does not start with any** | Excludes records that start with any of the entered text values. |
| **Is any** | Returns records that exactly match any of the entered text values. |
| **Is not any** | Excludes records that exactly match any of the entered text values. |

Report creators set the initial filter operator using the dropdown on the visual. When the report is published, consumers can select a different filter operator from the dropdown at any time.

Creators can also configure whether the slicer accepts single or multiple filter values in **Format > Slicer settings > Options**.

## Work with filter pills

When you enter text in an input slicer and press **Enter** or select the apply button, the value converts to a pill. These pills provide a visual representation of your active filters and offer several interactive features:

- **Edit a pill** - Double-click any pill to edit its value. The pill becomes editable, allowing you to modify the filter text directly.
- **Remove a pill** - Select the dismiss (X) button on a pill to remove that filter value.
- **View clustered pills** - When you have many filter values, pills cluster together to save space. Select the cluster to expand and view all individual pills.

## Format the input slicer

You can customize the appearance of many elements in the input slicer to match your report design, including the apply and dismiss buttons. In the **Format** pane under **Visual**:

- **Slicer settings** - Configure options like accepting multiple values.
- **Filter operator** - Control how the filter operator dropdown appears (icon only or icon with text).
- **Apply button** - Expand **Apply button** to access formatting options for the apply button.
- **Input box** - Customize the appearance of the text input area.
- **Filters** - Access formatting options for the dismiss button on filter pills.

You can adjust colors, borders, and other visual properties to ensure the input slicer integrates seamlessly with your report's look and feel.

> [!TIP]
> To hide the apply or dismiss buttons from the visual, set their **Icon size** to 0.

## Create an input slicer

To try the input slicer, you can create a sample table in a blank report. In Power BI Desktop, select **Enter data** from the Home ribbon, or go to **Modeling > New table** and enter the following DAX expression:

```dax
Sample Products = 
DATATABLE(
    "Product", STRING,
    "Sales", INTEGER,
    {
        {"Apple", 150},
        {"Banana", 200},
        {"Cherry", 75},
        {"Date", 50},
        {"Elderberry", 125},
        {"Fig", 90},
        {"Grape", 180}
    }
)
```

To create an input slicer in Power BI:

1. Select the **input slicer** from the **Visualizations** pane and add the data column you want to filter to the visual.

   :::image type="content" source="media/input-slicer/input-slicer-create.png" alt-text="Screenshot showing an input slicer and bar chart with the Sample Products data.":::

1. Type in the value you want to filter to, and use the filter operator dropdown to choose how you want to filter the data column.

   :::image type="content" source="media/input-slicer/input-slicer-filter-operator.png" alt-text="Screenshot showing the filter operator dropdown with options like Contains all, Contains any, and Starts with any.":::

1. Use the **Format** pane to allow multiple filters to be entered and to customize the look and feel of all the elements in the input slicer.

   :::image type="content" source="media/input-slicer/input-slicer-format-pane.png" alt-text="Screenshot showing the Format pane with Slicer settings options including Accept multiple values.":::

## Considerations and limitations

- Report creators control whether the slicer accepts single or multiple filter values in **Slicer settings > Options**.
- The input slicer can only filter text data columns at this time.
- Paste from the context menu isn't available, but you can paste text using keyboard shortcuts (Ctrl+V) when the input box is active.

## Related content

- [List slicer](power-bi-visualization-list-slicer.md)
- [Button slicer](power-bi-visualization-button-slicer.md)
- [Slicers in Power BI](power-bi-visualization-slicers.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
