---
title: Learn how to develop your own Power BI visual using the circle card visual as an example
description: This tutorial explains how you can develop a Power BI visual
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.topic: tutorial
ms.subservice: powerbi-custom-visuals
ms.date: 09/02/2020
---

# Tutorial: Develop a Power BI circle card visual

As a developer you can create your own Power BI visuals. These visuals can be used by you, your organization or by third parties.

In this tutorial, you'll develop a Power BI visual named circle card that displays a formatted measure value inside a circle. The circle card visual supports customization of fill color and outline thickness.

In this tutorial, you learn how to:
> [!div class="checklist"]
> * Create a development project for your visual.
> * Develop your visual with D3 visual elements.
> * Configure your visual to process data.

## Prerequisites

Before you start developing your Power BI visual, verify that you have everything listed in this section.

* You need a **Power BI Pro** account. If you don't have one, [sign up for a free trial](https://powerbi.microsoft.com/pricing/).

* [Visual Studio Code (VS Code)](https://www.visualstudio.com/). VS Code is an ideal Integrated Development Environment (IDE) for developing JavaScript and TypeScript applications.

* [Windows PowerShell](https://docs.microsoft.com/powershell/scripting/install/installing-windows-powershell) version 4 or later (for Windows). Or [Terminal](https://macpaw.com/how-to/use-terminal-on-mac) (for OSX).

* An environment ready for developing a Power BI visual. [Set up your environment for developing a Power BI visual](environment-setup.md).

* This tutorial uses the **US Sales Analysis** report. You can [download](https://microsoft.github.io/PowerBI-visuals/docs/step-by-step-lab/images/US_Sales_Analysis.pbix) this report and upload it to Power BI service, or use your own report. If you need more information about Power BI service, and uploading files, refer to the [Get started creating in the Power BI service](../../fundamentals/service-get-started.md) tutorial.

## Create a development project

In this section you'll create a project for the circle card visual.

1. Open PowerShell and navigate to the folder you want to create your project in.

2. Enter the following command:

    ```PowerShell
    pbiviz new CircleCard
    ```

3. Navigate to the project's folder.

    ```powershell
    cd CircleCard
    ```

4. Start the circle card visual. Your visual is now running while being hosted on your computer.

    ```powershell
    pbiviz start
    ```
    >[!IMPORTANT]
    >Do not close the PowerSell window until the end of the tutorial. To stop the visual from running, enter Ctrl+C and if prompted to terminate the batch job, enter Y, and press *Enter*.

## View the circle card in Power BI service

To test the circle card visual in Power BI service, we'll use the **US Sales Analysis** report. You can [download](https://microsoft.github.io/PowerBI-visuals/docs/step-by-step-lab/images/US_Sales_Analysis.pbix) this report and upload it to Power BI service.

You can also use your own report to test the circle card visuals.

>[!NOTE]
>Before you continue, verify that you [enabled the visuals developer settings](environment-setup.md#set-up-power-bi-service-for-developing-a-visual).

1. Sign in to [PowerBI.com](https://powerbi.microsoft.com/) and open the **US Sales Analysis** report.

2. Select **More options** > **Edit**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the edit option in Power B I service.](media/develop-circle-card/edit-report.png)

3. Create a new page for testing, by clicking on the **New page** button at the bottom of the Power BI service interface.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the new page button in Power B I service.](media/develop-circle-card/new-page.png)

4. From the **Visualizations** pane, select the **Developer Visual**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the developer visual in the visualizations pane.](media/develop-circle-card/developer-visual.png)

    This visual represents the custom visual that you're running on your computer. It's only available when the [custom visual debugging](environment-setup.md#set-up-power-bi-service-for-developing-a-visual) setting is enabled.

5. Verify that a visual was added to the report canvas.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the new visual added to the report.](media/develop-circle-card/new-visual.png)

    This is a simple visual that displays the number of times its update method has been called. At this stage, the visual does not retrieve any data.

    >[!NOTE]
    >If the visual displays a connection error message, open a new tab in your browser, navigate to `https://localhost:8080/assets/status`, and authorize your browser to use this address.
    >
    >![Screenshot of the new visual displaying a connection error.](media/develop-circle-card/connection-error.png)

6. While the new visual is selected, go to the **Fields** pane, expand **Sales**, and select **Quantity**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the Power B I service quantity field in the sales table in the U S sales analysis report.](media/develop-circle-card/fields-sales-quantity.png)

7. To test how the visual is responding, resize it and notice that the *Update count* value increments every time you resize the visual.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the new visual displaying a different update count number, after being resized.](media/develop-circle-card/resized-visual.png)

