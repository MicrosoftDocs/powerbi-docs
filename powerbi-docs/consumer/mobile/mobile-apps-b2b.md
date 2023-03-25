---
title: View Power BI content as an external guest user (Azure AD B2B)
description: Learn how to use the Power BI mobile app to view content shared with you from an external organization.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 01/24/2023
---

# View Power BI content shared with you from an external organization

Power BI integrates with Azure Active Directory business-to-business (Azure AD B2B) to allow secure distribution of Power BI content to guest users outside your organization. And external guest users can use the Power BI mobile app to access that Power BI content shared with them.

Applies to:

| :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/iphone-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/ipad-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-phone-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-tablet-logo-50-px.png"::: |
|:--- |:--- |:--- |:--- |
|iPhones |iPads |Android phones |Android tablets |

## Access shared external content

**First, you need someone from an external organization to share an item with you**. When someone from an external organization [shares an item with you](../../collaborate-share/service-share-dashboards.md), you can get to the item in three ways.

* You can use the **From external orgs** strip on the app's home page.

    :::image type="content" source="{source}" alt-text="{alt-text}":::

* You can open the **More options (...)** menu on the home page footer and choose **From external orgs**.

    :::image type="content" source="{source}" alt-text="{alt-text}":::

* You can following the link in the email that you get when someone shares an item with you. Following that link in your mobile device opens the Power BI mobile app. When the app recognizes that the item was shared from an external organization, it reconnects to that organization with your identity and opens the item.

    :::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-open-item-email-new.png" border="false" alt-text="Screenshot that shows how to open a shared Power BI item from an email.":::

> [!NOTE]
> If this is the first item shared with you as an external guest user, you must claim the invitation in a browser. You cannot claim the invitation in the Power BI app.

Once your app switches, you can access all items shared with you (not only the item you opened from the email). To view all items you can access in the external organization, go to the app menu and tap Shared with me. Under Apps, you find apps that you can use as well.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-menu-new.png" border="false" alt-text="Screenshot that shows the Power BI app menu as a guest external user.":::

## Get back to your own organization

As long as you're connected to an external organization, a black header appears in the app. This header indicates that you're not connected to your home organization. To connect back to your home organization, tap the icon :::image type="icon" source="./media/mobile-apps-b2b/powerbi-mobile-app-exit-guest-icon.png":::  in the header to exit from guest mode.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-exit-home-new.png" border="false" alt-text="Screenshot that shows the Power BI guest user header exit icon.":::

## Considerations and limitations

- Users must have an active Power BI account and home tenant.
- Users must be signed in to their Power BI home tenant, before they can access the content shared with them from an external tenant.
- The app doesn't support cross-cloud B2B sharing scenarios, where a user's home tenant and the external item being shared with them are hosted in different clouds.
- Conditional access and other Intune policies aren't supported in Azure AD B2B and in Power BI mobile. That means that the app enforces only the home organization's policies, if they exist.
- Push notifications are received from the home organization site only (even when the user is connected as a guest to an external organization). Opening the notification reconnects the app to the user's home organization site.
- If the user shuts down the app, when reopened the app connects automatically to the user's home organization.
- When connected to an external organization, some actions are disabled: favorite items, data alerts, commenting, and sharing.
- Offline data isn't available while you're connected to an external organization.
- If you have the Company Portal app installed on your device, then your device must be enrolled.