---
title: Overview of Copilot for Power BI 
description: Read all about how Copilot works in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 08/20/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---
# Overview of Copilot for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Copilot for Microsoft Fabric is generally available in Power BI. Copilot helps you use the transformational power of generative AI to get the most from your data. You can also [create your own Copilots](#create-your-own-copilots) to help your coworkers with their tasks.

Copilot is turned on by default in Fabric. Administrators can turn off Copilot in the Fabric admin portal if your organization isn't ready to use it. For details on turning Copilot on and off, see [Enable Fabric Copilot for Power BI](/fabric/get-started/copilot-enable-fabric).

This article provides an overview of the Copilot capabilities for Power BI.

> [!NOTE]
> Copilot isn't yet supported for sovereign clouds due to GPU availability.

## Before you start using Copilot

For optimized results using Copilot for Power BI, you may need to do some clean-up work on your semantic model. Read the article [Update your data model to work well with Copilot](copilot-evaluate-data.md) to see if you need to modify your semantic model so that Copilot can get insights from it.

For answers to common questions related to data security and privacy to help your organization get started with Copilot for Fabric, see the articles in the Fabric documentation:

- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview) 
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)

## Access Copilot in the Power BI service

To access Copilot in the Power BI service, the workspace has to be running on F64 or Premium capacity.

- To generate summarized insights in reports, you need at least read access to the workspace or permission to the app.
- To create the narrative visual and generate Copilot reports, you need edit access to the workspace.
 
Read more about using [Copilot in the Power BI service](copilot-create-report-service.md).

## Access Copilot in Power BI Desktop

- You need to have write access to a workspace that is on F64 or Power BI Premium in the Power BI service, where you plan to publish the report. Read more about using [Copilot in Power BI Desktop](copilot-power-bi-desktop.md).

## Create your own Copilots

You can create your own Copilots for your organization. See the documentation for [Azure AI Search](/shows/azure/azure-search) to get started.

## Copilot requirements

- Your administrator needs to [enable Copilot in Microsoft Fabric](/fabric/get-started/copilot-fabric-overview#enable-copilot).
- Your F64 or P1 capacity needs to be in one of the regions listed in this article, [Fabric region availability](/fabric/admin/region-availability). If it isn't, you can't use Copilot.
- Your administrator needs to enable the tenant switch before you start using Copilot. See the article [Copilot tenant settings](/fabric/admin/service-admin-portal-copilot) for details.
- If your tenant or capacity is outside the US or France, Copilot is disabled by default unless your Fabric tenant admin enables the [Data sent to Azure OpenAI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance](/fabric/admin/service-admin-portal-copilot) tenant setting in the Fabric Admin portal.
- Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F64 or higher, or P1 or higher) are supported.

## Feature overview: Copilot capabilities

Copilot for Power BI offers several capabilities to enhance your data interaction and report creation experience, currently available in Power BI Service and Desktop.

## Copilot for business users

Copilot is a powerful tool to help business users get more from your data. Business users can use the Copilot pane to ask a question about report content or summarize key insights in seconds.

Copilot can help business users with the following:

- [Generate a summary of your report in the Copilot pane](#generate-a-summary-of-your-report-in-the-copilot-pane)

## Copilot for report authors

As a report author, you can use Copilot to help you write DAX queries, streamline your semantic model documentation, provide a summary about your semantic model, and help you get started with report creation. Additionally, Copilot can also create a narrative visual that summarizes a page or a whole report and can generate synonyms for Q&A, to help report readers find what they're looking for in your reports.

Copilot can help authors with the following tasks:

- [Summarize the underlying semantic model](#summarize-the-underlying-semantic-model).
- [Suggest content for a report](#suggest-content-for-a-report).
- Create a [report page](#create-a-report-page).
- Create a [summary visual on the report itself](#create-a-summary-visual-on-the-report-itself).
- [Ask Copilot questions about data in the model](#ask-copilot-questions-about-data-in-the-model).
- [Add synonyms to enhance Q&A](#synonyms-to-enhance-qa).
- [Add descriptions for your semantic model measures](#add-descriptions-for-semantic-model-measures).
- Write [DAX queries](#write-dax-queries).

### Generate a summary of your report in the Copilot pane

Even if you don't have edit permission for a report, with Copilot you can generate a summary of a report page in the Copilot pane. You have the flexibility to refine or guide the summary by customizing prompts, such as "summarize this page using bullet points" or "provide a summary of sales on this page."
 
You can also ask specific questions about the visualized data on a report page and receive a tailored response. This response includes references to specific visuals, aiding you in understanding the specific data sources contributing to each part of the answer or summary within the report.

Learn more about [Copilot creating a summary response to prompts about your report](copilot-pane-summarize-content.md).

:::image type="content" source="media/copilot-introduction/summary-skill.png" alt-text="Screenshot showing Copilot can generate a summary of your report page." lightbox="media/copilot-introduction/summary-skill.png":::

### Summarize the underlying semantic model

Summarize a Power BI semantic model by asking Copilot to "summarize the model" in the Copilot pane. This summary can help you gain a better understanding of data in your semantic model, identify important insights, and improve your data exploration experience. Ultimately, better understanding the semantic model can help you build more meaningful reports.

### Suggest content for a report

Copilot can help you get started on a new report by suggesting topics based on your data. When you select this option directly in the chat, Copilot evaluates the data and provides a report outline with suggested pages that you can explore and choose to create for you.

- A [report outline of suggested pages for your report](copilot-create-report-service.md): for example, what each page in the report is about, and how many pages it creates.  
- The visuals for the individual pages.

:::image type="content" source="media/copilot-introduction/copilot-internet-sales-analysis.png" alt-text="Screenshot showing Copilot suggested report page." lightbox="media/copilot-introduction/copilot-internet-sales-analysis.png":::

### Create a report page

Copilot for Power BI can help you create a report page by identifying the tables, fields, measures, and charts for your data. If you give Copilot a high-level prompt that's specific to your data, it can generate a report page that you can then customize and modify, using the existing editing tools. Copilot can help you get started on your report page quickly and save you a lot of time and effort in the process.

Here are some examples of high-level prompts to get you started:

- Create a page to evaluate the performance of different shifts based on good count, reject count, and alarm count over time.
- Create a page to analyze the efficiency of the production line and overall equipment effectiveness.
- Create a page to compare the cost and material of each product and their impact on production.

If you need help with writing prompts that get you the report page you want, see [Write Copilot prompts that produce results in Power BI](copilot-prompts-report-pages.md) for guidance.

### Create a summary visual on the report itself

In Power BI Desktop and the Power BI service, you can use Copilot for Power BI to quickly create a narrative about a report page with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals that you select. See [Create a narrative with Copilot for Power BI](copilot-create-narrative.md) for details.

:::image type="content" source="media/copilot-introduction/narrative-questions-leadership.png" alt-text="Screenshot showing Narrative visual answering questions." lightbox="media/copilot-introduction/narrative-questions-leadership.png":::

### Ask Copilot questions about data in the model

Copilot can also use the measures and columns in your semantic model to help you explore your data in new ways. As you ask questions about your reports and datasets, Copilot checks if the answer can be found in the report visuals. If existing visuals don't answer the question, Copilot then builds a visual for you.

Here are the sorts of requests that Copilot can help you with:

- Can I see this measure filtered to a different region or span of time?
- What are the top categories by a certain metric?
- Show me how this measure has changed over time.

See [Ask Copilot for data in your semantic model](copilot-ask-data-question.md) for details.

:::image type="content" source="media/copilot-introduction/data-question-skill.png" alt-text="Screenshot showing Copilot answering a data question using a visual built from data in the semantic model." lightbox="media/copilot-introduction/data-question-skill.png":::

### Synonyms to enhance Q&A

Copilot can write [synonyms that you can add to Q&A](../natural-language/q-and-a-copilot-enhancements.md) to improve the Q&A visual's ability to understand user questions.

:::image type="content" source="media/copilot-introduction/q-and-a-copilot-suggestions.png" alt-text="Screenshot showing Copilot can add suggestions for synonyms.":::

### Add descriptions for semantic model measures

Copilot can add descriptions to your semantic model measures. People who build reports from your semantic model can see the name and description of your measures, which makes the description property essential documentation.

[Use Copilot to create measure descriptions](../transform-model/desktop-measure-copilot-descriptions.md).

### Write DAX queries

Copilot can write a DAX query. For example, you can type in a prompt to describe what DAX query you would like it to generate, and select Send or press Enter. To run what is returned, select Keep it to add it to query tab. Then select Run or press F5 to see the results of the DAX query. Read more in the article [Write DAX queries](/dax/dax-copilot).

## Copilot preview features

When using the Copilot pane in the **Power BI service**, you'll see a toggle with the word **Preview** next to it. The preview toggle allows you the opportunity to move into an experience that includes both generally available and public preview capabilities. 

To access Copilot features in public preview, select the preview toggle to activate the public preview experience.

:::image type="content" source="media/copilot-preview-toggle/copilot-preview-toggle.png" alt-text="Screenshot of the preview toggle in the on position in the Copilot chat pane.":::

If you don't want users in your organization to have access to the preview toggle, you need to [disable Fabric Copilot](/fabric/admin/service-admin-portal-copilot) in your organization or for specific security groups.

See [Use Copilot preview features in Power BI](copilot-preview-toggle.md) for more information about what features are available in preview.

## Considerations and limitations

We're continuously working to improve the quality of the report pages, including visuals and summaries generated by Copilot. Here are the current limitations.

- AI may generate content that has mistakes. Make sure it's accurate and appropriate before using it.
- The Copilot button in Desktop report view is always visible in the ribbon; however, Copilot doesn't work unless Copilot for Microsoft Fabric is [enabled in tenant settings](/fabric/get-started/copilot-fabric-overview#enable-copilot) and you have member or contributor access to at least one workspace assigned to a paid Fabric capacity (F64 or higher) or Power BI Premium capacity (P1 or higher).
- Unlike the Data pane or Visualization pane, you can't resize the Copilot pane at this time.
- If you have limited GPU capacity, Copilot may be throttled.
- Copilot can't modify the visuals after it has generated them.
- Copilot can't add filters or set slicers if you specify them in the prompts. For example, if you say: "Create a sales report for the last 30 days." Copilot can't interpret 30 days as a date filter.
- Copilot can't make layout changes. For example, if you tell Copilot to resize the visuals, or to align all the visuals perfectly, it won't work.
- Copilot can't understand complex intent. For example, suppose you frame a prompt like: "Generate a report to show incidents by team, incident type, owner of the incident, and do this for only 30 days." This prompt is complex, and Copilot will probably generate irrelevant visuals.
- Copilot doesn't produce a message for the skills that it doesn't support. For example, if you ask Copilot to edit or add a slicer, it doesn't complete the instruction successfully, as mentioned above. Unfortunately, it *doesn't* give an error message either.
- Read [Update your data model to work well with Copilot](../create-reports/copilot-evaluate-data.md) for more tips.

## Send feedback

We always welcome your feedback about our products to help us improve Copilot. Give us your feedback directly in the Copilot pane by selecting the feedback button.

:::image type="content" source="media/copilot-introduction/copilot-feedback.png" alt-text="Screenshot showing the feedback mechanism thumbs up and thumbs down.":::

## Next steps

- [Enable Copilot in Power BI](/fabric/get-started/copilot-enable-fabric)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Create a report with Copilot in the Power BI service](copilot-create-report-service.md)
- [Create a report with Copilot in Power BI Desktop](copilot-create-desktop-report.md)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Write Copilot prompts for creating narrative visuals in Power BI](copilot-prompts-narratives.md)
- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
- [Privacy, security, and responsible use for Copilot](/fabric/get-started/copilot-privacy-security) article in the Fabric documentation 
- [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot) article in the Fabric documentation 
- [Enhance Q&A with Copilot for Power BI](../natural-language/q-and-a-copilot-enhancements.md)
