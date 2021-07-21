---
title: Power BI visuals API changelog 
description: This article describes main changes in different versions of Power BI visuals API.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 03/13/2019
---

# Power BI visuals API changelog
This page contains a quick summary of the API versions. Versions listed here are considered stable and will not change.

## API v3.6.0
  * Visual can receive updates from Power BI without the need to bind any data, by setting in **capabilities.json**: `"supportsLandingPage"` and newly added `"supportsEmptyDataView"` to a **"true"** value.  
  * Supports Desktop 2021 February and later.

## API v3.4.0
  * `fetchMoreData` : new `aggregateSegments` parameter (default true), for supporting no-aggregation fetchMoreData
  * Supports Desktop 2020 November and later.

## API v3.2.0
  * Supports **[supportsMultiVisualSelection](./supportsmultivisualselection-feature.md)**
  * Supports Desktop 2019 September and later.

## API v2.6.0
  * Adds **isInFocus** to update option and **switchFocusModeState** method to visual host
  * Supports **subtotals** customization
  * Supports Desktop 2019 June and later.

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

**Release notes**
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
* Accessibility: [High-contrast support](./high-contrast-support.md) 
* Accessibility: Allow Keyboard Focus flag

## API v1.12.0
* Supports Themes
* Supports **[fetchMoreData](./fetch-more-data.md)**, note the **Fetch More Data API** overcomes the hard limit of 30K data points
* **[Canvas Tooltips API](./add-tooltips.md#add-report-page-tooltips)**

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

**Visual Host**
* Adds **createSelectionIdBuilder** to create unique identifiers used for data selection
* Adds **createSelectionManager** to manage the selection state of the visual and communicates changes to the visual host
* Adds an array of default **colors** to use in visuals

## API v1.0.0
* Initial API release
