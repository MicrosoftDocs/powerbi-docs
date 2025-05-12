---
title: Prepare your data for AI - AI instructions
description: Prepare your data for AI in Power BI with new features like AI data schema, verified answers, and AI instructions. Learn how to optimize your semantic model for Copilot and enhance AI-driven insights.
author: julcsc
ms.author: juliacawthra
ms.reviewer: 
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/12/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to understand how to prepare my data for AI to optimize Copilot's performance, improve AI-driven insights, and enhance user interactions by leveraging new features like AI data schema, verified answers, and AI instructions.
---

# Prepare your data for AI - AI instructions

Preparing your data for AI in Power BI involves optimizing your semantic model to enhance Copilot's performance. Features like AI instructions let you give context and guidance that improve the relevance and accuracy of AI-driven insights. This guide walks you through the steps to set up and test AI instructions, ensuring your data is ready for AI-powered analysis.
AI Instructions allow model authors to provide context, business logic, and specific guidance directly on the semantic model. These instructions are used by Copilot to better interpret user questions by incorporating organizational language, terminology, and analytical priorities that Copilot wouldn’t otherwise understand on its own.  
These instructions help clarify business terms, guide analysis approaches, and provide critical data context. Once saved, these instructions are used by Copilot to respond more intelligently to user prompts.  

AI Instructions make Copilot more aligned to your business. They improve the quality and relevance of responses by reducing ambiguity and ensuring that Copilot understands your domain-specific terms and analysis expectations. Ultimately, this leads to more meaningful insights, less user frustration, and a smoother experience with Copilot across reports that use the same model.  

## Set up AI instructions

1. Select the **Prep data for AI** button located on the Home ribbon in Power BI Desktop.  

   :::image type="content" source="media/copilot-prep-data/copilot-prep-data-ai.png" alt-text="Illustration showing the Prep Data for AI feature in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-prep-data-ai.png":::

   If the tabs in **Prep Data for AI** are disabled, enable Q&A for your model.  

   :::image type="content" source="media/copilot-prep-data/copilot-turn-on-qa.png" alt-text="Illustration showing how to enable Q&A for the model in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-turn-on-qa.png":::

1. In the dialog, navigate to the **Add AI instructions** tab.  
1. Provide instructions about the semantic model that help Copilot understand your business, terminology, and how to prioritize the data in the model.

   :::image type="content" source="media/copilot-prep-data/copilot-ai-instructions.png" alt-text="Dialog box showing the AI instructions tab in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-ai-instructions.png":::

1. Select **Apply**.  

Once you exit the dialog, your changes are saved to your model. Copilot now uses the AI instructions.  

## Test AI instructions  

1. Open the Copilot pane in Power BI Desktop.  
1. Use the skill picker to select the specific Copilot capability you want to test. We recommend choosing **Answers questions about the data**.  
1. Interact with Copilot utilizing one of the instructions that you set.  
1. Ensure that Copilot is responding how you expect.  
1. If instructions need to be changed, reopen the **Prep data for AI** dialog and adjust.  
1. Publish or save your report. Once testing is complete, and you're satisfied with the AI instructions, publish your report to the Power BI service.  

> [!NOTE]
> Each time you edit an instruction in the **Prep data for AI** dialog, you need to refresh the Copilot pane by closing and reopening it.  

## Consume AI instructions  

Once your report is published to the service, end-users can take advantage of the AI instructions everywhere that model interacts with Copilot.  

> [!NOTE]
> End-users can't see the AI instructions set on the model.  

## Common use cases for AI instructions  

AI Instructions offer a flexible way to enhance how Copilot interprets and responds to user prompts. While there are many potential applications, two common use cases stand out: general business context and data interpretation and analysis rules.

- **General business context and data interpretation**: Instructions can help Copilot frame responses within the context of your business - tailoring answers based on your industry, strategic goals, terminology, or operational logic. This ensures users get more accurate and relevant insights. Some examples include:
  - Busy season is October to February.  
  - Frame insights with a focus on risk assessment and market trends.  
  - When a user mentions ABCD, they're referring to the 'total invoice' field.  
  - Attrition % is more positive the lower it is.  
- **Analysis rules**: You can guide Copilot on how to approach certain types of analysis by providing rules and preferences for how data should be sliced or prioritized. Some examples include:
  - Always analyze sales on a quarterly basis.  
  - When showcasing revenue, break it down by quarter and compare it to the 'industry' field.  
  - For retail insights, prioritize the `customsegmentationtable` and `saleschannel` tables.  
  - Use the `sales_fact` table as the primary source for all sales-related questions.  
  - Always ask for clarification on location when user asks about product sales.  

## Prompt engineering for AI instructions  

