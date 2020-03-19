---
title: Power BI visuals API changelog
description: This article describes main changes in different versions of Power BI visuals API
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 03/13/2019
---

# Power BI visuals API changelog
The page contains a quick summary of the API versions.
Versions listed on this page are considered stable and should not change.

## API v2.6
  * Added **isInFocus** to update option and **switchFocusModeState** method to visual host
  * Now Custom Visuals support **subtotals** customization

## API v2.5
  * **[Analytics Pane Support](./analytics-pane.md)**
  * The DataRepetitionSelector interface is no longer supported, it was replaced with data.CustomVisualOpaqueIdentity interface
  * SelectionIdBuilder supports **withMatrixNode** and **withTable** methods

## API v2.3
  * **[Landing Page API](./landing-page.md)**
  * **[Local Storage API](./local-storage.md)**
  * **[Tuple filter API (Multi column filter)](./filter-api.md#the-tuple-filter-api-multi-column-filter)**
  * **[Rendering Events API](./event-service.md#render-events-in-power-bi-visuals)**

## API v2.2
  * **[Restoring JSON Filter from DataView](./filter-api.md#restore-the-json-filter-from-the-data-view)**
  * **[ContextMenu API](./context-menu.md)**

## API v2.1
  * Significant performance enhancements:
  * Faster loading times
  * Significantly smaller memory footprint
  * Optimized data and event transactions  

**API v2.1 Release notes**
* Filtering APIs are also being refactored and will be available in API 2.2. Not supported in 2.1.
* Visuals will only receive the dataView type that was declared in their capabilities. Visuals that used multiple dataView types will break as a result of this update.
* The `DataViewScopeIdentity` interface is no longer supported, it was replaced with the `data.DataRepetitionSelector` interface. If you used key property of the `DataViewScopeIdentity` interface, you can replace it with `JSON.stringify(identity)`
* `undefined` is replaced by `null` inside the dataView. When iterating over an array the following way “var item in myArray” it skips on undefined but doesn’t skip on null. Visuals that use this pattern may be broken by this update. Make sure you check for null in array:
```typescript
  for (var item in myArray) {
     if (!item) {
      continue;
     }
     console.log(item);
  }
```
* The `proto` property doesn’t store hidden metadata\data anymore inside the dataView. Visuals that access properties via `proto` may be broken by this update.

## API v1.13
* **[Sync Slicers](./enable-sync-slicers.md)** - Added Sync Slicers feature. Note that it’ll work only for single field slicers for now due to PBI current code state. [Read more](https://docs.microsoft.com/en-us/power-bi/desktop-slicers)
* Accessibility: [High-contrast support](./high-contrast-support.md) 
* Accessibility: Allow Keyboard Focus flag

## API v1.12
* Themes support
* **[fetchMoreData](./fetch-more-data.md)** - Fetch More Data API overcome the hard limit of 30K data points
* **[Canvas tooltips](./add-tooltips.md#add-report-page-tooltips)** - Canvas tooltip API

## API v1.11
* **[FilterManager](./filter-api.md)** - Filter Manager
* **[Bookmarks Support](./bookmarks-support.md)** - Bookmarks Support

## API v1.10
* Added ILocalizationManager
* Added Authentication API call support

## API v1.9
* **[launchUrl API](./launch-url.md)** - Added launchUrl API call support

## API v1.8
* Added new type "fillRule" (gradient) support in capabilities schema
* Added "rule" property support in capabilities schema for object properties

## API v1.7
* **[RESJSON Support](./localization.md#resource-file)** - Added RESJSON support.

## API v1.6.2
* **[Edit mode](./advanced-edit-mode.md)** - support for visual to enter in-visual edit mode
* **[Interactive (html) R custom visuals](https://microsoft.github.io/PowerBI-visuals/tutorials/building-r-powered-custom-visual/creating-r-visuals.md)** - support for creating interactive R custom visuals, based on html

## API v1.5.0
* **[Allow interactions](./visuals-interactions.md)** - support for visual interactivity

## API v1.4.0
* **[Localization Support](./localization.md)** - support for visual localization

## API v1.3.0
* **[Tooltips](./add-tooltips.md)** - Added Tooltips support

## API v1.2.0
* **colorPallette** - manage the colors used on your visual.
* **Multiple selection** - selectionManager can accept an array of `SelectionId`.
* **[R visuals](https://microsoft.github.io/PowerBI-visuals/tutorials/building-r-powered-custom-visual/creating-r-visuals.md)** - support for custom visuals using R scripts

## API v1.1.0
* Debug visual in iFrame
* Light weight sandbox - faster initialization of the iFrame
* Fix issue in [Capabilities.objects does not support "text" type](https://github.com/Microsoft/PowerBI-visuals-tools/issues/12)
* Add `pbiviz update` to support updating visual API type definitions and schema
* Add `--api-version` flag to `pbiviz new` to support creating visuals with a specific api version
* Add support for alpha release of API v1.2.0

* Visual Host Addtions
    * **createSelectionIdBuilder** - allows for creation of unique identifiers used for data selection
    * **createSelectionManager** - manages the selection state of the visual and communicates changes to the visual host
    * **colors** - an array of default colors to use in your visual

## API v1.0.0
* Initial API release