---
title: "Use Field Parameters in Power BI Reports"
description: Learn how to use field parameters in Power BI to let report readers dynamically change measures or dimensions in visuals. Explore how to create, edit, and configure field parameters.
author: julcsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.custom: video-RE4Y8Jv
ms.topic: how-to
ms.date: 06/09/2026
ai-usage: ai-assisted
LocalizationGroup: Reports
#customer intent: As a Power BI customer, I want to learn how to let report readers dynamically change visuals in a report.
---

# Use field parameters to let report readers change visuals

Field parameters in Power BI let report readers dynamically change the measures or dimensions they're analyzing in a report. Readers can explore and customize the analysis by selecting different measures or dimensions from a slicer.

In the following video, learn how to create field parameters in Power BI Desktop and how report readers interact with them.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=90081c76-4ff1-446f-b16d-10c644990732]

In the following example, the report reader can dynamically update the bar chart and table by selecting a field in the horizontal slicers above the visuals. Currently, the bar chart and table are measuring cost of goods sold (COGS) and analyzing by Product, based on the reader's selection in the slicers.

:::image type="content" source="media/power-bi-field-parameters/sample-field-parameter.png" alt-text="Screenshot of a Power BI report with field parameter slicers showing cost of goods sold by product in a bar chart and table." lightbox="media/power-bi-field-parameters/sample-field-parameter.png":::

## Prerequisites

- Power BI Desktop

## Create a field parameter

1. To create a new field parameter, go to the **Modeling** tab and select **New parameter** > **Fields**.

    :::image type="content" source="media/power-bi-field-parameters/parameter-entry-point.png" alt-text="Screenshot of the Modeling ribbon in Power BI Desktop showing the New parameter dropdown with Fields option.":::

1. To build the parameter, provide a name for the parameter and select the fields you want to use. In this example, see the selected dimensions **Customer**, **Color**, **Category**, and **Product**.

    :::image type="content" source="media/power-bi-field-parameters/example-parameter-setup.png" alt-text="Screenshot of the field parameter setup dialog showing Customer, Color, Category, and Product field selections.":::

    In this dialog, you can drag to change the order of the fields or double-click any of the selected fields to change the display name.

    You can also mix and match measures and dimensions within the same parameter. For example, create a dynamic table where the columns can be either measures or dimensions.

## Use a field parameter to control visual properties

After you create a field parameter, use the parameter to control the measures or dimensions used in a visual.

:::image type="content" source="media/power-bi-field-parameters/using-a-parameter-in-a-visual.png" alt-text="Screenshot of the sample visual, showing the parameter options.":::

Use the parameter in the field drop zones for a visual. Certain visual properties have restrictions on the number and type of fields that you can use.

From the context menu, you can also choose whether the field parameter shows the values or the display names of the selected fields.

- In the **Values** box, select the down arrow next to the parameter name and select **Show selected field**.

    :::image type="content" source="media/power-bi-field-parameters/show-selected-field-setting.png" alt-text="Screenshot showing how to customize if the visual displays the values or the display names of the selected fields.":::

## Edit a field parameter

To edit an existing field parameter, modify the Data Analysis Expressions (DAX) directly.

For example, if you want to add a new field to an existing parameter, select **Shift + Enter** to start a new entry. Add a comma between entries, and match the format shown in this example. The number after the comma indicates the order of the fields:

```dax
Parameter = {
    ("Customer", NAMEOF('Customer'[Customer]), 0),
    ("Category", NAMEOF('Product'[Category]), 1),
    ("Color", NAMEOF('Product'[Color]), 2),
    ("Product", NAMEOF('Product'[Product]), 3)
}
```

:::image type="content" source="media/power-bi-field-parameters/editing-field-parameter-in-dax.png" alt-text="Screenshot of the DAX editor showing a field parameter definition with Customer, Category, Color, and Product fields.":::

