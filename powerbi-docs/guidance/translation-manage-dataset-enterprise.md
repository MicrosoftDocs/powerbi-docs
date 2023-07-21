---
title: Manage dataset translations at the enterprise level
description: Learn how to organize your multiple-language projects to reuse your translations efforts in multiple Power BI projects.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/24/2023
---
# Manage dataset translations at the enterprise level

In the previous section, you learned how to import translations from a master translation sheet. You have seen that the behavior of the **Import Translations** command is programmed to automatically add a secondary language along with its translations to a .pbix project if it's found in the translation sheet but not in the target project. The logic that has been programmed into the **Import Translations** command goes even further and this logic makes it possible to create an enterprise-level master translation sheet that can be imported at the start when you create a new .pbix project.

## Using import translations

Imagine you have two .pbix projects that have a similar data model in terms of the tables, columns and measures. In the first project, you have already done all the work to add metadata translations for all the unhidden dataset objects. In the second project, you haven't yet started to add any support for any secondary languages or translations. What would happen if you exported the master translation sheet from the first project and then imported this master translation sheet into the second project? It would provide a quick way to copy the localization and translations work you have done from one .pbix project to another.

:::image type="content" source="./media/translation-manage-dataset-enterprise/multiple-project-translation.png" alt-text="Diagram represents one project exporting its translation sheet, which another project imports." lightbox="./media/translation-manage-dataset-enterprise/multiple-project-translation.png":::

The logic behind the **Import Translations** command starts by determining whether there are any secondary languages in the translation sheet that aren't in the target .pbix project. As you have seen, it automatically adds any secondary languages not already present in the target project. After that, the code in the **Import Translations** command moves down the translation sheet row by row. For each row, it determines whether a dataset object in the CSV file matches a dataset object of the same name in the .pbix project. When a match is found, the **Import Translations** command then copies all the translations for that dataset object into the .pbix project. If no match is found, then the **Import Translations** command ignores that row and continues down to the next row.

The logic behind the **Import Translations** command provides special treatment for report labels that have been added to the **Localized Labels** table. If you import a translation sheet with one or more localized report labels into a new .pbix project, the **Import Translations** command automatically creates the **Localized Labels** table behind the scenes.

The ability of the **Import Translations** command to create the **Localized Labels** table and copy report labels into a target .pbix project provides the foundation for maintaining an enterprise-level master translation sheet with a reusable set of localized report labels you can use across all your .pbix projects. Each time you create a new .pbix project, you can import the enterprise-level translation sheet to instantly add the generalized set of localized report labels.

:::image type="content" source="./media/translation-manage-dataset-enterprise/import-translation-sheet.png" alt-text="Screenshot shows a single main translation sheet being imported into multiple projects." lightbox="./media/translation-manage-dataset-enterprise/import-translation-sheet.png":::

## Next steps

- [Guidance for Power BI](overview.md)
