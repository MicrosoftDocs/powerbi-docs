---
title: Main sources for acquiring Power BI custom visuals
description: This article describes the main ways of acquiring Power BI custom visuals that you can use in your Power BI reports.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: overview
ms.date: 11/2/2024
LocalizationGroup: Visualizations
ms.custom: intro-overview, engagement-fy23
#customer intent: As a Power BI user, I want to learn about the different sources for acquiring custom visuals so that I can enhance my Power BI reports.
---

# What are custom visuals in Power BI and where can I get them?

[Power BI visuals](../../visuals/power-bi-report-visualizations.md) come from three main sources:

* [Core](#core-power-bi-visuals) visuals are readily available on the visualization pane.
* You can [download or import](#appsource-power-bi-visuals) visuals from Microsoft [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) or Power BI.
* You can create your own [custom visuals](#custom-visual-files).

## Core Power BI visuals

Power BI comes with many out-of-the box visuals. These Power BI visuals are available in the visualization pane of both [Power BI Desktop](https://powerbi.microsoft.com/desktop/) and [Power BI service](https://app.powerbi.com), and can be used for creating and editing Power BI content.

:::image type="content" source="media/power-bi-custom-visuals/power-bi-visualizations.png" alt-text="Screenshot of default the Power B I visualization pane as it appears in Power BI Desktop and Power B I service.":::

To remove a Power BI visual from the visualization pane, right-click it and select **unpin**.

To restore the default Power BI visuals in the visualization pane, select the ellipsis and then select **Restore default visuals**.

:::image type="content" source="media/power-bi-custom-visuals/restore-default.png" alt-text="Screenshot of the Power B I visualization pane restore default option.":::

## AppSource Power BI visuals

You can find many more Power BI visuals in [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals). AppSource is the place to find apps, add-ins, and extensions for your Microsoft software. It connects millions of people who use products such as Microsoft 365, Azure, Dynamics 365, Cortana, and Power BI, to solutions that help them work more efficiently and with more insight than before.

Microsoft and community members develop Power BI visuals for public benefit, and publish them to the AppSource. Microsoft tests and approves these Power BI visuals for functionality and quality. You can download these visuals and add them to your Power BI reports.

>[!NOTE]
>
> * By using Power BI visuals created with our SDK, you may be importing data from, or sending data to, a third party or other service outside of your Power BI tenant’s geographic area, compliance boundary, or national/regional cloud instance.
> * Once Power BI visuals from AppSource are imported, they may be updated automatically without any additional notice.

### Download from AppSource

Downloading visuals from AppSource is free, but each publisher defines their own business and licensing model for their visual. There are three basic types of payment and licensing plans:

* Free visuals that you can download and use without additional costs. These visuals are labeled as *Free*.

* Licensed visuals managed from the  [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview). These visuals are available in a limited capacity for free with the option to purchase more features. Transactability happens in [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) by clicking on the *Buy now* button.

* Visuals that you can download with basic functionality for free, but have additional features available for pay. These visuals have the *additional purchase may be required* label. You can often get a free trial period to test out the full functionality of the visual before paying for it. Transactability and license management for these visuals happen outside of Microsoft platforms.

Once you select the visual, select the **Plans + Pricing** tab to see the plan for that visual. Pricing information is also shown on the left pane.

:::image type="content" source="media/power-bi-custom-visuals/app-purchase-plans.png" alt-text="Screenshot showing a custom visual available for download with pricing information.":::

Select **Add** to download the visual. If a free trial period is offered, it will start when you download the visual.

After you *purchase* the licenses for the visual in AppSource with a credit card, you need to *assign* them to yourself or others in the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview).

For more information on how to assign licenses see [Licensing and transactability enforcement](licensing-api.md).

To see how licenses are enforced, see [custom visual licenses](./custom-visual-licenses.md)

[More questions about assigning and managing licenses?](./licensing-faq.yml)

### Certified Power BI visuals

Certified Power BI visuals are visuals in [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) that meet certain specified code requirements that the Microsoft Power BI team has tested and approved. The tests are designed to check that the visual doesn't access external services or resources.

To view the list of certified Power BI visuals, go to [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals).
To submit your own visual for certification, see [Certified Power BI visuals](power-bi-custom-visuals-certified.md).

### Sample reports for Power BI visuals

Each Power BI visual on AppSource has a sample report you can download that illustrates how the visual works. To download the sample report, in the [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) select a Power BI visual and select the **Download Sample** link.

## Organizational store

Power BI admins can approve and deploy Power BI custom visuals for their organization. Report authors can easily discover, update, and use these Power BI visuals. Admins can easily manage these visuals with actions such as updating versions, disabling and enabling Power BI visuals.

:::image type="content" source="media/power-bi-custom-visuals/download-sample-report.png" alt-text="Screenshot of the AppSource download sample report button.":::

To access the organizational store, in the *Visualization* pane select the ellipsis, then select **Get more visuals**.

:::image type="content" source="media/power-bi-custom-visuals/get-more.png" alt-text="Screenshot of the Power B I visualization pane get more visuals option.":::

When the *Power BI visuals* window appears, select the **My organization** tab.

[Read more about organizational visuals](power-bi-custom-visuals-organization.md).

## Custom visual files

You can also develop your own custom Power BI visual, to be used by you, your organization, or the entire Power BI community.

Power BI visuals come in **.pbiviz** file packages that include code for rendering the data served to them. Anyone can create a custom visual and package it as a **.pbiviz** file that can then be imported into a Power BI report.

To import a Power BI visual from a file, see [Import a visual file from your local computer into Power BI](import-visual.md#import-a-visual-file-from-your-local-computer-into-power-bi).

If you're a web developer and want to create your own visual and add it to AppSource, you can learn how to [develop a Power BI visual](develop-circle-card.md) and [publish a custom visual to AppSource](office-store.md).

> [!WARNING]
> A Power BI custom visual could contain code with security or privacy risks. Make sure you trust the author and source before importing it to your report.

For some examples of Power BI custom visuals available for downloading on github, see [Examples of Power BI visuals](./samples.md).

## Considerations and limitations

Licensed visuals aren't supported in the following environments. Therefore, if licensed visuals are used in these environments, Power BI can't tell the ISV if the user is licensed, nor will it block the visual.

* RS (report server) - no Microsoft Entra ID
* Sovereign or government clouds
* PaaS Power BI embedded App owns data
* Publish to web (P2W)

## Related content

* [Develop a Power BI circle card visual](develop-circle-card.md)
* [Power BI visuals project structure](visual-project-structure.md)
* [Guidelines for Power BI visuals](guidelines-powerbi-visuals.md)
* [Examples of Power BI visuals](./samples.md)

More questions? try the [Power BI Community](https://community.powerbi.com/)
