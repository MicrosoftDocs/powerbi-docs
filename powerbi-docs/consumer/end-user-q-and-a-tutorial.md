---
title: Q&A tutorial for Power BI business users
description: How to use Power BI Q&A natural language queries.
author: mihart
ms.author: mihart
ms.reviewer: mohammad.ali
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 09/01/2021
LocalizationGroup: Ask questions of your data
---

# Q&A tutorial

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This tutorial shows you how to: 

> [!div class="checklist"]
> * Import the Retail Analysis sample and and the Sales and Marketing sample and add them to the Power BI service.
> * Explore the samples in the service.
> * Create a visual by using natural language in *Q&A*.

If you'd like more background information, see [Introduction to Q&A](end-user-q-and-a.md). In that article you learn about Q&A, where to use it, and the difference between Power BI Q&A on a dashboard and the Power BI Q&A visual for reports.  

If you want to familiarize yourself with the built-in samples in this tutorial and their scenarios, see [Retail Analysis sample for Power BI: Take a tour](../create-reports/sample-retail-analysis.md) and [Sales and Marketing sample for Power BI:  Take a tour](../create-reports/sample-sales-and-marketing.md) before you begin.

## Prerequisites

- To download a sample in the Power BI service, you can sign up for a [free or trial license](../fundamentals/service-self-service-signup-purchase-for-power-bi.md).

- **Power BI Q&A** is available with a Pro or Premium license.  [Q&A in the Power BI mobile apps](mobile/mobile-apps-ios-qna.md) and [Q&A with Power BI Embedded](../developer/embedded/qanda.md) are covered in separate articles. 
- At the current time, **Power BI Q&A** only supports answering natural language queries asked in English, although there is a preview available for Spanish that can be enabled by your Power BI administrator.

## Import the samples in the Power BI service


1. Open the Power BI service (app.powerbi.com), sign in, and open the workspace where you want to save the sample. 

    If you don't have a Power BI Pro or Premium Per User (PPU) license, you can save the sample to your My Workspace.

    

2. Select **Get data** at the bottom of the nav pane. 

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-get-sample-data.png" alt-text="Select Get data.":::


1. On the **Get Data** page that appears, select **Samples**.

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-get-sample.png" alt-text="Select Samples.":::

1. Select **Retail Analysis Sample** > **Connect**.

   :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-retail.png" alt-text="Select Retail Analysis Sample.":::

1. Repeat steps 2-4 for the Sales and Marketing Sample. 

## What was imported?

With the built-in samples, when you select **Connect**, Power BI gets a copy of that built-in sample and stores it for you in the cloud.

1. Power BI creates the new dashboard, report, and dataset in your workspace. 

   ![Retail Analysis Sample entry](media/end-user-q-and-a-tutorial/retail-entry.png)
2. On the **Content** tab, you see the dashboard and the report, both named *Retail Analysis Sample*.

   ![Screenshot showing the Retail Analysis Sample Content tab with dashboard and report entries.](media/end-user-q-and-a-tutorial/power-bi-new-report.png)



## Use Q&A on a dashboard in the Power BI service
In the Power BI service (app.powerbi.com), a dashboard contains tiles pinned from one or more datasets, so you can ask questions about any of the data contained in any of those datasets. To see which reports and datasets were used to create the dashboard, select **See related content** from the **More actions** dropdown.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-see-related.png" alt-text="See related from the menu bar.":::

## How do I start?
First, get familiar with the content. Take a look at the visuals on the dashboard and in the report. Get a feel for the type and range of data that is available to you. 

For example:

* If a visual's axis labels and values include "sales",  "account", "month", and "opportunities", then you can confidently ask questions such as: "Which *account* has the highest *opportunity*, or show *sales* by month as a bar chart."

* If you have website performance data in Google Analytics, you can ask Q&A about time spent on a web page, number of unique page visits, and user engagement rates. Or, if you're querying demographic data, you might ask questions about age and household income by location.

Once you're familiar with the data, head back to the dashboard  and place your cursor in the question box. This opens the Q&A screen.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-suggestion.png" alt-text="Screenshot of the Q&A screen"::: 

