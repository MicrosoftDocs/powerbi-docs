---
title: Creating a dialog box in a Power BI visual
description: Learn how to create a dialog box in a Power BI visual to display additional information to the customer in a separate window.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/30/2023
#customer intent: As a Power BI visual developer, I want to learn how to create a dialog box in my visual so I can display additional information to the customer in a separate window.
---

# Create a dialog box for your Power BI visual

When you create a visual, sometimes it's useful to display additional information to the customer in a separate window. For example, you might want to:

- **Show additional information** - Such as a text note or a video
- **Display an input data dialog box** - Such as a date dialog box

For these purposes, you can create a dialog visual pop-up window, called a *dialog box* in this article.

## Dialog box considerations

When creating a dialog box for your visual, keep in mind that:

- During development, you can specify the size and position of the dialog box.
- When the dialog box is triggered, the report background is grayed.
- The dialog header contains the visual’s icon and its display name as a title.
- The dialog box can have up to three action buttons. You can choose which buttons to display from a [given selection](create-display-dialog-box.md#invoke-the-dialog-box).
- The dialog box uses a rich HTML `iframe`.
- While the dialog box is displayed, no action can be performed in the report until it's dismissed.
- The dialog code can use external npm libraries, just like the visual.

>[!IMPORTANT]
>The dialog box should not be triggered spontaneously. It should be the immediate result of a user action.

## Design a dialog box for your visual

To configure a dialog box, you need to add two components to your code:

- [An implementation file](#create-the-dialog-box-implementation-file) - It's best practice to create an implementation file for each dialog box.
- [Code to invoke your dialog box](#invoke-the-dialog-box) - To invoke your dialog box, add code to the `visual.ts` file.

### Create the dialog box implementation file

We recommend creating an implementation file for each dialog box you create. Place your dialog box files in the `src` folder:

:::image type="content" source="media/create-display-dialog-box/file-location.png" alt-text="Screenshot showing the location of a dialog box implementation file called DatePickerDialog.ts in a Power BI visuals project.":::

Each dialog box implementation file should include the following components:

- [A dialog box class](#create-a-dialog-box-class)
- [A result class](#create-a-result-class)
- [Registration of the dialog class](#add-your-dialog-box-to-the-registry-list)

#### Create a dialog box class

Create a dialog box class for your dialog box. The `initialState` parameter in `openModalDialog` is passed to the dialog contractor upon its creation. Use the `initialState` object to pass parameters to the dialog box, in order to affect its behavior or appearance.

The dialog code can use these `IDialogHost` methods:

- `IDialogHost.setResult(result:object)` - The dialog code returns a result object that is passed back to its calling visual.
- `IDialogHost.close(actionId: DialogAction, result?:object)` - The dialog code can programmatically close the dialog and provide a result object back to its calling visual.

Imports on top of the file:
```typescript
import powerbi from "powerbi-visuals-api";
import DialogConstructorOptions = powerbi.extensibility.visual.DialogConstructorOptions;
import DialogAction = powerbi.DialogAction;
// React imports as an example
import * as ReactDOM from 'react-dom';
import * as React from 'react';
import reactDatepicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
```

This example requires to install these packages:
```console
    npm i react-dom react react-datepicker
```

Class realization:
```typescript
export class DatePickerDialog {
    static id = "DatePickerDialog";

    constructor(options: DialogConstructorOptions, initialState: object) {
        const host = options.host;
        let pickedDate: Date;
        const startDate = new Date(initialState['startDate']);
        
        // Dialog rendering implementation
        ReactDOM.render(
            React.createElement(
                reactDatepicker,
                {
                    inline: true,
                    openToDate: startDate,
                    onChange: (date: Date) => {
                        pickedDate = date
                        host.setResult({ date: pickedDate })
                    }
                },
                null),
            options.element
        );

        document.addEventListener('keydown', e => {
            if (e.code == 'Enter' && pickedDate) {
                host.close(DialogAction.Close, {date: pickedDate});
            }
        });
    }
}
```

#### Create a result class

Create a class that returns the dialog box result, and then add it to the dialog box implementation file.

In the example below, the `DatePickerDialogResult` class returns a date string.

```typescript
export class DatePickerDialogResult {
    date: string;
}
```

#### Add your dialog box to the registry list

Every dialog implementation file needs to include a registry reference. Add the two lines in the example below to the end of your dialog box implementation file. The first line should be identical in every dialog box implementation file. The second line lists your dialog box; modify it according to the name of your dialog box class.

```javascript
globalThis.dialogRegistry = globalThis.dialogRegistry || {};
globalThis.dialogRegistry[DatePickerDialog.id] = DatePickerDialog;

```

### Invoke the dialog box

Before you create a dialog box, you need to decide which buttons it will include. Power BI visuals support the following six dialog box buttons:

```typescript
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

```typescript
import powerbi from "powerbi-visuals-api";
import DialogAction = powerbi.DialogAction;
const dialogActionsButtons = [DialogAction.OK, DialogAction.Cancel];
```

In this example, the dialog box is invoked by clicking a visual button. The visual button is defined as part of the visual constructor in the `visual.ts` file.

## Define the size and position of the dialog box

From API version 4.0 or later, you can define the size and position of the dialog box using the `DialogOpenOptions` parameter of `openModalDialog`. To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

```typescript
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

The position parameter lets you decide where the dialog box should open on the screen. You can choose to open the dialog box in the center of the screen, or you can define a different position relative to the visual.

```typescript
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

- If no type is specified, the default behavior is to open the dialog box in the center.
- The position is given in pixels relative to the top left corner of the visual.

This example shows a 250 x 300 pixel date selection dialog box 100 pixels to the left and 30 pixels below the top of the visual:

```typescript
export class Visual implements IVisual {
    private target: HTMLElement;
    private host: IVisualHost;
 
    constructor(options: VisualConstructorOptions) {
        this.host = options.host;
        this.target = options.element;
        const dialogActionsButtons = [DialogAction.OK, DialogAction.Cancel];

        const sectionDiv = document.createElement("div");

        const span = document.createElement("span");
        span.id = "datePicker";

        let button = document.createElement("button");
        button.id = "DateButton";
        button.innerText = "Date";

        button.onclick = (event) => {
            const initialDialogState = { startDate: new Date() };
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
                title: "Select a date"
            };
            this.host.openModalDialog(DatePickerDialog.id, dialogOptions, initialDialogState).
                then(ret => this.handleDialogResult(ret, span)).
                catch(error => this.handleDialogError(error, span));
        }
        sectionDiv.appendChild(button);
        sectionDiv.appendChild(span);
        this.target.appendChild(sectionDiv)
    }

    // Custom logic to handle dialog results
    private handleDialogResult( result: ModalDialogResult, targetElement: HTMLElement){
        if ( result.actionId === DialogAction.OK || result.actionId === DialogAction.Close) {
            const resultState = <DatePickerDialogResult> result.resultState;
            const selectedDate = new Date(resultState.date);
            targetElement.textContent = selectedDate.toDateString();
        }
    }

    // Custom logic to handle errors in dialog
    private handleDialogError( error: any, targetElement: HTMLElement ) {
        targetElement.textContent = "Error: " + JSON.stringify(error);
    }
}
```

## Define how to close the dialog box

The preferred method for closing the dialog box is by the end-user clicking the [x] button, one of the action buttons, or the report background.

You can also program the dialog box to automatically close by calling the `IDialogHost` close method. This method is blocked for five seconds after the dialog is opened, so that the earliest you can automatically close the dialog box is five seconds after it was initiated.

## Don't show dialog box

The dialog box appears with a checkbox that gives the user the option to block dialog boxes.

:::image type="content" source="media/create-display-dialog-box/dont-show-checkbox.png" alt-text="Screenshot showing a checkbox giving the option to block dialog boxes.":::

This checkbox is a security feature that prevents the visual from creating modal dialogs (either intentionally or not) without the user's consent.

This blocking is in effect only for the current session. So if a user blocks the CV modal dialogs but later changes their mind, they can re-enable the dialogs. To do it they need to start a new session (refresh the reports page in Power BI service, or restart Power BI Desktop).

## Considerations and limitations

- As of powerbi-visuals-API 3.8, the dialog icon and title are determined by the visual’s icon and display name and can't be changed.
- The size limitations of the dialog box are described in the table below.

    |Max/min |Width                    |Height                    |
    |--------|-------------------------|--------------------------|
    |Maximum |90% of the browser width |90% of the browser height |
    |Minimum |240 px                   |210 px                    |

- When defining the position of the dialog box, the horizontal position can be a positive or negative integer, depending on which side of the visual you want the box to be. The vertical position can't be negative, as this would place it above the visual.
- The following features don't support the Power BI visuals dialog box:
  - Embedded analytics
  - Publish to web
  - Dashboards

 You can program your visual to detect if the current environment allows opening a dialog box, by checking the boolean `this.host.hostCapabilities.allowModalDialog`.

## Related content

- [Publish a Power BI custom visual](office-store.md)
- [Create a Power BI bar chart visual](create-bar-chart.md)
