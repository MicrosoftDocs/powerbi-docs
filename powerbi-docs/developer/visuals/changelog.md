---
title: Power BI visuals API changelog
description: This article provides a list of each Power BI visuals API version and the main changes made to each update.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 07/03/2024
---

# Power BI visuals API changelog

This page contains a short summary of the existing API versions and what to expect in the upcoming version. Versions listed here are considered stable and don't change.

<!--- ## Coming soon
https://github.com/microsoft/powerbi-visuals-api/blob/main/CHANGELOG.md
* Authentication API extensions --->

## API 5.10.0

* **DataViewMetadataColumn** has a new property called `sourceFieldParameters`. This property indicates if the current field is the result of a field parameter. If a single field can originate from multiple field parameters, this property lists all the related field parameters.

## API 5.9.0

* [**Hierarchial identity filter API**](./hierarchy-filter-api.md): Allows you to create a visual that can filter matrix data hierarchically based on data points. This is useful for custom visuals that leverage group-on keys and allow hierarchical filtering using identities.

## API v5.8.0

* [**Local storage API**](./local-storage.md): A new version of local storage API available for all custom visuals and controlled by a global admin setting that is *on* by default. The admin can Turn off the global setting to disable both the legacy API and the new version of the API.
* [**On-object support for custom visuals**](./on-object-formatting-api.md): On object support for custom visuals to optimize the user experience and provide a unified authoring experience on par with out of the box visuals.
* Supports Desktop February 2024

## API v5.7.0

* [**Power BI Custom Visuals Authentication API**](./authentication-api.md): Allows Custom Visuals to obtain Microsoft Entra access tokens through single sign-on (SSO), facilitating secure and efficient user-contextual operations.
* [**Dynamic drill control**](./dynamic-drill-down.md): Allows the visual to enable or disable the drill feature dynamically using an API call.
  * When the drill feature is enabled, all the functionalities of drilldown and expand/collapse features are available. These functionalities include API calls, context menu commands, header drill buttons, and support for hierarchy data.
  * When the drill feature is disabled, these functionalities aren't available.
* Supports Desktop December 2023

## API v5.4.0

