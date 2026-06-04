---
title: Prepare your data for AI - Verified answers
description: Prepare your data for AI in Power BI by using verified answers. Optimize the performance of Copilot, improve AI-driven insights, and enhance user interactions.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: 
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/28/2026
ms.update-cycle: 180-days
ai-usage: ai-assisted
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to learn how to prepare my data for AI by using features like AI data schemas to optimize the performance of Copilot, ensure accurate and verified answers, and enhance AI-driven insights and user interactions.
---

# Prepare your data for AI: Verified answers

Verified answers are human-approved, visual responses in Copilot that predefined phrases trigger. Each verified answer includes one or more trigger phrases, a visual, and optional associated filters.

> [!NOTE]
> You can author **Prep data for AI** features in both Power BI Desktop and the Power BI service. Users can consume these features anywhere Copilot in Power BI is available.

:::image type="content" source="media/copilot-prep-data/copilot-verified-answer.png" alt-text="Screenshot of a verified answer setup in Power BI that shows trigger phrases and filters." lightbox="media/copilot-prep-data/copilot-verified-answer.png":::

The semantic model stores verified answers, which ensures consistent and high-quality responses across all reports that use that model.

Use verified answers for two major reasons:

- **Improve consistency**: Provide curated, reliable responses to common or complex questions, so users always get the same trusted insights.
- **Boost Copilot accuracy**: Help Copilot learn from effective responses and improve its understanding of user intent over time.

By using verified answers, authors can shape Copilot responses to key business questions. Verified answers can help make Copilot smarter, faster, and more aligned with user expectations.

When a user types a prompt in Copilot, Copilot first checks for an exact or semantically similar match to any trigger phrase tied to a verified answer. If a match is found, Copilot returns the verified answer instead of generating a new response.

Because verified answers are model-level (not report-level), they work across any report that uses the same semantic model. For example, a verified answer tied to *snowboard sales by month* is also triggered if a user asks, "How do snowboard sales change over time?"

Copilot also learns from how users interact with verified answers. It gains a better understanding of phrasing, synonyms, and data relationships to improve its future responses. Over time, the ability of Copilot to understand and respond to prompts improves, even when users phrase questions differently from the original trigger phrases.

## Prerequisites

- Power BI Q&A is enabled on the semantic model. You can enable Q&A by selecting the **Prep data for AI** button, and then selecting **Turn on Q&A**.
- To author in the Power BI service, you need a Copilot-enabled workspace with authoring permission on the semantic model.

## Set a verified answer

To set a verified answer, follow these steps:

1. Select a visual:
   - **Power BI Desktop**: Select the visual that you want to use as your verified answer. From the three-dot menu on the visual header, select **Set up a verified answer**.
   - **Power BI service**: Select a report in a Copilot-enabled workspace where you have authoring permission on the semantic model. Ensure that you're in edit mode and that the desired visual is selected. From the three-dot menu on the visual header, select **Set up a verified answer**.

   > [!NOTE]
   > Any persistent filters (for example, *Region = Northwest*) that you apply to the visual at setup are saved as part of the verified answer. Slicers aren't currently supported.

1. Add trigger phrases by using one of these two methods:
   - Add custom trigger phrases that reflect how users naturally ask about the data by using the **+** or **Add** buttons.
   - Use Copilot-generated suggestions based on the visual and existing trigger phrases by selecting the phrases under **Copilot suggestions**.

   :::image type="content" source="media/copilot-prep-data/copilot-trigger-phrase.png" alt-text="Screenshot that shows how to set up trigger phrases for a verified answer in Power BI." lightbox="media/copilot-prep-data/copilot-trigger-phrase.png":::

1. Add filters for flexible slicing by selecting the **filter** icon.

   Verified answers support up to three filters that users can adjust by using natural language in their prompt.

