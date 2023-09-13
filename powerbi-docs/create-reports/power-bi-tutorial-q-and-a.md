---
title: Use Power BI Q&A to explore and create visuals on your dashboard
description: Use Power BI Q&A to explore and create new visualizations on dashboards.
author: maggiesMSFT
ms.author: mihart
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 08/26/2023
ms.custom: video-qMf7OLJfCz8
LocalizationGroup: Ask questions of your data
---
# Use Power BI Q&A on a dashboard to explore your data and create visuals

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Sometimes the fastest way to get an answer from your data is to ask a question using natural language. The Q&A feature in Power BI lets you explore your data in your own words. Q&A is available on dashboards and on reports. This article explains how to use the Q&A feature on a dashboard. For an introduction to Q&A, see [Q&A for Power BI business users](../consumer/end-user-q-and-a.md).

These articles cover using Q&A in other scenarios in Power BI:

- [Use Q&A in a report](xyz.md)
- [Create a Q&A visual in a report](xyz.md)
- [Q&A virtual analyst in Power BI iOS apps](../consumer/mobile/mobile-apps-ios-qna.md)
- [Q&A in Power BI embedded analytics](../developer/embedded/qanda.md)

Q&A is interactive and fun. Often one question leads to others as the visualizations reveal interesting paths to pursue. Watch Amanda demonstrate using Q&A to create visualizations, dig into those visuals, and then pin them to dashboards.

