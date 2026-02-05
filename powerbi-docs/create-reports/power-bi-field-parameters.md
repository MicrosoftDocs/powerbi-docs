---
title: Use report readers to change visuals
description: Learn how to let report readers dynamically change the visuals in a report by using field parameters.
author: julcsc
ms.author: juliacawthra
ms.reviewer: jterh
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.custom: video-RE4Y8Jv
ms.topic: how-to
ms.date: 06/12/2025
LocalizationGroup: Reports
#customer intent: As a Power BI customer I want to learn hot to let report readers dynamically change visuals in a report.
---

# Let report readers use field parameters to change visuals

Field parameters allow users to dynamically change the measures or dimensions being analyzed within a report. This feature can help your report readers explore and customize the analysis of the report by selecting the different measures or dimensions they're interested in.

## Video

In the following video, Sujata demonstrates how you create field parameters and how your report users interact with them.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=90081c76-4ff1-446f-b16d-10c644990732]

In the following example, the report reader can dynamically update the bar chart and table by selecting a field in the horizontal slicers above the visuals. Currently, the bar chart and table are measuring COGS and analyzing by Product, based on the reader’s selection in the slicers.

:::image type="content" source="media/power-bi-field-parameters/sample-field-parameter.png" alt-text="Screenshot of example field parameters based on the report reader selection."lightbox="media/power-bi-field-parameters/sample-field-parameter.png":::

## Create a field parameter

1. To create a new field parameter, go to the **Modeling** tab and select **New parameter** > **Fields**.

    :::image type="content" source="media/power-bi-field-parameters/parameter-entry-point.png" alt-text="Screenshot of the Modeling ribbon, showing options under the New parameter dropdown.":::

1. To build the parameter, provide a name for the parameter and select the fields you want to use. In this example, see the selected dimensions **Customer**, **Color**, **Category**, and **Product**.

    :::image type="content" source="media/power-bi-field-parameters/example-parameter-setup.png" alt-text="Screenshot of the Parameters dialog, showing customer, color, category, and product selections.":::

    In this dialog, you can drag to change the order of the fields or double-click any of the selected fields to change the display name.

    You can also mix and match measures and dimensions within the same parameter. For example, you can use this feature to create a dynamic table, where the columns can be either measures or dimensions.

## Use a field parameter to control visual properties

Once you create a field parameter, you can use the parameter to control the measures or dimensions used in a visual.

:::image type="content" source="media/power-bi-field-parameters/using-a-parameter-in-a-visual.png" alt-text="Screenshot of the sample visual, showing the parameter options.":::

You can use the parameter in the field drop zones for a visual. Certain visual properties have restrictions on the number and type of fields that you can use.

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

> [!NOTE]
> Notice how the DAX above defines four fields in the Parameter and for each field three columns are provided: a name, column reference and the order number. While it is possible to define extra columns in the DAX above, this is not supported and can lead to unexpected results. We recommend you define the three columns for each field and use unique values for all columns.

## Persistence of hierarchy level

By default, Power BI will retain the hierarchy level displayed in a matrix as field parameter selections change. This was introduced in July 2025. However, you can turn off this behavior using the **Persist hierarchy level** setting in the report settings to go back to the pre-July 2025 behavior. Here is where to find this option:

- In Power BI Desktop, navigate to Options and settings > Options > Current File > Report settings > Field Parameters > Persist hierarchy level.
- In Fabric, navigate to the report settings and find Persist hierarchy level under Field parameter options.

To illustrate the difference, consider a matrix showing a field parameter called Product Group and a column called Year on the rows, displaying Total sales. The field parameter allows selection of Category, Class, Color, or any combination. In this example, Category is selected, and the Categories are expanded, so you can see values broken down by Year: 

:::image type="content" source="media/power-bi-field-parameters/hierarchy-persistence-example-start.png" alt-text="Screenshot of a matrix showing a Product Group field parameter and Year on rows." lightbox="media/power-bi-field-parameters/hierarchy-persistence-example-start.png":::

Now, when you change the field parameter from Category to Class, what happens depends on the Persist hierarchy level setting. If it's on, the matrix remains expanded, keeping the Year column visible; If it's off, the matrix collapses and displays only values for Class. Below is a comparison showing both behaviors based on whether the toggle is enabled or disabled. 

|Persist hierarchy level setting **on**|Persist hierarchy level setting **off**|
|---|---|
|:::image type="content" source="media/power-bi-field-parameters/hierarchy-persistence-example-setting-on.png" alt-text="Screenshot of a matrix showing a Product Group field parameter and Year on rows. The hierarchy levels are still expanded after the field parameter selection was changed." lightbox="media/power-bi-field-parameters/hierarchy-persistence-example-setting-on.png":::|:::image type="content" source="media/power-bi-field-parameters/hierarchy-persistence-example-setting-off.png" alt-text="Screenshot of a matrix showing a Product Group field parameter and Year on rows. The hierarchy levels are collapsed after the field parameter selection was changed." lightbox="media/power-bi-field-parameters/hierarchy-persistence-example-setting-off.png":::|

## Limitations

- AI visuals and Q&A aren't supported with the feature.
- There's no way for your report users to select the "none" or no fields option. Selecting no fields in the slicer or filter card is the same as selecting all fields.
- You can't create parameters in live connection data sources without a local model. However, if you use DirectQuery for Power BI semantic models and Analysis Services, you can add a local model to create field parameters. For more information about using DirectQuery for live connections, see [Composite models on Power BI semantic models and Analysis Services](../transform-model/desktop-composite-models.md#composite-models-on-power-bi-semantic-models-and-analysis-services).
- You can't use implicit measures, so if you need an aggregated column as one of your fields, you need to create an explicit DAX measure for it. For more information, see [implicit vs. explicit measures](../guidance/star-schema.md#measures).
- You can't use field parameters as the linked fields of a drill-through or tooltip page. The workaround is to use the individual fields referenced within the field parameter instead. For example, if your field parameter includes **Customer** and **Product** fields, you can link these two fields to your drill-through or tooltip page so that visuals with the field parameter can launch your drill-through or tooltip page.

## Considerations

- When using field parameters with Copilot, Copilot will respond based on the current state of the visuals in the report.
- In general, the order in which fields from a Field Parameter are shown in a visual is driven by the order items are selected. If using a [hierarchy slicer](power-bi-slicer-hierarchy-multiple-fields.md) the order is determined by how the fields are shown in the hierarchy slicer instead.

## Related content

For more information take a look at the following articles:

- [Optimize Power BI Desktop](desktop-optimize-ribbon.md)
- [Create page and bookmark navigators](button-navigators.md)
- [Identify and use buttons in the Power BI service](../consumer/end-user-buttons.md)
- [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