Even before you start typing, Q&A displays a new screen with suggestions to help you form your question. You see phrases and questions containing the names of the tables in the underlying datasets and may even see *featured* questions created by the dataset owner.

You can select any of these to add them to the question box and then refine the question to find a specific answer. 

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-results.png" alt-text="Q&A screen with query":::

Another way Power BI helps you ask questions is with features such as: prompts, autocomplete, and visual cues. Power BI provides this help for Q&A on dashboards and with the Q&A visual. We'll discuss these features in detail below, in the section [Create a Q&A visual by typing your own natural language query](#create-a-visual-using-your-own-qa-question)

## Use Q&A to ask natural language questions 
Open the "Sales and Marketing Sample" dashboard. To use Q&A on a dashboard or to use the Q&A visual in a report, select one of the suggested questions or type your own natural language question. 

### Create a visual by using a suggested question

Here, we've selected **top states by total business units**. Power BI does its best to select which visual type to use. In this case, it's a basic map.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-qna-suggest.png" alt-text="Q&A visual map":::

But you can tell Power BI which visual type to use by adding it to your natural language query. Keep in mind that not all visual types will work or make sense with your data. For example, this data wouldn't produce a meaningful scatter chart. But it works as a filled map.

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-filled-map.png" alt-text="Q&A visual as a filled map":::



If you're unsure what type of questions to ask or terminology to use, expand **Show all suggestions** or look through the other visuals in the report. This will get you familiar with the terms and content of the dataset.

![Q&A screen with Show all suggestions selected](media/end-user-q-and-a/power-bi-show-all.png)

### Create a visual using your own Q&A question

1. Type your question into the Q&A field using natural language. As you type your question, Power BI helps you with autocomplete, visual cues, restatement, and feedback.

    **Autocomplete** - as you type your question, Power BI Q&A shows relevant and contextual suggestions to help you quickly become productive with natural language. As you type, you get immediate feedback and results. The experience is similar to typing in a search engine.

    In this example, the suggestion we want is the first one. 

    ![Q&A with a blue underlined word](media/end-user-q-and-a/power-bi-autocomplete.png)

    **Visual cues and feedback**  Power BI Q&A shows words with solid and dotted underlines to identify which words Power BI did or did not recognize. 

    A solid underline indicates that Power BI recognized the word. The example below shows that Q&A recognized the term **sales** but not the term **territory**.

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-underline.png" alt-text="Q&A question with a word solid underlined and a word dotted underline":::

    Select the unknown word to see suggestions.

    :::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-location.png" alt-text="Q&A question with a unknown word selected.":::

    Sometimes, none of the suggestions make sense, or Power BI doesn't recognize the word at all. An example could be using the word 'geography' even though it doesn't exist anywhere in the data. The word is in the English dictionary, but Q&A marks this term with a double underline. Power BI may make some suggestions or it may suggest that you ask the report designer to add the term.  

    ![Dropdown with You could also try suggestions](media/end-user-q-and-a/power-bi-qna-stores.png)

    
    
    Power BI Q&A recognizes words that mean the same thing, thanks to the integration with Bing and Office. Q&A underlines the word so you know it's not a direct match




    After selecting Power BI's suggestions, notice that all words are recognized and underlined in blue. These results display as a line chart. Power BI Q&A restates your question below the visualization. 

    ![Q&A visual results as a line chart](media/end-user-q-and-a-tutorial/power-bi-line-chart.png)

## Change the visualization type

Don't like the default visualization that Power BI Q&A chose? Edit the natural language question to include the visualizatio type that you'd prefer.      

:::image type="content" source="media/end-user-q-and-a-tutorial/power-bi-specify.png" alt-text="Q&A visual with "as a column chart" added to the question.":::

## Next steps
This environment is a safe one to play in, because you can choose not to save your changes. And if you do save them, you can always select **Get data** for a new copy of this sample.

> [!div class="nextstepaction"]
> [Power BI Q&A tips and tricks](end-user-q-and-a-tips.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)