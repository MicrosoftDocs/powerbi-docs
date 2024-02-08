---
title: Customize statuses on your scorecard
description: Learn how to customize the statuses in your Power BI scorecards to meet your teams' needs.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: carlylan
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 07/01/2022
ms.custom: sample-salesandreturns
---
# Customize statuses on your Power BI scorecard

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Statuses are an integral part of metric tracking. In some scenarios the statuses that come with a scorecard aren't right for your organization’s needs. You may want to customize the statuses to reflect your organization’s terminology.

:::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-1.png" alt-text="Screenshot of A view of metrics showing customized statuses in the status column.":::

## Start customizing

When you open a scorecard in edit mode, there are two entry points to start customizing your statuses.  

* Select the **Settings** gear icon, or
* Select the **Statuses** section of the **Edit scorecard settings** pane.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-2.png" alt-text="Screenshot of A view of the edit status pane open, customizing statuses.":::

You can also get to this area by editing a metric inline.

1. In scorecard edit mode, select the pencil icon to edit a metric.
1. In the **Status** section, select the **Manage statuses** option at the end of the list.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-3.png" alt-text="Screenshot of A view of the entry point when editing a metric in-line, at the bottom of the status dropdown.":::

## Modify statuses

Once you’re in the **Manage statuses** section, you can take a few different actions. You can create new statuses, rename existing statuses, and change the color associated with the status.  

- To add a new status, select the **Add status** button at the top.  
- To rename an existing status, highlight the text and type your new status name.
- To change the color associated with a status, select the color picker to the right of the status and choose your desired color.
- To delete a status, select the trash icon.
- To reorder the statuses within the list, use the arrow buttons to move an item up, down, or select and drag the status to its new location.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-4.png" alt-text="Screenshot of a status being reordered in the edit status pane.":::

    By reordering the statuses, you're specifying the order of priority.  Priority order comes in handy back on the scorecard. You have the option to sort the metrics in order of status priority.

    :::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-5.png" alt-text="Screenshot of A view of how you can sort the status column by ascending or descending priority.":::

- To reset all statuses to the default settings (the original scorecard statuses), select **Reset statuses** at the top.

## Delete statuses

When you delete a status, it's no longer available in your status list. You don't see the deleted status as an option when you perform check-ins. However, we preserve the history in your semantic model and check-in history for up to 12 deleted statuses.

If a metric uses a status that is deleted, we preserve the metric’s deleted status until you change it, either by editing or by a check-in. For example, in the following image, you see that the status **Line Down** is no longer available in the status list, but we don't remove the metric statuses that use that status.

:::image type="content" source="media/service-goals-custom-status/power-bi-custom-statuses-deleted.png" alt-text="Screenshot of A view of the edit status pane open.":::

You can customize the statuses to the terminology you use every day in your organization. You ensure that everyone in your team easily understands and make it easier than ever for metrics to work seamlessly for your organization.

## Related content

- [Get started with metrics in Power BI](service-goals-introduction.md)
- [Create scorecards and manual metrics in Power BI](service-goals-create.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)
- [Stay on top of your metrics in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