> [!NOTE]
> The DAX defines four fields in the parameter, and for each field, three columns are provided: a name, column reference, and the order number. Although you can define extra columns in the DAX, this feature isn't supported and can lead to unexpected results. Define three columns for each field and use unique values for all columns.

## Configure hierarchy-level persistence for field parameters

By default, Power BI retains the hierarchy level displayed in a matrix as field parameter selections change. You can turn off this behavior by using the **Persist hierarchy level** setting in the report settings. To find this option:

- In Power BI Desktop, go to **Options and settings** > **Options** > **Current File** > **Report settings** > **Field Parameters** > **Persist hierarchy level**.
- In Microsoft Fabric, go to the report settings and find **Persist hierarchy level** under **Field parameter options**.

To illustrate the difference, consider a matrix showing a field parameter called Product Group and a column called Year on the rows, displaying Total sales. The field parameter allows selection of Category, Class, Color, or any combination. In this example, Category is selected, and the Categories are expanded, so you can see values broken down by Year: 

:::image type="content" source="media/power-bi-field-parameters/hierarchy-persistence-example-start.png" alt-text="Screenshot of a matrix showing a Product Group field parameter and Year on rows." lightbox="media/power-bi-field-parameters/hierarchy-persistence-example-start.png":::

Now, when you change the field parameter from Category to Class, what happens depends on the Persist hierarchy level setting. If it's on, the matrix remains expanded, keeping the Year column visible; if it's off, the matrix collapses and displays only values for Class. The following comparison shows both behaviors based on whether the toggle is enabled or disabled. 

|Persist hierarchy level setting **on**|Persist hierarchy level setting **off**|
|---|---|
|:::image type="content" source="media/power-bi-field-parameters/hierarchy-persistence-example-setting-on.png" alt-text="Screenshot of a matrix with expanded hierarchy levels after changing the field parameter." lightbox="media/power-bi-field-parameters/hierarchy-persistence-example-setting-on.png":::|:::image type="content" source="media/power-bi-field-parameters/hierarchy-persistence-example-setting-off.png" alt-text="Screenshot of a matrix with collapsed hierarchy levels after changing the field parameter." lightbox="media/power-bi-field-parameters/hierarchy-persistence-example-setting-off.png":::|

## Known limitations of field parameters

- AI visuals and Q&A aren't supported with field parameters.
- There's no way for your report users to select the "none" or no fields option. Selecting no fields in the slicer or filter card is the same as selecting all fields.
- You can't create parameters in live connection data sources without a local model. However, if you use DirectQuery for Power BI semantic models and Analysis Services, you can add a local model to create field parameters. For more information about using DirectQuery for live connections, see [Composite models on Power BI semantic models and Analysis Services](../transform-model/desktop-composite-models.md#composite-models-on-power-bi-semantic-models-and-analysis-services).
- You can't use implicit measures, so if you need an aggregated column as one of your fields, you need to create an explicit DAX measure for it. For more information, see [implicit vs. explicit measures](../guidance/star-schema.md#measures).
- You can't use field parameters as the linked fields of a drill-through or tooltip page. The workaround is to use the individual fields referenced within the field parameter instead. For example, if your field parameter includes **Customer** and **Product** fields, you can link these two fields to your drill-through or tooltip page so that visuals with the field parameter can launch your drill-through or tooltip page.

## Considerations for using field parameters

- When you use field parameters with Copilot, Copilot responds based on the current state of the visuals in the report.
- The order in which fields from a field parameter appear in a visual depends on the selection order. If you use a [hierarchy slicer](power-bi-slicer-hierarchy-multiple-fields.md), the hierarchy slicer determines the field order instead.

## Related content

For more information, see the following articles:

- [Optimize Power BI Desktop](desktop-optimize-ribbon.md)
- [Create page and bookmark navigators](button-navigators.md)
- [Identify and use buttons in the Power BI service](../explore-reports/end-user-buttons.md)
- [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
