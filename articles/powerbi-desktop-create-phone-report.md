<properties 
   pageTitle="Create reports optimized for the Power BI phone apps"
   description="Learn how to create a special report layout in Power BI Desktop for the Power BI phone apps."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="mblythe" 
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="09/16/2016"
   ms.author="maggies"/>

# Create reports optimized for the Power BI phone apps

When you [create a report in Power BI Desktop](powerbi-desktop-report-view.md), you can improve how it looks on phones by creating a special phone version of the report. You can adapt your report for the phone, rearranging and resizing visuals, maybe not including all of them, for an optimal experience on a phone.  

![](media/powerbi-desktop-create-phone-report/07-power-bi-phone-report-portrait.png)

## Lay out a report page for the phone in Power BI Desktop

After you [create a report in Power BI Desktop](powerbi-desktop-report-view.md), you can optimize it for phones.

1. In Power BI Desktop, select **Report View** in the left navigation bar.

    ![](media/powerbi-desktop-create-phone-report/PBI_ReportViewInPBIDesigner_ChangeView.png)

2. On the **Home** tab, select **Change Layout**.  

    ![](media/powerbi-desktop-create-phone-report/01_change_form_factor.gif)

    You see a blank phone canvas. All of the visuals on the original report page are listed in the Visualizations pane on the right.
 
2. To add a visual to the phone layout, drag it from the Visualizations pane to the phone canvas.

    Phone reports use a grid layout. As you drag visuals to the mobile canvas, they snap to that grid.

    ![](media/powerbi-desktop-create-phone-report/02_Dragging_and_droping_a_vis.gif)

    You can add some or all the master report page visuals to the phone report page. You can add each visual only once.

3.	You can resize your visuals on the grid, as you would for tiles on dashboards and mobile dashboards.

    > [AZURE.NOTE] The phone report grid scales across phones of different sizes, so your report will look as good on small- and on large-screen phones.

    ![](media/powerbi-desktop-create-phone-report/03_Resizing_a_viz_to_grid.gif)

## Notes about creating phone report layouts
- For reports with multiple pages, you can optimize all the pages or only a few. 
- On a phone, you still move between pages as you normally would, using the page tabs.
- Phone reports can scroll vertically up to 20 rows.
- You can’t modify formatting settings for just the phone. Formatting is consistent between master and mobile layouts. For example, font sizes will be the same.
- To change a visual, such as changing its formatting, dataset, filters, or any other attribute, return to the regular report authoring mode.

    > **Tip**: By default, Power BI provides titles and page names for phone reports in the mobile app. If you’ve created text visuals for titles and page names in your report, consider not adding them to your phone reports.     

## Remove a visual from the phone layout

-  To remove a visual, click the X in the top-right  of the visual on the phone canvas, or select it and press **Delete**.

    > [AZURE.NOTE] Removing a visual here only removes it from the Mobile canvas, the visual and the original report will not be effected.
    
    ![](media/powerbi-desktop-create-phone-report/05_Removing_a_vis.gif)

## Slicers 
Slicers offer on-canvas filtering of report data. When designing slicers in the regular report authoring mode, you can modify some slicer settings to make them more usable in phone reports:

- Decide if report readers can select only one or more than one item.
- Make the slicer vertical or horizontal. 
- Put a box around the slicer to make the report easier to scan.

Read more about [creating slicers in the Power BI service](powerbi-learning-3-4-create-slicers.md).

## Publishing a phone report
- To expose the phone version of the report in the Power BI mobile app, [publish your report from Power BI Desktop to the Power BI service](powerbi-desktop-upload-desktop-files.md).

Read more about [sharing and permissions in Power BI](powerbi-service-how-should-i-share-my-dashboard.md).

## Optimized and non-optimized reports on a phone 

In the mobile apps on phones, Power BI automatically detects optimized and non-optimized phone reports. If a phone-optimized report exists, the Power BI phone app automatically opens the report in phone report mode.

If a phone-optimized report doesn’t exist, the report will open in the non-optimized, landscape view.  

When in a phone report, changing the phone’s orientation to landscape will open the report in the non-optimized view with the original report layout, whether you optimize the report or not.

If you only optimize some pages, readers will see a message in portrait view, indicating the report is available in landscape.

![](media/powerbi-desktop-create-phone-report/06-power-bi-phone-report-page-not-optimized.png)

They can turn their phones sideways to see the page in landscape mode.

## Interact with optimized phone reports on a phone

### Scroll in a report
You can scroll to view the entire report. When you scroll, the top bar and action menu collapse to make more room for content.

### Cross-highlight
Cross highlighting visuals in phone reports works the same as it does in the Power BI service and in reports on phones in landscape view: When you select data in one visual, it highlights related data in the other visuals on that page.

Read more about [filtering and highlighting in Power BI](powerbi-service-about-filters-and-highlighting-in-reports.md).

### Select visuals
In phone reports when you select a visual, the phone report highlights that visual and focuses on it, neutralizing canvas gestures.

With the visual selected, you can do things like scroll within the visual. To de-select a visual, just touch anywhere outside the visual area.

### Open visuals in focus mode
Phone reports offer a focus mode, so you can focus on a single visual to get a bigger view of the visual and explore the visual and the report.

What you do in focus mode carries over to the report canvas and vice versa, for a seamless exploration experience.

Some actions are only possible in focus mode, due to screen size constraints:

- **Drill down**, then back up into the information displayed in the visual, if hierarchy levels are defined.
    Read more about [drilling down and up](powerbi-service-drill-down-in-a-visualization.md) in Power BI.
- **Sort** the values in the visual.
- **Revert**: Clear exploration steps you've taken on a visual and revert to the definition set when the report was created.

    Revert is available at the report level, clear all exploration from all visuals, or at the visual level, clearing all exploration from the specific visual selected.  


## Scaling the report
Power BI phone reports uses a concept called “virtual pixels” to ensure an optimized experience across various devices, screen sizes, and form factors.  

When creating a phone report, visuals are aligned to a grid. In the grid, some aspects such as square size are relative to the size of the screen, and other aspects such as side spacing are constant.
This allows the grid to scale correctly across different screen sizes.

For example, the size of a grid “square” on an iPhone SE will be ~xx pixels. The same square on an iPhone 6s Plus will be ~YY pixels. This means that the phone report you create will scale well on all modern phones.    

