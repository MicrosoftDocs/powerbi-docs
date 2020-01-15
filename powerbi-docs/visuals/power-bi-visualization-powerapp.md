---
title: Embed a new Power App in a Power BI Report
description: Embed an app that uses the same data source and can be filtered like other report items 
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-visualizations
ms.topic: tutorial
ms.date: 01/14/2020
ms.author: mgblythe

LocalizationGroup: Visualizations
---


# Tutorial: Embed a Power Apps visual in a Power BI report

In this tutorial, you use the Power Apps visual to create a new app that is embedded in a sample Power BI report. This app interacts with other visuals in that report.

If you don't have a Power Apps subscription, [create a free account](../signup-for-powerapps.md) before you begin.

In this tutorial, you learn how to:
> [!div class="checklist"]
> * Add a Power Apps visual to a Power I report
> * Work in Power Apps to create a new app that uses data from the Power BI report
> * View and interact with the Power Apps visual in the report

## Prerequisites

* [Google Chrome](https://www.google.com/chrome/browser/) or [Microsoft Edge](https://www.microsoft.com/windows/microsoft-edge) browser
* A [Power BI subscription](https://docs.microsoft.com/power-bi/service-self-service-signup-for-power-bi), with the [Opportunity Analysis Sample](https://docs.microsoft.com/power-bi/sample-opportunity-analysis#get-the-content-pack-for-this-sample) installed
* An understanding of how to [create apps in PowerApps](data-platform-create-app-scratch.md) and how to [edit Power BI reports](https://docs.microsoft.com/power-bi/service-the-report-editor-take-a-tour)



## Create a new app
When you add the Power Apps visual to your report, it launches PowerApps Studio with a live data connection between Power Apps and Power BI.

1. Open the Opportunity Analysis sample report and select the *Upcoming Opportunities* page. 


2. Move and resize some of the report tiles to make space for the new visual.

    ![Move and resize report tiles](media/power-bi-visualization-powerapp/power-bi-report-page.jpg)

2. From the Visualizations pane, select the Power Apps icon, then resize the visual to fit the space you made.

    ![Visualization pane with PowerApps icon selected](media/power-bi-visualization-powerapp/power-bi-powerapps-icon.jpg)

3. In the **Fields** pane, select **Name**, **Product Code**, and **Sales Stage**. 

    ![select fields](media/power-bi-visualization-powerapp/power-bi-fields.jpg)

4. On the Power Apps visual, select the Power Apps environment where you want to create the app, then select **Create new**.

    ![Create new app](media/power-bi-visualization-powerapp/power-bi-create-new-powerapp.png)

    In Power Apps Studio, you see that a basic app is created, with a *gallery* that shows one of the fields you selected in Power BI.

    ![Power Apps opens](media/power-bi-visualization-powerapp/power-bi-power-app.png)

5.  Resize the gallery so it takes up only half of the screen. 

6. In the left pane, select **Screen1**, then set the screen's **Fill** property to "LightBlue" (so it shows up better in the report).

    ![color palette](media/power-bi-visualization-powerapp/power-bi-powerapps-fill.png)

6. Make some room for a label control. 

    ![change gallery dimensions](media/power-bi-visualization-powerapp/power-bi-powerapps-gallery.png)


8. Under **gallery**, insert a text label control.

   ![label control](media/power-bi-visualization-powerapp/power-bi-label.png)

7. Drag the label to the bottom of your visual. Set the **Text** property to `"Opportunity Count: " & CountRows(Gallery1.AllItems)`. It now shows the total number of opportunities in the data set.

    ![App with resized gallery](media/power-bi-visualization-powerapp/power-bi-power-app-label.png)

    ![App with label updated](media/power-bi-visualization-powerapp/power-bi-label-live.png)

7. Save the app with the name "Opportunities app". 

    ![save the app](media/power-bi-visualization-powerapp/power-bi-save-powerapp.png)


## View the app in the report
The app is now available in the Power BI report, and it interacts with other visuals because it shares the same data source.

![App in Power BI report](media/power-bi-visualization-powerapp/power-bi-powerapps-visual.png)

In the Power BI report, select **Jan** in the slicer, which filters the whole report, including the data in the app.

![filtered report](media/power-bi-visualization-powerapp/power-bi-last.png)

Notice that the opportunity count in the app matches the count in the upper left of the report. You can select other items in the report, and the data in the app updates.


## Clean up resources
If you don't want to use the Opportunity Analysis Sample anymore, you can delete the dashboard, report, and dataset.


## Next steps
[Q&A visual](power-bi-visualization-q-and-a.png)