---
title: Performance tips for creating quality Power BI custom visuals
description: How to build a high performance Power BI custom visual.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 02/20/2022
ms.custom: engagement-fy23
---
# Performance tips for creating quality Power BI custom visuals

This article covers techniques a developer can use to achieve high performance when rendering custom visuals.

No one wants a visual to take a long time to render. Getting the visual to render as quickly as possible is critical when writing the code.

> [!NOTE]
> As we continue to improve and enhance the platform, new versions of the API are constantly being released. In order to get the most out of the Power BI visuals' platform and feature set, we recommend that you keep up-to-date with the most recent version. To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

Here are some recommendations for achieving optimal performance for your custom visual.

## Reduce plugin size

A smaller custom visual plugin size means:

* faster downloads
* faster installation

To decrease plugin size, see if you can [remove unused code](https://web.dev/remove-unused-code/) and try [tree-shaking and code-splitting](https://www.azavea.com/blog/2019/03/07/lessons-on-tree-shaking-lodash/).

## Check render time of the visual

Measure the render time of your visual to see which parts of the script need optimization.

### Power BI Desktop performance analyzer

Use the [Power BI Desktop performance analyzer](../../create-reports/desktop-performance-analyzer.md) to check how your visual renders in the following cases:

* first render of the visual
* with thousands of data points
* with a single data point/measure (to determine the visual render overhead)
* filtering
* slicing
* resizing (may not work in the performance analyzer)

Then, if possible, compare these measurements with those of a similar core visual to see if there are parts that need optimization.

### Use the User Timing API

Using the **User Timing API** to measure your app's JavaScript performance can also help you decide which parts of the script need optimization.

For more information, see the [User Timing API](https://msdn.microsoft.com/library/hh772738(v=vs.85).aspx).

## Review animation loops

Does the animation loop redraw unchanged elements?

 If so, it wastes time drawing elements that don’t change from frame-to-frame.

Solution: Update the frames selectively.

When you're animating static visualizations, it’s tempting to lump all the draw code into one update function and repeatedly call it with new data for each iteration of the animation loop.

Instead consider using a visual constructor method to draw everything static. Then the update function only needs to draw visualization elements that change.

   > [!TIP]
   > Inefficient animation loops are commonly found in axes and legends.

## Cache DOM nodes

When a node or list of nodes is retrieved from the DOM, think about whether you can reuse them in later computations (sometimes even the next loop iteration). As long as you don't need to add or delete more nodes in the relevant area, caching them can improve your application's overall efficiency.

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

Limit DOM manipulations as much as possible.  *Insert operations* like `prepend()`, `append()`, and `after()` are time-consuming and should only be used when necessary.

### DOM manipulation example

**Instead of:**

  ```javascript
  for (let i=0; i<1000; i++) { 
      $('#list').append('<li>'+i+'</li>');
  }
  ```

**Try:**

Make the above example faster by using `html()` and building the list beforehand:

  ```javascript
  let list = ''; 
  for (let i=0; i<1000; i++) { 
      list += '<li>'+i+'</li>'; 
  } 

  $('#list').html(list); 
  ```

## Reconsider JQuery

Limit your JS frameworks and use native JS whenever possible to increase the available bandwidth and lower your processing overhead. Doing this might also decrease compatibility issues with older browsers.

For more information, see [youmightnotneedjquery.com](http://youmightnotneedjquery.com/) for alternative examples for functions such as JQuery's `show`, `hide`, `addClass`, and more.  

## Consider canvas or WebGL

For repeated use of animations, consider using **Canvas** or **WebGL** instead of SVG. Unlike SVG, with these options performance is determined by size rather than content.

You can read more about the differences in [SVG vs Canvas: How to Choose](/previous-versions/windows/internet-explorer/ie-developer/samples/gg193983(v=vs.85)).

## Use requestAnimationFrame instead of setTimeout

If you use [requestAnimationFrame](https://www.w3.org/TR/animation-timing/) to update your on-screen animations, your animation functions are called **before** the browser calls another repaint.

For more information, see this [sample](https://testdrive-archive.azurewebsites.net/Graphics/RequestAnimationFrame/Default.html) on smooth animation using `requestAnimationFrame`.

## Next steps

>[Optimization guide for Power BI](../../guidance/power-bi-optimization.md)
