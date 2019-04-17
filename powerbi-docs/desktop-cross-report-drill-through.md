---
title: Use cross-report drillthrough in Power BI Desktop
description: Learn how to drill through from one report to another in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 04/08/2019
ms.author: davidi

LocalizationGroup: Create reports
---
# Use cross-report drillthrough in Power BI Desktop

With the cross-report drillthrough feature in Power BI Desktop, you can contextually jump from one report to another report. This is true as long as the reports are within the same workspace or app in the Microsoft Power BI service. Use cross-report drillthrough to connect two or more reports that have related content, and to pass the filter context along with the cross-report connection. In this article, you learn how to set up a cross-report drillthrough for Power BI reports, and what users experience when they use the cross-report drillthrough for themselves.

![Screenshot of Power BI Desktop drillthrough option](media/desktop-cross-report-drill-through/cross-report-drill-through-01.png)

The following definitions are important to understand, before we begin setting up and using cross-report drillthrough:

* **Source Visual:** The visual that  invokes the drillthrough action by using the visual context menu.
* **Source Report:** The report containing the source visual for cross-report drillthrough.
* **Target Page:** The page that a user lands on after initiating a drillthrough action.
* **Target Report:** The report containing the target page for cross-report drillthrough.

## Enable cross-report drillthrough

To enable a report to be the target of a cross-report drillthrough, you must enable the feature for that report in the **Options** window. Go to **File** > **Options and settings** > **Options**, and then go to **Report settings** near the bottom of the page on the left.

Select the check box to **Allow visuals in this report to use drillthrough targets from other reports**, as shown in the following image.

![Screenshot of Options window, with Report settings highlighted](media/desktop-cross-report-drill-through/cross-report-drill-through-02.png)

Cross-report drillthrough is now enabled.

## Set up cross-report drillthrough

Setting up cross-report drillthrough is similar to setting up drillthrough within a report. Drillthrough is enabled on the target page, allowing other visuals to target the enabled page for drillthrough. For the steps to create drillthrough within a single report, see [Use drillthrough in Power BI Desktop](desktop-drillthrough.md).

To start the setup process, you need to take a couple initial steps:

* Set up a drillthrough target page, which can then be accessed from other reports in the workspace or app.
* Allow a report to see drillthrough pages from outside its own report.

Find drillthrough options in the **Fields** section of the **Visualizations** pane, as shown in the following image.

![Screenshot of Visualizations pane, with Drillthrough options highlighted](media/desktop-cross-report-drill-through/cross-report-drill-through-03.png)

The first step in enabling drillthrough for a page is to validate the data models for the source and target reports. Make sure that: 

* Fields you want to pass exist in both data models.
* The names of the fields, and the names of the tables to which they belong, are identical (the strings must also match, and are case-sensitive).

For example, if you want to pass a filter on field *Country* within table *Geography*, both models must have a *Geography* table, and a *Country* field within that table. If not, you must update the field name or table name in the underlying model. Simply updating the display name of the fields won't work properly for cross-report drillthrough. (Note that the schemas in each report don't have to be exactly the same.)

To get started with setup, you need to get the target page ready. In Power BI Desktop, go to the page and make sure the **Cross-report** drillthrough toggle is set to **On**. 

![Screenshot of Cross-report toggle set to On](media/desktop-cross-report-drill-through/cross-report-drill-through-03.png)

Next, drag the fields you want to use as the drillthrough target onto the canvas. Select whether you want the field to be used as a category, or summarized like a measure. At this point, you can select whether you want to disable the **Keep all filters** toggle for the visual. If you don't want to pass other applied filters from the source visual to your target drillthrough visual, select **Off**.

> [!NOTE]
> If you're using the page for cross-report drillthrough only, you should delete the **Back** button that's automatically added. The **Back** button only works for nagivation within a single report. 

After you've configured the visual, make sure you save the report if you're in the Power BI service, or save and publish the report if you're using Power BI Desktop.

The previous section described how to enable cross-report drillthrough for Power BI Desktop (in the **Options** window). If you're using the Power BI service to create a cross-report drillthrough target, to enable cross-report drillthrough you must: 

1. Select the workspace in which your target report and source report reside.
2. Select **Reports**.
3. Select the **Settings** icon for the source report.
4. Make sure the cross-report drillthrough toggle is **On**.
5. Save your report.

That's it, your report is ready for the cross-report drillthrough experience. 

In the next section, we take a look at the experience from the user's perspective.

## Cross-report drillthrough experience

When you configure the cross-report drillthrough experience for a report, you can put the feature to use.

Select the source report in the Power BI service, and then select a visual that uses the field or fields in the way you specified when you set up the target page. Next, right-click on a data point to open the visual context menu, and select **Drillthrough**.

![Screenshot of source report in the Power BI service, with Drillthrough highlighted](media/desktop-cross-report-drill-through/cross-report-drill-through-01.png)

You'll then see the results in the target cross-report drillthrough page, just as you set them up when you created the target. The results are filtered according to the drillthrough settings.

> [!IMPORTANT]
> Power BI caches cross-report drillthrough targets. If you make changes, be sure you refresh your browser if you don't see the drillthrough targets as expected. 

Cross-report targets are formatted in the following fashion: 

`Target Page Name [Target Report Name]`

After you select the target page to which you want to drill through, Power BI goes to that page. It passes along filter context based on the settings of the target page. 

Filter context from the source visual can include the following: 

* Report, page, and visual level filters affecting the source visual. 
* Cross-filter and cross-highlighting that affect the source visual. 
* Slicers on the page and sync-slicers.
* URL parameters.

When you land on the target report for drillthrough, Power BI only applies filters for fields for which it finds exact string matches for field name and table name. Power BI doesn't apply sticky filters from the target report. It does, however, apply your default personal bookmark if one exists. For example, if your default personal bookmark includes a report level filter for *Country = US*, Power BI applies that filter first, before applying the filter context from the source visual. 

For cross-report drillthrough, Power BI passes the filter context to all standard pages in the target report. Power BI doesn't pass filter context for tooltip pages, because tooltip pages are filtered based on the source visual that invokes the tooltip.

If you want to return to the source report after the cross-report drillthrough action, use the browser's **Back** button. 

## Next steps

You might also be interested in the following articles:

* [Using slicers Power BI Desktop](visuals/desktop-slicers.md)
* [Use drillthrough in Power BI Desktop](desktop-drillthrough.md)

