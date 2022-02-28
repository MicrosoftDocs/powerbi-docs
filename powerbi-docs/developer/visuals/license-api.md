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

The **Licensing API** allows Power BI visual developers to enforce Power BI visual's licensing policies. Use this API to retrieve information about the licenses that are assigned to each Power BI user.
You can also use the API to trigger license related notifications. The notifications will appear on the Power BI visual to inform the user that they need to purchase missing licenses.
The visual should not display its own licensing UX. Instead, use one of Power BI predefined supported notifications as detailed below.  
Learn more about [Power BI Licensing and Translatability support](https://go.microsoft.com/fwlink/?linkid=2186097).

>[!NOTE]
>The `licensing` API is available from version 4.4. To find out which version you’re using, run the `pbiviz -V` command.


## Retrieve visual's service plans that are assigned to the active user

To retrieve the service plans (licenses) assigned to the user, call `getAvailableServicePlans` (available via `IVisualLicenseManager`).    
From performance perspective, attempt to fetch the licenses once, preferably in the `constructor` or the `init` calls, and save the result.  
Once licenses are retrieved, they will be cached on Power BI host side during the Power BI session and any further calls to the same will return the cached data.

```typescript
export interface IVisualLicenseManager {
        getAvailableServicePlans(): IPromise<powerbi.extensibility.visual.LicenseInfoResult>;
    }
```

Retrieving the licenses might take a long time. Therefore, the `getAvailableServicePlans` call is an asynchronous call and should be handled as such in your code.  
As a response to calling the method,  a `LicenseInfoResult` object is returned.

```typescript
export interface LicenseInfoResult {
        plans: ServicePlan[] | undefined;
        isLicenseUnsupportedEnv: boolean; 
        isLicenseInfoAvailable: boolean; 
    }
```

* `plans` - an array of Service Plans purchased by the active user for this visual. A ServicePlan contains the service identifier and its state (ServicePlanState).  
   Supported service plan states are:

| State | Description |
| - | - |
| Inactive | The license is not active and shouldn't be used for provisioning benefits. |
| Active | The license is active and can be used for provisioning benefits. |
| Warning | The license is in grace period, likely due to payment violation. |
| Suspended | The license is suspended, likely due to payment violation. |
| Unknown | Sentinel value. |


* `isLicenseUnsupportedEnv` - indicates that the visual is being rendered in a Power BI environment that doesn't support licenses management or enforcement.   
Currently, the following Power BI environments don't support license management or license enforcement:

  * Embedded - Publish To Web, PaaS embed (TBD: GA)
  * National clouds (Dependency on general support for translatability in national clouds)
  * RS (No planned support)
  * Exporting (PDF\PPT) using [REST API](../embedded/export-to.md) (TBD: GA)
  * Private Preview licensing feature isn't lighted (Private Preview only limitation)


* `isLicenseInfoAvailable` - Indicates whether the licenses information could be retrieved.   
Failure to retreive licenses can occur if the Power BI Desktop user isn't signed in or is not connected to the internet (offline). For web, licenses retrieval can fail due to a temporary service outage.

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

Power BI platform provides several out-of-the-box experiences that can be used to notify the user that:

* Licenses should be purchased in order to enjoy the visual's full capabilities
* A particular visual's feature is blocked due to missing licenses
* Entire visual is blocked due to missing licenses
* Entire visual is blocked because the Power BI environment used doesn't support license management\enforcement

```typescript
export interface IVisualLicenseManager {
        notifyLicenseRequired(notificationType: LicenseNotificationType): IPromise<boolean>;
        notifyFeatureBlocked(tooltip: string): IPromise<boolean>;
        clearLicenseNotification(): IPromise<boolean>;
    }
```


### General icon to indicate that the required licenses are missing

Use `notifyLicenseRequired` call with `LicenseNotificationType.General` to display an icon as part of the visual's container.  
Once triggered, the icon will be preserved throughout the visual's lifetime until until `clearLicenseNotification` or `notifyLicenseRequired` are called..

> [!NOTE]
> The `LicenseNotificationType.General` notification is only enforced when it is called in a supported licensing environment **and** Power BI is in Edit mode. Calling this in an unsupported environment or when the report is in Read mode or in dashboard will return `false` in the call's response and the icon won't appear.    

Example of the visual display containing the "licenses are required" general icon:

>[!div class="mx-imgBorder"]
>![visual display containing the "licenses are required" general icon.](media/license-api/generalIcon.png)


>[!div class="mx-imgBorder"]
>![visual display containing the "licenses are required" expanded icon.](media/license-api/generalIconExpand.png)


### Overlay the visual's display with a notification on missing licenses

Use `notifyLicenseRequired` call with `LicenseNotificationType.VisualIsBlocked` to overlay the visual's display with a notification that the visual is blocked due to missing licenses.  
Once triggered, this notification will be preserved throughout the visual's lifetime until `clearLicenseNotification` or `notifyLicenseRequired` are called.

Example of the visual display containing the "visual blocked" notification:

>[!div class="mx-imgBorder"]
>![visual display containing the "visual blocked" notification.](media/license-api/blockedVis.png)


### Overlay the visual's display with a notification on licenses unsupported environment

Use `notifyLicenseRequired` call with `LicenseNotificationType.UnsupportedEnv` to overlay the visual's display with a notification that visual is blocked because the Power BI in use doesn't support licenses management\enforcement.  
Once triggered, the icon will be preserved throughout the visual's lifetime until until `clearLicenseNotification` or `notifyLicenseRequired` are called..

> [!NOTE]
> The `LicenseNotificationType.UnsupportedEnv` notification is only enforced when called in context of unsupported for licensing environment. Calling this in any other environment will not apply the notification and will return `false` in the call's response.   

Example of the visual display containing the "Unsupported Environment" notification:

>[!div class="mx-imgBorder"]
>![visual display containing the "Unsupported Environment" notification](media/license-api/unsupportedEnv.png)


### Display a banner notifying that a specific visual's functionality couldn't be applied

When applying a specific visual's functionality requires licenses that were found missing, you can use the `notifyFeatureBlocked` call that will pop-up a banner as part of the visual's container. The banner also supports a custom tooltip that you can set and use to provide additional information on the feature that triggered the notification.

> [!NOTE]
> The feature is blocked notification is only enforced when called in the context of supported for licensing environment and in case blocking overlays aren't applied (`LicenseNotificationType.UnsupportedEnv`, `LicenseNotificationType.VisualIsBlocked`). Calling this notification in an unsupported environment will not apply the notification and will return `false` in the call's response. 

> [!NOTE]
> To support localized Power BI environment, we recommend maintaining localized versions of the tooltips in use. Please use [Localization API](./localization.md) to retrieve the Power BI locale language.


Once triggered, the banner will be displayed until the one of the following conditions occurs:

* Ten seconds pass
* Another "feature blocked" banner is triggered 
* `clearLicenseNotification` is called (whatever comes first).

Example of the visual display containing the "feature blocked" banner notification:
>[!div class="mx-imgBorder"]
>![visual display containing the "feature blocked" banner notification.](media/license-api/featureBanner.png)

## Considerations and limitations

* Tooltip for feature banner is limited by 500 chars.
* Tooltip for feature banner requires localization.


## Next steps

> [!div class="nextstepaction"]
> [Publish a Power BI custom visual](office-store.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
