---
title: View Power BI reports optimized for your phone
description: Read about interacting with report pages optimized for viewing in the Power BI phone apps.
author: mshenhav
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 04/18/2019
ms.author: mshenhav

---
# View Power BI reports optimized for your phone

Applies to:

| ![iPhone](./media/mobile-apps-view-phone-report/ios-logo-40-px.png) | ![Android phone](./media/mobile-apps-view-phone-report/android-logo-40-px.png) |
|:--- |:--- |
| iPhones |Android phones |

When you view a Power BI report on a phone, Power BI detects if the report has been optimized for phones and automatically opens the optimized report in portrait view.

![Report in portrait mode](./media/mobile-apps-view-phone-report/07-power-bi-phone-report-portrait.png)

If a phone-optimized report doesn’t exist, the report still opens, but in the non-optimized landscape views. Even in a phone-optimized report, if you turn your phone sideways, the report opens in the non-optimized view with the original report layout. If only some pages are optimized, you see a message in portrait view, indicating the report is available in landscape.

![Report page not optimized](./media/mobile-apps-view-phone-report/06-power-bi-phone-report-page-not-optimized.png)

All the other features of Power BI reports still work in phone-optimized reports. Read more about what you can do in:

* [Reports on iPhones](mobile-reports-in-the-mobile-apps.md). 
* [Reports on Android phones](mobile-reports-in-the-mobile-apps.md).

## Filter the report page on a phone
If a phone-optimized report has filters defined, when you view the report on a phone you can use those filters. The report opens on your phone filtered to the values being filtered in the report on the web, with a message that there are active filters on the page. You can change the filters on your phone.

1. Tap the filter icon ![Phone filter icon](./media/mobile-apps-view-phone-report/power-bi-phone-filter-icon.png) at the bottom of the page. 
2. Use basic or advanced filtering to see the results you're interested in.
   
    ![Phone BI phone report advanced filter](./media/mobile-apps-view-phone-report/power-bi-iphone-advanced-filter-toronto.gif)

## Cross-highlight visuals
Cross highlighting visuals in phone reports works the same as it does in the Power BI service and in reports on phones in landscape view: When you select data in one visual, it highlights related data in the other visuals on that page.

Read more about [filtering and highlighting in Power BI](../../power-bi-reports-filters-and-highlighting.md).

## Select visuals
In phone reports when you select a visual, the phone report highlights that visual and focuses on it, neutralizing canvas gestures.

With the visual selected, you can do things like scroll within the visual. To de-select a visual, just touch anywhere outside the visual area.

## Open visuals in focus mode
Phone reports also offer a focus mode, so you can get a bigger view of a single visual and explore it and the report.

* In a phone report, tap the ellipsis (**...**) in the upper-right corner of a visual  > **Expand to focus mode**.
  
    ![Expand to focus mode](././media/mobile-apps-view-phone-report/power-bi-phone-report-focus-mode.png)

What you do in focus mode carries over to the report canvas and vice versa, for a seamless exploration experience. For example, if you highlight a value in a visual, then return to the whole report, the report as a whole will be filtered to the value you highlighted in the visual.

Some actions are only possible in focus mode, due to screen size constraints:

* **Drill down** into the information displayed in a visual. Read more about [drilling down and up](mobile-apps-view-phone-report.md#drill-down-in-a-visual) in a phone report, below.
* **Sort** the values in the visual.
* **Revert**: Clear exploration steps you've taken on a visual and revert to the definition set when the report was created.
  
    To clear all exploration from a visual, tap the ellipsis (**...**) > **Revert**.
  
    ![Revert](././media/mobile-apps-view-phone-report/power-bi-phone-report-revert-levels.png)
  
    Revert is available at the report level, clear all exploration from all visuals, or at the visual level, clearing all exploration from the specific visual selected.   

## Drill down in a visual
If hierarchy levels are defined in a visual, you can drill down into the detailed information displayed in a visual, then back up. You [add drill-down to a visual](../end-user-drill.md) either in the Power BI service or in Power BI Desktop. Drill-down only works in phone-optimized Power BI reports when you view them on a phone. 

1. In a report on a phone, tap the ellipsis (**...**) in the upper-right corner > **Expand to focus mode**.
   
    ![Expand to focus mode](././media/mobile-apps-view-phone-report/power-bi-phone-report-focus-mode.png)
   
    In this example, the bars show the values for states.
2. Tap the explore icon ![Explore icon](./media/mobile-apps-view-phone-report/power-bi-phone-report-explore-icon.png) in the lower-left.
   
    ![Explore mode](./media/mobile-apps-view-phone-report/power-bi-phone-report-explore-mode.png)
3. Tap **Show next level** or **Expand to next level**.
   
    ![Expand to next level](./media/mobile-apps-view-phone-report/power-bi-phone-report-expand-levels.png)
   
    Now the bars show the values for cities.
   
    ![Expanded levels](./media/mobile-apps-view-phone-report/power-bi-phone-report-expanded-levels.png)
4. If you tap the arrow in the upper-left corner, you return to the phone report with the values still expanded to the lower level.
   
    ![Still expanded to lower level](./media/mobile-apps-view-phone-report/power-bi-back-to-phone-report-expanded-levels.png)
5. To go back up to the original level, tap the ellipsis (**...**) again > **Revert**.
   
    ![Revert](././media/mobile-apps-view-phone-report/power-bi-phone-report-revert-levels.png)

## Next steps
* [Create reports optimized for the Power BI phone apps](../../desktop-create-phone-report.md)
* [Create a phone view of a dashboard in Power BI](../../service-create-dashboard-mobile-phone-view.md)
* [Create responsive visuals optimized for any size](../../visuals/desktop-create-responsive-visuals.md)
* More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

