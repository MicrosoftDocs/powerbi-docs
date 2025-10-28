---
title: Overview of Copilot for Power BI 
description: Read all about how Copilot works in Power BI.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 10/01/2025
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
> **Some Copilot experiences are generally available, and others are in preview.** The report agent Copilot pane available on the right side of reports is generally available. The Power BI agent available as a standalone, full-screen experience accessible from the Power BI left navigation is in preview. The Power BI app agent available as a full-screen screen experience accessible from an app's left navigation is in preview. Copilot experiences for Data Factory, Data Engineering, Data Science, Data Warehouse, and Real-Time Intelligence are in preview.
>
> **Sovereign clouds are unsupported.** Copilot isn't yet supported for sovereign clouds due to GPU availability.
>
> **If you have questions about privacy or security with Copilot**, see [Privacy, security, and responsible use for Copilot in Power BI](/fabric/get-started/copilot-power-bi-privacy-security).

## Data preparation

**Data needs to be prepared to work with Copilot.** Model owners need to invest in prepping their data for AI to ensure Copilot understands the unique business context, prioritizes the right information, and delivers responses that are consistent, reliable, and aligned with your goals. Without this prep, Copilot can struggle to interpret data correctly - leading to generic, inaccurate, or even misleading outputs. Learn how to [prep your data](copilot-prepare-data-ai.md).

## Capabilities

Copilot in Power BI offers a range of capabilities designed to enhance productivity and streamline workflows for business users, report authors, and data model owners. These features use AI to simplify complex tasks, provide actionable insights, and improve the overall data experience.

### Copilot for business users: Chat with your data

For business users, chatting with your data can mean many things. It might involve finding content. It could include asking for ad-hoc analyses or insights. You can also quickly create and analyze visuals. You might even get summaries of entire reports or focus on specific topics. All similar to what you might ask your analyst to do when you have follow-up questions about a report they made. When a question is related to data in the semantic model, Copilot uses the semantic model to answer the question, otherwise it may answer from the large language model's (LLM) [general knowledge](https://go.microsoft.com/fwlink/?linkid=2325401). Right now, we have three chat-with-your-data experiences for business users: the standalone Copilot experience, the Copilot pane for reports, and Copilot in apps.

#### The standalone Copilot experience (preview): Find data and ask questions about any item

Copilot in Power BI is available as a standalone, full-screen experience that allows people to find and analyze any report, semantic model, and Fabric data agent they have access to. Unlike the Copilot pane, which only answers questions about the report you currently have open, the standalone Copilot finds and answers questions about any data you have access to. [Learn more about the standalone Copilot](copilot-chat-with-data-standalone.md).

:::image type="content" source="media/copilot-introduction/copilot-standalone-screen.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a chat interface for interacting with data." lightbox="media/copilot-introduction/copilot-standalone-screen.png":::

The standalone Copilot can help with the following tasks:

- [Search for artifacts](copilot-search-new-content.md)
- [Summarize a report or topic](copilot-pane-summarize-content.md)
- [Answer questions about your data](copilot-ask-data-question.md)
- [Answer questions using a Fabric data agent](/fabric/data-science/concept-data-agent)
 
### Considerations and limitations

Newly purchased capacity or capacity scale-up operations may take up to 24 hours for Copilot to recognize and become available for use.

The standalone Copilot and Copilot in apps experiences aren't yet available in the following regions: India West, Indonesia Central, Korea South, Malaysia West, New Zealand North, Qatar Central, Taiwan North, Taiwan North West, UAE Central, France South, Germany North, Norway West. While prompts submitted in languages other than English may occasionally return relevant responses, multilingual use isn't officially supported at this time.

#### The Copilot pane: Ask questions about an open report

Business users can use the Copilot pane available on the right side of reports to ask a question about report content or summarize key insights in seconds. The report agent can help business users with the following tasks:

- [Summarize a report or topic](copilot-pane-summarize-content.md)
- [Answer Copilot questions about your data](copilot-ask-data-question.md)

Business users can also include [summaries when setting up subscriptions to reports](copilot-summaries-in-subscriptions.md).

