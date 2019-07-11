---
title: Organization custom visuals in Power BI
description: Use, manage, and create organizational custom visuals in Power BI
author: sranins
ms.author: rasala
manager: kfile
ms.reviewer: maghan
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 12/11/2018
LocalizationGroup: Visualizations
---

# Organizational custom visuals in Power BI

You can use custom visuals in Power BI to create a unique type of visual that’s tailored to you. Custom visuals are created by developers, and they're often created when the multitude of visuals that are included in Power BI don’t quite meet their need.

In some organizations, custom visuals are even more important – they might be necessary to convey specific data or insights unique to the organization, they may have special data requirements, or they may highlight private business methods. Such organizations need to develop custom visuals, share them throughout their organization, and make sure they’re properly maintained. Power BI custom visuals  lets organizations do just that.

The following image shows the process by which organization custom visuals in Power BI flow from administrator, through development and maintenance, all finally make their way to the data analyst.

![Custom visual pic](media/power-bi-custom-visuals-organizational/custom-visual-org-01.jpg)

Organizational visuals are deployed and managed by the Power BI administrator from the Admin portal. Once deployed into the organizational repository, users in the organization can easily discover them, and import the organizational custom visuals into their reports directly from Power BI Desktop.

To learn more about how to use organizational custom visuals in the reports that you created, see the following article: [Learn more about importing organizational visuals into your reports](power-bi-custom-visuals.md).

## Administer organizational custom visuals

To learn more about how to administer, deploy, and manage organizational custom visuals in your organization, see the following article: [Learn more about deployment and management of organization custom visuals](https://go.microsoft.com/fwlink/?linkid=866790).

> [!WARNING]
> A custom visual can contain code with security or privacy risks. Make sure you trust the author and the source of any custom visual before deploying it to the organization repository.

## Considerations and limitations

There are several considerations and limitations that you need to be aware of.

Admin:

* Legacy custom visuals (such as custom visuals that aren't built on top of the new versioned APIs) aren't supported

* If a custom visual is deleted from the repository, any existing reports that use the deleted visual will stop rendering. Deletion operation from the repository isn't reversible. To temporarily disable a custom visual, use the "Disable" feature.

End user:

* Organizational custom visuals are private visuals imported from the organization repository. As any private visual they can't be [exported to PowerPoint](https://docs.microsoft.com/power-bi/consumer/end-user-powerpoint) or displayed in emails received when a user [subscribes to report pages](https://docs.microsoft.com/power-bi/consumer/end-user-subscribe). Only [certified custom visuals](https://docs.microsoft.com/power-bi/power-bi-custom-visuals-certified) imported directly from the marketplace supports these features.

* Visio visual, PowerApps visual, the Map box visual, and the GlobeMap visual from AppSource marketplace don't render if deployed through the organization repository.

## Troubleshoot

For information about troubleshooting, visit [Troubleshooting your Power BI custom visuals](power-bi-custom-visuals-troubleshoot.md).

## FAQ

For more information and answers to questions, visit [Frequently asked questions about Power BI custom visuals](power-bi-custom-visuals-faq.md#organizational-custom-visuals).

More questions? [Try the Power BI Community](http://community.powerbi.com/).
