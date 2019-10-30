---
title: Local storage API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to get access to browser local storage
author: zBritva
ms.author: v-ilgali
manager: rkarlin
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Local Storage

The Local Storage API is an API a custom visual can use to request the host to save or load data from the device’s storage. It's isolated in the sense that there’s separation of storage access between different visual types.

## Sample

If the custom visual should increase some counter every time the update method is called, but the counter value should also be preserved and not reset on every visual start:

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

LocalStorage API isn’t activated for Custom Visuals by default. If you want to activate it for your Custom Visual, please send request to Power BI Custom Visuals Support `pbicvsupport@microsoft.com`
