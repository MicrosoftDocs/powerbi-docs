---
title: Overview of Copilot for Power BI (preview) 
description: Read all about how Copilot works in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 11/14/2023
LocalizationGroup: Create reports
---

# Overview of Copilot for Power BI (preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Before your business can start using Copilot capabilities in Power BI, you need to enable Copilot in Microsoft Fabric.

> [!NOTE]
>
> - Your F64 or P1 capacity needs to be in one of the regions listed in this article, [Fabric region availability](../admin/region-availability.md). If it isn't, you can't use Copilot.
> - Your administrator needs to enable the tenant switch before you start using Copilot. See the article [Copilot tenant settings](../admin/service-admin-portal-copilot.md) for details.
> - If your tenant or capacity is outside the US or France, Copilot is disabled by default unless your Fabric tenant admin enables the [Data sent to Azure OpenAI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance](../admin/service-admin-portal-copilot.md) tenant setting in the Fabric Admin portal.
> - Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F64 or higher, or P1 or higher) are supported.

Copilot for Microsoft Fabric Public Preview is available in Power BI. It helps you use the transformational power of generative AI to help in you get the most from your data. This article provides an overview of the capabilities that were introduced for Power BI.

## Get started with report creation

Power BI has introduced generative AI that allows you to create reports automatically by selecting the topic for a report or by prompting Copilot on a particular topic, and create a narrative visual that generates a summary of your report using generative AI. The following sections cover the details of the features and how to use Copilot.

:::image type="content" source="media/copilot-introduction/copilot-internet-sales-analysis.png" alt-text="Screenshot showing Copilot suggested report page." lightbox="media/copilot-introduction/copilot-internet-sales-analysis.png":::

## Feature overview: Copilot capabilities

You can interact with Copilot in several different ways in Power BI. The main and most obvious way is to open the Copilot pane and ask Copilot to create a report page, or a summary of a page. 

Copilot can also create a narrative visual that summarizes a page or a whole report. 

And Copilot can generate synonyms for Q&A, to help your report readers find what they're looking for in your reports.

What follows are examples of what Copilot can generate.

### A report outline of suggested pages

Copilot can provide a summary of your dataset and an outline of suggested pages for your report. Copilot creates a starting point. It might not be perfect, and it might not be exactly what you had in mind. But once you have the starting point, you can modify it from there to be exactly what you want.

- A [report outline of suggested pages for your report](copilot-create-report.md): for example, what each page in the report will be about, and how many pages it will create.  
- The visuals for the individual pages.

### A narrative visual

With Copilot, you can create a visual that generates a text summary of the data visualized in your report canvas.  The visual offers suggested prompts, and a space that allows you to direct the summary for your specific needs, offering an easy to read, useful guide for the end user. The summary updates in keeping with slicers and filters, and as the data refreshes. 

Learn more [narrative visuals](copilot-create-narrative.md).

:::image type="content" source="media/copilot-introduction/narrative-questions-leadership.png" alt-text="Narrative visual answering questions.":::

### Synonyms to enhance Q&A

- [Synonyms that you can add to Q&A](../natural-language/q-and-a-copilot-enhancements.md) to improve the Q&A visual's ability to understand user questions.

    :::image type="content" source="media/copilot-introduction/q-and-a-copilot-suggestions.png" alt-text="Copilot can add suggestions for synonyms.":::

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

- Copilot sends your customer data to generate summaries to Azure OAI, where it's stored for 30 days. See the [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms) for details.
- We work continuously to improve the quality of the reports (including visuals) and summaries generated by Copilot. We aim to deliver a better experience for when the product reaches general availability.
- AI may generate content that has mistakes. Make sure it's accurate and appropriate before using it.

Read [Update your data model to work well with Copilot](copilot-evaluate-data.md) for more tips.

For answers to common questions related to business data security and privacy to help your organization get started with Copilot for Fabric, see the articles in the Fabric documentation: 

- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview) 
- [Privacy, security, and responsible use for Copilot for Power BI](/fabric/get-started/copilot-power-bi-privacy-security) 

## Send feedback

We always welcome your feedback about our products, but especially during public preview, your feedback helps us improve the product faster.

## Next steps

- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Create a report with Copilot for Power BI](copilot-create-report.md)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Write Copilot prompts for creating narrative visuals in Power BI](copilot-prompts-narratives.md)
- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
- [Privacy, security, and responsible use for Copilot](/fabric/get-started/copilot-privacy-security) article in the Fabric documentation 
- [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot) article in the Fabric documentation 
- [Enhance Q&A with Copilot for Power BI](../natural-language/q-and-a-copilot-enhancements.md)
