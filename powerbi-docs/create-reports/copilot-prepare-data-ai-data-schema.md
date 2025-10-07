---
title: Prepare Your Data for AI - AI Data Schemas
description: Learn how to prepare your data for AI in Power BI by using an AI data schema.
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

# Prepare your data for AI: AI data schemas

> [!NOTE]
> You can't *author* **Prep data for AI** features in either the Power BI service or Power BI Desktop. Users can *consume* these features everywhere that Copilot exists.

By using an AI data schema, semantic model authors can define a focused subset of the model's schema for Copilot to prioritize when it generates responses. Authors select the most relevant fields to guide Copilot to provide answers that are more aligned with the user's queries. A streamlined schema reduces ambiguity, which helps Copilot deliver clearer and more accurate responses.

When you set an AI data schema for a model, Copilot uses the selected fields when it responds to data-related questions. When users ask questions, Copilot uses the reduced schema. It produces more accurate responses by using the correct field without needing clarification from the end user.

By using a defined AI data schema, model authors can ensure that Copilot pulls the most relevant and focused data for specific queries. This practice enhances the quality and relevance of Copilot's responses, which makes the interactions more efficient and tailored to the user's needs. The AI data schema ensures that Copilot works with the most important fields for specific tasks, improving accuracy and clarity in its output.

## Set an AI data schema

To set an AI data schema, follow these steps:

1. Select the **Prep data for AI** button on the **Home** ribbon in Power BI Desktop. In the Power BI service, you can select the button from the ribbon on the semantic model page. If the tabs in **Prep Data for AI** are disabled, turn on Power BI Q&A for your model.

1. Go to the **Simplify data schema** tab.
1. Select fields that you want Copilot to reason over. Prioritize clean columns with limited ambiguity and remove any fields that could be confusing for Copilot.

   :::image type="content" source="media/copilot-prep-data/copilot-prep-data-schema.png" alt-text="Screenshot of the Simplify data schema tab in the Prep data for AI dialog in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-prep-data-schema.png":::

1. Select **Apply** to make your changes.

After you exit the dialog, your changes are saved to your model. Copilot now uses your AI data schema when it answers questions from users.  

You can update your AI data schema at any time by reopening the **Prep data for AI** dialog.

## Test your AI data schema in Power BI Desktop

You can test to make sure that Copilot is following the changes you made in the AI data schema. Follow these instructions:

1. Open the **Copilot report** pane in Power BI Desktop.
1. Select **skill picker**, and then select **Answer data question**.
1. Ask a data question by using a field that *isn't* in the AI data schema. Copilot shouldn't be able to return an answer.
1. Ask a data question by using a field that *is* in the AI data schema. Copilot should be able to return an answer.
1. Publish your report to the Power BI service so that consumers can use the AI data schema.

## Consume the AI data schema in the service

After your report is published to the service, or after you made changes by using the **Prep data for AI** feature in the service, users can take advantage of the AI data schema everywhere that model interacts with Copilot. When users ask a data question, Copilot answers by using the AI data schema.

> [!NOTE]
> Each time you edit the AI data schema in the **Prep data for AI** dialog, you need to refresh the Copilot pane by closing and reopening it.

## Considerations and limitations

Here are some things you need to know:

- Consumers of your semantic model can't see the AI data schema set on the model.
- The data schema only applies to Copilot capabilities that utilize the schema.
- The AI data schema isn't considered for Copilot capabilities that don't use the model schema. For example, when Copilot gives a summary of the report or answers a question directly from the report page.
- When you use Copilot to create a report page, search for data, or use a Data Analysis Expressions (DAX) query, Copilot requires the entire semantic model. It doesn't consider the AI data schema.
- All fields that are available in the semantic model appear in the AI data schema selection pane regardless of how visibility is set on the semantic model. Fields that are hidden in the semantic model are automatically excluded in the initial AI data schema when you set it up for the first time.
- Hierarchies can be selected as part of the AI data schema, but not individual hierarchy components. Select individual fields as part of the table as required. If the AI data schema includes a hierarchy, but you don't select a column of the hierarchy as part of the table, the Copilot schema still includes the column.
- Relationships are still respected regardless of the AI data schema set. For example, if two fields are related, and one of them is included in the AI data schema, Copilot can still return answers that require that relationship.
- End users can't disable the AI data schema.

For a comprehensive list of considerations and limitations, see [Prepare your data for AI](copilot-prepare-data-ai.md#considerations-and-limitations).

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [Verified answers](copilot-prepare-data-ai-verified-answers.md)
- [AI instructions](copilot-prepare-data-ai-instructions.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
