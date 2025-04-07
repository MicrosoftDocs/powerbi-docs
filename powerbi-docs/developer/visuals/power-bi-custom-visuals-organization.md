---
title: Organization visuals in Power BI
description: Learn about the considerations and limitations that apply when you develop organizational visuals in Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 2/27/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI admin, I want to learn how to deploy and manage organizational visuals so that I can meet the unique needs of my organization.
---

# Power BI organizational visuals

You can develop your own custom Power BI visuals tailored to your own or your organization's specific needs. Usually, organizations develop their own custom visuals when none of the visuals included with Power BI meet their exact needs.

Some organizations might have unique requirements for their Power BI visuals. They might need visuals that can convey specific data or insights unique to their organization. They might have special data requirements, or they might highlight private business methods. These organizations can develop and maintain their own Power BI visuals that they can share throughout their organization.

The Power BI administrator uses the Admin portal to deploy and manage organizational visuals. After the visuals are deployed to the organizational repository, users in the organization can easily discover and import them into their reports directly from Power BI Desktop.

:::image type="content" source="media/power-bi-custom-visuals-organizational/custom-visual-org-01.jpg" alt-text="Diagram that shows the Power BI workflow for visuals.":::

## Administer organizational Power BI visuals

To learn more about how to administer, deploy, and manage organizational Power BI visuals, see [manage Power BI visuals admin settings](../../admin/organizational-visuals.md).

> [!WARNING]
> A Power BI visual installed from a file can contain code with security or privacy risks. Make sure that you trust the author and the source of the Power BI visual file before deploying it to the organization repository.

## Considerations and limitations

Be aware of the following [admin](#admin-considerations) and [user](#user-considerations) considerations when using custom Power BI visuals in your organization.

### Admin considerations

- If a Power BI visual from AppSource or a file is deleted from the repository, any reports that use the deleted visual will stop rendering. Deleting from the repository isn't reversible. To temporarily disable a Power BI visual from AppSource or a file, use the **Disable** feature.
- If you remove a visual from AppSource, the visual will continue to render as it did before, as long as it's not removed from the repository.

### User considerations

- Organizational Power BI visuals can't be [exported to PowerPoint](../../collaborate-share/end-user-powerpoint.md) or displayed in emails received when a user [subscribes to report pages](/power-bi/collaborate-share/end-user-subscribe). Only [certified Power BI visuals](power-bi-custom-visuals-certified.md) imported directly from the marketplace support these features.
- Organizational Power BI visuals aren't supported in Power BI report server.
- Certain visuals won't render if deployed through the organization's repository. Use the **Add from AppSource** option in the Admin portal to manage the following visuals:

  - Visio
  - Mapbox
  - Power Automate
  - Charticulator

## Related content

- [Get a Power BI visual certified](power-bi-custom-visuals-certified.md)
- [Publish Power BI visuals to Partner Center](office-store.md)
- [Frequently asked questions about Power BI visuals](./power-bi-custom-visuals-faq.yml)

More questions? [Try the Power BI Community](https://community.powerbi.com/)