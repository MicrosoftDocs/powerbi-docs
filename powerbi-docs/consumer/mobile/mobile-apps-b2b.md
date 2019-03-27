---
title: View Power BI content as external guest user (B2B)
description: Use Power BI mobile apps to view content shared with you from external organization.
author: mshenhav
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 03/27/2019
ms.author: mshenhav

---
# View Power BI content share with you from external organization as external guest user (Azure AD B2B)

You can use Power BI mobile app to access Power BI content shared with you from external organization.

Applies to:

| ![iPhone](./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/iphone-logo-50-px.png) | ![iPad](./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/ipad-logo-50-px.png) | ![Android phone](./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-phone-logo-50-px.png) | ![Android tablet](./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-tablet-logo-50-px.png) |
|:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |

**First, you need to have item shared with you from external organization:**
When an item is [shared with you by another user](https://docs.microsoft.com/en-us/power-bi/service-share-dashboards), from the same organization or from external organization, you receive an email with a link to that shared item. Following that link in your mobile device, will open Power BI mobile app, and if the app will recognize that this is an item shared from external organization, then the app will reconnect to that organization with your identity, and will load all items you were shared with in that organization.

 ![Power BI open shared item from email ](./media/mobile-app-b2b/mobile_b2b_open_item_email.png)

Note: if this is the first item shared with you as external guest user, you will need first to claim the invitation. This should be done in the browser and cannot be done in Power BI app.

As long as you are connected to the external organization, you will be able to access all items shared with you, and not only that item you had its link. Go to the app menu and choose “Shared with me” to see all items shared with you from this organization. Under “Apps” you will find apps that you can use as well.
note that while you are connected to external organization, you will not be able to access items in your home organization. To access your home organization items, you need to “exit” and connect back to your home organization. The black header will appear as long as you are connected as guest to external organization.

## Limitations
1)	Conditional access and other Intune policies are not supported in AAD B2B and in Power BI Mobile. That means that the app will enforce only the home organization’s policies, if exists.
2)	Push notifications will be received from the home organization site only (even when the user is connected as guest to an external organization). Opening the notification will re-connect the app to the user’s home organization site.
3)	If the user shuts down the app, re-opening it will connect automatically to the user’s home organization.
4)	When connected to an external organization, some actions will be disabled: favorite items, data alerts, commenting, and sharing.
5)	Offline data is not available while connected to an external organization.

