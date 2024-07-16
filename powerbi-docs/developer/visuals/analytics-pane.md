---
title: The Analytics pane in Power BI visuals
description: Learn how to manage the Analytics pane to create dynamic reference lines, like min, max, or average, in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 01/13/2024
#customer intent: As a developer, I want to learn how to manage the Analytics pane in Power BI visuals so that I can create dynamic reference lines, like min, max, or average, in my visuals.
---

# The Analytics pane in Power BI visuals

The [Analytics pane](../../transform-model/desktop-analytics-pane.md) allows you to add dynamic reference lines, like min, max, or average, to your visuals. These lines can help you zoom in on important trends or insights. This article discusses how to create Power BI visuals that can present and manage dynamic reference lines in the **Analytics** pane.

:::image type="content" source="media/analytics-pane/visualization-pane-analytics-tab.png" alt-text="Screenshot of the Analytics pane in the Visualizations section.":::

> [!NOTE]
> The **Analytics** pane is available in API version 2.5.0. To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

## Manage the Analytics pane

Managing properties in the [**Analytics** pane](../../transform-model/desktop-analytics-pane.md) is similar to the managing properties in the [**Format** pane](./custom-visual-develop-tutorial-format-options.md). You define an [object](objects-properties.md) in the visual's [*capabilities.json*](capabilities.md) file.

For the **Analytics** pane, the object is defined as follows:

### [API 5.1+](#tab/API-5-1)

Under the object's definition, add only the object name, property name and type as explained [here](./format-pane.md).
Example:

```json
{
  "objects": {
    "YourAnalyticsPropertiesCard": {
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

### [Older APIs (before 5.1)](#tab/Old-API)

1. Under the object's definition, add the `displayName` and an `objectCategory` field with a value of `2`.

    >[!NOTE]
    >The `objectCategory` field defines the aspect of the visual that the object controls (1=Formatting, 2=Analytics). Use `Formatting` for elements such as look and feel, colors, axes, and labels. Use `Analytics` for elements such as forecasts, reference lines, and shapes.
    >
    > If the `objectCategory` value isn't specified, it defaults to `Formatting`.

1. Add the following two properties to the object:
   * `show` of type `bool` with a default value of `true`
   * `displayName` of type `text` with a default value of `true`

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

---

In the formatting settings card, specify that this card belongs to the analytics pane by setting the `set card analyticsPane` parameter to `true`. By default, `analyticsPane` parameter is false and the card will be added to formatting pane. See the following implementations:

#### [Using FormattingModel Utils](#tab/API-5-1-Impl-FormattingModel-Utils)

```typescript
class YourAnalyticsCardSettings extends FormattingSettingsCard {
    show = new formattingSettings.ToggleSwitch({
        name: "show",
        displayName: undefined,
        value: false,
        topLevelToggle: true
    });

    displayNameProperty = new formattingSettings.TextInput({
        displayName: "displayName",
        name: "displayName",
        placeholder: "",
        value: "Analytics Instance",
    });

    name: string = "YourAnalyticsPropertiesCard";
    displayName: string = "Your analytics properties card's name";
    analyticsPane: boolean = true; // <===  Add and set analyticsPane variable to true 
    slices = [this.show, this.displayNameProperty];
}
```

#### [Without FormattingModel Utils](#tab/API-5-1-Without-FormattingModel-Utils)

```typescript
      const show: powerbi.visuals.EnabledSlice = {
          uid: "enableAxisCard_topLevelToggle_show_uid",
          suppressDisplayName: true,
          control: {
              type: powerbi.visuals.FormattingComponent.ToggleSwitch,
              properties: {
                  descriptor: {
                      objectName: "YourAnalyticsPropertiesCard",
                      propertyName: "show"
                  },
                  value: false
              }
          }
      }
        
      const displayNameProperty: powerbi.visuals.FormattingSlice = {
          uid: "enableAxisCard_displayName_uid",
          suppressDisplayName: true,
          control: {
              type: powerbi.visuals.FormattingComponent.TextInput,
              properties: {
                  descriptor: {
                      objectName: "YourAnalyticsPropertiesCard",
                      propertyName: "displayName"
                  },
                  value: "Analytics Instance",
                  placeholder: ""
              }
          }
      }

      const averageLineCard: powerbi.visuals.FormattingCard = {
          displayName: "Your analytics properties card's name",
          uid: "yourAnalyticsCard_uid",
          analyticsPane: true, // <===  Add and set analyticsPane variable to true 
          topLevelToggle: show,
          groups: [{
              displayName: undefined,
              uid: "yourAnalyticsCard_group_uid",
              slices: [displayNameProperty],
          }]
      };
```

---

Define other properties the same way that you do for **Format** objects, and enumerate objects just as you do in the **Format** pane.

> [!NOTE]
>
> * Use the **Analytics** pane only for objects that add new information or shed new light on the presented information (for example, dynamic reference lines that illustrate important trends).
> * Any options that control the look and feel of the visual (that is, formatting) should be limited to the **Formatting** pane.

## Considerations and limitations

* The **Analytics** pane has no multi-instance support yet. The only [selector](objects-properties.md#objects-selectors-types) an object can have is *static* (that is, `selector: null`), and Power BI visuals can't have multiple instances of a user-defined card.
* Properties of type `integer` aren't displayed correctly. As a workaround, use type `numeric` instead.

## Related content

[Add conditional formatting](conditional-format.md)