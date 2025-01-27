---
title: Import translation sheets in Translations Builder
description: Learn how to import translations sheets in Translations Builder. Human translators use these .csv files to provide translations to localize Power BI reports.
author: kfollis   
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/24/2023
---
# Import translation sheets in Translations Builder

When you use Translations Builder with external translators, you need to export a *translation sheet* that contains the default language and empty cells or machine generated translations. Translators update the .csv file and return it to you.

Suppose you generate a translation sheet to send to a translator. When opened in Excel, this translation sheet looks like the following screenshot.

:::image type="content" source="./media/translation-sheet-import/spanish-excel-sheet.png" alt-text="Screenshot shows a .csv translation sheet in Excel with one language column highlighted." lightbox="./media/translation-sheet-import/spanish-excel-sheet.png":::

The job of the translator is to review all translations in the relevant column and to make updates where appropriate. From the perspective of the translator, the top row with column headers and the first four columns should be treated as read-only values.

## Import translation sheet

When you receive the translation sheet back from the translator with updates, follow these steps.

1. If you opened the translation sheet in Excel, close it before proceeding.
1. In Translations Builder, under **Export/Import Translations**, select **Import Translations**.

   :::image type="content" source="./media/translation-sheet-import/import-translation.png" alt-text="Screenshot shows the Export/Import Translations pane with the Import Translation option highlighted.":::

1. In the **Open** dialog box, select the translation sheet file and select **Open**.

   :::image type="content" source="./media/translation-sheet-import/import-inbox.png" alt-text="Screenshot shows a directory with a translation sheet .csv file highlighted." lightbox="./media/translation-sheet-import/import-inbox.png":::

   The Spanish translation updates now appear in the translation grid.

   :::image type="content" source="./media/translation-sheet-import/translation-grid-spanish.png" alt-text="Screenshot shows the Translations Builder translation grid with the updated versions for the language." lightbox="./media/translation-sheet-import/translation-grid-spanish.png":::

## Import master translation sheet

The usual workflow is to import updated translation sheets that only contain translations for a single language. However, you can also import a master translation sheet that has multiple columns for secondary languages. This approach provides a way to back up and restore the work you have done with translations on a project-wide basis. You can also use this approach to reuse translations across multiple projects.

Here's a simple example. After you generate the current master translation sheet for a project, imagine you delete French as a language from the project by right-clicking the **French [fr-FR]** column header and selecting **Delete This Language From Data Model**.

:::image type="content" source="./media/translation-sheet-import/delete-language.png" alt-text="Screenshot shows the translation grid with the Delete Secondary Language option highlighted." lightbox="./media/translation-sheet-import/delete-language.png":::

When you attempt to delete the column for a language, Translations Builder prompts you to verify.

:::image type="content" source="./media/translation-sheet-import/confirm-language-delete.png" alt-text="Screenshot shows the Confirm Delete Secondary Language Operation dialog box.":::

You can select **OK** to continue. After you confirm the delete operation, the column for French has been removed from the translations grid. Behind the scenes, Translations Builder has also deleted all the French translations from the project.

:::image type="content" source="./media/translation-sheet-import/language-after-delete.png" alt-text="Screenshot shows the translation grid without the deleted language." lightbox="./media/translation-sheet-import/language-after-delete.png":::

Suppose that you deleted this language by mistake. You can use a previously generated a master translation sheet to restore the deleted language. If you import the translation sheet, the **French [fr-FR]** column reappears as the last column.

:::image type="content" source="./media/translation-sheet-import/language-reimport.png" alt-text="Screenshot shows the translation grid with the recovered language in the far right column." lightbox="./media/translation-sheet-import/language-reimport.png":::

## Related content

- [Manage data model translations at the enterprise level](translation-manage-data-model-enterprise.md)
