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
  * **[Analytics Pane Support](../how-to-guide/analytics-pane/)**
  * The DataRepetitionSelector interface is no longer supported, it was replaced with data.CustomVisualOpaqueIdentity interface
  * SelectionIdBuilder supports **withMatrixNode** and **withTable** methods

## API v2.3
  * **[Landing Page API](../how-to-guide/landing-page/)**
  * **[Local Storage API](../how-to-guide/local-storage/)**
  * **[Tuple filter API (Multi column filter)](../../docs/concepts/filter-api/#tuple-filter-api-multi-column-filter)**
  * **[Rendering Events API](../how-to-guide/rendering-events/)**

## API v2.2
  * **[Restoring JSON Filter from DataView](../../docs/concepts/filter-api/#restoring-json-filter-from-dataview)**
  * **[ContextMenu API](../../tutorials/building-bar-chart/adding-context-menu-to-the-bar/)**

## API v2.1
  * Significant performance enhancements:
  * Faster loading times
  * Significantly smaller memory footprint
  * Optimized data and event transactions  
[Release notes](./api-2-1)

## API v1.13
* **[Sync Slicers](../how-to-guide/enable-sync-slicers)** - Added Sync Slicers feature. Note that it’ll work only for single field slicers for now due to PBI current code state. [Read more](https://docs.microsoft.com/en-us/power-bi/desktop-slicers)
* Accessibility: [High-contrast support](../how-to-guide/high-contrast-support) 
* Accessibility: Allow Keyboard Focus flag

## API v1.12
* Themes support
* **[fetchMoreData](../../api/references/fetchmoredata/)** - Fetch More Data API overcome the hard limit of 30K data points
* **[Canvas tooltips](../how-to-guide/adding-report-page-tooltips/#support-canvas-tooltips)** - Canvas tooltip API

## API v1.11
* **[FilterManager](../../docs/concepts/filter-api)** - Filter Manager
* **[Bookmarks Support](../how-to-guide/bookmarks-support/)** - Bookmarks Support

## API v1.10
* Added ILocalizationManager
* Added Authentication API call support

## API v1.9
* **[launchUrl API](../how-to-guide/launching-url/)** - Added launchUrl API call support

## API v1.8
* Added new type "fillRule" (gradient) support in capabilities schema
* Added "rule" property support in capabilities schema for object properties

## API v1.7
* **[RESJSON Support](../how-to-guide/adding-localization/)** - Added RESJSON support.

## API v1.6.2
* **[Edit mode](../concepts/advanced-edit-mode/)** - support for visual to enter in-visual edit mode
* **[Interactive (html) R custom visuals](../../tutorials/building-r-powered-custom-visual/creating-a-new-r-powered-custom-visual/)** - support for creating interactive R custom visuals, based on html

## API v1.5.0
* **[Allow interactions](../how-to-guide/allow-interactions/)** - support for visual interactivity

## API v1.4.0
* **[Localization Support](../how-to-guide/adding-localization/)** - support for visual localization

## API v1.3.0
* **[Tooltips](../how-to-guide/adding-tooltips/)** - Added Tooltips support

## API v1.2.0
* **colorPallette** - manage the colors used on your visual.
* **Multiple selection** - selectionManager can accept an array of `SelectionId`.
* **[R visuals](../../tutorials/building-r-powered-custom-visual/creating-a-new-r-powered-custom-visual/)** - support for custom visuals using R scripts

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