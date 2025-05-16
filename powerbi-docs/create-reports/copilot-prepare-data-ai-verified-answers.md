---
title: Prepare your data for AI - Verified answers
description: Learn how to prepare your data for AI in Power BI by using verified answers. Optimize Copilot's performance, improve AI-driven insights, and enhance user interactions by defining a focused subset of your model's schema.
author: julcsc
ms.author: juliacawthra
ms.reviewer: 
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/11/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to learn how to prepare my data for AI by using features like the AI data schema to optimize Copilot's performance, ensure accurate and verified answers, and enhance AI-driven insights and user interactions.
---

# Prepare your data for AI - Verified answers

> [!IMPORTANT]
> The features mentioned on this page are now available in Power BI Desktop and are currently in development for the Power BI service. See the [Fabric Roadmap](https://aka.ms/FabricRoadmap) for timeline details.

Verified answers are human-approved, visual responses in Copilot that are triggered by predefined phrases. Each verified answer includes one or more trigger phrases, a visual, and optional associated filters.

:::image type="content" source="media/copilot-prep-data/copilot-verified-answer.png" alt-text="Screenshot of a verified answer setup in Power BI, showing trigger phrases and filters." lightbox="media/copilot-prep-data/copilot-verified-answer.png":::

These answers are stored in the semantic model, ensuring consistent and high-quality responses across all reports that use that model.

There are two major reasons to use verified answers:

- **Improve consistency**: Provide curated, reliable responses to common or complex questions, so users always get the same trusted insights.
- **Boost Copilot accuracy**: Help Copilot learn from effective responses and improve its understanding of user intent over time.

With verified answers, authors can shape Copilot's responses for key business questions, making it smarter, faster, and more aligned with user expectations.

When a user types a prompt in Copilot, it first checks for an exact or semantically similar match to any trigger phrase tied to a verified answer. If a match is found, Copilot returns the verified answer instead of generating a new response.

Because verified answers are model-level (not report-level), they work across any report that uses the same semantic model. For example, a verified answer tied to "Snowboard sales by month" will also trigger if a user asks, "How do snowboard sales change over time?"

Also, Copilot learns from how users interact with verified answers - gaining a better understanding of phrasing, synonyms, and data relationships to improve its future responses. Over time, Copilot's ability to understand and respond to prompts improves - even when phrased differently from original trigger phrases.

## Set a verified answer

> [!IMPORTANT]
> To set a verified answer on the semantic model, first ensure Q&A is enabled. Enable Q&A by selecting the **Prep data for AI** button and selecting **Turn on Q&A**.

To set a verified answer, follow these steps:

1. Select a visual:
   - **Power BI Desktop**: Select the visual you want to use as your verified answer. From the three-dot menu on the visual header, select **Set up a verified answer**.
   - **Power BI service**: Select a report in a Copilot-enabled workspace where you have authoring permission on the semantic model. Ensure you are in edit mode and that the desired visual is selected. From the three-dot menu on the visual header, select **Set up a verified answer**.

   > [!NOTE]
   > Any persistent filters (for example, Region = Northwest) applied to the visual at setup are saved as part of the verified answer. Slicers aren't currently supported.

1. Add trigger phrases using one of these two methods:
   - Add custom trigger phrases that reflect how users naturally ask about the data using the **+** or **Add** buttons. *or*
   - Use Copilot-generated suggestions based on the visual and existing trigger phrases by clicking on the phrases under **Copilot suggestions**.

   :::image type="content" source="media/copilot-prep-data/copilot-trigger-phrase.png" alt-text="Screenshot of setting trigger phrases for a verified answer in Power BI." lightbox="media/copilot-prep-data/copilot-trigger-phrase.png":::

1. Add filters for flexible slicing:
   1. Select the **filter** icon.
      - Verified answers support up to three filters that users can adjust using natural language in their prompt.
   1. Select **Available to users** and apply any desired filters.
      - This allows end users to slice and dice without needing a new verified answer for every visual + filter combination.

   The benefit of this filter experience is that you can use one centralized, base verified answer and allow end users to slice and dice without needing a new verified answer for every visual + filter combination.

   Example:

     - **Trigger phrase**: "Show me a breakdown of sales over time"
     - **User prompt**: "Sales breakdown over time for the Northeast"

   Copilot returns the verified answer visual, automatically filtered to match the user's prompt. From there, you can apply any available filters that you’d like.

   :::image type="content" source="media/copilot-prep-data/copilot-verified-answer-selected-filters.png" alt-text="Screenshot of selected filters applied to a verified answer in Power BI." lightbox="media/copilot-prep-data/copilot-verified-answer-selected-filters.png":::

     - **Supported filter types**: Report-level, Page-level, Visual-level.
     - **Filter limitations**:
       - Fields already used in the visual (for example, axis, legend) can’t also be filters.
       - Existing hardcoded values (for example, Region = North) can't be overridden.
       - User prompts can only invoke one filter on a verified answer at a time

   > [!NOTE]
   > To review existing filters that affect the visual, select **Applied to this visual** during setup.

1. Select **Apply** to save your changes to the model.

Copilot now uses the verified answers set on the model when users invoke a trigger phrase.

## Test verified answers

1. Open the Copilot pane in Power BI Desktop or the Power BI service.
1. If in Desktop, use the **skill picker** to select **Answer data question**.
1. Test the various trigger phrases you set up to ensure they work as intended.

   :::image type="content" source="media/copilot-prep-data/copilot-test-verified-answers.png" alt-text="Screenshot showing how to test verified answers in Power BI Copilot with trigger phrases." lightbox="media/copilot-prep-data/copilot-test-verified-answers.png":::

1. Publish or save your report.

Once testing is complete and you're satisfied with your verified answers, either publish your report from Desktop, or save if you’re in the Power BI service.

## Manage verified answers

To manage verified answers, including deleting and editing, follow these steps:

1. Select the **Prep data for AI** button to manage verified answers.
    - In Power BI Desktop, this button is on the **Home** ribbon.
    - In the Power BI service, it's on the **Semantic model** page ribbon.
1. Select the **Verified answers** tab to see the verified answers that are set on your semantic model.
1. Edit your verified answers. This includes adding or editing existing trigger phrases and filters. Delete unwanted verified answers using the **trash can** icon.
1. Select **Apply** to save your changes to the model.

Copilot now uses the verified answers set on the model when users invoke a trigger phrase.  

Once testing is complete and you're satisfied with your verified answers, either publish your report from Desktop or save if you’re in the Power BI service.

> [!NOTE]
> Each time you add, edit, or delete a verified answer, refresh the Copilot pane by closing and reopening it.

## Consume verified answers

Once your report is published, end users automatically benefit from verified answers anywhere that model is used with Copilot. When a user enters a prompt that matches a trigger phrase, Copilot returns the curated, human-approved visual response.

:::image type="content" source="media/copilot-prep-data/copilot-visual-response.png" alt-text="Screenshot of a visual response in Power BI Copilot showing a verified answer." lightbox="media/copilot-prep-data/copilot-visual-response.png":::

> [!NOTE]
> End users can't view or edit verified answers. Write permission to the model is required for this.

## Understand verified answers output in Copilot

When users interact with a verified answer, Copilot provides key visual indicators to build trust and clarity in the response:

- **Verified checkmark**: Indicates the response is human-reviewed and approved.
- **Matched trigger phrase**: Displays the specific phrase Copilot matched, whether exact or semantically similar. This helps users understand how their prompt was interpreted and gives them a starting point to adjust or refine their question if needed.
- **How Copilot arrived at this**: Offers insight into the underlying data and logic, including applied filters. This transparency helps users validate the answer and understand its context.

## Considerations and limitations

The following considerations and limitations apply to verified answers.

### Match types

When setting up trigger phrases for verified answers, keep in mind that user prompts can be matched in two ways: exact matches and semantically similar matches.

- **Exact matches**: Phrase matches character-for-character (for example, "Snowboard sales by month" when the trigger phrase is "snowboard sales by month").
- **Semantic matches**: Phrases with different wording but the same intent (for example, "Snowboard sales over time").

This flexibility means authors don’t need to predict every possible phrasing, just ensure representative triggers are included.

### Semantically similar phrases

Copilot uses semantic matching to trigger verified answers - meaning it can recognize prompts that are phrased differently but still align with the intent of a trigger phrase. Here’s what is and isn’t supported:

- **What works (supported)**:
  - Using synonyms that are commonly understood or defined within the semantic model
  - Rearranging the order of words or fields in the original trigger phrase
  - Including filter criteria directly in the prompt (for example, "for Northeast region")
- **What doesn’t work (not supported)**:
  - Adding, removing, or swapping out fields or dimensions
  - Modifying or replacing the original measure in the phrase

These guidelines can help ensure your verified answers are reliably triggered while preserving the integrity of the visual and its logic.

| Trigger phrase | Does match | Doesn't match|
|----------------|--------------|----------------|
|Snowboard sales by month | - Snowboard sales for November<br>- Snowboard sales over time<br>- What are the snowboard sales for October? | - Winter sports rates<br>- Why are people snowboarding?<br>- Ski bib sales by month |
| Visitor spending over time by island | - Visitor expenditures for all islands<br>- Spending over time for Maui<br>- What’s the average visitor spend by island? |- Visitor arrivals over time<br>- Visitor spending per person |
| Quarterly regional sales for all products | - Regional sales by quarter<br>- Sales across all products over time | - Quarterly sales by lead type<br>- Average weekly sales |

### Limitations

See [Prepare your data for AI](copilot-prepare-data-ai.md#considerations-and-limitations) for a comprehensive list.

- Any filters on the visual (visual, page, or report level) that are applied upon verified answer setup are applied to the data in the verified answer.
- Drill through filters not supported.
- Cross highlighting / cross filtering not supported.
- Slicers aren't included in verified answer states (slicers applied on the report don't persist in the verified answer).
- Verified answers don't work if fields in the verified answer are hidden in the model (there's no entry point on the visual).
- You must select the visual to enable the setup experience in the context menu (must be in a selected state).
- Verified answers don't work with visuals that contain report measures.
- Verified answers are stored as part of the semantic model, so are therefore presented as Copilot responses for any downstream items (reports) that use that model.
- Verified answer visuals aren't synced or attached to the visuals on the report page. Once a verified answer is set up, the visual on the report can be changed or deleted without impacting the verified answer.  
  - This means to edit an existing verified answer, you need to go through the AI setup dialog, not the visual entry point (that creates a new verified answer).
- Unsupported visual types
  - New card visual
  - Textbox visual
  - Data Q&A
  - AI visuals  
  - Key influencers
  - Narrative with Copilot
  - Smart narratives (old)
  - Decomposition tree
  - Any forecasting visual (R and Python)
  - Custom visuals
- Supported model types:
  - Import models
  - DQ models
  - Composite models (local)
- GIT edits (third-party tools) can't yet be synced in desktop experience, though updates appear in service.
- Report themes aren't yet supported in verified answers.
- Field parameters don't work with verified answers.
- In authoring scenarios, there's a chance that trigger phrases could invoke authoring Copilot skills such as DAX answers or page creation. This is something that might affect quality testing. Make sure to use the skill selector when testing and disable create page skills.
- We highly recommend five to seven trigger phrases per verified answer
- Verified answers support:
  - 250 verified answers per model
  - 15 trigger prompts Per verified answer
  - 500 character limit for trigger prompts
  - Visual size (same as report visuals limits)

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [AI data schema](copilot-prepare-data-ai-data-schema.md)
- [AI instructions](copilot-prepare-data-ai-instructions.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
