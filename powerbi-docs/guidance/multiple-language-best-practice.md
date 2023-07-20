---
title: Use best practices to localize Power BI reports
description: Learn about best practices for your multiple-language report projects, such as allowing for text size, page navigation, and packaging reports.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/21/2023
---
# Use best practices to localize Power BI reports

When it comes to localizing software, there are some universal principals to keep in mind. The first is to plan for localization from the start of any project. It's harder to add localization support to an existing dataset or report that was initially built without any regard for internationalization or localization.

This fact is especially true with Power BI reports because there are so many popular design techniques that don't support localization. Much of the work for adding localization support to existing Power BI reports involves undoing things that don't support localization. Only after that work can you move forward with design techniques that do support localization.

## Package a dataset and reports in project files

Before you proceed, you need to decide how to package your dataset definitions and report layouts for distribution. There are two popular approaches used by content creators who work with Power BI Desktop.

- Single .pbix project file
- Multiple project files with a shared dataset

For adding multiple-language support to a Power BI solution, choose either of these approaches.

### Single project file

You can package both a report layout and its underlying dataset definition together. Deploy a reporting solution like this by publishing the project into a Power BI service workspace. If you need to update either the report layout or the dataset definition, upgrade by publishing an updated version of the .pbix project file.

:::image type="content" source="./media/multiple-language-best-practice/single-pbix-scenario.png" alt-text="Diagram shows a report layout and dataset definition in a single pbix file.":::

### Shared dataset

The single project file approach doesn't always provide the flexibility you need. Maybe one team is responsible for creating and updating datasets while other teams are responsible for building reports. It might make sense to share a dataset with reports in separate .pbix project files.

:::image type="content" source="./media/multiple-language-best-practice/shared-dataset-scenario.png" alt-text="Diagram shows two report layouts in separate files associated with a dataset definition in a third file that also has an unused report.":::

To use the shared dataset approach, create one .pbix project file with a dataset and an empty report, which remains unused. After this dataset has been deployed to the Power BI service, report builders can connect to it using Power BI Desktop to create report-only .pbix files. This approach makes it possible for the teams building reports to build .pbix project files with report layouts that can be deployed and updated independently of the underlying dataset.

## Account for text size

Another important concept in localization is to plan for growth. A label that's 400 pixels wide when displayed in English could require a greater width when translated into another language. If you optimize the width of your labels for text in English, you might find that translations in other languages introduce unexpected line breaks or get cut off. These effects compromise the user experience.

Adding a healthy degree of padding to localized labels is the norm when developing internationalized software. It's essential that you test your reports with each language you plan to support. You need to be sure that your report layouts look the way you expect with any language you have chosen to support.

## Add support for page navigation

You can't display page tabs to the user in a multiple-language report because page tabs in a Power BI report don't support localization. For localization, you must provide some other means for users to navigate from page to page.

You can use a design technique where you add a navigation menu that uses buttons. When the user selects a button, the button applies a bookmark to navigate to another page. This section describes the process of building a navigation menu that supports localization using measures from the **Localized Labels** table.

1. Open the report in Power BI Desktop.

1. You need to hide every page in the report except the first page. For each tab that you hide, right-click and select **Hide Page** from the context menu.

   :::image type="content" source="./media/multiple-language-best-practice/report-page-tab.png" alt-text="Screenshot shows the tabs in a Power VI report with all but one tab hidden.":::

1. From the **View** ribbon, select **Bookmarks** to display the **Bookmarks** pane.

1. In the **Bookmarks** pane, create a set of bookmarks. Each bookmark navigates to a specific page.

   1. Select a tab, starting with **Sales Summary**, which serves as the landing page.
   1. In **Bookmarks**, select **Add**.
   1. Right-click the new bookmark and select **Rename**. Enter a bookmark name, such as **GoToSalesSummary**.
   1. Right-click the bookmark name and disable **Data** and **Display**. Enable **Current Page** behavior.

      :::image type="content" source="./media/multiple-language-best-practice/report-page-bookmark-context-menu.png" alt-text="Screenshot shows the context menu for a bookmark with Data and Display unselected.":::

   1. Repeat these steps for each of the hidden tabs. The **Bookmark** pane has the following bookmarks:

      :::image type="content" source="./media/multiple-language-best-practice/report-page-bookmark.png" alt-text="Screenshot shows the Bookmarks pan with several values.":::

1. Select a button at the top of the report, starting with **Sales Summary**.
1. Under **Format**, select **Button** > **Action**. Set **Action** to **On**.
1. Under **Action**, set **Type** to **Bookmark** and **Bookmark** to the relevant bookmark, starting with **GoToSalesSummary**.
1. In the same way, configure each button in the navigation menu to apply a bookmark to navigate to a specific page.

   :::image type="content" source="./media/multiple-language-best-practice/bookmark-navigate.png" alt-text="Screenshot shows a report with a bookmark selected and the associated action highlighted." lightbox="./media/multiple-language-best-practice/bookmark-navigate.png":::

1. For each button, select **Button** > **Style** > **Text** and then select the function button.

   :::image type="content" source="./media/multiple-language-best-practice/file-text-function.png" alt-text="Screenshot shows a report with a bookmark selected and the function button selected." lightbox="./media/multiple-language-best-practice/file-text-function.png":::

1. In the **Text - State** dialog box, from the **Translated Localized Labels** table, select the entry that corresponds to that button. For instance, **Sales by Country Label** for **Sales by Country**.

   :::image type="content" source="./media/multiple-language-best-practice/text-state.png" alt-text="Screenshot shows the Text State dialog box with a data field selected." lightbox="./media/multiple-language-best-practice/text-state.png":::

The report now has no visible tabs when you publish it to the Power BI service. The report opens to the **Sales Summary** page. Readers can move from page to page by using the buttons, which are localized by using the **Translated Localized Labels** table.


## Next steps

- [Guidance for Power BI](overview.md)
