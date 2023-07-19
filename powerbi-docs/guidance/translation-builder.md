---
title: "Create multiple-language reports with Translations Builder"
description: Learn how Translations Builder can add multiple-language support to Power BI project files. Use best practices to localize Power BI reports.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/21/2023
---
# Create multiple-language reports with Translations Builder

Translations Builder is a tool designed for content creators using Power BI Desktop. Content creators can use this tool to add multiple-language support to .pbix project files. The following screenshot shows what Translations Builder looks like when working with a simple .pbix project that supports a few secondary languages.

:::image type="content" source="./media/translation-builder/translations-builder.png" alt-text="Screenshot shows the Translations Builder tool with several languages included." lightbox="./media/translation-builder/translations-builder.png":::

Translations Builder is an external tool developed for Power BI Desktop using C#, .NET 6, and Windows Forms. Translations Builder uses an API known as the ***Tabular Object Model (TOM)*** to update datasets that have been loaded into memory and are running in a session of Power BI Desktop. Translations Builder does most of its work by adding and updating the metadata translations associated with datasets objects including tables, columns and measures. However, there are several scenarios in which Translations Builder actually creates new tables in a dataset to implement strategies to handle various aspects of building multiple-language reports.

When you open a .pbix project in Power BI Desktop, the dataset defined inside the .pbix file is loaded into memory in a local session of the Analysis Services engine. Translations Builder uses TOM to establish a direct connection to the dataset of the current .pbix project.

:::image type="content" source="./media/translation-builder/translations-builder-power-bi-desktop.png" alt-text="Diagram shows how the TOM maps to the Power BI Desktop dataset over a localhost port." lightbox="./media/translation-builder/translations-builder-power-bi-desktop.png":::

## Open Translations Builder

The Translations Builder project has been developed using the [**external tools integration support**](https://docs.microsoft.com/en-us/power-bi/transform-model/desktop-external-tools) for Power BI Desktop. You can install Translations Builder on a Windows PC where you've already installed Power BI Desktop using instructions in the [**Translations Builder Installation Guide**](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Docs/Installation%20Guide.md). Once the Translations Builder application has been installed on a Windows computer, you can launch it directly from Power BI Desktop using the **External Tools** tab in the ribbon.

:::image type="content" source="./media/translation-builder/external-tool-translations-builder.png" alt-text="Screenshot shows the Power BI Desktop External tools ribbon with Translations Builder highlighted." lightbox="./media/translation-builder/external-tool-translations-builder.png":::

When you launch an external tool like Translations Builder, the application is passed startup parameters including a connection string. The connection string can be used to establish a connection back to a dataset that's loaded in Power BI Desktop. This approach allows Translations Builder to display dataset information and to provide commands to automate adding metadata translations. You can read [**Translations Builder Developers Guide**](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Docs/Developer%20Guide.md) if you want to learn more about the details of working with Translations Builder as a developer. The content in this article focuses on teaching concepts and localization skills to content creators building datasets and reports with Power BI Desktop.

The key value proposition of Translations Builder is that it allows a content creator to view, add and update metadata translations using a two-dimensional grid. This ***translations grid*** simplifies the user experience because it abstracts away the low-level details or reading and writing metadata translation associated with a dataset definition. Users work with the translation grid to view, add and edit metadata translations in a manner that is similar to working with data inside an Excel spreadsheet.

:::image type="content" source="./media/translation-builder/translation-grid.png" alt-text="Screenshot shows the Translations Builder grid with a cell selected to edit." lightbox="./media/translation-builder/translation-grid.png":::

## Use best practices to localize Power BI reports

When it comes to localizing software, there are some universal principals to keep in mind. The first is to plan for localization from the start of any project. It's significantly harder to add localization support to an existing dataset or report that was initially built without any regard for Internationalization or localization. This fact is especially true with Power BI reports because there are so many popular design techniques that don't support localization. You might find that much of the work for adding localization support to existing Power BI reports involves moving backward and undoing the things that don't support localization before you can move forward with design techniques that do support localization.

Another important concept in localization is to plan for growth. A label that's 400 pixels wide when displayed in English could require a greater width when translated into another language. If you optimize the width of your labels for text in English, you might find that translations in other languages introduce unexpected line breaks or get cut off which, in turn, creates a compromised user experience.

Adding a healthy degree of padding to localized labels is the norm when developing Internationalized software and it's essential that you test your reports with each language you plan to support. In essence, you need to ensure your report layouts looks the way you expect with any language you have chosen to support.

## Next steps


