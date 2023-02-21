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

In the reports you receive from colleagues, you may have noticed buttons and wondered how to use them. Some buttons have words, some have arrows, others have graphics, and some even have dropdown menus. This article will teach you how to recognize buttons what to do with them.

For more information, see [Create buttons in Power BI reports](../create-reports/desktop-buttons.md).

## How to recognize a button

A button can resemble a shape, image, or icon from a report page, but if an action occurs when you select (click) it, then it's probably a button.

## Types of buttons

Report creators add buttons on reports to help you with navigation and exploration. Here are some button types: back, bookmark, arrows, Q&A, help, and blank.

### Back buttons

A back button can have an arrow icon. When you select it, Power BI takes to the previous page.  Back buttons are often used with drillthrough. Here's an example of a back button used with drillthrough.

1. Select **Word** in the bar chart and drill through to  **Market basket analysis**.

    :::image type="content" source="media/end-user-buttons/power-bi-drillthrough.png" alt-text="Screenshot of a report with a Drillthrough button.":::

1. Power BI opens the *Market basket analysis* report page and uses the selections made on the source page to filter what displays on the destination page. In this example, the **Market basket analysis** report page is filtered for **Word**.

1. To return to the previous page, select the back button that is labeled **Go back**.

    :::image type="content" source="media/end-user-buttons/power-bi-back.png" alt-text="Screenshot of the Market basket analysis report page with the back button highlighted.":::

## Bookmark buttons

Report *designers* often include bookmarks with their reports. You can view the list of report bookmarks by selecting **Bookmarks** from the upper right corner. When a report designer adds a bookmark *button*, it's just an alternate way to navigate to the particular report page associated with that bookmark. The page will have the applied filters and settings captured by the bookmark. For more information, see [Bookmarks in the Power BI service](end-user-bookmarks.md).

In the following example, the button has a bookmark icon and the bookmark name *Urban*.

:::image type="content" source="media/end-user-buttons/power-bi-bookmark.png" alt-text="Screenshot of a report with a bookmark button highlighted.":::

When selected, the bookmark button takes you to the location and settings defined for that bookmark.  In this example, the bookmark is on the *Growth opportunities* report page that is cross-filtered for **Urban**.

:::image type="content" source="media/end-user-buttons/power-bi-urban.png" alt-text="Screenshot of the report page filtered for Urban.":::

## Drillthrough buttons

There are two ways to drill through in the Power BI service. Drilling through takes you to a different report page and the data on that destination page is presented according to the filters and selections you've made on the source page.

One way to drill through in a report is to right-click a data point in a visual, select **Drill through**, and choose the destination. This method is described above in the section titled **Back button**. But sometimes the report designers use a drillthrough *button* instead, to make the action more obvious and to call attention to important insights.  

Drillthrough buttons can have more than one prerequisite. Unless you fulfill all the prerequisites, the button will not work. Let's look at an example.

Here is a drillthrough button that will take us to the *Store details* page. Hovering over the button reveals a tooltip that lets us know that we need to select both a store and a product. Until we select one of each, the button remains inactive.

![Screenshot of drillthrough button with hover tooltip.](media/end-user-buttons/power-bi-drill-two-selections.png)

Now that we've selected one product (**Word**), and one store (**Leo**), the button changes color to let us know that it is now active.

![Screenshot of Drill through to Store details button.](media/end-user-buttons/power-bi-select-both.png)

Selecting the drillthrough button takes us to the *Store* report page. The *Store* page is filtered for our selections of **Word** and **Leo**.

![Screenshot of the Store reports page.](media/end-user-buttons/power-bi-store.png)

Drillthrough buttons can also have dropdown menus that offer you a choice of destinations. Once you've made your selections on the source report page, select the destination report page for the drillthrough. In the example below, we're changing our selection to drill through to the *Market details* report page.

![screenshot of drillthrough dropdown with multiple destinations](media/end-user-buttons/power-bi-destination.png)

## Page navigation

Page navigation buttons take you to a different page in the same report. Report designers often create navigation buttons to tell a story or guide you through the report insights. In the example below, the report designer added a button on each report page that takes you back to the first page, the top-level summary page, in the report. This page navigation button is helpful because there are many pages in this report.

![Screenshot of page navigation button named Team scorecard.](media/end-user-buttons/power-bi-nav-button.png)

## Q&A buttons

Selecting a Q&A button opens the Power BI Q&A Explorer window. The Q&A window displays on top of the report page and can be closed by selecting the X. [Learn about Q&A](end-user-q-and-a.md)

![Screenshot of the Power B I Q&A Explorer window with the text Ask a question about your data.](media/end-user-buttons/power-bi-qna.png)

## Web URL

Web URL buttons open a new browser window. Report designers might add this type of button as a reference source, to link to the corporate website or a help page, or even as a link to a different report or dashboard. In the example below, the Web URL button lets you download the source file for the report.

Since the page opens in a separate window, close the window or select your Power BI tab to return to the Power BI report.

![screenshot of Download PBIX button and new browser window with download link](media/end-user-buttons/power-bi-url.png)

## Next step

[Bookmarks](end-user-bookmarks.md)
[Drill up, drill down](end-user-drill.md)
