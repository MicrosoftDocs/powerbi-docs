---
title: Add formatting options to a Power BI custom visual
description: A tutorial on how to add different formatting options to the Power BI custom circle card visual developed in the previous tutorial.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: tutorial
ms.date: 12/19/2023
---

# Tutorial: Add formatting options to the Circle Card visual

When you create a visual, you can add options for customizing its properties. Some of the items that can be to customized  formatted include:

* Title
* Background
* Border
* Shadow
* Colors

In this tutorial, you learn how to:
> [!div class="checklist"]
>
> * Add formatting properties to your visual.
> * Package the visual
> * Import the custom visual to a Power BI Desktop or Service report

## Prerequisite

This tutorial explains how to add common formatting properties to a visual. We'll use the [Circle card](develop-circle-card.md) visual as an example. We'll add the ability to change the color and thickness of the circle. If you don't have the [Circle card](develop-circle-card.md) project folder that you created in that tutorial, redo the tutorial before continuing.

## Adding formatting options

1. In **PowerShell**, Navigate to your circle card project folder and start the circle card visual. Your visual is now running while being hosted on your computer.

    ```powershell
    pbiviz start
    ```

2. In **Power BI**, select the **Format panel**.

    You should see general formatting options, but not any visual formatting options.

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/view-general-formatting-options.png" alt-text="Screenshot of formatting panel with only general formatting options.":::

3. In **Visual Studio Code**, open the `capabilities.json` file.

4. Before the **dataViewMappings** array, add **objects**.

    ```json
    "objects": {},
    ```

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/add-objects.png" alt-text="Screenshot of capabilities file with empty objects array.":::

5. Save the `capabilities.json` file.

6. In **Power BI**, review the formatting options again.

    > [!Note]
    > If you don't see the formatting options change, select **Reload Custom Visual**.

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/view-formatting-options.png" alt-text="Screenshot of general and visual formatting options on the formatting pane.":::

7. Set the **Title** option to *Off*. Notice that the visual no longer displays the measure name at the top-left corner.

      :::image type="content" source="media/custom-visual-develop-tutorial-format-options/tile-option-off.png" alt-text="Screenshot of visualizations pane with the Title switch turned off. ":::

      :::image type="content" source="media/custom-visual-develop-tutorial-format-options/no-name-tile.png" alt-text="Screenshot of circle card visual without the title row.":::

### Adding custom formatting options

Now let's add new group called *color* for configuring the circle color and thickness of the circle's outline.

1. In **PowerShell**, enter <kbd>Ctrl</kbd>+<kbd>C</kbd> to stop the custom visual.

2. In **Visual Studio Code**, in the `capabilities.json` file, insert the following JSON fragment into the object labeled **objects**.

    ```json
        "circle": {
            "properties": {
                "circleColor": {
                    "type": {
                        "fill": {
                            "solid": {
                                "color": true
                            }
                        }
                    }
                },
                "circleThickness": {
                    "type": {
                        "numeric": true
                    }
                }
            }
        }
    ```

    This JSON fragment describes a group called *circle*, which consists of two variables - *circleColor* and *circleThickness*.

3. Save the `capabilities.json` file.

4. In the **Explorer pane**, go to the **src** folder, and then select **settings.ts**. *This file represents the settings for the starter visual*.

5. In the `settings.ts` file, replace the import lines and two classes with the following code.

    ```typescript
    import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

    import FormattingSettingsCard = formattingSettings.SimpleCard;
    import FormattingSettingsSlice = formattingSettings.Slice;
    import FormattingSettingsModel = formattingSettings.Model;

    export class CircleSettings extends FormattingSettingsCard{
        public circleColor = new formattingSettings.ColorPicker({
            name: "circleColor",
            displayName: "Color",
            value: { value: "#ffffff" },
            visible: true
        });

        public circleThickness = new formattingSettings.NumUpDown({
            name: "circleThickness",
            displayName: "Thickness",
            value: 2,
            visible: true
        });

        public name: string = "circle";
        public displayName: string = "Circle";
        public visible: boolean = true;
        public slices: FormattingSettingsSlice[] = [this.circleColor, this.circleThickness]
    }

    export class VisualSettings extends FormattingSettingsModel {
        public circle: CircleSettings = new CircleSettings();
        public cards: FormattingSettingsCard[] = [this.circle];
    }
    ```

    This module defines the two classes. The **CircleSettings** class defines two properties with names that match the objects defined in the capabilities.json file (*circleColor* and *circleThickness*) and sets default values. The **VisualSettings** class defines the circle object according to the properties described in the `capabilities.json` file.

