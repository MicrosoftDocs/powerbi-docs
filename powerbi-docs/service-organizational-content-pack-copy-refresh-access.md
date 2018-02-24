---
title: 'Organizational content packs: Access and copy'
description: Read about creating copies of and troubleshooting access to organizational content packs in Power BI
services: powerbi
documentationcenter: ''
author: maggiesMSFT
manager: kfile
backup: ajayan
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/12/2017
ms.author: maggies

LocalizationGroup: Share your work
---
# Organizational content packs: Copy, refresh, and get access
> [!NOTE]
> Have you heard about the new *apps* yet? Apps are the new way to distribute content to large audiences in Power BI. You create apps in *app workspaces*, which replace groups and group workspaces. We recommend using apps instead of organizational content packs or read-only workspaces. Learn [more about apps](service-install-use-apps.md).
> 
> 

When an organizational content pack is published, all recipients see the same dashboard, reports, Excel workbooks, datasets, and data (unless it's a SQL Server Analysis Services (SSAS) data source).  [Only the content pack creator can edit and republish](service-organizational-content-pack-manage-update-delete.md) the content pack.  However, all recipients can save a copy of the content pack that can live alongside the original.

Creating content packs is different from sharing dashboards or collaborating on them in a group. Read [How should I collaborate on and share dashboards and reports?](service-how-to-collaborate-distribute-dashboards-reports.md) to decide on the best option for your situation.

## Create a copy of an organizational content pack
Create your own copy of the content pack, not visible to others.

1. Select the ellipsis (...) next to the content pack dashboard > Make a copy.
   
    ![](media/service-organizational-content-pack-copy-refresh-access/power-bi-create-copy-organizational-content-pack.png)
2. Select **Save**.  

Now you have a copy that you can change. Nobody else will see changes you make.

## Help!  I can no longer access the content pack
This can happen for several reasons:

* **Membership changes**:  Content packs are published to email distribution groups, security groups, and [Power BI groups based on Office 365](https://support.office.com/article/Create-a-group-in-Office-365-7124dc4c-1de9-40d4-b096-e8add19209e9).  If you are removed from the group, you will no longer have access to the content pack.
* **Distribution changes**: The content pack creator changes the distribution. For example, if the content pack was originally published to the entire organization but the creator republished it to a smaller audience, you may no longer be included.
* **Security settings changes**: If the dashboard and reports connect to on-premises SSAS data sources and changes are made to the security settings, your permissions to that server may be revoked.

## How are organizational content packs refreshed?
When the content pack is created, the refresh settings are inherited with the dataset.  When you create a copy of the content pack, the new version retains its link to the original dataset and its refresh schedule. 

See [Manage, update, and delete organizational content packs](service-organizational-content-pack-manage-update-delete.md).

## Next steps
* [Introduction to organizational content packs](service-organizational-content-pack-introduction.md)
* [Create a group in Power BI](service-create-distribute-apps.md)
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

