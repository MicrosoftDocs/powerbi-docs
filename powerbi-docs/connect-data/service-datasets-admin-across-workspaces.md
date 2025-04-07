---
title: Control the use of semantic models across workspaces - Power BI
description: Learn how to restrict the flow of information in the Power BI tenant.
author: paulinbar
ms.author: painbar
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 04/01/2024
LocalizationGroup: Share your work
---

# Control the use of semantic models across workspaces

Using semantic models across workspaces is a powerful way to drive data culture and data democratization within an organization. Still, if you're a Power BI admin, sometimes you want to restrict the flow of information within your Power BI tenant. With the tenant setting **Use semantic models across workspaces**, you can restrict semantic model reuse either completely or partially per security groups.

![Power BI admin workspace settings](media/service-datasets-admin-across-workspaces/power-bi-admin-workspace-settings.png)

Some of the effects of turning off this setting are listed below:

* The button to copy reports across workspaces isn't available. 
* In a report based on a shared semantic model, the **Edit report** button isn't available.
* In the Power BI service, the discovery experience only shows semantic models in the current workspace.
* In Power BI Desktop, the discovery experience only shows semantic models from workspaces where you're a member.
* In the Data hub, users see semantic models that were shared with them outside of the workspace, but they can't interact with them.
* In Power BI Desktop, if users open a *.pbix* file with a live connection to a semantic model outside any workspaces they are a member of, they see an error message asking them to connect to a different semantic model. See the "Limitations" section of [Download a report from the Power BI service to Power BI Desktop](../create-reports/service-export-to-pbix.md#limitations) for more information.

## Provide a link for the certification process

As a Power BI admin, you can provide a URL for the **Learn more** link on the **Endorsement** setting page.  See [Enable content certification](../admin/service-admin-setup-certification.md) for detail. This link can go to documentation about your certification process. If you don't provide a destination for the **Learn more** link, by default it points to the [Endorse your content](../collaborate-share/service-endorse-content.md) article.

![Semantic model certification Learn more](media/service-datasets-admin-across-workspaces/service-admin-certification-setup-dialog.png)

## Related content

- [Use semantic models across workspaces](service-datasets-across-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
