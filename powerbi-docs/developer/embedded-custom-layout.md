---
title: Custom layouts with Power BI embedded content
description: Learn about custom layouts when embedding Power BI content in your application.
author: rkarlin
ms.author: rkarlin
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 12/19/2017
---

# Custom layouts

Use custom layout to embed a report with different layout than in an original report. Defining a new layout varies between defining only a page size, controlling visual sizes, or position and visibility.

To define a custom layout, define a custom layout object and pass it into the settings object in embed configuration. In addition, set LayoutType to Custom. To learn more, see [Embed Configuration Details](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embed-Configuration-Details).

```javascript
var embedConfig = {
    ...
    settings: {
            layoutType: models.LayoutType.Custom
    customLayout: {...}
    }
};
```

## Object Definition

```javascript
interface ICustomLayout {
  pageSize?: IPageSize;
  displayOption?: DisplayOption;
  pagesLayout?: PagesLayout;
}

enum PageSizeType {
  Widescreen,
  Standard,
  Cortana,
  Letter,
  Custom
}
interface IPageSize {
  type: PageSizeType;
}
interface ICustomPageSize extends IPageSize {
  width?: number;
  height?: number;
}

enum DisplayOption {
  FitToPage,
  FitToWidth,
  ActualSize
}
```

- `pageSize`: Use page size to control the canvas area size (i.e. report white area).
- `displayOptions`: Possible values are: FitToWidth, FitToPage or ActualSize. It controls how to scale the canvas to fit into the iframe.
- `pagesLayout`: Controls the layout for each visual. see PagesLayout for more details.

## Pages layout

Defining a pages layout object is basically defining a layout for each page, and for each page, you define a layout for each visual.
PageLayout is optional. If you don't define a layout for a page, the default layout (which is saved in the report) will be applied.

pagesLayout is a map from page name to PageLayout object. Definition:

```javascript
type PagesLayout = { [key: string]: IPageLayout; };
```

PageLayout contains a visual layout map, which maps each visual name to a visual layout object:

```javascript
interface IPageLayout {
  visualsLayout: { [key: string]: IVisualLayout; };
}
```

## Visual layout

To define a visual layout, pass a new position and size and a new visibility state.

```javascript
interface IVisualLayout {
  x?: number;
  y?: number;
  z?: number;
  width?: number;
  height?: number;
  displayState?: IVisualContainerDisplayState;
}

interface IVisualContainerDisplayState {
  mode: VisualContainerDisplayMode;
}

enum VisualContainerDisplayMode {
  Visible,
  Hidden
}
```

- `x,y,z`: Defines the new position of the visual.
- `width`, height: Defines the new size of the visual.
- `displayState`: Defines the visibility of the visual.

## Update layout

You can use updateSettings method to update the report layout any time while the report is loaded. See [Update Settings](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Update-Settings).

## Code example

```javascript
// Get models. models contains enums that can be used.
var models = window['powerbi-client'].models;

var embedConfiguration = {
    type: 'report',
    id: '5dac7a4a-4452-46b3-99f6-a25915e0fe55',
    embedUrl: 'https://app.powerbi.com/reportEmbed',
    tokenType: models.TokenType.Embed,
    accessToken: 'H4...rf',
    settings: {
            layoutType: models.LayoutType.Custom
        customLayout: {
            pageSize: {
                type: models.PageSizeType.Custom,
                width: 1600,
                height: 1200
            },
            displayOption: models.DisplayOption.ActualSize,
            pagesLayout: {
                "ReportSection1" : {
                    visualsLayout: {
                        "VisualContainer1": {
                            x: 1,
                            y: 1,
                            z: 1,
                            width: 400,
                            height: 300,
                            displayState: {
                                mode: models.VisualContainerDisplayMode.Visible
                            }
                        },
                        "VisualContainer2": {
                            displayState: {
                                mode: models.VisualContainerDisplayMode.Hidden
                            }
                        },
                    }
                }
            }
        }
    }
};

// Get a reference to the embedded report HTML element
var embedContainer = document.getElementById('embedContainer');

// Embed the report and display it within the div container.
var report = powerbi.embed(embedContainer, embedConfiguration);
```

## See also

[Embed your Power BI dashboards, reports and tiles](embedding-content.md)   
[Ask the Power BI Community](https://community.powerbi.com/)