Because AI instructions are heavily prompt-based, it’s important to understand the best practices for prompt engineering when building out your instructions for a semantic model. Copilot can be sensitive to the prompts that are received, so the way we construct input matters affects the outputs we receive from Copilot. Here are some ways to get the most out of your AI instructions, including an example of best practices in action:  

- **Be explicit and specific.** Assume Copilot has no understanding of how to use the data model or business context for your data.  
  - **Example:** Instead of "You're a seasoned BI Analyst who is detail oriented," consider "You're a seasoned BI Analyst who works for a big food distributor. Responses should be detail oriented and focused on revenue and profitability."  
- **Use analogies and descriptive language** to help the model understand your desired outcome. Examples can also play a vital role in helping the model understand exactly what you mean.  
  - **Example:** For product-specific sales, use the measure "Total_Sales_Product" (example of Product: Word, PowerPoint, Excel, SharePoint, Teams).  
- **Avoid ambiguity.** If something should be emphasized - or avoided - be clear. The more details and supporting content you can provide Copilot, the better.  
  - **Example:** For Total Active Partners, use the measure "Monthly Active Partner Count" (do NOT filter on "Customers" table).  
- **Group related instructions.** Organizing instructions by theme or purpose (that is, date logic, key metrics, industry terms) can help Copilot better understand your intent.  
  - **Example:** See an example of grouping related instructions in the full set of instructions in the [example scenario](#example-scenario).  
- **The order in which you author instructions can impact the output received.** Testing out different variations, orders, examples, and wording can help you get the correct outputs.  
- **Break down complex instructions into simpler steps** to improve clarity and reduce errors.  
  - **Example:** Define "top customers" by first looking at the revenue table, and then only returning the customers with the highest order values.  
- **Keep instructions focused.** Depending on the model and instructions set, sometimes less is more. Conflicts and complexity in instructions can cause confusion for the large language model (LLM).  

In the following section, you can find an example of a full set of instructions, prompt-engineered to fit a specific complex model.

### Example scenario

See the following example scenario for a set of AI instructions that are prompt-engineered to fit a specific model.

#### Instructions for answering data questions

Gross product sales (GPS) should reference the `grossrevenue` field in the **Revenue** table.

Top sellers refers to the top three partners with the highest revenue. Don't show customers unless the user explicitly asks.

#### Customer identification

- `accountid` refers to customers in the **Revenue** table.
- `earningsid` refers to Customers in the **Partners** table. 
- `customid` in the order table doesn't refer to Customers. 
- Define "top customers" by first looking at the revenue table, and then only returning the customers with the highest order values.
- Some partners are also customers. Don't remove these duplicates, rather, indicate whether it's a partner or a customer based on the ID value.

#### Product metrics

- Filter data by `State= Washington` or `State= California` unless the user specifically asks for a different state.  
- For product specific sales, use the measure `Total_Sales_Product` (example of product: Word, PowerPoint, Excel, SharePoint, Teams), and filter on the **Product** column from the **Sales** table.
- For `Total Active Partners`, use the measure `Monthly Active Partner Count_ID` (don't filter on the **Customers** table).
- Food product sales are always from retail stores.
  -If `product_type` in the **Product** table is `Food`, then ***ALWAYS*** show the store the item was sold from. Store information is found in the **Store** table with the field `store_name` and it can be linked to `product_type` by `store_id`.

## A note on iteration  

Getting the most from AI Instructions often requires some iteration. As you experiment and observe how Copilot responds, you develop a better understanding of what types of instructions drive the best outcomes for your model and your users.  

## Considerations and Limitations  

See [Prepare your data for AI](copilot-prepare-data-ai.md#considerations-and-limitations) for a comprehensive list.

- Because AI instructions are unstructured guidance to Copilot, they can only be interpreted by the LLM but can't be guaranteed to be followed exactly.  
- AI instructions affect Copilot capabilities but don't extend to general conversations with Copilot.  
- AI instructions are saved at the semantic model level. Instructions can't be stored at the report level at this time.  
- AI instructions aren't expected to be persona-specific or modify non-data-related outputs for the end user.  
- Instructions aren't intended to work with visual modifications or theming in your report.  
- The ability to upload instructions to the dialog in Desktop is currently unavailable.  
- If you're testing instructions in Desktop, you need to close and reopen your Copilot pane to see new instructions applied.  
- Users can't set instructions by category or by mode (view or edit) in Power BI Copilot.  
- Consumers can't see what instructions an author applied to the model in the UI.  
- End-users can't disable instructions on a semantic model.  
- AI instructions might not be respected in Power BI Desktop when you're trying to create a page, get suggested report page topics, or a dataset summary with Copilot. To work around this, utilize the skill picker and select only "Create new report pages" to have instructions successfully apply.  

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [AI data schema](copilot-prepare-data-ai-data-schema.md)
- [Verified answers](copilot-prepare-data-ai-verified-answers.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
