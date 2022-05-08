---
title: Add a live Power BI report page to PowerPoint
description: Learn how to add a live Power BI report page to a PowerPoint slide using the Power BI PowerPoint add-in, and how to work with the report page in PowerPoint.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 04/18/2022
---

# Using the Power BI add-in for PowerPoint

When you first add a live Power BI report page into PowerPoint using the Power BI add-in for Powerpoint, the initial view is determined by the [URL](./service-power-bi-powerpoint-add-in-install.md#get-the-report-page-url) you used. This initial state is called the default view. As you work with the report, you can always restore the default view if you want to go back to it.

You interact with the report just as you would in the Power BI service. You can apply filters and slicers, select data points, and drill down on data. You can interact with the report in both edit mode and presentation modes.
* In edit mode, changes you make to the report state (via filtering, selection, slicing, etc.) are saved.
* In presentation mode, such changes aren't saved. When you leave presentation mode, the report goes back to the state it was in when you left edit mode.

This behavior is useful for preparing presentations. You set up your presentation in edit mode, and then you can present it in presentation mode multiple times without having to set it up again each time.

In addition to interactive features of the report itself (filters, selection, slicers, etc.) the add-in has several menus that provide other controls and features that help you with your work.

![Screenshot of embedded Power B I report page in PowerPoint, with controls labeled.](media/service-power-bi-powerpoint-add-in-add-report/embedded-report-page-controls1.png)

### Common actions

Common things you might want to do when viewing a report page in the add-in are described below. For more details and additional options, see the detailed descriptions of the menus and buttons.
* **Interact with the report**: You can apply filters and slicers, select data points, and drill down on data just like you can in the Power BI service. See XXX for details about interacting with reports in Power BI.
* **Refresh report page**: Choose Report actions menu > Refresh. Brings over the latest data from the Power BI service. Note: Does not initiate data update from the data source.
* **Restore the original report view**: Choose Report actions menu > Reset. Returns the report page’s state to what it was when the page was originally inserted.
* **Display report page as a static image**: Choose Add-in side menu > Display as static image. Turns the current state of the live report into a static image. Select again to restore the live view.
* **Expand/collapse the filter pane**: Choose Report actions menu > Filter, or click the Show/hide filter pane.
* **Reload the report page**: Choose Add-in site menu > Reload. Causes the report to reload. Use this option if you need to bring over non-data related changes to the report itself, such as the addition/deletion of visuals, etc. 
* **Expand/collapse toolbar**: Choose Expand/collapse the toolbar button. Hiding the toolbar create more space for the report. This can be especially useful in presentation mode.


### Report options

| Option | Description |
|---|---|
|Filter|Shows or hides the filters pane, where you can filter your report, just like in the service. This option is present only if the page has filters defined.|
|Refresh|Refreshes the report page with the latest data from the Power BI service. Note: Refresh does not trigger getting data from the data sources. It just gets the latest data from the Power BI service.|
|Reset|Restores the state of the report page to the state it was in when first inserted into the PowerPoint presentation.|


### Report options

| Menu | Option | Description |
|---|---|---|
| **Report options** |||
| |Filter|Shows or hides the filters pane, where you can filter your report, just like in the service. This option is present only if the page has filters defined.|
||Refresh|Refreshes the report page with the latest data from the Power BI service. Note: Refresh does not trigger getting data from the data sources. It just gets the latest data from the Power BI service.|
||Reset|Restores the state of the report page to the state it was in when first inserted into the PowerPoint presentation.|
| **Add-in options** |||
| |Filter|Shows or hides the filters pane, where you can filter your report, just like in the service. This option is present only if the page has filters defined.|
||Refresh|Refreshes the report page with the latest data from the Power BI service. Note: Refresh does not trigger getting data from the data sources. It just gets the latest data from the Power BI service.|
||Reset|Restores the state of the report page to the state it was in when first inserted into the PowerPoint presentation.|
| **Add-in side pane** |||
| |Filter|Shows or hides the filters pane, where you can filter your report, just like in the service. This option is present only if the page has filters defined.|
||Refresh|Refreshes the report page with the latest data from the Power BI service. Note: Refresh does not trigger getting data from the data sources. It just gets the latest data from the Power BI service.|
||Reset|Restores the state of the report page to the state it was in when first inserted into the PowerPoint presentation.|

## Next steps

* [About the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add a live Power BI report page in PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
