---
title: Manage data model translations at the enterprise level
description: Learn how to organize your multiple-language projects to reuse your translations efforts in multiple Power BI projects.
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/24/2023
---
# Manage data model translations at the enterprise level

You can use a master translations sheet as a project backup. Translations Builder adds a secondary language along with its translations to a .pbix project if it's found in the translation sheet but not in the target project. For more information, see [Import translation sheets in Translations Builder](translation-sheet-import.md).

You can also create an enterprise-level master translation sheet to import when you create new .pbix projects.

## Import translations

Imagine you have two .pbix projects that have a similar data model in terms of the tables, columns, and measures. In the first project, you have already added metadata translations for all the unhidden data model objects. In the second project, you haven't yet started to add secondary languages or translations. You can export the master translation sheet from the first project and import it into the second project.

:::image type="content" source="./media/translation-manage-data-model-enterprise/multiple-project-translation.png" alt-text="Diagram represents one project exporting its translation sheet, which another project imports." lightbox="./media/translation-manage-data-model-enterprise/multiple-project-translation.png":::

The **Import Translations** command starts by determining whether there are any secondary languages in the translation sheet that aren't in the target .pbix project. It adds any secondary languages not already present in the target project. After that, the command moves down the translation sheet row by row.

For each row, Translations Builder determines whether a data model object in the .csv file matches a data model object of the same name in the .pbix project. When it finds a match, the command copies all the translations for that data model object into the .pbix project. If it finds no match, the command ignores that row and continues to the next row.

The **Import Translations** command provides special treatment for report labels that have been added to the **Localized Labels** table. If you import a translation sheet with one or more localized report labels into a new .pbix project, the command creates the **Localized Labels** table.

:::image type="content" source="./media/translation-manage-data-model-enterprise/import-translation-sheet.png" alt-text="Screenshot shows a single main translation sheet being imported into multiple projects." lightbox="./media/translation-manage-data-model-enterprise/import-translation-sheet.png":::

Because the **Import Translations** command creates the **Localized Labels** table and copies report labels into a target .pbix project, it can be the foundation for maintaining an enterprise-level master translation sheet. Use a set of localized report labels across multiple .pbix projects. Each time you create a new .pbix project, you can import the enterprise-level translation sheet to add the generalized set of localized report labels.

## Related content

- [Guidance for Power BI](overview.md)
