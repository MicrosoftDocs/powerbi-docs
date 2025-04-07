---
title: "View localized paginated reports in the Power BI service"
description: You can view paginated reports in your local or preferred language in the Power BI service.
author: nirusrin
ms.author: nisrinivasan
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 10/29/2024
---

# View localized paginated reports in the Power BI service

[!INCLUDE [applies-yes-service-yes-report-builder-no-desktop](../includes/applies-yes-service-no-report-builder-no-desktop.md)]

You can view paginated reports in your local or preferred language on the Power BI service. This guidance applies only to paginated reports with *Power BI semantic models* as a data source. There are prerequisites that you should follow to leverage this capability. 

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../includes/power-bi-paginated-prerequisites.md)]

Add translations to the Power BI semantic model: [Translation Builder documentation](https://go.microsoft.com/fwlink/?linkid=2239513) 

## Get started
In Power BI Report Builder, you can create a culture-sensitive report by adding the translated label measures to an RDL dataset. You can then reference the translated labels by specifying expressions such as **=First(Fields!Product_Sales_Report_Label.Value, "TranslatedLabelsDataSet")** .

You can publish a paginated RDL report from Power BI Report Builder and view the report in the Power BI service by setting the language in the browser.  

You can [create a paginated report in the Power BI service](web-authoring/paginated-formatted-table.md) and view the translated content on the service by setting the language in the browser settings, if your *Power BI semantic model contains the translations*.

Another way to view the translated version is to append the url with **"?language=de-DE".**

Here's the English **en-US** version of a sample report on the service:

:::image type="content" source="media/paginated-localization/paginated-sales-summary-english.png" alt-text="Screenshot of the report in en-US.":::

Here's the German **de-DE** version of the localized report on the service:

:::image type="content" source="media/paginated-localization/paginated-sales-summary-german.png" alt-text="Screenshot of report in de-DE.":::

## Considerations and limitations

When publishing/uploading a report from Power BI Report Builder

- You can overwrite the browser language by setting the **Report.Language** property to the desired language. For example, if **Report.Language = de-DE**, the report displays de-DE as long as the translations exist in the Power BI semantic model.
- When the **Report.Language** property is set to an expression, the browser or Power BI language settings are *not* overridden. For example, the **Report.Language** property is set to a report parameter (Example: **"=Parameters!SomeLanguageParameter"**).

## Next steps

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)
- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
