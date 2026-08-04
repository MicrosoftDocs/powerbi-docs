---
title: View Power BI Reports Optimized for Your Phone
description: Read about interacting with report pages optimized for viewing in the Power BI phone apps.
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: emininberg
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 07/07/2026
ai-usage: ai-assisted
---
# View Power BI reports optimized for your phone

**Applies to:** [!INCLUDE [applies-to-mobile](../../includes/applies-to-version/mobile.md)]


When you view a Power BI report on your phone, Power BI checks if the report is optimized for phones. If it is, Power BI automatically opens the report in the optimized view.

:::image type="content" source="./media/mobile-apps-view-phone-report/07-power-bi-phone-report-portrait.png" alt-text="Screenshot of report in portrait mode.":::

If the report doesn't have an optimized view, in portrait orientation you see a small regular version of the report page. For a closer look, you can either tip the phone to landscape orientation, or, if all you need is a quick look at the numbers, you can quite easily stay in portrait orientation and just use pinch and zoom.

:::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-phone-report-page-not-optimized.png" alt-text="Screenshot of report page not optimized.":::

All the other features of Power BI reports still work in phone-optimized reports. Read more about what you can do in:

- [Reports on iPhones](mobile-reports-in-the-mobile-apps.md).
- [Reports on Android phones](mobile-reports-in-the-mobile-apps.md).

## Filter the report page on a phone

If a report has filters defined, when you view the report on a phone you can use those filters. The report opens on your phone, filtered to the values being filtered in the report on the web.

A filled in filter icon indicates there are active filters on the page. You can change the filters on your phone.

1. Tap the filter icon in the report footer. The filters appear in panels on the filter pane. Active filters are highlighted.

    :::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-iphone-active-filters.png" alt-text="Screenshot of Power BI phone report filters pane.":::

1. Tap a filter to open it. You can then change the filter, choose between basic and advanced filtering, and more.

    :::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-iphone-basic-advanced-filtering.png" alt-text="Screenshot of Power BI phone report basic and advanced filtering.":::

The filters pane supports filter customizations done by the report creator.

## Cross-highlight visuals

Cross highlighting visuals in portrait view works the way it does in the Power BI service, and on phones in landscape view: When you select data in one visual, it highlights related data in the other visuals on that page.

Read more about [filtering and highlighting in Power BI](../../create-reports/power-bi-reports-filters-and-highlighting.md).

## Select visuals

In phone reports when you select a visual, the phone report highlights that visual and focuses on it, neutralizing canvas gestures.

With the visual selected, you can do things like scroll within the visual. To de-select a visual, just touch anywhere outside the visual area.

## Open visuals in focus mode

Phone reports also offer a focus mode. You get a bigger view of a single visual and can explore it more easily.

- In a phone report, tap the ellipsis (**...**) in the upper-right corner of a visual  > **Expand to focus mode**.
  
    :::image type="content" source="media/mobile-apps-view-phone-report/power-bi-phone-report-focus-mode.png" alt-text="Screenshot of expand to focus mode.":::

What you do in focus mode carries over to the report canvas and vice versa. For example, if you highlight a value in a visual, then return to the whole report, the report is filtered to the value you highlighted in the visual.

Some actions are only possible in focus mode, due to screen size constraints:

