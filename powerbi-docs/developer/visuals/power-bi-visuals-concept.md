---
title: Power BI visuals concepts
description: The article describes how visuals integrate with Power BI and how a user can interact with a visual in Power BI.
author: KesemSharabi
ms.author: kesharab
manager: rkarlin
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Visuals in Power BI

The article describes how visuals integrate with Power BI and how a user can interact with a visual in Power BI. 

The following figure depicts how common visual-based actions that a user takes, like selecting a bookmark, are processed in Power BI.

![Power BI visual action diagram](./media/visual-concept.svg)

## Visuals get updates from Power BI

A visual can call an `update` method to get updates from Power BI. The `update` method usually contains the main logic of the visual and is responsible for rendering a chart or visualizing data.

Updates are triggered when the visual calls the `update` method.

## Action and update patterns

Actions and subsequent updates occur in these three patterns:

* The user interacts with a visual through Power BI.
* The user interacts with the visual directly.
* The visual interacts with Power BI.

### The user interacts with a visual through Power BI

* The user opens the visual's properties panel.

    When the user opens the visual's properties panel, Power BI fetches supported objects and properties from the visual's *capabilities.json* file. To receive actual values of properties, Power BI calls the `enumerateObjectInstances` method of the visual. The visual returns actual values of properties.

    For more information, see [Capabilities and properties of Power BI visuals](capabilities.md).

* The user [changes a property of the visual](../../visuals/power-bi-visualization-customize-title-background-and-legend.md) in the format panel.

    When the user changes the value of a property in the format panel, Power BI calls the `update` method of the visual. Power BI passes in the new `options` object to the `update` method. The objects contain the new values.

    For more information, see [Objects and properties of Power BI visuals](objects-properties.md).

* The user resizes the visual.

    When a user changes the size of a visual, Power BI calls the `update` method with the new `options` object. The `options` objects have nested `viewport` objects that contain the new width and height of the visual.

* The user applies a filter at the report, page, or visual level.

    Power BI filters data based on filter conditions. Power BI calls the `update` method of the visual to update the visual with new data.

    The visual gets a new update of the `options` objects when there's new data in one of the nested objects. How the update occurs depends on the data view mapping configuration of the visual.

    For more information, see [Understand data view mapping in Power BI visuals](dataview-mappings.md).

* The user selects a data point in another visual of the report.

    If the user selects a data point in another visual of the report, Power BI filters or highlights the selected data points and calls the visual's `update` method. The visual gets new filtered data, or it gets the same data with an array of highlights.

    For more information, see [Highlight data points in Power BI visuals](highlight.md).

* The user selects a bookmark in the bookmarks panel of the report.

    When the user selects a bookmark in the report's bookmarks panel, one of two actions can occur:

    * Power BI calls a function that's passed and registered by the `registerOnSelectionCallback` method. The callback function gets arrays of selections for the corresponding bookmark.

    * Power BI calls the `update` method with a corresponding `filter` object inside the `options` object.

    In either case, the visual must change its state according to the received selections or `filter` object.

    For more information about bookmarks and filters, see [Visual Filters API in Power BI visuals](filter-api.md).

### The user interacts with the visual directly

* The user hovers the mouse over a data element.

    A visual can display more information about a data point through the Power BI Tooltips API. When the user hovers the mouse over a visual element, the visual can handle the event and display data about the associated tooltip element. The visual can display either a standard tooltip or a report page tooltip.

    For more information, see [Tooltips in Power BI visuals](add-tooltips.md).

* The user changes visual properties. (For example, the user expands a tree and the visual saves state in the visual properties.)

    A visual can save properties values thought the Power BI API. For example, when a user interacts with the visual and the visual needs to save or update properties values, the visual can call the `presistProperties` method.

* The user selects a URL.

    By default, a visual can't open a URL directly. Instead, to open a URL in a new tab, the visual can call the `launchUrl` method and pass the URL as a parameter.

    For more information, see [Create a launch URL](launch-url.md).

* The user applies a filter through the visual.

    A visual can call the `applyJsonFilter` method and pass conditions to filter for data in other visuals. Several types of filters are avaible, including Basic, Advanced, and Tuple filters.

    For more information, see [Visual Filters API in Power BI visuals](filter-api.md).

* The user selects elements in the visual.

    For more information about selections in a Power BI visual, see [Add interactivity by using Power BI visual selections](selection-api.md).

### The visual interacts with Power BI

* The visual requests more data from Power BI.

    A visual processes data part by part. The `fetchMoreData` API method requests the next fragment of data in the dataset.

    For more information, see [Fetch more data from Power BI](fetch-more-data.md).

* The event service triggers.

    Power BI can export a report to PDF or send a report by e-mail (applies only to certified visuals). To notify Power BI that rendering is finished and that the visual is ready to be captured as PDF or e-mail, the visual should call the Rendering Events API.

    For more information, see [Export reports from Power BI to PDF](../../consumer/end-user-pdf.md).

    To learn about the event service, see [Render events in Power BI visuals](event-service.md).

## Next steps

Interested in creating visualizations and adding them to Microsoft AppSource? See these articles:

* [Develop a Power BI visual](./custom-visual-develop-tutorial.md)
* [Publish Power BI visuals to Partner Center](../office-store.md)
