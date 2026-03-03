---
title: Copilot in Power BI integration
description: Discover how Copilot in Power BI enhances data analytics by assisting with report creation and enabling data exploration.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: daengli
ms.service: powerbi
ms.topic: concept-article
ms.date: 04/15/2025
ms.collection: ce-skilling-ai-copilot
---

# Copilot in Power BI integration

Copilot in Microsoft Fabric is a generative AI assistant that aims to enhance the data analytics experience in the Fabric platform. There are different Copilots in each of the Fabric workloads, including Power BI. Various Power BI personas including enterprise developers, self-service users, and business users can all use the various Copilot in Power BI experiences. This article provides an in-depth overview of how Copilot in Power BI enhances the data analytics experience by assisting users in creating and consuming semantic models and reports.

> [!NOTE]
> For additional information, see the [Copilot in Power BI documentation](copilot-introduction.md).

:::image type="content" source="media/copilot-integration/copilot-power-bi-users.svg" alt-text="Diagram depicting how different users can use Copilot in Power BI for both semantic models and reports.":::

Copilot in Power BI aims to help both Power BI developers and analysts *create* models and reports, while also giving business users new ways to *consume* those models and reports. The following diagram depicts how different personas in Power BI can use the various Copilot experiences to create or consume their data.

:::image type="content" source="media/copilot-integration/copilot-creation-consumption.svg" alt-text="Diagram depicting how Copilot in Power BI has both creation and consumption experiences that cater to different audiences.":::

In summary, Copilot in Power BI has experiences that support the creation of Power BI items, like generating descriptions for model measures. Centralized enterprise developers, architects, data engineers, or self-service developers might all use these experiences to support their development tasks. Copilot experiences can also support consumption of Power BI items, such as asking questions in the Copilot chat pane of a report. Self-service users, business users, and even enterprise developers can all leverage these experiences to help them answer questions about their data in specific scenarios. Finally, some Copilot experiences support both creation and consumption, like generating DAX in a semantic model to either query and explore the model, or to create model measures that contain calculations and business logic.

> [!NOTE]
> Like Copilot in the other Fabric workloads, Copilot in Power BI can't *replace* the people who create semantic models or reports in your organization. Rather, Copilot aims to *augment* those individuals so that they're more efficient in their tasks and so that they can improve the models and reports that they create.
>
> Likewise, generated reports or answered data questions by Copilot can't replace the models and reports created by Power BI developers or analysts. These people typically have a deeper and broader understanding of the business problem and its surrounding context.

Copilot in Power BI provides new opportunities and approaches to work with your data. However, getting the most value from these new opportunities and approaches a healthy data culture and good adoption of Power BI. This includes preparing effective user training and enablement, as well as monitoring and governing Copilot usage. Enabling and using Copilot in Power BI requires careful deliberation; you can't just turn on Copilot and expect to see productivity enhancement across your organization.

## Overview of how Copilot in Power BI works

Copilot in Power BI works similarly to the general process of [Copilot in Fabric](/fabric/fundamentals/copilot-fabric-overview). However, Copilot in Power BI differs in several areas, depending on the specific Copilot experience that an individual uses.

The following diagram depicts the different areas that differ between the Copilot experiences with Copilot in Power BI compared to Copilot in other workloads.

:::image type="content" source="media/copilot-integration/copilot-experiences-diagram.png" alt-text="Diagram depicting how Copilot experiences differ in the overall Copilot process.":::

In summary, there are several areas that differ in the Copilot architecture depending on which Copilot experience that you use.

- **Input:** Different experiences require a user to provide input in different ways.
  - The *ask data questions* experiences for models or reports require the user to write a prompt in the Copilot chat pane.
  - The *generate measure descriptions* experience requires a user to push a button in the Properties pane in the Model view of Power BI Desktop.

- **Preprocessing and grounding data:** Depending on the experience, Copilot retrieves different grounding data. Examples of preprocessing differences between the Copilot experiences in Power BI include:
  - The *ask data questions of a semantic model* experience might use the semantic model schema or linguistic model to generate an appropriate query. A semantic model developer can control what part of the schema Copilot can see and use by hiding fields. They can also increase the usefulness of their Copilot outputs by optimizing their model to work better with Copilot, such as adding descriptions.
  - The *report page summarization* experience might use report metadata or even specific data points from your report visuals to make the summary. A report developer can control what part of the report Copilot can see and use by hiding pages and visuals.

