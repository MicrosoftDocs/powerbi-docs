
# FormattingModel utils

Formatting model utils contains the classes, interfaces, and methods to build formatting settings model to help populate properties panes (format and analytics panes). 


## Formatting settings service

Helps receive formatting settings model and turn it into formatting model to populate formatting pane. Formatting model service also can supports strings localizations.

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

Formatting settings service interface **IFormattingSettingsService** have two main methods:
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
Settings model that contain and wrap all formatting cards for formatting pane and analytics pane.
```typescript
export class Model {
    cards: Array<Card>;
}
```

Example to declare a new formatting settings model:
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
Specify a formatting card in formatting or analytics pane. A formatting settings card can contain multiple formatting slices, container and properties.
Adding slices to formatting settings card will put all of these slices into one formatting group.
Populate card into formatting pane or analytics pane by set `analyticsPane` parameter to false or true accordingly.

Example declaring formatting settings card including one formatting settings slice:
* Card name should match object name from capabilities.json
* Slice name should match property name from capabilities.json

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

capabilities.json property declaration should be:

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
Formatting settings slice type consist of two types of slices - [Simple and composite slice](./format-pane.md#formatting-model-components)

Each slice contain formatting properties, There is a long list of available [formatting properties types](./format-pane.md#visualization-pane-formatting-properties)

Example declaring formatting settings slice of type NumUpDown:
* Slice name should match property name from capabilities.json

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
2. Build your own formatting settings model with all of its components (cards, slices, properties ...), Name it `VisualFormattingSettings`.
Replace your settings code by this:

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

3. Goto your capabilities, Add your formatting objects and properties
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

4. Goto your visual class, Import the following:

```typescript
import { FormattingSettingsService } from "powerbi-visuals-utils-formattingmodel";
import { VisualFormattingSettingsModel } from "./settings";
```

5. Declare formatting settings and formatting settings service

```typescript
private formattingSettings: VisualFormattingSettingsModel;
private formattingSettingsService: FormattingSettingsService;
```

6. Init formatting settings service in constructor

```typescript
constructor(options: VisualConstructorOptions) {
    this.formattingSettingsService = new FormattingSettingsService();

    // ...
}
```

7. Build formatting settings in update API using formatting settings service `populateFormattingSettingsModel`

```typescript
public update(options: VisualUpdateOptions) {
    this.formattingSettings = this.formattingSettingsService.populateFormattingSettingsModel(VisualFormattingSettingsModel, options.dataViews);
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

The optional selector in formatting properties descriptor determines where each property is bound in the dataView. There are [four distinct options](./objects-properties.md#objects-selectors-types).

You can add selector to formatting property in its descriptor object.
Example taken from [SampleBarChart](https://github.com/microsoft/PowerBI-visuals-sampleBarChart) for color custom visual data points using property selectors :
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
Formatting model utils will enable [reset settings to default](./format-pane.md#reset-settings-to-default) feature by adding automatically all formatting properties descriptors to formatting card list of revet to default descriptors `revertToDefaultDescriptors`.

This will enable resetting formatting settings from:
1. Formatting card reset to default button

:::image type="content" source="./media/format-pane/formatCard-resetToDefault.png" alt-text="Screenshot of format card reset to default button.":::

2. Formatting pane top bar reset all settings to default button

:::image type="content" source="./media/format-pane/format-pane-resetAllSettingsToDefault.png" alt-text="Screenshot of format pane reset all settings to default button.":::

## Localization

For more about localization feature and to setup localization environment see [here]((localization.md)

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
* `displayNameKey` and `descriptionKey` values should be added also to `resources.json` files accordingly.