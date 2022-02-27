---
title: Licensing API
description: This article discusses how to retrieve the Power BI visual's licenses and trigger the display of out of box license related notifications to the PBI user.
author: 
ms.author: 
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 02/26/2022
---


# Licensing API

The **Licensing API** allows Power BI VIsual developers to enforce Power BI visual's licenses. The API supports retrieving the information on Power BI visual's licenses that are assigned to the Power BI user.   
The API also enables triggering the licensing related notifications that will appear on the Power BI visual and inform the user on the need to purchase the missing licenses.


>[!NOTE]
>The `licensing` API is available from version 4.4. To find out which version you’re using, run the `pbiviz -V` command.


## Retrieve visual's service plans that are assigned to the active user

To get service plans assigned, add a call to `getAvailableServicePlans` (available via `IVisualLicenseManager`).    
From performance perspective, attempt to fetch the licenses once, preferably in the `constructor` or the `init` calls, and save the result.  
Once licenses are retrieved, they will be cached on Power BI host side during the Power BI session and any further calls to the same will return the cached data.

```typescript
export interface IVisualLicenseManager {
        getAvailableServicePlans(): IPromise<powerbi.extensibility.visual.LicenseInfoResult>;
    }
```

Retrieving the licenses might be a long operation, thus the `getAvailableServicePlans` call is an asynchronous call and should be handled as such in your code.  
As a response to calling the method,  `LicenseInfoResult` object is returned.

```typescript
export interface LicenseInfoResult {
        plans: ServicePlan[] | undefined;
        isLicenseUnsupportedEnv: boolean; 
        isLicenseInfoAvailable: boolean; 
    }
```

* `plans` - an array of Service Plans purchased by the active user for this visual. A ServicePlan contains the service identifier and its state (ServicePlanState).  
   Supported service plan states:

| State | Description |
| - | - |
| Inactive | Indicates that the license is not active and shouldn't be used for provisioning benefits. |
| Active | Indicates that the license is active and can be used for provisioning benefits. |
| Warning | Indicates that the license is in grace likely due to payment violation. |
| Suspended | Indicates that the license is suspended likely due to Payment violation. |


* `isLicenseUnsupportedEnv` - indicates that the visual is being rendered in a Power BI environment that doesn't support licenses management or enforcement. Currently, the following Power BI environments don't support license management or license enforcement:
    *   Embedded (Publish To Web, PaaS embed)
    *   Sovereign clouds
    *   RS Desktop
    *   Exporting (PDF\PPT) using direct API calls
    *   Rendering in Service Principal context
    *   Private Preview licensing feature isn't lighted (Private Preview only limitation)

* `isLicenseInfoAvailable` - if false, indicates that the licenses info could not be retrieved.   
This can happen in case Power BI Desktop user isn't signed in or is not connected to the internet (offline). For web, licenses retrieval can fail due to a temporary service shutdown.

Example of calling `getAvailableServicePlans`:  

```typescript
this.licenseManager.getAvailableServicePlans().then((result: LicenseInfoResult) => {
            this.notificationType = result.isLicenseUnsupportedEnv ?  powerbi.LicenseNotificationType.UnsupportedEnv : powerbi.LicenseNotificationType.General;
            this.hasServicePlans = !!(result.plans && result.plans.length && result.plans[0].spIdentifier == "myServiceId" && 
                ( result.plans[0].state == powerbi.ServicePlanState.Active ||  result.plans[0].state == powerbi.ServicePlanState.Warning));
            
            // display notification if the user doesn't have licenses
            if (!this.hasServicePlans) {
                this.licenseManager.notifyLicenseRequired(this.notificationType).then((value) => {
                    if (value) {
                        this.isIconDisplayed = true;
                    }
                }).catch((err) => {
                    console.log('ERROR', err);
                })
            }
        }).catch((err) => {
            this.hasServicePlans = undefined;
            console.log(err);
        });
```

## Notify the user that the required licenses are missing

Power BI platform provides several out of the box experiences that can be used to notify:
* Licenses should be purchased in order to enjoy full visual's capabilities
* Particular visual's feature is blocked due to missing licenses
* Entire visual is blocked due to missing licenses
* Entire visual is blocked because the Power BI environment in use doesn't support license management\enforcement

```typescript
export interface IVisualLicenseManager {
        notifyLicenseRequired(notificationType: LicenseNotificationType): IPromise<boolean>;
        notifyFeatureBlocked(tooltip: string): IPromise<boolean>;
        clearLicenseNotification(): IPromise<boolean>;
    }
```


### General icon to indicate that the required licenses are missing

Use `notifyLicenseRequired` call with `LicenseNotificationType.General` to display an icon as part of the visual's container.  
Once triggered, the icon will be preserved throughout the visual's lifetime until `clearLicenseNotification` is called.

> [!NOTE]
> The `LicenseNotificationType.General` is only supported in Power BI Edit scenarios. Calling this when the report is in Read mode or dashboard scenario will not apply the icon and will return `false` in the call's response.   

Example of the visual display containing the "licenses are required" general icon:

>[!div class="mx-imgBorder"]
>![visual display containing the "licenses are required" general icon.](media/licensing/generalIcon.png)


>[!div class="mx-imgBorder"]
>![visual display containing the "licenses are required" general icon.](media/licensing/generalIconExpand.png)


### Overlay the visual's display with a notification on missing licenses

Use `notifyLicenseRequired` call with `LicenseNotificationType.VisualIsBlocked` to overlay the visual's display with a notification that visual is blocked since required licenses were found missing.  
Once triggered, the icon will be preserved throughout the visual's lifetime until `clearLicenseNotification` is called.

Example of the visual display containing the "visual blocked" notification:

>[!div class="mx-imgBorder"]
>![visual display containing the "visual blocked" notification.](media/licensing/blockedVis.png)


### Overlay the visual's display with a notification on licenses unsupported environment

Use `notifyLicenseRequired` call with `LicenseNotificationType.UnsupportedEnv` to overlay the visual's display with a notification that visual is blocked since the Power BI in use doesn't support licenses management\enforcement.  
Once triggered, the icon will be preserved throughout the visual's lifetime until `clearLicenseNotification` is called.

Example of the visual display containing the "Unsupported Environment" notification:

>[!div class="mx-imgBorder"]
>![visual display containing the "Unsupported Environment" notification](media/licensing/unsupportedEnv.png)


### Display a banner notifying that a specific visual's functionality couldn't be applied

When applying a specific visual's functionality requires licenses that were found missing, you can use the `notifyFeatureBlocked` call that will pop-up a banner as part of the visual's container. The banner also supports a custom tooltip that can be set by you and used to provide additional information on the feature that triggered the notification.

> [!NOTE]
> To support localized Power BI environment, we recommend maintaining localized versions of the tooltips in use. Please use [Localization API](./localization.md) to retrieve the Power BI locale language.


Once triggered, the banner will be displayed for 10 seconds 
or 
until other "feature blocked" banner is triggered 
or 
until `clearLicenseNotification` is called (whatever comes first).

Example of the visual display containing the "feature blocked" banner notification:
>[!div class="mx-imgBorder"]
>![visual display containing the "feature blocked" banner notification.](media/licensing/featureBanner.png)

## Considerations and limitations

* Tooltip for feature banner is limited by 500 chars.


## Next steps

> [!div class="nextstepaction"]
> [Publish a Power BI custom visual](office-store.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)