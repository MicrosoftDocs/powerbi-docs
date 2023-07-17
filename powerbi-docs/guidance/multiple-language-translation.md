---
title: "Plan translation for multiple-language reports in Power BI"
description: Learn about the types of translation used for multiple-language reports in Power BI and how you can package datasets and reports in project files.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/19/2023
---
# Plan translation for multiple-language reports in Power BI

When it comes to localizing Power BI artifacts such as datasets and reports, there are three types of translations.

- Metadata translation
- Report label translation
- Data translation

> [!TIP]
> Refer to this [live demo](https://multilanguagereportdemo.azurewebsites.net/) to see these principles in action. You can also [download the demo](https://github.com/PowerBiDevCamp/TranslationsBuilder/raw/main/LiveDemo/ProductSalesMultiLanguage.pbix) to see reports in Power BI Desktop.

### Metadata translation

*Metadata translation* provides localized values for dataset object properties. The object types that support metadata translation include tables, columns, measures, hierarchies, and hierarchy levels. Metadata translation rarely provides a complete solution by itself.

The following screenshot shows how metadata translations provide German names for the measures displayed in Card visuals.

:::image type="content" source="./media/multiple-language-translation/card-visual-translate.png" alt-text="Screenshot shows a Power BI report with five card visualizations with measures in German." lightbox="./media/multiple-language-translation/card-visual-translate.png":::

Metadata translation is also used to display column names and measure names in tables and matrices.

:::image type="content" source="./media/multiple-language-translation/display-column-name-translate.png" alt-text="Screenshot shows a Power BI report with a table with column names and measures in German." lightbox="./media/multiple-language-translation/display-column-name-translate.png":::

Metadata translations are the easiest to create, manage, and integrate into a Power BI report. By applying the features of Translations Builder to generate machine translations, you can add the metadata translations you need to build and test a Power BI report. Adding metadata translations to your dataset is an essential first step.

### Report label translation

*Report label translation* provides localized values for text elements on a report that aren't directly associated with a dataset object. Examples of report labels include the report title, section headings, and button captions. Here are examples of report label translations with the report title and the captions of navigation buttons.

:::image type="content" source="./media/multiple-language-translation/report-title-translate.png" alt-text="Screenshot shows Power BI report tabs with values translated to German." lightbox="./media/multiple-language-translation/report-title-translate.png":::

Report label translations are harder to create and manage than metadata translations because Power BI provides no built-in feature to track or integrate them. Translations Builder solves this problem using a *Localized Labels*, which is a hidden table in the dataset of a report. Add measures that track the required translations for each report label. <!--- For more information about a Localized Labels table, see **Understanding the Localized Labels Table**.--->

### Data translation

*Data translation* provides translated values for text-based columns in the underlying data itself. Suppose a Power BI report displays product names imported from the rows of the **Products** table in an underlying database. Data translation is used to display product names differently for users who speak different languages. For example, some users see products names in English while other users see product names in other languages.

:::image type="content" source="./media/multiple-language-translation/product-name-translation.png" alt-text="Screenshot shows a table with product names first in English, then in German." lightbox="./media/multiple-language-translation/product-name-translation.png":::

Data translations also appear in the axes of cartesian visuals and in legends.

:::image type="content" source="./media/multiple-language-translation/cartesian-visuals-translate.png" alt-text="Screenshot shows a bar chart with labels and legends first in English, then in German." lightbox="./media/multiple-language-translation/cartesian-visuals-translate.png":::

Data translation is harder to design and implement than the other two types of translations. You must typically redesign the underlying data source with extra text columns for secondary language translations. Once the underlying data source has been extended with extra text columns, you can then use a powerful feature in Power BI Desktop called *Field Parameters*. This feature uses filters to control loading the data translations for a specific language.

A multiple-language report typically requires both metadata translations and report label translations. Some multiple-language projects require data translations, but others don't.

## Power BI support for metadata translation

*Metadata translation* is the main localization feature in Power BI to build multiple-language reports. In Power BI, metadata translation support is integrated at the dataset level.

A metadata translation represents the property for a dataset object that's been translated for a specific language. If your dataset contains a table with an English name of *Products*, you can add translations for the **Caption** property of this table object to provide alternative names. These names appear when the report is rendered in a different language. In addition to the **Caption** property, which tracks an object's display name, dataset objects also support adding metadata translations for two other properties, which are **Description** and **DisplayFolder**.

When you begin designing a dataset that uses metadata translation, you can assume that you always need translations for the **Caption** property. If you require support for metadata translation for report authors who create and edit reports in the Power BI service, you also need to provide metadata translations for the **Description** and **DisplayFolder** properties.

Power BI reports and datasets that support metadata translation can only run in workspaces that are associated a dedicated capacity created using Power BI Premium or the Power BI Embedded Service. Multiple-language reports don't load correctly when launched from a workspace in the shared capacity. If you're working in a Power BI workspace that doesn't display a diamond that indicates a Premium workspace, multiple-language reports might not work as expected.

Power BI support for metadata translations only applies to datasets. Power BI Desktop and the Power BI service don't support storing or loading translations for text values stored as part of the report layout.

:::image type="content" source="./media/multiple-language-translation/pbix-file-structure.png" alt-text="Diagram shows the report layout, which doesn't support localization, next to the dataset definition, which supports localization.":::

If you add a textbox or button to a Power BI report and then add a hard-coded text value for a string displayed to the user, that text value is stored in the report layout. It can't be localized. Avoid using hard-coded text values. Page tabs display names can't be localized. You can design multiple-language reports so that page tabs are hidden and never displayed to the user.

## Package a dataset and reports in project files

Before you proceed, you need to decide how to package your dataset definitions and report layouts for distribution. There are two popular approaches used by content creators who work with Power BI Desktop.

- Single .pbix project file
- Multiple project files with a shared dataset

For adding multiple-language support to a Power BI solution, choose either of these approaches.

### Single project file

You can package both a report layout and its underlying dataset definition together. Deploy a reporting solution like this by publishing the project into a Power BI service workspace. If you need to update either the report layout or the dataset definition, upgrade by publishing an updated version of the .pbix project file.

:::image type="content" source="./media/multiple-language-translation/single-pbix-scenario.png" alt-text="Diagram shows a report layout and dataset definition in a single pbix file.":::

### Shared dataset

The single project file approach doesn't always provide the flexibility you need. Maybe one team is responsible for creating and updating datasets while other teams are responsible for building reports. It might make sense to share a dataset with reports in separate .pbix project files.

To use the shared dataset approach, create one .pbix project file with a dataset and an empty report, which remains unused. Once this dataset has been deployed to the Power BI service, report builders can connect to it using Power BI Desktop to create report-only .pbix files. This approach makes it possible for the teams building reports to build .pbix project files with report layouts that can be deployed and updated independently of the underlying dataset.

:::image type="content" source="./media/multiple-language-translation/shared-dataset-scenario.png" alt-text="Diagram shows two report layouts in separate files associated with a dataset definition in a third file that also has an unused report.":::

## Next steps

[Use locale values in multiple-language Power BI reports](multiple-language-locale.md)