> [!NOTE]
> This video might use earlier versions of Power BI Desktop or the Power BI service.

   [!VIDEO https://www.youtube.com/embed/qMf7OLJfCz8?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP]

## Import the sample in the Power BI service

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Retail Analysis Sample**.

1. Select the sample. It opens in Reading mode.

   :::image type="content" source="media/power-bi-tutorial-q-and-a/power-bi-sample-read-mode.png" alt-text="Screenshot shows the Retail Analysis Sample in reading mode." lightbox="media/end-user-q-and-a-tutorial/power-bi-sample-read-mode.png":::

1. Select your workspace in the navigation bar to the left. Power BI imports the built-in sample, adding a new dashboard, report, and dataset to your current workspace.

   :::image type="content" source="media/power-bi-tutorial-q-and-a/retail-entry.png" alt-text="Screenshot shows dashboard, report, and dataset for Retail Analysis Sample.":::

   On the **Content** tab, you see the dashboard and the report, both named *Retail Analysis Sample*.

   :::image type="content" source="media/power-bi-tutorial-q-and-a/power-bi-new-report.png" alt-text="Screenshot shows the Retail Analysis Sample Content tab with dashboard and report entries.":::

## Get started

First, get familiar with the content. Take a look at the visuals on the dashboard and in the report. Get a feel for the type and range of data that is available to you.

> [!NOTE]
> If you already feel comfortable with the data, just place your cursor in the question box to open the Q&A screen.

For example:

- If a visual's axis labels and values include "sales",  "account", "month", and "opportunities", then you can confidently ask questions such as: "Which *account* has the highest *opportunity*" or "show *sales* by month as a bar chart."

- If you have website performance data in Google Analytics, you can ask Q&A about time spent on a web page, number of unique page visits, and user engagement rates. Or, if you're querying demographic data, you might ask questions about age and household income by location.

Once you're familiar with the data, head back to the dashboard and place your cursor in the question box. The Q&A screen opens.

:::image type="content" source="media/power-bi-tutorial-q-and-a/power-bi-suggestion.png" alt-text="Screenshot shows the Q&A screen with suggested questions.":::

## Use Q&A on a dashboard in the Power BI service

In the [Power BI service](/app.powerbi.com), a dashboard contains tiles pinned from one or more datasets, so you can ask questions about any of the data contained in any of those datasets. To see what reports and datasets were used to create the dashboard, select **More options (...)** from the menu bar, and then choose **See related content**.

![Screenshot of the Power BI service, highlighting the more options icon and the See related content option.](media/power-bi-tutorial-q-and-a/power-bi-view-related.png)

The Q&A question box is where you type your question using natural language. It's located in the upper-left corner of your dashboard. Don't see the Q&A box? See [Considerations and troubleshooting](../consumer/end-user-q-and-a.md#considerations-and-troubleshooting) in the **Q&A for for Power BI business users** article. Q&A recognizes the words you type and figures out where, and in which dataset, to find the answer. [Q&A also helps you form your question with auto-completion, restatement, and other textual and visual aids](q-and-a-intro.md).

![Screenshot shows a Power BI dashboard with an option to Ask a question about your data.](media/power-bi-tutorial-q-and-a/powerbi-qna.png)

The answer to your question is displayed as an interactive visualization and updates as you modify the question.

Another way Power BI helps you ask questions is with features such as: *prompts*, *autocomplete*, and *visual cues*. Power BI provides this help for Q&A on dashboards and with the Q&A visual in reports. For more information, see  [Create a visual using your own Q&A question](#create-a-visual-using-your-own-qa-question).

1. Open a dashboard and place your cursor in the question box. Even before you start typing, Q&A displays a new screen with suggestions to help you form your question. You see phrases and complete questions containing the names of the tables in the underlying datasets and might even see complete questions listed if the dataset owner has created [featured questions](service-q-and-a-create-featured-questions.md).

1. If you're unsure what type of questions to ask or terminology to use, expand **Show all suggestions** or look through the other visuals in the report. These techniques get you familiar with the terms and content of the dataset.

    :::image type="content" source="media/power-bi-tutorial-q-and-a/power-bi-show-all.png" alt-text="Screenshot shows Q&A with Show all suggestions selected.":::

   ![Screenshot highlighting Q&A suggested questions.](media/power-bi-tutorial-q-and-a/power-bi-qna-suggested-questions.png)

   You can choose one of these questions as a starting point and continue to refine the question to find a specific answer. You can also use a table name to help you word a new question.

2. Select from the list of questions, or begin typing your own question and select from the dropdown suggestions.

   ![Screenshot of an example Q&A entry with suggestions.](media/power-bi-tutorial-q-and-a/power-bi-qna-select-a-question-how-many-stores.png)

3. As you type a question, Q&A picks the best visualization to display your answer.

   ![Screenshot of an example Q&A entry, showing a map visualization.](media/power-bi-tutorial-q-and-a/power-bi-qna-how-many-stores-by-state.png)

4. The visualization changes dynamically as you modify the question.

   ![Screenshot of an example Q&A entry, showing a bar graph visualization.](media/power-bi-tutorial-q-and-a/power-bi-qna-stores-by-state-bar-chart.png)

5. When you type a question, Power BI looks for the best answer using any dataset that has a tile on that dashboard. If all the tiles are from *datasetA*, then your answer will come from *datasetA*. If there are tiles from *datasetA* and *datasetB*, then Q&A searches for the best answer from those two datasets.

   > [!TIP]
   > Be careful. If you only have one tile from *datasetA* and you remove it from your dashboard, Q&A will no longer have access to *datasetA*.
   >

6. When you're happy with the result, pin the visualization to a dashboard by selecting the pin icon in the top right corner. If the dashboard was shared with you, or is part of an app, you won't be able to pin.

   ![Screenshot of an example Q&A entry, highlighting the Pin visual.](media/power-bi-tutorial-q-and-a/power-bi-qna-pin-visual.png)



## Tell Q&A which visualization to use

With Q&A, not only can you ask your data to speak for itself, you can tell Power BI how to display the answer. Just add "as a \<visualization type>" to the end of your question. For example, "show inventory volume by plant as a map" and "show total inventory as a card". Try it for yourself.

This example uses **top states by total sales**. Power BI does its best to select which visual type to use. In this case, it's a basic map.

:::image type="content" source="../create-reports/media/power-bi-tutorial-q-and-a/power-bi-qna-suggest.png" alt-text="Screenshot shows Q&A with a map visual.":::

Tell Power BI which visual type to use by adding it to your natural language query. Keep in mind that not all visual types work or make sense with your data. For example, this data wouldn't produce a meaningful scatter chart. But it works as a filled map.

:::image type="content" source="../create-reports/media/power-bi-tutorial-q-and-a/power-bi-filled-map.png" alt-text="Screenshot shows Q&A visual as a filled map.":::


## Next steps

- [Create a Q&A visual in a report]
- [Q&A basics](../consumer/end-user-q-and-a.md)
- [Pin a tile to the dashboard from Q&A](service-dashboard-pin-tile-from-q-and-a.md)
