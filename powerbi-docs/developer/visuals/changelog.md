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
This page contains a quick summary of the API versions. Versions listed on this page are considered stable and will not change.

## API v2.6
  * Adds **isInFocus** to update option and **switchFocusModeState** method to visual host
  * Supports **subtotals** customization

## API v2.5
  * **[Analytics Pane](./analytics-pane.md)**
  * Supports `SelectionIdBuilder` **withMatrixNode** and **withTable** methods
  * No longer supports `DataRepetitionSelector` interface, replaced with `data.CustomVisualOpaqueIdentity` interface

## API v2.3
  * **[Landing Page API](./landing-page.md)**
  * **[Local Storage API](./local-storage.md)**
  * **[Tuple filter API (Multi column filter)](./filter-api.md#the-tuple-filter-api-multi-column-filter)**
  * **[Rendering Events API](./event-service.md#render-events-in-power-bi-visuals)**

## API v2.2
  * Supports **[Restoring JSON Filter from DataView](./filter-api.md#restore-the-json-filter-from-the-data-view)**
  * **[ContextMenu API](./context-menu.md)**

## API v2.1
  * Performance enhancements:
    * Faster load times
    * Smaller memory footprint
    * Optimized data and event transactions  

**API v2.1 Release notes**
* Refactored filtering APIs will be available in API 2.2 and are not supported in API 2.1.
* Visuals will only receive the dataView type that was declared in their capabilities. Visuals that used multiple dataView types will break as a result of this update.
* `DataViewScopeIdentity` interface is no longer supported, it was replaced with the `data.DataRepetitionSelector` interface. If you used key property of the `DataViewScopeIdentity` interface, you can replace it with `JSON.stringify(identity)`
* undefined is replaced with `null` inside the dataView. When iterating over an array the following way `var item in myArray` it skips on undefined, but doesn’t skip on `null`. Visuals that use this pattern may be broken by this update. Make sure you check for `null` in arrays:
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
* Supports **[Sync Slicers](./enable-sync-slicers.md)**, note that this will work only for single field slicers, due to PBI current code state. [Read more](/power-bi/desktop-slicers)
* Accessibility: [High-contrast support](./high-contrast-support.md) 
* Accessibility: Allow Keyboard Focus flag

## API v1.12
* Supports Themes
* **[fetchMoreData](./fetch-more-data.md)** - Fetch More Data API overcomes the hard limit of 30K data points
* **[Canvas Tooltips API](./add-tooltips.md#add-report-page-tooltips)**

## API v1.11
* **[FilterManager API](./filter-api.md)**
* Supports **[Bookmarks](./bookmarks-support.md)** 

## API v1.10
* Added `ILocalizationManager`
* Added Authentication API call support

## API v1.9
* Supports **[launchUrl API](./launch-url.md)**

## API v1.8
* Added new type "fillRule" (gradient) support in capabilities schema
* Added "rule" property support in capabilities schema for object properties

## API v1.7
* Supports **[RESJSON](./localization.md#resource-file)**

## API v1.6.2
* **[Edit mode](./advanced-edit-mode.md)** - support for visual to enter in-visual edit mode
* **[Interactive (html) R Power BI visuals](https://microsoft.github.io/PowerBI-visuals/tutorials/building-r-powered-custom-visual/creating-r-visuals.md)** - support for creating interactive R Power BI visuals, based on html

## API v1.5.0
* Supports **[Allow interactions](./visuals-interactions.md)** for visual interactivity

## API v1.4.0
* Supports **[Localization](./localization.md)**

## API v1.3.0
* Supports **[Tooltips](./add-tooltips.md)**

## API v1.2.0
* Supports **colorPallette** to manage the colors used on your visual.
* Supports **Multiple selection** - selectionManager can accept an array of `SelectionId`.
* Supports **[R visuals](https://microsoft.github.io/PowerBI-visuals/tutorials/building-r-powered-custom-visual/creating-r-visuals.md)** using R scripts.

## API v1.1.0
* Debug visual in iFrame
* Light weight sandbox with faster initialization of the iFrame
* Fixes [Capabilities.objects does not support "text" type](https://github.com/Microsoft/PowerBI-visuals-tools/issues/12) issue
* Supports `pbiviz update` to update visual API type definitions and schema
* Supports `--api-version` flag in `pbiviz new` to create visuals with a specific api version
* Supports alpha release of API v1.2.0

* Visual Host additions
    * **createSelectionIdBuilder** to create unique identifiers used for data selection
    * **createSelectionManager** to manage the selection state of the visual and communicates changes to the visual host
    * an array of default **colors** to use in your visual

## API v1.0.0
* Initial API release