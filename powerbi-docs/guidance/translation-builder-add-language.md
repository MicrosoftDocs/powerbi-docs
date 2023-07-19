---
title: "Add a language to a Power BI report in Translations Builder"
description: Learn how to add a secondary language and translations to a Power BI report by using Translations Builder.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/21/2023
---
# Add a language to a report in Translations Builder

When you launch Translations Builder with a .pbix project for the first time, the translation grid displays a row in for each unhidden table, measure and column in the project's underlying data model. The translation grid doesn't display rows for dataset objects in the data model that are hidden from report view. The reason for this is that hidden objects aren't displayed on a report and, therefore, don't require translations. The following screenshot shows the starting point for a simple data model before it's been modified to support secondary languages.

:::image type="content" source="./media/translation-builder-add-language/translations-builder-start.png" alt-text="Screenshot shows Translations Builder open with no languages added." lightbox="./media/translation-builder-add-language/translations-builder-start.png":::

If you examine the translation grid for this .pbix project more closely, you can see the first three columns contain read-only columns used to identity each metadata translation. Each metadata translation has an **Object Type**, a **Property** and a **Name**. Translations for the **Caption** property are always used while translations for the **Description** and **DisplayFolder** properties can be added if necessary. The fourth column in the translation grid always displays the translations for the dataset's default language and locale, which in this case is **English [en-US]**.

:::image type="content" source="./media/translation-builder-add-language/translation-grid-start.png" alt-text="Screenshot shows a grid of string values for the default language and locale.":::

> While Translations Builder makes it possible to update the translations for the default language, you should do it sparingly. Doing so can be confusing because translations for the default language don't load in Power BI Desktop.

Translations Builder provides an **Add Language** command to add secondary languages to the project's data model.

Selecting **Add Language** displays the **Add Language** dialog box, which allows the user to add one or more secondary languages.

:::image type="content" source="./media/translation-builder-add-language/translations-builder-add-language.png" alt-text="Image alt text.":::

After a new language has been added, the user can see the language in the **Secondary Languages** list.

:::image type="content" source="./media/translation-builder-add-language/translations-builder-secondary-language.png" alt-text="Screenshot shows the Add Language dialog box with a language selected and the Add Language button highlighted." lightbox="./media/translation-builder-add-language/translations-builder-secondary-language.png":::

Adding a new language also adds a new column of editable cells to the translations grid.

:::image type="content" source="./media/translation-builder-add-language/translations-builder-add-grid.png" alt-text="Screenshot shows Translations Builder grid with an empty column for the new language." lightbox="./media/translation-builder-add-language/translations-builder-add-grid.png":::

In scenarios where content creators know how to speak all the languages involved, they can add and update translations for secondary languages directly in the translation grid with an Excel-like editing experience.

:::image type="content" source="./media/translation-builder-add-language/translations-builder-add-grid-fill.png" alt-text="Screenshot shows Translations Builder grid with an empty column for the new language." lightbox="./media/translation-builder-add-language/translations-builder-add-grid-fill.png":::

> Technically speaking, Translations Builder isn't actually adding metadata translations for a specific language. Instead, it's adding metadata translations for a culture name that identifies both a language and a locale. Translations Builder abstracts away the differences between a language and a culture name. This has been done to simplify the user experience for content creators who can just think in terms of languages and countries instead of culture names.

Another important aspect of working with Translations Builder has to do with saving your work. While external tools for Power BI Desktop like Translations Builder are able to modify the dataset loaded into memory from a .pbix file, there's no way for an external tool to trigger a command to save the in-memory changes back to the underlying .pbix file. Therefore, you must always return back to Power BI Desktop and select the **Save** command any time you have added languages and any time you have created or updated translations.

:::image type="content" source="./media/translation-builder-add-language/power-bi-save-icon.png" alt-text="Screenshot shows the Power BI Desktop window with the save icon highlighted." lightbox="./media/translation-builder-add-language/power-bi-save-icon.png":::

> Once the changes have been written back to the .pbix file, that file can then be published to the Power BI service for testing. Once you have tested your work and verified that the translations are working properly, you can also store the .pbix file in a source control system such as GitHub or an Azure DevOps repository. This provides the foundation for an ALM strategy where support for secondary languages and translations can be evolved across versions of a .pbix file.

### Test translations in the Power BI service

One of the issues that makes working with translations a bit more complicated is that you can't test your work in Power BI Desktop. Instead, you must test your work in the Power BI service in a workspace associated with a Premium capacity. After you have added translation support with Translations Builder and you have saved your changes to the underlying .pbix file, you can then publish the .pbix project from Power BI Desktop to the Power BI service for testing.

:::image type="content" source="./media/translation-builder-add-language/power-bi-home-publish.png" alt-text="Screenshot shows the Power BI Desktop Home ribbon with the Publish button highlighted." lightbox="./media/translation-builder-add-language/power-bi-home-publish.png":::

After publishing your .pbix project to the Power BI service, you can test loading the report using secondary language by modifying the report URL with a query string parameter named **language**. After the report loads with its default language, you can select the browser address bar and add the following **language** parameter to the end of the report URL.

```http
/?language=es-ES
```

When you add the **language** parameter to the end of the report URL, you must assign it with a value that is a valid culture name. Once you add the **language** parameter and press **ENTER**, you should be able to verify that the parameter has been accepted by the browser as it reloads the report. If you forget to add the **?** or if you don't format the **language** parameter correctly, the browser rejects the parameter and remove it from the URL as it loads the report. Once you correctly load a report using a **language** parameter value of **es-ES**, you should see the user experience for the entire Power BI service UI switch from English to Spanish.

:::image type="content" source="./media/translation-builder-add-language/power-bi-service-spanish.png" alt-text="Screenshot shows a Power BI service experience with es-ES selected and Spanish values displayed." lightbox="./media/translation-builder-add-language/power-bi-service-spanish.png":::

You also see that the report displays the Spanish translations for the names of columns and measures.

Now that you've seen how to test your work when working with translations, it possible to make a high-level observation about working with Translations Builder. As you begin to work with secondary languages and translations to localize a .pbix project, follow the same set of steps again and again:

1. Make changes in Power BI Desktop
2. Publish the .pbix project to the Power BI service
3. Test your work with a browser in the Power BI service using the **language** parameter
4. Repeat steps 1-3 until all the translations work has been completed

> Are you starting to get excited about working with Translations Builder? If you want to jump right in and get started, you can try out the hands-on lab titled [**Hands-on Lab: Building multiple-language Reports for Power BI**](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Labs/Hands-on%20Lab%20-%20Building%20multiple-language%20Reports%20for%20Power%20BI.md).

### Embed Power BI reports using a specific language and locale

If you're developing with Power BI embedding, you can use the Power BI JavaScript API to load reports with a specific language and locale. This task is accomplished by extending the **config** object passed to **powerbi.embed** with a **localeSettings** object containing a **language** property as shown in the following code.

``` javascript
let config = {
  type: "report",
  id: reportId,
  embedUrl: embedUrl,
  accessToken: embedToken,
  tokenType: models.TokenType.Embed,
  localeSettings: { language: "de-DE" }
};

let report = powerbi.embed(reportContainer, config);
```

## Next steps