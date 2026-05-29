---
title: Prepare your data for AI - AI instructions
description: Prepare your data for AI in Power BI with AI instructions. Learn how to optimize your semantic model for Copilot and enhance AI-driven insights.
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
#customer intent: As a Power BI user, I want to understand how to prepare my data for AI to optimize the performance of Copilot, improve AI-driven insights, and enhance user interactions by leveraging AI instructions.
---

# Prepare your data for AI: AI instructions

AI instructions allow semantic model authors to provide context, business logic, and specific guidance directly on a semantic model. Copilot uses these instructions to better interpret user questions by incorporating organizational language, terminology, and analytical priorities. This article walks you through the steps to set up and test AI instructions to prepare your data for AI-powered analysis.

AI instructions help clarify business terms, guide analysis approaches, and reduce ambiguity. They improve the quality and relevance of Copilot responses, leading to more meaningful insights and a smoother experience across reports that use the same model.

## Prerequisites

- A Power BI semantic model in Power BI Desktop or the Power BI service.
- [Copilot enabled](copilot-introduction.md) for your organization.
- Power BI Q&A enabled for the model. You can enable Q&A during setup if it isn't already on.

## Set up AI instructions

> [!NOTE]
> You can author **Prep data for AI** features in both Power BI Desktop and the Power BI service. Users can consume these features anywhere Copilot in Power BI is available.

1. Select the **Prep data for AI** button located on the **Home** ribbon in Power BI Desktop, or on the ribbon on the selected semantic model in the Power BI service.  

   :::image type="content" source="media/copilot-prep-data/copilot-prep-data-ai.png" alt-text="Screenshot that shows the Prep Data for AI feature in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-prep-data-ai.png":::

   If the tabs in **Prep data for AI** are disabled, enable Power BI Q&A for your model.  

   :::image type="content" source="media/copilot-prep-data/copilot-turn-on-qa.png" alt-text="Screenshot that shows how to enable Q&A for the model in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-turn-on-qa.png":::

1. In the dialog, go to the **Add AI instructions** tab.  
1. Provide instructions about the semantic model that help Copilot understand your business, terminology, and how to prioritize the data in the model.

   :::image type="content" source="media/copilot-prep-data/copilot-ai-instructions.png" alt-text="Screenshot that shows a dialog that features the AI instructions tab in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-ai-instructions.png":::

1. Select **Apply**.  

After you close the dialog, your changes are saved to your model. Copilot now uses the AI instructions.  

## Test AI instructions in Power BI Desktop

1. Open the **Copilot** pane in Power BI Desktop.
1. Use the **skill picker** to select the specific Copilot capability you want to test. For best results, choose **Answers questions about the data**.  
1. Use one of the instructions that you set, and interact with Copilot.  
1. Ensure that Copilot responds accurately.  
1. If you need to change the instructions, reopen the **Prep data for AI** dialog and adjust them.  
1. When you're satisfied with the AI instructions, publish your report to the Power BI service or save it in Power BI Desktop.  

> [!NOTE]
> Each time you edit an instruction in the **Prep data for AI** dialog, you need to refresh the Copilot pane by closing and reopening it.  

## AI instructions after publishing  

After your report is published to the Power BI service, or changes are saved in the service, users benefit from the AI instructions in every Copilot experience that uses the semantic model.  

> [!NOTE]
> End users can't see the AI instructions set on the model.  

## Common use cases for AI instructions  

AI instructions offer a flexible way to enhance how Copilot interprets and responds to user prompts. Two common use cases are general business context and data interpretation, and analysis rules.

### General business context and data interpretation

Instructions can help Copilot frame responses within the context of your business, tailoring answers based on your industry, strategic goals, terminology, or operational logic. When you use instructions, you can help ensure that users get more accurate and relevant insights. Some examples include:

- Busy season is October to February.  
- Frame insights with a focus on risk assessment and market trends.  
- When a user mentions *ABCD*, they're referring to the **total invoice** field.  
- A lower attrition percent is more positive.

### Analysis rules

You can guide Copilot on how to approach certain types of analysis by providing rules and preferences for how data should be sliced or prioritized. Some examples include:

- Always analyze sales on a quarterly basis.  
- When showcasing revenue, break it down by quarter and compare it to the `industry` field.  
- For retail insights, prioritize the `customsegmentationtable` and `saleschannel` tables.  
- Use the `sales_fact` table as the primary source for all sales-related questions.  
- When a user asks about product sales, always ask for clarification on location.  

## Write effective prompts for AI instructions  

AI instructions are prompt-based, so prompt engineering best practices apply when you write them for a semantic model. Prompt construction directly affects Copilot outputs. The following tips help you get the most out of AI instructions.

### Be explicit and specific

