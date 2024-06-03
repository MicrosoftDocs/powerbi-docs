---
title: Summarize a report page in the Copilot pane  
description: Even if you don't have permission to edit a Power BI report, Copilot can still create a summary for you in the Copilot pane.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 06/03/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
---

# Summarize a report page in the Copilot pane  

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Even if you don't have permission to edit a Power BI report, Copilot can create a summary for you in the Copilot pane. You can be just a report reader. If you can edit the report, you can also create a visual in the report that provides a summary. See the article [Write Copilot prompts to create narrative visuals in Power BI](copilot-prompts-narratives.md) for details.

:::image type="content" source="media/copilot-pane-summarize-content/copilot-summary-1.png" alt-text="Screenshot showing select Enter and watch Copilot generate your summary." lightbox="media/copilot-pane-summarize-content/copilot-summary-1.png":::

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

Given a Power BI report page populated with visuals, you might spend anywhere from 30 minutes to a couple hours combing through the report to fully understand your key questions, key insights, and what's going on at a high level, so you can summarize it for your leadership team. That length of time varies depending on how familiar you are with the data and how much involvement the analyst has in answering your questions. Now, with the summary feature in the Copilot pane, you can generate a summary of the data displayed on the page in seconds, instead of the minutes or hours to manually interpret the data and then write a summary, or ask an analyst to interpret and write a summary for you.

## Get started with standard prompts

To get started, select the **Copilot** button in the ribbon in either Power BI Desktop or the Power BI service. In the service, the button is available in both edit mode and view mode.

> [!TIP]
> If you don't see Copilot, your admins might not have enabled it, or you could be in a workspace that doesn't meet the Copilot requirements. 
 
:::image type="content" source="media/copilot-pane-summarize-content/copilot-button-ribbon.png" alt-text="Screenshot showing select the Copilot button in the ribbon in either Power BI Desktop or the Power BI service." lightbox="media/copilot-pane-summarize-content/copilot-button-ribbon.png":::

The Copilot pane opens. 

:::image type="content" source="media/copilot-pane-summarize-content/copilot-pane.png" alt-text="Screenshot showing the Copilot pane open." lightbox="media/copilot-pane-summarize-content/copilot-pane.png":::
 
You can choose from suggested prompts of summaries from the main Copilot menu such as "Create a bulleted list of insights" or "Summarize visuals on this page".
 
Or you can select prompts from the user prompt guide in the sparkle menu in the lower left-hand corner of the dialogue input box. Those options are:

- Give an executive summary of the report.
- Summarize visuals on the page.
- Create a bulleted list of insights.

:::image type="content" source="media/copilot-pane-summarize-content/empty-state-prompt-guide.png" alt-text="Screenshot showing select prompts from the user prompt guide." lightbox="media/copilot-pane-summarize-content/empty-state-prompt-guide.png":::

After you choose a prompt, select **Enter** and watch Copilot generate your summary.
 
:::image type="content" source="media/copilot-pane-summarize-content/copilot-summary-1.png" alt-text="Screenshot showing select Enter and watch Copilot generate your summary." lightbox="media/copilot-pane-summarize-content/copilot-summary-1.png":::

Copilot uses Azure Open AI to look at the visuals on the report page, and create a natural language summary using the data in those visuals.  It doesn't take into account other pages or data that's not currently visualized in your current view.

## Reference footnotes

In a summary response from the Copilot pane, reference footnotes are provided within the summary to indicate which data visuals Copilot referenced to generate the summary. These footnotes help you quickly cross-check the summary output to ensure accuracy, increasing productivity.
 
:::image type="content" source="media/copilot-pane-summarize-content/reference-hover-state.png" alt-text="Screenshot showing that footnotes are provided within the summary to indicate which data visuals Copilot referenced to generate the summary." lightbox="media/copilot-pane-summarize-content/reference-hover-state.png":::

## Custom prompts

The summary skill benefit goes beyond providing a generic summary for a consumer. You can type custom prompts to request a specific summary, such as a bulleted summary or a summary specifically about sales, or about another nuanced slice of your data. 
 
:::image type="content" source="media/copilot-pane-summarize-content/bulleted-insights.png" alt-text="Screenshot showing type custom prompts to request a specific summary." lightbox="media/copilot-pane-summarize-content/bulleted-insights.png":::

Copilot allows you to generate a custom summary to fit your business needs. Here are some examples of custom summaries:
 
- Give me a summary of my revenue over the last fiscal year and describe any significant outliers.
- Summarize the trends that are shown on this report page.
- Outline the insights on this page in reference to bike sales and geography.
- Summarize the data in a way that allows me to use it in an email to leadership.
- Summarize the data on this page specific to Seattle, WA.
 
## Benefits

This customization allows you to focus on nuanced aspects of the data that are relevant to your objectives or questions. Some key advantages include: 

- **Relevance**: Customized summaries ensure that the information provided is directly aligned with your specific inquiry or area of interest, making the insights more relevant and actionable. 
- **Efficiency**: You can quickly obtain targeted information without sifting through irrelevant details. This streamlines the decision-making process and enhances overall efficiency. 
- **Personalization**: Customized summaries cater to individual preferences and priorities, providing an experience personalized for you. This personalization fosters a sense of ownership and engagement with the data. 
- **Precision**: You can receive precise details on the metrics or dimensions that matter most to you, allowing for a more detailed and nuanced understanding of the data. 
- **Improved decision-making**: Customized summaries empower you to make informed decisions based on specific, tailored insights, contributing to more effective and strategic decision-making. 
- **Flexibility**: You have the flexibility to adapt the summary to changing business needs or evolving questions, ensuring that the insights remain pertinent over time. 

## Answer questions about your report content in the Copilot pane

The Copilot pane also allows you to ask specific questions about your report content and receive a summarized response. This allows you to not only request summaries but ask additional follow-up questions about your report page or about a summary you've received. The Copilot pane generates an answer that contains visual references within the report. You can ask fact-based questions from the report page you're on, or speculative questions like "what are some reasons", "why might", and some "what if" questions. 

:::image type="content" source="media/copilot-pane-summarize-content/copilot-pane.png" alt-text="Screenshot showing ask specific questions about your report content and receive a summarized response." lightbox="media/copilot-pane-summarize-content/copilot-pane.png":::

## Examples of questions you can ask 

- Which team had the highest sales? 
- Which product had the highest profit margin? 
- Why is there a significant variance between the sales amount and the sales quota across departments? 
- What are some factors behind the major increase in Accessories sales? 
- What is the difference in revenue by product streams, and are they statistically significant?  
- What are the trends in wait times and call lengths across different cities, and how can we improve these metrics? 
- What are some questions leadership might ask about this data? 

## Limitations and considerations

- For the Copilot button to be available in a report, the report needs to be in:
    - An eligible workspace: the workspace needs to have a paid dedicated capacity. The workspace needs to be a paid Premium or F64 or higher.
    - A tenant where the admin setting is enabled.
- If you have a visual with extensive data points, Copilot may answer on truncated data. We are working on techniques to improve this.
- The accuracy of the public preview may be limited.
- The summary in the Copilot pane can only summarize one report page at a time. It doesn't summarize across the entire report or multiple pages.
- The Copilot summary pane doesn't return new visuals as data answers.


## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.

## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a report with Copilot for Power BI](copilot-create-report-service.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
