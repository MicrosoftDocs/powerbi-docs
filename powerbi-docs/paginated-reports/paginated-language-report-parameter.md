---
title: "View culture-sensitive reports with a URL parameter in Power BI paginated reports"
description: Set the language locale for a Power BI paginated report created from a Power BI dataset.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 05/31/2023
---

# View culture-sensitive reports with a URL parameter in Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)]

Paginated reports utilize data translations in Power BI datasets based on [tabular models with multiple translations](/analysis-services/tabular-models/translations-in-tabular-models-analysis-services) for names or descriptions.

If the Report.Language property is set in the paginated report RDL file, then that language is used for the translations. If not, then the report uses the browser's culture info.

When you're testing out this feature, you can override the browser culture info by supplying the URL language parameter. However, usually the browser's culture info determines the language.

Consider the following situation:

You're a report author, and you've created a paginated report with a Power BI dataset as the source data and an unspecified [Language property](/sql/reporting-services/report-design/set-the-locale-for-a-report-or-text-box-reporting-services) set in Power BI Report Builder.

After you publish the report to the Power BI service, you can preview the locale in other languages, for example, Italian and German. You preview by adding the Language parameter to the end of the URL, preceded by a question mark and followed by an equal sign and the country code, like this:

```
?Language=de-DE
```

:::image type="content" source="media/paginated-language-report-parameter/paginated-language-code-de-de-url.png" alt-text="Adding the German de-de code.":::

The result is the report in German.

:::image type="content" source="media/paginated-language-report-parameter/paginated-report-german.png" alt-text="report in German.":::

You can also view the report in Italian by using the Italian code:

```
?Language=it-IT
```

:::image type="content" source="media/paginated-language-report-parameter/paginated-report-italian.png" alt-text="report in Italian.":::

Using the Language parameter makes it easy for report authors validate multiple culture-sensitive languages in paginated reports that are built on a Power BI dataset.

## Next steps

[View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md).

More questions? [Try the Power BI Community.](https://community.powerbi.com/)
