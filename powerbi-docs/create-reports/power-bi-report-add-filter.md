---
title: Add a Filter to a Report in Power BI
description: Find out how to focus on specific data in a Power BI report by adding a page filter, a visualization filter, or a report filter to a report.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/01/2025
LocalizationGroup: Reports
# customer intent: As a Power BI user, I want to find out how to add a filter to a visual, a page, and a report in Power BI so that I can limit displayed results to categories, date ranges, and other characteristics that I specify.
---
# Add a filter to a report in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article explains how to add a visualization filter, page filter, or report filter to a report in Power BI. You need to be able to edit a report to add filters. The examples in this article are in the Power BI service, and the steps are almost identical in Power BI Desktop.

:::image type="content" source="media/power-bi-report-add-filter/power-bi-filter-reading.png" alt-text="Screenshot of a Power BI service report, with the Filters pane highlighted to the side of the canvas. Filters are listed for a visual and the page." lightbox="media/power-bi-report-add-filter/power-bi-filter-reading.png":::

## Other articles about filters in Power BI

- For an overview of filters, see [Filters and highlighting in Power BI reports](power-bi-reports-filters-and-highlighting.md).
- For information about the various kinds of filters that Power BI offers, from the manual and automatic to the drillthrough and pass-through, see [Types of filters in Power BI reports](power-bi-report-filter-types.md).
- To find out how to make filters look and act the way you want, see [Format filters in Power BI reports](power-bi-report-filter.md).
- To find out how to interact with filters in report Reading view, see [Take a tour of the report Filters pane](../explore-reports/end-user-report-filter.md). In the Power BI service, you interact with reports in two different views: Reading view and Editing view. This article describes how to create filters in Power BI Desktop and in report Editing view in the Power BI service.

## Levels of filters in the Filters pane

Whether you use Power BI Desktop or the Power BI service, the **Filters** pane appears along the right side of the report canvas. If the **Filters** pane is hidden, go to the upper-right corner and select the two greater-than symbols (>>) to expand the pane.

You can set filters at three levels for a report:

