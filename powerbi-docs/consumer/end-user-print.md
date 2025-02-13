---
title: Print from the Power BI service
description: Learn how to adjust print settings and print a dashboard, tile, or report page from the Power BI service.
author: kfollis
ms.author: kfollis
ms.reviewer: kfollis
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/08/2025
LocalizationGroup: Common tasks
---
# Print from the Power BI service

[!INCLUDE[consumer-appliesto-yynn](../includes/consumer-appliesto-yynn.md)]

Print an entire dashboard, a dashboard tile, a report page, or a report visual from the Power BI service. If your report has more than one page, you need to print each page separately. Printing isn't available from Power BI Desktop.

## Print considerations

Report *designers* create most Power BI dashboards and reports for use online. They look amazing on any device used to view them. However, when it comes time to print the content, you might not get the results you want.

You can make changes to your browser and print settings to adjust the print job. But to ensure your printouts match what you see in your browser, consider [exporting to PDF](../collaborate-share/end-user-pdf.md) and then printing the PDF instead.

## Adjust your browser print settings

When you print from Power BI, your browser opens a Print window. Every browser has a different Print window, but they all have similar options available to use and control the look of your printout.

Here are a few quick tips you can use to format your printout.

   >
1. Use the **Landscape** layout if your dashboard, report, or visual is wider than it's tall.

   :::image type="content" source="./media/end-user-print/power-bi-landscape-layout.png" alt-text="Screenshot of the print settings with Layout as Landscape selected.":::

1. Adjust the margins and scale settings to fit more onto a printed page. For example, if your tile doesn't fit on the page, you might want to change the scale to 75%.

    :::image type="content" source="./media/end-user-print/power-bi-margins.png" alt-text="Screenshot of print settings with Margins and Scale options selected.":::

Experiment with your browser's settings until you get the look you like. Some browsers even have options to print background graphics.

#### [Dashboard](#tab/dashboard)

## Print a dashboard

1. Open the dashboard that you'd like to print.

1. In the upper left corner, select **File** > **Print this page**.

   :::image type="content" source="./media/end-user-print/power-bi-dashboard-print-option.png" alt-text="Screenshot of the dropdown File menu expanded, and Print the page selected.":::

1. If your report has a sensitivity label, decide whether you should print the report or not. 

   :::image type="content" source="./media/end-user-print/power-bi-sensitivity.png" alt-text="Screenshot of the sensitivity label warning.":::

1. Adjust your [print settings](#adjust-your-browser-print-settings).
1. Select **Print**.

    :::image type="content" source="./media/end-user-print/power-bi-print-dash.png" alt-text="Screenshot of the Print Window open and the print options displayed.":::

#### [Dashboard tile](#tab/tile)

## Print a dashboard tile

1. Open the dashboard in [full screen mode](end-user-focus.md). Select the full screen icon :::image type="icon" source="./media/end-user-print/power-bi-full-screen.png "::: from the upper menu bar.

1. After the dashboard opens in full screen mode, [open the tile in Focus mode](end-user-focus.md). Hover over the tile to reveal **More options** (...), then select **Open in focus mode** or the focus icon. :::image type="icon" source="./media/end-user-print/power-bi-focus-icon.png ":::

      :::image type="content" source="./media/end-user-print/power-bi-focus-tile.png" alt-text="Screenshot of the More options menu expanded and Open in focus mode selected.":::

1. Hover over the tile to see the Options menu, then select the Print icon. :::image type="icon" source="./media/end-user-print/print-icon.png":::

    :::image type="content" source="./media/end-user-print/power-bi-menu-option.png" alt-text="Screenshot of the Options menu when in full screen mode.":::

    :::image type="content" source="./media/end-user-print/power-bi-focus.png" alt-text="Screenshot of a tile in full screen mode with the Options menu.":::

1. If your report has a sensitivity label, decide whether you should print the report or not. 

   :::image type="content" source="./media/end-user-print/power-bi-sensitivity.png" alt-text="Screenshot of the sensitivity label warning on a dashboard.":::

1. Adjust your [print settings](#adjust-your-browser-print-settings).
1. Select **Print**.

   :::image type="content" source="./media/end-user-print/power-bi-scale.png" alt-text="Screenshot of Print window with print settings displayed.":::

> [!TIP]
> If you've followed all these steps and your tile still isn't displaying the way you want it to, try these steps.
> 1. Open the Print window and make changes to the print settings. For example, change the layout, margins, and scale.
> 1. Select **Cancel** (instead of **Print**).
> 1. Go through steps 1-5 again. Your tile adjusts to the new Print window settings and is ready to print.

#### [Report page](#tab/page)

## Print a report page

Reports can be printed one page at a time.

1. Open the report, select **File** > **Print this page** to print the current report page.

    :::image type="content" source="./media/end-user-print/power-bi-print-reports.png" alt-text="Screenshot of the file menu open and Print this page selected.":::

1. If your report has a sensitivity label, decide whether you should print the report or not. 

   :::image type="content" source="./media/end-user-print/power-bi-sensitivity.png" alt-text="Screenshot of the sensitivity label warning on a report page.":::

1. Adjust your [print settings](#adjust-your-browser-print-settings).
1. Select **Print**.

#### [Report visual](#tab/visual)

## Print a report visual

1. Open the visual in [Focus mode](end-user-focus.md). Hover over the tile, then select the Focus icon :::image type="icon" source="./media/end-user-print/power-bi-focus-icon.png"::: from the top-right corner.

    :::image type="content" source="./media/end-user-print/power-bi-visual-focus.png" alt-text="Screenshot of a report visual with the focus mode icon selected.":::

1. In the upper left corner, select **File** > **Print this page** to print the visual.

    :::image type="content" source="./media/end-user-print/power-bi-visuals-print.png" alt-text="Screenshot of the Power BI service File menu open and Print this page selected.":::

1. If your report has a sensitivity label, decide whether you should print the report or not. 

   :::image type="content" source="./media/end-user-print/power-bi-sensitivity.png" alt-text="Screenshot of the sensitivity label warning on a visual.":::

1. Adjust your [print settings](#adjust-your-browser-print-settings).
1. Select **Print**.

---

## Considerations and troubleshooting

Q: Why can't I print all the report pages at once?</br>
A: Report pages can only be printed one page at a time.

Q: Why can't I print to PDF?</br>
A: You have this option only if you already configured the PDF driver in your browser. If you don't see this option, check to see if your administrator has disabled print to PDF.

Q: Why doesn't my browser match the screenshots when I select **Print**?</br>
A: The Print screens vary by browser and software version.

Q: Why am I having scaling and orientation issues (such as incorrect scaling or the dashboard doesn't fit on the page)?</br>
A: We can't guarantee the printed copy is exactly the same as it appears in the Power BI service. Things like scaling, margins, visual details, orientation, and size aren't controlled by Power BI. Try adjusting the print settings for your browser. Some of the print settings we suggest include page orientation (portrait or landscape), margin size, and scale. If these setting adjustments don't help, refer to the documentation for your specific browser.

Q: Why don't I see the print option when I hover over the visual in full screen mode?</br>
A: Go back to the dashboard or report in default view and reopen the visual in Focus mode and then Full screen mode.

## Related content

- [Share Power BI reports and dashboard with coworkers and others](../collaborate-share/service-share-dashboards.md)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)
