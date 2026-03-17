---
title: Summarize a report with Copilot
description: Even if you don't have permission to edit a Power BI report, Copilot can still create a summary for you.
author: julcsc
ms.author: juliacawthra
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: concept-article
ms.date: 09/09/2025
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Summarize a report with Copilot

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Copilot lets you create insightful summaries about your reports. Copilot takes the visuals that were curated and built by report authors and generates summaries, overviews, insights and answers grounded in the report data. You can access these summaries in the Copilot report pane or in the standalone Copilot agent in Power BI. 

:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-summary-1.png" alt-text="Screenshot showing select Enter and watch Copilot generate your summary." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-summary-1.png":::

:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-immersive-report-summary.png" alt-text="Screenshot of Copilot showing spending patterns as a report summary." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-immersive-report-summary.png":::

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Why summarize a report?

When working with a Power BI report, it can take 30 minutes to several hours to analyze the data and understand key questions and insights, especially when preparing summaries for leadership. This analysis might involve digging through multiple pages of visuals, identifying patterns, noting anomalies, and drafting a narrative that explains what’s happening, and why it matters. Whether you're summarizing for an executive briefing, preparing talking points for a stakeholder meeting, or trying to get a quick grasp of the data to inform a business decision - the process can be time-consuming. 

Copilot summaries let you generate a concise summary of the report’s data in seconds, whether you’re in the report or the standalone experience. Summaries highlight key trends, insights, and potential issues.  That ability helps quickly answer core business questions and decide on next steps without needing to manually interpret every chart or rely entirely on an analyst for support.

## Get started in reports with standard prompts

Let’s begin with the report experience. Here, you’re inside of a Power BI Report that has access to Copilot. To get started, select the **Copilot** button in the ribbon in either Power BI Desktop or the Power BI service. In the service, the button is available in both edit mode and view mode.

> [!TIP]
> If you don't see Copilot, your admins likely didn't enable it, or you could be in a workspace that doesn't meet the Copilot requirements. 
 
:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-button-ribbon.png" alt-text="Screenshot showing select the Copilot button in the ribbon in either Power BI Desktop or the Power BI service." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-button-ribbon.png":::

The Copilot pane opens. 

:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-report-copilot-pane.png" alt-text="Screenshot showing the Copilot pane open." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-report-copilot-pane.png":::
 
You can choose from suggested prompts of summaries from the main Copilot menu such as "What is this report page about?” or “Prep a summary for my team.”

Or you can select other prompts from the user prompt guide in the lower left-hand corner of the dialogue input box.

:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-updated-prompt-guide.png" alt-text="Screenshot showing select prompts from the user prompt guide." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-updated-prompt-guide.png":::

After you choose a prompt, select **Enter** and watch Copilot generate your summary.  Once the summary begins, you can watch it update as it writes the response.
 
:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-updated-report-summary-response.png" alt-text="Screenshot showing and updated view of the report summary response." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-updated-report-summary-response.png":::

Copilot uses Azure OpenAI to look at the visual metadata on the report and create a natural language summary. By default, Copilot summarizes visuals across the entire report. You can adjust the scope of the summary by specifying the prompt.  The summaries will give a general overview of the data that's currently visualized. 

## Citations

In a summary response from the Copilot pane, citations are provided within the summary to indicate which visuals Copilot referenced to generate the summary. These citations help you quickly cross-check the summary output to ensure accuracy, increasing productivity. If a reference is from a page you aren't currently on, the reference takes you to that page when clicked.
 
:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/reference-hover-state.png" alt-text="Screenshot showing that footnotes are provided within the summary to indicate which data visuals Copilot referenced to generate the summary." lightbox="../create-reports/media/copilot-pane-summarize-content/reference-hover-state.png":::

## Custom prompts

The benefit goes beyond providing a generic summary for a consumer. You can type custom prompts to request a specific summary, such as a bulleted list or a summary specifically about sales, or about another nuanced slice of your data. You can even ask about data behind slicers and filters on your report page.  So long as the filter or slicer exists in the report, Copilot can filter the response for you.
 
:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/bulleted-insights.png" alt-text="Screenshot showing type custom prompts to request a specific summary." lightbox="../create-reports/media/copilot-pane-summarize-content/bulleted-insights.png":::

Copilot allows you to generate a custom summary to fit your business needs. Here are some examples of custom summaries:
 
- Give me a summary of my revenue over the last fiscal year and describe any significant outliers.
- Summarize the trends that are shown across this report.
- Outline the insights about bike sales and Washington.
- Summarize the data in a way that allows me to use it in an email to leadership.
- Summarize the data specific to Seattle, WA.



## Benefits

This customization allows you to focus on nuanced aspects of the data that are relevant to your objectives or questions. Some key advantages include: 

