---
title: Create and share datasets (Preview) - Power BI
description: As a dataset owner, you can create and share your datasets so others can use them. Learn how you can keep control of who has access to the data by using the Build permission.
author: maggiesMSFT
manager: kfile
ms.reviewer: chbraun
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/30/2019
ms.author: maggies

LocalizationGroup: Share your work
---
# Create and share datasets (Preview)

As a dataset creator, you can create datasets that others can discover and reuse them easily. Learn how you can  keep control of who has access to the data by using the Build permission.

Maggie:
If you delete the dataset, you get the error message
Can remove build permissions – I can look at the report, I still have read perms, but I can’t edit the report. 
What about if you try to edit it in Desktop?

## Steps to sharing your dataset

1. You create a .pbix file with a data model in Power BI Desktop. If you're planning to offer this dataset for others to build reports, you may not even design a report in the .pbix file.

    A best practice is to save the .pbix file to an Office 365 group.

1. Publish the .pbix file to a new experience workspace in the Power BI service.
    
    Already, others can create reports in other workspaces based on this dataset.

1. Now you can create an app from this workspace. When you do, you can specify permissions for the app recipients.
 


## Build permissions for shared datasets

The Build permission type is only relevant for datasets. With it, users can build new content on a dataset, such as reports, dashboards, pinned tiles from Q&A, and Insights Discovery. They can also build new content on the dataset outside Power BI, such as Excel sheets via Analyze in Excel, XMLA, and export.

Users can get the permission in different ways:

- A member of the workspace where the dataset resides can assign the permission to specific users or security groups in the Permission Center. Click the ellipsis (…) next to a dataset > **Manage Permissions**.
- An admin or member of the workspace where the dataset resides can decide during app publishing that users with permission for the app also get Build permission for the underlying datasets.
    > [!NOTE]
    > If you publish the app to **Entire organization**, then no one in the organization will have Build permissions. You need to specify email addresses in **Specific individuals or groups** I f you want the entire organization to have Build permissions, you need to specify an email alias for the entire organization.
- Say you have Reshare and Build permissions on a dataset. When you share a report or dashboard built on top of that dataset you can specify that the recipients also get Build permission for the underlying dataset.

![Build permissions](media/service-datasets-build-permissions/power-bi-share-report-allow-users.png)

## More granular permissions

Power BI introduced the Build permission in June 2019 as a complement to the existing permissions, Read and Reshare. All users who already had Read permission for datasets via app permissions, sharing, or workspace access at that time also got Build permissions for those same datasets. They got Build permission automatically because Read permission already granted them the right to build new content on top of the dataset, by using Analyze in Excel or Export.

With this more granular Build permission, you can choose who can only view the content in the existing report or dashboard and who can create content connected to the underlying datasets.

## Track your dataset usage



## Next steps

- [Promote datasets](service-datasets-promote.md)
- [Certify datasets](service-datasets-certify.md)
- [Govern the use of datasets across workspaces](service-datasets-admin-across-workspaces.md)
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
