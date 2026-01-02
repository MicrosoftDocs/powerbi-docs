---
title: View Power BI Content as an External Guest User (Microsoft Entra B2B)
description: Learn how to use the Power BI mobile app to view content shared with you from an external organization.
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
---

# View Power BI content shared with you from an external organization

Power BI integrates with Microsoft Entra business-to-business (Microsoft Entra B2B) to allow secure distribution of Power BI content to guest users. The Power BI mobile app supports this Microsoft Entra B2B integration, so you can access Power BI content from external organizations that has been shared with you directly from your app.

Applies to:

| :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/iphone-logo-50-px.png" border="false":::| :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/ipad-logo-50-px.png" border="false":::| :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-phone-logo-50-px.png" border="false":::| :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-tablet-logo-50-px.png" border="false":::|
|:--- |:--- |:--- |:--- |
|iPhones |iPads |Android phones |Android tablets |

## Access shared external content

Before you can access content from external orgs, someone first needs to share something with you. If this is the first item shared with you as an external guest user of an org, you must first claim the invitation in a browser. You can't claim the invitation in the Power BI app.

To access content that has been shared with you from external organizations, on the home page, tap the arrow on the **Recommended** strip and choose **Content from external orgs**. The name of the strip changes to **From external orgs**, and a number of external items will be shown on the strip.

:::image type="content" source="./media/mobile-apps-b2b/power-bi-mobile-external-content-strip.gif" alt-text="Animation showing how to switch the Recommended strip to the From external orgs strip." border="false":::

> [!NOTE]
> Once you've changed **Recommended** to **From external orgs**, the next time you open your app, you'll be able to get to that external content quickly, right from your app's home screen.
>
>To get back to the **Recommended** strip, tap the down arrow again and choose **Recommended**.

You can either tap an item to open it, or you can tap **See all** to open the list of all items in external orgs that you can access. The following image shows the list of the external content that's available to you. First, there's a complete list of all the external items you can access, followed by the same items grouped according to the external organization they reside in.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-shared-list.png" alt-text="Screenshot showing all shared external content." border="false":::

You can also get to this list by tapping **More options (...)** and choosing **From external orgs**.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-go-to-shared-list-2.png" alt-text="Screenshot showing selection of From external orgs option from More options menu." border="false":::

From the **From external orgs** strip or from the list of shared external content, you can tap an item to open it. You'll be asked to confirm connecting to the external organization the content is hosted in. Once you've confirmed, the item will open.

::::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-go-to-shared-list.png" alt-text="Screenshot of guest view navigation." border="false":::

In the header you can see that you're connected as a guest. To see all the content that's been shared with you in that organization, tap the arrow to the left of the item's name. To get back to your home organization, tap **Exit**.

The following image shows your **Shared with me** page in the external organization you're connected to as a guest. It shows you all the content in that organization that you can access.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-menu-new.png" alt-text="Screenshot of guest view of external content in an org." border="false":::

## Access external shared content via email link 

When someone shares an item with you, you get an email with a link to the item. If the item is in an external organization, you can still access the item by clicking the link. When you select the link, the app will open, you'll be asked to confirm switching to the external organization, and then the item will open.

## Considerations and limitations

- Users must have an active Power BI account and home tenant.
- Users must be signed in to their Power BI home tenant, before they can access the content shared with them from an external tenant.
- Conditional access and other Intune policies aren't supported in Microsoft Entra B2B and in Power BI mobile. That means that the app enforces only the home organization's policies, if they exist.
- Push notifications are received from the home organization site only (even when the user is connected as a guest to an external organization). Opening the notification reconnects the app to the user's home organization site.
- If the user shuts down the app, when reopened the app connects automatically to the user's home organization.
- When connected to an external organization, some actions are disabled: favorite items, data alerts, commenting, and sharing.
- Offline data isn't available while you're connected to an external organization.
- If you have the Company Portal app installed on your device, then your device must be enrolled.