- **Relevance**: Customized summaries ensure that the information provided is directly aligned with your specific inquiry or area of interest, making the insights more relevant and actionable. 
- **Efficiency**: You can quickly obtain targeted information without sifting through irrelevant details. This streamlines the decision-making process and enhances overall efficiency. 
- **Personalization**: Customized summaries cater to individual preferences and priorities, providing an experience personalized for you. This personalization fosters a sense of ownership and engagement with the data. 
- **Precision**: You can receive precise details on the metrics or dimensions that matter most to you, allowing for a more detailed and nuanced understanding of the data. 
- **Improved decision-making**: Customized summaries empower you to make informed decisions based on specific, tailored insights, contributing to more effective and strategic decision-making. 
- **Flexibility**: You have the flexibility to adapt the summary to changing business needs or evolving questions, ensuring that the insights remain pertinent over time. 

## Answer questions about your report content in the Copilot pane

The Copilot pane also allows you to ask specific questions about your report content and receive a summarized response. This allows you to not only request summaries but ask additional follow-up questions about your report or about a summary you've received. The Copilot pane generates an answer that contains visual references within the report. You can ask fact-based questions from the report.  You can even ask about data behind different slicers and filters in your report, and the citation will reference the correct, filtered visual.  Some filter types are not supported, for example, relative date filters.

## Examples of questions you can ask 

- Which team had the highest sales?
- What was the spend per visitor for Maui in November 2023?
- What is the value for revenue variance?
- Which product had the highest profit margin? 
- What is the difference in revenue by product streams, and are they statistically significant? 

## Get started in the standalone Power BI Copilot experience

Now, let’s take a look at the standalone Copilot experience. For more details, see [Standalone Copilot experience in Power BI (preview)](copilot-chat-with-data-standalone.md). Although the core functionality remains the same, this version includes some enhanced features that are unique to the standalone experience.

:::image type="content" source="../create-reports/media/copilot-introduction/copilot-standalone-screen.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a chat interface for interacting with data." lightbox="../create-reports/media/copilot-introduction/copilot-standalone-screen.png":::

To get started, select the Copilot button in the left navigation menu in Power BI service. You see a landing page that offers helpful prompts to get started exploring data. This is similar to the starter prompts shown in the report pane, but using these lets you search for relevant reports you have access to. This means you don’t need to start the exploration experience in the context of the report, you can just ask Copilot to find it for you.

> [!TIP]
> If you know the report you want to explore, attach it in the **Add items** section.

In this standalone Copilot experience, you can ask to summarize data, ask questions, generate insights, or create executive overviews based on your Power BI reports. You can also ask follow-up questions, use custom prompts, continue the conversation, and jump directly into the report for deeper analysis when needed. 

There are a few key differences in the standalone Copilot experience compared to the report pane.  The first difference is the way visuals are embedded directly into the summary responses. Unlike report summaries, where visuals remain part of the main report view, the standalone experience presents them alongside the text. Visual citations are especially important here; they let you validate the data in the summary, see the original visual it references, and explore further without leaving the Copilot view. The overall layout reads more like a newspaper article, combining narrative and visuals into a single, digestible format.

:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-immersive-full-summary.png" alt-text="Screenshot showing the full immersive summary in Copilot." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-immersive-full-summary.png":::

You can even hover over some of the additional visual citations that aren't rendered inline to make sure you have a good understanding of which visual the information in the summary came from. 

:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-immersive-citation-hover.png" alt-text="Screenshot showing what happens when users hover over citations in the full immersive summary in Copilot." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-immersive-citation-hover.png":::

In this immersive experience, you can also dive deeper into the visuals provided to continue your analysis - another key difference from the Copilot pane in the report view. Use the **Explore** buttons under the visuals to open them in a format that supports deeper exploration, allowing you to slice, dice, and interact with the data more directly.

:::image type="content" source="../create-reports/media/copilot-pane-summarize-content/copilot-explore-in-immersive.png" alt-text="Screenshot showing what happens when users explore in the full immersive summary in Copilot." lightbox="../create-reports/media/copilot-pane-summarize-content/copilot-explore-in-immersive.png":::

Remember, you can filter. Here is an example where I have asked Copilot specifically for a summary about Maui, rather than an overview.  

:::image type="content" source="../create-reports/media/copilot-create-narrative/copilot-filtered-summary.png" alt-text="Screenshot of a filtered summary and hover icon in standalone experience." lightbox="../create-reports/media/copilot-create-narrative/copilot-filtered-summary.png":::

You can see based on the description that the summary was filtered, but you can even hover over the filter icon and see that the Maui filter was applied to all the visuals I see in the response. You can click the **view in report** button in the standalone experience and be taken to the visual being referenced, with the appropriate filters applied. There are some filtering limitations which are noted below.

## Best practices

To get the most accurate and useful results from Copilot summaries and responses to your report questions, it’s important to optimize your report data. The following are some best practices to make sure Copilot works effectively when delivering report summaries and answers.

### How Copilot summarization and report answers work

Copilot report summaries and answers are based on the report’s visualized data and follow a two-step process:

