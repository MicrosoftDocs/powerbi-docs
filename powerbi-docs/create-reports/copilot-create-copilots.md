---
title: Build your own Copilot solution accelerator for your coworkers
description: Read about how to create Copilots in Power BI for your coworkers.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 08/16/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Build your own Copilot solution accelerator for your coworkers

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You can create your own Copilots to help your coworkers with their tasks. Copilot helps you use the transformational power of generative AI so your coworkers can get the most from their data.

Copilot is turned on by default in Fabric. Administrators can turn off Copilot in the Fabric admin portal if your organization isn't ready to use it. For details on turning Copilot on and off, see [Enable Fabric Copilot for Power BI](/fabric/get-started/copilot-enable-fabric).

> [!NOTE]
> Copilot isn't yet supported for sovereign clouds due to GPU availability.

## Before you start using Copilot

For optimized results using Copilot for Power BI, you may need to do some clean-up work on your semantic model. Read the article [Update your data model to work well with Copilot](copilot-evaluate-data.md) to see if you need to modify your semantic model so that Copilot can get insights from it.

For answers to common questions related to data security and privacy to help your organization get started with Copilot for Fabric, see the articles in the Fabric documentation:

- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview) 
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)

## Create your own Copilots

You can create your own Copilots for your organization. See the documentation for [Azure AI Search](/azure/search/search-what-is-azure-search) to get started.

## Copilot requirements

See Copilot requirements in the [Overview of Copilot for Power BI](copilot-introduction.md#copilot-requirements) article.

## Copilot preview features

When using the Copilot pane in the **Power BI service**, you'll see a toggle with the word **Preview** next to it. The preview toggle allows you the opportunity to move into an experience that includes both generally available and public preview capabilities. 

To access Copilot features in public preview, select the preview toggle to activate the public preview experience.

:::image type="content" source="media/copilot-preview-toggle/copilot-preview-toggle.png" alt-text="Screenshot of the preview toggle in the on position in the Copilot chat pane.":::

If you don't want users in your organization to have access to the preview toggle, you need to [disable Fabric Copilot](/fabric/admin/service-admin-portal-copilot) in your organization or for specific security groups.

See [Use Copilot preview features in Power BI](copilot-preview-toggle.md) for more information about what features are available in preview.

See Copilot requirements in [Overview of Copilot for Power BI](copilot-introduction.md#copilot-requirements).

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
