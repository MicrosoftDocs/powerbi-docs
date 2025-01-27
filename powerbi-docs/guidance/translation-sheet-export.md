---
title: Export translation sheets in Translations Builder
description: Learn how to export translations sheets in Translations Builder. Human translators use these .csv files as the source to localize Power BI reports.
author: kfollis   
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/24/2023
---
# Export translation sheets in Translations Builder

When you use Translations Builder with external translators, you need to export a *translation sheet* that contains the default language and empty cells or machine generated translations. Translators update the .csv file and return it to you.

You can export the following translations sheets:

- A translation sheet for a single language
- Translation sheets for all supported languages
- A translation sheet that contains all supported languages

## Export translation sheet for a single language

1. In Translations Builder, under **Export/Import Translations**, select a language such as **German [de-DE]**.

   :::image type="content" source="./media/translation-sheet-export/select-german.png" alt-text="Screenshot shows the Export/Import Translations pane with a language selected.":::

1. Select **Export Translations Sheet** to generate a translation sheet for that language.

   You can select **Open Export in Excel** to view the exported file immediately.

   :::image type="content" source="./media/translation-sheet-export/export-translation-sheet.png" alt-text="Screenshot shows the Export/Import Translations pane with the Export Translations Sheet selected.":::

The result of the export operation is a .csv file in the *Outbox* directory. If you selected **Open Export in Excel**, you also see the result in Excel.

:::image type="content" source="./media/translation-sheet-export/translation-sheet-excel.png" alt-text="Screenshot shows part of the spreadsheet created by the export operation." lightbox="./media/translation-sheet-export/translation-sheet-excel.png":::

## Export translation sheets for all languages

You can export translations sheets for all the languages supported for your project at once. Under **Export/Import Translations**, select **Export All Translation Sheets**.

:::image type="content" source="./media/translation-sheet-export/export-all-translation-sheet.png" alt-text="Screenshot shows the Export/Import Translations pane with the Export All Translation sheets option highlighted.":::

> [!TIP]
> Don't select **Open Export in Excel**. That option opens all of the files in Excel.

Translations Builder generates the complete set of translation sheets to be sent to translators.

:::image type="content" source="./media/translation-sheet-export/outbox-result.png" alt-text="Screenshot shows an Output directory that contains several translation sheets." lightbox="./media/translation-sheet-export/outbox-result.png":::

## Export all translations

You can export a single translation sheet that contains all the secondary languages and translations that have been added to the current project. Under **Export/Import Translations**, select **Export All Translations**.

:::image type="content" source="./media/translation-sheet-export/export-all-translation.png" alt-text="Screenshot shows the Export/Import Translations pane with the Export All Translations option highlighted.":::

Translations Builder generates a .csv file for the full translation sheet named *PbixProjectName-Translations-Master.csv*. When you open the translations sheet in Excel, you can see all secondary language columns and all translations. You can think of this translation sheet as a backup of all translations on a project-wide basis.

:::image type="content" source="./media/translation-sheet-export/translation-sheet-all-excel.png" alt-text="Screenshot shows part of the spreadsheet created by the export all operation." lightbox="./media/translation-sheet-export/translation-sheet-all-excel.png":::

## Related content

- [Import translation sheets in Translations Builder](translation-sheet-import.md)
