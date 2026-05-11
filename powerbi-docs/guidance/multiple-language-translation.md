---
title: "Plan Translation for Multiple-Language Reports in Power BI"
description: Learn about the types of translation used for multiple-language reports in Power BI and how Power BI supports metadata translation.
author: kgremban   
ms.author: kgremban
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.date: 10/01/2025
ai-usage: ai-assisted
---
# Plan translation for multiple-language reports in Power BI

When it comes to localizing Power BI items, such as semantic models and reports, there are three types of translations.

- Metadata translation
- Report label translation
- Data translation

In this article, learn about these types.
<!---
You can follow along with the example multiple-language report discussed in this article. You don't need a Power BI license to explore the sample in Power BI Desktop. You just need a [Fabric free license](../fundamentals/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

- [Download the example multiple-language report.](https://github.com/PowerBiDevCamp/TranslationsBuilder/raw/main/LiveDemo/ProductSalesMultiLanguage.pbix)
- If you'd like to view it in the Power BI service, open the file in Power BI Desktop and select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.
--->

## Metadata translation

*Metadata translation* provides localized values for semantic model object properties. The object types that support metadata translation include tables, columns, measures, hierarchies, and hierarchy levels. Metadata translation rarely provides a complete solution by itself.

The following screenshot shows how metadata translations provide German names for the measures displayed in Card visuals.

:::image type="content" source="./media/multiple-language-translation/card-visual-translate.png" alt-text="Screenshot shows a Power BI report with five card visualizations with measures in German." lightbox="./media/multiple-language-translation/card-visual-translate.png":::

Metadata translation is also used to display column names and measure names in tables and matrices.

:::image type="content" source="./media/multiple-language-translation/display-column-name-translate.png" alt-text="Screenshot shows a Power BI report with a table with column names and measures in German." lightbox="./media/multiple-language-translation/display-column-name-translate.png":::

Metadata translations are the easiest to create, manage, and integrate into a Power BI report. By applying the features of Translations Builder to generate machine translations, you can add the metadata translations you need to build and test a Power BI report. Adding metadata translations to your semantic model is an essential first step. For more information, see [Create multiple-language reports with Translations Builder](translation-builder.md).

### Power BI support for metadata translation

*Metadata translation* is the main localization feature in Power BI to build multiple-language reports. In Power BI, metadata translation support is integrated at the semantic model level.

A metadata translation represents the property for a semantic model object that's been translated for a specific language. If your semantic model contains a table with an English name of *Products*, you can add translations for the **Caption** property of this table object to provide alternative names. These names appear when the report is rendered in a different language.

In addition to the **Caption** property, which tracks an object's display name, semantic model objects also support adding metadata translations for two other properties, which are **Description** and **DisplayFolder**.

When you begin designing a semantic model that uses metadata translation, you can assume that you always need translations for the **Caption** property. If you require support for metadata translation for report authors who create and edit reports in the Power BI service, you also need to provide metadata translations for the **Description** and **DisplayFolder** properties.

Power BI support for metadata translations only applies to semantic models. Power BI Desktop and the Power BI service don't support storing or loading translations for text values stored as part of the report layout.

:::image type="content" source="./media/multiple-language-translation/pbix-file-structure.png" alt-text="Diagram shows the report layout, which doesn't support localization, next to the semantic model definition, which supports localization.":::

If you add a textbox or button to a Power BI report and then add a hard-coded text value for a string displayed to the user, that text value is stored in the report layout. It can't be localized. Avoid using hard-coded text values. Page tabs display names can't be localized. You can design multiple-language reports so that page tabs are hidden and never displayed to the user.

## Report label translation

*Report label translation* provides localized values for text elements on a report that aren't directly associated with a semantic model object. Examples of report labels include the report title, section headings, and button captions. Here are examples of report label translations with the report title and the captions of navigation buttons.

:::image type="content" source="./media/multiple-language-translation/report-title-translate.png" alt-text="Screenshot shows Power BI report tabs with values translated to German." lightbox="./media/multiple-language-translation/report-title-translate.png":::

Report label translations are harder to create and manage than metadata translations because Power BI provides no built-in feature to track or integrate them. Translations Builder solves this problem using a *Localized Labels* table, which is a hidden table in the semantic model of a report. Add measures that track the required translations for each report label.

<!--- For more information about a Localized Labels table, see **Understanding the Localized Labels Table**.--->

## Data translation

*Data translation* provides translated values for text-based columns in the underlying data itself. Suppose a Power BI report displays product names imported from the rows of the **Products** table in an underlying database. Data translation is used to display product names differently for users who speak different languages. For example, some users see products names in English while other users see product names in other languages.

:::image type="content" source="./media/multiple-language-translation/product-name-translation.png" alt-text="Screenshot shows a table with product names first in English, then in German." lightbox="./media/multiple-language-translation/product-name-translation.png":::

Data translations also appear in the axes of cartesian visuals and in legends.

:::image type="content" source="./media/multiple-language-translation/cartesian-visuals-translate.png" alt-text="Screenshot shows a bar chart with labels and legends first in English, then in German." lightbox="./media/multiple-language-translation/cartesian-visuals-translate.png":::

Data translation is harder to design and implement than the other two types of translation. You must redesign the underlying data source with extra text columns for secondary language translations. Once the underlying data source has been extended with extra text columns, you can then use a powerful feature in Power BI Desktop called *Field Parameters*. This feature uses filters to control loading the data translations for a specific language.

A multiple-language report typically requires both metadata translations and report label translations. Some multiple-language projects require data translations, but others don't.

## Limitations

Multiple-language reports aren't supported with [Publish to web](../collaborate-share/service-publish-to-web.md). For more information about the limitations of Publish to web, see [Publish to web considerations and limitations](../collaborate-share/service-publish-to-web.md#considerations-and-limitations).

## Related content

- [Use locale values in multiple-language Power BI reports](multiple-language-locale.md)