1. Select **Available to users** and apply any desired filters.

   The **Available to users** filter section allows end users to slice and dice without needing a new verified answer for every visual and filter combination.

   Example:

   - **Trigger phrase**: "Show me a breakdown of sales over time"
   - **User prompt**: "Sales breakdown over time for the Northeast"

   Copilot returns the verified answer visual, automatically filtered to match the user's prompt. From there, you can apply any available filters.

   :::image type="content" source="media/copilot-prep-data/copilot-verified-answer-selected-filters.png" alt-text="Screenshot that shows selected filters applied to a verified answer in Power BI." lightbox="media/copilot-prep-data/copilot-verified-answer-selected-filters.png":::

   - **Supported filter types**:
     - Report-level, page-level, or visual-level.
     - All basic, categorical filters.
     - Advanced categorical filters: `startsWith`, `contains`, `>`, `<`, `>=`, and `<=`.
     - Date range filters like *between Jan 2024 and July 2025* or *before 3/4/2025*. Relative date filters, such as *YTD* (year to date), *last three months*, or *next five years* aren't supported.
     - Limit of 10 filter permutations per verified answer.
   - **Filter limitations**:
     - Existing hardcoded values like *Region = North* can't be overridden.

   If you want a filter to appear in the **Available to users** section, it must already exist in the report. It can exist at the visual, page, or report level. In addition, the filter can't have a specific value applied.

   For example:

   - If a region filter has no selection (or shows *All*), it appears under **Available to users**.
   - If the region filter is set to *Northwest*, it doesn't appear in **Available to users**. It shows under **Applied to this visual**.

   Slicers aren't carried over into verified answers and don't appear as filter options. Additionally, filters are eligible as they're set. For example, advanced filters carry over as advanced filters, and basic filters carry over as advanced filters. See the supported filter types listed earlier in this section.

   > [!NOTE]
   > To review existing filters that affect the visual, select **Applied to this visual** during setup.

1. Select **Apply** to save your changes to the model.

Copilot now uses the verified answers that you set on the model when users invoke a trigger phrase.

## Test verified answers

1. Open the Copilot pane in Power BI Desktop or the Power BI service.
1. If you're working in Desktop, use the **skill picker** to select **Answer data question**.
1. Test the various trigger phrases you set up to ensure they work as intended.

   :::image type="content" source="media/copilot-prep-data/copilot-test-verified-answers.png" alt-text="Screenshot that shows how to test verified answers with trigger phrases in Copilot in Power BI." lightbox="media/copilot-prep-data/copilot-test-verified-answers.png":::

1. Publish your report from Desktop, or save it if you're in the Power BI service.

## Manage verified answers

To manage verified answers, including editing and deleting, follow these steps:

1. Select the **Prep data for AI** button.
    - In Power BI Desktop, this button is on the **Home** ribbon.
    - In the Power BI service, it's on the **Semantic model** page ribbon.
1. Select the **Verified answers** tab to see the verified answers that are set on your semantic model.
1. Edit your verified answers. Editing includes adding or editing existing trigger phrases and filters. Delete unwanted verified answers by using the trash can icon.
1. Select **Apply** to save your changes to the model.

Copilot now uses the verified answers set on the model when users enter a Copilot prompt similar to a trigger phrase.

Either publish your report from Desktop, or save it if you're in the Power BI service.

> [!NOTE]
> Each time you add, edit, or delete a verified answer, refresh the Copilot pane by closing and reopening it, or clearing the chat history.

## Consume verified answers

After you publish your report, end users automatically benefit from verified answers anywhere the model is used with Copilot. When a user enters a prompt that matches a trigger phrase, Copilot returns the curated, human-approved visual response.

:::image type="content" source="media/copilot-prep-data/copilot-visual-response.png" alt-text="Screenshot that shows a visual response in Copilot in Power BI with a verified answer." lightbox="media/copilot-prep-data/copilot-visual-response.png":::

> [!NOTE]
> End users can't edit verified answers. Users need write permission on the model to perform edit actions.

## Understand verified answers output in Copilot

When users interact with a verified answer, Copilot provides key visual indicators to build trust and clarity in the response:

- **Verified checkmark**: Indicates the response is human-reviewed and approved.
- **Matched trigger phrase**: Displays the specific phrase that Copilot matched, whether it's exact or semantically similar. The phrase helps users understand how their prompt was interpreted and gives them a starting point to adjust or refine their question, if needed.
- **Textual answer**: Displays an AI summary of the data displayed in the verified answer for easy consumption.
- **How Copilot arrived at this**: Offers insight into the underlying data and logic, including applied filters. This transparency helps users validate the answer and understand its context.

## Considerations and limitations

The following considerations and limitations apply to verified answers.

### Trigger phrase match types

When you set up trigger phrases for verified answers, keep in mind that user prompts can match in two ways:

