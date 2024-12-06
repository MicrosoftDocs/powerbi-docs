# Formatting settings container

A *formatting settings container* is the secondary-level properties grouping container. It groups slices into *container items* and allows to switch between these items using dropdown element.

## Formatting settings container implementation

In this example, we show how to build a custom visual formatting model with one *container* using [formattingmodel util](utils-formatting-model.md).  
The container has two items:

* **LabelsSettingsContainerItem** with two simple properties
  * Precision
  * Display units
* **IconsSettingsContainerItem** with one simple property
  * Opacity

### Prerequisites

To build a formatting model with composite container using formattingmodel utils you need to 
* Update powerbi-visuals-api version to 5.1 and higher.
* Install powerbi-visuals-utils-formattingmodel.
* Initialize [formattingSettingsService](utils-formatting-model#formatting-settings-service).
* Initialize [formatingSettingsModel class](utils-formatting-model#formatting-settings-model).

### Example

First, add objects to capabilities file:

```json
"objects": {
    "values": {
      "properties": {
        "show": {
          "type": {
            "bool": true
          }
        },
        "displayUnits": {
          "type": {
            "formatting": {
              "labelDisplayUnits": true
            }
          }
        },
        "precision": {
          "type": {
            "integer": true
          }
        },
        "opacity": {
          "type": {
            "integer": true
          }
        }
      }
    },
}
```

Then, insert the following code fragment into the settings file:

```typescript
import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

class LabelsSettingsContainerItem extends formattingSettings.SimpleCard {
    public displayUnits: formattingSettings.AutoDropdown = new formattingSettings.AutoDropdown({
        name: "displayUnits",
        displayName: "Display units",
        value: 0
    });

    public precision: formattingSettings.NumUpDown = new formattingSettings.NumUpDown({
        name: "precision",
        displayName: "Precision",
        value: 2
    });

    name: string = "labelsContainer";
    displayName: string = "All labels";
    slices: formattingSettings.Slice[] = [this.displayUnits, this.precision];
}

class IconsSettingsContainerItem extends formattingSettings.SimpleCard {
    public opacity: formattingSettings.Slider = new formattingSettings.Slider({
        name: "opacity",
        displayName: "Opacity",
        value: 50
    });

    name: string = "iconsContainer";
    displayName: string = "All icons";
    slices: formattingSettings.Slice[] = [this.opacity];
}

class ValuesCardSetting extends formattingSettings.CompositeCard {
    public show: formattingSettings.ToggleSwitch = new formattingSettings.ToggleSwitch({
        name: "show",
        value: true
    });

    public labelsContainerItem: LabelsSettingsContainerItem = new LabelsSettingsContainerItem();
    public iconsContainerItem: IconsSettingsContainerItem = new IconsSettingsContainerItem();
	
	public container: formattingSettings.Container = {
        displayName: "Apply settings to",
        containerItems: [this.labelsContainerItem, this.iconsContainerItem]
    };

    topLevelSlice: formattingSettings.ToggleSwitch = this.show;
    name: string = "values";
    displayName: string = "Values settings";
}

export class VisualSettingsModel  extends formattingSettings.Model {
    public values: ValuesCardSetting = new ValuesCardSetting();
    public cards: formattingSettings.SimpleCard[] = [this.values];
}
```

Follow steps 4 - 8 from the [Build formatting pane](utils-formatting-model#build-formatting-pane-model-using-formattingmodel-utils) tutorial.

Here's the resulting pane:
![Screenshot of the first Container item.](media/format-pane/container-first.png)
![Screenshot of the second Container item.](media/format-pane/container-second.png)

## GitHub Resources

* All formatting model interfaces can be found in [GitHub - microsoft/powerbi-visuals-api: Power BI custom visuals API](https://github.com/microsoft/powerbi-visuals-api) in “formatting-model-api.d.ts”

* We recommend using the new formatting model utils at [GitHub - microsoft/powerbi-visuals-utils-formattingmodel: Power BI visuals formatting model helper utils](https://github.com/microsoft/powerbi-visuals-utils-formattingmodel)

* You can find an example of a custom visual *SampleBarChart* that uses API version 5.1.0 and implements `getFormattingModel` using the new formatting model utils at [GitHub - microsoft/PowerBI-visuals-sampleBarChart: Bar Chart Custom Visual for tutorial](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/tree/barChartTutorial).

## Related content

[Formatting model utils](utils-formatting-model)

More questions? [Ask the Power BI Community](https://community.powerbi.com)