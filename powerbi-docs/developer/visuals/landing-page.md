---
title: Add a landing page to your Power BI visuals
description: This tutorial describes how to add a landing page to Power BI visuals by setting capabilities in a visual's capabilities.json file.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/17/2024
#customer intent: As a Power BI visual developer, I want to add a landing page to my visual so that I can display information in the visual card before the card gets data.
---

# Add a landing page to your Power BI visual

A Power BI visual's landing page can display information in your Power BI visual card before the card gets data. A visual's landing page can display:

* Text that explains how to use the visual.
* A link to your website.
* A link to a video.

:::image type="content" source="media/landing-page/app-landing-page.png" alt-text="Screenshot of a Power BI visual's example landing page.":::

This article explains how to design a landing page for your visual. The landing page appears whenever the visual has no data in it.

>[!NOTE]
>Designing a Power BI visual landing page is supported in API version 2.3.0 and above. To find out which version you're using, check the `apiVersion` in the *pbiviz.json* file.

## Create a landing page

To create a landing page, two capabilities must be set in the `capabilities.json` file.

* For the landing page to work, enable `supportsLandingPage`.
* For the landing page to be displayed in view mode, or for the visual to be interactive even when in [no data-roles mode](no-dataroles-support.md), enable `supportsEmptyDataView`.

```json
    {
        "supportsLandingPage": true,
        "supportsEmptyDataView": true,
    }
```

## Example of a visual with a landing page

The following code shows how a landing page can be added to a bar chart visual.

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
        if(!options.dataViews || !options.dataViews[0]?.metadata?.columns?.length){
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

## Related content

[Formatting utils](utils-formatting.md)
