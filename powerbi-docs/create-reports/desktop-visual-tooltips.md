---
title: Create modern visual tooltips in Power BI Desktop 
description: Modern visual tooltips in Power BI Desktop let you create rich hover-based tooltips for visuals in your reports
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/06/2021
LocalizationGroup: Create reports
---
# Create modern visual tooltips in Power BI Desktop

The public preview of modern visual tooltips includes datapoint drill actions and updated styling to match your report theme.

Graphical user interface, application

## Turn on the new tooltips

### Turn on new tooltips for new reports

1. In Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Preview features**.
1. Select the **Modern visual tooltips** checkbox.

    Graphical user interface, text, application

    When you enable this preview, new reports have modern tooltips enabled by default. 

1. Restart Power BI Desktop.

### Turn on new tooltips for existing reports

To enable these new tooltips for existing reports, you need to enable them for each report.

1. Go to **File** > **Options and settings** > **Options** > **Current file** > **Report settings**.
1. Select the checkbox under **Modern visual tooltips**.  

    Graphical user interface, text, application

## Drill actions 

When you enable these new tooltips, you can drill down and up, and drill through on a data point without having to use the right-click menu or the header for the visual.  

In this example we see the user is hovering over the Word datapoint, and they have the option to Drill down on the datapoint or Drill through: 

Graphical user interface, application

Description automatically generated 

If the user clicks Drill down, the visual will update to display the next level in the hierarchy and filter to Word. 

 

 

If the user clicks Drill through, they will be able to see which pages they can drill through to: 

Graphical user interface, application

Description automatically generated 

Selecting Market Basket Analysis from the tooltip, will drill through to the Market Basket Analysis page and filter the page to Word or any other filters on the source datapoint. 

 

Updated styling 

Once you upgrade to the new tooltips, you may notice an updated styling that is based on the report’s theme.  
Here’s an example of the styling for the Default theme:  

 

Here’s an example with for the Innovate theme:  

 

Here’s an example with the Frontier theme:  

 

If you want to customize the styling further, you can always update the Tooltip theme in the Customize theme dialog: 

 

Additionally, if you want to format tooltips per visual, you can customize the settings in the Format pane: 

 

## Limitations and considerations 

Currently, drill actions are not available in the tooltip for the following scenarios: 

- Report page tooltips 
- AppSource visuals (Custom visuals) 
- Line charts 
- Area charts 
- Stacked area charts 
- Decomposition tree 

We currently do not have visual-level control to turn on or off the drill actions for the tooltips. You need to enable or disable this capability in individual reports.

## Next steps
For more information about features that are similar or interact with report tooltips, take a look at the following articles:

* [Use drillthrough in Power BI Desktop](desktop-drillthrough.md)
* [Display a dashboard tile or report visual in Focus mode](../consumer/end-user-focus.md)
