---
title: Best practices for creating mobile-optimized Power BI reports
description: This article describes best practices to help you get the best results when you create mobile-optimized version of a Power BI report.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: best-practice #Don't change
ms.date: 05/27/2024

#customer intent: As a Power BI report creator, I want use best practices so as to get the best results when I create my mobile-optimized layout of a Power BI report..

---

# Best practices for creating mobile-optimized reports

Well-designed, mobile-optimized layouts for your Power BI reports offer the best way for users to consume your data using their mobile device while on the go. This article presents best practices and techniques for getting the most out of the features Power BI offers for creating such attractive, effective, mobile-optimized views of Power BI reports.

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/mobile-desktop-comparison.png" alt-text="Image showing mobile layout and desktop layout, side by side." border="false":::

## Keep mobile devices in mind while designing your desktop report

Build each report page desktop layout together with its mobile layout counterpart. This facilitates coherence between the two.

When you duplicate a desktop report page that has both a desktop layout and a mobile layout, both layouts are duplicated. This makes for easier page formatting when you want to maintain a certain visual layout, such as a report header or page navigator, across mulitple pages. Try creating a report page with both desktop and mobile layouts that you can use as a skeleton for building the rest of the report pages.

## Focus on the most important content

Add only significant and regularly used visuals to your mobile layout. Simplify headers and designs to better suit the limited screen space on mobile devices as compared to a regular computer screen. Use the [mobile visualization pane](/power-bi/create-reports/power-bi-create-mobile-optimized-report-format-visuals) to optimize the formatting of your visuals specifically for mobile layout (remember - changes made to the mobile layout don't affect the desktop layout).

Consider the following tips:

* Minimize visual titles by using smaller font sizes. Don't use fonts smaller than 9 points.
* Remove insignificant details whenever possible, such as axis titles, gridlines, and legends.

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/font-size-illustration.png" alt-text="Image of mobile device illustrating an acceptable font size in a Power BI report." border="false":::

* Place objects such as page navigators and slicers horizontally instead of vertically.

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/object-placement.png" alt-text="Image of a mobile device showing how to effectively place objects on the mobile layout." border="false":::

* Avoid extra white space in each visual.

## Space out your visuals

Consider expanding your visuals to match the maximum width of your device, which is 324 pixels. A default margin is automatically included, even when visuals are extended to the device's maximum width, so there's no need to reserve extra space.

Don't place visuals side by side (with the exception of single element visuals such as cards or KPI visuals and non-data visuals such as buttons).

Space your visuals out, keeping at least six to eight pixels (a single arrow press on the keyboard) between elements, both vertically and horizontally. For pixel perfect design, turn off the **Snap to grid** option in the view menu.

## Arrange your visuals to tell a story

The flow of mobile layout is from top to bottom. The most important visuals should be positioned at the top of the page, whether they are the most significant data-driven visuals or slicers that illustrate a point. Visuals that are closely linked to each other should be placed one after another. Place Less significant visuals towards the bottom of the page, accessible through downward scrolling, or just leave them out of the mobile layout completely. Having fewer visuals improves both the report’s loading time and its overall performance. Remember, users can always tilt their devices to landscape orientation if they want to view the original report page in its desktop layout.

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/arrange-items-as-story.png" alt-text="Image illustrating how items can be arranged in the mobile-optimized report to tell a story." border="false":::

## Avoid in-visual vertical scroll bars

Set the height of each visual such that all the elements inside the visual are visible and not truncated. This eliminates having an in-visual vertical scroll bar in addition to the vertical scroll bar of the report page itself. Keep in mind that mobile devices vary in height.

## Stick to the standard sizes 

The following table lists the standard visuals, classified by their minimum recommended mobile size. Try to stick to these minimum standard sizes when designing your mobile layout.

* XL – minimum width: 324 px, minimum height: 270 px
* L – minimum width: 324 px, minimum height: 180 px
* M – minimum width: 324 px, minimum height: 100 px
* S – minimum width: 158 px, minimum height: 100 px

  | **Name** | **Visual size** |
  |---|---|
  | **ArcGIS Maps for Power BI** | XL |
  | **Azure map** | XL |
  | **Decomposition tree** | XL |
  | **Filled map** | XL |
  | **Key influencers** | XL |
  | **Map** | XL |
  | **Matrix** | XL |
  | **Multi-row card** | XL |
  | **Paginated report** | XL |
  | **Shape map** | XL |
  | **Table** | XL |
  | **table** | XL |
  | **100% Stacked bar chart** | L |
  | **100% Stacked column chart** | L |
  | **Area Chart** | L |
  | **Card (New)** | L |
  | **Clustered bar chart** | L |
  | **Clustered column chart** | L |
  | **Donut chart** | L |
  | **Funnel** | L |
  | **Line and clustered column chart** | L |
  | **Line and stacked column chart** | L |
  | **Line chart** | L |
  | **Metrics** | L |
  | **Pie chart** | L |
  | **Python visual** | L |
  | **Q&A** | L |
  | **R script visual** | L |
  | **Ribbon chart** | L |
  | **Scatter chart** | L |
  | **Stacked area chart** | L |
  | **Stacked bar chart** | L |
  | **Stacked column chart** | L |
  | **Tree map** | L |
  | **Waterfall chart** | L |
  | **List Slicer** | L |
  | **Button** | S |
  | **Card** | S |
  | **Gauge** | S |
  | **KPI** | S |
  | **Shape** | S |
  | **Shape** | S |
  | **Continuous Slicer (Before/between/after)** | M |
  | **Continuous Slicer (Single value/Greater then/Less then)** | M |
  | **Tile slicer** | M |
  | **Relative Date/time Slicer** | M |
  | **Bookmark navigator button** | M |
  | **Page navigator button** | M |
  | **Drop down list slicer** | M |
  | **Text Box** | M |
  | **Custom Visual** | L |

## Related content

* [Start creating a mobile optimized report in mobile layout view](power-bi-create-mobile-optimized-report-mobile-layout-view.md)
* [View Power BI reports optimized for your phone](../consumer/mobile/mobile-apps-view-phone-report.md).
* [Create a phone view of a dashboard in Power BI](service-create-dashboard-mobile-phone-view.md).