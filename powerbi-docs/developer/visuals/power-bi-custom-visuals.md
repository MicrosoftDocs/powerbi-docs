---
title: Finding Power BI visuals
description: This article describes the main ways of getting Power BI visuals.
author: mberdugo
ms.author: monaberdugo
manager: rkarlin
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: overview
ms.date: 05/14/2021
LocalizationGroup: Visualizations
ms.custom: intro-overview
---

# Where to find Power BI visuals

Power BI visuals can be obtained from three main sources:

* [Default](#default-power-bi-visuals) visuals are readily available on the visualization pane.
* Visuals [imported](#appsource-power-bi-visuals) from Microsoft [AppSource](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fappsource.microsoft.com%2Fen-us%2Fmarketplace%2Fapps%3Fpage%3D1%26product%3Dpower-bi-visuals&data=02%7C01%7CKesem.Sharabi%40microsoft.com%7C6d9286afacb3468d4cde08d740b76694%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637049028749147718&sdata=igWm0e1vXdgGcbyvngQBrHQVAkahPnxPC1ZhUPntGI8%3D&reserved=0) or Power BI.
* Create your own [custom visuals](#custom-visual-files).

## Default Power BI visuals

Power BI comes with many out-of-the box Power BI visuals. These visuals are available in the visualization pane of both [Power BI Desktop](https://powerbi.microsoft.com/desktop/) and [Power BI service](https://app.powerbi.com), and can be used for creating and editing Power BI content.

:::image type="content" source="media/power-bi-custom-visuals/power-bi-visualizations.png" alt-text="Screenshot of the Power B I visualization pane as it appears in Power B I Desktop and Power B I service.":::

To remove a Power BI visual from the visualization pane, right-click it and select **unpin**.

To restore the default Power BI visuals in the visualization pane, click the ellipsis and then select **Restore default visuals**.

:::image type="content" source="media/power-bi-custom-visuals/restore-default.png" alt-text="Screenshot of the Power B I visualization pane restore default option.":::

## AppSource Power BI visuals

Many additional Power BI visuals are available from the Microsoft [AppSource](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fappsource.microsoft.com%2Fen-us%2Fmarketplace%2Fapps%3Fpage%3D1%26product%3Dpower-bi-visuals&data=02%7C01%7CKesem.Sharabi%40microsoft.com%7C6d9286afacb3468d4cde08d740b76694%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637049028749147718&sdata=igWm0e1vXdgGcbyvngQBrHQVAkahPnxPC1ZhUPntGI8%3D&reserved=0) or through Power BI. These visuals are created by Microsoft and Microsoft partners, and are tested and validated by the AppSource validation team.

Microsoft and community members contribute Power BI visuals for public benefit, and publish them to the [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals). Microsoft has tested and approved these Power BI visuals for functionality and quality. You can download these visuals and add them to your Power BI reports.

>[!NOTE]
>
> * By using Power BI visuals created with our SDK, you may be importing data from, or sending data to, third party or other services located outside of your Power BI tenant’s geographic area, compliance boundary, or national cloud instance.
> * Power BI certified visuals are visuals in the AppSource that were additionally tested to check that the visual does not access external services or resources.
> * Once Power BI visuals from AppSource are imported, visuals may be updated automatically without any additional notice.

### What is AppSource?

[AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) is the place for apps, add-ins, and extensions for your Microsoft software. AppSource connects millions of users of products such as Microsoft 365, Azure, Dynamics 365, Cortana, and Power BI, to solutions that help them get work done more efficiently and insightfully than before.

### Certified Power BI visuals

Certified Power BI visuals are visuals in [AppSource](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fappsource.microsoft.com%2Fen-us%2Fmarketplace%2Fapps%3Fpage%3D1%26product%3Dpower-bi-visuals&data=02%7C01%7CKesem.Sharabi%40microsoft.com%7C6d9286afacb3468d4cde08d740b76694%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637049028749147718&sdata=igWm0e1vXdgGcbyvngQBrHQVAkahPnxPC1ZhUPntGI8%3D&reserved=0) that meet certain specified code requirements that the Microsoft Power BI team has tested and approved. The tests are designed to check that the visual doesn't access external services or resources.

To view the list of certified Power BI visuals, or to submit your own, see [Certified Power BI visuals](power-bi-custom-visuals-certified.md).

### Samples for Power BI visuals

Each Power BI visual on AppSource has a data sample that illustrates how the visual works. To download the sample, in the [AppSource](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fappsource.microsoft.com%2Fen-us%2Fmarketplace%2Fapps%3Fpage%3D1%26product%3Dpower-bi-visuals&data=02%7C01%7CKesem.Sharabi%40microsoft.com%7C6d9286afacb3468d4cde08d740b76694%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637049028749147718&sdata=igWm0e1vXdgGcbyvngQBrHQVAkahPnxPC1ZhUPntGI8%3D&reserved=0) select a Power BI visual and from the *Try a sample* section, click the **sample report** link.

## Organizational store

Power BI admins approve and deploy Power BI visuals into their organization. This allows report authors to easily discover, update, and use these Power BI visuals. Admins can easily manage these visuals with actions such as updating versions, disabling and enabling Power BI visuals.

To access the organizational store, in the *Visualization* pane click the ellipsis, then select **Get more visuals**.

:::image type="content" source="media/power-bi-custom-visuals/get-more.png" alt-text="Screenshot of the Power B I visualization pane get more visuals option.":::

When the *Power BI visuals* window appears, select the **My organization** tab.

[Read more about organizational visuals](power-bi-custom-visuals-organization.md).

## Custom visual files

You can also develop your own Power BI visual, to be used by you, your organization, or the entire Power BI community.

Power BI visuals are packages that include code for rendering the data served to them. Anyone can create a custom visual and package it as a single `.pbiviz` file, that can then be imported into a Power BI report.

To import a Power BI visual from a file, see [Import a visual file from your local computer into Power BI](import-visual.md#import-a-visual-file-from-your-local-computer-into-power-bi).

If you are a web developer and are interested in creating your own visual and adding it to AppSource, you can learn how to [develop a Power BI circle card visual](develop-circle-card.md) and [publish a Power BI visual to AppSource](office-store.md).

> [!WARNING]
> A Power BI visual could contain code with security or privacy risks. Make sure you trust the author and Power BI visual source before importing it to your report.

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
