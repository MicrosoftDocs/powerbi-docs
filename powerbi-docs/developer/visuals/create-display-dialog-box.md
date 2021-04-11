---
title: Creating a dialog box in a Power BI visual
description: Learn how to create a dialog box in a Power BI visual
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 03/21/2021
---

# Create a dialog box for your Power BI visual

When you create a visual, there are times when it's useful to display additional information to the customer. Here are two examples:

* **To show additional information** - Such as a text note or a video.

* **To display an input data dialog box** - Such as a date dialog box.

For these purposes, you can create a dialog visual pop-up window, referred to as a *dialog window box* in this article.

## Dialog box considerations

When creating a dialog box for your visual, consider the following:

* During development, you can specify the size of the dialog box.

* When the dialog box is triggered, the report background is greyed.

* The dialog box appears in the middle of the screen.

* The dialog box will display the icon of the visual and its name.

* The dialog box can have up to three action buttons. You can choose which buttons to display from a given selection.

* The dialog box uses a rich HTML `iframe`.

>[!IMPORTANT]
>The dialog box must not be triggered spontaneously. It must be used as part of a user event.

## How to configure a dialog box

To configure a dialog box, you need to add three components to your code:

* [A declaration](#declare-the-dialog-box-function) - Each dialog box function needs to be declared in the `visual.ts` file.

* [Button configuration](#configure-the-dialog-box-buttons) - In the `visuals.ts` file, configure the behavior of the dialog box buttons.

* [An implementation file](#create-the-dialog-box-implementation-file) - It's recommended to create an implementation file for each dialog box.

### Declare the dialog box function

Before you create a dialog box, you need to decide which buttons it will include. Power BI visuals supports the following six dialog box buttons:

```javascript
export enum DialogAction {
        Close = 0,
        OK = 1,
        Cancel = 2,
        Continue = 3,
        No = 4,
        Yes = 5
    }

```

Each dialog box you create needs to be declared in the `visauls.ts` file. The declaration needs to include the type of buttons that the dialog box displays.

```javascript
private dialogActionsButtons = [DialogAction.OK, DialogAction.Cancel];
```

### Configure the dialog box buttons

After the dialog function declaration in `visuals.ts`, configure the behavior of each dialog button.

```javascript
button.onclick = () => {
                const dialogOptions = {
                    actionButtons: this.dialogActionsButtons
                };
                this.host.openModalDialog(DatePickerDialog.id, dialogOptions).
                    then(ret => this.handleDialogResult(ret, this.textStartDate)).
                    catch(error => console.log("error:", error));
            }
```

### Create the dialog box implementation file

We recommend creating an implementation file for each dialog box you create. Place your dialog box files in the `src` folder:

:::image type="content" source="media/create-display-dialog-box/file-location.png" alt-text="Screenshot showing the location of a dialog box implementation file called DatePickerDialog.ts in a Power B I visuals project.":::

Each dialog box implementation file should include the following components:

* [A dialog box class](#create-a-dialog-box-class)

* [A result class](#create-a-result-class)

* [A registry list](#add-your-dialog-box-to-the-registry-list)

#### Create a dialog box class

Create a dialog box class for your dialog box.

```javascript
import DialogConstructorOptions = powerbi.extensibility.visual.DialogConstructorOptions;
import DialogAction = powerbi.DialogAction;

export class DatePickerDialog {
    static id = "DatePickerDialog";

    constructor(options: DialogConstructorOptions, initialState: object) {
        const host = options.host;
        
        // … dialog rendering implementation …
        
        myCalender.onValueChange((currentValue) => {
            pickedDate = currentValue.toLocaleDateString()
            host.setResult({ date: pickedDate });
        });

        myCalender.handleConfirm( () => {
            host.close(DialogAction.Apply, {date: pickedDate});
        })
    }
}
```

### Create a result class

Create a class that returns the dialog box result, and add it to the dialog box implementation file.

In the example below the `DatePickerDialogResul` class returns a date string.

```javascript
export class DatePickerDialogResult {
    date: string;
}
```

### Add your dialog box to the registry list

Every dialog implementation file needs to include a registry reference. Add the two lines in the example below, to your dialog box implementation file. The first line should be identical in every dialog box implementation file. The second line lists your dialog box, modify it according to the name of your dialog box class.

```javascript
globalThis.dialogRegistry = globalThis.dialogRegistry || {};
globalThis.dialogRegistry[DatePickerDialog.id] = DatePickerDialog;

```

## Next steps

> [!div class="nextstepaction"]
> [Create a Power BI circle card visual](develop-circle-card.md)

> [!div class="nextstepaction"]
> [Create a Power BI bar chart visual](create-bar-chart.md)
