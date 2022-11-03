---
title: Add the Power BI app to Microsoft Teams
description: Learn how to add the Power BI app to Microsoft Teams. The Power BI app brings the entire basic Power BI service experience into Microsoft Teams.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 11/01/2022
---

# Add the Power BI app to Microsoft Teams

This article describes how you can install, pin, and interact with Power BI directly inside Microsoft Teams. The Power BI personal app brings the entire basic Power BI service experience to Microsoft Teams.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-app-teams.png" alt-text="Screenshot of the Power BI app home page in Microsoft Teams showing the In Teams tab selected.":::

With Power BI app in Microsoft Teams you can [collaborate with Power BI in Teams](service-collaborate-microsoft-teams.md). The app is your personal experience of Power BI. It's as if the Power BI service lives inside Microsoft Teams.  After you install it, you can enjoy almost all features that's offered by the Power BI service in Microsoft Teams.

- Create, view, and edit dashboards, reports, and apps.
- Create and participate in workspaces.
- Share content, either through email or through Microsoft Teams.

Also, there's a feature in the Power BI app in Teams that you don't see when you view the Power [BI service](https://powerbi.microsoft.com) in a web browser. On the Power BI home page in Teams, you can [see all the Power BI tabs you've viewed](service-teams-pivot.md) in Teams.

There are a few features that you can only access in the Power BI service in a browser. See the [Known issues and limitations](#known-issues-and-limitations) section of this article for details.

> [!NOTE]
> If you're in Microsoft 365 Targeted Release or Office Insiders Beta Channel, the Power BI app in Microsoft Teams offers the public preview of the Power BI app in Microsoft Outlook and Microsoft Office as part of the integration package. See [public preview in Outlook and Office](service-collaborate-microsoft-teams.md#OutlookOffice) for details.

## Requirements

Ensure the following elements are in place to install the Power BI app in Microsoft Teams:

- Ensure the Power BI app is enabled in the Teams Admin center apps list.
- Your users with a Power BI (Free) license can access personal analytics. They can use the built-in Teams analytics report and create reports in their **My workspace**.
- Your users with Power BI (Free) licenses can also access content that's shared with them from a workspace as part of a [Power BI Premium capacity (P SKU)](../enterprise/service-premium-what-is.md).
- Your users with a Power BI Pro or Premium Per User (PPU) license can share content with others or build content in workspaces.
- Users need to sign in within the Power BI app for Teams or the Power BI service to activate their Power BI license.
- Users meet the requirements to use the **Power BI** tab in Microsoft Teams.


## Install the Power BI app

Select **More added apps (...)** menu in the left navigation bar, then search for the app, and select **Power BI**.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-app.png" alt-text="Screenshot of the Teams page with More added apps menu selected. Power BI is typed in the search bar and selected from the apps list.":::

That's it! The Power BI app is installed in Microsoft Teams.

## Pin the Power BI app to the Teams navigation pane

To keep the app available in Teams, pin it to the Teams navigation pane.

- Right-click the Power BI icon in the Teams navigation pane, and select **Pin**.

    :::image type="content" source="media/service-microsoft-teams-app/service-teams-pin-app.png" alt-text="Screenshot of the Teams navigation pane showing the Power BI icon is right-clicked and pin option is selected.":::

That's it. Now you can view your Power BI content in Teams whenever you want.

## Interact with your content in Microsoft Teams

The interaction with your content in Microsoft Teams is the same as with the Power BI service. You interact with your dashboards, reports, apps, or workspaces in the same ways.

You can even share a report with your coworkers from the Power BI app in Microsoft Teams.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-app-share-teams.png" alt-text="Screenshot of the Opportunity Analysis Sample report in Microsoft Teams app with Revenue Overview displayed and Share option selected.":::

The Power BI app in Microsoft Teams also features a hub for training. Select **Learn** to view the **Learning Center**.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-learn-tab.png" alt-text="Screenshot of the Learning center in Power BI app in Microsoft Teams showing the Learn tab is selected in both navigation pane and .":::

### Differences in interactions

A few interactions are different in the Teams app than they are in the browser

- When you look at a dashboard or report, you don't see the Power BI navigation pane. To access the navigation pane, select the **Close** button to go back to Home or the workspace.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-close-report.png" alt-text="Screenshot of the Opportunity Analysis Sample report in Power BI app in Microsoft Teams with Close button selected.":::

- To open the report in the Power BI service instead of viewing it in Microsoft Teams, select **Open this on the web** icon next to the Close button.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-open-web.png" alt-text="Screenshot of the Open this on the web button in Power BI app in Microsoft Teams.":::

## Search for Power BI content in Teams

With the search experience in Teams, you can find recent reports, dashboards, and apps and open them within the Power BI app for Teams. Give the search experience a try.

1. In the Teams search bar, type *@Power BI*.

    > [!NOTE]
    > Be sure to include the space between "Power" and "BI".

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-search-teams.png" alt-text="Screenshot of the Teams page with @Power BI typed and highlighted in the Teams Search bar.":::

1. Select an item from the list, or type something to search for.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-search-teams-reports.png" alt-text="Screenshot of the Teams search bar with Power BI typed in the search field. A list of reports and My workspace in Power BI is displayed.":::

1. Press **Open**.

    The first time you use this capability, you need to sign in.

1. If you haven't installed the Power BI app yet, Teams asks you to add it.
 
    :::image type="content" source="media/service-microsoft-teams-app/power-bi-search-teams-apps.png" alt-text="Screenshot of the Teams page showing the Power BI icon and the tutorial video for Power BI. The Add button is selected.":::

## Increase Power BI app adoption in Teams

Your organization can make it easier for everyone to find and use data by installing and pinning (it's optional but we recommend it) the Power BI app for Teams.

Are you a leader in your organization? You can encourage individuals and teams to use the Power BI app in Teams by installing it for themselves. Read the [Guide to enabling your organization to use Power BI in Microsoft Teams](https://powerbi.microsoft.com/blog/guide-to-enabling-your-organization-to-use-power-bi-in-microsoft-teams/) to learn about the options for broad and targeted roll-out and decide what’s right for your organization.

### Install the Power BI app for Teams automatically

Are you a Power BI admin or a Teams admin? By default, the Power BI app for Teams is installed automatically in some circumstances. See [Install the Power BI app for Teams automatically](../admin/service-admin-portal-export-sharing.md#install-the-power-bi-app-for-teams-automatically) for details. To encourage the users in your organization to use the app more regularly, pin the app proactively in Teams through an app setup policy. It's useful to include Power BI as a pinned app, so users in Teams can easily find and use data. After November 1, 2021, Power BI app's installation occurs automatically for users who visit the Power BI service and meet the criteria.

Power BI end users might see a notification in the Power BI service notification pane that says the Microsoft Teams app was automatically installed.

:::image type="content" source="media/service-microsoft-teams-app/teams-auto-install-notification.png" alt-text="Screenshot of the Notification Center dialog with the message that says We installed the Power BI app for Microsoft Teams for you.":::

## Known issues and limitations

- Some options in the Power BI service aren't available in Microsoft Teams. These options include:
    - Notifications.
    - Ability to Download apps such as Power BI Desktop and Power BI Paginated Report Builder.
    - Ability to Send feedback.
    - Availability of Settings such as managing personal storage and accessing the admin portal.
- Power BI doesn't support the same localized languages that Microsoft Teams does. As a result, you might not see proper localization within a report.
- The Power BI app for Microsoft Teams is available for Commercial Cloud and US Government Community Cloud (GCC) customers.
- Search experience is not available in US Government Community Cloud (GCC).

## Next steps

- [Enable remote work in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Try Microsoft Power BI Community](https://community.powerbi.com/).
