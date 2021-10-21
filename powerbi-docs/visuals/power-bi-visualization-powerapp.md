---
title: Embed a new Power App in a Power BI Report
description: Embed an app that uses the same data source and can be filtered like other report items 
author: mihart
ms.author: mihart
manager: kvivek
ms.reviewer: 'tapan maniar'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/20/2021
LocalizationGroup: Visualizations
---


# Tutorial: Embed a Power Apps visual in a Power BI report

In this tutorial, you use the Power Apps visual to create a new app that is embedded in a sample Power BI report. This app interacts with other visuals in that report.

If you don't have a Power Apps subscription, [create a free account](https://make.powerapps.com/signup?redirect=marketing&email=) before you begin.

In this tutorial, you learn how to:
> [!div class="checklist"]
> * Add a Power Apps visual to a Power BI report
> * Work in Power Apps to create a new app that uses data from the Power BI report
> * View and interact with the Power Apps visual in the report

## Prerequisites

* [Google Chrome](https://www.google.com/chrome/browser/) or [Microsoft Edge](https://www.microsoft.com/windows/microsoft-edge) browser
* A [Power BI subscription](../fundamentals/service-self-service-signup-for-power-bi.md), with the [Opportunity Analysis Sample](../create-reports/sample-opportunity-analysis.md#get-the-built-in-sample) installed
* An understanding of how to [create apps in Power Apps](/powerapps/maker/canvas-apps/data-platform-create-app-scratch) and how to [edit Power BI reports](../create-reports/service-the-report-editor-take-a-tour.md)

## Create a new app

When you add the Power Apps visual to your report, it launches Power Apps Studio with a live data connection between Power Apps and Power BI.

1. Open the Opportunity Analysis sample report and select the *Upcoming Opportunities* page.

1. Move and resize some of the report tiles to make space for the new visual.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-report-page.png" alt-text="Move and resize report tiles.":::

1. From the Visualizations pane, select the Power Apps icon, then resize the visual to fit the space you made.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-powerapps-icon.png" alt-text="Visualization pane with Power Apps icon selected":::

1. In the **Fields** pane, select **Name**, **Product Code**, and **Sales Stage**.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-fields.png" alt-text="Screenshot showing the selection of the Name, Product Code, and Sales Stage fields.":::

1. On the Power Apps visual, select the Power Apps environment where you want to create the app, then select **Create new**.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-create-new-powerapp.png" alt-text="Create a new app.":::

   In Power Apps Studio, you see that a basic app is created, with a *gallery* that shows one of the fields you selected in Power BI.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-power-app.png" alt-text="Power Apps opens.":::

1. Resize the gallery so it takes up only half of the screen. 

1. In the left pane, select **Screen1**, then set the screen's **Fill** property to "LightBlue" (so it shows up better in the report).

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-powerapps-fill.png" alt-text="Screenshot showing the color palette used to set the Fill property.":::

1. Make some room for a label control.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-powerapps-gallery.png" alt-text="Change gallery dimensions.":::

1. Under **gallery**, insert a text label control.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-label.png" alt-text="Label control.":::

1. Drag the label to the bottom of your visual. Set the **Text** property to `"Opportunity Count: " & CountRows(Gallery1.AllItems)`. It now shows the total number of opportunities in the data set.

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-power-app-label.png" alt-text="App with resized gallery.":::

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-label-live.png" alt-text="App with label updated.":::

1. Save the app with the name "Opportunities app". 

   :::image type="content" source="media/power-bi-visualization-powerapp/power-bi-save-powerapp.png" alt-text="Screenshot showing the screen for saving the app.":::

## View the app in the report

The app is now available in the Power BI report, and it interacts with other visuals because it shares the same data source.

:::image type="content" source="media/power-bi-visualization-powerapp/power-bi-powerapps-visual.png" alt-text="[App in Power BI report.":::

In the Power BI report, select **Jan** in the slicer, which filters the whole report, including the data in the app.

:::image type="content" source="media/power-bi-visualization-powerapp/power-bi-last.png" alt-text="Screenshot showing the filtered report.":::

Notice that the opportunity count in the app matches the count in the upper left of the report. You can select other items in the report, and the data in the app updates.

## Clean up resources

If you don't want to use the Opportunity Analysis Sample anymore, you can delete the dashboard, report, and dataset.

## Considerations and limitations
For troubleshooting information, see [Power Apps visual for Power BI](/powerapps/maker/canvas-apps/powerapps-custom-visual#limitations-of-the-power-apps-visual)

## Next steps
[Q&A visual](power-bi-visualization-types-for-reports-and-q-and-a.md)    
[Tutorial: Embed a Power Apps visual in a Power BI report](/powerapps/maker/canvas-apps/powerapps-custom-visual)