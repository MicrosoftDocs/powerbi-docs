---
title: Create a link to a specific location in the Power BI mobile apps
description: Learn how to create a deep link to a specific dashboard, tile, or report in the Power BI mobile app with a uniform resource identifier (URI).
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 12/02/2024
ms.custom: sfi-image-nochange
---
# Create a link to a specific location in the Power BI mobile apps

You can use links to directly access specific Power BI content, such as a specific report, report page, dashboard, tile, etc.

There are two main scenarios for using links to access content in the Power BI mobile apps:

* To open Power BI from **outside of the mobile app**, and land on specific content. This is usually an integration scenario, where you're opening the Power BI mobile app from another app.

* To **navigate** inside Power BI. This is typically done when you want to create custom navigation in Power BI.

This article covers the following cases:

* Using links to open specific Power BI content from outside the mobile app. Two link formats are described. One uses a redirect method and can be used no matter where Power BI will open. The other opens directly in the Power BI mobile app and will work only on mobile devices that have the mobile app installed.

* Using links inside Power BI to navigate to specific Power BI content.

The mobile apps support report links that include query-string parameters. Such links open in the mobile app pre-filtered according to the conditions defined in the query string. For more information about creating report URLs with query string parameters, see [Filter a report query string parameters in the URL](../../collaborate-share/service-url-filters.md).

The mobile apps also support passing parameters to paginated reports via URLs. For more information, see [Pass a report parameter in a URL for a paginated report](../../paginated-reports/parameters/pass-report-parameter-url.md) for details.

## Use links from outside the mobile app

When you want to link to a specific item in Power BI from outside the mobile app, there are two options, depending on where the link is going to be opened:

* If you want the link to open correctly regardless of whether it's clicked in a computer browser or on a mobile device, you can create a link that ensures it will open correctly no matter where it's clicked. This link has a special redirect syntax to enable this smart behavior.

* If you know the link is only going to be opened on a mobile device that has the Power BI mobile app installed, you can avoid the redirect overhead of the above method and use another link syntax that opens the link directly in the Power BI mobile app on the mobile device. It's important to note however that while this link avoids the redirect overhead of the first method, it will not work if opened anywhere other than on a mobile device that has the Power BI mobile app installed.

### Create a link that works anywhere

The link format described in this section uses redirection to make sure the link works no matter where it's clicked.

* If the link is clicked on a mobile device, it makes sure that the device uses the Power BI mobile app to open the link. If the mobile app isn't installed on the device, it suggests to the user to go to the store to get it.

* If the link is clicked on a PC, it will open the relevant item in the Power BI web portal.

The link must start with a special prefix, followed by query parameters:

http:\//app.powerbi.com/Redirect?**[QUERYPARAMETERS]**

> [!IMPORTANT]
> If your content is hosted in special datacenter such as Government, China, etc., the link should start with the appropriate Power BI address, such as **app.powerbigov.us** or **app.powerbi.cn**.

The query parameters are:

