---
title: Q&A tutorial for Power BI business users
description: Learn how to explore a sample in the Power BI service and create a visual by using natural language in Q&A.
author: mihart
ms.author: mihart
ms.reviewer: mohammad.ali
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 02/24/2023
LocalizationGroup: Ask questions of your data
---

# Q&A tutorial

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This tutorial shows you how to:

> [!div class="checklist"]
> - Import the Retail Analysis sample in the Power BI service.
> - Explore the sample in the service by using *Q&A*.
> - Create a visual by using natural language in Q&A.

If you'd like more background information, see [Q&A for Power BI business users](end-user-q-and-a.md). In that article you learn about Q&A, where to use it, and the difference between Power BI Q&A on a dashboard and the Power BI Q&A visual for reports.  

If you want to familiarize yourself with the built-in sample in this article, see [Retail Analysis sample for Power BI: Take a tour](../create-reports/sample-retail-analysis.md).

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Power BI free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

*Power BI Q&A* is available with a Pro or Premium license. For more information, see [Q&A virtual analyst in iOS apps](mobile/mobile-apps-ios-qna.md) and [Q&A in Power BI embedded analytics](../developer/embedded/qanda.md).

At the current time, Power BI Q&A only supports answering natural language queries asked in English, although there's a preview available for Spanish that your Power BI administrator can enable.

## Import the sample in the Power BI service

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Retail Analysis Sample**.

1. Select the sample. It opens in Reading mode.

1. Power BI imports the built-in sample, adding a new dashboard, report, and dataset to your current workspace.

   :::image type="content" source="media/end-user-q-and-a-tutorial/retail-entry.png" alt-text="Screenshot shows dashboard, report, and dataset for Retail Analysis Sample.":::

   On the **Content** tab, you see the dashboard and the report, both named *Retail Analysis Sample*.

   :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-new-report.png" alt-text="Screenshot shows the Retail Analysis Sample Content tab with dashboard and report entries.":::

## Use Q&A on a dashboard in the Power BI service

In the Power BI service, a dashboard contains tiles pinned from one or more datasets, so you can ask questions about any of the data contained in any of those datasets. To see which reports and datasets that the report creator used for the dashboard, select **See related content** from the **More actions** menu.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-see-related.png" alt-text="Screenshot shows See related content from the menu bar.":::

## Get started

First, get familiar with the content. Take a look at the visuals on the dashboard and in the report. Get a feel for the type and range of data that is available to you.

> [!NOTE]
> If you already feel comfortable with the data, just place your cursor in the question box to open the Q&A screen.

For example:

- If a visual's axis labels and values include "sales",  "account", "month", and "opportunities", then you can confidently ask questions such as: "Which *account* has the highest *opportunity*" or "show *sales* by month as a bar chart."

- If you have website performance data in Google Analytics, you can ask Q&A about time spent on a web page, number of unique page visits, and user engagement rates. Or, if you're querying demographic data, you might ask questions about age and household income by location.

Once you're familiar with the data, head back to the dashboard and place your cursor in the question box. The Q&A screen opens.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-suggestion.png" alt-text="Screenshot shows the Q&A screen with suggested questions.":::

Even before you start typing, Q&A displays a new screen with suggestions to help you to form your question. You see phrases and questions containing the names of the tables in the underlying datasets and might even see *featured* questions created by the dataset owner.

You can select any of these options to add them to the question box and then refine the question to find a specific answer.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-results.png" alt-text="Screenshot shows Q&A with a query.":::

Another way Power BI helps you ask questions is with features such as: *prompts*, *autocomplete*, and *visual cues*. Power BI provides this help for Q&A on dashboards and with the Q&A visual in reports. For more information, see  [Create a visual using your own Q&A question](#create-a-visual-using-your-own-qa-question).

## Use Q&A to ask natural language questions

To use Q&A on a dashboard or to use the Q&A visual in a report, select one of the suggested questions or type your own natural language question.

### Create a visual by using a suggested question

This example uses **top states by total sales**. Power BI does its best to select which visual type to use. In this case, it's a basic map.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-qna-suggest.png" alt-text="Screenshot shows Q&A with a map visual.":::

But you can tell Power BI which visual type to use by adding it to your natural language query. Keep in mind that not all visual types work or make sense with your data. For example, this data wouldn't produce a meaningful scatter chart. But it works as a filled map.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-filled-map.png" alt-text="Screenshot shows Q&A visual as a filled map.":::

If you're unsure what type of questions to ask or terminology to use, expand **Show all suggestions** or look through the other visuals in the report. These techniques get you familiar with the terms and content of the dataset.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-show-all.png" alt-text="Screenshot shows Q&A with Show all suggestions selected.":::

### Create a visual using your own Q&A question

1. Type your question into the Q&A field using natural language. As you type your question, Power BI helps you with autocomplete, visual cues, restatement, and feedback.

    **Autocomplete**. As you type your question, Power BI Q&A shows relevant and contextual suggestions to help you quickly become productive with natural language. As you type, you get immediate feedback and results. The experience is similar to typing in a search engine.

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-autocomplete.png" alt-text="Screenshot shows Q&A with a blue underlined word.":::

    **Visual cues and feedback**. Power BI Q&A shows words with solid and dotted underlines to identify which words Power BI did or didn't recognize.

    A solid underline indicates that Power BI recognized the word. The example below shows that Q&A recognized the term **sales** but not the term **region**.

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-underline-word.png" alt-text="Screenshot shows Q&A question with a word solid underlined and a word double underlined.":::

    Select the unknown word to see suggestions.

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-location.png" alt-text="Screenshot shows a word that Q&A doesn't understand.":::

    Sometimes, none of the suggestions make sense, or Power BI doesn't recognize the word at all. An example could be using the word 'geo' even though it doesn't exist anywhere in the data. The word is in the English dictionary, but Q&A marks this term with a double underline. Power BI might make some suggestions or it might suggest that you ask the report designer to add the term.  

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-qna-stores.png" alt-text="Screenshot shows a Dropdown with suggestions for Q&A.":::

    Power BI Q&A recognizes words that mean the same thing, thanks to the integration with Bing and Office. Q&A underlines the word so you know it's not a direct match.

    After you select Power BI's suggestions, Q&A recognizes all the words and underlines them in blue. These results display as a line chart. Power BI Q&A restates your question below the visualization.

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-line-chart.png" alt-text="Screenshot shows Q&A visual results as a line chart.":::

## Change the visualization type

Don't like the default visualization that Power BI Q&A chose? Edit the natural language question to include the visualization type that you'd prefer.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-specify.png" alt-text="Screenshot shows Q&A visual with as a column chart added to the question.":::

## Next steps

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

> [!div class="nextstepaction"]
> [Power BI Q&A tips and tricks](end-user-q-and-a-tips.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)