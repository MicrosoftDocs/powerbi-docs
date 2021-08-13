---
title: How to debug Power BI visuals
description: This article describes how to debug Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 05/14/2021
---

# Debugging Power BI visuals

This article describes some basic debugging procedures you can use when developing your visual. After reading this article you should be able use the following methods to debug your visual:

* [Insert breakpoints](#using-breakpoints)
* [Catch exceptions](#catch-exceptions)
* [Log exceptions](#log-exceptions-with-a-decorator)

## Using breakpoints

The visual's entire JavaScript is reloaded every time the visual is updated Therefore, any breakpoints you add will be lost when the debug visual is refreshed. As a workaround, use `debugger` statements in your code. It's recommended to turn off auto reload while using `debugger` in your code.
Here's an example of how to use a `debugger` statement in your *update* method.

```typescript
public update(options: VisualUpdateOptions) {
    console.log('Visual update', options);
    debugger;
    this.target.innerHTML = `<p>Update count: <em>${(this.updateCount</em></p>`;
}
```

## Catch exceptions

When working on your visual, you'll notice that all errors are 'consumed' by the Power BI service. This is an intentional feature of Power BI. It prevents misbehaving visuals from causing the entire app to become unstable.

As a workaround, add code to catch and log your exceptions, or set your debugger to break on caught exceptions.

## Log exceptions with a decorator

To log exceptions in your Power BI visual, you need define an exception logging decorator. To do this, add the following code to your visual:

```typescript
export function logExceptions(): MethodDecorator {
    return function (target: Object, propertyKey: string, descriptor: TypedPropertyDescriptor<any>): TypedPropertyDescriptor<any> {
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

You can use this decorator on any function to see error logging as follows.

```typescript
@logExceptions()
public update(options: VisualUpdateOptions) {
```

## Break on exceptions

You can also set the browser to break on caught exceptions. This stops code execution wherever an error happens, and allows you to debug from there.

### [Edge](#tab/Edge)

1. Open **developer tools** (F12).
2. Go to the **Sources** tab.
3. Click the **Pause on exceptions** icon (stop sign with a *pause* symbol).
4. Select **Pause on caught exceptions**.

    ![Screenshot shows the Debugger tab with Break on all exceptions selected.](media/visuals-how-to-debug/how-to-debug-edge-2.png)

### [Chrome](#tab/Chrome)

1. Open **developer tools** (F12).
2. Go to the  **Sources** tab.
3. Click the **Pause on exceptions** icon (stop sign with a pause symbol).
4. Select the **Pause On Caught Exceptions** check box.

    ![Screenshot shows Sources tab with Pause On Caught Exceptions selected.](media/visuals-how-to-debug/how-to-debug-chrome.png)

---

## Next steps

> [!div class="nextstepaction"]
> [Troubleshoot Power BI visuals](power-bi-custom-visuals-troubleshoot.md)

> [!div class="nextstepaction"]
> [Frequently asked questions about Power BI visuals](power-bi-custom-visuals-faq.yml#organizational-power-bi-visuals)
