---
title: Troubleshoot sharing dashboards and reports
description: Learn how to resolve issues when you share Power BI dashboards and reports with colleagues inside and outside your organization.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: troubleshooting
ms.date: 12/16/2022
LocalizationGroup: Share your work
---
# Troubleshoot issues sharing dashboards and reports

Here are some common issues that might come up when you share a dashboard or report, or when someone else shares with you. 

## Dashboard recipients see a lock icon in a tile

The people you share with might see a locked tile in a dashboard, or a "Permission required" message when they try to view a report.

:::image type="content" source="media/service-share-dashboards/power-bi-locked_tile_small.png" alt-text="Screenshot that shows the Power BI locked tile.":::

If so, you need to grant them permission to the underlying semantic model.

1. Go to the **All** or the **Semantic models + dataflows** tab in your content list.

1. Select **More options (...)** next to a semantic model, then choose **Manage permissions**.

    :::image type="content" source="media/service-troubleshoot-sharing/power-bi-sharing-manage-permissions.png" alt-text="Screenshot that shows where to select More options and then choose Manage permissions.":::

1. Select **Add user**.

    :::image type="content" source="media/service-troubleshoot-sharing/power-bi-share-dataset-add-user.png" alt-text="Screenshot that shows where to select Add user.":::

1. Enter the full email addresses for individuals, distribution groups, or security groups that you want to add. You can't share dashboards or reports with dynamic distribution lists. Decide if the users can **share this semantic model** or **build content with the data associated with this semantic model**, and if you want to **send an email notification**.

    :::image type="content" source="media/service-troubleshoot-sharing/power-bi-add-user-dataset.png" alt-text="Screenshot that shows where to add the email addresses and to grant access privileges.":::

1. Select **Grant access**.

## I can't share a dashboard or report

To share a dashboard or report, you need permission to reshare the underlying content; that is, any related reports and semantic models. If you see a message saying you can't share, ask the report author to give you reshare permission for those reports and semantic models.

:::image type="content" source="media/service-share-dashboards/power-bi-sharing-unable-to-share.png" alt-text="Screenshot that shows the message that indicates you can't share the underlying content.":::

## I don't have access to a dashboard or report

If you see a "Request access" message when you select the link to a report or dashboard, you don't have permission to view it. You need to [request access to it](service-request-access.md).

## Related content

- [Share Power BI dashboards and reports with coworkers and others](service-share-dashboards.md)
- [How should I collaborate on and share dashboards and reports?](service-how-to-collaborate-distribute-dashboards-reports.md)
- [Share a filtered Power BI report](service-share-reports.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