:::image type="content" source="media/copilot-introduction/copilot-pane-questions.png" alt-text="Screenshot of the Copilot pane in Power BI, showing a chat interface for asking questions about an open report." lightbox="media/copilot-introduction/copilot-pane-questions.png":::

### Copilot for report authors: Build reports and enhance your models

Report authors can use Copilot in many ways, such as the following tasks:

- [Suggest content for a report](copilot-create-report-service.md#get-started-using-copilot)
- Create a [report page](copilot-prompts-report-pages.md)
- [Summarize the underlying semantic model](copilot-reports-overview.md#summarize-the-underlying-semantic-model)
- [Create a summary visual on the report itself](copilot-create-narrative.md)
- Write [DAX queries](/dax/dax-copilot)
- [Add descriptions for your semantic model measures](../transform-model/desktop-measure-copilot-descriptions.md)

Some of these capabilities are available through the Copilot pane, whereas others are accessible through inline Copilot experiences.

:::image type="content" source="media/copilot-introduction/copilot-build-reports.png" alt-text="Screenshot of Copilot building a report in Power BI." lightbox="media/copilot-introduction/copilot-build-reports.png":::

### Copilot clear chat

The "clear chat" button removes the contents of the current conversation and any previous context set throughout the conversation. This is essentially the same as starting a new chat. Note: This doesn't refresh the underlying data.
It's best to use "clear chat" when switching topics to avoid overloading Copilot with unrelated prior context. Clear the chat to ensure clear and focused responses.

If you ask the same exact prompt on an unchanged semantic model (same schema, data, and custom instructions) within a rolling 24-hour window, Copilot responds from the cache for efficiency. It's expected behavior to receive the same response in this case. The "clear chat" button doesn't impact this. If you aren't expecting the same response, try changing your prompt or refreshing the underlying model.

## Copilot requirements

To ensure a seamless experience with Copilot in Power BI, it's important to meet specific requirements. These requirements vary depending on the type of Copilot experience you're using, such as the standalone Copilot or the Copilot pane within reports. Here's a breakdown of the general and specific requirements for using Copilot effectively.

### General requirements

The following requirements pertain to all Copilot experiences in Power BI.

- Your administrator needs to [enable Copilot in Microsoft Fabric](/fabric/fundamentals/copilot-enable-fabric).
- You need to have an [F2 capacity](https://azure.microsoft.com/pricing/details/microsoft-fabric/) or above to be able to use Copilot.
- Your Fabric capacity needs to be in one of the regions listed in [Fabric region availability](/fabric/admin/region-availability). If it isn't, you can't use Copilot.
- If your tenant or capacity is outside the United States or France, Copilot is disabled by default unless your Fabric tenant admin enables the tenant setting called [**Data sent to Azure OpenAI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance**](/fabric/admin/service-admin-portal-copilot) in the Fabric admin portal.
- Copilot in Microsoft Fabric isn't supported on trial stock-keeping units (SKUs) or trial capacities. Only paid SKUs are supported.
- Copilot isn't yet supported for sovereign clouds due to GPU availability.

### Requirements for the standalone Copilot

The following requirements pertain to the full-screen standalone Copilot experience accessed via the left navigation.

#### Enable tenant settings

- The setting called [**Users can use Copilot and other features powered by Azure OpenAI**](/fabric/admin/service-admin-portal-copilot#users-can-use-copilot-and-other-features-powered-by-azure-openai) must be enabled at the tenant level. It isn't sufficient to enable it at the capacity level (that is, if delegated).
- The tenant setting called [**Users can access a standalone, cross-item Power BI Copilot experience (preview)**](copilot-enable-power-bi.md#enable-the-standalone-power-bi-copilot-experience-preview) must be enabled.

:::image type="content" source="media/copilot-introduction/copilot-access-standalone-enabled.png" alt-text="Screenshot of the standalone Copilot admin screen with options enabled." lightbox="media/copilot-introduction/copilot-access-standalone-enabled.png":::

#### Link to a Fabric Copilot capacity

To use the standalone Copilot experience, your activity must be linked to a capacity. The recommended approach is to use a dedicated [Fabric Copilot capacity (FCC)](/fabric/enterprise/fabric-copilot-capacity). If your organization has an FCC, all Copilot usage across Power BI is automatically billed to a single, centralized capacity. 

#### Use an autoselected Copilot workspace

If your org doesn't have an FCC, standalone Copilot automatically selects a workspace linked to a capacity that supports Copilot. This workspace must meet Copilot requirements (linked to an F2 capacity or higher, in a supported region, and enabled for Copilot) and is used for usage tracking and billing.
We automatically select a workspace from a partially randomized list of eligible workspaces, weighted toward workspaces with more available capacity. This approach helps balance usage and prevents overloading any single capacity. This selection persists across sessions as long as the workspace remains Copilot-enabled and has available capacity. If the workspace becomes disabled for Copilot or reaches its capacity limit, we automatically reassign a new one and notify the user. If an FCC becomes available, it always overrides the autoselected workspace. Users receive a dismissible notification showing the chosen workspace and a direct option to change it.

:::image type="content" source="media/copilot-introduction/workspace-autoselection.png" alt-text="Screenshot of the standalone Copilot confirmation that the workspace was autoassigned via autoselection." lightbox="media/copilot-introduction/workspace-autoselection.png":::

#### Change your Copilot workspace

You can update your Copilot workspace anytime via **More > Manage workspace** in the standalone Copilot experience. Once you manually select a workspace, we only override it if an FCC becomes available. If your chosen workspace becomes disabled or reaches its capacity limit, we alert you and provide options to select a new workspace manually or through autoselection.

:::image type="content" source="media/copilot-introduction/workspace-manage.png" alt-text="Screenshot of the standalone Copilot more menu with the option to manage workspace." lightbox="media/copilot-introduction/workspace-manage.png":::

:::image type="content" source="media/copilot-introduction/workspace-choose.png" alt-text="Screenshot of the standalone Copilot menu with the option to choose or update your Copilot workspace." lightbox="media/copilot-introduction/workspace-choose.png":::

### Requirements for Copilot within reports

These requirements pertain to using Copilot within Power BI reports, including the Copilot pane experience.

- **Power BI Desktop**:
  - You need *write access* to a workspace that is on a paid Fabric capacity or Power BI Premium in the Power BI service, where you plan to publish the report. Read more about using [Copilot in Power BI Desktop](copilot-power-bi-desktop.md).
- **Power BI service**:
  - The report must be located in a workspace linked to either [Premium Power BI (P1 and above)](../enterprise/service-premium-features.md) or a paid [Fabric](/fabric/enterprise/licenses) capacity. [Learn how to check your license type](copilot-create-report-service.md#use-copilot-in-the-power-bi-service-for-the-first-time).
  - To generate summarized insights in reports, you need at least *read access* to the workspace, report, or app.
  - To add a narrative visual to a report or generate Copilot reports, you need *edit access* to the workspace or report, or *build access* to the semantic model

### Requirements for app-scoped Copilot (preview)

These requirements pertain to using [app-scoped Copilot in Power BI apps](copilot-apps-overview.md), the full-page Copilot experience accessible from app navigation.

- Meet the [**general requirements for Copilot**](#general-requirements), including the setting called [**Users can use Copilot and other features powered by Azure OpenAI**](/fabric/admin/service-admin-portal-copilot#users-can-use-copilot-and-other-features-powered-by-azure-openai) must be enabled at the tenant level. It isn't sufficient to enable it at the capacity level (that is, if delegated).
- Like standalone Copilot, app-scoped Copilot uses an [FCC](/fabric/enterprise/fabric-copilot-capacity) or an [autoseleccted workspace](#use-an-autoselected-copilot-workspace). Or you can [manually select a workspace](#change-your-copilot-workspace).
- The setting for showing Copilot in the app navigation must be enabled. This setting is unique per app and is managed while [publishing or updating an app](../collaborate-share/service-create-distribute-apps.md) under *Advanced settings* > *Show Copilot in app navigation*.


:::image type="content" source="media/copilot-introduction/workspace-app-copilot-setting.png" alt-text="Screenshot of app-scoped Copilot setting.":::

> [!NOTE]
> **Copilot in apps is on by default** and can be managed per app. 

## Related content

- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)
- [Copilot in Fabric consumption](/fabric/fundamentals/copilot-fabric-consumption)