- **Exact matches**: Phrase matches character-for-character (for example, *Snowboard sales by month* when the trigger phrase is *snowboard sales by month*).
- **Semantic matches**: Phrases with different wording but the same intent (for example, *Snowboard sales over time*).

With this flexibility, authors don't need to predict every possible phrasing. They just need to ensure that representative triggers are included.

### Semantically similar trigger phrases

Copilot uses semantic matching to trigger verified answers. It can recognize prompts that are phrased differently but still align with the intent of a trigger phrase. Here's what *is* and *isn't* supported:

- **Supported**:
  - Using synonyms that are commonly understood or defined within the semantic model
  - Rearranging the order of words or fields in the original trigger phrase
  - Including filter criteria directly in the prompt (for example, "for Northeast region")
- **Not supported**:
  - Adding, removing, or swapping out fields or dimensions
  - Modifying or replacing the original measure in the phrase

These guidelines can help ensure that your verified answers are reliably triggered, while preserving the integrity of the visual and its logic.

- **Trigger phrase:** *Snowboard sales by month*
  - **Does match:** *Snowboard sales for November*, *Snowboard sales over time*, *What are the snowboard sales for October?*
  - **Doesn't match:** *Winter sports rates*, *Why are people snowboarding?*, *Ski bib sales by month*
- **Trigger phrase:** *Visitor spending over time by island*
  - **Does match:** *Visitor expenditures for all islands*, *Spending over time for Maui*, *What's the average visitor spend by island?*
  - **Doesn't match:** *Visitor arrivals over time*, *Visitor spending per person*
- **Trigger phrase:** *Quarterly regional sales for all products*
  - **Does match:** *Regional sales by quarter*, *Sales across all products over time*
  - **Doesn't match:** *Quarterly sales by lead type*, *Average weekly sales*

### General limitations

- Git integration isn't supported.
- Any slicers or filters (visual, page, or report level) that you apply upon verified answer setup are inherited into the verified answer and can't be overwritten.
- Row-level security (RLS) and object-level security (OLS) aren't fully supported as security features for verified answers. In most cases, if a verified answer contains data protected by RLS or OLS, the system doesn't match on or return it to users. This practice prevents broken visuals from appearing. In these situations, Copilot responds without the verified answer. However, there are scenarios where data might still be exposed (for example, through the file format in Git). During preview, don't rely on this functionality as a security feature, even though it functions correctly in most cases.
- You can set up only 10 filter permutations per verified answer.
- Verified answers don't work if you hide fields in the model.
- Verified answers don't work with visuals that contain report measures.
- Verified answers are stored as part of the semantic model, so they're presented as Copilot responses for any downstream items (reports) that use that model.
- Verified answer visuals aren't synced or attached to the visuals on the report page. When you set up a verified answer, you can change or delete the visual on the report without affecting the verified answer. To edit an existing verified answer, you need to go through the AI setup dialog, not the visual entry point, because that process creates a new verified answer.
- Report themes aren't yet supported in verified answers.
- In authoring scenarios, trigger phrases might invoke authoring Copilot skills such as Data Analysis Expressions (DAX) answers or page creation, which might affect quality testing. Make sure to use the skill selector when you test in Desktop and disable **create page** skills.
- Aim for five to seven trigger phrases per verified answer.

Unsupported visual types include:

- Textbox visuals.
- Data Q&A.
- AI visuals.
- Key influencers.
- Narrative with Copilot.
- Smart narratives (old).
- Decomposition tree.
- Any forecasting visual (R and Python).
- Custom visuals.

Supported model types include:

- Import models.
- DirectQuery models.
- Composite models (local).
- Direct Lake models (web only).

Verified answers support:

- 250 verified answers per model.
- 15 trigger prompts per verified answer.
- A 500-character limit for trigger prompts.
- 10 filter permutations per verified answer.
- A visual size that's the same as report visuals limits.

