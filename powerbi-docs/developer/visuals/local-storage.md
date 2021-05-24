---
title: Local Storage API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to get access to browser local storage.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 01/21/2019
---

# Local Storage API

The Local Storage API is an API a custom visual can use to request the host to save or load data from the device's storage. It's isolated in the sense that there's separation of storage access between different visual types.

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

The LocalStorage limit is 1mb per GUID.

While using LocalStorage API you can share data just between visuals with same GUID inside one instance of PowerBI Desktop. LocalStorage API does not allow to share the datа between two instances of PowerBI Desktop. It also can not share data between two visuals with different GUID.

Local Storage API isn't activated for Power BI visuals by default. If you want to activate it for your Power BI visual, send a request to Power BI visuals Support `pbicvsupport@microsoft.com`.

**Please note that your visual should be available in [AppSource](https://appsource.microsoft.com/en-us/marketplace/apps?product=power-bi-visuals) and be [certified](https://powerbi.microsoft.com/en-us/documentation/powerbi-custom-visuals-certified/).**
