---
title: Local Storage API in Power BI Visuals
description: This article describes how to use the Power BI Visuals API to gain access to the browser's local storage.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: shafeeq, jennyf
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 01/30/2024
---

# Local Storage API

With the local storage API, you can store data in the browser's local storage. To use the local storage API, the customer's [local storage admin switch](/fabric/admin/organizational-visuals#local-storage) has to be enabled.

Local storage is isolated so that each type of visual has its own separate storage access.

> [!NOTE]
> It’s developer’s responsibility to ensure that the stored data conforms to the consumer’s organizational policies, and to inform users about what information is stored, if the sensitivity of the data requires it. In particular, custom visual developers should encrypt the data if business goals or scenarios expect it.

## How to use local storage

### [Version 1](#tab/v1)

This version of the *local storage API* is scheduled for deprecation. We're not accepting any more requests. When possible, use Version 2.

In the following example, a counter is increased whenever the *update* method is called. The counter value is saved locally and called each time the visual starts. This way, the counter continues counting from where it left off instead of starting over each time the visual is started:

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

### [Version 2](#tab/v2)

### Local storage methods

The local storage API has four methods:

* *status*:
  
  * Returns the status of the local storage v2 API.

    * PrivilegeStatus.DisabledByAdmin: the tenant admin switch is off
    * PrivilegeStatus.NotDeclared: the visual has no declaration for the local storage in the privileges array
    * PrivilegeStatus.NotSupported: the API isn't supported (see [limitations](#considerations-and-limitations) for more information)
    * PrivilegeStatus.Allowed: the API is supported and allowed

  Before using the *get*, *set*, or *remove* methods, it's best practice to use the *status* method to check the status of the API and ensure that your visual behaves as expected.

* *get*:

  * This method expects one parameter:

    * *key* – the key whose value you want to get.
  
  * Returns a promise that resolves with the value if the key exists, and rejects otherwise.

* *set*:

  * This method expects two parameters:

    * *key* – the key you want to set its value
    * *data* – the value for the key

  * Returns a promise that resolves to a *struct* of the type `StorageV2ResultInfo`, or rejects if an error occurred.

* *remove*:

  * This method expects one parameter:

    * *key* – the key of the pair you want to remove

### How to use the local storage API

To use the local storage API, add a declaration to the [privileges array in visual capabilities.](./capabilities.md#define-privileges)

The following example shows how to set and retrieve data from the local storage using version 2 of the local storage API:

```typescript
import IVisualLocalStorageV2Service = powerbi.extensibility.IVisualLocalStorageV2Service; 
import StorageV2ResultInfo = powerbi.extensibility.StorageV2ResultInfo; 
import PrivilegeStatus = powerbi.PrivilegeStatus; 
 
export class Visual implements IVisual { 
    // ... 
    private updateCountName: string = 'updateCount'; 
    private updateCount: number; 
    private storageV2Service: IVisualLocalStorageV2Service; 
 
    constructor(options: VisualConstructorOptions) { 
        this.storageV2Service = options.host.storageV2Service; 
        this.init(); 
    } 
 
    private async init() { 
        try { 
            let status: powerbi.PrivilegeStatus = await this.storageV2Service.status(); 
            if (status === PrivilegeStatus.DisabledByAdmin) { 
                //handle if the api blocked by admin 
            } else if (status === PrivilegeStatus.Allowed) { 
                this.updateCount = await this.storageV2Service.get(this.updateCountName); 
            } 
        } catch (error) { 
            //handle error 
        } 
    } 

    private async updateCount(count: number) { 
        try { 
            let status: PrivilegeStatus = await this.storageV2Service.status(); 
            if (status === PrivilegeStatus.Allowed) { 
                let resultInfo: StorageV2ResultInfo = this.storageV2Service.set(this.updateCountName, count); 
                if (resultInfo.success) { 
                    //updateCount was set. 
                } else { 
 
                } 
            } 
        } catch (error) { 
            // handle error 
        } 
    } 

    private async removeUpdateCount() { 
        let status: PrivilegeStatus = await this.storageV2Service.status(); 
        if (status === PrivilegeStatus.Allowed) { 
            this.storageV2Service.remove(this.updateCountName); 
        } 
    } 
} 
```

---

## Considerations and limitations

### [Considerations and limitations Version 1](#tab/v1)

* The local storage limit is 1 mb per GUID.
* Data can be shared between visuals with the same GUID only.
* Data can't be shared with another instance of Power BI Desktop.
* The local storage API isn't activated by default. To activate it for your Power BI visual, send a request to Power BI visuals support, `pbicvsupport@microsoft.com`.
* The local storage API doesn't support `await` constructions. Only `then` and `catch` methods are allowed.

**Your visual should be available in [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) and be [certified](power-bi-custom-visuals-certified.md).**

### [Considerations and limitations Version 2](#tab/v2)

* The custom visuals local storage limit is 100 KB.
* Data can be shared between visuals with the same GUID, same environment, and for the same user only.
* The API is supported in the following environments:
  * Web
  * Desktop
  * SaaS Embed
  * Mobile
  * Report Server
* Local storage isn't supported when Exporting to *PDF* or *pptx*.
* The API is supported only when a user is signed in.
* A visual’s data is cleared 29 days after the most recent modification time.
* This API is a [privileged API](./capabilities.md#privileges-define-the-special-permissions-that-your-visual-requires).
* The key (parameter provided to *set*, *get*, *Remove*) has the following restrictions:
  * Length must be fewer than 128 characters
  * Can't contain the character '|'
* If the browser is in kiosk mode, local storage availability might differ between browsers, and by the kiosk owner's settings.
* There are many reasons this API might not be supported. For example, the environment might not be supported or the browser’s local storage isn't available. We recommend checking the *status* of the API before using the *set/get/remove* methods. Error handling is important since even if the API is supported, it might fail.

---

## Related content

* [Power BI custom visual API](visual-api.md)
