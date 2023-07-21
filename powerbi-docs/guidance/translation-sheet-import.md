---
title: Import translation sheets in Translations Builder
description: Learn how to import translations sheets in Translations Builder. Human translators use these .csv files to provide translations to localize Power BI reports.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/24/2023
---
# Import translation sheets in Translations Builder

Imagine a scenario where you have generated a translation sheet to send to a Spanish translator. When opened in Excel, this translation sheet appears as the one shown in the following screenshot.

:::image type="content" source="./media/translation-sheet-import/spanish-excel-sheet.png" alt-text="Screenshot shows a .csv translation sheet in Excel with one language column highlighted." lightbox="./media/translation-sheet-import/spanish-excel-sheet.png":::

The job of the translator is to review all translations in the fifth column and to make updates where appropriate. From the perspective of the translator, the top row with column headers and the first four columns should be treated as read-only values. Once you receive the translation sheet back from the translator with updates to the translations in the fifth column, you can return to Translations Builder and select the **Import Translations** button.

:::image type="content" source="./media/translation-sheet-import/import-translation.png" alt-text="Screenshot shows the Export/Import Translations pane with the Import Translation option highlighted.":::

Remember to close translation sheet files in Microsoft Excel before attempting to import them with Translations Builder to prevent errors. In the **Open** file dialog, select the translation sheet file and select **Open**.

:::image type="content" source="./media/translation-sheet-import/import-inbox.png" alt-text="Screenshot shows a directory with a translation sheet .csv file highlighted." lightbox="./media/translation-sheet-import/import-inbox.png":::

You should see that your updates to the Spanish translation sheet now appear in the translation grid.

:::image type="content" source="./media/translation-sheet-import/translation-grid-spanish.png" alt-text="Screenshot shows the Translations Builder translation grid with the updated versions for the language." lightbox="./media/translation-sheet-import/translation-grid-spanish.png":::

## Import a master translation sheet

In many scenarios, it makes sense to import updated translation sheets that only contain translations for a single secondary language. However, you can also import a master translation sheet with which has multiple columns for secondary languages. Therefore, the master translation sheet can provide an effective way to back up and restore the work you have done with translations on a project-wide basis.

To make this point, let's move through a simple scenario in which you have already generated the master translation sheet for a project that includes several secondary languages. Now imagine you delete French as a language from the project by right-clicking the **French [fr-FR]** column header and selecting **Delete Secondary Language**.

:::image type="content" source="./media/translation-sheet-import/delete-language.png" alt-text="Screenshot shows the translation grid with the Delete Secondary Language option highlighted." lightbox="./media/translation-sheet-import/delete-language.png":::

When you attempt to delete the column for a secondary language, Translations Builder prompts you with the **Confirm Delete Secondary Language Operation** dialog.

:::image type="content" source="./media/translation-sheet-import/confirm-language-delete.png" alt-text="Screenshot shows the Confirm Delete Secondary Language Operation dialog box.":::

You can select **OK** to continue and complete the delete operation. After you confirm the delete operation, the column for French has been removed from the translations grid. Behind the scenes, Translations Builder has also deleted all the French translations from the project.

:::image type="content" source="./media/translation-sheet-import/language-after-delete.png" alt-text="Screenshot shows the translation grid without the deleted language." lightbox="./media/translation-sheet-import/language-after-delete.png":::

Continuing with our scenario, you sense that something has gone wrong and you exclaim “Oh Mon Dieu!” You just realized that you accidentally deleted all the French translations. Fortunately, you previously generated a master translation sheet that contains the French translations. You haven't lost all your work. If you import the master translation sheet, the **French [fr-FR]** column should reappear as the last column.

:::image type="content" source="./media/translation-sheet-import/language-reimport.png" alt-text="Screenshot shows the translation grid with the recovered language in the far right column." lightbox="./media/translation-sheet-import/language-reimport.png":::

## Next steps

- [Manage dataset translations at the enterprise level](translation-manage-dataset-import.md)
