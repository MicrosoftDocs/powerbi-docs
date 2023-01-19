---
title: Introduction to use Data view utils to create formatting models in Power BI visual
description: This article describes how to use SVG utils to create formatting models for the format pane of a custom Power BI visual.
author: mberdugo
ms.author: monaberdugo
manager: 
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 10/23/2022
ms.custom: engagement-fy23
---

# FormattingModel utils

*Formatting model utils* contains the classes, interfaces, and methods needed to build a formatting settings model to populate the property panes (format and analytics panes) of your Power BI custom visual.

## Formatting settings service

The *formatting settings service* receives a formatting settings model, and turns it into a formatting model that populates the formatting pane. The formatting model service also supports string localizations.

Initializing formatting settings service:

```typescript
import { FormattingSettingsService } from "powerbi-visuals-utils-formattingmodel";

// declaring formatting settings service 
private formattingSettingsService: FormattingSettingsService;

constructor(options: VisualConstructorOptions) {
    
    this.formattingSettingsService = new FormattingSettingsService();
    
    // ...
}
```

Formatting settings service interface **IFormattingSettingsService** has two main methods:

```typescript
    /**
     * Build visual formatting settings model from metadata dataView
     * 
     * @param dataViews metadata dataView object
     * @returns visual formatting settings model 
     */
    populateFormattingSettingsModel<T extends Model>(typeClass: new () => T, dataViews: powerbi.DataView[]): T;

    /**
     * Build formatting model by parsing formatting settings model object 
     * 
     * @returns powerbi visual formatting model
     */
    buildFormattingModel(formattingSettingsModel: Model): visuals.FormattingModel;
```

## Formatting settings model

The *settings model* contains and wraps all formatting cards for the formatting pane and analytics pane.

```typescript
export class Model {
    cards: Array<Card>;
}
```

This example declares a new formatting settings model:

```typescript
import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

import FormattingSettingsCard = formattingSettings.Card;
import FormattingSettingsModel = formattingSettings.Model;

export class VisualSettingsModel extends FormattingSettingsModel {
    // Building my visual formatting settings card
    myVisualCard: FormattingSettingsCard = new myVisualCardSettings();

    // Add formatting settings card to cards list in model
    cards = [this.myVisualCard];
}
```

## Formatting settings card

A *formatting settings card* specifies a formatting card in the formatting or analytics pane. A formatting settings card can contain multiple formatting slices, containers, and properties.
Adding slices to a formatting settings card puts all of these slices into one formatting group.
The card can populate either the formatting pane or analytics pane by setting the `analyticsPane` parameter to *true* or *false*.

Example declaring formatting settings card, including one formatting settings slice:

* Card name should match the object name in *capabilities.json*
* Slice name should match the property name in *capabilities.json*

```typescript
import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

import FormattingSettingsCard = formattingSettings.Card;
import FormattingSettingsSlice = formattingSettings.Slice;
import FormattingSettingsModel = formattingSettings.Model;

class myVisualCardSettings extends FormattingSettingsCard {
    myNumericSlice = new formattingSettings.NumUpDown({
        name: "myNumericSlice",
        displayName: "My Formatting Numeric Slice",
        value: 100,
    });

    name: string = "myVisualCard";
    displayName: string = "My Formatting Card";
    analyticsPane: boolean = false;
    slices: Array<FormattingSettingsSlice> = [this.myNumericSlice];
}
```

The *capabilities.json* property declaration should be:

```json
"objects": {
    "myVisualCard": {
        "properties": {
            "myNumericSlice": {
                "type": {
                    "numeric": true 
                }
            },
        }
    }
}
```

## Formatting settings slice

