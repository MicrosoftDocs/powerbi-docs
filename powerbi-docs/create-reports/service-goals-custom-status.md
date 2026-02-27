---
title: Customize statuses on your scorecard
description: Learn how to customize statuses in your Power BI scorecards to meet your teams' needs and ensure they align with your organization's specific requirements.
author: kgremban
ms.author: kgremban
ms.reviewer: carlylan
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
ms.custom: sample-salesandreturns
ai-usage: ai-assisted
#customer intent: As a Power BI user I want to learn how to customize the statuses of my scorecard goals in Power BI.
---
# Customize statuses on your Power BI scorecard

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Statuses are an integral part of goal tracking. In some scenarios, the default statuses on a scorecard don't fit your organization's needs. You might want to customize the statuses to match your organization's terminology.

:::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-1.png" alt-text="Screenshot of a view of goals showing customized statuses in the status column." lightbox="media/service-goals-custom-status/power-bi-custom-statuses-1.png":::

## Customize your scorecard's status

When you open a scorecard in edit mode, you can customize your statuses from two entry points:

- Select the **Settings** gear icon, or
- Select the **Statuses** section of the **Edit scorecard settings** pane.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-2.png" alt-text="Screenshot of a view of the edit status pane open, customizing statuses." lightbox="media/service-goals-custom-status/power-bi-custom-statuses-2.png":::

You can also reach this area by editing a metric inline.

1. In scorecard edit mode, select the pencil icon to edit a metric.
1. In the **Status** section, select the **Manage statuses** option at the end of the list.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-3.png" alt-text="Screenshot of a view of the entry point when editing a metric inline, at the bottom of the status dropdown." lightbox="media/service-goals-custom-status/power-bi-custom-statuses-3.png":::

## Change your scorecard's statuses

When you're in the **Manage statuses** section, you can take a few different actions. You can create new statuses, rename existing statuses, and change the color associated with the status.  

- To add a new status, select the **Add status** button at the top.  
- To rename an existing status, highlight the text and type your new status name.
- To change the color associated with a status, select the color picker to the right of the status and choose your desired color.
- To delete a status, select the trash icon.
- To reorder the statuses within the list, use the arrow buttons to move an item up, down, or select and drag the status to its new location.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-4.png" alt-text="Screenshot of a status being reordered in the edit status pane." lightbox="media/service-goals-custom-status/power-bi-custom-statuses-4.png":::

    By reordering the statuses, you're specifying the order of priority.  Priority order comes in handy back on the scorecard. You have the option to sort the goals in order of status priority.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-5.png" alt-text="Screenshot of a view of how you can sort the status column by ascending or descending priority." lightbox="media/service-goals-custom-status/power-bi-custom-statuses-5.png":::

- To reset all statuses to the default settings (the original scorecard statuses), select **Reset statuses** at the top.

## Delete statuses

When you delete a status, it's no longer available in your status list. You don't see the deleted status as an option when you perform check-ins. However, Power BI preserves the history in your semantic model and check-in history for up to 12 deleted statuses.

If a metric uses a status that you deleted, Power BI preserves the metric’s deleted status until you change it, either by editing or by a check-in. For example, in the following image, you see that the status **Line Down** is no longer available in the status list, but Power BI doesn't remove the metric statuses that use that status.

:::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-deleted.png" alt-text="Screenshot of a view of the edit status pane open." lightbox="media/service-goals-custom-status/power-bi-custom-statuses-deleted.png":::

You can customize the statuses to the terminology you use every day in your organization. You ensure that everyone in your team easily understands and make it easier than ever for goals to work seamlessly for your organization.

## Considerations and limitations

Power Automate doesn't support custom statuses for goals.

## Related content

- [Get started with goals in Power BI](service-goals-introduction.md)
- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).