## Add visual elements and text

In this section you'll learn how to turn your visual into a circle, and make it display text.

>[!NOTE]
>In this tutorial, [Visual Studio Code](https://code.visualstudio.com/) (VS Code) is used for developing the Power BI visual.

### Modify the visuals file

Set up the **visual.ts** file by deleting and adding a few lines of code.

1. Open your project in VS Code (**File** > **Open Folder**).

2. In the **Explorer pane**, expand the **src** folder, and select the file **visual.ts**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of accessing the visual.ts file in V S code.](media/develop-circle-card/visual-file.png)

    > [!IMPORTANT]
    > Notice the comments at the top of the **visual.ts** file. Permission to use the Power BI visual packages is granted free of charge under the terms of the Massachusetts Institute of Technology (MIT) License. As part of the agreement, you must leave the comments at the top of the file.

3. Remove the following code lines from the *visual.ts* file.

    * The *VisualSettings* import:
        ```typescript
        import { VisualSettings } from "./settings";
        ```

    * The four class-level private variable declarations.

    * All the lines of code inside the *constructor*.

    * All the lines of code inside the *update* method.

    * All the remaining code lines below the *update* method, including the *parseSettings* and *enumerateObjectInstances* methods.

4. Add the following lines of code at the end of the import section:

    * *IVisualHost* -  A collection of properties and services used to interact with the visual host (Power BI).

         ```typescript
        import IVisualHost = powerbi.extensibility.IVisualHost;
        ```

    * *D3 library*

        ```typescript
        import * as d3 from "d3";
        type Selection<T extends d3.BaseType> = d3.Selection<T, any,any, any>;
        ```
    
        >[!NOTE]
        >If you didn't install this library as part of your setup, [install the D3 JavaScript library](environment-setup.md#d3-javascript-library).

5. Below the *Visual* class declaration, insert the following class level properties. You only need to add the code lines starting with `private`.

    ```typescript
    export class Visual implements IVisual {
        // ...
        private host: IVisualHost;
        private svg: Selection<SVGElement>;
        private container: Selection<SVGElement>;
        private circle: Selection<SVGElement>;
        private textValue: Selection<SVGElement>;
        private textLabel: Selection<SVGElement>;
        // ...
    }
    ```

6. Save the **visual.ts** file.

### Add a circle and text elements

Add D3 Scalable Vector Graphics (SVG). This enables creating three shapes: a circle, and two text elements.

1. Open **visual.ts** in VS code.

2. Add the following code to the *constructor*.

    ```typescript
    this.svg = d3.select(options.element)
        .append('svg')
        .classed('circleCard', true);
    this.container = this.svg.append("g")
        .classed('container', true);
    this.circle = this.container.append("circle")
        .classed('circle', true);
    this.textValue = this.container.append("text")
        .classed("textValue", true);
    this.textLabel = this.container.append("text")
        .classed("textLabel", true);
    ```

    >[!TIP]
    >To improve readability, it's recommended that you format the document every time you copy code snippets into your project. Right-click anywhere in VS code, and select *Format Document* (Alt+Shift+F).

3. Save the **visual.ts** file.

### Set the width and height

Set the width and height of the visual, and initialize the attributes and styles of the visual's elements.

1. Open **visual.ts** in VS Code.

2. Add the following code to the *update* method.

    ```typescript
    let width: number = options.viewport.width;
    let height: number = options.viewport.height;
    this.svg.attr("width", width);
    this.svg.attr("height", height);
    let radius: number = Math.min(width, height) / 2.2;
    this.circle
        .style("fill", "white")
        .style("fill-opacity", 0.5)
        .style("stroke", "black")
        .style("stroke-width", 2)
        .attr("r", radius)
        .attr("cx", width / 2)
        .attr("cy", height / 2);
    let fontSizeValue: number = Math.min(width, height) / 5;
    this.textValue
        .text("Value")
        .attr("x", "50%")
        .attr("y", "50%")
        .attr("dy", "0.35em")
        .attr("text-anchor", "middle")
        .style("font-size", fontSizeValue + "px");
    let fontSizeLabel: number = fontSizeValue / 4;
    this.textLabel
        .text("Label")
        .attr("x", "50%")
        .attr("y", height / 2)
        .attr("dy", fontSizeValue / 1.2)
        .attr("text-anchor", "middle")
        .style("font-size", fontSizeLabel + "px");
    ```

3. Save the **visual.ts** file.

