---
title: Write Copilot prompts for creating narrative visuals in Power BI 
description: Read about samples of prompts that help Copilot produce useful narrative visuals in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 01/11/2024
LocalizationGroup: Create reports
---

# Write Copilot prompts for creating narrative visuals in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Before your business can start using Copilot capabilities in Power BI, you need to enable Copilot in Microsoft Fabric.

> [!NOTE]
>
> - Your F64 or P1 capacity needs to be in one of the regions listed in this article, [Fabric region availability](/fabric/admin/region-availability). If it isn't, you can't use Copilot.
> - Your administrator needs to enable the tenant switch before you start using Copilot. See the article [Copilot tenant settings](/fabric/admin/service-admin-portal-copilot) for details.
> - If your tenant or capacity is outside the US or France, Copilot is disabled by default unless your Fabric tenant admin enables the [Data sent to Azure OpenAI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance](/fabric/admin/service-admin-portal-copilot) tenant setting in the Fabric Admin portal.
> - Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F64 or higher, or P1 or higher) are supported.

## Sample prompts for narrative visuals

Here are some examples of prompts that work well for creating narrative visuals with Copilot for Power BI. Use these prompts as examples.

Each sample prompt is paired with a narrative that Copilot generated based on the interpretation of that prompt. Your prompts help Copilot understand what you're looking for, but they may not produce a narrative that's exactly what you want.  

Modify an existing narrative.  You can use the custom prompt area to modify an existing narrative to adjust the tone, formatting, or tweak the summary to your needs. Following are some examples.

Also, see the [Considerations and limitations section](copilot-create-narrative.md#considerations-and-limitations) in the article "Create a narrative with Copilot for Power BI" for features that currently don't work.

## Start from scratch

First we start from scratch, using custom prompts to generate a narrative. Help the summary focus on one aspect of your data. 

"Generate a summary focused on tourism in Hawaii."

:::image type="content" source="media/copilot-prompts/summary-about-hawaii.png" alt-text="Screenshot showing Generate a summary focused on tourism in Hawaii." lightbox="media/copilot-prompts/summary-about-hawaii.png":::

## The original suggested prompt

Here's the original narrative from the suggested prompt:

:::image type="content" source="media/copilot-prompts/suggested-prompt-1.png" alt-text="Screenshot showing original narrative from the suggested prompt." lightbox="media/copilot-prompts/suggested-prompt-1.png":::

## First modification of the custom prompt

First we modify the narrative with this custom prompt:

"Shorten this summary and bold the key information" 

:::image type="content" source="media/copilot-prompts/shortened-summary.png" alt-text="Screenshot showing Shorten this summary and bold the key information." lightbox="media/copilot-prompts/shortened-summary.png":::

## Second modification: Custom prompt

This time, we again modify the summary by using a different custom prompt:

"Make the first bullet point about length of stay."

:::image type="content" source="media/copilot-prompts/length-of-stay-summary.png" alt-text="Screenshot showing Make the first bullet point about length of stay." lightbox="media/copilot-prompts/length-of-stay-summary.png":::
 
## Third modification: Custom prompt

This time, we again modify the summary by using a different custom prompt: 

"Add the question "What are the factors that influence customer retention and return rate?"

:::image type="content" source="media/copilot-prompts/modified-question-prompt.png" alt-text="Screenshot showing factors that influence customer retention and return rate." lightbox="media/copilot-prompts/modified-question-prompt.png":::

### Create a narrative answer about something specific

Create a narrative answer investigating something specific in your report.  For example, this prompt: 

"Generate a summary explaining the relationship between revenue, location, and primary interest."

:::image type="content" source="media/copilot-prompts/explain-relationship.png" alt-text="Screenshot showing summary explaining the relationship between revenue, location, and primary interest." lightbox="media/copilot-prompts/explain-relationship.png":::

## Send feedback

We always welcome your feedback about our products, but especially during public preview, your feedback helps us improve the product faster.

## Next steps

- [Create a report with Copilot for Power BI](copilot-create-report.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)