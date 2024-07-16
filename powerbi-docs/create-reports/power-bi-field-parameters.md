---
title: Let report readers use field parameters to change visuals (preview)
description: Learn how to let report readers dynamically change the visuals in a report by using field parameters.
author: Sujata994
ms.author: sunaraya
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.custom: video-RE4Y8Jv
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Reports
---
# Let report readers use field parameters to change visuals (preview)
Field parameters allow users to dynamically change the measures or dimensions being analyzed within a report. This feature can help your report readers explore and customize the analysis of the report by selecting the different measures or dimensions they're interested in.

## Video

In the following video, Sujata demonstrates how you create field parameters and how your report users interact with them.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4Y8Jv]

In the following example, the report reader can dynamically update the bar chart and table by selecting a field in the horizontal slicers above the visuals. Currently, the bar chart and table are measuring COGS and analyzing by Product, based on the reader’s selection in the slicers.

:::image type="content" source="media/power-bi-field-parameters/sample-field-parameter.png" alt-text="Screenshot of example field parameters based on the report reader selection."lightbox="media/power-bi-field-parameters/sample-field-parameter.png":::
 
## Enable the field parameter preview

To get started, you first need to enable the **Field parameters** preview feature.

1. In Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Preview features**.
1. Select the **Field parameters**.

    :::image type="content" source="media/power-bi-field-parameters/preview-toggle.png" alt-text="Screenshot of the options dialog, highlighting the Field parameters option.":::

## Create a field parameter

1. To create a new field parameter, go to the **Modeling** tab and select **New parameter** > **Fields**.

    :::image type="content" source="media/power-bi-field-parameters/parameter-entry-point.png" alt-text="Screenshot of the Modeling ribbon, showing options under the New parameter dropdown.":::

1. To build the parameter, provide a name for the parameter and select the fields you want to use. In this example, see the selected dimensions **Customer**, **Color**, **Category**, and **Product**.

    :::image type="content" source="media/power-bi-field-parameters/example-parameter-setup.png" alt-text="Screenshot of the Parameters dialog, showing customer, color, category, and product selections.":::

    In this dialog, you can drag to change the order of the fields or double-click any of the selected fields to change the display name.

    You can also mix and match measures and dimensions within the same parameter. For example, you can use this feature to create a dynamic table, where the columns can be either measures or dimensions.

## Use a field parameter to control visual properties
Once you’ve created a field parameter, you can use the parameter to control the measures or dimensions used in a visual.

:::image type="content" source="media/power-bi-field-parameters/using-a-parameter-in-a-visual.png" alt-text="Screenshot of the sample visual, showing the parameter options.":::

You can use the parameter in the field drop zones for a visual. Note that certain visual properties have restrictions on the number and type of fields that you can use.

From the context menu, you can also choose whether the field parameter shows the values or the display names of the selected field(s). 

- In the **Values** box, select the down arrow next to the parameter name and select **Show selected field**.

    :::image type="content" source="media/power-bi-field-parameters/show-selected-field-setting.png" alt-text="Screenshot showing how to customize if the visual displays the values or the display names of the selected fields.":::

## Edit a field parameter

If you need to edit an existing field parameter, modify the Data Analysis Expressions (DAX) directly.

For example, if you want to add a new field to an existing parameter, select **Shift + Enter** to start a new entry. Add a comma between entries, and match the format shown in this example. The number after the comma indicates the order of the fields:

```dax
Parameter = {
    ("Customer", NAMEOF('Customer'[Customer]), 0),
    ("Category", NAMEOF('Product'[Category]), 1),
    ("Color", NAMEOF('Product'[Color]), 2),
    ("Product", NAMEOF('Product'[Product]), 3)
}
```

:::image type="content" source="media/power-bi-field-parameters/editing-field-parameter-in-dax.png" alt-text="Screenshot of example DAX parameters entered on Power BI.":::

## Limitations

- AI visuals and Q&A aren't supported with the feature.
- There's no way for your report users to select the "none" or no fields option. Selecting no fields in the slicer or filter card is the same as selecting all fields.
- You can't create parameters in live connection data sources without a local model. However, if you use DirectQuery for Power BI semantic models and Analysis Services, you can add a local model to create field parameters. For more information about using DirectQuery for live connections, see [Composite models on Power BI semantic models and Analysis Services](../transform-model/desktop-composite-models.md#composite-models-on-power-bi-semantic-models-and-analysis-services).
- You can't use implicit measures, so if you need an aggregated column as one of your fields, you need to create an explicit DAX measure for it. For more information, see [implicit vs. explicit measures](../guidance/star-schema.md#measures).
- You can't use field parameters as the linked fields of a drill-through or tooltip page. The workaround is to use the individual fields referenced within the field parameter instead. For example, if your field parameter includes **Customer** and **Product** fields, you can link these two fields to your drill-through or tooltip page so that visuals with the field parameter can launch your drill-through or tooltip page.
- When a Field Parameter is used to swap fields in a Visual, the Visual will drop some related information like Sort direction and Drill/Expand state.
