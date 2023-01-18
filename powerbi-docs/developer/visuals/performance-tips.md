---
title: Performance tips for creating quality Power BI custom visuals
description: Learn specific techniques to develop high performance Power BI custom visuals for your organization.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 01/04/2023
---
# Performance tips for creating quality Power BI custom visuals

This article covers techniques on how a developer can achieve high performance when rendering their custom visuals.

No one wants a visual to take its time when rendering. Getting the visual to render as quickly as possible becomes critical when writing the code.

> [!NOTE]
> As we continue to improve and enhance the platform, new versions of the API are constantly being released. In order to get the most out of the Power BI visuals' platform and feature set, we recommend that you keep up-to-date with the most recent version. To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

Here are some recommendations for achieving optimal performance for your custom visual.

## Use the User Timing API

Using the User Timing API to measure the app's JavaScript performance can help you decide which parts of the script need optimization.

For more information, see the [User Timing API](https://developer.mozilla.org/en-US/docs/Web/API/User_Timing_API).

## Review animation loops

Does the animation loop redraw unchanged elements?

 If so, it wastes time drawing elements that don’t change from frame-to-frame.

Solution: Update the frames selectively.

When you're animating static visualizations, it’s tempting to lump all the draw code into one update function and repeatedly call it with new data for each iteration of the animation loop.

Instead, use a visual constructor method to draw everything static. Then the update function needs to draw only the visualization elements that change.

   > [!TIP]
   > Inefficient animation loops are commonly found in axes and legends.

## Cache DOM nodes

When a node or list of nodes is retrieved from the DOM, think about whether you can reuse them in later computations (sometimes even the next loop iteration). As long as you don't need to add or delete more nodes in the relevant area, caching them can improve the application's overall efficiency.

To make sure that your code is fast and doesn’t slow down the browser, keep DOM access to a minimum.

### Cache DOM nodes example

**Instead of**:

   ```javascript
   public update(options: VisualUpdateOptions) { 
       let axis = $(".axis"); 
   }
   ```

**Try**:

   ```javascript
   public constructor(options: VisualConstructorOptions) { 
       this.$root = $(options.element); 
       this.xAxis = this.$root.find(".xAxis"); 
   } 
 
   public update(options: VisualUpdateOptions) { 
       let axis = this.axis; 
   }
   ```

## Avoid DOM manipulation

Limit DOM manipulation as much as possible.  Insert operations like `prepend()`, `append()`, and `after()` are time-consuming and shouldn't be used unless necessary.

### DOM manipulation example

**Instead of**:

  ```javascript
  for (let i=0; i<1000; i++) { 
      $('#list').append('<li>'+i+'</li>');
  }
  ```

**Try**:

Make the above example faster by using `html()` and building the list beforehand:

  ```javascript
  let list = ''; 
  for (let i=0; i<1000; i++) { 
      list += '<li>'+i+'</li>'; 
  } 

  $('#list').html(list); 
  ```

## Reconsider JQuery

Limit JS frameworks and use native JS whenever possible to increase the available bandwidth and lower your processing overhead. Doing this might also decrease compatibility issues with older browsers.

For more information, see [youmightnotneedjquery.com](http://youmightnotneedjquery.com/) for alternative examples for functions such as JQuery's `show`, `hide`, `addClass`, and more.  

## Use Canvas or WebGL

For repeated use of animations, consider using Canvas or WebGL instead of SVG. Unlike SVG, with these options performance is determined by size rather than content.

You can read more about the differences in [SVG vs Canvas: How to Choose](/previous-versions/windows/internet-explorer/ie-developer/samples/gg193983(v=vs.85)).

## Use requestAnimationFrame instead of setTimeout

If you use [requestAnimationFrame](https://www.w3.org/TR/animation-timing/) to update on-screen animations, the animation functions are called **before** the browser calls another repaint.

For more information, see this [sample](https://testdrive-archive.azurewebsites.net/Graphics/RequestAnimationFrame/Default.html) on smooth animation using `requestAnimationFrame`.

## Next steps

>[!div class="nextstepaction"]
>[Optimization guide for Power BI](../../guidance/power-bi-optimization.md)
