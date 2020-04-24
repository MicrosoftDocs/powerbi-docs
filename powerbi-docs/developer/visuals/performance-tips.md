---
title: Performance Tips
description: How to build a high performance Power BI visual
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 04/20/2020
---
# How to build a high performance Power BI visual
This article will cover techniques on how a developer can achieve high performance when rendering visuals. 

No one wants a visual to take its time when rendering and squeezing every drop of performance you can out of code becomes critical when rendering. 

> [!NOTE]
> We continue to improve and enhance the platform and feature set to enable our developers get the most from the Power BI visuals' platform. With new versions of the API constantly released, it's recommended you keep up-to-date with the most recent version.
>
> Since version 2.1 Power BI visual load times have improved by 20% on average.

## Performance Tips
Here are recommendations on how to achieve optimal visual performance. 

### Use User Timing API
Use the **User Timing** API to measure your app's JavaScript performance and decide which parts of scripts need optimization. For more information, see [User Timing API](https://msdn.microsoft.com/library/hh772738(v=vs.85).aspx).

### Does the animation loop redraw unchanged elements? 

 - Problem: It’s a waste of time to draw elements that don’t change frame-to-frame.

 - Solution: Update selectively. 
 
When the time comes to animate static visualizations, it’s tempting to lump draw code into one update function and repeatedly call it with new data for each iteration of the animation loop.

Instead consider the following update pattern, use a visual constructor method to draw everything static, then the update function only needs to draw visualization elements that change. 

> [!TIP]
> A common example of this would be axes and legends.

### Cache DOM Nodes 
Whenever a node or list of nodes is retrieved from the DOM, think about whether you can reuse them in a later computation (or even the next loop iteration). As long as you don't add or delete nodes in the relevant area, this is often the case.

To make sure that your code is fast and doesn’t slow down the browser, keep DOM access to a minimum. 

  - Before: 

   ```javascript
   public update(options: VisualUpdateOptions) { 
       let axis = $(".axis"); 
   }
   ```

  - After: 

   ```javascript
   public constructor(options: VisualConstructorOptions) { 
       this.$root = $(options.element); 
       this.xAxis = this.$root.find(".xAxis"); 
   } 
 
   public update(options: VisualUpdateOptions) { 
       let axis = this.axis; 
   }
   ```

### Avoid DOM manipulation 
Limit DOM manipulation as much as possible, insert operations like `prepend()`, `append()`, and `after()` are time-consuming and shouldn't be used unless necessary.

```javascript
for (let i=0; i<1000; i++) { 
    $('#list').append('<li>'+i+'</li>');
}
```

The above example could be quickened using `html()` and building the list beforehand: 

```javascript
let list = ''; 
for (let i=0; i<1000; i++) { 
    list += '<li>'+i+'</li>'; 
} 

$('#list').html(list); 
```

### JQuery reconsidered

Limiting JS frameworks and using native JS when possible can increase available bandwidth and lower processing overhead, but can further add browser compatibility issues for older browsers. 

For more information, see [youmightnotneedjquery.com](http://youmightnotneedjquery.com/) for alternative examples to using JQuery functions like `show`, `hide`, `addClass`, and more.  

### Use canvas or WebGL 
For heavy use of animations consider using a **Canvas** or **WebGL** instead of SVG. Unlike SVG, Canvas performance is determined by size rather than content. 

Read more about the differences in [SVG vs Canvas: How to Choose](https://msdn.microsoft.com/library/gg193983(v=vs.85).aspx). 

### Use requestAnimationFrame instead of setTimeout 
Use [requestAnimationFrame](https://www.w3.org/TR/animation-timing/) to update your on-screen animations. This requests that your animation functions be called **before** the browser performs the next repaint.

See this [sample](https://testdrive-archive.azurewebsites.net/Graphics/RequestAnimationFrame/Default.html) of smooth animation using `requestAnimationFrame`.

## Next steps