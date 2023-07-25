---
title: 
description: 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/26/2023
---
### Load reports using bookmarks to select a language

If you plan to publish a Power BI report with data translations for access by users through the Power BI service, you must devise a way to load the report with the correct language filtering for the current user. This task can be accomplished by creating a set of bookmarks that apply filters to the **Languages** table. When using this approach, you start by creating a separate bookmark for each language that supports data translations.

:::image type="content" source="./media/data-translation-load-report-bookmark/image115.png" alt-text="Image alt text." lightbox="./media/data-translation-load-report-bookmark/image115.png":::

When creating bookmarks to filter tables, you should disable **Display** and **Current Page** and only enable **Data** behavior.

:::image type="content" source="./media/data-translation-load-report-bookmark/image116.png" alt-text="Image alt text." lightbox="./media/data-translation-load-report-bookmark/image116.png":::

Earlier in this article, you learned that it's possible to load a report in the Power BI service using the **language** parameter to force the Power BI service to load the metadata translations for a specific language. Now that the report implements data translations in addition to the two other types, it's now necessary to pass a second parameter in the report URL to apply the bookmark for a specific language. This report URL parameter is named **bookmarkGuid** and this parameter makes it possible to specify the ID for a bookmark that gets applied as the report is loading.

```
/? language=es & bookmarkGuid=Bookmark856920573e02a8ab1c2a
```

The filtering on the **Languages** table is applied before any data is displayed to the user.

:::image type="content" source="./media/data-translation-load-report-bookmark/image117.png" alt-text="Image alt text." lightbox="./media/data-translation-load-report-bookmark/image117.png":::

### Embed reports that implement data translations

Loading reports with Power BI embedding provides more flexibility than the report loading process for users accessing the report through the Power BI service. Earlier you saw it's possible to load a report using a specific language and locale by extending the **config** object passed to **powerbi.embed** with a **localeSettings** object containing a **language** property as shown in the following code.

``` javascript
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

> When you embed a report with a **config** object like this which sets the **language** property of the **localeSettings** object, the metadata translations and report label translations work as expected. However, there is one additional step required to filter the **Languages** table to select the appropriate language for the current user.

While it's possible to apply a bookmark to an embedded a report, the use of bookmarks isn't required as when loading reports for users in the Power BI service. Instead, you can just apply a filter directly on the **Languages** table as the report loads using the Power BI JavaScript API. There's no need to add bookmarks for filtering the **Languages** table if you only intend to use a report using Power BI embedding.

The recommended way to apply a filtering during the loading process of an embedded report is to register an event handler for the **loaded** event. When you register an event handler for an embedded report's **loaded** event, you're able to provide a JavaScript event handler that runs before the rendering process begins. This approach makes the **loaded** event the ideal place to register an event handler whose purpose is to apply the correct filtering on the **Languages** table. Here's an example of JavaScript code that registers an event handler for the **loaded** event to apply a filter to the **Languages** table for Spanish.

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

> When setting filters with the Power BI JavaScript API, you should always prefer the **updateFilters** method over the **setFilters** method. That's because **updateFilters** allows you to remove existing filters while **setFilters** does not.

## Next steps
