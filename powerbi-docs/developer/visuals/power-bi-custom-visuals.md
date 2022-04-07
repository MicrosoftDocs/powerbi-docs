---
title: Main sources for acquiring Power BI visuals
description: This article describes the main ways of getting Power BI visuals.
author: mberdugo
ms.author: monaberdugo
manager: rkarlin
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: overview
ms.date: 04/07/2022
LocalizationGroup: Visualizations
ms.custom: intro-overview
---

# What are Power BI custom visuals and where can I get them?

[Power BI visuals](../../visuals/power-bi-report-visualizations.md) come from three main sources:

* [Default](#default-power-bi-visuals) visuals are readily available on the visualization pane.
* You can [download or import](#appsource-power-bi-visuals) visuals from Microsoft [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) or Power BI.
* You can create your own [custom visuals](#custom-visual-files).

## Default Power BI visuals

Power BI comes with many out-of-the box visuals. These Power BI visuals are available in the visualization pane of both [Power BI Desktop](https://powerbi.microsoft.com/desktop/) and [Power BI service](https://app.powerbi.com), and can be used for creating and editing Power BI content.

:::image type="content" source="media/power-bi-custom-visuals/power-bi-visualizations.png" alt-text="Screenshot of the Power B I visualization pane as it appears in Power B I Desktop and Power B I service.":::

To remove a Power BI visual from the visualization pane, right-click it and select **unpin**.

To restore the default Power BI visuals in the visualization pane, select the ellipsis and then select **Restore default visuals**.

:::image type="content" source="media/power-bi-custom-visuals/restore-default.png" alt-text="Screenshot of the Power B I visualization pane restore default option.":::

## AppSource Power BI visuals

Many more Power BI visuals are available from the Microsoft [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) or through Power BI. These visuals are created by Microsoft and Microsoft partners. They're tested and validated by the AppSource validation team.

Microsoft and community members contribute Power BI visuals for public benefit, and publish them to the [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals). Microsoft has tested and approved these Power BI visuals for functionality and quality. You can download these visuals and add them to your Power BI reports.

>[!NOTE]
>
> * By using Power BI visuals created with our SDK, you may be importing data from, or sending data to, a third party or other service outside of your Power BI tenant’s geographic area, compliance boundary, or national cloud instance.
> * Once Power BI visuals from AppSource are imported, they may be updated automatically without any additional notice.

### What is AppSource?

[AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) is the place for apps, add-ins, and extensions for your Microsoft software. AppSource connects millions of people who use products such as Microsoft 365, Azure, Dynamics 365, Cortana, and Power BI, to solutions that help them get work done more efficiently and with more insight than before.

Today, both transactability and license management of existing licensed visuals take place outside of AppSource. Each publisher defines their own business and licensing model for their visual. For example, pricing, per-user license vs site license. Once you select the visual, you’ll see a **Plans + Pricing** tab (if it costs money) and a **Details + support** tab for the license information.

### Certified Power BI visuals

Certified Power BI visuals are visuals in [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) that meet certain specified code requirements that the Microsoft Power BI team has tested and approved. The tests are designed to check that the visual doesn't access external services or resources.

To view the list of certified Power BI visuals, or to submit your own, see [Certified Power BI visuals](power-bi-custom-visuals-certified.md).

### Samples for Power BI visuals

Each Power BI visual on AppSource has a sample report you can download that illustrates how the visual works. To download the sample report, in the [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) select a Power BI visual and select the **Download Sample** link.

## Organizational store

Power BI admins can approve and deploy Power BI custom visuals for their organization. Report authors can easily discover, update, and use these Power BI visuals. Admins can easily manage these visuals with actions such as updating versions, disabling and enabling Power BI visuals.

To access the organizational store, in the *Visualization* pane select the ellipsis, then select **Get more visuals**.

:::image type="content" source="media/power-bi-custom-visuals/get-more.png" alt-text="Screenshot of the Power B I visualization pane get more visuals option.":::

When the *Power BI visuals* window appears, select the **My organization** tab.

[Read more about organizational visuals](power-bi-custom-visuals-organization.md).

## Custom visual files

You can also develop your own Power BI visual, to be used by you, your organization, or the entire Power BI community.

Power BI visuals are packages that include code for rendering the data served to them. Anyone can create a custom visual and package it as a single `.pbiviz` file, that can then be imported into a Power BI report.

To import a Power BI visual from a file, see [Import a visual file from your local computer into Power BI](import-visual.md#import-a-visual-file-from-your-local-computer-into-power-bi).

If you're a web developer and want to create your own visual and add it to AppSource, you can learn how to [develop a Power BI visual](develop-circle-card.md) and [publish a custom visual to AppSource](office-store.md).

> [!WARNING]
> A Power BI custom visual could contain code with security or privacy risks. Make sure you trust the author and source before importing it to your report.

## Next steps

>[!div class="nextstepaction"]
>[Develop a Power BI circle card visual](develop-circle-card.md)

>[!div class="nextstepaction"]
>[Power BI visuals project structure](visual-project-structure.md)

>[!div class="nextstepaction"]
>[Guidelines for Power BI visuals](guidelines-powerbi-visuals.md)

>[!div class="nextstepaction"]
>[Frequently asked questions](power-bi-custom-visuals-faq.yml)

>[!div class="nextstepaction"]
>[Power BI Community](https://community.powerbi.com/)