- The [visual level](#add-a-filter-to-a-visual)
- The [page level](#add-a-filter-to-an-entire-page)
- The [report level](#add-a-report-level-filter-for-an-entire-report)

This article explains how to set filters at these levels.

The examples in this article use the Retail Analysis sample. If you want to install this sample and follow along, see [Retail Analysis sample](sample-retail-analysis.md#get-the-built-in-sample-in-the-power-bi-service).

## Add a filter to a visual

Visuals have two kinds of filters:

- The fields that are in a visual are automatically filters for that visual.
- You can also use fields in your filter that aren't displayed in the visual. As the report designer, you can identify a field that isn't already in the visual. Then you can add that field directly to the bucket for visual-level filters.

### Filter with a field that's not in the visual

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Power BI Desktop, select **Report view** :::image type="icon" source="media/power-bi-report-add-filter/report-view-icon.png":::.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-report-view.png" alt-text="Screenshot of Power BI Desktop. In the upper-left corner, just below the ribbon, the Report view button, which pictures a bar chart, is highlighted.":::

# [Power BI service](#tab/powerbi-service)

1. In the Power BI service, select **Edit** to open your report in Editing view.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-edit-view.png" alt-text="Screenshot of the Power BI service menu bar. On the end, the Edit menu option and pencil button are highlighted.":::

---

2. Open the **Filters**, **Visualizations**, and **Data** panes, if they're not already open.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-display-panes.png" alt-text="Screenshot of a Power BI service report in edit mode. The Filters, Visualizations, and Data panes are next to the canvas and are highlighted." lightbox="media/power-bi-report-add-filter/power-bi-display-panes.png":::

3. To make a visual active, select it. In this example, the scatter chart on the **Overview** page is selected. The **Visualizations** pane lists all the fields in the visual. The **Filters** pane also lists the fields, under the **Filters on this visual** heading.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-default-visual-filter.png" alt-text="Screenshot of a report in edit mode. A scatter chart is selected. In the side panes, the filters on this visual and the values are highlighted." lightbox="media/power-bi-report-add-filter/power-bi-default-visual-filter.png":::
  
4. On the **Data** pane, locate the field that you want to add as a new visual-level filter. Drag that field to the **Filters** pane, into the area under **Filters on this visual** that's labeled **Add data fields here**. In this example, the **Category** field is added to that area.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-search-add-visual-filter.png" alt-text="Screenshot of a report in edit mode. The Category field is highlighted in the Data pane and in the Filters pane, among other visual-level filters." lightbox="media/power-bi-report-add-filter/power-bi-search-add-visual-filter.png":::

    The **Category** field *isn't* added to the visualization itself.

5. On the **Filters** pane, go to the filter for the **Category** field, and then select **030-Kids**. The scatter chart is updated when the filter is applied, but the other visuals stay the same.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-search-visual-filter-results.png" alt-text="Screenshot of a report in edit mode. The scatter chart shows sales data only for the 030-Kids category. Only that category is selected in the filter." lightbox="media/power-bi-report-add-filter/power-bi-search-visual-filter-results.png":::

    If you save your report with this filter, report readers can interact with the **Category** filter in Reading view by selecting or clearing values.

    If you drag a *numeric column* to the **Filters** pane to create a visual-level filter, the filter is applied to the *underlying rows of data*. For example, you can take the following steps:
    1. Add a filter on the **TotalUnits** field.
    1. On the **Filters** pane, under **Show items when the value**, select **is greater than**, and then enter **10,000**.
    1. Select **Apply filter**.

    The chart is updated to show data for products with more than 10,000 units sold.

## Add a filter to an entire page

To apply a filter to all visuals on a page, you can add a page-level filter.

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Power BI Desktop, open the Retail Analysis report.

2. Select **Report view** :::image type="icon" source="media/power-bi-report-add-filter/report-view-icon.png":::, and then go to the **District Monthly Sales** page.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-report-view.png" alt-text="Screenshot of Power BI Desktop. In the upper-left corner, directly below the ribbon, the Report view button pictures a bar chart and is highlighted.":::

# [Power BI service](#tab/powerbi-service)

1. In the Power BI service, open the Retail Analysis report, and then go to the **District Monthly Sales** page.

2. Select **Edit** to open your report in Editing view.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-edit-view.png" alt-text="Screenshot of the menu bar in the Power BI service. On the end, the Edit menu option and pencil button are highlighted.":::

---

3. Open the **Filters**, **Visualizations**, and **Data** panes, if they're not already open.

4. On the **Data** pane, locate the field that you want to add as a new page-level filter. Drag that field to the **Filters** pane, into the area under **Filters on this page** that's labeled **Add data fields here**. In this example, the **District Manager** field is added to that area.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-page-filter.png" alt-text="Screenshot of a report in edit mode. The District Manager field is highlighted in the Data pane and Filters pane, among other page-level filters." lightbox="media/power-bi-report-add-filter/power-bi-page-filter.png":::

5. On the **Filters** pane, go to the filter for the **District Manager** field. Under **Filter type**, select **Advanced filtering** or **Basic filtering**, and then set the values or conditions you want to use in your filter.

    All the visualizations on the page are redrawn to reflect the change.

    If you save your report with the filter, report readers can interact with the filter in Reading view by selecting or clearing values.

## Add a report-level filter for an entire report

To apply a filter to all visuals in a report, you can add a report-level filter.

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Power BI Desktop, select **Report view** :::image type="icon" source="media/power-bi-report-add-filter/report-view-icon.png":::.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-report-view.png" alt-text="Screenshot of Power BI Desktop. In the upper-left corner, just below the ribbon, the Report view button pictures a bar chart and is highlighted.":::

# [Power BI service](#tab/powerbi-service)

1. Select **Edit** to open the report in Editing view.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-edit-view.png" alt-text="Screenshot of the Power BI service menu bar. On the end, the pencil button and Edit menu option are highlighted.":::

---

2. Open the **Filters**, **Visualizations**, and **Data** panes, if they're not already open.

3. On the **Data** pane, locate the field that you want to add as a new report-level filter. Drag that field to the **Filters** pane, into the area under **Filters on all pages** that's labeled **Add data fields here**.

4. Select the values you want to use in your filter.

    The visuals on the active page, and on all pages in the report, change to reflect the new filter. If you save your report with the filter, report readers can interact with the filter in Reading view by selecting or clearing values.

## Reset to default values

Filters *persist* from one session to the next. As a result, when you make changes in filters, slicers, or data views in the Power BI service and then leave your report, Power BI retains your changes. When you return to the report, you can pick up where you left off.

If you don't want your filter changes to persist, you can reset the report to its default values. In Reading view in the Power BI service, go to the top menu bar, and then select **Reset to default** :::image type="icon" source="media/power-bi-report-add-filter/reset-default-settings-icon.png":::.

:::image type="content" source="../media/power-bi-reset-icon.png" alt-text="Screenshot of the menu bar in the Power BI Service in Reading view. The green Reset to default button is highlighted and shows an arrow circling back." lightbox="../media/power-bi-reset-icon.png":::

Keep in mind that as the report creator, you can save filters with the report. Those filters then become the *default filter state* for all your report readers. When they select **Reset to default** :::image type="icon" source="media/power-bi-report-add-filter/reset-default-settings-icon.png":::, they return to that default state.

## Considerations and troubleshooting

- If the **Data** pane isn't visible in the Power BI service, make sure you're in report [Editing view](service-interact-with-a-report-in-editing-view.md).
- In the Power BI service, you can make changes to the filters when you're in Reading view. If you want to return to the default settings, go to the top menu bar, and then select **Reset to default** :::image type="icon" source="media/power-bi-report-add-filter/reset-default-settings-icon.png":::. If you're the report author, whatever filters are in place when you save the report *become* the default filter settings.

## Related content

- [Take a tour of the report Filters pane](../explore-reports/end-user-report-filter.md)
- [Types of filters in Power BI reports](power-bi-report-filter-types.md)
- [Power BI forums](https://community.fabric.microsoft.com/t5/Power-BI-forums/ct-p/powerbi)
