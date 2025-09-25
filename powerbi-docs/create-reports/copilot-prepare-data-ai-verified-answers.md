---
title: Prepare your data for AI - Verified answers
description: Learn how to prepare your data for AI in Power BI by using verified answers. You can optimize Copilot's performance, improve AI-driven insights, and enhance user interactions.
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
#customer intent: As a Power BI user, I want to learn how to prepare my data for AI by using features like AI data schemas to optimize Copilot's performance, ensure accurate and verified answers, and enhance AI-driven insights and user interactions.
---

# Prepare your data for AI - Verified answers

> [!NOTE]
> You can't *author* **Prep data for AI** features in either the Power BI service or Power BI Desktop. Users can *consume* these features everywhere that Copilot exists.

Verified answers are human-approved, visual responses in Copilot that are triggered by predefined phrases. Each verified answer includes one or more trigger phrases, a visual, and optional associated filters.

:::image type="content" source="media/copilot-prep-data/copilot-verified-answer.png" alt-text="Screenshot of a verified answer setup in Power BI that shows trigger phrases and filters." lightbox="media/copilot-prep-data/copilot-verified-answer.png":::

Verified answers are stored in the semantic model, which ensures consistent and high-quality responses across all reports that use that model.

There are two major reasons to use verified answers:

- **Improve consistency**: Provide curated, reliable responses to common or complex questions, so users always get the same trusted insights.
- **Boost Copilot accuracy**: Help Copilot learn from effective responses and improve its understanding of user intent over time.

With verified answers, authors can shape Copilot's responses to key business questions, which makes Copilot smarter, faster, and more aligned with user expectations.

When a user types a prompt in Copilot, it first checks for an exact or semantically similar match to any trigger phrase tied to a verified answer. If a match is found, Copilot returns the verified answer instead of generating a new response.

Because verified answers are model-level (not report-level), they work across any report that uses the same semantic model. For example, a verified answer tied to *snowboard sales by month* is also triggered if a user asks, "How do snowboard sales change over time?"

Also, Copilot learns from how users interact with verified answers and gains a better understanding of phrasing, synonyms, and data relationships to improve its future responses. Over time, Copilot's ability to understand and respond to prompts improves, even when users phrase questions differently from the original trigger phrases.

## Set a verified answer

> [!IMPORTANT]
> To set a verified answer on the semantic model, first ensure that Power BI Q&A is enabled. You can enable Q&A by selecting the **Prep data for AI** button, and then selecting **Turn on Q&A**.

To set a verified answer, follow these steps:

1. Select a visual:
   - **Power BI Desktop**: Select the visual that you want to use as your verified answer. From the **...** menu on the visual header, select **Set up a verified answer**.
   - **Power BI service**: Select a report in a Copilot-enabled workspace where you have authoring permission on the semantic model. Ensure that you're in edit mode and that the desired visual is selected. From the **...** menu on the visual header, select **Set up a verified answer**.

   > [!NOTE]
   > Any persistent filters (for example, Region = Northwest) that are applied to the visual at setup are saved as part of the verified answer. Slicers aren't currently supported.

1. Add trigger phrases by using one of these two methods:
   - Add custom trigger phrases that reflect how users naturally ask about the data by using the **+** or **Add** buttons.
   - Use Copilot-generated suggestions based on the visual and existing trigger phrases by clicking on the phrases under **Copilot suggestions**.

   :::image type="content" source="media/copilot-prep-data/copilot-trigger-phrase.png" alt-text="Screenshot that shows how to set up trigger phrases for a verified answer in Power BI." lightbox="media/copilot-prep-data/copilot-trigger-phrase.png":::

1. Add filters for flexible slicing:
   1. Select the **filter** icon.
      - Verified answers support up to 10 filters that users can adjust by using natural language in their prompt.
   1. Select **Available to users** and apply any desired filters.
      - The **Available to users** filter section allows end users to slice and dice without needing a new verified answer for every visual and filter combination.

   Example:

     - **Trigger phrase**: "Show me a breakdown of sales over time"
     - **User prompt**: "Sales breakdown over time for the Northeast"

   Copilot returns the verified answer visual, automatically filtered to match the user's prompt. From there, you can apply any available filters that you’d like.

   :::image type="content" source="media/copilot-prep-data/copilot-verified-answer-selected-filters.png" alt-text="Screenshot that shows selected filters applied to a verified answer in Power BI." lightbox="media/copilot-prep-data/copilot-verified-answer-selected-filters.png":::

     - **Supported filter types**:
       - Report-level, page-level, or visual-level.
       - All basic, categorical filters.
       - Advanced categorical filters: `startsWith`, `contains`, `>`, `<`, `>=`, and `<=`.
       - Date range filters like *between Jan 2024 and July 2025* or *before 3/4/2025*. Relative date filters, such as *YTD* (year to date), *last three months*, or *next five years* aren't supported.
     - **Filter limitations**:
       - Existing hardcoded values like *Region = North* can't be overridden.
       - User prompts can only invoke three filters on a verified answer at a time.

