---
title: Add support for multiple-language page navigation
description: Learn how to use buttons for navigation in a Power BI report without tabs. Translations Builder supports localization for button text.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/21/2023
---
# Add support for multiple-language page navigation

You can't display page tabs to the user in a multiple-language report because page tabs in a Power BI report don't support localization. For localization, you must provide some other means for users to navigate from page to page.

You can use a design technique where you add a navigation menu that uses buttons. When the user selects a button, the button applies a bookmark to navigate to another page. This section describes the process of building a navigation menu that supports localization using measures from the **Localized Labels** table.

This article uses the multiple-language demo project and Power BI Desktop. You don't need a Power BI license to start developing in Power BI Desktop. If you don't already have Power BI Desktop installed, see [Get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md).

## Hide tabs

When you hide all but one of the tabs in your report, none of the tabs appear in the published report. The report opens to the page of the unhidden tab. Even that tab isn't displayed.

Start by hiding all but one of the tabs.

1. Open the report in Power BI Desktop.

1. For each tab that you hide, right-click and select **Hide Page** from the context menu.

   :::image type="content" source="./media/multiple-language-page-navigation/report-page-tab.png" alt-text="Screenshot shows the tabs in a Power BI report with all but one tab hidden.":::

## Create bookmarks

Each button uses a bookmark to take the reader to a page. For more information on bookmarks, see [Create page and bookmark navigators](../create-reports/button-navigators.md).

1. From the **View** ribbon, select **Bookmarks** to display the **Bookmarks** pane.

1. In the **Bookmarks** pane, create a set of bookmarks. Each bookmark navigates to a specific page.

   1. Select a tab, starting with **Sales Summary**, which serves as the landing page.
   1. In **Bookmarks**, select **Add**.
   1. Right-click the new bookmark and select **Rename**. Enter a bookmark name, such as **GoToSalesSummary**.
   1. Right-click the bookmark name and disable **Data** and **Display**. Enable **Current Page** behavior.

      :::image type="content" source="./media/multiple-language-page-navigation/report-page-bookmark-context-menu.png" alt-text="Screenshot shows the context menu for a bookmark with Data and Display unselected.":::

   1. Repeat these steps for each of the hidden tabs. The **Bookmark** pane has the following bookmarks:

      :::image type="content" source="./media/multiple-language-page-navigation/report-page-bookmark.png" alt-text="Screenshot shows the Bookmarks pane with several values.":::

## Configure buttons

The multiple-language demo project contains buttons for navigation. To learn more about adding buttons, see [Create buttons in Power BI reports](../create-reports/desktop-buttons.md).

1. Select a button at the top of the report, starting with **Sales Summary**.
1. Under **Format**, select **Button** > **Action**. Set **Action** to **On**.
1. Under **Action**, set **Type** to **Bookmark** and **Bookmark** to the relevant bookmark, starting with **GoToSalesSummary**.
1. In the same way, configure each button in the navigation menu to apply a bookmark to navigate to a specific page.

   :::image type="content" source="./media/multiple-language-page-navigation/bookmark-navigate.png" alt-text="Screenshot shows a report with a bookmark selected and the associated action highlighted." lightbox="./media/multiple-language-page-navigation/bookmark-navigate.png":::

1. For each button, select **Button** > **Style** > **Text** and then select the function button.

   :::image type="content" source="./media/multiple-language-page-navigation/file-text-function.png" alt-text="Screenshot shows a report with a bookmark selected and the function button selected." lightbox="./media/multiple-language-page-navigation/file-text-function.png":::

1. In the **Text - State** dialog box, from the **Translated Localized Labels** table, select the entry that corresponds to that button. For instance, **Time Slices Label** for **Time Slices**.

   :::image type="content" source="./media/multiple-language-page-navigation/text-state.png" alt-text="Screenshot shows the Text State dialog box with a data field selected." lightbox="./media/multiple-language-page-navigation/text-state.png":::

1. Select **OK** to save your selection.

The report now has no visible tabs when you publish it to the Power BI service. The report opens to the **Sales Summary** page. Readers can move from page to page by using the buttons, which are localized by using the **Translated Localized Labels** table.

## Related content

- [Guidance for Power BI](overview.md)
