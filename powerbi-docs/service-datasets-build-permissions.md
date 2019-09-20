---
title: Build permission for shared datasets (preview)
description: Learn how you can keep control of who has access to the data by using the Build permission.
author: maggiesMSFT
manager: kfile
ms.reviewer: chbraun
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 09/19/2019
ms.author: maggies

LocalizationGroup: Share your work
---
# Build permission for shared datasets (preview)

As a creator of *data models* in Power BI Desktop, you can share them as *datasets* in the Power BI service. Then report creators can easily discover and reuse the datasets you've shared. Learn how you control who has access to the data by using the Build permission.

The Build permission type is only relevant for datasets. With it, users can build new content on a dataset, such as reports, dashboards, pinned tiles from Q&A, and Insights Discovery. They can also build new content on the dataset outside Power BI, such as Excel sheets via Analyze in Excel, XMLA, and export underlying data.

Users get Build permission in different ways:

- If you're a member of a workspace with at least a Contributor role, you automatically have Build permission for a dataset, and permission to copy a report.
 
- A member of the workspace where the dataset resides can assign the permission to specific users or security groups in the Permission center. Select the ellipsis (…) next to a dataset > **Manage Permissions**.

    ![Select the ellipsis](media/service-datasets-build-permissions/power-bi-dataset-manage-permissions.png)

    That opens the Permission center for that dataset, where you can set and change permissions.

    ![Permission center](media/service-datasets-build-permissions/power-bi-dataset-permissions.png)

- An admin or member of the workspace where the dataset resides can decide during app publishing that users with permission for the app also get Build permission for the underlying datasets. See [Steps to sharing your dataset](#steps-to-sharing-your-dataset) in this article for details.

- Say you have Reshare and Build permissions on a dataset. When you share a report or dashboard built on top of that dataset you can specify that the recipients also get Build permission for the underlying dataset.

    ![Build permissions](media/service-datasets-build-permissions/power-bi-share-report-allow-users.png)

You can remove a person's Build permissions for a dataset. If you do, they can still see the report built on the shared dataset, but they can no longer edit it.

## More granular permissions

Power BI introduced the Build permission in June 2019 as a complement to the existing permissions, Read and Reshare. All users who already had Read permission for datasets via app permissions, sharing, or workspace access at that time also got Build permissions for those same datasets. They got Build permission automatically because Read permission already granted them the right to build new content on top of the dataset, by using Analyze in Excel or Export.

With this more granular Build permission, you can choose who can only view the content in the existing report or dashboard and who can create content connected to the underlying datasets.

If your dataset is being used by a report outside the dataset workspace, you can't delete that dataset. Instead, you see an error message.

You can remove build permissions. If you do, the people whose permissions you have revoked can still see the report, but can no longer edit the report or export underlying data. Users with only read permission can still export summarized data. 

## Next steps

- [Use datasets across workspaces (Preview)](service-datasets-across-workspaces.md)
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
