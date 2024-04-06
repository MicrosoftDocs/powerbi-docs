---
title: Overview of Copilot for Power BI (preview) 
description: Read all about how Copilot works in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 04/04/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
---

# Overview of Copilot for Power BI (preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Copilot for Microsoft Fabric Public Preview is available in Power BI. Copilot helps you use the transformational power of generative AI to get the most from your data. This article provides an overview of the Copilot capabilities for Power BI.

Before your business can start using Copilot capabilities in Power BI, your administrator needs to [enable Copilot in Microsoft Fabric](/fabric/get-started/copilot-fabric-overview#enable-copilot).

## Get started with report creation

Power BI has introduced generative AI that allows you to create reports automatically by selecting the topic for a report or by prompting Copilot on a particular topic, and create a narrative visual that generates a summary of your report using generative AI. The following sections cover the details of the features and how to use Copilot.

:::image type="content" source="media/copilot-introduction/copilot-internet-sales-analysis.png" alt-text="Screenshot showing Copilot suggested report page." lightbox="media/copilot-introduction/copilot-internet-sales-analysis.png":::

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Feature overview: Copilot capabilities

You can interact with Copilot in several different ways in Power BI. The main and most obvious way is to open the Copilot pane and ask Copilot to create a report page, or a summary of a page. 

Copilot can also create a narrative visual that summarizes a page or a whole report. 

And Copilot can generate synonyms for Q&A, to help your report readers find what they're looking for in your reports.

Here are four examples of what Copilot can generate.

- A [report outline of suggested pages](#a-report-outline-of-suggested-pages)
- A [narrative visual](#a-narrative-visual)
- A [summary response about your report content](#a-summary-response-about-your-report-content)
- [Descriptions for your semantic model measures](#descriptions-for-semantic-model-measures)
- Write [DAX queries](#write-dax-queries)

### A report outline of suggested pages

Copilot can provide a summary of your dataset and an outline of suggested pages for your report. Copilot creates a starting point. It might not be perfect, and it might not be exactly what you had in mind. But once you have the starting point, you can modify it from there to be exactly what you want.

- A [report outline of suggested pages for your report](copilot-create-report-service.md): for example, what each page in the report will be about, and how many pages it will create.  
- The visuals for the individual pages.

### A narrative visual

With Copilot, you can create a visual that generates a text summary of the data visualized in your report canvas.  The visual offers suggested prompts, and a space that allows you to direct the summary for your specific needs, offering an easy to read, useful guide for the end user. The summary updates in keeping with slicers and filters, and as the data refreshes. 

Learn more about [narrative visuals](copilot-create-narrative.md).

:::image type="content" source="media/copilot-introduction/narrative-questions-leadership.png" alt-text="Screenshot showing Narrative visual answering questions." lightbox="media/copilot-introduction/narrative-questions-leadership.png":::

### A summary response about your report content

Even if you don't have edit permission for a report, with Copilot you can generate a summary of a report page in the Copilot pane. You have the flexibility to refine or guide the summary by customizing prompts, such as "summarize this page using bullet points" or "Provide a summary of sales on this page."
 
You can also pose specific questions about the visualized data on a report page and receive a tailored response. This response includes references to specific visuals, aiding you in understanding the specific data sources contributing to each part of the answer or summary within the report.

:::image type="content" source="media/copilot-introduction/summary-skill.png" alt-text="Screenshot showing Copilot can generate a summary of your report page." lightbox="media/copilot-introduction/summary-skill.png":::

Learn more about [Copilot creating a summary response to prompts about your report](copilot-pane-summarize-content.md).

### Synonyms to enhance Q&A

Copilot can write [synonyms that you can add to Q&A](../natural-language/q-and-a-copilot-enhancements.md) to improve the Q&A visual's ability to understand user questions.

:::image type="content" source="media/copilot-introduction/q-and-a-copilot-suggestions.png" alt-text="Screenshot showing Copilot can add suggestions for synonyms.":::

### Descriptions for semantic model measures

Copilot can add descriptions to your semantic model measures. People building reports from your semantic model can see the name and description of your measures, making the description property essential documentation.

[Use Copilot to create measure descriptions](../transform-model/desktop-measure-copilot-descriptions.md).

### Write DAX queries

Copilot can write a DAX query. For example, you can type in a prompt to describe what DAX query you would like it to generate, and select Send or press Enter. To run what is returned, select Keep it to add it to query tab. Then select Run or press F5 to see the results of the DAX query. Read more in the article [Write DAX queries](/dax/dax-copilot).

## Copilot requirements

### Power BI service

To use the narrative visual in Copilot reports and create Copilot reports:

- Your tenant admin has to enable the Copilot setting at the tenant level. See the article [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot)
- The workspace has to be running on F64 or Premium capacity, for you to access Copilot for the Power BI service.
- You need either read or write access to the workspace that's on F64 or Premium capacity.
- If you have limited GPU capacity, Copilot may be throttled.

### Power BI Desktop

- You need write access to a workspace that is on F64 or Power BI Premium in the Power BI service, where you plan to publish the report.

## Before you start using Copilot

- We work continuously to improve the quality of the reports (including visuals) and summaries generated by Copilot. We aim to deliver a better experience for when the product reaches general availability.
- AI may generate content that has mistakes. Make sure it's accurate and appropriate before using it.

Read [Update your data model to work well with Copilot](copilot-evaluate-data.md) for more tips.

For answers to common questions related to business data security and privacy to help your organization get started with Copilot for Fabric, see the articles in the Fabric documentation: 

- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview) 
- [Privacy, security, and responsible use for Copilot for Power BI](/fabric/get-started/copilot-power-bi-privacy-security) 

## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.

## Next steps

- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Create a report with Copilot for Power BI](copilot-create-report-service.md)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Write Copilot prompts for creating narrative visuals in Power BI](copilot-prompts-narratives.md)
- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
- [Privacy, security, and responsible use for Copilot](/fabric/get-started/copilot-privacy-security) article in the Fabric documentation 
- [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot) article in the Fabric documentation 
- [Enhance Q&A with Copilot for Power BI](../natural-language/q-and-a-copilot-enhancements.md)
