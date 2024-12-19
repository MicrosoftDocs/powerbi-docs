---
title: Slider formatting slice
description: This article describes how to implement Slider slice in custom visuals using the formatting model utils
author: kullJul
ms.author: v-ikulagina
ms.reviewer: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/12/2024
---

# Slider formatting slice

*Slider* is a simple formatting slice which is used to represent *numeric* and *integer* object types from `capabilities.json` file.

![Screenshot of the ToggleSwitch slice.](media/format-pane/slider.png)

## Example: Slider implementation

In this example, we show how to build a *Slider* slice using formatting model utils.

### Capabilities object

Insert the following JSON fragment into the `capabilities.json` file.

```json
{
  // ... same level as dataRoles and dataViewMappings
  "objects": {
    "labels": {
      "properties": {
        "min": {
          "type": {
            "numeric": true
          }
        }
      }
    }
  }
}
```

### Formatting model class

Insert the following code fragment into the settings file.

```typescript
import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

class LabelsCardSetting extends formattingSettings.SimpleCard {
    name: string = "labels"; // same as capabilities object name
    displayName: string = "Labels";

    public minValue : formattingSettings.Slider = new formattingSettings.Slider({
        name: "min", // same as capabilities property name
        displayName: "Min value",
        value: 50
    });
    
    public slices: formattingSettings.Slice[] = [ this.minValue ];
}

export class VisualSettings extends formattingSettings.Model {
    public labels: LabelsCardSetting = new LabelsCardSetting();
    public cards: formattingSettings.SimpleCard[] = [this.labels];
}
```

### Validators (optional)

You can validate *Slider* slice input by specifying *options* property as in the example:

```typescript
import powerbi from "powerbi-visuals-api";
import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";

class LabelsCardSetting extends formattingSettings.SimpleCard {
    name: string = "labels"; // same as capabilities object name
    displayName: string = "Labels";

    public minValue : formattingSettings.Slider = new formattingSettings.Slider({
        name: "min", // same as capabilities property name
        displayName: "Min value",
        value: 50,
        options: // optional input value validator  
        {
            maxValue: {
                type: powerbi.visuals.ValidatorType.Max,
                value: 80
            },
            minValue: {
                type: powerbi.visuals.ValidatorType.Min,
                value: 30
            }
        }
    });
    
    public slices: formattingSettings.Slice[] = [ this.minValue ];
}
```

## Related content

* [Format pane](format-pane-general.md)
* [Formatting model utils](utils-formatting-model.md)