|Parameter  | Value  | Description |
|---------|---------|---------|
|**action** (mandatory)    | OpenApp<br>OpenReport<br>OpenDashboard<br>OpenTile | |
|**appId**| 36 character guid | Must be specified if you want to open a report or dashboard that is part of an app.<br>Example: **appId=00001111-aaaa-2222-bbbb-3333cccc4444** |
|**groupObjectId**| 36 character guid | Specifies the workspace when you want to open a report or dashboard that isn't part of My Workspace.<br>Example: **groupObjectId=aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb** |
| **dashboardObjectId** | 36 character guid | Dashboard object ID (if action is OpenDashboard or OpenTile)<br>Example: **dashboardObjectId=aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb** |
| **reportObjectId** | 36 character guid | Report object ID (if action is OpenReport)<br>Example: **reportObjectId=aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb** |
| **tileObjectId** | 36 character guid | Tile object ID (if action is OpenTile)<br>Example: **tileObjectId=aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb** |
| **reportPage** | string | Page name if you want to open a specific report page. (if action is OpenReport)<br>Example: **reportPage=ReportSection6**  |
| **bookmarkGuid** | 36 character guid | Bookmark ID, if you want to open a specific bookmarked view. (if action is OpenReport)<br>Example: **bookmarkGuid=aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb**<br>**Note**: Values of the format *BookmarkXXXXXXXXXXXXXXXXXXX* aren't supported. |
| **ctid** | 36 character guid | Item organization ID (relevant for B2B scenarios. This can be omitted if the item belongs to the user's organization)<br>Example: **00aa00aa-bb11-cc22-dd33-44ee44ee44ee** |
| **fullScreen** | Boolean | When true, opens the item in full screen mode. Supported for reports, scorecards, dashboards, and apps (if the app landing item is one of the supported items).<br>Example: **fullScreen=1** |

>[!NOTE]
> Report-level bookmarks do not have a bookmarkGUID format and currently cannot be passed as a parameter of a deep link.

**Examples:**

In the following examples, placeholders for the parameter values are highlighted in bold. To get the actual values, go to the Power BI service, open the item you want to link to, and extract the values you need from the item's URL.

* **Open an app**

    https\://app.powerbi.com/Redirect?action=OpenApp&appId=**&lt;appid-guid&gt;**&ctid=**&lt;ctid-guid&gt;**

* **Open a dashboard that is part of an app**

    https\://app.powerbi.com/Redirect?action=OpenDashboard&appId=**&lt;appid-guid&gt;**&dashboardObjectId=**&lt;dashboardid-guid&gt;**&ctid=**&lt;ctid-guid&gt;**

* **Open a report that is part of a workspace other than My Workspace**

    https\://app.powerbi.com/Redirect?Action=OpenReport&reportObjectId=**&lt;reportid-guid&gt;**&groupObjectId=**&lt;groupobjectid-guid&gt;**&reportPage=**ReportSection&lt;num&gt;**

### How to get the correct link format

#### Links to apps and items in apps

For **apps, and for reports and dashboards that are part of an app**, the easiest way to get the link is to go to the app workspace and choose **Update app**. This opens the "publish app" experience. Open the permissions tab and expand the links section to see the links to the app and all its contents. You can use these links from outside Power BI to access the app and its contents directly.

:::image type="content" source="../../explore-reports/mobile/media/mobile-apps-deep-link-specific-location/mobile-link-copy-app-links.png" alt-text="Screenshot of app permissions tab showing how to find deep links to the app, report, and dashboard included in the app.":::

#### Links to items that aren't in an app

For reports and dashboards that aren't part of an app, you need to extract the object IDs you need from the item's URL. To do this, go to the Power BI service, navigate to the item you want to link to, and look for the values you need in the URL you see in the browser's address bar.

The examples show where you can find the IDs you need in the URLs of the items you want to link to.

* To find a 36-character dashboard object ID, navigate to the specific dashboard you want to link to in the Power BI service and find the dashboard object ID and any other required IDs in the places indicated:

    https\://app.powerbi.com/groups/me/dashboards/**&lt;dashboard-object-id&gt;**?ctid=**&lt;org-object-id&gt;**

* To find a 36-character report object ID, navigate to the specific report you want to link to in the Power BI service and find the necessary IDs as illustrated. This example contains a reference to a specific report page and a specific bookmark.

    https\://app.powerbi.com/groups/me/reports/**&lt;report-object-id&gt;**/**ReportSection&lt;num&gt;**?bookmarkGuid=**&lt;bookmark-id&gt;**

* To link to an item in a workspace other than My Workspace, you need to extract the group object ID. This example shows a report from a workspace other than My Workspace.

    https\://app.powerbi.com/groups/**&lt;group-object-id&gt;**/reports/**&lt;report-object-id&gt;**/**ReportSection&lt;report-section-num&gt;**?ctid=**&lt;org-object-id&gt;**

### Create a link that opens only on a device that has the Power BI mobile app installed

The link format described in this section links to a specific location within the Power BI mobile apps on all the mobile platforms: iOS, Android devices, and Windows. This link format opens the location directly, without any of the redirection involved in the method described in the previous section. **This format can only be opened on mobile devices that have the Power BI mobile app installed**.

Links of this format can point directly to dashboards, tiles, and reports. The destination of the deep link determines its format. Follow these steps to create deep links to different locations. 

* **Open the Power BI mobile app**

    Use this link to open the Power BI mobile app on any device:

    mspbi://app/

* **Open to a specific dashboard**

    This link opens the Power BI mobile app to a specific dashboard:

    mspbi://app/OpenDashboard?DashboardObjectId=**<36-character-dashboard-id>**

    To get the 36-character dashboard object ID, navigate to the specific dashboard in the Power BI service and extract it from the URL. For example, the dashboard object ID is highlighted in the following URL from the Power BI service:

    https\://app.powerbi.com/groups/me/dashboards/**&lt;aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb&gt;**

    If the dashboard isn't in My Workspace, you need to add the group object ID as well, either before or after the dashboard ID. The deep link shown has the group object ID parameter added after the dashboard object ID:

    mspbi://app/OpenDashboard?DashboardObjectId=**aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb**&GroupObjectId=**cccccccc-2222-3333-4444-dddddddddddd**</code>

    Note the ampersand (&) between the two parameters.

* **Open to a specific tile in focus**

    This link opens a specific tile in focus mode in the Power BI mobile app:

    mspbi://app/OpenTile?DashboardObjectId=**<36-character-dashboard-id>**&TileObjectId=**<36-character-tile-id>**

    To find the 36-character dashboard and tile object IDs, navigate to the specific dashboard in the Power BI service and open the tile in focus mode. In the example, the dashboard and tile IDs are highlighted.

    https\://app.powerbi.com/groups/me/dashboards/**aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb**/tiles/**cccccccc-2222-3333-4444-dddddddddddd**/infocus

    To open to this tile directly then, the link would be:

    mspbi://app/OpenTile?DashboardObjectId=aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb&TileObjectId=cccccccc-2222-3333-4444-dddddddddddd

    Note the ampersand (&) between the two parameters.

    If the dashboard isn't in My Workspace, add the GroupObjectId parameter, for example, &GroupObjectId=<36-character-group-id>

* **Open to a specific report**

    This link opens a specific report in the Power BI mobile app:

    mspbi://app/OpenReport?ReportObjectId=**<36-character-report-id>**

    To find the 36-character report object ID, navigate to the specific report in the Power BI service. The following URL from the Power BI service illustrates the report ID you would need to extract.

    https\://app.powerbi.com/groups/me/reports/**dddddddd-3333-4444-5555-eeeeeeeeeeee**

    If the report isn't in My Workspace, you need to add **&GroupObjectId=<36-character-group-id>** as well, either before or after the report ID. For example, in this case the deep link would be:

    mspbi://app/OpenReport?ReportObjectId=**dddddddd-3333-4444-5555-eeeeeeeeeeee**&GroupObjectId=**ffffffff-5555-6666-7777-aaaaaaaaaaaa**

    Note the ampersand (&) between the two parameters.

* **Open a specific report page**

    This link opens a specific report page in the Power BI mobile app:

    mspbi://app/OpenReport?ReportObjectId=**<36-character-report-id>**&reportPage=**ReportSection&lt;number&gt;**

    The report page is called **ReportSection**, followed by a number. Again, to find the values you need, open the report in the Power BI service, navigate to the specific report page, and extract the values you need from the URL. For example, the highlighted sections of this URL represent the values you would need to open to a specific report page:

    https\://app.powerbi.com/groups/me/reports/**dddddddd-3333-4444-5555-eeeeeeeeeeee**/**ReportSection11**

* **Add context** (optional)

    You can also add context to the string. Then, if you need to contact us, we can use that context to filter our data to find what is relevant to your app. To add context, add the parameter **context=&lt;app-name&gt;** to the link:

    For example, the following example shows a link that includes a context parameter:

    mspbi://app/OpenReport?ReportObjectId=**dddddddd-3333-4444-5555-eeeeeeeeeeee**&GroupObjectId=**eeeeeeee-4444-5555-6666-ffffffffffff**&**context=SlackDeepLink**

## Use links inside Power BI

In the Power BI mobile apps, links inside Power BI work just as they work in the Power BI service.

If you want to add link to your report that points to another Power BI item, you can just copy that item's URL from the browser address bar. For more information, see [Add a hyperlink to a text box in a report](../../create-reports/service-add-hyperlink-to-text-box.md).

## Considerations and limitations

Deep links to reports with a bookmarkGuid param are supported in the Mobile apps only when the value of the bookmarkGuid parameter has the standard 36-character GUID format. Links where the bookmarkGuid parameter value has the format *BookmarkXXXXXXXXXXXXXXXXXXX* aren't supported.

## Related content

Your feedback helps us decide what to implement in the future, so don’t forget to vote for other features you'd like to see in Power BI mobile apps.

* [What are the Power BI mobile apps?](../../explore-reports/mobile/mobile-apps-for-mobile-devices.md)
* Follow @MSPowerBI on Twitter
* Join the conversation at the [Power BI Community](https://community.powerbi.com/)
* [What is Power BI?](../../fundamentals/power-bi-overview.md)
