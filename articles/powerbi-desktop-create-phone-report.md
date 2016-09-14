<properties 
   pageTitle="Optimize reports for the Power BI phone apps"
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
   ms.date="09/13/2016"
   ms.author="maggies"/>

# Optimize reports for the Power BI phone apps

Mobile devices offer the Power BI user many advantages: They’re always on and always with you, and you can access your data and insights from anywhere. You can [create reports](powerbi-service-create-a-new-report.md) in the Power BI service [(https://powerbi.com)](https://powerbi.com). You can also [create reports in Power BI Desktop](powerbi-desktop-report-view.md).

Then you view and interact with reports on the [iPhone app for Microsoft Power BI](http://go.microsoft.com/fwlink/?LinkId=522062) for iOS.

In Power BI Desktop, you can improve how reports look on phones by creating a special phone version of a report. You can adapt your report for the phone, rearranging and resizing visuals, maybe not including all of them, for an optimal experience on a phone.  

## Lay out a report page for the phone in Power BI Desktop

After you [create a report in Power BI Desktop](powerbi-desktop-report-view.md), you can optimize it for phones.

1. In Power BI Desktop, select **Report View** in the left navigation bar.

    ![](media/powerbi-desktop-create-phone-report/PBI_ReportViewInPBIDesigner_ChangeView.png)

2. On the **Home** tab, select **Change Layout**.  

    <insert desktop image – change form factor>

    You see a blank phone canvas. All of the visuals on the original report page are listed in the Visualizations pane on the right.
 
2. To add a visual to the phone layout, drag it from the Visualizations pane to the phone canvas.

    Phone reports use a grid layout, so as you drag visualizations to the mobile canvas, they snap to that grid.

    You can add some or all the master report page visuals to the phone report page. You can add each visualization only once.

    <add Gif of dragging and dropping a visualization>

3.	You can resize your visuals on the grid, as you would for dashboards and mobile dashboards.

    > [AZURE.NOTE] The phone report grid scales across phones of different sizes, so your report will look good on the small- and large-screen phones.

    <add Gif of resizing a vis to grid>

## Notes about creating phone report layouts
- For reports with multiple pages, you may optimize all the pages or only a few. 
- On a phone, you still move between pages as you normally would, using the page tabs.
- Phone reports can scroll vertically up to 20 rows  .
- Formatting is consistent between master and mobile layouts. You can’t modify formatting settings for just the phone. For example, font sizes will be the same.
- To change a visual, such as changing its formatting, dataset, filters, or any other attribute, return to the regular report authoring mode.

- > **Tip**: By default, Power BI provides titles and page names for phone reports in the mobile app. If you’ve created text visuals for titles and page names in your report, consider not adding them to your phone reports.     

## Remove a visual from the phone layout

-  To remove a visual, click the X in the top-right  of the visual on the phone canvas, or select it and press **Delete**.

    > [AZURE.NOTE] Removing a visualization here only removes it from the Mobile canvas, the visualization and the original report will not be effected.
    
    <add GIF of removing a vis>

## Slicers 
Slicers allow on-canvas filtering of report data. When designing slicers in the regular report authoring mode, here are some settings you can modify to make them more usable in phone reports:

- Decide if report readers can select only one or more than one item.
- Make the slicer vertical or horizontal. 
- Put a box around the slicer to make the report easier to scan.

Read more about [creating slicers in the Power BI service](powerbi-learning-3-4-create-slicers.md).    

## Publishing a phone report
To see the report in your Power BI app and to allow others to access it, publish your report to the Power BI service.
Read more about publishing reports from Power BI Desktop to the Power BI service.
Also, here’s more information about sharing and permissions.
Viewing optimized and non-optimized reports on a phone 
As stated before, a phone report is, in essence, a view of a regular report optimized for the phone. If you don’t optimize a report, report readers can still view it on their phones in the landscape view. Also, even if you do optimize it, if they turn their phones sideways, they’ll see the report in its original layout. 
If you only optimize some of the pages, readers will receive a slide in portrait:  , indicating the report is available in landscape.
<embed image of non-optimized page>
And they can still see the page in landscape mode.
Viewing a phone report on a phone
Scaling the report
Power BI phone reports uses a concept called “virtual pixels” to ensure an optimized experience across various devices, screen sizes and form factors.  
When creating a phone report, – visualizations are aligned to a grid. In the grid, some aspects such as square size are relative to the size of the screen, and other aspects – such as side spacing are constant.
This allows the grid to scale correctly across different screen sizes.
For example, the size of a grid “square” on an iPhone SE will be ~xx pixels. The same square on an iPhone 6s Plus will be ~YY pixels. This means that the phone report you create will look great on all modern phones.    