### (Optional) Review the code in the visuals file

Verify that the code in the *visuals.ts* file looks like this:

```typescript
/*
*  Power BI Visual CLI
*
*  Copyright (c) Microsoft Corporation
*  All rights reserved.
*  MIT License
*
*  Permission is hereby granted, free of charge, to any person obtaining a copy
*  of this software and associated documentation files (the ""Software""), to deal
*  in the Software without restriction, including without limitation the rights
*  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*  copies of the Software, and to permit persons to whom the Software is
*  furnished to do so, subject to the following conditions:
*
*  The above copyright notice and this permission notice shall be included in
*  all copies or substantial portions of the Software.
*
*  THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
*  THE SOFTWARE.
*/
"use strict";

import "core-js/stable";
import "./../style/visual.less";
import powerbi from "powerbi-visuals-api";
import VisualConstructorOptions = powerbi.extensibility.visual.VisualConstructorOptions;
import VisualUpdateOptions = powerbi.extensibility.visual.VisualUpdateOptions;
import IVisual = powerbi.extensibility.visual.IVisual;
import EnumerateVisualObjectInstancesOptions = powerbi.EnumerateVisualObjectInstancesOptions;
import VisualObjectInstance = powerbi.VisualObjectInstance;
import DataView = powerbi.DataView;
import VisualObjectInstanceEnumerationObject = powerbi.VisualObjectInstanceEnumerationObject;
import IVisualHost = powerbi.extensibility.IVisualHost;
import * as d3 from "d3";
type Selection<T extends d3.BaseType> = d3.Selection<T, any, any, any>;

export class Visual implements IVisual {
    private host: IVisualHost;
    private svg: Selection<SVGElement>;
    private container: Selection<SVGElement>;
    private circle: Selection<SVGElement>;
    private textValue: Selection<SVGElement>;
    private textLabel: Selection<SVGElement>;

    constructor(options: VisualConstructorOptions) {
        this.svg = d3.select(options.element)
            .append('svg')
            .classed('circleCard', true);
        this.container = this.svg.append("g")
            .classed('container', true);
        this.circle = this.container.append("circle")
            .classed('circle', true);
        this.textValue = this.container.append("text")
            .classed("textValue", true);
        this.textLabel = this.container.append("text")
            .classed("textLabel", true);
    }

    public update(options: VisualUpdateOptions) {
        let width: number = options.viewport.width;
        let height: number = options.viewport.height;
        this.svg.attr("width", width);
        this.svg.attr("height", height);
        let radius: number = Math.min(width, height) / 2.2;
        this.circle
            .style("fill", "white")
            .style("fill-opacity", 0.5)
            .style("stroke", "black")
            .style("stroke-width", 2)
            .attr("r", radius)
            .attr("cx", width / 2)
            .attr("cy", height / 2);
        let fontSizeValue: number = Math.min(width, height) / 5;
        this.textValue
            .text("Value")
            .attr("x", "50%")
            .attr("y", "50%")
            .attr("dy", "0.35em")
            .attr("text-anchor", "middle")
            .style("font-size", fontSizeValue + "px");
        let fontSizeLabel: number = fontSizeValue / 4;
        this.textLabel
            .text("Label")
            .attr("x", "50%")
            .attr("y", height / 2)
            .attr("dy", fontSizeValue / 1.2)
            .attr("text-anchor", "middle")
            .style("font-size", fontSizeLabel + "px");
    }
}
```

### Modify the capabilities file

Delete unneeded lines of code from the capabilities file.

1. Open your project in VS Code (**File** > **Open Folder**).

2. Select the **capabilities.json** file.

    >[!div class="mx-imgBorder"]
    >![Screenshot of accessing the capabilities.json file in V S code.](media/develop-circle-card/capabilities-file.png)

3. Remove all the objects elements (lines 14-60).

4. Save the **capabilities.json** file.

### Restart the circle card visual

Stop the visual from running and restart it.

1. In the PowerShell window running the visual, enter Ctrl+C and if prompted to terminate the batch job, enter Y, and press *Enter*.

2. In PowerShell, start the visual.

    ```powershell
    pbiviz start
    ```

### Test the visual with the added elements

Verify that the visual displays the newly added elements.

1. In Power BI service, open the *Power BI US Sales Analysis* report. If you're using a different report to develop the circle card visual, navigate to that report.

2. Make sure that the visual is shaped as a circle.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the circle card visual shaped as a circle.](media/develop-circle-card/circle.png)

    >[!NOTE]
    >If the visual isn't displaying anything, from the **Fields** pane, drag the **Quantity** field into the developer visual.