- **Postprocessing:** Depending on the experience, Copilot handles the large language model (LLM) response in different ways. Examples of postprocessing differences between the Copilot experiences in Power BI include:
  - The *DAX query view* experience runs DAX from the LLM response through a DAX parser to ensure the generated DAX query will run. If not—for instance, if the LLM produces hallucinations—then Copilot requests a new LLM response.
  - The *report page creation* experience takes the LLM response and combines it with an existing Copilot theme, the report metadata, and other information to create the new page in the Power BI report.

- **Output:** Depending on the experience, Copilot will return different types of outputs to a user after postprocessing. Examples of output differences between the Copilot experiences in Power BI include:
  - The *DAX query view* experience produces DAX queries if the user asks to generate or suggest DAX code, but it produces a natural language explanation of a DAX concept if the user asks how generated code works.
  - The *report page creation* experience produces a new report page if the user asks to generate a report page or to change an existing, previously generated report page.

### Copilot in Power BI overview diagram

The following diagram gives an overview of how someone can use the different Copilot experiences with Copilot in Power BI.

:::image type="content" source="media/copilot-integration/copilot-use-process-flow.svg" alt-text="Diagram depicting a process flow for how someone can use Copilot in Power BI.":::

The diagram consists of the following parts and processes:

| **Item** | **Description** |
|---|---|
| **1** | The user provides an input to Copilot, which could be a written prompt or another interaction that generates a prompt. All interactions with Copilot are user specific. The user can interact with Copilot in Power BI either using the Power BI mobile app, Power BI Desktop, or in a Fabric workspace. |
| **2** | In the Power BI mobile app, users can access a standalone Copilot experience from the app home screen on phones and tablets to chat with data without first opening a specific report. Users can generate summaries, key insights, and auto-generated visuals with citations, share results with colleagues, and use voice dictation for prompts on iOS. Users can also view reports in Power BI apps or Fabric Org Apps and ask questions about specific reports using the in-report Copilot. For more information, see [Overview of Copilot in Power BI mobile apps](../explore-reports/mobile/mobile-copilot-overview.md). |
| **3** | In Power BI Desktop, users can use Copilot while they develop semantic models. They can ask data questions, generate DAX queries in the DAX query view, or generate synonyms for Q&A linguistic modeling or measure descriptions for the semantic model.<br><br>To use Copilot in Power BI Desktop, users have to connect to a supported workspace on Fabric capacity. |
| **4** | In a workspace that uses a workspace type of a supported Fabric capacity, users can use Copilot with semantic models and reports that they Publish from Power BI Desktop, upload via Git integration, or create in Fabric. Users might also use notebooks to help develop and manage semantic models by using semantic link and could use Copilot in those notebooks (even though notebooks are not an item of the Power BI workload). |
| **5** | In Power BI Desktop, users can connect to a semantic model from any workspace and create reports. They might use Copilot to ask data questions, generate DAX, visuals, or summaries to support the report creation process.<br><br>To use Copilot in Power BI Desktop, users have to connect to a supported workspace on Fabric capacity. |
| **6** | Workspaces that have a workspace type of Power BI Pro, Premium Per User (PPU), or an unsupported F SKU don't support Copilot.<br><br>Users can consume items from these workspaces in Power BI Desktop and use Copilot, so long as they set up Power BI Desktop to consume Fabric capacity from a supported workspace.<br><br>Users can also create reports in these workspaces, and use Copilot in these reports, so long as that report connects to a semantic model in supported workspace |

> [!NOTE]
> While this diagram focuses on Power BI, Power BI developers and analysts don't necessarily use the Power BI workload in Fabric exclusively. These individuals also likely use the other Fabric workloads to create items and leverage the other various Copilot experiences.

### How to enable Copilot in Power BI

To use Copilot in Power BI, you have to first enable it. The steps to enable Copilot in Power BI are similar to the steps you take to [enable Copilot in Fabric](/fabric/fundamentals/copilot-enable-fabric). You can enable or disable Copilot specifically for Power BI, like with the other workloads.

There are also several other noteworthy scenarios to consider:

- **P SKUs:** You can also use Copilot in Power BI if you have a P SKU.

