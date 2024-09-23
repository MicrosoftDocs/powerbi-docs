---
title: Add the Power BI app to Microsoft Teams
description: Learn how to add the Power BI app to Microsoft Teams. The Power BI app brings the entire basic Power BI service experience into Microsoft Teams.
author: ajburnle
ms.author: ajburnle
ms.reviewer: lukaszp
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 02/28/2023
---

# Add the Power BI app to Microsoft Teams

This article describes how you can install, pin, and interact with Power BI directly inside Microsoft Teams. The Power BI personal app brings the entire basic Power BI service experience to Microsoft Teams.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-app-teams.png" alt-text="Screenshot of the Power BI app home page in Microsoft Teams showing the In Teams tab selected.":::

With the Power BI app in Microsoft Teams, you can [collaborate with Power BI in Teams](service-collaborate-microsoft-teams.md). The app is your personal experience of Power BI. It's as if the Power BI service lives inside Microsoft Teams. After you install it, you can do almost everything in Microsoft Teams that you can do in the Power BI service.

- Create, view, and edit dashboards, reports, and apps.
- Create and participate in workspaces.
- Share content, either through email or through Microsoft Teams.

Also, there's a feature in the Power BI app in Teams that you don't see when you view the Power BI service (app.powerbi.com) in a web browser. On the Power BI home page in Teams, you can [see all the Power BI tabs you've viewed](service-teams-pivot.md) in Teams.

There are a few features that you can access only in the Power BI service in a browser. For details, see the [Known issues and limitations](#known-issues-and-limitations) section of this article.

> [!NOTE]
> When you install the Power BI app in Microsoft Teams, if you are in Microsoft 365 Targeted Release or Office Insiders Beta Channel, then the public preview of the Power BI app in Microsoft Outlook and Microsoft Office is also installed. For details, see [public preview in Outlook and Office](service-collaborate-microsoft-teams.md#OutlookOffice).

## Requirements

Ensure the following elements are in place to install the Power BI app in Microsoft Teams:

- Power BI app is enabled in the Teams Admin center apps list.
- Your users with a Fabric (Free) license can access personal analytics. They can use the built-in Teams analytics report and create reports in their My workspace.
- Your users with Fabric (Free) licenses can also access content that's shared with them from a workspace that's part of a [Power BI Premium capacity (P SKU)](../enterprise/service-premium-what-is.md) or [Fabric F64 or greater capacity](/fabric/enterprise/licenses#capacity-and-skus).
- Your users with a Power BI Pro or Premium Per User (PPU) license can share content with others or build content in workspaces.
- Users have signed in within the Power BI app for Teams or the Power BI service and activated their Power BI license.
- Users meet the requirements to use the **Power BI** tab in Microsoft Teams.

## Install the Power BI app

Select **More added apps (...)** in the left navigation bar, and then search for and select **Power BI**.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-app.png" alt-text="Screenshot of the Teams page with More added apps menu selected. Power BI is entered in the search bar and selected from the apps list.":::

That's it! The Power BI app is installed in Microsoft Teams.

## Sign in to Power BI

The first time you open the Power BI app in Teams, you need to sign in to Power BI. If multifactor authentication (MFA) for Power BI is configured for your account, you'll see a message requesting additional permissions.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-app-mfa-sign-in.png" alt-text="Screenshot showing pop-up screen for multifactor authentication in the Power BI app for Teams.":::

Select **Continue**, and then provide the next factor of authentication (as configured by your organization).

If MFA for Power BI is not configured for your account, you'll be prompted to go through the regular Power BI sign in process.

## Pin the Power BI app to the Teams navigation pane

To keep the app available in Teams, pin it to the Teams navigation pane. Right-click the Power BI icon in the Teams navigation pane, and select **Pin**.

:::image type="content" source="media/service-microsoft-teams-app/service-teams-pin-app.png" alt-text="Screenshot of the Teams navigation pane. The Power BI icon is right-clicked and the pin option is selected.":::

That's it. Now you can view your Power BI content in Teams whenever you want.

## Interact with your content in Microsoft Teams

The interaction with your content in Microsoft Teams is the same as with the Power BI service. You interact with your dashboards, reports, apps, or workspaces in the same ways.

You can even share a report with your coworkers from the Power BI app in Microsoft Teams.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-app-share-teams.png" alt-text="Screenshot of the Opportunity Analysis Sample report in the Microsoft Teams app with the Revenue Overview displayed and Share option selected.":::

The Power BI app in Microsoft Teams also features a hub for training. Select **Learn** to view the **Learning Center**.

:::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-learn-tab.png" alt-text="Screenshot of the Learning center in the Power BI app in Microsoft Teams. The Learn tab is selected in Teams and the Power BI navigation pane.":::

The Power BI app in Microsoft Teams helps you multi-task by remembering where you navigated to for one hour. When you leave the app and return within one hour, the app *automatically takes you back* to where you were working by navigating to: 

- Items you visited, such as the report page you were on and the filters you applied.
- Places you visited, such as Home, Create, Data hub, Workspaces, and so on.

When using the Power BI app in Microsoft Teams Desktop, you can use the Microsoft Teams back button to navigate back within the Power BI app. When using the app in Microsoft Teams in a web browser, use the browser back button.  

### Differences in interactions

A few interactions are different in the Teams app than they are in the browser.

- When you look at a dashboard or report, you don't see the Power BI navigation pane. To access the navigation pane, select **Close** to go back to Home or the workspace.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-close-report.png" alt-text="Screenshot of the Opportunity Analysis Sample report in Power BI app in Microsoft Teams with Close button selected.":::

- To open the report in the Power BI service instead of viewing it in Microsoft Teams, select **Open this on the web**.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-teams-open-web.png" alt-text="Screenshot of the web button in Power BI app in Microsoft Teams.":::

## Search for Power BI content in Teams

With the search experience in Teams, you can find recent reports, dashboards, and apps and open them within the Power BI app for Teams. Give the search experience a try.

1. In the Teams search bar, enter *@Power BI*.

    > [!NOTE]
    > Be sure to include the space between *Power* and *BI*.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-search-teams.png" alt-text="Screenshot of the Teams page with @Power BI entered and highlighted in the Teams search bar.":::

1. Select an item from the list, or enter something to search for.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-search-teams-reports.png" alt-text="Screenshot of the Teams search bar showing a list of reports and My workspace in Power BI app.":::

1. Select **Open**.

    The first time you use this capability, you need to sign in.

1. If you haven't installed the Power BI app yet, Teams asks you to add it.

    :::image type="content" source="media/service-microsoft-teams-app/power-bi-search-teams-apps.png" alt-text="Screenshot of the Teams page showing the Power BI icon and the tutorial video for Power BI. The Add button is selected.":::

## Increase Power BI app adoption in Teams

Your organization can make it easier for everyone to find and use data by installing and pinning the Power BI app for Teams for users. Pinning is optional but recommended.

Are you a leader in your organization? You can encourage individuals and teams to use the Power BI app in Teams by installing it for themselves. Read the [Guide to enabling your organization to use Power BI in Microsoft Teams](https://powerbi.microsoft.com/blog/guide-to-enabling-your-organization-to-use-power-bi-in-microsoft-teams/) to learn about the options for broad and targeted rollout and decide what’s right for your organization.

### Install the Power BI app for Teams automatically

Are you a Power BI admin or a Teams admin? By default, the Power BI app for Teams is installed automatically in some circumstances. See [Install the Power BI app for Teams automatically](/fabric/admin/service-admin-portal-export-sharing#install-the-power-bi-app-for-teams-automatically) for details. To encourage the users in your organization to use the app more regularly, pin the app proactively in Teams through an app setup policy. It's useful to include Power BI as a pinned app, so users in Teams can easily find and use data. After November 1, 2021, installation occurs automatically for users who visit the Power BI service and meet the criteria.

Power BI end users might see a notification in the Power BI service notification pane that says the Microsoft Teams app was automatically installed.

:::image type="content" source="media/service-microsoft-teams-app/teams-auto-install-notification.png" alt-text="Screenshot of the Notification Center dialog with the message that says We installed the Power BI app for Microsoft Teams for you.":::

## Known issues and limitations

- Some options in the Power BI service aren't available in Microsoft Teams. These options include:

  - Notifications.
  - Downloading apps such as Power BI Desktop and Power BI Paginated Report Builder.
  - Sending feedback.
  - Settings such as managing personal storage and accessing the admin portal.

- Power BI doesn't support the same localized languages that Microsoft Teams does. As a result, you might not see proper localization within a report.
- The Power BI app for Microsoft Teams is available to Commercial Cloud and US Government Community Cloud (GCC) customers.
- Search experience isn't available in US GCC.
- To automatically take you back when navigating back to the app, your navigation history is saved approximately every 15 seconds. The history is stored locally on your computer or in your web browser window. If you navigate to a place and filter, then quickly switch to another part of Teams, such as to Chat, Calendar, or Teams, your navigation may not be captured. If you change computers or start a new browser window, the history isn't available.  

## Related content

- [Enable remote work in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
