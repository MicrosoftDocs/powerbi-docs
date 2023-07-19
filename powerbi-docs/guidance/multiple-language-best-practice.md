---
title: ""
description: 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/21/2023
---
# Use best practices to localize Power BI reports

When it comes to localizing software, there are some universal principals to keep in mind. The first is to plan for localization from the start of any project. It's significantly harder to add localization support to an existing dataset or report that was initially built without any regard for Internationalization or localization. This fact is especially true with Power BI reports because there are so many popular design techniques that don't support localization. You might find that much of the work for adding localization support to existing Power BI reports involves moving backward and undoing the things that don't support localization before you can move forward with design techniques that do support localization.

## Account for text size

Another important concept in localization is to plan for growth. A label that's 400 pixels wide when displayed in English could require a greater width when translated into another language. If you optimize the width of your labels for text in English, you might find that translations in other languages introduce unexpected line breaks or get cut off which, in turn, creates a compromised user experience.

Adding a healthy degree of padding to localized labels is the norm when developing Internationalized software and it's essential that you test your reports with each language you plan to support. In essence, you need to ensure your report layouts looks the way you expect with any language you have chosen to support.

## Add support for page navigation

As you recall, you can't display page tabs to the user in a multiple-language report because page tabs in a Power BI report don't support localization. Therefore, you must provide some other means for users to navigate from page to page. This task can be accomplished using a design technique where you add a navigation menu using buttons. When the user selects a button, the button is configured to apply a bookmark to navigate to another page. Let's step through the process of building a navigation menu that supports localization using measures from the **Localized Labels** table.

The first thing you need to do when building a custom navigation menu is to hide every page in the report except for the first page, which acts as the report landing page.

:::image type="content" source="./media/multiple-language-best-practice/report-page-tab.png" alt-text="Screenshot shows the tabs in a Power VI report with all but one tab hidden." lightbox="./media/multiple-language-best-practice/report-page-tab.png":::

Next, create a set of bookmarks. Each bookmark should be created to navigate to a specific page. The **live demo** sample demonstrates this technique by adding a bookmark for each page supported by the navigation menu.

:::image type="content" source="./media/multiple-language-best-practice/report-page-bookmark.png" alt-text="Screenshot shows the Bookmarks pan with several values.":::

When creating bookmarks for navigation, you should disable **Data** and **Display** and only enable **Current Page** behavior.

:::image type="content" source="./media/multiple-language-best-practice/report-page-bookmark-context-menu.png" alt-text="Screenshot shows the context menu for a bookmark with Data and Display unselected.":::

The next step is to configure each button in the navigation menu to apply a bookmark to navigate to a specific page.

:::image type="content" source="./media/multiple-language-best-practice/bookmark-navigate.png" alt-text="Screenshot shows a report with a bookmark selected and the associated action highlighted." lightbox="./media/multiple-language-best-practice/bookmark-navigate.png":::

After you've configured a button with a bookmark, the final step is to configure the **Text** property with a localized label.

:::image type="content" source="./media/multiple-language-best-practice/file-text-function.png" alt-text="Screenshot shows a report with a bookmark selected and the function button selected." lightbox="./media/multiple-language-best-practice/file-text-function.png":::

The **Text** property of each button can be configured with a measure from the **Translated Localized Labels** table.

:::image type="content" source="./media/multiple-language-best-practice/text-state.png" alt-text="Screenshot shows the Text State dialog box with a data field selected." lightbox="./media/multiple-language-best-practice/text-state.png":::

> At this point, you've learned how to create the **Localized Labels** table and how to add localized report labels to a .pbix project. You also learned how to generate the **Translated Localized Labels** table and to bind the measures in that table to report elements such as Card visuals, shapes and buttons. These are the localization techniques you continue to use as you create and maintain reports that are required to support multiple-languages. Now this section concludes with some general advice for building Power BI reports that support multiple-languages.

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

To use the shared dataset approach, create one .pbix project file with a dataset and an empty report, which remains unused. Once this dataset has been deployed to the Power BI service, report builders can connect to it using Power BI Desktop to create report-only .pbix files. This approach makes it possible for the teams building reports to build .pbix project files with report layouts that can be deployed and updated independently of the underlying dataset.

:::image type="content" source="./media/multiple-language-best-practice/shared-dataset-scenario.png" alt-text="Diagram shows two report layouts in separate files associated with a dataset definition in a third file that also has an unused report.":::

## Next steps

