---
title: "Use locale values in multiple-language Power BI reports"
description: Learn how to use locale values in multiple-language reports in Power BI, including translation of measures and several locales for the same language.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/19/2023
---

# Use locale values in multiple-language Power BI reports

Every report that loads in the Power BI service initializes with a user context that identifies a *language* and a geographical region known as a *locale*. In most cases, a locale identifies a country/region. The Power BI service tracks the combination of the user's language and locale using a *culture name*.

A culture name is usually a lower-case language identifier and an upper-case locale identifier separated by a hyphen. The culture name `en-US` identifies a user in the United States who speaks English. A culture name of `es-ES` identifies a user in Spain who speaks Spanish. A culture name of `fr-FR` identifies a user in France who speaks French. A culture name of `de-DE` identifies a user in Germany who speaks German.

| USERCULTURE | Language | Locale        |
|-------------|----------|---------------|
| en-US       | English  | United States |
| es-ES       | Spanish  | Spain         |
| fr-FR       | French   | France        |
| de-DE       | German   | Germany       |

> [!NOTE]
> In some cases, a culture name also includes other information. For example, there are two different culture names for the language Serbian in Serbia, which are `sr-Cyrl-RS` and `sr-Latn-RS`. The part in the middle known as the script (*Cyrl* and *Latn*) indicates whether to use the Cyrillic alphabet or the Latin alphabet. For more information, see [RFC 4646](https://datatracker.ietf.org/doc/html/rfc4646).

For a list of culture name values, see [ISO 639 Language codes](https://www.iso.org/iso-639-language-codes.html) and [Online Browsing Platform](https://www.iso.org/obp/ui/#search).

## Organize project for metadata translation

At the start of a project that involves creating a new Power BI semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) with metadata translation, list the culture names that you plan to support. Next, extend the semantic model by adding metadata translations for each culture name.

The following diagram shows a semantic model that has a default language setting of `en-US`. The semantic model has been extended with metadata translations for three other culture names: `es-ES`, `fr-FR`, and `de-DE`.

:::image type="content" source="./media/multiple-language-locale/semantic-model-definition-translation.png" alt-text="Diagram shows semantic model objects and their metadata translations in two brief tables for the default values and three languages." lightbox="./media/multiple-language-locale/semantic-model-definition-translation.png":::

Every metadata translation is associated with a specific culture name. Cultures names act as lookup keys that are used to add and retrieve metadata translations within the context of a Power BI semantic model.

You don't need to supply metadata translations for the default language of the semantic model. Power BI can just use the semantic model object names directly for that culture name. One way to think about this is that the semantic model object names act as a virtual set of metadata translations for the default language.

:::image type="content" source="./media/multiple-language-locale/semantic-model-definition-english.png" alt-text="Diagram shows semantic model objects and their metadata translations including a translation for the default language." lightbox="./media/multiple-language-locale/semantic-model-definition-english.png":::

It's possible to explicitly add metadata translation for the default language. Use this approach sparingly. Power BI Desktop doesn't support loading metadata translations in its report designer. Instead, Power BI Desktop only loads semantic model object names. If you explicitly add metadata translations for the default language, Power BI reports look different in Power BI Desktop than they do in the Power BI service.

## Load a report in Power BI

When a user navigates to a Power BI report with an HTTP GET request, the browser transmits an HTTP header named `Accept-Language` with a value set to a valid culture name. The following screenshot shows a GET request that transmits an `Accept-Language` header value of `en-US`.

:::image type="content" source="./media/multiple-language-locale/request-header.png" alt-text="Screenshot shows request header values including a client value of accept-language of en-us." lightbox="./media/multiple-language-locale/request-header.png":::

When the Power BI service loads a report, it reads the culture name passed in the `Accept-Language` header and uses it to initialize the language and locale of the report loading context. On their devices, users can control which culture name is passed in the `Accept-Language` header value by configuring regional settings.

When you open a Power BI report in the Power BI service, you can override the `Accept-Language` header value by adding the `language` parameter at the end of the report URL and setting its value to a valid culture name. For example, you can test loading a report for a user in Canada who speaks French by setting the `language` parameter value to `fr-CA`.

:::image type="content" source="./media/multiple-language-locale/power-bi-service-override.png" alt-text="Screenshot shows the demo report with a locale included in the URL." lightbox="./media/multiple-language-locale/power-bi-service-override.png":::

> [!NOTE]
> Adding the `language` parameter to report URLs provides a convenient way to test metadata translations in the Power BI service. This technique doesn't require you to reconfigure any settings on your local machine or in your browser.

## Support multiple locales for a single language

You might need to support multiple locales for a single spoken language. Consider a scenario with users who speak French but live in different countries, such as France, Belgium, and Canada. You publish a semantic model with a default language of `en-US` and metadata translations for three more culture names including `es-ES`, `fr-FR`, and `de-DE`.

What happens when a French-speaking Canadian user opens report with an **Accept-Language** header value of `fr-CA`? Does the Power BI service load translations for French (`fr-FR`) or does it fall back on the English semantic model object names?

:::image type="content" source="./media/multiple-language-locale/browser-translation-semantic-model.png" alt-text="Diagram represents a browser with a locale setting of fr-CA connecting to a semantic model that has several locales but lacks fr-CA." lightbox="./media/multiple-language-locale/browser-translation-semantic-model.png":::

Measures currently act differently than tables and columns in Power BI. With measures, the Power BI service attempts to find the closest match. For the culture name of `fr-CA`, the names of measures would load using the metadata translations for `fr-FR`.

With tables and columns, the Power BI service requires an exact match between the culture name in the request and the supported metadata translations. If there isn't an exact match, the Power BI service falls back to loading semantic model object names. The names of tables and columns in this scenario would load using English semantic model object names.

> [!NOTE]
> This use of the default language for the names of tables and columns is a known issue for Power BI.

We recommend that you add metadata translation for any culture name you want to support. In this example, add three sets of French translations to support the culture names of `fr-FR`, `fr-BE` and `fr-CA`. The approach handles the scenario where the French translations for users in France are different from French translations for users in Canada.

:::image type="content" source="./media/multiple-language-locale/semantic-model-definition-english-metadata.png" alt-text="Diagram shows semantic model objects and their metadata translations including three French locales." lightbox="./media/multiple-language-locale/semantic-model-definition-english-metadata.png":::

## Implement translations using measures and USERCULTURE

Another feature in Power BI that helps with building multiple-language reports is the Data Analysis Expressions (DAX) `USERCULTURE` function. When called inside a measure, the `USERCULTURE` function returns the culture name of the current report loading context. This approach makes it possible to write DAX logic in measures that implement translations dynamically.

You can implement translations dynamically by calling `USERCULTURE` in a measure, but you can't achieve the same result with calculated tables or calculated columns. The DAX expressions for calculated tables and calculated columns get evaluated at semantic model load time. If you call the `USERCULTURE` function in the DAX expression for a calculated table or calculated column, it returns the culture name of the semantic model's default language. Calling `USERCULTURE` in a measure returns the culture name for the current user.

The example report displays the `USERCULTURE` return value in the upper right corner of the report banner. You don't typically display a report element like this in a real application.

:::image type="content" source="./media/multiple-language-locale/userculture-function-demo.png" alt-text="Screenshot shows the demo report with the locale displayed in the corner of the browser." lightbox="./media/multiple-language-locale/userculture-function-demo.png":::

This code is a simple example of writing a DAX expression for a measure that implements dynamic translations. You can use a `SWITCH` statement that calls `USERCULTURE` to form a basic pattern for implementing dynamic translations.

```dax
Product Sales Report Label = SWITCH( USERCULTURE() ),
  "es-ES", "Informe De Ventas De Productos",
  "fr-FR", "Rapport Sur Les Ventes De Produits",
  "fr-BE", "Rapport Sur Les Ventes De Produits",
  "fr-CA", "Rapport Sur Les Ventes De Produits",
  "de-DE", "Produktverkaufsbericht",
  "Product Sales Report"
)
```

For more information, see [Learn DAX basics in Power BI Desktop](../transform-model/desktop-quickstart-learn-dax-basics.md).

## Format dates and numbers with current user locale

You can translate dynamically by writing a DAX expression in a measure with conditional logic based on the user's culture name. In most cases, you aren't required to write conditional DAX logic based on the user's locale because Power BI visuals automatically handle locale-specific formatting behind the scenes.

In a simple scenario, you build a report for an audience of report consumers that live in both New York \(`en-US`) and in London (`en-GB`). All users speak English (`en`), but some live in different regions (`US` and `GB`) where dates and numbers are formatted differently. For example, a user from New York wants to see dates in a `mm/dd/yyyy` format while a user from London wants to see dates in a `dd/mm/yyyy` format.

Everything thing works as expected if you configure columns and measures using format strings that support regional formatting. If you're formatting a date, we recommend that you use a format string such as **Short Date** or **Long Date** because they support regional formatting.

:::image type="content" source="./media/multiple-language-locale/date-format.png" alt-text="Screenshot shows various date formats, such as short date, long date, and mmmm d, yyyy.":::

Here are a few examples of how a date value formatted with **Short Date** appears when loaded under different locales.

| Locale | Format     |
|:-------|:-----------|
| en-US  | 12/31/2022 |
| en-GB  | 31/12/2022 |
| pt-PT  | 31-12-2022 |
| de-DE  | 31.12.2022 |
| ja-JP  | 2022/12/31 |

## Related content

- [Create multiple-language reports with Translations Builder](translation-builder.md)
