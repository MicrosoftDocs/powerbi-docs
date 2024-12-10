---
title: FontPicker formatting slice
description: This article describes how to implement FontPicker slice in custom visuals using the formatting model utils
author: kullJul
ms.author: ''
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/12/2024
---

# FontPicker formatting slice

*FontPicker* is a simple formatting slice which is used to represent *fontFamily* object type from `capabilities.json` file.

![Screenshot of the FontPicker slice](media/format-pane/font-picker.png)

## Example: FontPicker implementation

In this example, we show how to build a *FontPicker* slice using formatting model utils.

### Capabilities object

Insert the following JSON fragment into the `capabilities.json` file.

```json
{
  // ... same level as dataRoles and dataViewMappings
  "objects": {
    "labels": {
      "properties": {
        "fontFamily": {
          "type": {
            "formatting": {
              "fontFamily": true
            }
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

    public fontFamily: formattingSettings.FontPicker = new formattingSettings.FontPicker({
        name: "fontFamily", // same as capabilities property name
        displayName: "Font family",
        value: "Arial, sans-serif"
    });

    public slices: formattingSettings.Slice[] = [ this.fontFamily ];
}

export class VisualSettings extends formattingSettings.Model {
    public labels: LabelsCardSetting = new LabelsCardSetting();
    public cards: formattingSettings.SimpleCard[] = [this.labels];
}
```

## Related content

[Format pane](format-pane-general.md)
[Formatting model utils](utils-formatting-model.md)