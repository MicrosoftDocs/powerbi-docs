---
title: Overview of Copilot for Power BI 
description: Read all about how Copilot works in Power BI.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/06/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Overview of Copilot for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI, Copilot helps you use the transformational power of generative AI to get the most from your data. We have chat-based experiences where Copilot can help you with tasks from on-the-fly analysis for business users to data analysis expression (DAX) generation for advanced creators. We also have various AI-infused Copilot features throughout the product.  

This article provides an overview of the Copilot capabilities for Power BI.

> [!NOTE]
> **Copilot is enabled by default.** Administrators can turn off Copilot in the Fabric admin portal if your organization isn't ready to use it. For details on turning Copilot on and off, see [Enable Fabric Copilot for Power BI](/fabric/get-started/copilot-enable-fabric).
>
> **Some Copilot experiences are generally available, and others are in preview.** The report agent (the Copilot pane available on the right side of reports) is generally available, while the Power BI agent (the standalone, full-screen experience accessible from the Power BI left navigation) is in preview. Copilot experiences for Data Factory, Data Engineering, Data Science, Data Warehouse, and Real-Time Intelligence are in preview.
>
> **Sovereign clouds are unsupported.** Copilot isn't yet supported for sovereign clouds due to GPU availability.
>
> **If you have questions about privacy or security with Copilot, see [Privacy, security, and responsible use for Copilot in Power BI](/fabric/get-started/copilot-power-bi-privacy-security).

## Data preparation

**Data needs to be prepared to work with Copilot.** Model owners need to invest in prepping their data for AI to ensure Copilot understands the unique business context, prioritizes the right information, and delivers responses that are consistent, reliable, and aligned with your goals. Without this prep, Copilot can struggle to interpret data correctly - leading to generic, inaccurate, or even misleading outputs. Learn how to [prep your data](https://go.microsoft.com/fwlink/?linkid=2316906).

## Capabilities

Copilot in Power BI offers a range of capabilities designed to enhance productivity and streamline workflows for business users, report authors, and data model owners. These features use AI to simplify complex tasks, provide actionable insights, and improve the overall data experience.

### Copilot for business users: Chat with your data

For business users, chatting with your data can mean finding content, asking for ad-hoc analyses or insights, quickly creating and analyzing visuals, and getting summaries of whole reports or specific topics (similar to what you might ask your analyst to do when you have follow-up questions about a report they made). Right now, we have two chat-with-your-data experiences for business users: the standalone Copilot experience and the Copilot pane.

#### The standalone Copilot experience (preview): Find data and ask questions about any item

Copilot in Power BI is available as a standalone, full-screen experience that allows people to find and analyze any report, semantic model, and Fabric data agent they have access to. Unlike the Copilot pane, which only answers questions about the report you currently have open, the standalone Copilot finds and answers questions about any data you have access to. [Learn more about the standalone Copilot](https://go.microsoft.com/fwlink/?linkid=2319208).

:::image type="content" source="media/copilot-introduction/copilot-standalone-screen.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a chat interface for interacting with data." lightbox="media/copilot-introduction/copilot-standalone-screen.png":::

The standalone Copilot can help with the following tasks:

- [Search for artifacts](https://go.microsoft.com/fwlink/?linkid=2316904)
- [Summarize a report or topic](https://go.microsoft.com/fwlink/?linkid=2316804)
- [Answer questions about your data](https://go.microsoft.com/fwlink/?linkid=2316905)
- [Answer questions using a Fabric data agent](https://go.microsoft.com/fwlink/?linkid=2316805)

#### The Copilot pane: Ask questions about an open report

Business users can use the Copilot pane available on the right side of reports to ask a question about report content or summarize key insights in seconds. The report agent can help business users with the following tasks:

- [Summarize a report or topic](https://go.microsoft.com/fwlink/?linkid=2316804)
- [Answer Copilot questions about your data](https://go.microsoft.com/fwlink/?linkid=2316905)

Business users can also include [summaries when setting up subscriptions to reports](link).

:::image type="content" source="media/copilot-introduction/copilot-pane-questions.png" alt-text="Screenshot of the Copilot pane in Power BI, showing a chat interface for asking questions about an open report." lightbox="media/copilot-introduction/copilot-pane-questions.png":::

### Copilot for report authors: Build reports and enhance your models

Report authors can use Copilot for many tasks, such as the following:

- Suggest content for a report
- Create a report page
- Summarize the underlying semantic model
- Create a summary visual on the report itself
- Write DAX queries
- Add descriptions for your semantic model measures

Some of these capabilities are available through the Copilot pane, whereas others are accessible through inline Copilot experiences.

## Copilot requirements

To ensure a seamless experience with Copilot in Power BI, it's important to meet specific requirements. These requirements vary depending on the type of Copilot experience you're using, such as the standalone Copilot or the Copilot pane within reports. Here's a breakdown of the general and specific requirements for using Copilot effectively.

### General requirements

The following requirements pertain to all Copilot experiences in Power BI.

- Your administrator needs to [enable Copilot in Microsoft Fabric](/fabric/fundamentals/copilot-enable-fabric).
- Your Fabric capacity needs to be in one of the regions listed in [Fabric region availability](/fabric/admin/region-availability). If it isn't, you can't use Copilot.
- If your tenant or capacity is outside the United States or France, Copilot is disabled by default unless your Fabric tenant admin enables the tenant setting called [**Data sent to Azure OpenAI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance**](/fabric/admin/service-admin-portal-copilot) in the Fabric admin portal.
- Copilot in Microsoft Fabric isn't supported on trial stock-keeping units (SKUs). Only paid SKUs are supported.
- Copilot isn't yet supported for sovereign clouds due to GPU availability.

### Requirements for the standalone Copilot

The following requirements pertain to the full-screen standalone Copilot experience accessed via the left navigation.

- The setting called [**Users can use Copilot and other features powered by Azure OpenAI**](/fabric/admin/service-admin-portal-copilot#users-can-use-copilot-and-other-features-powered-by-azure-openai) must be enabled at the tenant level. It isn't sufficient to enable it at the capacity level (that is, if delegated).
- The tenant setting called **Users can access a standalone, cross-item Power BI Copilot experience (preview)** must be enabled.

:::image type="content" source="media/copilot-introduction/copilot-access-standalone-enabled.png" alt-text="Screenshot of the standalone Copilot admin screen with options enabled." lightbox="media/copilot-introduction/copilot-access-standalone-enabled.png":::

### Requirements for Copilot within reports

These requirements pertain to using Copilot within Power BI reports, including the Copilot pane experience.

- **Power BI desktop**:
  - You need *write access* to a workspace that is on a paid Fabric capacity or Power BI Premium in the Power BI service, where you plan to publish the report. Read more about using [Copilot in Power BI Desktop](copilot-power-bi-desktop.md).
- **Power BI service**:
  - The report must be located in a workspace linked to either [Premium Power BI (P1 and above)](../enterprise/service-premium-features.md) or a paid [Fabric](/fabric/enterprise/licenses) capacity. [Learn how to check your license type](copilot-create-report-service.md#use-copilot-in-the-power-bi-service-for-the-first-time).
  - To generate summarized insights in reports, you need at least *read access* to the workspace, report, or app.
  - To add a narrative visual to a report or generate Copilot reports, you need *edit access* to the workspace or report, or *build access* to the semantic model

## Related content

- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)
