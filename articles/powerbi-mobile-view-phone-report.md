<properties 
   pageTitle="View and interact with Power BI reports optimized for your phone"
   description="Read about interacting with report pages optimized for viewing in the Power BI phone apps."
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
   ms.date="09/19/2016"
   ms.author="maggies"/>

# View and interact with Power BI reports optimized for your phone 

When you create a Power BI report in Power BI Desktop, you can also create a version of that report optimized for viewing in the Power BI app on a phone.

Then, when you open a Power BI report on a phone, Power BI automatically detects if the report has been optimized for phones. If a phone-optimized report exists, the Power BI phone app automatically opens the optimized report.

If a phone-optimized report doesn’t exist, you can still open the report in the non-optimized landscape view by changing the phone’s orientation.  

Even in a phone-optimized report, if you change your phone to landscape, the report will open in the non-optimized view with the original report layout.

If only some pages are optimized, you see a message in portrait view, indicating the report is available in landscape.

![](media/powerbi-desktop-create-phone-report/06-power-bi-phone-report-page-not-optimized.png)

## Scroll in a report
You can scroll to view the entire report. When you scroll, the top bar and action menu collapse to make more room for content.

## Cross-highlight visuals
Cross highlighting visuals in phone reports works the same as it does in the Power BI service and in reports on phones in landscape view: When you select data in one visual, it highlights related data in the other visuals on that page.

Read more about [filtering and highlighting in Power BI](powerbi-service-about-filters-and-highlighting-in-reports.md).

## Select visuals
In phone reports when you select a visual, the phone report highlights that visual and focuses on it, neutralizing canvas gestures.

With the visual selected, you can do things like scroll within the visual. To de-select a visual, just touch anywhere outside the visual area.

## Open visuals in focus mode
Phone reports offer a focus mode, so you can focus on a single visual to get a bigger view of the visual and explore the visual and the report.

What you do in focus mode carries over to the report canvas and vice versa, for a seamless exploration experience.

Some actions are only possible in focus mode, due to screen size constraints:

- **Drill down**, then back up into the information displayed in the visual, if hierarchy levels are defined.
    Read more about [drilling down and up](powerbi-service-drill-down-in-a-visualization.md) in Power BI.
- **Sort** the values in the visual.
- **Revert**: Clear exploration steps you've taken on a visual and revert to the definition set when the report was created.

    Revert is available at the report level, clear all exploration from all visuals, or at the visual level, clearing all exploration from the specific visual selected.   

### See also
[Create a phone view of a dashboard in Power BI](powerbi-service-create-dashboard-phone-view.md)
