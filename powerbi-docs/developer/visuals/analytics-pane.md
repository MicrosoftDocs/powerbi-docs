---
title: The Analytics pane in Power BI visuals
description: This article describes how to create dynamic reference lines in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 10/19/2021
---

# The Analytics pane in Power BI visuals

The [**Analytics** pane](../../transform-model/desktop-analytics-pane.md) allows you to add dynamic reference lines (min, max, average etc.) to your visuals. These lines can help you zoom in on important trends or insights. This article discusses how to create Power BI visuals that can present and manage dynamic reference lines in the **Analytics** pane.

![The Analytics pane](media/analytics-pane/visualization-pane-analytics-tab.png)

> [!NOTE]
> The **Analytics** pane is available from API version 2.5.0. To find out which version you’re using, run the `pbiviz -V` command.

## Manage the Analytics pane

Managing properties in the [**Analytics** pane](../../transform-model/desktop-analytics-pane.md) is very similar to the managing properties in the [**Format** pane](./custom-visual-develop-tutorial-format-options.md). You define an [object](objects-properties.md) in the visual's [*capabilities.json*](capabilities.md) file.

For the **Analytics** pane, the object is defined as follows:

* Under the object's definition, add the `displayName` and an `objectCategory` field with a value of `2`.

    >[!NOTE]
    >The `objectCategory` field defines the aspect of the visual that the object controls (1=Formatting, 2=Analytics). Use `Formatting` for elements such as look and feel, colors, axes, and labels. Use `Analytics` for elements such as forecasts, trendlines, reference lines, and shapes.
    >
    > If the `objectCategory` value isn't specified, it defaults to `Formatting`.

* Add the following two properties to the object:
  * `show` of type `bool`, with a default value of `true`.
  * `displayName` of type `text` with a default value of `true`.

```json
{
  "objects": {
    "YourAnalyticsPropertiesCard": {
      "displayName": "Your analytics properties card's name",
      "objectCategory": 2,
      "properties": {
        "show": {
          "type": {
            "bool": true
          }
        },
        "displayName": {
          "type": {
            "text": true
          }
        },
      ... //any other properties for your Analytics card
      }
    }
  ...
  }
}
```

You can define other properties in the same way that you do for **Format** objects. And you can enumerate objects just as you do in the **Format** pane.

> [!NOTE]
>
> * Use the **Analytics** pane only for objects that add new information or shed new light on the presented information (for example, dynamic reference lines that illustrate important trends).
> * Any options that control the look and feel of the visual (that is, formatting) should be limited to the **Formatting** pane.

## Considerations and limitations

* The **Analytics** pane has no multi-instance support yet. The only [selector](objects-properties.md#objects-selector) an object can have is *static* (that is, `selector: null`), and Power BI visuals can't have user-defined multiple instances of a card.
* Properties of type `integer` aren't displayed correctly. As a workaround, use type `numeric` instead.

## Next Steps

> [!div class="nextstepaction"]
> [Add conditional formatting](conditional-format.md)
