---
title: Check privileges API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to determine what privileges are enabled and how to check the permissions granted.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 06/28/2024
---

# Check permissions API

As a developer of Power BI visuals, you can develop visuals that need permission to access various resources. You request these permissions in the privileges section of the [capabilities.json](capabilities.md) file. These privileges include the ability to access:

* remote resources or web sites
* local storage for downloading data

Each organization's admin can allow or block these permissions. The *check permissions API* allows you to query the host at runtime to determine which permissions are granted. You can use this information to design a visual that will work with various permission settings.

The *check permissions API* returns the status of each permission query function:

```typescript
/**
 * Represents a return type for privilege status query methods
 */
export const enum PrivilegeStatus {
    /**
     * The privilege is allowed in the current environment
     */
    Allowed,

    /**
     * The privilege declaration is missing in visual capabilities section
     */
    NotDeclared,

    /**
     * The privilege is not supported in the current environment
     */
    NotSupported,

    /**
     * The privilege usage was denied by tenant administrator
     */
    DisabledByAdmin,
}
```

## How to use the check permissions API

Every privilege API has its own query method to check for the permission status. The permission status can be one of the following:

* Allowed
* Not declared
* Not supported
* Disabled by Admin

### Web access

```typescript
export interface IWebAccessService {
    /**
     * Returns the availability status of the service for specified url.
     * 
     * @param url - the URL to check status for
     * @returns the promise that resolves to privilege status of the service
     */
    webAccessStatus(url: string): IPromise<PrivilegeStatus>;
}
```

### Export content

```typescript
export interface IDownloadService {
    /**
     * Returns the availability status of the service.
     * 
     * @returns the promise that resolves to privilege status of the service
     */
    exportStatus(): IPromise<PrivilegeStatus>;
}
```

## Related content

[Power BI custom visual API](visual-api.md)
