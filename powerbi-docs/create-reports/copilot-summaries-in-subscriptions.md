---
title: Add Copilot Summaries to Email Subscriptions
description: You can add Copilot summaries to Power BI report subscriptions.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: sairoshann
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 07/06/2026
ai-usage: ai-assisted
LocalizationGroup: Create report subscriptions with Copilot summaries
no-loc: [copilot]
ms.collection: ce-skilling-ai-copilot
ms.custom: sfi-image-nochange
#customer intent: As a report subscription creator, I want Copilot report summaries to be delivered in my subscription email.
---

# Create report subscriptions with Copilot summaries in the Power BI service (preview)

**Applies to:** [!INCLUDE [applies-to-service](../includes/applies-to-version/service.md)]

To get insights, include a Copilot-generated summary for your Power BI report page or full report attachment in your email subscription. All email subscription recipients receive the Copilot summary in the email. Only Standard Subscriptions support this feature.  

The Copilot summary appears in the email even when Power BI delivers reports to OneDrive or SharePoint.

:::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-copilot-summaries-in-email-subscriptions.gif" alt-text="Animation showing how to subscribe to a copilot summary." lightbox="media/copilot-summaries-in-subscriptions/power-bi-copilot-summaries-in-email-subscriptions.gif":::

## Requirements

- [Enable Fabric Copilot in Power BI](copilot-enable-power-bi.md)
- [Subscription Requirements](../collaborate-share/end-user-subscribe.md#requirements)
  

## How to set up Copilot in email subscriptions

1. Select **Subscribe to report**, and then select **Create a subscription**.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-subscribe-to-report.png" alt-text="Screenshot showing how to subscribe to a report." lightbox="media/copilot-summaries-in-subscriptions/power-bi-subscribe-to-report.png":::


1. Select **Standard Subscription**. You can modify the **Subscription name** and **Recipients** who should receive the Copilot summary in email.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-standard-subscription.png" alt-text="Screenshot showing creating a standard subscription." lightbox="media/copilot-summaries-in-subscriptions/power-bi-standard-subscription.png":::

1. To receive a Copilot summary of the full report instead of a single page, select **Attach full report**.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-attach-full-report.png" alt-text="Screenshot showing FRA subscription." lightbox="media/copilot-summaries-in-subscriptions/power-bi-attach-full-report.png":::

   You can also deliver the full report to a OneDrive or SharePoint location. Recipients still receive the Copilot summary via email, along with the link to the OneDrive or SharePoint location.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-send-to.png" alt-text="Screenshot showing OneDrive SharePoint subscription." lightbox="media/copilot-summaries-in-subscriptions/power-bi-send-to.png":::

1. Schedule the delivery of your report by choosing the frequency (Daily, Weekly, Monthly), Start, and End dates. [Learn more about creating subscriptions.](../collaborate-share/end-user-subscribe.md#subscribe-to-a-report-or-dashboard)

1. In the **Summary by Copilot (preview)** section, select **Preview summary**.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-subscribe-copilot-summaries-email.png" alt-text="Screenshot showing opt-in for summary for the subscription." lightbox="media/copilot-summaries-in-subscriptions/power-bi-subscribe-copilot-summaries-email.png":::

1. When you select **Preview summary**, Copilot generates a summary.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-subscribe-preview-copilot-summary.png" alt-text="Screenshot showing the preview for summary for the subscription." lightbox="media/copilot-summaries-in-subscriptions/power-bi-subscribe-preview-copilot-summary.png":::

   > [!NOTE]
   > The preview displays a point in time summary of the report data. The summary changes based on the subscription schedule and data.

1. For existing subscriptions, you can opt in to receive Copilot summaries by turning on the toggle.

   > [!NOTE]
   > For new subscriptions that are Copilot eligible, the Copilot summary is enabled by default. To opt out of including Copilot summaries in subscription emails, turn off the toggle.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-subscribe-copilot-summaries-off.png" alt-text="Screenshot showing the opt-out for the summary in the subscription." lightbox="media/copilot-summaries-in-subscriptions/power-bi-subscribe-copilot-summaries-off.png":::

1. You can include an email subject, message, an image of a report page, a link to the report in Power BI, and permission to view the report in Power BI.

   If you include a message in the email, it appears above the Copilot summary.

1. **Save** the subscription.

1. After you save the subscription, you can test it by selecting **Send now**.

   > [!NOTE]
   > **Send now** sends the report to all email recipients.

   :::image type="content" source="media/copilot-summaries-in-subscriptions/power-bi-subscribe-copilot-summaries-send-now.png" alt-text="Screenshot showing the send now option." lightbox="media/copilot-summaries-in-subscriptions/power-bi-subscribe-copilot-summaries-send-now.png":::

## Limitations and considerations

- Copilot doesn't generate email subscription summaries for dynamic per recipient subscriptions, paginated reports, scorecards, and dashboards.
- Copilot runs the summary on behalf of the subscription owner, much like email subscriptions.
- Copilot doesn't support user-defined prompts.
- Your email might not contain a Copilot summary if Copilot takes too long to respond. This behavior usually happens with large reports.
- If you apply filters and select **Include my changes** when saving your subscription, Copilot generates the summary by using those filters.
