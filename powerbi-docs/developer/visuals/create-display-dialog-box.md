---
title: Creating a dialog box in a Power BI visual
description: Learn how to create a dialog box in a Power BI visual
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 08/17/2021
---

# Create a dialog box for your Power BI visual

When you create a visual, there are times when it's useful to display additional information to the customer in a separate window. Here are two examples:

* **To show additional information** - Such as a text note or a video.

* **To display an input data dialog box** - Such as a date dialog box.

For these purposes, you can create a dialog visual pop-up window, referred to as a *dialog window box* in this article.

## Dialog box considerations

When creating a dialog box for your visual, consider the following:

* During development, you can specify the size of the dialog box.

* When the dialog box is triggered, the report background is greyed.

* The dialog box appears in the middle of the screen.

* The dialog box always displays the icon and name of the visual.

* The dialog box can have up to three action buttons. You can choose which buttons to display from a [given selection](create-display-dialog-box.md#invoke-the-dialog-box).

* The dialog box uses a rich HTML `iframe`.

* While the dialog box is displayed, no action can be performed in the report until it's dismissed.

* The dialog code may use external NPM libraries, just like the visual.

>[!IMPORTANT]
>The dialog box should not be triggered spontaneously. It must be an immediate result of a user action.

## Design a dialog box for your visual

To configure a dialog box, you need to add two components to your code:

* [An implementation file](#create-the-dialog-box-implementation-file) - It's recommended to create an implementation file for each dialog box.

* [Code to invoke your dialog box](#invoke-the-dialog-box) - To invoke your dialog box, add code to the `visual.ts` file.

### Create the dialog box implementation file

We recommend creating an implementation file for each dialog box you create. Place your dialog box files in the `src` folder:

:::image type="content" source="media/create-display-dialog-box/file-location.png" alt-text="Screenshot showing the location of a dialog box implementation file called DatePickerDialog.ts in a Power B I visuals project.":::

Each dialog box implementation file should include the following components:

* [A dialog box class](#create-a-dialog-box-class)

* [A result class](#create-a-result-class)

* [Registration of the dialog class](#add-your-dialog-box-to-the-registry-list)

#### Create a dialog box class

Create a dialog box class for your dialog box. The `initialState` parameter in `openModalDialog`, is passed to the dialog contractor upon its creation. Use the `initialState` object to pass parameters to the dialog box, in order to affect its behavior or appearance.

The dialog code can use these `IDialogHost` methods:

* `IDialogHost.setResult(result:object)` - The dialog code returns a result object that will be passed back to its calling visual.

* `IDialogHost.close(actionId: DialogAction, result?:object)` - The dialog code can programmatically close the dialog and provide a result object back to its calling visual.

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
            host.close(DialogAction.Close, {date: pickedDate});
        })
    }
}
```

#### Create a result class

Create a class that returns the dialog box result, and add it to the dialog box implementation file.

In the example below the `DatePickerDialogResult` class returns a date string.

```javascript
export class DatePickerDialogResult {
    date: string;
}
```

#### Add your dialog box to the registry list

Every dialog implementation file needs to include a registry reference. Add the two lines in the example below, to your dialog box implementation file. The first line should be identical in every dialog box implementation file. The second line lists your dialog box, modify it according to the name of your dialog box class.

```javascript
globalThis.dialogRegistry = globalThis.dialogRegistry || {};
globalThis.dialogRegistry[DatePickerDialog.id] = DatePickerDialog;

```

### Define the size of the dialog box

The size of the dialog box can be defined by setting the width and height of DialogConstructorOptions.element. You can define the size either in Javascript Or CSS.

### Size {.tabset}

#### Javascript

Add the width and height to the constructor method

```javascript
    options.element.style.width = '400px';
    options.element.style.height = '600px';
```

#### CSS

Add the following line to the constructor:

`options.element.classList.add('dialog-container');`

In the .less file:

```css
body.dialog-container {
    margin: 0;
    display: grid;
    > div {
        margin: 10px 0;
        height: 270px;
        width: 244px;
        display: flex;
        justify-content: center;
    }
}
```

### Invoke the dialog box

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

Each dialog box you create needs to be invoked in the `visual.ts` file. In this example, the dialog box is defined with two action buttons.

```javascript
private dialogActionsButtons = [DialogAction.OK, DialogAction.Cancel];
```

In this example, the dialog box is invoked by clicking a visual button. This is defined as part of the visual constructor in the `visual.ts` file.

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

## How to close the dialog box?

The preferred method for closing the dialog box is by the end-user clicking the [x] button, one of the action buttons or the report background.

You can also program the dialog box to automatically close, by calling the `IDialogHost` close method. This method will be blocked for five seconds after the dialog is open, so that the earliest you can automatically close the dialog box is five seconds after it was initiated.

## Limitations

* The size limitations of the dialog box are described in the table below.

    |Max/min |Width                    |Height                    |
    |--------|-------------------------|--------------------------|
    |Maximum |90% of the browser width |90% of the browser height |
    |Minimum |240px                    |210px                     |

* Certain environments, such as dashboards, block the use of dialog boxes. You can program your visual to detect whether the current environment allows opening a dialog box, by checking the boolean `this.host.hostCapabilities.allowModalDialog`.
* As of powerbi-visuals-API 3.8, the dialog icon and title are determined by the visual’s icon and display name and can't be changed.
* The following features don't support the Power BI visuals dialog box:

  * Embedded analytics
  * Publish to web
  * Dashboards

## Next steps

> [!div class="nextstepaction"]
> [Create a Power BI circle card visual](develop-circle-card.md)

> [!div class="nextstepaction"]
> [Create a Power BI bar chart visual](create-bar-chart.md)
