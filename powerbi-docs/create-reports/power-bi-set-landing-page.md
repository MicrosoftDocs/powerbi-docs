---
title: Set the landing page for a Power BI report
description: Learn how to set any page in a Power BI report as the landing page so report consumers always see that page first when they open the report.
author: julcsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/01/2026
LocalizationGroup: Reports
ai-usage: ai-assisted
---
# Set the landing page for a Power BI report

**Applies to:** [!INCLUDE [applies-to-desktop-service](../includes/applies-to-version/desktop-service.md)]

As a report author, you can choose any page in your report to be the landing page. The landing page is the page report consumers see first when they open the report, regardless of which page was active when you last saved or published it.

## Set a page as the landing page

You can set the landing page from the page tab context menu or from the **Format** pane.

### Use the page tab context menu

1. Right-click the page tab at the bottom of the report.
1. Select **Set as landing page**.

A landing page icon appears on the page tab to indicate which page is set as the landing page. The report footer also identifies the current landing page.

### Use the Format pane

1. With nothing selected on the page canvas, open the **Format** pane.
1. Expand **Page information**.
1. Turn on the **Landing page** toggle.

## Change the landing page

Only one page can be set as the landing page at a time. If you set another page as the landing page, that page becomes the new landing page and the previous page is no longer marked.

## Unset the landing page

To remove the landing page setting:

- In the **Format** pane, expand **Page information** and turn off the **Landing page** toggle.

  -or-

- Right-click the page tab and select **Set as landing page** again to toggle it off.

When no page is set as the landing page, Power BI uses the default behavior and opens the report on the page that was active when the report was saved or published.

## Considerations and limitations

- Only one page in a report can be set as the landing page.
- Hidden pages can be set as the landing page. Report consumers always see the hidden page when they open the report. If they navigate away to another page, the hidden page no longer appears in the page listing.

## Related content

- [Apply page size and settings in a Power BI report](power-bi-report-display-settings.md)
- [Use report view in Power BI Desktop](desktop-report-view.md)
- [Create page and bookmark navigators](button-navigators.md)
