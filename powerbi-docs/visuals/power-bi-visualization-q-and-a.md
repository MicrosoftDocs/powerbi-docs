---
title: Create a Q&A visual in a report
description: Learn how to create and format a Q&A visual in a report in Power BI Desktop or the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rien
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 07/26/2023
ms.custom: sample-salesandmarketingsample
---

# Create a Q&A visual in a report in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The Q&A visual allows users to ask natural language questions and get answers in the form of a visual. *Consumers* can use it to quickly get answers to their data. *Designers* can also use it to create visuals quickly. If you're a report designer, this article is for you. You can double-click anywhere on a report and use natural language to get started. In this article, you create, format, and customize a Q&A visual. It supports themes and other default formatting options available inside Power BI. After you create it, it behaves like any other visual, supporting cross-filtering, cross-highlighting, and bookmarks. 

If you're looking for more background about Q&A in Power BI, see [Introduction to Q&A](../natural-language/q-and-a-intro.md).

![Video that provides a Q&A visual walkthrough.](../natural-language/media/qna-visual-walkthrough.gif)

The Q&A visual consists of four core components:

- The question field, where users enter a question and see suggestions to help answer their question.
- A prepopulated list of suggested questions.
- An icon to convert the Q&A visual into a standard visual. 
- An icon to open Q&A tooling, which allows designers to configure the underlying natural language engine.

## Prerequisites

Review the following prerequisites for using Q&A in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Sales and Marketing Sample .pbix file.

