# GradientBar formatting slice

*GradientBar* is a simple formatting slice.

## Example: GradientBar implementation

In this example, we show how to build a *GradientBar* slice using formatting model utils.

### Capabilities object

Insert the following JSON fragment into the object labeled objects in the `capabilities.json` file.

```typescript
    "labels": {
      "properties": {
        
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

    public color: formattingSettings.GradientBar = new formattingSettings.GradientBar({
        name: "color", // same as capabilities property name
        displayName: "Color",
        value: { value: "#000000" }
    });
    
    public slices: formattingSettings.Slice[] = [ this.color ];
}

export class VisualSettings extends formattingSettings.Model {
    public labels: LabelsCardSetting = new LabelsCardSetting();
    public cards: formattingSettings.SimpleCard[] = [this.labels];
}
```