If you want a filter to appear in the **Available to users** section, it must already exist in the report. It can exist at the visual, page, or report level. In addition, the filter can't have a specific value applied.

For example:

- If a region filter has no selection (or shows *All*), it appears under **Available to users**.
- If the region filter is set to *Northwest*, it doesn't appear in **Available to users**. It shows under **Applied to this visual**.

Note: Slicers aren't carried over into verified answers and don't appear as filter options. Additionally, filters are eligible as they're set. For example, advanced filters carry over as advanced filters, and basic filters carry over as advanced filters. Reference the supported filter types mentioned previously in this article.

   > [!NOTE]
   > To review existing filters that affect the visual, select **Applied to this visual** during setup.

1. Select **Apply** to save your changes to the model.

Copilot now uses the verified answers that you set on the model when users invoke a trigger phrase.

## Test verified answers

1. Open the Copilot pane in Power BI Desktop or the Power BI service.
1. If you're working in Desktop, use the **skill picker** to select **Answer data question**.
1. Test the various trigger phrases you set up to ensure they work as intended.

   :::image type="content" source="media/copilot-prep-data/copilot-test-verified-answers.png" alt-text="Screenshot that shows how to test verified answers with trigger phrases in Power BI Copilot." lightbox="media/copilot-prep-data/copilot-test-verified-answers.png":::

1. Publish or save your report.

After you test and your verified answers are working, you can either publish your report from Desktop, or save it if you’re in the Power BI service.

## Manage verified answers

To manage verified answers, including deleting and editing, follow these steps:

1. Select the **Prep data for AI** button.
    - In Power BI Desktop, this button is on the **Home** ribbon.
    - In the Power BI service, it's on the **Semantic model** page ribbon.
1. Select the **Verified answers** tab to see the verified answers that are set on your semantic model.
1. Edit your verified answers. Editing includes adding or editing existing trigger phrases and filters. Delete unwanted verified answers by using the trash can icon.
1. Select **Apply** to save your changes to the model.

Copilot now uses the verified answers set on the model when users invoke a trigger phrase.  

After you test and your verified answers are working, you can either publish your report from Desktop, or save it if you’re in the Power BI service.

> [!NOTE]
> Each time you add, edit, or delete a verified answer, refresh the Copilot pane by closing and reopening it.

## Consume verified answers

After your report is published, end users automatically benefit from verified answers anywhere that model is used with Copilot. When a user enters a prompt that matches a trigger phrase, Copilot returns the curated, human-approved visual response.

:::image type="content" source="media/copilot-prep-data/copilot-visual-response.png" alt-text="Screenshot that shows a visual response in Power BI Copilot with a verified answer." lightbox="media/copilot-prep-data/copilot-visual-response.png":::

> [!NOTE]
> End users edit verified answers. Users need write permission for the model to perform edit actions.

## Understand verified answers output in Copilot

When users interact with a verified answer, Copilot provides key visual indicators to build trust and clarity in the response:

- **Verified checkmark**: Indicates the response is human-reviewed and approved.
- **Matched trigger phrase**: Displays the specific phrase that Copilot matched, whether it's exact or semantically similar. The phrase helps users understand how their prompt was interpreted and gives them a starting point to adjust or refine their question, if needed.
- **How Copilot arrived at this**: Offers insight into the underlying data and logic, including applied filters. This transparency helps users validate the answer and understand its context.

## Considerations and limitations

The following considerations and limitations apply to verified answers.

### Match types

When you set up trigger phrases for verified answers, keep in mind that user prompts can be matched in two ways: exact matches and semantically similar matches.

- **Exact matches**: Phrase matches character-for-character (for example, *Snowboard sales by month* when the trigger phrase is *snowboard sales by month*).
- **Semantic matches**: Phrases with different wording but the same intent (for example, *Snowboard sales over time*).

With this flexibility, authors don't need to predict every possible phrasing. They just need to ensure that representative triggers are included.

### Semantically similar phrases

Copilot uses semantic matching to trigger verified answers, which means that it can recognize prompts that are phrased differently but still align with the intent of a trigger phrase. Here's what *is* and *isn't* supported:

