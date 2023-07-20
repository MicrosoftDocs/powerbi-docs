---
title: 
description: 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/24/2023
---
### Export a translation sheet for a secondary language

Let's start by generating a translation sheet for a single language. First, you should drop down the selection menu under the **Export Translations Sheet** button and select a language such as **German [de-DE]**.

:::image type="content" source="./media/translation-sheet-export/select-german.png" alt-text="Image alt text.":::

After selecting a language, you can select the **Export Translations Sheet** button to generate a translation sheet for that language.

:::image type="content" source="./media/translation-sheet-export/export-translation-sheet.png" alt-text="Image alt text.":::

When generating translation sheets in this manner, you can enable or disable the **Open Export in Excel** option. When this option is enabled, Translations Builder opens the exported CSV file in Excel each time you generate a translation sheet. The **Open Export in Excel** option makes it possible to quickly view and edit the contents of a translation sheet.

:::image type="content" source="./media/translation-sheet-export/translation-sheet-excel.png" alt-text="Image alt text." lightbox="./media/translation-sheet-export/translation-sheet-excel.png":::

### Export the master translation sheet

The **Export Translation Sheet** command that you've just seen exports a translation sheet with translations for just one secondary language at a time. You can alternatively use the **Export All Translations** command, which generates a master translation sheet with all the secondary languages and translations that have been added to the current project.

:::image type="content" source="./media/translation-sheet-export/export-all-translation.png" alt-text="Image alt text.":::

When you select the **Export All Translations** button, Translations Builder generates a CSV file for the master translation sheet named **PbixProjectName-Translations-Master.csv**. When the master translations sheet opens in Microsoft Excel, you can see all secondary language columns and all translations. You can think of the master translation sheet as a backup of all translations on a project-wide basis.

:::image type="content" source="./media/translation-sheet-export/translation-sheet-all-excel.png" alt-text="Image alt text." lightbox="./media/translation-sheet-export/translation-sheet-all-excel.png":::

### Export translation sheets for all secondary languages

The final export command you should understand is the **Export All Translation Sheets** command that is provided to assist with the quick generation and the management of outbound translation sheet files.

:::image type="content" source="./media/translation-sheet-export/export-all-translation-sheet.png" alt-text="Image alt text.":::

When you run the **Export All Translation Sheets** command, it generates the complete set of translation sheets to be sent to translators. If you examine the **Outbox** folder, you should see that a separate translation sheet has been generated for each secondary language that has been included in the current project.

:::image type="content" source="./media/translation-sheet-export/outbox-result.png" alt-text="Image alt text." lightbox="./media/translation-sheet-export/outbox-result.png":::

