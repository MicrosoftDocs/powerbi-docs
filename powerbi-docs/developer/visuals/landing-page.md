---
title: Add a landing page to your Power BI visuals
description: This article describes how to add landing page to Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 05/18/2021
---

# Add a landing page to your Power BI visual

A Power BI visual’s landing page enables you to display information in your Power BI visual card, before it’s loaded with data. Here are a few examples of what a visual’s landing page can display:

* Text that explains how to use the visual
* A link to your website
* A link to a video

An example of a landing page is shown in the following image:

![landing page screenshot](media/landing-page/app-landing-page.png)

This article explains how to design a landing page for your visual. The landing page is displayed whenever the visual has no data in it.

>[!NOTE]
>Designing a Power BI visual landing page is supported from API 2.3.0. To find out which version you’re using, Run the `pbiviz -V` command.

## Creating a landing page

### Setting capabilities

To create a landing page, certain capabilities have to be set in the `capabilities.json` file.

* For the landing page to work, enable `supportsLandingPage`.
* For the landing page to be displayed in view mode or for the visual to be interactive even when in [no data-roles mode](no-dataroles-support.md), enable `supportsEmptyDataView`.

```json
    {
        "supportsLandingPage": true,
        "supportsEmptyDataView": true,
    }
```

### Example of a visual with a landing page

The following code shows how a landing page can be added to bar chart visual.

```typescript
export class BarChart implements IVisual {
    //...
    private element: HTMLElement;
    private isLandingPageOn: boolean;
    private LandingPageRemoved: boolean;
    private LandingPage: d3.Selection<any>;

    constructor(options: VisualConstructorOptions) {
            //...
            this.element = options.element;
            //...
    }

    public update(options: VisualUpdateOptions) {
    //...
        this.HandleLandingPage(options);
    }

    private HandleLandingPage(options: VisualUpdateOptions) {
        if(!options.dataViews || !options.dataViews.length) {
            if(!this.isLandingPageOn) {
                this.isLandingPageOn = true;
                const SampleLandingPage: Element = this.createSampleLandingPage(); //create a landing page
                this.element.appendChild(SampleLandingPage);
                this.LandingPage = d3.select(SampleLandingPage);
            }

        } else {
                if(this.isLandingPageOn && !this.LandingPageRemoved){
                    this.LandingPageRemoved = true;
                    this.LandingPage.remove();
                }
        }
    }
```

## Next steps

>[!div class="nextstepaction"]
>[Formatting utils](utils-formatting.md)