---
title: Control the use of datasets across workspaces - Power BI
description: Learn how to restrict the flow of information in the Power BI tenant.
author: paulinbar
ms.author: painbar
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 08/22/2022
LocalizationGroup: Share your work
---

# Control the use of datasets across workspaces

Using datasets across workspaces is a powerful way to drive data culture and data democratization within an organization. Still, if you're a Power BI admin, sometimes you want to restrict the flow of information within your Power BI tenant. With the tenant setting **Use datasets across workspaces**, you can restrict dataset reuse either completely or partially per security groups.

![Power BI admin workspace settings](media/service-datasets-admin-across-workspaces/power-bi-admin-workspace-settings.png)

Some of the effects of turning off this setting are listed below:

* The button to copy reports across workspaces isn't available. 
* In a report based on a shared dataset, the **Edit report** button isn't available.
* In the Power BI service, the discovery experience only shows datasets in the current workspace.
* In Power BI Desktop, the discovery experience only shows datasets from workspaces where you're a member.
* In the Data hub, users see datasets that were shared with them outside of the workspace, but they can't interact with them.
* In Power BI Desktop, if users open a *.pbix* file with a live connection to a dataset outside any workspaces they are a member of, they see an error message asking them to connect to a different dataset.

## Provide a link for the certification process

As a Power BI admin, you can provide a URL for the **Learn more** link on the **Endorsement** setting page.  See [Enable content certification](../admin/service-admin-setup-certification.md) for detail. This link can go to documentation about your certification process. If you don't provide a destination for the **Learn more** link, by default it points to the [Endorse your content](../collaborate-share/service-endorse-content.md) article.

![Dataset certification Learn more](media/service-datasets-admin-across-workspaces/service-admin-certification-setup-dialog.png)

## Next steps

- [Use datasets across workspaces](service-datasets-across-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
