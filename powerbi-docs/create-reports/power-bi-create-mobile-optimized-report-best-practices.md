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

Using mobile layout for your Power BI reports is the best way to consume your data on the go. This article explores the best practices and techniques for designing mobile-friendly reports.

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/image1.png" alt-text="{alt-text}":::

## Keep mobile in mind while designing your desktop report

The best practice when designing a report in Power BI is to build each report page desktop layout alongside the mobile layout. This allows for coherence between desktop and mobile. 

When duplicating a desktop report page that has both desktop and mobile layout, both layouts will be duplicated. This allows for easier page formatting when you want to maintain a certain visual layout between pages such as a report header or page navigator. Try creating a report page with both desktop and mobile layouts that will be used as a skeleton for building the rest of the report pages.

## Keep it focused

Add only significant and regularly used visuals to your mobile layout. Opt for simplified headers and designs due to the limited screen space on mobile compared to desktop. Use the [mobile visualization pane](/power-bi/create-reports/power-bi-create-mobile-optimized-report-format-visuals) to optimize visuals’ format specifically for mobile layout. (changes made to the mobile layout will not affect the desktop layout). Consider these following tips:

* Minimize visual titles by using smaller font sizes, avoiding fonts smaller than 9 points.
* Remove insignificant details when possible, such as axis titles, gridlines and legend. 

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/image2.png" alt-text="{alt-text}":::

* Prefer to place objects like page navigator and slicers horizontally instead of vertically.

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/image3.png" alt-text="{alt-text}":::

* Avoid extra white space in each visual.

## Space out your visuals 

Consider expanding your visuals to match the maximum width of your device, which is 324 pixels. It's important to note that a default margin is automatically included even when visuals are extended to the device's maximum width, so there's no need to reserve extra space.

Avoid placing visuals horizontally next to each other (with the exception of single element visuals such as cards or KPI visuals and non-data visuals such as buttons). 

Space out your visuals keeping at least 6-8 pixels (single arrow press on the keyboard) between elements both vertically and horizontally. For pixel perfect design, turn off the “Snap to grid” option in the view menu. 

## Arrange your visuals to tell a story

The flow of mobile layout is from top to bottom. The most important visuals of the page should be positioned at the top, whether they are the most significant data-driven visuals or slicers that illustrate a point. Visuals closely linked to each other should be placed adjacent. Less significant visuals should find their place towards the bottom of the report page, accessible through downward scrolling, or not added to the mobile layout at all. Less visuals help improve the report’s loading time and overall performance. Keep in mind that you can always tilt your device to landscape to view the original report page. 

:::image type="content" source="./media/power-bi-create-mobile-optimized-report-best-practices/image4.png" alt-text="{alt-text}":::

## Avoid in-visual vertical scroll

Try setting the height of each visual to its full size without truncating elements inside the visual. This will eliminate having both an in-page vertical scroll along with an in-visual vertical scroll. Keep in mind that mobile devices vary in height.

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