- **Cross-workspace consumption:** Some Copilot experiences will still work when you consume items located in workspaces that use a workspace type that doesn't support Copilot, like Pro, PPU, or an unsupported SKU. For example, you can use Copilot in Power BI Desktop while consuming a semantic model published to workspaces that don't support Copilot. Similarly, you can also connect to these semantic models from certain Fabric items, like notebooks using the Semantic Link feature.

- **Cross-capacity consumption:** Fabric administrators can [delegate Copilot consumption to a Fabric Copilot capacity (FCC)](https://www.microsoft.com/microsoft-fabric/blog/2024/11/19/accelerate-app-innovation-with-an-ai-powered-data-platform/#:~:text=Fabric%20billing%20and%20consumption%20updates). This can be a useful way to prevent Copilot usage from impacting your main Fabric capacity that other Fabric workloads and items need to support business-critical processes or decision making.

- **Mobile apps:** Copilot interactions in the Power BI mobile apps require a supported Fabric capacity. Copilot activity from mobile is billed against Fabric capacity, including when delegated to a Fabric Copilot capacity (FCC).

## Responsible use of Copilot in Power BI

The following considerations are important to keep in mind when you use Copilot in Power BI:

- **Governance:** Ensure that you set up security groups and allow access to Copilot in Power BI only once users have completed training or demonstrated their understanding of the technology, its limitations, and its use cases. If you're enabling Copilot for the first time, use this approach to incrementally roll out Copilot in Power BI in phases when you're ready.

- **Preparation of semantic models:** Significant effort must go into preparing your semantic model to work well with Copilot. These preparations include ensuring proper naming conventions, field descriptions, following good modeling practices, setting up linguistic modeling, and other steps. Neglecting these preparations can lead to Copilot producing more unhelpful and inaccurate results. The standalone Copilot experience in Power BI mobile apps surfaces clear warnings when a semantic model isn't prepared for AI and directs users to [preparation guidance](copilot-prepare-data-ai.md).

- **Preparation of business users:** If business users should use Copilot in Power BI, you should explain to them when to use Copilot and when to simply look at and use their reports. Encouraging business users to use Copilot instead of interacting with reports can lead to increased capacity usage and inefficiency, as they might spend more time writing prompts and reading outputs than reading and interpreting visuals. Instead, they can use Copilot to help them find and interpret information in busy reports, particularly when they can't find what they need.

- **Evaluation of outputs:** Copilot outputs can contain inaccurate and low-quality content. Outputs are also nondeterministic; meaning that it's possible that a user receives a different output from a Copilot experience, despite using the same prompt and grounding data. It's important to set expectations with users so that they know what kinds of outputs to expect from Copilot, and how they can evaluate or validate these outputs, for themselves.

For more information, see [Privacy, security, and responsible AI use of Copilot in Fabric](/fabric/fundamentals/copilot-privacy-security) and [Copilot in Power BI](/fabric/fundamentals/copilot-power-bi-privacy-security).

> [!WARNING]
> Content filtering and responsible AI features automatically reject LLM calls that contain certain words and phrases that are potentially harmful or problematic. However, your model might contain valid uses of these words and phrases for certain analyses or scenarios. If your model schema or metadata contains any of these phrases, then you can't use Copilot in Power BI, as all of your prompts will result in errors.
>
> Separately, consider enabling Copilot in Fabric for specific security groups and workspaces only after you take the appropriate steps to prepare to use it responsibly. Enabling Copilot before you make these preparations can lead to unnecessary governance risks and challenges with adoption.

## Copilot experiences in Power BI

There are different Copilot experiences in Power BI which you can use with either semantic models or reports. The following articles in this series describe these experiences in detail and how you can best use them.

- [Use Copilot with semantic models](copilot-semantic-models.md)
- [Use Copilot with Power BI reports](copilot-reports-overview.md)
- [Standalone Copilot in Power BI mobile apps](../explore-reports/mobile/mobile-standalone-copilot.md): A consumption experience accessible from the Power BI mobile home screen that lets you chat with your data, get summaries and insights, receive auto-generated visuals with citations, share results, and use voice dictation on iOS.

> [!NOTE]
> See [Where to find the Copilot experiences in Fabric](/fabric/fundamentals/copilot-fabric-overview#copilot-experiences) for a full overview of each experience by item and workload.

## Related content

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Enable Copilot in Fabric](/fabric/fundamentals/copilot-enable-fabric)
