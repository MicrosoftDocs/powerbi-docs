---
title: Control the use of datasets across workspaces (preview) - Power BI
description: Learn how to restrict the flow of information in the Power BI tenant.
author: maggiesMSFT
manager: kfile
ms.reviewer: chbraun
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 03/25/2019
ms.author: maggies

LocalizationGroup: Share your work
---

# Control the use of datasets across workspaces

Using datasets across workspaces is a powerful way to drive data culture and data democratization within an organization. Still, sometimes Power BI admins want to restrict the flow of information with their Power BI tenant. With the tenant setting **Use datasets across workspaces**, they can restrict dataset reuse either completely or partially per security groups. 

If they do, then report creators can't produce new content within Power BI across different workspaces:

- When working in the service, the dataset discovery experience only shows datasets within the current workspace or datasets from workspaces where the user is a member.
- When working in Power BI Desktop, they can only publish reports to the workspace that also holds the dataset.
- The **Create Report** button is blocked for existing reference items.
- The **Make a copy** button is blocked for existing content packs.
- The **Save As** button is not available for reports that are based on a dataset in a different workspace.

![Power BI admin workspace settings](media/service-datasets-admin-across-workspaces/power-bi-admin-workspace-settings.png)

## Next steps

* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
