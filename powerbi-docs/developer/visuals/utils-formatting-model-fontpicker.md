# FontPicker formatting slice

*FontPicker* is a simple formatting slice which is used to represent *fontFamily* object type from `capabilities.json` file.

![Screenshot of the FontPicker slice](media/format-pane/font-picker.png)

## Example: FontPicker implementation

In this example, we show how to build a *FontPicker* slice using formatting model utils.

### Capabilities object

Insert the following JSON fragment into the object labeled objects in the `capabilities.json` file.

```typescript
    "labels": {
      "properties": {
        "fontFamily": {
          "type": {
            "formatting": {
              "fontFamily": true
            }
          }
        },
      }
    }
```

### Formatting model class

Insert the following code fragment into the `settings.ts` file.

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