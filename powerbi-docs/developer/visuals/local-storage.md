---
title: Local Storage API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to get access to browser local storage.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 11/08/2023
---

# Local Storage API

With the local storage API, you can store data directly in the local browser. Data stored locally is more secure, and improves performance of web apps.

Local storage is isolated so that each type of visual has its own separate storage access.

## How to use local storage

### [Version 1](#tab/v1)

```typescript
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

The local storage API has four methods:

* *status*: returns the status of the local storage v2 api

  * PrivilegeStatus.DisabledByAdmin- when the tenant admin switch is off.
  * PrivilegeStatus.NotDeclared – when the visual has no declaration for the local storage in the privileges array.
  * PrivilegeStatus.NotSupported – when the api is not supported (see limitations)
  * PrivilegeStatus.Allowed – when it is allowed to use the api

best practice: before using the get set remove use the status method to check the status of the api, this will make your visual behave more properly.

get:
this method expects one parameter:
key – the key you want to get its value.
returns a promise that resolves with the value if the key exists and reject otherwise  

set:  
expects two parameters:
key – the key you want to set its value.
data – the value for the key
returns a promise that resolves to struct of the type  StorageV2ResultInfo, or rejects if an error occurred.

remove:
expects one parameter:
key – the key of the pair you want to remove.

How to use the local storage api:
First you need to add declaration to the [privileges array in visual capabilities](./capabilities.md#define-privileges)

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
 
    private init() { 
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

    private updateCount(count: number) { 
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

    private removeUpdateCount() { 
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

* The local storage limit is 1mb per GUID.
* Data can be shared between visuals with the same GUID only.
* Data can't be shared with another instance of Power BI Desktop.
* The local storage API isn't activated by default. To activate it for your Power BI visual, send a request to Power BI visuals support, `pbicvsupport@microsoft.com`.
* The local storage API doesn't support `await` constructions. Only `than` and `catch` methods are allowed.

**Your visual should be available in [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) and be [certified](power-bi-custom-visuals-certified.md).**

### [Considerations and limitations Version 2](#tab/v2)

* The custom visuals local storage limit is 100KB.
* Data can be shared between visuals with the same GUID, same environment and for the same user only.
* The API is supported in the following environments:
  * Web
  * Desktop
  * SaaS Embed
  * Mobile
  * Report Server
* The API is not supported in export to PDF, ptpx scenarios.
* The API is supported only when there is a user signed in.
* A visual’s data will be cleared 29 days after the most recent modification time.
* This API is privileged API.
* The key (parameter provided to *set*, *get*, *Remove*) has the following restrictions:
  * Length must be less than 128 characters
  * Can't contain the character '|'
* The API can be not supported for many reasons such as not supported environment or the browser’s local storage is not available, so consider checking the status of the API before using the set/get/remove methods, and even if supported can fail, so anyway you should handle errors.

---

## Next steps

* [Power BI custom visual API](visual-api.md)
