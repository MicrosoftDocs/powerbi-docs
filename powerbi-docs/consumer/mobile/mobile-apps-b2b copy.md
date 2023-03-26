---
title: View Power BI content as an external guest user (Azure AD B2B)
description: Learn how to use the Power BI mobile app to view content shared with you from an external organization.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 03/25/2023
---

# View Power BI content shared with you from an external organization

Power BI integrates with Azure Active Directory business-to-business (Azure AD B2B) to allow secure distribution of Power BI content to guest users. The Power BI mobile app supports this Azure AD B2B integration, so you can access Power BI content from external organizations that has been shared with you directly from your app.

Applies to:

| :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/iphone-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/ipad-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-phone-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-tablet-logo-50-px.png"::: |
|:--- |:--- |:--- |:--- |
|iPhones |iPads |Android phones |Android tablets |

## Access shared external content

To see all the content that has been shared with your from external organizations, tap **More options (...)** on the home page and choose **From external orgs**.

:::image type="content" source="{source}" alt-text="{alt-text}":::

You'll see a list of the external content that's been shared with you, grouped according to organization.

:::image type="content" source="{source}" alt-text="{alt-text}":::

Tap an item to open it. You'll be asked to confirm connecting to the organization the external content is hosted in. Once you've confirmed, and the item will open. In the header you can see that you are connected as a guest.

:::image type="content" source="{source}" alt-text="{alt-text}":::

To see all the content that's been shared with you in that organization, tap the arrow to the left of the item's name.

:::image type="content" source="{source}" alt-text="{alt-text}":::

You'll see all the content that's been shared with you, grouped according to who shared it with you.

:::image type="content" source="{source}" alt-text="{alt-text}":::

To get back to your own organization, tap **Exit** in the header.

## Enable quick access to external content that's been shared with you

You change your home page default to enable quick access to external content that's been shared with you.

On the home page tap the arrow on the Recommended strip and then choose From external content. A number of external items will be shown on the strip. You can either tap an item to open it, or you can tap See all to open the list of all external items that have been shared with you.

:::image type="content" source="{source}" alt-text="{alt-text}":::

## Access external shared content via email link 



**First, you need someone from an external organization to share an item with you**. When someone from an external organization [shares an item with you](../../collaborate-share/service-share-dashboards.md), you can get to the item in three ways.

* You can display the [From external orgs strip](#display-the-from-external-orgs-strip) on the app's home page.When you choose this option, the third strip on the home page will display your external content by default when you open the app, making it easy to quickly access your external content right from the home screen.
* You can choose [From external orgs](#use-the-more-options--menu) option on the **More options (...) menu in the home page footer to list all the external content that's been shared with you.
* You can [follow the link in the email](#follow-email-link-to-external-content) that you get when someone shares an item with you.

#### Display the From external orgs strip

To display the **From external orgs** strip, tap the arrow next to **Recommended** on the home page and choose **From external orgs**. Your choice is saved, so the next time you open the app, you'll be able to get to your external content right away from the home page. The From external orgs strip displays a number of shared external items. Tap **See all** to see all external content that's been shared with you.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-from-external-orgs-strip.png" alt-text="Screenshot showing From external orgs strip on the home page." border="false":::

#### Use the More options (...) menu

You can open the **More options (...)** menu on the home page footer and choose **From external orgs**. You will see a list of all external content that has been shared with you.

:::image type="content" source="{source}" alt-text="{alt-text}":::

#### Follow an email link to external content

You can following the link in the email that you get when someone shares an item with you. Following that link in your mobile device opens the Power BI mobile app. When the app recognizes that the item was shared from an external organization, it reconnects to that organization with your identity and opens the item.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-open-item-email-new.png" border="false" alt-text="Screenshot that shows how to open a shared Power BI item from an email.":::

> [!NOTE]
> If this is the first item shared with you as an external guest user, you must claim the invitation in a browser. You cannot claim the invitation in the Power BI app.

Once your app switches, you can access all items shared with you (not only the item you opened from the email). To view all items you can access in the external organization, go to the app menu and tap Shared with me. Under Apps, you find apps that you can use as well.

:::image type="content" source="./media/mobile-apps-b2b/mobile-b2b-menu-new.png" border="false" alt-text="Screenshot that shows the Power BI app menu as a guest external user.":::

## Get back to your own organization

As long as you're connected to an external organization, the header indicates that you're connected as a guest in another organization. This header indicates that you're not connected to your home organization. To connect back to your home organization, tap the **Exit** in the top right corner of the header.

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