3. Resize the visual.

    Notice that the circle and text scale to fit the dimensions of the visual. The update method is called when you resize the visual, and as a result the visual elements get rescaled.

### Enable auto reload

Use this setting to ensure that the visual is automatically reloaded each time you save project changes.

1. Navigate to the *Power BI US Sales Analysis* report (or to the project that has your circle card visual).

2. Select the circle card visual.

3. In the floating toolbar, select **Toggle Auto Reload**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of clicking the toggle auto reload option, in the circle card visual floating toolbar.](media/develop-circle-card/toggle-auto-reload.png)

## Get the visual to process data

In this section, you'll define data roles and data view mappings. You'll also modify the visual to display the name of the value it's displaying.

### Configure the capabilities file

Modify the **capabilities.json** file to define the data role and data view mappings.

* **Defining the data role**

    Define the *dataRoles* array with a single data role of the type *measure*. This data role is called *measure*, and is displayed as *Measure*. It allows passing either a measure field, or a field that's summed up.

    1. Open the **capabilities.json** file in VS Code.

    2. Remove all the content inside the **dataRoles** array (lines 3-12).

    3. Insert the following code to the **dataRoles** array.

        ```json
        {
            "displayName": "Measure",
            "name": "measure",
            "kind": "Measure"
        }
        ```

    4. Save the **capabilities.json** file.

* **Defining the data view mapping**

    Define a filed called *measure* in the *dataViewMappings* array. This field can be passed to the data role.

    1. Open the **capabilities.json** file in VS Code.

    2. Remove all the content inside the **dataViewMappings** array (lines 10-30).

    3. Insert the following code to the **dataViewMappings** array.

        ```json
        {
            "conditions": [
                { "measure": { "max": 1 } }
            ],
            "single": {
                "role": "measure"
            }
        }
        ```

    4. Save the **capabilities.json** file.

### (Optional) Review the capabilities file code changes

Verify that the circle card visual displays the *measure* field, and review the changes you made using the *Show Dataview* option. 

1. In Power BI service, open the *Power BI US Sales Analysis* report. If you're using a different report to develop the circle card visual, navigate to that report.

2. Notice that the circle card visual can now be configured with a field titled *Measure*. You can drag and drop elements from the **Fields** pane into the *Measure* field.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the circle card measure filed, in the Power BI service visualization pane.](media/develop-circle-card/measure.png)

    > [!Note]
    > The visual project does not yet include data binding logic.

3. In the floating toolbar, select **Show Dataview**. 

    >[!div class="mx-imgBorder"]
    >![Screenshot of the show dataview button, located in the circle card floating toolbar.](media/develop-circle-card/show-dataview.png)

4. Select the three dots to expand the display, and select **single** to view the value.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the value figure as it's displayed in the circle card show dataview option.](media/develop-circle-card/value.png)

5. Expand **metadata**, then the **columns** array, and review the **format** and **displayName** values.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the format and display name values as displayed in the circle card show dataview option.](media/develop-circle-card/colunms.png)

6. To toggle back to the visual, in the toolbar floating above the visual, select **Show Dataview**.

### Configure the visual to consume data

Make changes to the **visual.ts** file, so that the circle card visual will be able to consume data.

1. Open the **visual.ts** file in VS Code.

2. Add the following line to import the `DataView` interface from the `powerbi` module.

    ```typescript
    import DataView = powerbi.DataView;
    ```

3. In the *update* method, do the following:

    * Add the following statement as the first statement. The statement assigns *dataView* to a variable for easy access, and declares the variable to reference the *dataView* object.

        ```typescript
        let dataView: DataView = options.dataViews[0];
        ```

    * Replace **.text("Value")** with this line of code:

        ```typescript
        .text(<string>dataView.single.value)
        ```

    * Replace **.text("Label")** with this line of code:

        ```typescript
        .text(dataView.metadata.columns[0].displayName)
        ```

4. Save the **visual.ts** file.

5. Review the visual in Power BI service. The visual now displays the value and the display name.

## Next steps

> [!div class="nextstepaction"]
> [Add formatting options to the circle card visual](custom-visual-develop-tutorial-format-options.md)

> [!div class="nextstepaction"]
> [Create a Power BI bar chart visual](create-bar-chart.md)

> [!div class="nextstepaction"]
> [Learn how to debug a Power BI visual you created](visuals-how-to-debug.md)

> [!div class="nextstepaction"]
> [Power BI visuals project structure](visual-project-structure.md)