* [**Improved keyboard navigation**](./supportskeyboardfocus-feature.md#enhanced-keyboard-accessibility): Improves accessibility and usability of your visuals by providing more options for interacting with visual using the keyboard.
* [**Detect filter use in reports**](./detect-filter-api.md): Detect if there are any filters applied to a report.
* Supports Desktop May 2023

## API v5.3.0

* SelectionId's update-fix for [matrix](./dataview-mappings.md#matrix-data-mapping) `dataView`.  
  > [!NOTE]
  > The selectionId's core data might change. Therefore, a persisted selectionId/identityIndex using an older API version might not be relevant in matrix visuals.
* [`downloadService`](./file-download-api.md): Adds a new method `exportVisualsContentExtended` that returns expanded result information of the download.
* Supports Desktop March 2023

## API v5.2.0

* **[Customized data reduction](./fetch-more-data.md#customized-data-reduction)** - This feature added to *capabilities.json* schema allows the [data fetch window](./fetch-more-data.md) to be modified dynamically by the custom visual code the report author.
* Supports Desktop December 2022

## API v5.1.0

* **[Custom sorting](./sort-options.md#custom-sorting)** - improved custom sorting for tables
* **[Subtotals](./total-subtotal-api.md)** - new *Subtotals Type* indicates if totals should be retrieved before or after the rest of the data
* **[Identity filter](./identity-filter-api.md)** - filter categorical data
* **[New format pane](./format-pane.md)** - design a custom visual that supports the new format pane design
* Supports Desktop October 2022

## API v4.7.0

* **[Licensing API](licensing-api.md)** - Sell, manage, and enforce licenses directly through the commercial marketplace.
* **[Drilldown API](drilldown-api.md)** - Create a visual that can trigger a drilldown operation on its own, without user interaction.  
* Supports Desktop July 2022

## API v4.6.0

* New capabilities property: [privileges](capabilities.md) and two privileges:
  * web access
  * download file from custom visual
* Added two corresponding [tenant admin switches](https://go.microsoft.com/fwlink/?linkid=2195700&clcid=0x409)
* **[Download API](./file-download-api.md)** to allow downloading visual to file
* Supports Desktop June 2022

## API v4.2.0

* New flags to [expand and collapse row headers](./dataview-mappings.md#expand-and-collapse-row-headers)
* Supports Desktop February 2022

## API v3.8.0

* Supports Desktop May 2021 and later.

## API v3.7.0

* Supports Desktop April 2021 and later.

## API v3.6.0

* Visual can receive updates from Power BI [without the need to bind any data](no-dataroles-support.md).
* Supports Desktop 2021 February and later.
* Supports Desktop RS May 2021 and later.

## API v3.4.0

* `fetchMoreData` : new `aggregateSegments` parameter (default true), for supporting no-aggregation fetchMoreData
* Supports Desktop 2020 November and later.
* Supports Desktop RS January 2021 and later.

## API v3.2.0

* Supports **[supportsMultiVisualSelection](./supportsmultivisualselection-feature.md)**
* Supports Desktop 2019 September and later.
* Supports Desktop RS January 2020 and later.

## API v2.6.0

* Adds **isInFocus** to update option and **switchFocusModeState** method to visual host
* Supports **subtotals** customization
* Supports Desktop 2019 June and later.
* Supports Desktop RS May 2019 and later.

## API v2.5.0

* Supports **[Analytics Pane](./analytics-pane.md)**
* Supports `SelectionIdBuilder` **withMatrixNode** and **withTable** methods
* No longer supports `DataRepetitionSelector` interface, replaced with `data.CustomVisualOpaqueIdentity` interface

## API v2.3.0

* **[Landing Page API](./landing-page.md)**
* **[Local Storage API](./local-storage.md)**
* **[Tuple filter API (multi-column filter)](./filter-api.md#the-tuple-filter-api-multi-column-filter)**
* **[Rendering Events API](./event-service.md)**

## API v2.2.0

* Supports **[restoring JSON Filter from DataView](./filter-api.md#restore-the-json-filter-from-the-data-view)**
* **[ContextMenu API](./context-menu.md)**
* Supports **[Drillthrough](../../create-reports/desktop-drillthrough.md)** feature

## API v2.1.0

* Performance enhancements:
  * Faster load times
  * Smaller memory footprint
  * Optimized data and event transactions  

### Release notes

* Refactored filtering APIs will be available in API 2.2 and are not supported in API 2.1.
* Visuals will only receive the dataView type that was declared in their capabilities. Visuals that used multiple dataView types will break as a result of this update.
* No longer supports `DataViewScopeIdentity` interface, replaced with `data.DataRepetitionSelector` interface. If you used key property of the `DataViewScopeIdentity` interface, you can replace it with `JSON.stringify(identity)`
* `undefined` is replaced with `null` inside the dataView. When iterating over an array using `var item in myArray` it skips on `undefined`, but doesn’t skip on `null`. Visuals that use this pattern may be broken by this update. Make sure to check for `null` in arrays:

   ```typescript
   for (var item in myArray) {
     if (!item) {
       continue;
     }
     console.log(item);
   }
   ```

* The `proto` property no longer stores hidden metadata\data inside the dataView. Visuals that access properties via `proto` may be broken by this update.

## API v1.13.0

* Supports **[Sync Slicers](./enable-sync-slicers.md)**, note this only works for single field slicers due to PBI current code state, [read more](../../visuals/power-bi-visualization-slicers.md).
* Accessibility: **[High-contrast support](./high-contrast-support.md)**
* Accessibility: Allow Keyboard Focus flag

## API v1.12.0

* Supports Themes
* Supports **[fetchMoreData](./fetch-more-data.md)**, note the **Fetch More Data API** overcomes the hard limit of 30K data points
* **[Canvas Tooltips API](./add-tooltips.md#add-tooltips-support-to-the-report-page)**

## API v1.11.0

* **[FilterManager API](./filter-api.md)**
* Supports **[Bookmarks](./bookmarks-support.md)** 

## API v1.10.0

* Adds `ILocalizationManager`
* **Authentication API**

## API v1.9.0

* **[launchUrl API](./launch-url.md)**

## API v1.8.0

* Supports new type **fillRule** (gradient) in capabilities schema
* Supports **rule** property in capabilities schema for object properties

## API v1.7.0

* Supports **[RESJSON](./localization.md#step-5---add-a-resources-file-for-each-language)**

## API v1.6.2

* Supports **[Edit mode](./advanced-edit-mode.md)** for visual to enter in-visual edit mode
* Supports **[Interactive (html) R Power BI visuals](https://github.com/PowerBi-Projects/PowerBI-visuals/blob/master/RVisualTutorial/CreateRHTML.md)**, based on html

## API v1.5.0

* Supports **[Allow interactions](./visuals-interactions.md)** for visual interactivity

## API v1.4.0

* Supports **[Localization](./localization.md)**

## API v1.3.0

* Supports **[Tooltips](./add-tooltips.md)**

## API v1.2.0

* Adds **colorPalette** to manage the colors used on your visual.
* Supports **Multiple selection** - selectionManager can accept an array of `SelectionId`.
* Supports **[R visuals](https://github.com/PowerBi-Projects/PowerBI-visuals/blob/master/RVisualTutorial/CreateRHTML.md)** using R scripts

## API v1.1.0

* Supports debug visual in iFrame
* Adds light weight sandbox with faster initialization of the iFrame
* Fixes [Capabilities.objects does not support "text" type](https://github.com/Microsoft/PowerBI-visuals-tools/issues/12) issue
* Supports `pbiviz update` to update visual API type definitions and schema
* Supports `--api-version` flag in `pbiviz new` to create visuals with a specific api version
* Supports alpha release of API v1.2.0

### Visual Host

* Adds **createSelectionIdBuilder** to create unique identifiers used for data selection
* Adds **createSelectionManager** to manage the selection state of the visual and communicates changes to the visual host
* Adds an array of default **colors** to use in visuals

## API v1.0.0

* Initial API release
