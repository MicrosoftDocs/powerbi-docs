---
title: Add a filter to a report in Power BI
description: Add a page filter, visualization filter, or report filter to a report in Power BI
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/20/2024
LocalizationGroup: Reports
---
# Add a filter to a report in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article explains how to add a visualization filter, page filter, or report filter to a report in Power BI. You need to be able to edit a report to add filters. The examples in this article are in the Power BI service, and the steps are almost identical in Power BI Desktop.

:::image type="content" source="media/power-bi-report-add-filter/power-bi-filter-reading.png" alt-text="Screenshot of a Power BI service report, with the Filters pane highlighted to the side of the canvas. Filters are listed for a visual and the page." lightbox="media/power-bi-report-add-filter/power-bi-filter-reading.png":::

## Other articles about filters in Power BI

- For an overview of filters, see [Filters and highlighting in Power BI reports](power-bi-reports-filters-and-highlighting.md).
- For information about the various kinds of filters that Power BI offers, from the manual and automatic to the drillthrough and pass-through, see [different kinds of filters](power-bi-report-filter-types.md).
- To see how to make filters look and act the way you want, see [format the filters in your Power BI reports](power-bi-report-filter.md).
- To find out how to interact with filters in report Reading view, see [Take a tour of the report Filters pane](../consumer/end-user-report-filter.md). You interact with reports in two different views: Reading view and Editing view. This article describes how to create filters in report Editing view.

## Levels of filters in the Filters pane

Whether you use Power BI Desktop or the Power BI service, the **Filters** pane appears along the right side of the report canvas. If you don't see the **Filters** pane, go to the upper-right corner and select the ">>" icon to expand the pane.

You can set filters at three levels for the report:

