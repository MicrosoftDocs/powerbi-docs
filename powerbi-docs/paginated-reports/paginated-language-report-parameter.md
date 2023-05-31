---
title: "Check culture-sensitive reports with a URL parameter in Power BI paginated reports"
description: Set the language locale for a Power BI paginated report created from a Power BI dataset.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 05/30/2023
---

# Check culture-sensitive reports with a URL parameter in Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

The Language URL access parameter provides a way to check culture-sensitive paginated reports without having to change browser or operating system settings for reports with multiple culture-sensitive consumers.

Consider the following authoring situation:

You're a report author, and you just created a paginated report with a Power BI dataset as the source data and an unspecified [Language property](sql/reporting-services/report-design/set-the-locale-for-a-report-or-text-box-reporting-services) set in Power BI Report Builder. The Language property on a paginated report contains the locale setting, which determines the default formats for displaying report data that differ by language and region.

> [!NOTE]
> If no value is specified for Language, the paginated report uses the locale of the operating system in the Power BI service for published reports.

After you publish the report to the Power BI service, you can preview the locale in two other languages, Italian and German. You preview by adding the Language parameter to the URL.

You add the Language parameter to the end of the URL, preceded by a question mark and followed by an equal sign and the country code, like this:

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

## Considerations and limitations

- Using the Language URL access parameter can validate up to three culture-sensitive languages.

## Next steps

[View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md).

More questions? [Try the Power BI Community.](https://community.powerbi.com/)