For a comprehensive list of considerations and limitations, see [Prepare your data for AI](copilot-prepare-data-ai.md#considerations-and-limitations).

## Troubleshooting and FAQs for verified answers

### I don't see the set up verified answer entry point on my visual

- **Is your visual type supported for verified answers?** Not all visual types support verified answers yet. See the list of [unsupported visual types](#general-limitations).
- **Is your model type supported for Prep data for AI?** The model type you're using might not be supported, so prep data entry points aren't visible. See the list of [supported model types](#general-limitations).

### I edited the report visual, but my verified answer didn't update

Verified answers are part of the semantic model, not the report. When you edit the visual used to create a verified answer, it doesn't affect the verified answer. To modify a verified answer, use the management dialog in the **Verified answers** section of **Prep data for AI**, where you can update trigger phrases and add or remove filters. For any other changes, delete the existing verified answer and create a new one by using the updated visual. Editing capabilities are coming.

### I can't get my verified answer to return in Copilot

- **Did you create it in Desktop?**

  - **Did you use the skill picker?** If you created verified answers in Desktop and are also testing in Desktop, make sure to use the skill picker. The skill picker is an experience where you can deselect **create page** skills to mimic what end users see. It can help return verified answers rather than creating new pages with your requests.
  - **Did you already publish to the service?** If you created your verified answers in desktop and then published to the service, and you still can't see them, it might be because of a delay. There's an update delay from the time of publish to when verified answers show up in the standalone Copilot experience, or even in reports. Changes usually take about 15 minutes to appear.

    To speed up the update, you can also publish your report to the service, and then make any small change in the service editing dialog. For example, you can add a space to a trigger prompt or remove and re-add a trigger prompt. Any small change works. Save the changes and test again to see if you get verified answers. They should now return.

- **Did you create it in the service, or are you expecting to see verified answers in the service?** If you waited the 15 minutes or made changes in the service but they're *still* not returned, there might be other factors. Try the following workarounds:
  - **Is the verified answer using any hidden fields?** If a field that's used in a verified answer is hidden in the model, it isn't returned as a verified answer. Ensure that all fields are visible in the model. (This limitation includes filters.)
  - **Are all filter fields selected in the schema selection UI?** Filters (whether applied or not) become part of the verified answer definition. If even parts of filter information are hidden with schema selection, the verified answer might not be reliably returned. Ensure that all filter fields are unhidden in the schema selection.
  - **Are there conflicting custom instructions?** For example, if you have a custom instruction that says "Always apply filter Region = 'USA'" on every answer, but you didn't set up a **Region** column as an allowed filter in your verified answer, then Copilot doesn't match the verified answer.
  - **Is your Copilot prompt similar enough to your trigger prompts?** Copilot matches user prompts by exact match (character-for-character) or semantic similarity (different wording, same intent). For details on what's supported and examples of matching behavior, see [Trigger phrase match types](#trigger-phrase-match-types) and [Semantically similar trigger phrases](#semantically-similar-trigger-phrases).

### Why can't I add filters to my verified answer?

Filters appear as available options for verified answers only if all of the following conditions are met:

- They exist on the visual, page, or report. If the filter isn't present in the report, you can't apply it.
- They're unlocked and visible. The filters that show up are those that end users can interact with. Locked or hidden filters are excluded from the list.
- They don't have applied values. Filters must be set to *All* in the report to be available in the verified answer experience. (If a filter is missing, check the **applied to this visual** section in the UI. If it appears there, it's not eligible until its values are cleared in the report.)
- They're a supported filter type. Supported types include:
  - All basic, categorical filters.
  - The following advanced categorical filters: `startsWith`, `contains`, `=`, `/=`, `>`, `<`, `>=`, and `<=`.
  - Date range filters like *between January 2024 and July 2025* or *before 3/4/2025*. Relative date filters such as *YTD* (year to date), *last three months*, or *next five years* aren't supported.
- You don't select more than three filters. Verified answers support a maximum of three filters during creation, and three at a time in consumption.

### Why won't my verified answer filter the way that I want in the Copilot pane?

- **Is the filter included in the verified answer?** The author must explicitly add filters when they create the verified answer. If the filter you're trying to use isn't added to the verified answer, it doesn't work in Copilot. Double check that it's part of the verified answer configuration.
- **Are the filter fields visible in the model and schema selection?** Even if a filter is applied, it doesn't function properly if any part of it is hidden. Filters are embedded in the verified answer definition, so ensure that all related fields are unhidden in both the schema selection and the data model. Hidden fields can prevent filters from working as expected.
- **Is it actually filtered?** Check the **How Copilot arrived at this** section and see what (if any) filters are applied. The "matched on" trigger phrase doesn't update to show the filter, but the data in the verified answer *does*, so it can sometimes be hard to tell.

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [AI data schemas](copilot-prepare-data-ai-data-schema.md)
- [AI instructions](copilot-prepare-data-ai-instructions.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
