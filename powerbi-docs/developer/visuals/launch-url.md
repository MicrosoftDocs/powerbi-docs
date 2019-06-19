---
title: Launch URL
description: Visuals can open URL on new tab
author: Guy-Moses
ms.author: Guy-Moses
manager: AviSander
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Launch URL

Launch URL allows opening a new browser tab (or window), by delegating the actual work to Power BI.

#### Parameters

| Name | Type | Description |
|---|---|---|
| url | string | external weblink |

#### Sample

```typescript
   this.host.launchUrl('https://powerbi.microsoft.com');
```


## Usage
Use the `host.launchUrl()` API call, passing your destenation URL as a string argument:

```typescript
this.host.launchUrl('http://some.link.net');
```

## Restrictions
* Use only absolute paths, not relative ones. `http://some.link.net/subfolder/page.html` is fine, `/page.html` won't be opened.
* Currently only `http` and `https` protocols are supported. Avoid `ftp`, `mailto` etc.

## Best practices
1. For most cases, it is best to only open a link as a response to a user's explicit action. Make it easy for the user to understand that clicking the link or button will result in opening a new tab. Triggering a `launchUrl()` call without a user's action, or as a side effect of a different action can be confusing or frustrating for the user.
2. If the link is not crucial for the proper functioning of the visual, it is recommanded to provide the report's author a way to disable and hide the link. This is especially relevant for special Power BI use-cases, such as embedding a report in a 3rd party application or publishing it to the web.
3. Avoid Triggering a `launchUrl()` call from inside a loop, the visual's `update` function, or any other frequently recurring code.

## Step by step example
### Adding a link launching element
The following lines were added to the visual's `constructor` function:
```typescript
    this.helpLinkElement = this.createHelpLinkElement();
    options.element.appendChild(this.helpLinkElement);
```
And, a private function creating and attaching the anchor element was added:
```typescript
private createHelpLinkElement(): Element {
    let linkElement = document.createElement("a");
    linkElement.textContent = "?";
    linkElement.setAttribute("title", "Open documentation");
    linkElement.setAttribute("class", "helpLink");
    linkElement.addEventListener("click", () => {
        this.host.launchUrl("https://docs.microsoft.com/power-bi/developer/custom-visual-develop-tutorial");
    });
    return linkElement;
};
```
Finally, an entry in the visual.less file defines the style for the link element:

```less
.helpLink {
    position: absolute;
    top: 0px;
    right: 12px;
    display: block;
    width: 20px;
    height: 20px;
    border: 2px solid #80B0E0;
    border-radius: 20px;
    color: #80B0E0;
    text-align: center;
    font-size: 16px;
    line-height: 20px;
    background-color: #FFFFFF;
    transition: all 900ms ease;

    &:hover {
        background-color: #DDEEFF;
        color: #5080B0;
        border-color: #5080B0;
        transition: all 250ms ease;
    }

    &.hidden {
        display: none;
    }
}
```

### Adding a toggling mechanism
This requires adding a static object (see [static object tutorial](https://microsoft.github.io/PowerBI-visuals/docs/concepts/objects-and-properties)), so that the report's author can toggle the visibility of the link element (default is set to hidden).
A `showHelpLink` boolean static object was added to `capabilities.json` objects entry:

```typescript
"objects": {
    "generalView": {
            "displayName": "General View",
            "properties":
                "showHelpLink": {
                    "displayName": "Show Help Button",
                    "type": {
                        "bool": true 
                    }
                }
            }
        }
    }
```

![](./media/launchURLtoggle.png)

And, in the visual's `update` function, the following lines were added:
```typescript
    if (settings.generalView.showHelpLink) {
        this.helpLinkElement.classList.remove("hidden");
    } else {
        this.helpLinkElement.classList.add("hidden");
    }
```
The `hidden` class is defined in visual.less to control the display of the element.