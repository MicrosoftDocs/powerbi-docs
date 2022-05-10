---
title: Creating a dialog box in a Power BI visual
description: Learn how to create a dialog box in a Power BI visual
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 08/17/2021
---

# Create a dialog box for your Power BI visual

When you create a visual, sometimes it's useful to display additional information to the customer in a separate window. For example, you might want to:

* **show additional information** - Such as a text note or a video

* **display an input data dialog box** - Such as a date dialog box

For these purposes, you can create a dialog visual pop-up window, called a *dialog window box* in this article.

## Dialog box considerations

When creating a dialog box for your visual, keep in mind the following:

* During development, you can specify the size and position of the dialog box.

* When the dialog box is triggered, the report background is greyed.

* The dialog header will contain the visual’s icon and its display name as a title.

* The dialog box can have up to three action buttons. You can choose which buttons to display from a [given selection](create-display-dialog-box.md#invoke-the-dialog-box).

* The dialog box uses a rich HTML `iframe`.

* While the dialog box is displayed, no action can be performed in the report until it's dismissed.

* The dialog code may use external NPM libraries, just like the visual.

>[!IMPORTANT]
>The dialog box should not be triggered spontaneously. It should be the immediate result of a user action.

## Design a dialog box for your visual

To configure a dialog box, you need to add two components to your code:

* [An implementation file](#create-the-dialog-box-implementation-file) - It's best practice to create an implementation file for each dialog box.

* [Code to invoke your dialog box](#invoke-the-dialog-box) - To invoke your dialog box, add code to the `visual.ts` file.

### Create the dialog box implementation file

We recommend creating an implementation file for each dialog box you create. Place your dialog box files in the `src` folder:

:::image type="content" source="media/create-display-dialog-box/file-location.png" alt-text="Screenshot showing the location of a dialog box implementation file called DatePickerDialog.ts in a Power B I visuals project.":::

Each dialog box implementation file should include the following components:

* [A dialog box class](#create-a-dialog-box-class)

* [A result class](#create-a-result-class)

* [Registration of the dialog class](#add-your-dialog-box-to-the-registry-list)

#### Create a dialog box class

Create a dialog box class for your dialog box. The `initialState` parameter in `openModalDialog` is passed to the dialog contractor upon its creation. Use the `initialState` object to pass parameters to the dialog box, in order to affect its behavior or appearance.

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

In the example below, the `DatePickerDialogResult` class returns a date string.

```javascript
export class DatePickerDialogResult {
    date: string;
}
```

#### Add your dialog box to the registry list

Every dialog implementation file needs to include a registry reference. Add the two lines in the example below, to your dialog box implementation file. The first line should be identical in every dialog box implementation file. The second line lists your dialog box; modify it according to the name of your dialog box class.

```javascript
globalThis.dialogRegistry = globalThis.dialogRegistry || {};
globalThis.dialogRegistry[DatePickerDialog.id] = DatePickerDialog;

```

### Invoke the dialog box

Before you create a dialog box, you need to decide which buttons it will include. Power BI visuals support the following six dialog box buttons:

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

In this example, the dialog box is invoked by clicking a visual button. The visual button is defined as part of the visual constructor in the `visual.ts` file.

## Define the size and position of the dialog box

From API version 4.0, you can define the size and position of the dialog box using the `DialogOpenOptions` parameter of `openModalDialog`.

```javascript
    export interface RectSize {
        width: number;
        height: number;
    }

    export interface DialogOpenOptions {
        title: string;
        size?: RectSize;
        position?: VisualDialogPosition;
        actionButtons: DialogAction[];
    }
```

The position parameter lets you decide where you the dialog box should open on the screen. You can choose to open the dialog box in the center of the screen, or you can define a different position relative to the visual.

```javascript
    const enum VisualDialogPositionType {
        Center = 0,
        RelativeToVisual = 1
    }

    export interface VisualDialogPosition {
        type: VisualDialogPositionType;
        left?: number;
        top?: number;
    }
```

* If no *type* is specified the default is to open the dialog box in the center.
* The position is given in pixels relative to the top left corner of the visual.

This example shows a 250 x 300 px date selection dialog box 100 pixels to the left and 30 pixels below the top of the visual:

```javascript
button.onclick = (event) => {
                console.log('click event', event);
                const initialDialogState = { startDate: this.getInitialDate() };
                const position = {
                        type: VisualDialogPositionType.RelativeToVisual,
                        left: 100,
                        top: 30
                };

                const size = {width: 250, height: 300};
                const dialogOptions = {
                    actionButtons: dialogActionsButtons,
                    size: size,
                    position: position,
                    title: `Select a start date`
                };
                this.host.openModalDialog(DatePickerDialog.id, dialogOptions, initialDialogState).
                    then(ret => this.handleDialogResult(ret, span)).
                    catch(error => this.handleDialogError(error, span));
            }
```

## How to close the dialog box

The preferred method for closing the dialog box is by the end-user clicking the [x] button, one of the action buttons or the report background.

You can also program the dialog box to automatically close by calling the `IDialogHost` close method. This method is blocked for five seconds after the dialog is opened, so that the earliest you can automatically close the dialog box is five seconds after it was initiated.

## Don't show dialog box

The dialog box appears with a checkbox that gives the user the option to block dialog boxes.

:::image type="content" source="media/create-display-dialog-box/dont-show-checkbox.png" alt-text="Screenshot showing a checkbox giving the option to block dialog boxes.":::

This checkbox is a security feature that prevents the visual from creating modal dialogs (either intentionally or not) without the user's consent.

This blocking is only in effect for the current session. So if a user blocks the CV modal dialogs but later changes their mind, they can re-enable the dialogs by starting a new session (refreshing the reports page in Power BI Service, or exiting and restarting Power BI Desktop).

## Considerations and limitations

* As of powerbi-visuals-API 3.8, the dialog icon and title are determined by the visual’s icon and display name and can't be changed.

* The size limitations of the dialog box are described in the table below.

    |Max/min |Width                    |Height                    |
    |--------|-------------------------|--------------------------|
    |Maximum |90% of the browser width |90% of the browser height |
    |Minimum |240px                    |210px                     |

* When defining the position of the dialog box, the horizontal position can be a positive or negative integer, depending on which side of the visual you want the box to be. The vertical position can't be negative, as this would place it above the visual.

* The following features don't support the Power BI visuals dialog box:

  * Embedded analytics
  * Publish to web
  * Dashboards

 You can program your visual to detect whether the current environment allows opening a dialog box, by checking the boolean `this.host.hostCapabilities.allowModalDialog`.

## Next steps

> [!div class="nextstepaction"]
> [Publish a Power BI custom visual](office-store.md)

> [!div class="nextstepaction"]
> [Create a Power BI bar chart visual](create-bar-chart.md)
