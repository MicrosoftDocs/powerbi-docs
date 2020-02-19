---
title: How to debug Power BI visuals
description: This article describes how to debug Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 02/14/2020
---

# Debugging

This page shows some tips for debugging while building your visual. It includes basic steps and shows differences between standard frontend applications and Power BI visual's debugging.
After reading the article you will be able to debug custom visuals using breakpoints, log exceptions, and catch exceptions in Chrome and Edge.

## Using breakpoints

As the visual’s JavaScript is entirely reloaded every time the visual is updated, any breakpoints you add will be lost when the debug visual is refreshed. As a workaround, use `debugger` statements in your code. It's recommended to turn off auto reload while using `debugger` in your code.

```typescript
public update(options: VisualUpdateOptions) {
    console.log('Visual update', options);
    debugger;
    this.target.innerHTML = `<p>Update count: <em>${(this.updateCount</em></p>`;
}
```


## Showing exceptions

When working on your visual, you’ll notice that all errors are 'consumed' by the Power BI service. This is an intentional feature of Power BI to prevent misbehaving visuals from causing the entire app to become unstable.

As a workaround, add code to catch and log your exceptions, or set your debugger to break on caught exceptions.


## Log exceptions

To log exceptions in your Power BI visual, add the following code to your visual, to define an exception logging decorator.

```typescript
export function logExceptions(): MethodDecorator {
     return function (target: Object, propertyKey: string, descriptor: TypedPropertyDescriptor<Function>)
    : TypedPropertyDescriptor<Function> {
            
        return {
            value: function () {
                try {
                    return descriptor.value.apply(this, arguments);
                } catch (e) {
                    console.error(e);
                    throw e;
                }
            }
        }
    }
}
```
Then, you can use this decorator on any function to see error logging.

```typescript
@logExceptions()
public update(options: VisualUpdateOptions) {
```

## Break on exceptions

You can also set the browser to break on caught exceptions. This'll stop code execution wherever an error happens, and allow you to debug from there.

### Edge

1. Open developer tools (F12).
2. Go to the **Debugger** tab.
3. Click the **break on exceptions** icon (hexagon with a pause symbol).
4. Select **Break on all exceptions**.

![Data role fields](./media/how-to-debug-edge.png)

## Chrome

1. Open developer tools (F12).
2. Go to the  **Sources** tab.
3. Click the **break on exceptions** icon (stop sign with a pause symbol).
4. Select the **Pause On Caught Exceptions** check box.

![Data role fields](./media/how-to-debug-chrome.png)

## Next steps
* [Troubleshoot Power BI visuals](../power-bi-custom-visuals-troubleshoot.md)
* For more information and answers to questions, visit [Frequently asked questions about Power BI visuals](../power-bi-custom-visuals-faq.md#organizational-power-bi-visuals)
