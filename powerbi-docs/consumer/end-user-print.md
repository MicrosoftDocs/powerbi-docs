---
title: Print from the Power BI service
description: Learn how to adjust print settings and print dashboard, tile, or report page from the Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: mihart
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 02/10/2023
LocalizationGroup: Common tasks
---
# Print from the Power BI service

[!INCLUDE[consumer-appliesto-yynn](../includes/consumer-appliesto-yynn.md)]

Print an entire dashboard, a dashboard tile, a report page, or a report visual from the Power BI service. If your report has more than one page, you'll need to print each page separately.

## Print considerations

Most Power BI dashboards and reports are created by report *designers* for use online and to look amazing when displayed on a variety of devices. Your browser controls how the content looks on paper when you print a report.

There are browser settings to adjust the printout, but you still might not get the result you want. Consider [exporting your report to PDF](end-user-pdf.md), then print the PDF instead.

## Adjust browser print settings

When you print from Power BI, your browser opens a Print window. Every browser has a different Print window, but you'll find that they all have similar options available to use and control the look of your printout.

Here are a few quick tips you can use to format your printout.

   >
1. Use the **Landscape** layout if your dashboard, report, or visual is wider than it is tall.

   ![Print dialog showing Layout as Landscape](./media/end-user-print/power-bi-landscape-layout.png)

1. To fit more onto a printed page, adjust things like margins and scale.

    ![Print dialog showing More settings](./media/end-user-print/power-bi-margins.png)

Experiment with your particular browser's settings until you get the look that you like. Some browsers even have options to print background graphics.

## Print a dashboard

1. Open the dashboard that you'd like to print.
1. In the upper left corner, select **File** and choose **Print this page**.

    ![Dashboard print option](./media/end-user-print/power-bi-dashboard-print-options.png)

1. The Print window for your browser opens. Choose the settings. For example, if your dashboard is wider than it is long, you may want to change the layout to **Landscape**. Select **Print**.

    ![print dialog](./media/end-user-print/power-bi-print-dash.png)

## Print a dashboard tile

1. Open the dashboard in [full screen mode](end-user-focus.md) by selecting the full screen icon ![full screen icon](./media/end-user-print/power-bi-full-screen.png) from the upper menu bar.

1. [Open the tile in Focus mode](end-user-focus.md) by hovering to reveal **More options** (...) and choosing **Open in focus mode** or the focus icon ![Focus icon](./media/end-user-print/power-bi-focus-icon.png).

    ![ellipses menu](./media/end-user-print/power-bi-focus-tile.png)

1. Hover over the tile to reveal the Options menu.

    ![full screen options menu](./media/end-user-print/power-bi-menu-option.png)

    ![full screen mode](./media/end-user-print/power-bi-focus.png)

1. Select the Print icon ![print icon](./media/end-user-print/print-icon.png).

1. The Print window for your browser opens. Choose the settings. For example, if your tile isn't fitting on the page, you may want to change the scale to 75%. Select **Print**.

    ![print window](./media/end-user-print/power-bi-scale.png)

> [!TIP]
> If you've followed all of these steps and your tile still isn't displaying the way you want it to, try the following.

> 1. Open the Print window and make the changes to the print settings that you believe will result in the best printout. For example, change the layout, margins, and scale.
> 1. But, instead of printing, select **Cancel**.
> 1. Go through steps 1-5 again. Your tile will adjust to the new Print window settings and be ready to print.

## Print a report page

Reports can be printed one page at a time.

1. Open the report and select **File** > **Print this page** to print the current report page.

    ![Power BI File menu](./media/end-user-print/power-bi-print-report.png)
1. The Print window for your browser opens.

1. Follow the printing steps from **Print a dashboard**, above.

## Print a report visual

1. [Open the visual in Focus mode](end-user-focus.md) by hovering over the tile and selecting the Focus icon ![Focus icon](./media/end-user-print/power-bi-focus-icon.png) from the top-right corner.

    ![Open visual in Focus mode](./media/end-user-print/power-bi-visual-focus.png)

1. From the upper left corner, select **File** > **Print this page** to print the visual.

    ![Screenshot of the Power BI File menu](./media/end-user-print/power-bi-visual-print.png)

1. Follow the printing steps from **Print a dashboard**, above.

## Considerations and troubleshooting

* Q: I cannot print all the report pages at once.
* A: That is correct. Report pages can only be printed one page at a time.
* Q: I cannot print to PDF.
* A: You will only see this option if you've already configured the PDF driver in your browser.
* Q: What I see when I select **Print** doesn't match what you're showing me here.
* A: The Print screens vary by browser and software version.
* Q: My printout isn't scaled correctly.  My dashboard doesn't fit on the page. Other scaling and orientation questions.
* A: We cannot guarantee that the printed copy will be exactly the same as it appears in the Power BI service. Things like scaling, margins, visual details, orientation, and size are not controlled by Power BI. Try adjusting the print settings for your browser. Some of the ones we suggest above are page orientation (portrait or landscape), margin size, and scale. If these don't help, refer to the documentation for your specific browser.
* Q: When I'm printing from Full screen mode, I don't see the print option when I hover over the visual.
* A: Go back to the dashboard or report in default view and re-open the visual in Focus mode and then Full screen mode.

## Next steps

[Share dashboards and reports with colleagues and others](../collaborate-share/service-share-dashboards.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
