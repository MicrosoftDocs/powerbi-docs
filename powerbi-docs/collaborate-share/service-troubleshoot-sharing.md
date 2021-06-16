---
title: Troubleshoot sharing dashboards and reports
description: How to resolve issues for sharing Power BI dashboards and reports with colleagues in and out of your organization.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.custom: video-0tUwn8DHo3s
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: troubleshooting
ms.date: 06/23/2020
LocalizationGroup: Share your work
---
# Troubleshoot sharing dashboards and reports

Here are some common issues that may come up when you're sharing a dashboard or report, or when someone else is sharing with you. 

## Dashboard recipients see a lock icon in a tile

The people you share with may see a locked tile in a dashboard, or a "Permission required" message when they try to view a report.

![Power BI locked tile](media/service-share-dashboards/power-bi-locked_tile_small.png)

If so, you need to grant them permission to the underlying dataset.

1. Go to the **Datasets** tab in your content list.

1. Select the ellipsis (**...**) next to the dataset, then select **Manage permissions**.

    ![Manage permissions](media/service-share-dashboards/power-bi-sharing-manage-permissions.png)

1. Select **Add user**.

    ![Select Add user](media/service-share-dashboards/power-bi-share-dataset-add-user.png)

1. Enter the full email addresses for individuals, distribution groups, or security groups. You can't share with dynamic distribution lists.

    ![Add email addresses](media/service-share-dashboards/power-bi-add-user-dataset.png)

1. Select **Add**.

## I can't share a dashboard or report

To share a dashboard or report, you need permission to reshare the underlying content; that is, any related reports and datasets. If you see a message saying you can't share, ask the report author to give you reshare permission for those reports and datasets.

!["Unable to share" message](media/service-share-dashboards/power-bi-sharing-unable-to-share.png)

## I don't have access to a dashboard or report

If you see a "Request access" message when you select the link to a report or dashboard, you don't have permission to view it. You need to [request access to it](service-request-access.md).

## Next steps

- [Share Power BI dashboards and reports with coworkers and others](service-share-dashboards.md)
- [How should I collaborate on and share dashboards and reports?](service-how-to-collaborate-distribute-dashboards-reports.md)
-  [Share a filtered Power BI report](service-share-reports.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
