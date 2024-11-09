---
title: Create Q&A featured questions for Power BI dashboards
description: Learn how to create and add featured questions for the Power BI Q&A by using the Retail Analysis sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 11/05/2024
LocalizationGroup: Ask questions of your data
#customer intent: As a Power BI user I want to learn how to create and add featured questions in Power BI.
---
# Create Q&A featured questions for Power BI dashboards

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

If you have edit permission for a semantic model, you can add your own featured questions to that semantic model. Power BI Q&A will show those questions to colleagues who consume dashboards based on that semantic model. Featured questions give your colleagues ideas about the types of questions they can ask about the semantic model. The featured questions you add are up to you. You can add popular questions, questions that display interesting results, or questions that might be hard to phrase.

> [!NOTE]
> Q&A featured questions are available for use in the [Microsoft Power BI app on iPads, iPhones, and iPod Touch devices](../consumer/mobile/mobile-apps-ios-qna.md) and in the Power BI service (app.powerbi.com). Creating the questions is only available in the Power BI service.

## Prerequisites

- You just need a [Fabric free license](../consumer/end-user-features.md) to add featured questions to a dataset in My Workspace in the Power BI service.
- You need a Power BI Pro license to add featured questions in other workspaces in the Power BI service. Read more about [Power BI Pro licenses](../fundamentals/service-self-service-signup-purchase-for-power-bi.md).
- You also need at least a Contributor role in that workspace. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).
- If you want to follow along, get the [Retail Analysis sample](sample-retail-analysis.md#get-the-built-in-sample-in-the-power-bi-service) in the Power BI service.

### Create a featured question

This article uses the Retail Analysis sample. Follow these step-by-step instructions to explore a semantic model.

1. On the dashboard, select the **Ask a question about your data** Q&A question box. Notice that Q&A is already being helpful by displaying some suggested questions.
1. To create a featured question, in Power BI, select **More options** (...), select **Settings** > **Settings**.

   :::image type="content" source="media/service-q-and-a-create-featured-questions/gear-icon-2.png" alt-text="Screenshot of Power BI, highlighting Settings and Settings.":::
1. Select **Semantic models** > **Retail Analysis sample** > **Featured Q&A questions**.
1. Select **Add a question**.

   :::image type="content" source="media/service-q-and-a-create-featured-questions/power-bi-settings-2.png" alt-text="Screenshot of the Settings menu with Featured Q&A questions dropdown box.":::
1. Type your question in the text box. For example, type "show last year sales by territory as filled map" and select **Apply**. Optionally, add another question by selecting **Add a question** again.

   :::image type="content" source="media/service-q-and-a-create-featured-questions/power-bi-type-featured-question-2.png" alt-text="Screenshot of the Featured Q&A questions interface.":::

1. Go back to the Power BI dashboard for the Retail Analysis sample, and place your cursor in the Q&A question box.

   :::image type="content" source="media/service-q-and-a-create-featured-questions/ask-question-2.png" alt-text="Screenshot of the Q&A question box in Power BI dashboard.":::

1. The Q&A screen shows the new featured question, **show last year sales by territory as filled map**. Select the featured question.

   :::image type="content" source="media/service-q-and-a-create-featured-questions/power-bi-qna-featured-question-to-start-2.png" alt-text="Screenshot of the Q&A question box with featured question.":::
1. Power BI creates the answer and displays it as a filled map visualization.

   :::image type="content" source="media/service-q-and-a-create-featured-questions/power-bi-qna-featured-question-2.png" alt-text="Screenshot of the Q&A map visualization.":::

## Related content

- [Q&A for Power BI business users](../consumer/end-user-q-and-a.md)
- [Use Power BI Q&A to explore your data and create visuals](power-bi-tutorial-q-and-a.md)
- [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
