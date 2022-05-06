---
title: Let report readers dynamically change visuals using field parameters (preview)
description: Let report readers dynamically change the visuals in a report using field parameters.  
author: Sujata994
ms.author: sunaraya
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/05/2022
LocalizationGroup: Reports
---
# Let report readers dynamically change visuals using field parameters (preview)
Field parameters allow users to dynamically change the measures or dimensions being analyzed within a report. This feature can help your report readers explore and customize the analysis of the report by selecting the different measures or dimensions they are interested in. 

In the example below, the bar chart and table are dynamically updated and measure COGS and analyze by Product based on the user’s selection within the slicers.

:::image type="content" source="media/power-bi-field-parameters/sample-field-parameter.png" alt-text="Example field parameters that dynamically update visuals based on the report reader selection":::
 
## Create a field parameter
To get started you first need to enable the preview feature called **Field parameters** in Power BI Desktop:

:::image type="content" source="media/power-bi-field-parameters/preview-toggle.png" alt-text="Screenshot of Preview toggle for field parameters.":::

Then, to create a new field parameter, you need to navigate to **Modeling** > **New parameter** > **Fields**:

:::image type="content" source="media/power-bi-field-parameters/parameter-entry-point.png" alt-text="Screenshot of Launch the parameter creation experience from the ribbon.":::

To build the parameter, provide a name for the parameter and select the fields you want to use. In this example for my parameter, I’ve selected different dimensions:

:::image type="content" source="media/power-bi-field-parameters/example-parameter-setup.png" alt-text="Screenshot of Example of field parameter setup.":::

In this dialog you can drag and drop to change the order of the fields, or double-click on any of the selected fields to change the display name.
You can also mix and match different measures and dimensions within the same parameter. For example, you can use this feature to create a dynamic table, where the columns can be either measures or dimensions. 

## Use a field parameter to control visual properties
Once you’ve created a field parameter, you can now use the parameter to control the measures or dimensions used in a visual.
:::image type="content" source="media/power-bi-field-parameters/using-a-parameter-in-a-visual.png" alt-text="Screenshot of Example of using a parameter in a visual.":::

You can use the parameter in the field drop zones for a visual. Note that certain visual properties have restrictions on the number and type of fields that you can use.

From the context menu, you can also choose if the field parameter shows the values or the display names of the selected field(s) for all non-slicer visuals:

:::image type="content" source="media/power-bi-field-parameters/show-selected-field-setting.png" alt-text="Screenshot, for non-slicer visuals, customize if the visual displays the values or the display names of the selected field(s).":::

## Edit a field parameter
Finally, if you need to edit any existing field parameters, you need to modify the DAX directly. 

For example, if you want to add a new field to an existing parameter, press Shift + Enter to start a new entry: 
:::image type="content" source="media/power-bi-field-parameters/editing-field-parameter-in-dax.png" alt-text="Screenshot of Example editing a field parameter in DAX.":::

Add a comma between each entry, and match the format shown above.

## Limitations

- AI visuals and Q&A aren't supported with the feature.
- There is no way for end users to select "none" or no fields option. Selecting no fields in the slicer or filter card is the same as selecting all fields.
- You can't use implicit measures for now, meaning if you need an aggregated column as one of your fields, you need to create an explicit DAX measure for it. 
