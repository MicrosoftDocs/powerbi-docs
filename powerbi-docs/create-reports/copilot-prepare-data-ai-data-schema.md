---
title: Prepare your data for AI - AI data schema
description: Learn how to prepare your data for AI in Power BI by using the AI data schema. Optimize Copilot's performance, improve AI-driven insights, and enhance user interactions by defining a focused subset of your model's schema.
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

# Prepare your data for AI - AI data schema

An AI data schema enables semantic model authors to define a focused subset of the model's schema for Copilot to prioritize when generating responses. Authors select the most relevant fields to guide Copilot to provide answers that are more aligned with the user's queries. A streamlined schema reduces ambiguity, helping Copilot deliver clearer and more accurate responses.

Once AI data schema is set for a model, Copilot uses the selected fields when responding to data-related questions. When users ask questions, Copilot uses the reduced schema, producing more accurate responses by selecting the correct field to use without clarification required from the end user.

A defined AI data schema lets model authors ensure that Copilot pulls the most relevant and focused data for specific queries. This enhances the quality and relevance of Copilot's responses, making the interactions more efficient and tailored to the user's needs. The AI data schema ensures that Copilot works with the most important fields for specific tasks, improving accuracy and clarity in its output.

## Set an AI data schema

To set an AI data schema, follow these steps:

1. Select the **Prep data for AI** button located on the Home ribbon in Power BI Desktop.  

   If the tabs in **Prep Data for AI** are disabled, enable Q&A for your model.

1. Navigate to the **Simplify data schema** tab.
1. Select fields you want Copilot to reason over

   Prioritize clean columns with limited ambiguity and remove any fields that could be confusing for Copilot.

   :::image type="content" source="media/copilot-prep-data/copilot-prep-data-schema.png" alt-text="Screenshot of the Simplify data schema tab in the Prep data for AI dialog in Power BI Desktop." lightbox="media/copilot-prep-data/copilot-prep-data-schema.png":::

1. Select **Apply** changes

Once you exit the dialog, your changes are saved to your model. Copilot now uses your AI data schema when answering questions from users.  

You can update your AI data schema at any time by reopening the **Prep data for AI** dialog.

## Test your AI data schema

You can test that the changes in the AI data schema are being respected.

1. Open the Copilot report pane.
1. Select the **skill picker** and choose **Answer data question**.
1. Ask a data question using a field that *isn't* in the AI data schema. Copilot shouldn't be able to return an answer.
1. Ask a data question using a field that *is* in the AI data schema. Copilot should return an answer.
1. Publish your report to the Power BI service for consumers to use the AI data schema.

## Consume the AI data schema in the service

Once your report is published to the service, end-users can take advantage of the AI data schema everywhere that model interacts with Copilot. When users ask a data question, Copilot answers using the AI data schema.

> [!NOTE]
> End-users can't see the AI data schema set on the model.
> 
> Each time you edit the AI data schema in the **Prep data for AI** dialog, you need to refresh the Copilot pane by closing and reopening it.

## Considerations and limitations

See [Prepare your data for AI](copilot-prepare-data-ai.md#considerations-and-limitations) for a comprehensive list.

- Consumers of your semantic model can't see the AI data schema set on the model.
- Data schema only applies to Copilot capabilities that utilize the schema.
- The AI data schema isn't considered for Copilot capabilities that don't use the model schema. For example, when Copilot is giving a summary of the report or answering a question directly from the report page.
- Using Copilot to create a report page, search for data, or use a DAX query requires the entire semantic model and doesn't consider the AI data schema.
- All fields available in the semantic model appear in the AI data schema selection pane regardless of visibility set on the semantic model. Fields hidden in the semantic model  automatically aren't included in the initial AI data schema when setting it up for the first time. 
- Hierarchies can be selected as part of the AI data schema, but not individual hierarchy components. Select individual fields as part of the table as required. If a hierarchy is included in the AI data schema, but a column of the hierarchy isn't selected as part of the table, the column is still included as part of the Copilot schema.
- Relationships are still respected regardless of the AI data schema set. For example, if two fields are related, and one of the fields is included in the AI data schema, Copilot can still return answers that require that relationship.
- End-users can't disable the AI data schema.

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [Verified answers](copilot-verified-answers.md)
- [AI instructions](copilot-prepare-data-ai-instructions.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
