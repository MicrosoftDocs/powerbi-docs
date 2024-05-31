---
title: Overview of Copilot for Power BI 
description: Read all about how Copilot works in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 06/03/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
---

# Overview of Copilot for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Copilot for Microsoft Fabric Public Preview is available in Power BI. Copilot helps you use the transformational power of generative AI to get the most from your data. This article provides an overview of the Copilot capabilities for Power BI.

Before your business can start using Copilot capabilities in Power BI, your administrator needs to [Enable Fabric Copilot for Power BI](/fabric/get-started/copilot-enable-fabric).

> [!NOTE]
> Copilot isn't yet supported for sovereign clouds due to GPU availability.

## Before you start using Copilot

For optimized results using Copilot for Power BI, you may need to do some clean-up work on your semantic model. Read the article [Update your data model to work well with Copilot](copilot-evaluate-data.md) to see if you need to modify your semantic model so that Copilot can get insights from it.

For answers to common questions related to data security and privacy to help your organization get started with Copilot for Fabric, see the articles in the Fabric documentation:

- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview) 
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)

### Access Copilot in the Power BI service

To access Copilot in Power BI service, the workspace has to be running on F64 or Premium capacity.

- To generate summarized insights in reports, you need at least read access to the workspace or permission to the app.
- To create the narrative visual and generate Copilot reports, you need edit access to the workspace.
 
Read more about using [Copilot in the Power BI service](copilot-create-report-service.md).

### Access Copilot in Power BI Desktop

- You need to have write access to a workspace that is on F64 or Power BI Premium in the Power BI service, where you plan to publish the report. Read more about using [Copilot in Power BI Desktop](copilot-power-bi-desktop.md).

## Copilot requirements

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Feature overview: Copilot capabilities

Copilot for Power BI offers several capabilities to enhance your data interaction and report creation experience, currently available in Power BI Service and Desktop.

As a report author, you can use Copilot to help you write DAX queries, streamline your semantic model documentation, provide a summary about your semantic model, and help you get started with report creation. Additionally, Copilot can also create a narrative visual that summarizes a page or a whole report and can generate synonyms for Q&A, to help report readers find what they're looking for in your reports. As a report consumer, you can use the Copilot pane to ask a question about your report content or summarize key insights in seconds.

Here are examples of what Copilot can generate:

- [A summary of the underlying semantic model](#a-summary-of-the-underlying-semantic-model)
- [Suggested content for a report](#suggest-content-for-a-report)
- [A report page](#create-a-report-page)
- [A summary of your report in the Copilot pane](#a-summary-of-your-report-in-the-copilot-pane)
- [A summary visual on the report itself](#a-summary-visual-on-the-report-itself)
- [A visual using data from your semantic model](#a-visual-using-data-from-your-semantic-model)
- [Synonyms to enhance Q&A](#synonyms-to-enhance-qa)
- [Descriptions for your semantic model measures](#descriptions-for-semantic-model-measures)
- [DAX queries](#write-dax-queries)

Copilot can also use the measures and columns in your semantic model to help you explore your data in new ways. As you ask questions about your reports and datasets, Copilot checks if the answer can be found in the report visuals. If existing visuals don't answer the question, Copilot then builds a visual for you.

Requests Copilot can help you with include:

- Can I see this measure filtered to a different region or span of time?
- What are the top categories by a certain metric?
- Show me how this measure has changed over time.

See [Ask Copilot for data in your semantic model](copilot-data-question.md) for details.

:::image type="content" source="media/copilot-introduction/data-question-skill.png" alt-text="Screenshot showing Copilot answering a data question using a visual built from data in the semantic model." lightbox="media/copilot-introduction/data-question-skill.png":::


### Synonyms to enhance Q&A

Copilot can write [synonyms that you can add to Q&A](../natural-language/q-and-a-copilot-enhancements.md) to improve the Q&A visual's ability to understand user questions.

:::image type="content" source="media/copilot-introduction/q-and-a-copilot-suggestions.png" alt-text="Screenshot showing Copilot can add suggestions for synonyms.":::

### Add descriptions for semantic model measures

Copilot can add descriptions to your semantic model measures. People who build reports from your semantic model can see the name and description of your measures, which makes the description property essential documentation.

[Use Copilot to create measure descriptions](../transform-model/desktop-measure-copilot-descriptions.md).

### Write DAX queries

Copilot can write a DAX query. For example, you can type in a prompt to describe what DAX query you would like it to generate, and select Send or press Enter. To run what is returned, select Keep it to add it to query tab. Then select Run or press F5 to see the results of the DAX query. Read more in the article [Write DAX queries](/dax/dax-copilot).

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
- Read [Update your data model to work well with Copilot](copilot-evaluate-data.md) for more tips.

## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster. 

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
