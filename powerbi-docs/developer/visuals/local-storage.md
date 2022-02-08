---
title: Local Storage API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to get access to browser local storage
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

## API

Local storage interface is shown in the following code:

```typescript
    export interface ILocalVisualStorageService {
        /**
         * Checks if the local storage is enabled for use.
         * 
         * @returns true if the local storage is enabled and false otherwise
         */
        enabled(): IPromise<boolean>;

        /**
         * Returns promise that resolves to the data associated with 'key' if it was found or rejects otherwise.
         * 
         * @param key - the name of the payload to retrieve
         * @returns the promise that resolves to the data required or rejects if it wasn't found
         */
        get(key: string): IPromise<string>;

        /**
         * Saves the data to local storage. This data can be later be retrieved using the 'key'.
         * Returns a promise that resolves to the amount of free space available to caller after the save if there 
         * is any or rejects otherwise. 
         * 
         * @param key - the name of the payload to store
         * @param data - the payload string to store
         * @returns the promise resolves to the amount of free space available or rejects if there is no free space to store the data
         */
        set(key: string, data: string): IPromise<number>;

        /**
         * Deletes data associated with 'key' from local storage.
         * 
         * @param key - the name of the payload to remove
         */
        remove(key: string): void;
    }
```

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

            this.storage.enabled().then(enabled => {
                if (enabled) {
                    this.storage.get(this.updateCountName).then(count =>
                    {
                        this.updateCount = +count;
                    })
                    .catch(() =>
                    {
                        this.updateCount = 0;
                        this.storage.set(this.updateCountName, this.updateCount.toString());
                    });
                }
            });
            // ...
        }

        public update(options: VisualUpdateOptions) {
            // ...
            this.updateCount++;
            this.storage.enabled().then(enabled => {
                if (enabled) {
                    this.storage.set(this.updateCountName, this.updateCount.toString());
                }
            });
            // ...
        }
}
```

## Known limitations and issues

Local Storage API isn't activated for Power BI visuals by default. If you want to activate it for your Power BI visual, send a request to Power BI visuals Support `pbicvsupport@microsoft.com`.  
**Please note that your visual should be available in [AppSource](https://appsource.microsoft.com/en-us/marketplace/apps?product=power-bi-visuals) and be [certified](https://powerbi.microsoft.com/en-us/documentation/powerbi-custom-visuals-certified/). Also [LocalStorage](./capabilities.md#access-browser-local-storage) privilege should be defined in the capabilities section.**
