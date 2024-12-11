---
title: Formatting settings container
description: This article describes how to implement Formatting settings container in custom visuals using the formatting model utils
author: kullJul
ms.author: v-ikulagina
ms.reviewer: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/12/2024
---

# Formatting settings container

A *formatting settings container* is the secondary-level properties grouping container. It groups slices into *container items* and allows users to switch between these items using dropdown element.

## Formatting settings container implementation

In this example, we show how to build a custom visual formatting model with one *container* using [formattingmodel util](utils-formatting-model.md).  
The container has two items:

* **LabelsSettingsContainerItem** with two simple properties
  * Precision
  * Display units
* **IconsSettingsContainerItem** with one simple property
  * Opacity

### Prerequisites

To build a formatting model with composite container using formattingmodel utils, you need to

* Update powerbi-visuals-api version to 5.1 and higher.
* Install powerbi-visuals-utils-formattingmodel.
* Initialize [formattingSettingsService](utils-formatting-model.md#formatting-settings-service).
* Initialize [formattingSettingsModel class](utils-formatting-model.md#formatting-settings-model).

### Example

First, add objects into the `capabilities.json` file:

```json
{
  // ... same level as dataRoles and dataViewMappings
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
    }
  }
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

class ValuesCardSetting extends formattingSettings.SimpleCard {
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

Follow steps 4 - 8 from the [Build formatting pane](utils-formatting-model.md#build-formatting-pane-model-using-formattingmodel-utils) tutorial.

Here's the resulting pane:
![Screenshot of the Container.](media/format-pane/container.png)

## Related content

* [Format pane](format-pane-general.md)
* [Formatting model utils](utils-formatting-model.md)