6. Save the `settings.ts` file.

7. Open the `visual.ts` file.

8. In the `visual.ts` file, import the :

    ```typescript
    import { VisualSettings } from "./settings";
    import { FormattingSettingsService } from "powerbi-visuals-utils-formattingmodel";
    ```

    and in the **Visual** class add the following properties:

    ```typescript
    private visualSettings: VisualSettings;
    private formattingSettingsService: FormattingSettingsService;

    ```

    This property stores a reference to the **VisualSettings** object, describing the visual settings.

9. In the **Visual** class, insert the following as the first line of the *constructor*:

    ```typescript
    this.formattingSettingsService = new FormattingSettingsService();
    ```

10. In the **Visual** class, add the following method after the **update** method.

    ```typescript
    public getFormattingModel(): powerbi.visuals.FormattingModel {
        return this.formattingSettingsService.buildFormattingModel(this.visualSettings);
    }
    ```

     This function gets called on every formatting pane render. It allows you to select which of the
     objects and properties you want to expose to the users in the property pane.

11. In the **update** method, after the declaration of the **radius** variable, add the following code.

    ```typescript
    this.visualSettings = this.formattingSettingsService.populateFormattingSettingsModel(VisualSettings, options.dataViews);
    this.visualSettings.circle.circleThickness.value = Math.max(0, this.visualSettings.circle.circleThickness.value);
    this.visualSettings.circle.circleThickness.value = Math.min(10, this.visualSettings.circle.circleThickness.value);
    ```

    This code retrieves the format options. It adjusts any value passed into the **circleThickness** property, and converts it to a number between zero and 10.

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/radius.png" alt-text="Screenshot of setting circle thickness to between zero and 10.":::

12. In the **circle element**, modify the values passed to the **fill style** and **stroke-width style** as follows:

    ```typescript
    .style("fill", this.visualSettings.circle.circleColor.value.value)
    ```

    ```typescript
    .style("stroke-width", this.visualSettings.circle.circleThickness.value)
    ```

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/circle-element-fill.png" alt-text="Screenshot of circle elements.":::

13. Save the `visual.ts` file.

14. In **PowerShell**, start the visual.

    ```powershell
    pbiviz start
    ```

15. In **Power BI**, in the toolbar floating above the visual, select **Toggle Auto Reload**.

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/toggle-auto-reload.png" alt-text="Screenshot of Toggle Auto Reload icon.":::

16. In the **visual format** options, expand **Circle**.

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/circle-format.png" alt-text="Screenshot of the final circle card visuals format pane elements.":::

    Modify the **color** and **thickness** option.

Modify the **thickness** option to a value less than zero, and a value higher than 10. Then notice the visual updates the value to a tolerable minimum or maximum.

## Debugging

For tips about debugging your custom visual, see the [debugging guide](visuals-how-to-debug.md).

## Packaging the custom visual

Now that the visual is completed and ready to be used, it's time to package it. A packaged visual can be imported to Power BI reports or service to be used and enjoyed by others.

When your visual is ready, follow the directions in [Package a Power BI visual](./package-visual.md) and then, if you want, share it with others so they can [import](./import-visual.md) and enjoy it. 

## Related content

* [Create a Power BI bar chart visual](create-bar-chart.md)
* [Learn how to debug a Power BI visual you created](visuals-how-to-debug.md)
* [Power BI visuals project structure](visual-project-structure.md)
