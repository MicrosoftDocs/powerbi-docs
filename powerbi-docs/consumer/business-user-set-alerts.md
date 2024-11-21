---
title: Set alerts on Power BI reports (public preview)
description: Set alerts on Power BI reports with Activator.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: mihart, lukaszp
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: overview
ms.date: 02/21/2024
LocalizationGroup: Get started
---

# Set alerts on Power BI reports (public preview)

**APPLIES TO:** :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::Power BI service for ***business users*** :::image type="icon" source="../includes/media/no-icon.svg" border="false":::Power BI service for designers & developers :::image type="icon" source="../includes/media/no-icon.svg" border="false":::Power BI Desktop :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::Requires Premium or Fabric license

With Fabric Activator, you can set data alerts on the reports that you're interested in following. Read more about it in [What is Activator?](/fabric/real-time-intelligence/data-activator/data-activator-introduction)

## Prerequisites

- You need to have write permission for a workspace with a Fabric capacity license.

You can sign up for a [Microsoft Fabric free trial](https://aka.ms/try-fabric).

## Set a data alert

1. From the visual context menu or report toolbar, tap a visual in the report, and then select  **Set alert**.

    :::image type="content" source="media/business-user-set-alerts/set-alert-button.png" alt-text="Screenshot showing the Set alert button in the Power BI ribbon." lightbox="media/business-user-set-alerts/set-alert-button.png":::

    A pane opens where you can set the measure you want to monitor in that visual, and the conditions you want to detect.

1. In the **Set an alert** pane, choose:

    :::image type="content" source="media/business-user-set-alerts/set-alert-pane.png" alt-text="Screenshot showing the Set alert pane." lightbox="media/business-user-set-alerts/set-alert-pane.png":::

    - A measure to monitor.
    - A condition to evaluate.
    - A threshold to pass.

1. Decide whether to be notified by email or in Teams.
1. Save the alert to a workspace with a Fabric capacity license.
1. Select **Start my alert**, then select **Create alert**.

Power BI creates an Activator item and connects it to the data in your Power BI semantic model. Activator automatically starts monitoring your data and notifies you when the condition is met.

## Customize the trigger

You can further customize the trigger to:

- Watch for more complex conditions
- Notify different users
- Even launch a Power Automate workflow.

For more information, read the [Activator](/fabric/real-time-intelligence/data-activator/data-activator-introduction) documentation.

## Related content

- [Fabric Activator](/fabric/real-time-intelligence/data-activator/data-activator-introduction)