1.	Identifying relevant visuals (up to 20) based on the user’s prompt, then
1.	Summarizing (or answering with) the data from those visuals

The quality of the results depends heavily on the amount of data and the clarity of labels. When Copilot resorts to sampling due to volume, accuracy may decrease. 

> [!TIP]
> If report summaries or answers are taking longer than you expect, you can look at the visuals being used, and how long they take to query.  This means that if crucial visuals important for answering questions are taking a long time to load, you can break the visuals up into smaller pieces to make them faster for Copilot.  Additionally, you can remove long running query time visuals if they are not important for Copilot to use.  You can see this information in the diagnostics available in the ellipses menu.
>
> :::image type="content" source="../create-reports/media/copilot-create-narrative/copilot-diagnostics-entry-point.png" alt-text="Screenshot showing the Copilot diagnostics entry point in standalone." lightbox="../create-reports/media/copilot-create-narrative/copilot-diagnostics-entry-point.png":::

The information we give is:

1. Visual title
1. The page the visual is located on
1. The time in seconds it took to load/query the visual

:::image type="content" source="../create-reports/media/copilot-create-narrative/copilot-diagnostic-timings.png" alt-text="Screenshot of an example diagnostic file that showcases visual timings for Copilot queries." lightbox="../create-reports/media/copilot-create-narrative/copilot-diagnostic-timings.png":::

### Report composition

- Limit the number of visuals on a report page to improve accuracy. While Copilot can rank visuals from reports with hundreds of visuals, it summarizes from only the top 20 so some insights may be missed.
- If there are popular summary requests or questions that business users see, check the visual timings in diagnostics to optimize your report.
- Avoid duplicate visuals that present the same data. Exception: visuals showing data at different granularities for the same insight.
- Prioritize distinct, simple visuals per insight rather than a single, complex visual showing everything.
- Leverage default filters that reveal data to answer most commonly asked questions, as summaries don't currently apply filters to answer the specific prompt.
- Use clear, descriptive titles for pages, visuals, and filters.
- Ensure the fields have meaningful names, even if they're not displayed on the chart.

### Visual composition

- Visuals with expandable elements (like decomposition trees or matrices) are summarized in their current state. For example, if only one country is expanded in a matrix showing **Country > City**, Copilot only sees cities for that country. Set the default expansion thoughtfully.
- Avoid overly complex matrices with many row levels or multiple values. Use simpler, supporting visuals to highlight key takeaways from those complex visuals.
- The simpler the visual, the easier it is to summarize. Use cards to surface key high-level insights.

### Data volume and token usage

- Visuals might not send all data. For example, tables paginate after 100 rows, and only visible rows are summarized. If full summarization is important, reduce the data shown by using filters, trimming columns, or splitting data into multiple visuals (see [limitations](#limitations-and-considerations)).
- Avoid high-density visuals, like daily line charts spanning years. Instead, aggregate data by week or month (see [limitations](#limitations-and-considerations)).
- Hidden elements like tooltips are also included in what Copilot sees, which can increase token usage.
- Limit the number of series in categorical charts (fewer than 10). Use an "Other" bucket for small categories. Too many series can result in wide, hard-to-parse tables.
- Use display units where possible. For example, show "1.2K" instead of "1,234" unless high precision is necessary.
- Avoid large text fields. Any text longer than 500 characters are truncated.

## Limitations and considerations

The following are limitations and considerations across both experiences (also see the [best practices](#best-practices) section).

- Filter limitations:
  - Filters and slicers must exist on the report to be applied in Copilot responses
  - Page and report level filters are supported, visual level filters are not yet supported
  - Basic, categorical filters/slicers are supported
  - Advanced filters are supported, minus relative date/time filters, is/is not blank/empty, and numerical range filters (between X and Y).
  - Field parameters are not supported as slicers/filter types.
  
- For the Copilot button to be available in reports, the report needs to be in:
  - An eligible workspace: the workspace needs to have a paid dedicated Fabric capacity.
  - A tenant where the admin settings are enabled.
- Copilot summaries only consider visuals with less than 30K rows of data. If more data is included in visuals, Copilot answers using the semantic model itself, not the report visual.
- Copilot summaries may not work accurately on table/matrix visuals with more than 500 rows. If the visual surpasses 100 rows, Copilot answers using the semantic model itself, not the report visual.
- The standalone Copilot experience isn't yet available in the following regions: Spain Central, Qatar, India-West, and Mexico.

## Send feedback

We always welcome your feedback about our products. Your feedback helps us improve the product.

## Next steps

- [Overview of Copilot for Power BI](../create-reports/copilot-introduction.md)
- [Create a report with Copilot for Power BI](../create-reports/copilot-create-report-service.md)
- [Create a narrative summary visual with Copilot for Power BI](../create-reports/copilot-create-narrative.md)
- [Update your data model to work well with Copilot](../create-reports/copilot-evaluate-data.md)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