- **Supported**:
  - Using synonyms that are commonly understood or defined within the semantic model
  - Rearranging the order of words or fields in the original trigger phrase
  - Including filter criteria directly in the prompt (for example, "for Northeast region")
- **Not supported**:
  - Adding, removing, or swapping out fields or dimensions
  - Modifying or replacing the original measure in the phrase

These guidelines can help make sure that your verified answers are reliably triggered, while preserving the integrity of the visual and its logic.

| Trigger phrase | Does match | Doesn't match|
|----------------|--------------|----------------|
|Snowboard sales by month | - Snowboard sales for November<br>- Snowboard sales over time<br>- What are the snowboard sales for October? | - Winter sports rates<br>- Why are people snowboarding?<br>- Ski bib sales by month |
| Visitor spending over time by island | - Visitor expenditures for all islands<br>- Spending over time for Maui<br>- What’s the average visitor spend by island? |- Visitor arrivals over time<br>- Visitor spending per person |
| Quarterly regional sales for all products | - Regional sales by quarter<br>- Sales across all products over time | - Quarterly sales by lead type<br>- Average weekly sales |

### Limitations

Here are some things that you need to know:

- Git integration isn't supported.
- Any filters on the visual (visual, page, or report level) that are applied upon verified answer setup are applied to the data in the verified answer.
- Drill-through filters aren't supported.
- RLS and OLS are not fully supported as security features for verified answers. In most cases, if a verified answer contains data protected by RLS or OLS, it isn't matched on or returned to users. This prevents broken visuals from appearing. In these situations, Copilot will respond without the verified answer. However, there are scenarios where data may still be exposed (for example, through the file format in GIT). Please note that during preview, we don't recommend that you considered this a reliable security feature, even though it will function correctly in the majority of cases.
- Cross highlighting and cross filtering aren't supported.
- Slicers aren't included in verified answer states. Slicers that are applied on the report don't persist in the verified answer.
- Verified answers don't work if fields in the verified answer are hidden in the model, because there's no entry point on the visual.
- You must select the visual to enable the setup experience in the context menu (must be in a selected state).
- Verified answers don't work with visuals that contain report measures.
- Verified answers are stored as part of the semantic model, so they're presented as Copilot responses for any downstream items (reports) that use that model.
- Verified answer visuals aren't synced or attached to the visuals on the report page. When a verified answer is set up, the visual on the report can be changed or deleted without impacting the verified answer.  
  - To edit an existing verified answer, you need to go through the AI setup dialog, not the visual entry point, because that creates a new verified answer.
- Unsupported visual types include:
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
  - DirectQuery models
  - Composite models (local)
  - Direct Lake (web only)
- Git edits (third-party tools) can't yet be synced in desktop experience, though updates appear in service.
- Report themes aren't yet supported in verified answers.
- Field parameters don't work with verified answers.
- In authoring scenarios, trigger phrases might invoke authoring Copilot skills such as DAX answers or page creation, which might affect quality testing. Make sure to use the skill selector when testing in desktop and disable create page skills.
- We highly recommend five to seven trigger phrases per verified answer

Unsupported visual types include:

- New card visuals.
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
- Direct Lake models in web only (only for verified answers).

Verified answers support:

- 250 verified answers per model.
- 15 trigger prompts per verified answer.
- 500 character limit for trigger prompts.
- Visual size (same as report visuals limits).

