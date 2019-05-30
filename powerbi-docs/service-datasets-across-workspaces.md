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

Business intelligence is a collaborative activity. Learn how members of your organization can share datasets with report creators across your organization. Then they can build reports based on those datasets in their own workspaces.

It's important to establish standardized datasets that can be the 'one source of truth.' Discovering and reusing existing datasets is key. When expert data modelers in your organization create and share optimized datasets, report creators can start with those datasets to build accurate reports. The organization has consistent data for decisions and a healthy data culture.

Power BI makes it easy for dataset owners to certify or promote datasets so others can discover them. Then report authors to find quality, official datasets they can use wherever they are in Power BI. As a dataset owner, you can keep control of who has access to the data by using the [Build permission](service-datasets-build-permissions.md). Tenant administrators have a new tenant setting to [govern the use of datasets across workspaces](service-datasets-admin-across-workspaces.md).

## Copy a report
from a workspace or from an app
consumers can start their own exploration of data, don't have to start from scratch, use what someone else built.

## Promotion and certification

If you create datasets, you can make it easier for others to discover them by [promoting your datasets](service-datasets-promote.md).

## Dataset sharing and the new workspace experience

Building reports based on datasets in different workspaces and copying reports to different workspaces are tightly coupled with the new workspace experience:
- In the service, the Dataset Catalog only shows datasets that are in Personal or Modern Workspaces; also, when opened in a Classic Workspace the catalog only shows datasets within that workspace, not from different workspaces
- In the Desktop, Live Connect reports can be published to different workspaces as long as their datasets are in Modern Workspaces
- When copying reports across workspaces, the target workspace needs to be a Modern Workspace.


## Discover datasets (Preview)

When building a report on top of an existing dataset, the first step is to connect to the dataset, either in the Power service or Power BI Desktop. Read about [discovering datasets from different workspaces (Preview)](service-datasets-discover-across-workspaces.md)

## Build permission for datasets

With the Build permission type, you can allow others in your organization to build new content, such as reports, dashboards, and pinned tiles from Q&A, on an existing dataset. They can also build new content on the dataset outside Power BI, such as Excel sheets via Analyze in Excel, XMLA, and export. Read more about [Build permissions for shared datasets (Preview)](service-datasets-build-permissions.md).

## Considerations and limitations

- Building a report on top of a dataset in a different workspace requires the new workspace experience at both ends: the report needs to be in a new workspace experience and the dataset needs to be in a new workspace experience.
- In a classic workspace, the dataset discovery experience only shows the datasets in that workspace.
- You can create reports in app workspaces that are based on datasets in a different workspace. However, you can't create an app for a workspace that contains those datasets.
- Free users in Desktop only see datasets from My Workspace and from Premium-based workspaces.
- If a dataset is being used by a report outside of the dataset workspace, you can't delete that dataset. Instead, you see an error message.
- If you want to add a report to an app where the report is based on a shared dataset, you have to be a member of the dataset's workspace. This is a known issue.
- “Publish to web” doesn’t work for a report based on a shared dataset. This is by design.


## Next steps

- [Promote datasets](service-datasets-promote.md)
- [Certify datasets](service-datasets-certify.md)
- [Govern the use of datasets across workspaces](service-datasets-admin-across-workspaces.md)
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
