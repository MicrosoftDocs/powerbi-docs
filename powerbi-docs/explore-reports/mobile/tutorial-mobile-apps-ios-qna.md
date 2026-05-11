---
title: "Tutorial: Ask Questions with Q&A Virtual Analyst in the Power BI iOS Apps"
description: Learn how to use the Q&A virtual analyst in the Power BI iOS mobile app to ask natural language questions about sample data and explore insights.
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: tutorial
ms.date: 12/18/2025
ai-usage: ai-assisted
#customer intent: As a Power BI end user, I want to see how the virtual analyst works in the iOS mobile apps so I can use the analyst to explore my own data. 
---
# Tutorial: Ask questions by using the Q&A virtual analyst in the Power BI iOS apps

> [!IMPORTANT]
> Q&A experiences retire in December 2026. Use [Copilot for Power BI](../../create-reports/copilot-introduction.md), which provides a more advanced and integrated way to query your data by using natural language. For more details and recommended alternatives, see [Deprecating Power BI Q&A](https://powerbi.microsoft.com/blog/deprecating-power-bi-qa).

The easiest way to learn about your data is to ask questions in your own words. In this tutorial, you use the Q&A virtual analyst in the Microsoft Power BI mobile app on your iPad or iPhone to ask questions and view featured insights about sample data.

Applies to:

| :::image type="icon" source="./media/tutorial-mobile-apps-ios-qna/iphone-logo-50-px.png"::: | :::image type="icon" source="./media/tutorial-mobile-apps-ios-qna/ipad-logo-50-px.png"::: |
|:--- |:--- |
| iPhones |iPads |

The Q&A virtual analyst is a conversational BI experience that accesses Q&A data in the [Power BI service](https://powerbi.com). It suggests insights, and you can type or speak questions.

:::image type="content" source="./media/tutorial-mobile-apps-ios-qna/power-bi-ios-q-n-a-top-sale-intro.png" alt-text="Screenshot of Q&A virtual analyst showing top sales insights results in the Power BI iOS app.":::

In this tutorial, you:

> [!div class="checklist"]
>
> - Install the Power BI mobile app for iOS
> - Download a Power BI sample dashboard and report
> - See what featured insights the mobile app suggests

## Q&A virtual analyst

Use a conversational BI experience that suggests initial insights, lets you type or speak natural language questions, and returns visuals you can expand, annotate, or mark as a favorite.

Key capabilities:

- Inline suggestions for fields, measures, or keywords
- Voice input for dictation
- Iterative refinement (for example: "show sales" → "by item" → "as line chart")
- Select and hold a result to expand it or take more actions

## Ask questions

1. Type "show sales".
1. Add "by item".
1. Add "as column chart" or select a chart icon.
1. Select and hold the visual, then select **Expand**.

## Use voice

1. Select the Q&A virtual analyst icon.
1. Select the microphone and say "average unit price by time."
1. Select **Send** to show the answer.
1. Select **Clear text** (X) to start a new question.

## Help and feedback

- Type "help" or "hi" for tips.
- Select and hold a visual, then select positive or negative feedback to improve future responses. Feedback is anonymous.

## Improve results

Enhance synonyms, descriptions, and default aggregations to improve Q&A interpretation. For more information, see [Make your data work well with Q&A and the Q&A virtual analyst](../../create-reports/service-prepare-data-for-q-and-a.md).

## Prerequisites

- **Sign up for Power BI**: If you aren't signed up, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).
- **Install the Power BI app for iOS**: [Download the iOS app](https://apps.apple.com/app/microsoft-power-bi/id929738808) from the Apple App Store to your iPad or iPhone.
- **Download sample data**: Download the **Opportunity Analysis Sample** to your Power BI service account. See [Install built-in samples](../../create-reports/sample-opportunity-analysis.md) for instructions. Select the **Opportunity Analysis Sample**.

After you complete the prerequisites and download the sample data, view the samples on your iOS device.

## Try featured insights

1. On your iPhone or iPad, open the Power BI app and sign in with the same Power BI credentials you use in the browser.
1. On the home page, tap the **Workspaces** icon.

    :::image type="content" source="./media/tutorial-mobile-apps-ios-qna/power-bi-qna-open-myworkspace.png" alt-text="Screenshot of Power BI iOS app showing the Workspaces icon selected to open My Workspace.":::

1. In **My Workspaces**, select the **Opportunity Analysis Sample** dashboard.
1. On the Opportunity Analysis Sample dashboard, tap the Q&A virtual analyst icon.

    :::image type="content" source="./media/tutorial-mobile-apps-ios-qna/power-bi-qna-open-qna.png" alt-text="Screenshot of Opportunity Analysis Sample dashboard with the Q&A virtual analyst icon highlighted.":::

    The Q&A virtual analyst offers some suggestions to get started.

    :::image type="content" source="./media/tutorial-mobile-apps-ios-qna/power-bi-qna-suggestions.png" alt-text="Screenshot of Q&A virtual analyst pane displaying suggested featured insights options.":::

1. Tap **featured insights**. When suggestions appear, scroll right and tap **Insight 2**.

    :::image type="content" source="./media/tutorial-mobile-apps-ios-qna/power-bi-ios-qna-suggest-insight-2.png" alt-text="Screenshot of featured insights carousel with Insight 2 card visible in Q&A virtual analyst.":::

   The Q&A virtual analyst displays Insight 2.

    :::image type="content" source="./media/tutorial-mobile-apps-ios-qna/power-bi-ios-qna-show-insight-2.png" alt-text="Screenshot of Insight 2 visualization displayed after selecting featured insights suggestion.":::

1. Tap the chart to open it in focus mode.

    :::image type="content" source="./media/tutorial-mobile-apps-ios-qna/power-bi-ios-qna-open-insight-2.png" alt-text="Screenshot of selected Insight 2 chart opened in focus mode in the Power BI iOS app.":::

1. Tap the Back arrow to return to the Q&A virtual analyst.

## Clean up resources

When you finish the tutorial, delete the Opportunity Analysis sample dashboard, report, and semantic model. For instructions, see [Clean up resources](../../fundamentals/service-get-started.md#clean-up-resources).

## Related content

Try the Q&A virtual analyst in the Power BI iOS mobile app to explore sample insights. Then, learn more about Q&A in the Power BI service.
> [!div class="nextstepaction"]
> [Q&A in the Power BI service](../end-user-q-and-a.md)
