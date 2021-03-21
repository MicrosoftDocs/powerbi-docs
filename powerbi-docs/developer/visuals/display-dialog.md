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

When you create a visual, there are times when it's useful to display additional information to the customer. Here are two such examples:

* To show additional information** - For example a text note or a video.

* To display an input data dialog box** - For example, a date dialog box.

## Dialog box considerations

When creating a dialog box for your visual, consider the following:

* When the dialog box is triggered, the report background is greyed.

* The dialog box appears in the middle of the screen.

* During development, you can specify the size of the dialog box.

* The dialog box will display the icon of the visual and its name.

* The dialog box can have up to three action buttons. You can choose which buttons to display from a given selection.

* The dialog box uses a rich HTML `iframe`.

## How to configure the dialog box

To configure the dialog box,

## Limitations

The dialog box must not be triggered spontaneously. It must be used as part of a user event.

## Next steps

> [!div class="nextstepaction"]
> [Create a Power BI circle card visual](develop-circle-card.md)

> [!div class="nextstepaction"]
> [Create a Power BI bar chart visual](create-bar-chart.md)