For a comprehensive list of considerations and limitations, see [Prepare your data for AI](copilot-prepare-data-ai.md#considerations-and-limitations).

### Verified answers troubleshooting and FAQs

**I don’t see the set up verified answer entry point on my visual.**

- **Is your visual type supported for verified answers?** Not all visual types can be made into verified answers yet. See the list of unsupported visual types in the previous section.
- **Is your model type supported for Prep data for AI?** The model type you're using might not be supported, so prep data entry points aren't visible. See the list of supported model types for verified answers in the previous section.

**I edited the report visual, but my verified answer didn't update.**

Verified answers are part of the semantic model, not the report. When you edit the visual used to create a verified answer, it doesn't affect the verified answer. To modify a verified answer, use the management dialog in the **Verified Answers** section of **Prep data for AI**, where you can update trigger phrases and add or remove filters. For any other changes, delete the existing verified answer and create a new one by using the updated visual. Editing capabilities are coming.

**I can't get my verified answer to return in Copilot.**

- **Did you create in desktop?**

     - **Have you used the skill picker?**

    If you created verified answers in desktop and are also testing in desktop, make sure to use the skill picker. The skill picker is an experience where you can deselect **create page** skills to mimic what end users see. It can help return verified answers rather than creating new pages with your requests.
     - **Have you already published to service?**
    If you created your verified answers in desktop, then published to the service and still can't see them, it might be because of a delay. There's an update delay from the time of publish to when verified answers show up in the standalone Copilot experience, or even in reports. Usually, the changes take about 15 minutes to update. Then you're able to see verified answers. 

    To speed up the update, you can also publish your report to the service, and then make any small change in the service editing dialog. For example, you can add a space to a trigger prompt or remove and re-add a trigger prompt. Any small change works. Save the changes and test again to see if you get verified answers. They should now return.
    
- **Did you create in service, or are expecting to see verified answers in service?** If you waited the 15 minutes or made changes in service but they're *still* not returned, there might be other aspects at play, and different workarounds that you might try.
     - **Is the verified answer using any hidden fields?** If a field that's used in a verified answer is hidden in the model, it's not returned as a verified answer. Ensure all fields are visible in the model. (This limitation includes filters.)
     - **Are filters being used?** Are all filter fields selected in the schema selection UI? Filters (whether applied or not) become part of the verified answer definition. If even parts of filter information are hidden with schema selection, the verified answer might not be reliably returned. Ensure all that filter fields are unhidden in the schema selection.
     - **Are there conflicting custom instructions?** For example, if you have a custom instruction that says, "Always apply filter Region = 'USA'" on every answer, but you didn't set up a **Region** column as an allowed filter in your Verified Answer, then copilot doesn't match the verified answer.
     - **Is your Copilot prompt similar enough to your trigger prompts?** There are two ways Copilot matches user prompts to a verified answer.
       **Exact matches:** Phrase matches character-for-character (for example, *Snowboard sales by month* when the trigger phrase is *snowboard sales by month*).
       **Semantic matches:** Phrases with different wording but the same intent (for example, *Snowboard sales over time*).

    For semantically similar phrases, Copilot uses semantic matching to trigger verified answers. It can recognize prompts that are phrased differently but still align with the intent of a trigger phrase. However, there's still nuance to how much you can change and still be recognized as a match. Here's some information about what's supported:

    - **Supported**:
      - Using synonyms that are commonly understood or defined within the semantic model
      - Rearranging the order of words or fields in the original trigger phrase
      - Including filter criteria directly in the prompt (for example, "for Northeast region")
    - **Not supported**:
      - Adding, removing, or swapping out fields or dimensions
      - Modifying or replacing the original measure in the phrase

**I can't get filters to work with my verified answer**

Filters can be tricky. Here are some common questions:

- **Why can't I add filters to my verified answer?** Filters only appear as available options for verified answers if all of the following conditions are met:
- They exist on the visual, page, or report: If the filter isn’t present in the report, it isn't available to apply.
- They're unlocked and visible: The filters that show up are those that end users can interact with. Locked or hidden filters are excluded from the list.
- They have no applied values: Filters must be set to *All* in the report to be available in the verified answer experience. (Tip: If a filter is missing, check the **applied to this visual** section in the UI. If it appears there, it's not eligible until its values are cleared in the report.)
- They're a supported filter types:
  - All basic, categorical filters.
  - The following advanced categorical filters: `startsWith`, `contains`, `=`, `/=`, `>`, `<`, `>=`, and `<=`.
  - Date range filters like *between January 2024 and July 2025* or *before 3/4/2025*. Relative date filters, such as *YTD* (year to date), *last three months*, or *next five years* aren't supported.
- There are no more than 10 filters already selected: Verified answers support a maximum of 10 filters during creation, and three at a time in consumption.

**Why won't my verified answer filter the way that I want in the Copilot pane?**
- **Is the filter included in the verified answer?** The author must explicitly add filters when they create the verified answer. If the filter you're trying to use isn't added to the verified answer, it doesn't work in Copilot. Double check that it's part of the verified answer configuration.
- **Are the filter fields visible in the model and schema selection?** Even if a filter is applied, it doesn't function properly if any part of it is hidden. Filters are embedded in the verified answer definition, so make sure all related fields are unhidden in both the schema selection and the data model. Hidden fields can prevent filters from working as expected.
- **Is it actually filtered?** Check the **How Copilot arrived at this** section and see what (if any) filters are applied. The "matched on" trigger phrase doesn't update to show the filter, but the data in the verified answer *does*, so it can sometimes be hard to tell.

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [AI data schemas](copilot-prepare-data-ai-data-schema.md)
- [AI instructions](copilot-prepare-data-ai-instructions.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
