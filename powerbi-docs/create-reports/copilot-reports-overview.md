---
title: Use Copilot with Power BI reports and semantic models
description: Learn how to use Copilot in Power BI to create, consume, and enhance reports with AI-driven insights.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: daengli
ms.service: powerbi
ms.topic: concept-article
ms.date: 05/07/2025
ms.collection: ce-skilling-ai-copilot
---
# Use Copilot with Power BI reports and semantic models

Copilot within Power BI reports and semantic models can be used for various tasks for both business users and report creators, from asking questions about the data in a report they have open to kick-starting the creation of new reports and enhancing their models.

## Capabilities for business users

### Generate a summary of your report

You can summarize report pages by using Copilot in smart narrative visuals on the page, in the Copilot pane, or in report subscriptions. You have the flexibility to refine or guide the summary by customizing prompts, such as "summarize this page using bullet points" or "provide a summary of sales on this page."

You can also ask specific questions about the visualized data on a report page and receive a tailored response. This response includes references to specific visuals, aiding you in understanding the specific data sources contributing to each part of the answer or summary within the report.

Consumers might use report page summaries in the following scenarios:

- Reports are complex or difficult to understand and consumers want an explanation.
- Consumers have challenges with visual or data literacy and want help.
- Consumers want a natural language summary to help them think through insights.

Learn more about [Copilot creating a summary response to prompts about your report](copilot-pane-summarize-content.md).

:::image type="content" source="media/copilot-reports-overview/copilot-summary.png" alt-text="Screenshot of the Copilot summary page of the dashboard for a Power BI report." lightbox="media/copilot-reports-overview/copilot-summary.png":::

### Ask questions about your data

Consumers can ask questions about reports and get answers in the Copilot pane. Copilot can find specific data points for the user and return them as an output, referencing the source visual that it was retrieved from.

Copilot can also use measures and columns in your semantic model to help you explore your data in new ways. As you ask questions about your reports and models, Copilot checks if the answer can be found in the report visuals. If existing visuals don't answer the question, Copilot then builds a visual for you using the model.

Here are examples of the type of requests that Copilot can help you with:

- Can I see this measure filtered to a different region or span of time?
- What are the top categories by a certain metric?
- Show me how this measure has changed over time.

:::image type="content" source="media/copilot-reports-overview/copilot-data-question.png" alt-text="Screenshot of Copilot answering a data question in the Power BI report." lightbox="media/copilot-reports-overview/copilot-data-question.png":::

Consumers might ask data questions of a semantic model in the following scenarios:

- They can't find the information or analysis that they need in the report.
- They want to see data presented in a different way, and personalize visuals isn't enabled.
- They want to ask a data question using natural language, rather than using tools or code.

See [Ask Copilot for data in your semantic model](copilot-ask-data-question.md) for details.

### Create report subscriptions with Copilot summaries

You can include a Copilot-generated summary for your Power BI report page or full report attachment in your email subscription to get insights. All the recipients of the email subscription receive the Copilot summary in the email. This feature is currently supported only for Standard Subscriptions.

See [Create report subscriptions with Copilot summaries](copilot-summaries-in-subscriptions.md) for details.

:::image type="content" source="media/copilot-reports-overview/copilot-subscriptions.png" alt-text="Screenshot of Copilot-generated summary included in a Power BI report subscription email." lightbox="media/copilot-reports-overview/copilot-subscriptions.png":::

## Capabilities for report authors

### Suggest content for a report

Copilot can help you get started on a new report by suggesting topics based on your data. When you select this option directly in the chat, Copilot evaluates the data and provides a report outline with suggested pages that you can explore and choose to create for you.

- A [report outline of suggested pages for your report](copilot-create-reports.md): for example, what each page in the report is about, and how many pages it creates.
- The visuals for the individual pages.

:::image type="content" source="media/copilot-reports-overview/copilot-suggest-content.png" alt-text="Screenshot of Copilot suggesting content for a Power BI report based on data." lightbox="media/copilot-reports-overview/copilot-suggest-content.png":::

### Create a report page

Copilot for Power BI can help you [create a report page](copilot-create-reports.md)  by identifying the tables, fields, measures, and charts for your data. If you give Copilot a high-level prompt that's specific to your data, it can generate a report page that you can then customize and modify, using the existing editing tools. Copilot can help you get started on your report page quickly and save you a lot of time and effort in the process.

Here are some examples of high-level prompts to get you started:

- Create a page to evaluate the performance of different shifts based on good count, reject count, and alarm count over time.
- Create a page to analyze the efficiency of the production line and overall equipment effectiveness.
- Create a page to compare the cost and material of each product and their impact on production.

If you need help with writing prompts that get you the report page you want, see [Write Copilot prompts that produce results in Power BI](copilot-prompts-report-pages.md) for guidance.

### Summarize the underlying semantic model

Summarize a Power BI semantic model by asking Copilot to "summarize the model" in the Copilot pane. This summary can help you gain a better understanding of data in your semantic model, identify important insights, and improve your data exploration experience. Ultimately, better understanding the semantic model can help you build more meaningful reports.

### Create a summary visual on the report itself

You can use Copilot for Power BI to quickly create a narrative about a report page with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals that you select. See [Create a narrative with Copilot for Power BI](copilot-create-narrative.md) for details.

:::image type="content" source="media/copilot-reports-overview/copilot-summary-visual.png" alt-text="Screenshot of Copilot-generated summary visual for a Power BI report page." lightbox="media/copilot-reports-overview/copilot-summary-visual.png":::

### Write DAX queries

Copilot can write a data analysis expression (DAX) query. For example, you can type in a prompt to describe what DAX query you would like it to generate, and select **Send** or press **Enter**. To run what is returned, select **Keep it** to add it to the query tab. Then select **Run** or press **F5** to see the results of the DAX query. Read more in the article [Write DAX queries](/dax/dax-copilot).

:::image type="content" source="media/copilot-introduction/copilot-dax-query.png" alt-text="Screenshot showing Copilot suggested DAX query." lightbox="media/copilot-introduction/copilot-dax-query.png":::

### Add descriptions for semantic model measures

Copilot can add descriptions to your semantic model measures. People who build reports from your semantic model can see the name and description of your measures, which makes the description property essential documentation. [Use Copilot to create measure descriptions](../transform-model/desktop-measure-copilot-descriptions.md).

:::image type="content" source="media/copilot-introduction/copilot-measure-description-model-view.png" alt-text="Screenshot showing Copilot suggested measure description." lightbox="media/copilot-introduction/copilot-measure-description-model-view.png":::

### Send feedback

We always welcome your feedback about our products to help us improve Copilot. Give us your feedback directly in the Copilot pane by selecting the feedback button.

:::image type="content" source="media/copilot-introduction/copilot-feedback.png" alt-text="Screenshot showing the feedback mechanism thumbs up and thumbs down.":::

## Copilot requirements

Read about [requirements to use Copilot with reports and semantic models](copilot-introduction.md#copilot-requirements).
