---
title: "Create multiple-language reports with Translations Builder"
description: Learn how Translations Builder can add multiple-language support to Power BI project files. Use best practices to localize Power BI reports.
author: kfollis   
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/21/2023
---
# Create multiple-language reports with Translations Builder

Content creators can use Translations Builder to add multiple-language support to .pbix project files in Power BI Desktop. The following screenshot shows what Translations Builder looks like when working with a simple .pbix project that supports a few secondary languages.

:::image type="content" source="./media/translation-builder/translations-builder.png" alt-text="Screenshot shows the Translations Builder tool with several languages included." lightbox="./media/translation-builder/translations-builder.png":::

Translations Builder is an external tool developed for Power BI Desktop using C#, .NET 6, and Windows Forms. Translations Builder uses an API called *Tabular Object Model* (TOM) to update data models that are loaded into memory and run in a session of Power BI Desktop.

Translations Builder does most of its work by adding and updating the metadata translations associated with data model objects including tables, columns, and measures. There are also cases in which Translations Builder creates new tables in a data model to implement strategies to handle aspects of building multiple-language reports.

When you open a .pbix project in Power BI Desktop, the data model defined inside the .pbix file is loaded into memory in a local session of the Analysis Services engine. Translations Builder uses TOM to establish a direct connection to the data model of the current .pbix project.

:::image type="content" source="./media/translation-builder/translations-builder-power-bi-desktop.png" alt-text="Diagram shows how the TOM maps to the Power BI Desktop data model over a localhost port." lightbox="./media/translation-builder/translations-builder-power-bi-desktop.png":::

## Open Translations Builder

If you don't already have Power BI Desktop installed, see [Get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md).

On the same computer where you run Power BI Desktop, download and install Translations Builder by using the [Translations Builder Installation Guide](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Docs/Installation%20Guide.md).

After you install Translations Builder, you can open it directly from Power BI Desktop in the **External Tools** ribbon. The Translations Builder project uses external tools integration support. For more information, see [External tools in Power BI Desktop](../transform-model/desktop-external-tools.md).

:::image type="content" source="./media/translation-builder/external-tool-translations-builder.png" alt-text="Screenshot shows the Power BI Desktop External tools ribbon with Translations Builder highlighted." lightbox="./media/translation-builder/external-tool-translations-builder.png":::

When you launch an external tool like Translations Builder, Power BI Desktop passes startup parameters to the application, including a connection string. Translations Builder uses the connection string to establish a connection back to the data model that's loaded in Power BI Desktop.

This approach allows Translations Builder to display data model information and to provide commands to automate adding metadata translations. For more information, see [Translations Builder Developers Guide](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Docs/Developer%20Guide.md).

Translations Builder allows a content creator to view, add, and update metadata translations using a two-dimensional grid. This *translations grid* simplifies the user experience because it abstracts away the low-level details of reading and writing metadata translation associated with a dataset definition. You work with metadata translations in the translation grid similar to working with data in an Excel spreadsheet.

:::image type="content" source="./media/translation-builder/translation-grid.png" alt-text="Screenshot shows the Translations Builder grid with a cell selected to edit." lightbox="./media/translation-builder/translation-grid.png":::

## Related content

- [Add a language to a report in Translations Builder](translation-builder-add-language.md)
