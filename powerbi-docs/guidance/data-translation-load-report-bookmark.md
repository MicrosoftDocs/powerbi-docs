---
title: Load multiple-language reports
description: Learn how to load multiple-language reports by using bookmarks or embedding reports that implement data translations in Power BI.
author: kfollis   
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/26/2023
---
# Load multiple-language reports

To load multiple-language reports in the user's language, you can use bookmarks or embed reports.

## Use bookmarks to select a language

If you plan to publish a Power BI report with data translations for access by users through the Power BI service, you need to load the report with the correct language for the current user. Create a set of bookmarks that apply filters to the **Languages** table.

1. Create a separate bookmark for each language that supports data translations.

   :::image type="content" source="./media/data-translation-load-report-bookmark/set-language-bookmark.png" alt-text="Screenshot shows the Filters pane with a language selected and a corresponding bookmark.":::

1. Disable **Display** and **Current Page** and only enable **Data** behavior.

   :::image type="content" source="./media/data-translation-load-report-bookmark/set-language-bookmark-data.png" alt-text="Screenshot shows the context menu for a bookmark with Data selected.":::

1. To apply the bookmark for a specific language, supply a second parameter in the report URL.

   ```http
   ?language=es&bookmarkGuid=Bookmark856920573e02a8ab1c2a
   ```

   This report URL parameter is named *bookmarkGuid*. The filtering on the **Languages** table is applied before any data is displayed to the user.

## Embed reports that implement data translations

Loading reports with Power BI embedding provides more flexibility than the report loading process for users accessing the report through the Power BI service. You can load a report using a specific language and locale by extending the `config` object passed to `powerbi.embed` with a `localeSettings` object containing a `language` property.

```javascript
let config = {
  type: "report",
  id: reportId,
  embedUrl: embedUrl,
  accessToken: embedToken,
  tokenType: models.TokenType.Embed,
  localeSettings: { language: "de-DE" }
};

// embed report using config object
let report = powerbi.embed(reportContainer, config);
```

When you embed a report with a **config** object like this which sets the **language** property of the **localeSettings** object, the metadata translations and report label translations work as expected. However, there's one more step required to filter the **Languages** table to select the appropriate language for the current user.

It's possible to apply a bookmark to an embedded a report. Instead, you can apply a filter directly on the **Languages** table as the report loads using the Power BI JavaScript API. There's no need to add bookmarks for filtering the **Languages** table if you only intend to use a report by using Power BI embedding.

To apply a filtering during the loading process of an embedded report, register an event handler for the `loaded` event. When you register an event handler for an embedded report's `loaded` event, you can provide a JavaScript event handler that runs before the rendering process begins. This approach makes the `loaded` event the ideal place to register an event handler whose purpose is to apply the correct filtering on the **Languages** table. 

Here's an example of JavaScript code that registers an event handler for the `loaded` event to apply a filter to the **Languages** table for Spanish.

``` javascript
let report = powerbi.embed(reportContainer, config);

report.on("loaded", async (event: any) => {

  // let's filter data translations for Spanish
  let languageToLoad = "es";

  // create filter object
  const filters = [{
    $schema: "http://powerbi.comproduct/schema#basic",
    target: {      table: "Languages", 
      column: "LanguageId"
    },
    operator: "In",  
    values: [ languageToLoad ], // <- Filter based on Spanish
    filterType: models.FilterType.Basic,
    requireSingleSelection: true
  }];

  // call updateFilters and pass filter object to set data translations to Spanish
  await report.updateFilters(models.FiltersOperations.Replace, filters);

});
```

> [!TIP]
> When you set filters with the Power BI JavaScript API, you should prefer the `updateFilters` method over the `setFilters` method. The `updateFilters` method allows you to remove existing filters while `setFilters` does not.

## Related content

- [Guidance for Power BI](overview.md)
