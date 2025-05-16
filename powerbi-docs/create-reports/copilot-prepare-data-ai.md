---
title: Prepare your data for AI
description: Prepare your data for AI in Power BI with new features like AI data schema, verified answers, and AI instructions. Learn how to optimize your semantic model for Copilot and enhance AI-driven insights.
author: julcsc
ms.author: juliacawthra
ms.reviewer: 
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/08/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to understand how to prepare my data for AI to optimize Copilot's performance, improve AI-driven insights, and enhance user interactions by leveraging new features like AI data schema, verified answers, and AI instructions.
---

# Prepare your data for AI

> [!IMPORTANT]
> The features mentioned on this page are now available in Power BI Desktop and are currently in development for the Power BI service. See the [Fabric Roadmap](https://aka.ms/FabricRoadmap) for timeline details.

Power BI is introducing new capabilities to help you get your data ready for natural language experiences with Copilot. The first step to get the best results from Power BI Copilot is always to have a semantic model that follows best practices. However, models often require more assistance to be fully prepared for the optimal interactions with AI. We've delivered tooling features to help you prepare your data for AI. These features allow you to provide more context about your model, help guide Copilot to the right data in the model, and help increase the quality of Copilot output.

## New tooling features for prepping your data for AI

We're introducing three new features:

- **AI data schema**: Allows model authors to define a dedicated schema specifically for Copilot, making it easier for AI to understand which tables, fields, and relationships are most relevant.
- **Verified answers**: Enables you to link a question users ask to a specific visual, allowing Copilot to produce a verified answer vetted by a human.
- **AI instructions**: Provides important context about your data model, helping Copilot generate responses that are more accurate and aligned with your intent.

These features for preparing your data for AI provide Copilot the context it needs to reduce ambiguity, improve relevance and accuracy, and make user interactions with Copilot more fluent and intuitive.

:::image type="content" source="media/copilot-prep-data/copilot-prep-data.png" alt-text="Screenshot of the Prep data for AI button in Power BI Desktop, located next to the Copilot button in the home ribbon." lightbox="media/copilot-prep-data/copilot-prep-data.png":::

## Why you want to prep your data for AI

Preparing your data for AI creates the foundation for high-quality, grounded, and context-aware AI experiences. When data is unstructured or ambiguous, AI systems can struggle to interpret it correctly - leading to generic, inaccurate, or even misleading outputs. By investing in data preparation, you help AI understand your unique business context, prioritize the right information, and deliver responses that are consistent, reliable, and aligned with your goals. This not only improves user trust but also accelerates adoption and impact across your organization.

> [!NOTE]
> Features to help prepare your data for AI can't guarantee specific output every time. AI behavior is nondeterministic, meaning Copilot doesn’t always produce the exact same response, even with the same input.

## How to access features to prepare your data for AI

### Power BI Desktop

To access the features in Power BI Desktop, follow these steps:

1. Select the **Prep data for AI** button on the home ribbon in Power BI Desktop. This opens a unified experience with three features to help you prepare your data to be ready for Copilot. 
1. To set a verified answer, select a visual.
1. Select the **...** menu, and choose **Set verified answer**.

Now you can set trigger phrases that, when a user asks, return an answer using the selected visual.

:::image type="content" source="media/copilot-prep-data/copilot-desktop-features.png" alt-text="Screenshot of the Copilot Desktop features in Power BI, showcasing the Prep data for AI options." lightbox="media/copilot-prep-data/copilot-desktop-features.png":::

All updates are saved on the semantic model, not the report.

### Power BI service

To set a verified answer in the Power BI service, ensure the following apply:

- You're in a Copilot-enabled workspace.
- You have authoring permission on the semantic model the report is built on.
- You're in edit mode.
- The visual is selected.

1. To set a verified answer, select a visual.
1. Select the **...** menu, and choose **Set up a verified answer**.

Now you can set trigger phrases that, when a user asks, return an answer using the selected visual. All verified answers are saved to the semantic model.

:::image type="content" source="media/copilot-prep-data/copilot-service-features.png" alt-text="Screenshot of the Copilot Service features in Power BI, showcasing the Prep data for AI options." lightbox="media/copilot-prep-data/copilot-service-features.png":::

You can manage verified answers by selecting the Prep data for AI button in the ribbon of the semantic model page. 

:::image type="content" source="media/copilot-prep-data/copilot-prep-data-ai-service.png" alt-text="Screenshot of the Prep data for AI features in the Power BI service, showcasing the options available for preparing data for AI." lightbox="media/copilot-prep-data/copilot-prep-data-ai-service.png":::

## Test your Copilot tooling changes

### Use the skill picker

After preparing your data for AI, you can test what your end-users will see through the Desktop Copilot report pane. The skill picker is a tool that gives you greater control over how Copilot responds by allowing you to select specific Copilot capabilities to enable.

Currently, the skill picker includes three capabilities:

- **Answer questions about the data**: Uses Copilot to respond to questions based on a given semantic model
- **Analyze report visuals**: Enables Copilot to interpret and answer questions about the visuals within a report
- **Create new report pages**: Lets Copilot generate new report pages based on your prompts

By selecting which capabilities to enable, authors can simulate different environments and test how their changes affect the Copilot experience.

- **Standalone Copilot experience (Home):** Select **Answer questions about the data**
- **Report Copilot Pane - Read Mode:** Select **Answer questions about the data** and **Analyze report visuals**
- **Report Copilot Pane - Edit Mode:** Enable all three capabilities

By default, all three skills are enabled in Power BI Desktop, giving you immediate access to the full range of Copilot functionality. To customize the skills for your session, select the **Select skills** dropdown in the Copilot chat box and choose the combination that fits your needs.

### Test prep data for AI capabilities

Use the Copilot report pane in Power BI Desktop to test the changes made through the prep data for AI dialog. Testing changes should be iterative and thorough. Each time you make an update to one of the features, refresh the Copilot report pane by closing and reopening it to see the latest updates.

You can troubleshoot changes through access the download diagnostic in the three dot menu in the report pane and through analyzing the **How Copilot arrived at this** (HCAAT) feature included in any answers from your semantic model. 

:::image type="content" source="media/copilot-prep-data/copilot-test-prep.png" alt-text="Screenshot of testing the Prep data for AI features in Power BI Desktop, showcasing the Copilot report pane." lightbox="media/copilot-prep-data/copilot-test-prep.png":::

Once you test and confirm your prep data for AI enhancements, your report is ready to be published to the Power BI service for broad consumption.

## Mark your model as prepped for AI

Once you prepare your semantic model for AI and it's ready for consumption, you can mark your model as *prepped for AI* by following these steps:

1. Go to the Power BI service and find your semantic model.
1. Select the **settings** icon in the top left corner.
1. Expand the **AI preparation** section.
1. Check the box for **Prepped for AI**, then select the **Apply** button.

:::image type="content" source="media/copilot-prep-data/copilot-ai-preparation.png" alt-text="Screenshot of the AI preparation settings in Power BI service, showcasing the option to mark a model as prepped for AI." lightbox="media/copilot-prep-data/copilot-ai-preparation.png":::

When your semantic model is marked as *prepped for AI*, it doesn't receive any friction treatment or warning label in the standalone Copilot agent. Also, reports that use that semantic model can be considered as prepped for AI.

> [!NOTE]
> Although marking a semantic model as *prepped for AI* should remove the friction treatment and warning labels in standalone Copilot immediately, reports built from that model might take up to 24 hours to remove these behaviors. To trigger a report reindexing, you can manually save a small change to a report to speed up the process. There's currently no way to mark a report, dashboard, or app as prepped for AI.


## Turn off the preview features in Desktop

If you need to remove the ability to author prep data for AI features, you can do this within Power BI Desktop. 

1. Select **File > Options and settings > Options > Preview features > Prep data for AI**.
1. Deselect the box for **prep data for AI**. 

When you restart Desktop, you no longer see the **Prep data for AI** button.

## Considerations and limitations

- Q&A must be enabled on your semantic model.
- All prep data for AI features are available to author in Power BI Desktop.
- Only verified answers can be authored in the Power BI service.
- All prep data for AI features can be consumed by users everywhere Power BI Copilot is available.
- Prep data for AI features in Power BI Desktop are only supported with the following connection types:
  - Import
  - Direct Query
  - Composite (local)
- All prep data for AI features are saved to the model upon closing the dialog.
- You can test all prep data for AI features in the report Copilot pane before publishing to the service.
- To troubleshoot prep data for AI features, utilize the HCAAT functionality and use the **Download diagnostics** feature from the three-dot menu in the Copilot pane in Power BI Desktop to ensure prep data for AI features were applied. Include the diagnostic file when creating support requests.
- We encourage the use of HCAAT, included in answers that come from a semantic model, to provide transparency into what Copilot used to arrive at the provided answer.
- After saving changes in the prep data for AI dialog, refresh the Copilot pane by closing and reopening it for changes to take effect.
- AI instructions and AI data schema are saved to the LSDL and can be edited accordingly.
- In rare circumstances, Copilot capabilities might time out, resulting in an error due to the inability to fetch the LSDL.
- For LSDL/Tooling edits made through GIT or deployment pipelines:
  - **Import models**: A model refresh is required in the Power BI service to sync the LSDL/Tooling changes after deployment.
  - **Direct query models**: A model refresh is required in the Power BI service to sync the LSDL/Tooling changes after deployment, but are limited to once a day.
  - **Direct lake models**: A model refresh is required in the Power BI service to sync the LSDL/Tooling changes after deployment, but are limited to once a day.

## Related content

- [AI data schema](copilot-prepare-data-ai-data-schema.md)
- [Verified answers](copilot-prepare-data-ai-verified-answers.md)
- [AI instructions](copilot-prepare-data-ai-instructions.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)