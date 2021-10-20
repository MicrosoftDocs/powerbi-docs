---
title: Local Storage API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to get access to browser local storage.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 10/19/2021
---

# Local Storage API

With the local storage API, you can store data directly in the local browser. Data stored locally is more secure, and improves performance of web apps.

Local storage is isolated so that each type of visual has its own separate storage access.

## How to use local storage

In the following example, a counter is increased whenever the *update* method is called. The counter value is saved locally
and called each time the visual starts. This way, the counter continues counting from where it left off instead of starting over each time the visual is started:

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

## Considerations and limitations

* The local storage limit is 1mb per GUID.
* Data can be shared between visuals with the same GUID only.
* Data can't be shared with another instance of PowerBI Desktop.
* The local storage API isn't activated by default. To activate it for your Power BI visual, send a request to Power BI visuals support, `pbicvsupport@microsoft.com`.  
**Your visual should be available in [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) and be [certified](power-bi-custom-visuals-certified.md).**

## Next steps

>[!div class="nextstepaction"]
>[Power BI custom visual API](visual-api.md)