Assume Copilot has no understanding of how to use the data model or business context for your data. For example, instead of writing "You're a seasoned BI Analyst who is detail-oriented," consider: "You're a seasoned BI Analyst who works for a big food distributor. Responses should be detail-oriented and focused on revenue and profitability."  

### Use analogies and descriptive language

Analogies, descriptive language, and examples help Copilot understand your desired outcome and intended meaning. For example, for product-specific sales, use the measure `Total_Sales_Product` (example of product: Word, PowerPoint, Excel, SharePoint, Teams).  

### Avoid ambiguity

Be clear about anything that you want Copilot to emphasize or avoid. The more details and supporting content you can provide Copilot, the better. For example, for `Total Active Partners`, use the measure `Monthly Active Partner Count`. (Don't filter on the **Customers** table.)  

### Group related instructions

To help Copilot better understand your intent, organize instructions by theme or purpose (such as date logic, key metrics, and industry terms). Include structural elements, such as sections, hierarchies, and headers. For an example of how to group related instructions in the full set of instructions, see the [example scenario](#example-scenario-product-sales-semantic-model).

### Instruction order

The order in which you author instructions can affect the output. You can boost your chances of getting correct outputs by testing different variations, orders, examples, and wording.

### Break down complex instructions into simpler steps

Break down instructions into simple steps to improve clarity and reduce errors. For example, define *top customers* by first looking at the revenue table and then returning only the customers with the highest order values.  

### Keep instructions focused

Depending on the semantic model, fewer focused instructions can be more effective than many broad ones. Conflicts and complexity can cause confusion for large language models (LLMs).  

## Example scenario: product sales semantic model

The following example shows a set of AI instructions that are prompt-engineered for a product sales semantic model.

### Instructions for answering data questions

Gross product sales (GPS) should reference the `grossrevenue` field in the **Revenue** table.

*Top sellers* refers to the top three partners with the highest revenue. Don't show customers unless the user explicitly asks.

#### Customer identification

- `accountid` refers to customers in the **Revenue** table.
- `earningsid` refers to customers in the **Partners** table.
- `customid` in the order table doesn't refer to customers.
- Define *top customers* by first looking at the revenue table and then returning only the customers with the highest order values.
- Some partners are also customers. Don't remove these duplicates. Instead, indicate whether it's a partner or a customer based on the ID value.

#### Product metrics

- Filter data by `State= Washington` or `State= California` unless the user specifically asks for a different state.  
- For product-specific sales, use the measure `Total_Sales_Product` (example of product: Word, PowerPoint, Excel, SharePoint, or Teams). Filter on the **Product** column from the **Sales** table.
- For `Total Active Partners`, use the measure `Monthly Active Partner Count_ID`. (Don't filter on the **Customers** table.)
- Food product sales are always from retail stores.
  
  If the value `product_type` in the **Product** table is `Food`, then *always* show the store where the item was sold. Store information is found in the **Store** table with the field `store_name`, and it can be linked to `product_type` by `store_id`.

> [!NOTE]
> You often need to iterate to get the most benefit from AI instructions. As you experiment and observe how Copilot responds, you develop a better understanding of what types of instructions drive the best outcomes for your model and your users.  

## Considerations and limitations  

- Because AI instructions are unstructured guidance to Copilot, the LLM only interprets them. There's no guarantee that the LLM will exactly follow instructions.
- AI instructions affect Copilot capabilities but don't extend to general conversations with Copilot.  
- AI instructions are saved at the semantic model level. Instructions can't currently be stored at the report level.  
- AI instructions aren't expected to be persona-specific or modify non-data-related outputs for the end user.
- AI instructions can't disable other Copilot in Power BI features or prevent/prioritize certain features from being called.
- Instructions aren't intended to work with visual modifications or theming in your report.  
- Currently, you can't upload instructions to the dialog in Power BI Desktop.  
- To test instructions in Power BI Desktop, you need to close and reopen your Copilot pane to see new instructions applied.  
- Users can't set instructions by category or by mode (view or edit) in Copilot in Power BI.  
- Consumers can't see what instructions an author applied to the model in the UI.  
- End users can't disable instructions on a semantic model.  
- AI instructions might not be respected in Power BI Desktop when you're trying to create a page, get suggested report page topics, or a semantic model summary with Copilot. To work around this issue, use the skill picker and select only **Create new report pages** to have instructions successfully apply.
- AI instructions are limited to 10,000 characters.

For a comprehensive list of considerations and limitations, see [Prepare your data for AI](copilot-prepare-data-ai.md#considerations-and-limitations).

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [AI data schemas](copilot-prepare-data-ai-data-schema.md)
- [Verified answers](copilot-prepare-data-ai-verified-answers.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
