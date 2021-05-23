---
title: Local Storage API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to get access to browser local storage.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 05/21/2021
---

# Local Storage API

With the local storage API you can store data directly in the local browser. Data stored locally is more secure, and improves performance of web apps.

Local storage is isolated so that each type of visual has its own separate storage access.

## Example

In the following example a counter is increased whenever the *update* method is called. The counter value is saved locally
and called each time the visual starts. This enables the counter to continue counting from where it left off instead of starting over each time the visual is started:

```typescript
export class Visual implements IVisual {
        // ...
        private updateCountName: string = 'updateCount';
        private updateCount: number;
        private storage: ILocalVisualStorageService;
        // ...

        constructor(options: VisualConstructorOptions) {
            // ...
            this.storage = options.host.storageService;
            // ...

            this.storage.get(this.updateCountName).then(count =>
            {
                this.updateCount = +count;
            })
            .catch(() =>
            {
                this.updateCount = 0;
                this.storage.set(this.updateCountName, this.updateCount.toString());
            });
            // ...
        }

        public update(options: VisualUpdateOptions) {
            // ...
            this.updateCount++;
            this.storage.set(this.updateCountName, this.updateCount.toString());
            // ...
        }
}
```

## Known limitations and issues

The local Storage API isn't activated by default. To activate it for your Power BI visual, send a request to Power BI visuals support, `pbicvsupport@microsoft.com`.  
**Please note that your visual should be available in [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) and be [certified](power-bi-custom-visuals-certified.md).**

## Next steps

[Power BI custom visual API](visual-api.md)
