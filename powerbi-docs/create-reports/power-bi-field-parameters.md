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
In the example below, the bar chart and table are dynamically updated and measure Cogs and analyze by Product based on the user’s selection within the slicers to 

:::image type="content" source="media/power-bi-field-parameters/sample-field-parameter.png" alt-text="Example field parameters that dynamically update visuals based on the report reader selection":::
 
## Creating a field parameter
To get started you will need to first enable the preview feature called **Field parameters**:
:::image type="content" source="media/power-bi-field-parameters/preview-toggle.png" alt-text="Preview toggle for field parameters":::

Then, to create a new field parameter, you will need to navigate to **Modeling** > **New parameter** > **Fields**:
:::image type="content" source="media/power-bi-field-parameters/parameter-entry-point.png" alt-text="Launch the parameter creation experience from the ribbon":::

To build the parameter, you will need to provide a name for the parameter and select the fields you want to use. In this example for my parameter, I’ve selected different dimensions:
:::image type="content" source="media/power-bi-field-parameters/example-parameter-setup.png" alt-text="Example of field parameter setup":::

In this dialog you can drag and drop to change the ordering of the fields or double click on any of the selected fields to change the display name.
You can also mix and match different measures and dimensions within the same parameter. For example, this feature can be used to create a dynamic table, where the columns can be either measures or dimensions. 

## Using a field parameter to control visual properties
Once you’ve created a field parameter, you can now use the parameter to control the measures or dimensions used in a visual.
:::image type="content" source="media/power-bi-field-parameters/using-a-parameter-in-a-visual.png" alt-text="Example of using a parameter in a visual":::

You can use the parameter in the field drop zones for a visual. Note that certain visual properties have restrictions on the number of fields that can be used or the types of fields that can be used.
From within the context menu, you can also change if the field parameter is showing the values of the selected field(s) or the display names of the selected field(s) for all non-slicer visuals:
:::image type="content" source="media/power-bi-field-parameters/show-selected-field-setting.png" alt-text="For non-slicer visuals, you can customize if the visual will display either the values of the selected field(s) or the display names of the selected field(s)":::

## Editing a field parameter
Finally, if you need to edit any existing field parameters, you will need to modify the DAX directly. 
For example, if you want to add a new field to an existing parameter you can click Shift + Enter to start a new entry: 
:::image type="content" source="media/power-bi-field-parameters/editing-field-parameter-in-dax.png" alt-text="Example editing a field parameter in DAX":::

You'll need to add a comma between each entry, and you will need to match the format shown above.

## Limitations
- AI visuals and Q&A is not supported with the feature
- There is no way for end users to select "none" or no fields option. This is because selecting no fields in the slicer or filter card is the same as selecting all fields.
- You cannot use implicit measures for now, meaning if you need an aggregated column as one of your fields, then you would need to create an explicit DAX measure for it. 