1. Download the [Sales and Marketing Sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Sales and Marketing Sample** .pbix file, and then select **Open**.

   The **Sales and Marketing Sample** .pbix file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Sales and Marketing Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Sales and Marketing Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-sales-marketing-sample.png" alt-text="Screenshot that shows the Sales and Marketing Sample open in report view in the Power BI service." lightbox="media/power-bi-visualization-q-and-a/power-bi-sales-marketing-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Create a Q&A visual with a suggested question

In this exercise, we select a suggested question from Power BI to create a custom Q&A visual. 

1. Start on a blank report page and select the **Q&A visual** icon from the **Visualizations** > **Build** visual pane.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-icon.png" alt-text="Screenshot that shows how to select the Q&A visual on the Visualizations pane in Power BI.":::

   Power BI creates a new Q&A visual and supplies several Q&A suggestions to get you started, such as **top geo states by total OTHER units**.

1. Select the Q&A visual and drag the border to resize the visual.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-qna.png" alt-text="Screenshot of the resized Q&A visual on the report canvas in Power BI.":::

1. To customize your visual, select a suggested question or enter text in the **Q&A** question field ("Ask a question about your data"). In this example, we select the suggestion **top geo states by sum of revenue**.
   
   Power BI determines the appropriate visual type based on the specified suggestion or entered text. In our example, Power BI determines that a map visual is best suited.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-map.png" alt-text="Screenshot that shows the Q&A visual map created by Power BI to display the specific Q&A." border="false":::

   You can also instruct Power BI to use a specific visual type by adding the type to the text you enter in the question field. The text you enter in the question field is referred to as a _natural language query_.
   
   Keep in mind that not all visual types are useful for presenting all types of data. Certain visuals only make sense for specific types of data. For example, the data in our example isn't meaningful for presentation on a scatter chart, but it's helpful when shown as a filled map.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-specify-map.png" alt-text="Screenshot that shows the Q&A visual converted to a filled map on the report canvas." border="false":::

## Create a Q&A visual with a natural language query

In the previous example, you selected a suggested question from Power BI to create our custom Q&A visual. In this exercise, you enter your own question. As you enter your question text, Power BI helps us with autocomplete by showing suggestions and providing text feedback.

If you're unsure about what question to ask or the text to use, select the **Show all suggestions** link on the report canvas to see all the suggestions from Power BI. Another approach is to scan the data fields in the **Data** pane. You can get ideas for specific topical questions to ask about the dataset and the unique terms to use in your query.

The following image shows the report canvas with all Power BI suggestions visible and some of the **Data** pane fields expanded. Notice that after you select the link to see all suggestions from Power BI, the option changes to show _fewer_ suggestions.

:::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-terminology.png" alt-text="Screenshot that shows the report canvas with all suggestions visible and some of the Data pane fields expanded for scanning.":::

1. Start to enter a question in the **Q&A** question field.

   As you enter text, Power BI adds a red double underline to words it doesn't recognize. When possible, Power BI helps define unrecognized words. The following example shows suggestions from Power BI for an unrecognized term. The last two suggestions can satisfy our intended question.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-red-suggest.png" alt-text="Screenshot of the Q&A question field with unrecognized words underlined in red and suggested questions from Power BI." border="false":::

1. Enter more text for your same question. 

   As you enter more of the question, Power BI lets you know when it doesn't understand the question, and tries to help. In this example, Power BI suggests a different way to word the question by using terminology from the dataset. The suggested terms are underlined in blue.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-define.png" alt-text="Screenshot of the Q&A question field with suggested terms from the dataset underlined in blue and corresponding suggested questions from Power BI." border="false":::

   With Power BI's help, we're able to ask a question with all recognizable terms. Power BI displays the results as a line chart.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-type.png" alt-text="Screenshot of the Q&A visual results in Power BI." border="false":::

1. Try changing the Q&A visual to show the data in columns by adding the text "as a column chart" to your question. 

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-specify-visual.png" alt-text="Screenshot that shows how to convert the Q&A visual to a column chart by adding the text to the question." border="false":::

1. Add more visuals to the report page and see how the Q&A visual interacts with the other visuals on the page.

   In the following example, we have a line chart, column chart, a map, and a bar chart. Power BI cross-filters the line chart and map and cross-highlights the bar chart.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-filters.png" alt-text="Screenshot that shows the Q&A visual with one bar selected, and the effect on the other three visuals on the report page" border="false":::

## Format and customize the Q&A visual

The Q&A visual can be customized by using options on the **Visualizations** > **Format** visual pane, and by applying a theme.

### Apply a theme

When you select a theme, that theme is applied to the entire report page. There are many themes to choose from. Explore the themes and test them on your report to find a presentation that works well for your dataset and audience. 

1. On the Power BI menu bar, select **View**, and then select the **Themes** drop-down menu.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-themes.png" alt-text="Screenshot that shows how to select the Themes drop-down menu in Power BI Desktop." border="false":::

   The current theme for **This report** is shown at the top. Our current theme is "Classic."

1. Let's change the theme for our report. In the **Power BI** section, select the **Colorblind safe** theme. This theme colors all elements in the visual to ensure all content is readable and not hidden as a result of color blindness.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-themes-color-blind-safe.png" alt-text="Screenshot that shows how to change the theme for a report in Power BI Desktop.":::

   Power BI updates the report view to use the color-bind safe theme:

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-color-blind-safe.png" alt-text="Screenshot that shows the Q&A visual with the color-blind safe theme applied.":::

### Format the Q&A visual

Power BI lets you format the Q&A visual, including the question field and how to display suggestions. You can change everything from the background of a title to the hover color for unrecognized words.

1. Select the paintbrush icon to open the **Visualizations** > **Format** pane, and select the **Visual** section. Scan the options on the pane. 

   In this example, we configure settings in the **Question field** section. We add a gray background for text in the question field and change the underline colors for accepted and unrecognized terms.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-qna-format-visual.png" alt-text="Screenshot that shows how to configure some visual formatting options, including the question field and text underline colors." border="false":::
   
1. Now select the **General** section on the **Visualizations** > **Format** pane, and scan the options. 
   
   In this example, we adjust settings in the **Title** section. We add the title "VanArsdel revenue by year" and center the text on a cyan blue background.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-qna-format-general.png" alt-text="Screenshot that shows how to configure some general formatting options, including the visual title." border="false":::

Here's what our updates look like in the Q&A visual on the report canvas. There's an unrecognized term "revenue" shown with a double underline in purple. Power BI indicates a warning for the term "VansArsdel" by applying a dotted underline in orange. Accepted terms are underlined in cyan blue.

:::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-qna-format-updates.png" alt-text="Screenshot that shows the updated Q&A visual with customized formatting in Power BI Desktop.":::

## Convert your Q&A visual into a standard visual

At this point, you have a Q&A visual that displays data as a clustered column chart. In our example, we added a custom title and custom coloring, and applied the color-blind safe theme. Now you're ready to convert your work into a standard visual in your report and pin the visual to a dashboard.

1. At the top right of the visual, select the **Turn this Q&A result into a standard visual** icon. :::image type="icon" source="media/power-bi-visualization-q-and-a/power-bi-convert-icon.png":::

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-visual-convert.png" alt-text="Screenshot that shows how to convert the Q&A visual into a standard visual." border="false":::

   After Power BI completes the conversion, your visual is no longer a Q&A visual. It's now a standard column chart that can be pinned to a dashboard. In your report, this new visual behaves the same as other standard visuals.

1. Select the visual and notice the change to **Visualizations** pane. The standard visual is a **Column chart** and not a **Q&A visual**.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-visual-standard.png" alt-text="Screenshot that shows the standard visual is designated as a clustered column chart in Power BI." border="false":::

1. In the Power BI service (`app.powerbi.com`), you can pin the standard visual to a dashboard by selecting the pin icon.

   :::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-service-pin-visual.png" alt-text="Screenshot that shows how to pin the standard visual to a dashboard in the Power BI service." border="false":::

## Advanced features of the Q&A visual

Select the gear icon to open the Q&A visual **Tooling** pane.

:::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-qna-tooling.png" alt-text="Screenshot that shows the Q&A visual with the Tooling icon selected.":::

Use the Tooling pane to teach Q&A terms it doesn't recognize, to manage those terms, and to manage the suggested questions for this dataset and report. In the Tooling pane, you can also review questions that users have asked in this Q&A visual and see questions that users have flagged. To learn more, see [Intro to Q&A tooling to train Power BI Q&A](../natural-language/q-and-a-tooling-intro.md).

:::image type="content" source="media/power-bi-visualization-q-and-a/power-bi-qna-tooling-pane.png" alt-text="The Q&A Tooling pane.":::

## Considerations and troubleshooting

Keep in mind the following points when creating Q&A visuals in Power BI.

- If you encounter an error when creating a Q&A visual, check the [Q&A limitations](../natural-language/q-and-a-limitations.md) article. Confirm your data source configuration is supported.  

- The Q&A visual integrates with Microsoft Office and Bing to attempt to match unrecognized common words with fields in your dataset.  

## Next steps

There are several ways you can integrate natural language. For more information, see the following articles:

- [Q&A tooling](../natural-language/q-and-a-tooling-intro.md)
- [Q&A best practices](../natural-language/q-and-a-best-practices.md)
