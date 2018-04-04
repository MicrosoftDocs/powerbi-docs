---
title: Using organization custom visuals in Power BI
description: Use, manage, and create organizational custom visuals in Power BI
services: powerbi
documentationcenter: ''
author: markingmyname
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 02/06/2018
ms.author: maghan

LocalizationGroup: Visualizations
---
# Using organization custom visuals in Power BI

You can use custom visuals in Power BI to create a unique type of visual that’s tailored to you, or the data insights you’re trying to convey. Often these custom visuals are created by developers, and they are often created when the multitude of visuals that are included in Power BI don’t quite meet their need. 

In some organizations, custom visuals are even more important – they might be necessary to convey specific data or insights unique to the organization, they may have special data requirements, or they may highlight private business methods. Such organizations need to develop custom visuals, share them throughout their organization, and make sure they’re properly maintained. Power BI custom visuals  lets organizations do just that.

The following image shows the process by which organization custom visuals in Power BI flows from administrator, through development and maintenance, all finally make their way to the data analyst.

![](media/power-bi-custom-visuals-organizational/custom-visual-org-01.jpg)

Organization visuals are deployed and managed by the Power BI administrator from the Admin portal. Once deployed into the organizational repository, users in the organization can easily discover them, and import the organizational custom visuals into their reports directly from Power BI Desktop.

## Using organizational custom visuals

To learn more about how to use organizational custom visuals in the reports that you created, see the following article: [Learn more about importing organizational visuals into your reports](power-bi-custom-visuals.md).
 
## Administering organizational custom visuals

To learn more about how to administer, deploy, and manage organizational custom visuals in your organization, see the following article: [Learn more about deployment and management of organization custom visuals](https://go.microsoft.com/fwlink/?linkid=866790).

> [!WARNING]
> A custom visual can contain code with security or privacy risks. Make sure you trust the author and the source of any custom visual before deploying it to the organization repository. 
> 

## Considerations and limitations
 
There are several considerations and limitations that you need to be aware of.
 
Admin:

* Legacy custom visuals (such as custom visuals that are not built on top of the new versioned APIs) are not supported

* If a custom visual is deleted from the repository, any existing reports that use the deleted visual will stop rendering. Deletion operation from the repository is not reversible. To temporarily disable a custom visual, use the "Disable" feature.
 
End user:

* Power BI Workspace Collection is not supported for organization visuals

* Visio visual, PowerApps visual, and the GlobeMap visual from AppSource marketplace will not render if deployed through the organization repository