The formatting settings slice type consists of two types of slices - [simple and composite](./format-pane.md#formatting-model-components).

Each slice contains formatting properties. There's a long list of available [formatting properties types](./format-pane.md#visualization-pane-formatting-properties).

Example declaring formatting settings slice of type `NumUpDown`:

The slice name should match property name from *capabilities.json*.

```typescript
import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

myNumericSlice = new formattingSettings.NumUpDown({
    name: "myNumericSlice",
    displayName: "My Formatting Numeric Slice",
    value: 100,
});
```

## Build formatting pane model using FormattingModel Utils

1. Open your `settings.ts` file.
2. Build your own formatting settings model with all its components (cards, slices, properties ...), and name it `VisualFormattingSettings`.
  Replace your settings code with the following:

 ```typescript
 import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

 import FormattingSettingsCard = formattingSettings.Card;
 import FormattingSettingsSlice = formattingSettings.Slice;
 import FormattingSettingsModel = formattingSettings.Model;

 export class VisualSettingsModel extends FormattingSettingsModel {
     // Building my visual formatting settings card
     myVisualCard: FormattingSettingsCard = new myVisualCardSettings();

     // Add formatting settings card to cards list in model
     cards: Array<FormattingSettingsCard> = [this.myVisualCard];
 }

 class myVisualCardSettings extends FormattingSettingsCard {
     myNumericSlice = new formattingSettings.NumUpDown({
         name: "myNumericSlice",
         displayName: "My Formatting Numeric Slice",
         value: 100,
     });

     name: string = "myVisualCard";
     displayName: string = "My Formatting Card";
     analyticsPane: boolean = false;
     slices: Array<FormattingSettingsSlice> = [this.myNumericSlice];
 }
 ```

3. In your capabilities file, add your formatting objects and properties

 ```json
 "objects": {
     "myVisualCard": {
         "properties": {
             "myNumericSlice": {
                 "type": {
                     "numeric": true 
                 }
             }
         }
     }
 }
 ```

4. In your visual class, import the following:

 ```typescript
 import { FormattingSettingsService } from "powerbi-visuals-utils-formattingmodel";
 import { VisualFormattingSettingsModel } from "./settings";
 ```

5. Declare formatting settings and formatting settings service

 ```typescript
 private formattingSettings: VisualFormattingSettingsModel;
 private formattingSettingsService: FormattingSettingsService;
 ```

6. Initialize the formatting settings service in constructor

 ```typescript
 constructor(options: VisualConstructorOptions) {
     this.formattingSettingsService = new FormattingSettingsService();

     // ...
 }
 ```

7. Build formatting settings in update API using formatting settings service `populateFormattingSettingsModel`

 ```typescript
 public update(options: VisualUpdateOptions) {
     this.formattingSettings = this.formattingSettingsService.populateFormattingSettingsModel (VisualFormattingSettingsModel, options.dataViews);
     // ...
 }
 ```

8. Build formatting model and return it in `getFormattingModel` API

 ```typescript
 public getFormattingModel(): powerbi.visuals.FormattingModel {
     return this.formattingSettingsService.buildFormattingModel(this.formattingSettings);
 }
 ```

## Formatting property selector

The optional selector in the formatting properties descriptor determines where each property is bound in the dataView. There are [four distinct options](./objects-properties.md#objects-selectors-types).

You can add selector to formatting property in its descriptor object.
This example is taken from the [SampleBarChart](https://github.com/microsoft/PowerBI-visuals-sampleBarChart) for color custom visual data points using property selectors:

```typescript
new formattingSettings.ColorPicker({
    name: "fill",
    displayName: dataPoint.category,
    value: { value: dataPoint.color },
    selector: dataViewWildcard.createDataViewWildcardSelector(dataViewWildcard.DataViewWildcardMatchingOption.InstancesAndTotals),
    altConstantSelector: dataPoint.selectionId.getSelector(),
    instanceKind: powerbi.VisualEnumerationInstanceKinds.ConstantOrRule
}
```

## Reset settings to default

Formatting model utils will enable you to [reset settings to default](./format-pane.md#reset-settings-to-default) by automatically adding all the formatting properties descriptors to the formatting card list of features to revet to default descriptors `revertToDefaultDescriptors`.

You can enable resetting formatting settings from:

* The formatting card *reset to default* button

  :::image type="content" source="./media/utils-formatting-model/formatCard-reset-to-default.png" alt-text="Screenshot of format card reset to default button.":::

* The formatting pane top bar *reset all settings to default* button

  :::image type="content" source="./media/utils-formatting-model/format-pane-reset-all-settings-to-default.png" alt-text="Screenshot of format pane reset all settings to default button.":::

## Localization

For more about the localization feature and to set up localization environment, see [Add the local language to your Power BI visual](localization.md).

Init formatting settings service with localization manager in case localization is required in your custom visual:

```typescript
constructor(options: VisualConstructorOptions) {

    const localizationManager = options.host.createLocalizationManager();
    this.formattingSettingsService = new FormattingSettingsService(localizationManager);
    
    // ...
}
```

Add `displayNameKey` or `descriptionKey`  instead of `displayName` and `description` in the appropriate formatting component whenever you want a string to be localized.
Example for building a formatting slice with localized display name and description

```typescript
 myFormattingSlice = new formattingSettings.NumUpDown({
        name: "myFormattingSlice",
        displayNameKey: "myFormattingSlice_Key",
        descriptionKey: "myFormattingSlice_DescriptionKey",
        value: 100
    });
```

`displayNameKey` and `descriptionKey` values should be added to `resources.json` files.
