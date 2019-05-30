---
title: Use datasets across workspaces (Preview) - Power BI
description: Learn how you can share a dataset with users across the organization. Then they can build reports based on your dataset in their own workspaces.
author: maggiesMSFT
manager: kfile
ms.reviewer: chbraun
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/29/2019
ms.author: maggies

LocalizationGroup: Share your work
---
# Use datasets across workspaces (Preview)

Learn how you can share a dataset with users across your organization. Then they can build reports based on your dataset in their own workspaces.

Business intelligence is a collaborative activity. It's important to establish standardized datasets that can be the 'one source of truth.' Discovering and reusing existing datasets is key. When expert data modelers in your organization can create and share optimized datasets, report creators can start with those datasets to build accurate reports. The organization has consistent data for decisions and a healthy data culture.

Power BI makes it easy for report authors to find quality, official datasets they can use wherever they are in Power BI. As a dataset owner, you can certify or promote your datasets so others can discover them easily. You can keep control of who has access to the data by using the [Build permission](#build-permission-for-datasets). You can also make it easier to discover your dataset by [endorsing your dataset](service-datasets-promote.md). Tenant administrators have a new tenant setting to [govern the use of datasets across workspaces](service-datasets-admin-across-workspaces.md).

## Discover datasets (Preview)

When building a report on top of an existing dataset, the first step is to connect to the dataset, either in the Power service or Power BI Desktop. Read more about [Discovering datasets from different workspaces (Preview)](service-datasets-discover-across-workspaces.md)

## Build permission for datasets

The Build permission type is only relevant for datasets. With it, users can build new content on a dataset, such as reports, dashboards, pinned tiles from Q&A, and Insights Discovery. They can also build new content on the dataset outside Power BI, such as Excel sheets via Analyze in Excel, XMLA, and export. Read more about [Build permissions for shared datasets (Preview)](service-datasets-build-permissions.md)

## Considerations and limitations

- Building a report on top of a dataset in a different workspace requires the new workspace experience at both ends: the report needs to be in the new workspace experience and the dataset needs to be in the new workspace experience.
- In a classic workspace, the dataset discovery experience only shows the datasets in that workspace.
- You can create reports in app workspaces that are based on datasets in a different workspace. However, you can't create an app for a workspace that contains those datasets.
- Free users in Desktop only see datasets from My Workspace and from Premium-based workspaces.
- If a dataset is being used by a report outside of the dataset workspace, you can't delete that dataset. Instead, you see an error message.

## Next steps

- [Promote datasets](service-datasets-promote.md)
- [Certify datasets](service-datasets-certify.md)
- [Govern the use of datasets across workspaces](service-datasets-admin-across-workspaces.md)
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
