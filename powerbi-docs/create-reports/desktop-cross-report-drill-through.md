---
title: Use cross-report drill through in Power BI Desktop
description: Learn how to drill through from one report to another in Power BI Desktop
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: how-to
ms.date: 07/27/2020
ms.author: maggies

LocalizationGroup: Create reports
---
# Use cross-report drill through in Power BI

With the Power BI *cross-report drill-through* feature, you can contextually jump from one report to another report in the same Power BI service workspace or app. You can use cross-report drill through to connect two or more reports that have related content, and to pass filter context along with the cross-report connection. 

To initiate cross-report drill through, you select a data point in a *source visual* of a *source report*, and then select the cross-report **Drill through** target from the context menu. 

![Power BI cross-report drill-through option](media/desktop-cross-report-drill-through/cross-report-drill-through-01.png)

The drill-through action opens the *target page* in the *target report*. 

![Power B I Desktop cross-report drill-through target](media/desktop-cross-report-drill-through/cross-report-drill-through-01a.png)

This article shows you how to set up and use cross-report drill through for Power BI reports.

> [!NOTE]
> You can't use cross-report drill through with individually-shared [Shared with me reports](../collaborate-share/service-share-dashboards.md#share-a-dashboard-or-report). To use cross-report drill through, you must access reports in workspaces that you’re a member of.

## Enable cross-report drill through

The first step in enabling cross-report drill through is to validate the data models for the source and target reports. Although the schemas in each report don't have to be the same, the fields you want to pass must exist in both data models. The names of the fields, and the names of the tables they belong to, must be identical. The strings must match, and are case-sensitive.

For example, if you want to pass a filter on a field **State** within a table **US States**, both models must have a **US States** table, and a **State** field within that table. If not, you must update the field name or table name in the underlying model. Simply updating the display name of the fields won't work properly for cross-report drill through.

After you validate your models, enable the source report to use cross-report drill through. 

1. In Power BI Desktop, go to **File** > **Options and settings** > **Options**. 
1. In the **Options** window left navigation, at the bottom of the **Current file** section, select **Report settings**. 
1. At bottom right, under **Cross-report drill through**, select **Allow visuals in this report to use drill-through targets from other reports**. 
1. Select **OK**. 
   
   ![Enable cross-report drill through in Power B I Desktop](media/desktop-cross-report-drill-through/cross-report-drill-through-02.png)

You can also enable cross-report drill through from the Power BI service.
1. In Power BI service, select the workspace that contains your target and source reports.
1. Next to the source report name in the workspace list, select the **More options** symbol, and then select **Settings**. 
1. Near the bottom of the **Settings** pane, under **Cross-report drill through**, select **Allow visuals in this report to use drill-through targets from other reports**, and then select **Save**.
   
   ![Enable cross-report drill through in the Power B I service](media/desktop-cross-report-drill-through/cross-report-drill-through-02a.png)

## Set up a cross-report drill-through target

Setting up a target page for cross-report drill through is similar to setting up drill through within a report. Enabling drill through on the target page allows other visuals to target the page for drill through. To create drill through within a single report, see [Use drill through in Power BI Desktop](desktop-drillthrough.md).

You can set up a target for cross-report drill through in Power BI Desktop or Power BI service. 
1. Edit the target file, and on the target page of the target report, select the **Fields** section of the **Visualizations** pane. 
1. Under **Drill through**, set the **Cross-report** toggle to **On**. 
1. Drag the fields you want to use as drill-through targets into **Add drill-through fields here**. For each field, select whether you want to allow drill through when the field is used as a category, or when it's summarized like a measure. 
1. Select whether you want to **Keep all filters** for the visual. If you don't want to pass filters applied to the source visual to your target visual, select **Off**.
   
   ![Visualizations pane, with Drill-through options highlighted](media/desktop-cross-report-drill-through/cross-report-drill-through-03.png)
   
1. If you're using the page for cross-report drill through only, delete the **Back** button that's automatically added to the canvas. The **Back** button only works for navigation within a report. 
1. After you configure the target page, save the report if you're using the Power BI service, or save and publish the report if you're using Power BI Desktop.

That's it. Your reports are ready for cross-report drill through. 

## Use cross-report drill through

To use cross-report drill through, select the source report in the Power BI service, and then select a visual that uses the drill-through field in the way you specified when you set up the target page. Right-click a data point to open the visual context menu, select **Drill through**, and then select the drill-through target. Cross-report drill-through targets are formatted as **Page name [Report name]**.

![Power B I cross-report drill-through option](media/desktop-cross-report-drill-through/cross-report-drill-through-01.png)

You see the results in the target cross-report drill-through page, just as you set them up when you created the target. The results are filtered according to the drill-through settings.

![Power B I Desktop cross-report drill-through target](media/desktop-cross-report-drill-through/cross-report-drill-through-01a.png)

> [!IMPORTANT]
> Power BI caches cross-report drill-through targets. If you make changes, be sure to refresh your browser if you don't see the drill-through targets as expected. 

If you set **Keep all filters** to **On** when you set up the target page, filter context from the source visual can include the following: 

- Report, page, and visual level filters that affect the source visual 
- Cross-filter and cross-highlighting that affect the source visual 
- Slicers and sync-slicers on the page
- URL parameters

When you land on the target report for drill through, Power BI only applies filters for fields that have exact string matches for field name and table name. 

Power BI doesn't apply sticky filters from the target report, but it does apply your default personal bookmark if you have one. For example, if your default personal bookmark includes a report-level filter for *Country = US*, Power BI applies that filter before applying the filter context from the source visual. 

For cross-report drill through, Power BI passes the filter context to standard pages in the target report. Power BI doesn't pass filter context for tooltip pages, because tooltip pages are filtered based on the source visual that invokes the tooltip.

If you want to return to the source report after the cross-report drill-through action, use the browser's **Back** button. 

## Considerations and limitations

Cross-report drill through doesn't work in Power BI reports in Power BI Report Server.

## Next steps

You might also be interested in the following articles:

- [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
- [Use drill through in Power BI Desktop](desktop-drillthrough.md)
