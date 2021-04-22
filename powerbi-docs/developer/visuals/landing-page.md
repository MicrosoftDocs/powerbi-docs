---
title: Add a landing page to your Power BI visuals
description: This article describes how to add landing page to Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 06/18/2019
---

# Add a landing page to your Power BI visuals

With API 2.3.0, you can design your own landing page for your Power BI visuals. The landing page is displayed whenever the visual has no data in it. With a landing page, your visual initializes and updates even before you add data to it.

When the flag `supportsEmptyDataView` is true, the landing page now displays in the view mode whenever the visual has no data.

An example of a landing page is shown in the following image:

![landing page screenshot](media/landing-page/app-landing-page.png)

## Creating a landing page

### Setting capabilities

To create a landing page, certain capabilities have to be set in the `capabilities.json` file.

* For the landing page to work, enable `supportsLandingPage`.
* For the landing page to be displayed in view mode or for the visual to be interactive even when in [no data-role mode](no-dataroles-support), enable `supportsEmptyDataView`.

```json
    {
        "supportsLandingPage": true,
        "supportsEmptyDataView": true,
    }
```

###

The following code shows a sample landing page for a bar chart visual.

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