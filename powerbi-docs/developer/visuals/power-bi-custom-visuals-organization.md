---
title: Organization visuals in Power BI
description: Use, manage, and create organizational visuals in Power BI.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 12/11/2018
LocalizationGroup: Visualizations
---

# Organizational visuals in Power BI

You can use Power BI visuals in Power BI to create a unique type of visual that's tailored to you. Power BI visuals are created by developers, and they're often created when the multitude of visuals that are included in Power BI don't quite meet their need.

In some organizations, Power BI visuals are even more important – they might be necessary to convey specific data or insights unique to the organization, they may have special data requirements, or they may highlight private business methods. Such organizations need to develop Power BI visuals, share them throughout their organization, and make sure they're properly maintained. Power BI visuals  lets organizations do just that.

The following image shows the process by which organization Power BI visuals in Power BI flow from administrator, through development and maintenance, all finally make their way to the data analyst.

![Custom visual pic](media/power-bi-custom-visuals-organizational/custom-visual-org-01.jpg)

Organizational visuals are deployed and managed by the Power BI administrator from the Admin portal. Once deployed into the organizational repository, users in the organization can easily discover them, and import the organizational Power BI visuals into their reports directly from Power BI Desktop.

To learn more about how to use organizational Power BI visuals in the reports that you created, see the following article: [Learn more about importing organizational visuals into your reports](power-bi-custom-visuals.md).

## Administer organizational Power BI visuals

To learn more about how to administer, deploy, and manage organizational Power BI visuals in your organization, see the following article: [Learn more about deployment and management of organization Power BI visuals](../../admin/organizational-visuals.md).

> [!WARNING]
> A Power BI visual installed from a file, can contain code with security or privacy risks. Make sure you trust the author and the source of the Power BI visual file, before deploying it to the organization repository.

## Considerations and limitations

There are several considerations and limitations that you need to be aware of.

Admin:

* If a Power BI visual from AppSource or a file is deleted from the repository, any existing reports that use the deleted visual will stop rendering. Deleting from the repository isn't reversible. To temporarily disable a Power BI visual from AppSource or a file, use the "Disable" feature.

* Organizational Power BI visuals are not supported in Power BI report server.

End user:

* Organizational Power BI visuals are private visuals imported from the organization repository. As any private visual they can't be [exported to PowerPoint](../../consumer/end-user-powerpoint.md) or displayed in emails received when a user [subscribes to report pages](../../consumer/end-user-subscribe.md). Only [certified Power BI visuals](power-bi-custom-visuals-certified.md) imported directly from the marketplace supports these features.

* Certain visuals don't render if deployed through the organization repository. Use the **Add from AppSource** option in the Admin portal to manage the following visuals:
  - Viso
  - Map box
  - PowerAutomate
  - Charticulator

## Troubleshoot

For information about troubleshooting, visit [Troubleshooting your Power BI visuals](power-bi-custom-visuals-troubleshoot.md).

## FAQ

For more information and answers to questions, visit [Frequently asked questions about Power BI visuals](power-bi-custom-visuals-faq.yml#organizational-power-bi-visuals).

More questions? [Try the Power BI Community](https://community.powerbi.com/).