- The [visual level](#add-a-filter-to-a-visual)
- The [page level](#add-a-filter-to-an-entire-page)
- The [report level](#add-a-report-level-filter-for-an-entire-report)

This article explains how to set filters at these levels.

The examples in this article use the Retail Analysis sample. If you'd like to install this sample and follow along, see [Retail Analysis sample](sample-retail-analysis.md#get-the-built-in-sample-in-the-power-bi-service).

## Add a filter to a visual

Visuals have two kinds of filters:

- The fields that are in a visual are automatically filters for that visual.
- You can also filter on fields that aren't displayed in the visual. As the report designer, you can identify a field that isn't already the visual. Then you can add that field directly to the **Visual level filters** bucket.

### Filter with a field that's not in the visual

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Power BI Desktop, select the Report icon.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-report-view.png" alt-text="Screenshot showing where to find the Report view icon in Power BI Desktop.":::

# [Power BI service](#tab/powerbi-service)

1. In the Power BI service, select **Edit** to open your report in Editing view.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-edit-view.png" alt-text="Screenshot of the Power BI service menu bar. On the end, the Edit menu title and pencil icon are highlighted.":::

---

1. Open the **Filters**, **Visualizations**, and **Data** panes, if they're not already open.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-display-panes.png" alt-text="Screenshot of a Power BI service report in edit mode. The Filters, Visualizations, and Data panes are next to the canvas and are highlighted." lightbox="media/power-bi-report-add-filter/power-bi-display-panes.png":::

1. To make a visual active, select it. In the following image, the scatter chart on the **Overview** page is selected. The **Visualizations** pane lists all the fields in the visual. The **Filters** pane also lists the fields, under the **Filters on this visual** heading.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-default-visual-filter.png" alt-text="Screenshot of a report in edit mode. A scatter chart is selected. In the side panes, the filters on this visual and the values are highlighted." lightbox="media/power-bi-report-add-filter/power-bi-default-visual-filter.png":::
  
1. From the **Data** pane, locate the field that you want to add as a new visual-level filter. Drag that field to the **Filters** pane, into the area under **Filters on this visual** that's labeled **Add data fields here**. In this example, the **Category** field is added to that area.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-search-add-visual-filter.png" alt-text="Screenshot of a report in edit mode. The Category field is highlighted in the Data pane and in the Filters pane, among other visual-level filters." lightbox="media/power-bi-report-add-filter/power-bi-search-add-visual-filter.png":::

   The **Category** field *isn't* added to the visualization itself.

1. In the **Filter** pane, go to the filter for the **Category** field, and then select **030-Kids**. The scatter chart is updated as the filter is applied, but the other visuals stay the same.

    :::image type="content" source="media/power-bi-report-add-filter/power-bi-search-visual-filter-results-2.png" alt-text="Screenshot of a report in edit mode. The scatter chart reflects the filtered values based on the selected field." lightbox="media/power-bi-report-add-filter/power-bi-search-visual-filter-results-2.png":::

    If you save your report with this filter, report readers can interact with the **Category** filter in Reading view, selecting or clearing values.

    If you drag a *numeric column* to the filter pane to create a visual-level filter, the filter is applied to the *underlying rows of data*. For example, adding a filter on the **UnitCost** field and setting it where **UnitCost** > 20 would only show data for the Product rows where the Unit Cost was greater than 20, regardless of the total Unit Cost for the data points shown in the visual.

## Add a filter to an entire page

You can also add a page-level filter to filter an entire page.

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Power BI Desktop, open the Retail Analysis report.

2. Select the Report icon, then go to the **District Monthly Sales** page.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-report-view.png" alt-text="Screenshot showing the Report view icon in Power BI Desktop.":::

# [Power BI service](#tab/powerbi-service)

1. In the Power BI service, open the Retail Analysis report, then go to the **District Monthly Sales** page.

2. Select **Edit** to open your report in Editing view.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-edit-view.png" alt-text="Screenshot showing where to select the Edit option on the ribbon.":::
---

3. Open the Visualizations, Filters, and Fields panes, if they're not already open.

4. From the Fields pane, select the field you want to add as a new page-level filter, and drag it to **Add data fields here** in the **Filters on this page** area. In this case, we added **District Manager**.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-page-filter.png" alt-text="Screenshot showing where to drag a new filter field." lightbox="media/power-bi-report-add-filter/power-bi-page-filter.png":::

5. Select the values you want to filter and set either **Basic** or **Advanced** filtering controls.

   All the visualizations on the page are redrawn to reflect the change.

    If you save your report with the filter, report readers can interact with the filter in Reading view, selecting or clearing values.

## Add a report-level filter for an entire report

# [Power BI Desktop](#tab/powerbi-desktop)
1. In Power BI Desktop, select the Report icon.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-report-view.png" alt-text="Screenshot showing where to find the Report view icon.":::

# [Power BI service](#tab/powerbi-service)
1. Select **Edit** to open the report in Editing view.

   :::image type="content" source="media/power-bi-report-add-filter/power-bi-edit-view.png" alt-text="Screenshot showing where the Edit option appears on the ribbon.":::

---
2. Open the Visualizations and Filters pane and the Fields pane, if they're not already open.
3. From the Fields pane, select the field you want to add as a new report-level filter, and drag it into the **Report level filters** area.
4. Select the values you want to filter.

    The visuals on the active page, and on all pages in the report, change to reflect the new filter. If you save your report with the filter, report readers can interact with the filter in Reading view, selecting or clearing values.

1. Select the back arrow to return to the previous report page.

## Reset to default

Because filters *persist*, when you navigate away from the report Power BI retains the filter, slicer, and other data view changes that you made. So you can pick up where you left off when you return to the report. If you don't want your filter changes to persist, select **Reset to default** from the top menu bar.

:::image type="content" source="../media/power-bi-reset-icon.png" alt-text="Screenshot of the Reset to default icon.":::

Keep in mind that as the report creator, whatever filters you save with the report become the *default filter state* for all your report readers. When they select **Reset to default**, that's what they return to.

## Considerations and troubleshooting

- If you don't see the Fields pane, make sure you're in report [Editing view](service-interact-with-a-report-in-editing-view.md).
- If you made lots of changes to the filters and want to return to the default settings, select **Reset to default** from the top menu bar. Remember: As the report author, whatever filters are in place when you save the report *become* the default filter settings.

## Related content

- [Format the filters in your Power BI reports](power-bi-report-filter.md)

- [Take a tour of the report Filters pane](../consumer/end-user-report-filter.md)

- [Filters and highlighting in reports](power-bi-reports-filters-and-highlighting.md)

- [Different kinds of filters in Power BI](power-bi-report-filter-types.md)

More questions? Try the [Power BI Community](https://community.powerbi.com/).