- **Drill down** into the information displayed in a visual. Read more about [drilling down and up](mobile-apps-view-phone-report.md#drill-down-in-a-visual) in a phone report, later in this article.
- **Sort** the values in the visual.
- **Revert**: Clear exploration steps you took on a visual and revert to the definition set when the report was created.
  
    To clear all exploration from a visual, tap the ellipsis (**...**) > **Revert**.
  
    :::image type="content" source="media/mobile-apps-view-phone-report/power-bi-phone-report-revert-levels.png" alt-text="Screenshot of revert.":::
  
    Revert is available at the report level, clearing exploration from all visuals, or at the visual level, clearing exploration from the selected visual.

## Drill down in a visual

If you define hierarchy levels in a visual, you can drill down into the detailed information displayed in a visual, then back up. You [add drill-down to a visual](../../create-reports/desktop-drillthrough.md) either in the Power BI service or in Power BI Desktop.

There are a few ways to drill down:

### Drill down on a value

1. Long tap (tap and hold) on a data point in a visual.
1. The tooltip appears. If a hierarchy exists, the tooltip footer shows drill-down and up arrow.
1. Tap the down arrow to drill down.

    :::image type="content" source="./media/mobile-apps-view-phone-report/report-drill-down.png" alt-text="Screenshot of a drill-down on a visual as seen in the Power BI mobile app." border="false":::

1. Tap the up arrow to drill up.

### Drill to next level

1. In a report on a phone, tap the ellipsis (**...**) in the upper-right corner > **Expand to focus mode**.

    :::image type="content" source="media/mobile-apps-view-phone-report/power-bi-phone-report-focus-mode.png" alt-text="Screenshot of expand to focus mode.":::

    In this example, the bars show the values for states.

1. Tap the explore icon :::image type="icon" source="./media/mobile-apps-view-phone-report/power-bi-phone-report-explore-icon.png" border="false"::: in the lower left.

    :::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-phone-report-explore-mode.png" alt-text="Screenshot of explore mode.":::

1. Tap **Show next level** or **Expand to next level**. *Show next level* shows the next level down. *Expand to next level* shows both the current level and the next level down.

    :::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-phone-report-expand-levels.png" alt-text="Screenshot of expand to next level.":::

    Now the bars show the values for cities.

    :::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-phone-report-expanded-levels.png" alt-text="Screenshot of expanded levels.":::

1. If you tap the arrow in the upper-left corner, you return to the phone report with the values still expanded to the lower level.

    :::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-back-to-phone-report-expanded-levels.png" alt-text="Screenshot of still expanded to lower level.":::

1. To go back up to the original level, tap the ellipsis (**...**) again > **Revert**.

    :::image type="content" source="media/mobile-apps-view-phone-report/power-bi-phone-report-revert-levels.png" alt-text="Screenshot of revert.":::

## Drill through from a value

Drilling through connects values in one report page with other report pages. When you drill through from a data point to another report page, the data point values filter the drilled through page, or they provide the context for the selected data.
Report authors can [define drillthrough](../../create-reports/desktop-drillthrough.md) when they create the report.

1. Long tap (tap and hold) on a data point in a visual.
1. The tooltip appears. If the report author defined drillthrough, the tooltip footer shows the drillthrough arrow.
1. Tap the arrow to drill through.

    :::image type="content" source="./media/mobile-apps-view-phone-report/report-drill-through1.png" alt-text="Screenshot of drill-through button on mobile app visual tooltip." border="false":::

1. Choose which report page to drill through.

    :::image type="content" source="./media/mobile-apps-view-phone-report/report-drill-through2.png" alt-text="Screenshot of drill-through options in the mobile app.":::

1. Use the back arrow on the app header to go back to the page you started from.

## Export data to Excel

In the Power BI mobile apps, you can export data from a supported report visual to an Excel file. The exported file is a static copy of the data at the time of export and doesn't keep a live connection to the report.

:::image type="content" source="./media/mobile-apps-view-phone-report/power-bi-export-data-excel.png" alt-text="Screenshot of the More options menu open on a visual in the Power BI mobile app, showing the Export to Excel option.":::

To export data to Excel:

1. Open the report in the Power BI mobile app.

1. Tap the visual you want to export.

1. Tap the ellipsis (**...**) to open **More options**.

1. Tap **Export to Excel**.

When the export finishes, you can open the file in Excel, share it, or save it to your device. The file uses the visual's name as its file name. If the visual doesn't have a name, the file is named *data*.

Power BI selects the export type based on the visual:

- **Table and matrix visuals** export with the current layout, up to 150,000 data intersections.
- **Other supported visual types** export as summarized data, up to 150,000 rows.

Any filters you apply to the visual are reflected in the exported data. The exported file keeps the sensitivity label of the visual or report.

> [!NOTE]
> Export to Excel from the mobile apps follows the same permissions, report settings, tenant admin settings, sensitivity labels, row-level security (RLS), and export limits as export from the Power BI service. If export is disabled for the report, visual, or user, the **Export to Excel** option might not appear or might be unavailable.

### Ensure a successful export

To get the most out of Export to Excel, keep these tips in mind:

- **Confirm export is turned on for the visual.** The **Export to Excel** option appears when the report author and your organization's admin enable export for the visual. If you don't see the option, the same visual in the Power BI service shows whether export is available.

- **Try the export in the Power BI service.** Because mobile export uses the same permissions and settings as the service, opening the report in the [Power BI service](https://app.powerbi.com) is a great way to confirm the export works and to explore more export options.

- **Check with the report author.** If you'd like export enabled for a visual, reach out to the person who created the report—they can turn on the export option for you.

## Related content

- [Create reports optimized for the Power BI mobile apps](../../create-reports/power-bi-create-mobile-optimized-report-about.md)
- [Create a phone view of a dashboard in Power BI](../../create-reports/service-create-dashboard-mobile-phone-view.md)
- [Create responsive visuals optimized for any size](../../visuals/power-bi-report-visualizations.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
