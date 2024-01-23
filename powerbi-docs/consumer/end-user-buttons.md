---
title: Learn how buttons work in the Power BI service
description: Learn how to recognize buttons to launch actions including in-report navigation, drillthrough, and cross-report drillthrough.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 02/21/2023
LocalizationGroup: Reports
---
# Identify and use buttons in the Power BI service

In the reports you receive from colleagues, you might have noticed buttons and wondered how to use them. Some buttons have words, some have arrows, others have graphics, and some even have dropdown menus. This article shows you how to recognize and use buttons.

For information on how to add buttons to reports, see [Create buttons in Power BI reports](../create-reports/desktop-buttons.md).

## How to recognize a button

A button can resemble a shape, image, or icon from a report page, but if an action occurs when you select it, then it's probably a button.

## Types of buttons

Report creators add buttons on reports to help you with navigation and exploration. Here are some button types: back, bookmark, arrow, Q&A, help, and blank.

### Back buttons

A back button can have an arrow icon. When you select it, Power BI takes you to the previous page. Back buttons are often used with drillthrough. Here's an example of the steps of a back button used with drillthrough.

1. Select **Word** in the bar chart and drill through to **Market basket analysis**.

    :::image type="content" source="media/end-user-buttons/power-bi-drillthrough.png" alt-text="Screenshot of a report with Word, drill through, and Market basket analysis highlighted.":::

1. Power BI opens the *Market basket analysis* report page and uses the selections made on the source page to filter what displays on the destination page. In this example, the **Market basket analysis** report page is filtered for **Word**.

1. Select the back button labeled **Go back** to return to the previous page.

    :::image type="content" source="media/end-user-buttons/power-bi-back.png" alt-text="Screenshot of the Market basket analysis report page with the go back button highlighted.":::

## Bookmark buttons

Report *designers* often include bookmarks with their reports. You can view the list of report bookmarks by selecting **Bookmarks** from the upper right corner. When a report designer adds a bookmark *button*, it's just an alternate way to navigate to a particular report page associated with that bookmark. The page has the applied filters and settings captured by the bookmark. For more information, see [Bookmarks in the Power BI service](end-user-bookmarks.md).

In the following example, the button has a bookmark icon and the bookmark name *Urban*.

:::image type="content" source="media/end-user-buttons/power-bi-bookmark.png" alt-text="Screenshot of a report, the highlighted button shows a bookmark with the name Urban.":::

When selected, the bookmark button takes you to the location and settings defined for that bookmark.  In this example, the bookmark is on the *Growth opportunities* report page that's cross-filtered for **Urban**.

:::image type="content" source="media/end-user-buttons/power-bi-urban.png" alt-text="Screenshot of the grown opportunities report page with an arrow pointing to the total units tile.":::

## Drillthrough buttons

There are two ways to drill through in the Power BI service. Drilling through takes you to a different report page. The data on that destination page displays according to the filters and selections you've made on the source page.

One way to drill through in a report is to right-click a data point in a visual, select **Drill through**, and choose the destination. For more information on this method, see [Back buttons](#back-buttons). The second method report designers use is to add a drillthrough *button*. The button makes the action more obvious and calls attention to important insights.  

Drillthrough buttons can have more than one prerequisite. If you don't fulfill all the prerequisites, the button won't work. Let's look at an example.

Here the drillthrough button is designed to take you to the *Store details* page. Hovering over the button reveals a tooltip with the prerequisites. You need to select both a store and a product. Until you select one of each, the button remains inactive.

:::image type="content" source="media/end-user-buttons/power-bi-drill-two-selections.png" alt-text="Screenshot of an inactive drillthrough button with hover tooltip.":::

After you select one product (**Word**) and one store (**Leo**), the button changes color, signifying it's now active.

:::image type="content" source="media/end-user-buttons/power-bi-select-both.png" alt-text="Screenshot of an active drillthrough button.":::

Selecting the drillthrough button takes you to the *Store* report page. The *Store* page displays according to your filters of **Word** and **Leo**.

:::image type="content" source="media/end-user-buttons/power-bi-store.png" alt-text="Screenshot of the Store reports page filtered by Word and Leo.":::

Drillthrough buttons can also have dropdown menus that offer a choice of destinations. After you've made your selections on the source report page, select the destination report page for the drillthrough. The following example shows the selection change to drill through to the *Market details* report page.

:::image type="content" source="media/end-user-buttons/power-bi-destination.png" alt-text="Screenshot of drillthrough dropdown menu with multiple destinations.":::

## Page navigation

Page navigation buttons take you to a different page in the same report. Report designers often create navigation buttons to tell a story or guide you through the report insights. In the following example, the report designer added a button on each report page. The button takes you back to the first page (the top-level summary page) of the report. The page navigation button is helpful when there are multiple pages in a report.

:::image type="content" source="media/end-user-buttons/power-bi-nav-button.png" alt-text="Screenshot of a report with a highlighted page navigation button that returns to the first page of the report.":::

## Q&A buttons

If you select a Q&A button it opens the Power BI Q&A Explorer window. The Q&A window displays on top of the report page and closes when you select the X. For more information, see [Q&A for Power BI business users](end-user-q-and-a.md).

:::image type="content" source="media/end-user-buttons/power-bi-qna.png" alt-text="Screenshot of an open Power BI Q&A Explorer window with suggested questions.":::

## Web URL

Web URL buttons open a new browser window. Report designers might add this type of button as a reference source, to link to the corporate website or a help page, or even as a link to a different report or dashboard. In the following example, the Web URL button lets you download the source file for the report.

Since the page opens in a separate window, close the window, or select your Power BI tab to return to the Power BI report.

:::image type="content" source="media/end-user-buttons/power-bi-url.png" alt-text="Screenshot of a Web URL button that opens a new browser window with a download link.":::

## Related content

- [Bookmarks in the Power BI service](end-user-bookmarks.md)
- [Drill mode in the Power BI service](end-user-drill.md)
