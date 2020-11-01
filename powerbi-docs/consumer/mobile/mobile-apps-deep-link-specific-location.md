---
title: Create a link to a specific location in the Power BI mobile apps
description: Learn how to create a deep link to a specific dashboard, tile, or report in the Power BI mobile app with a uniform resource identifier (URI).
author: paulinbar
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 03/11/2020
ms.author: painbar

---
# Create a link to a specific location in the Power BI mobile apps
Links can be used to directly access specific Power BI content, such as a specific report, report page, dashboard, tile, etc.

For the Power BI mobile apps, there are two two types of links that can be created for opening the Power BI mobile app on a device: 

* To open Power BI from **outside of the mobile app**, and land on specific content. This is usually an integration scenario, where you are opening the Power BI mobile app from another app. 
* To **navigate** from one place inside Power BI to another place inside Power BI. This is typically done when you want to create custom navigation in Power BI.

The second scenario is straightforward. If you want to include a link in an item inside Power BI, such as one of your reports, that points to another Power BI item, you can just copy the URL of the target item from the browser address bar and use that as the link you'll put into your report. **[PUT IN REFERENCE ABOUT INTERITEM LINKING]**

The first scenario, when you are linking to a specific item in Power BI from outside the mobile app, is less straightforward. It often requires creating an appropriate link. This article deals with constructing such a link.

When you want to link to a specific item in Power BI from outside the mobile app, there are two options, depending on where the link is going to be opened:

* If you want the link to open correctly regardless of whether it is clicked in a computer browser or on a mobile device, you can create a link that ensures it will open correctly no matter where it is clicked. This link has a special redirect syntax to enable this smart behavior.

* If you know the link is only going to be opened on a mobile device that has the Power BI mobile app installed, you can avoid the redirect overhead of the above method and use another link syntax that opens the link directly in the Power BI mobile app on the mobile device. It is important to note however that while this link avoids the redirect overhead of the first method, it will not work if opened anywhere other than on a mobile device that has the Power BI mobile app installed.

## Creating a link that works anywhere
When you create a link that is to be used from outside the Power BI mobile app, you want to make sure that it will be opened by the app, and, if the app is not installed on the device, that it will offer the user to install it. The link format described in this section makes sure that the device uses the app to open the link, and if the app is not installed on the device, it suggests to the user to go to the store to get it.

The link must start with a special prefix, followed by query parameters:


<code>https<nolink>://app.powerbi.com/Redirect?**[QUERYPARAMETERS]**</code>

> [!IMPORTANT]
> If your content is hosted in special datacenter such as Government, China, etc., the link should start with the appropriate Power BI address, such as **app.powerbigov.us** or **app.powerbi.cn**.

The query parameters are:

|Parameter  | Value  | Description |
|---------|---------|---------|
|**action** (mandatory)    | OpenApp<br>OpenReport<br>OpenDashboard<br>OpenTile | |
|**appId**| 36 character guid | Must be specified if you want to open a report or dashboard that is part of an app.<br>Example: **appId=baf4b16d-b5bd-4360-8a3a-51d11242c09b** |
|**groupObjectId**| 36 character guid | Specifies the workspace when you want to open a report or dashboard that is not part of My Workspace.<br>Example: **groupObjectId=9a3841c6-74b3-46f1-85fd-bdd78f27b30e** |
| **dashboardObjectId** | 36 character guid | Dashboard object ID (if action is OpenDashboard or OpenTile)<br>Example: **dashboardObjectId=033bb049-5b68-4392-b3ef-ae9a43738a4a** |
| **reportObjectId** | 36 character guid | Report object ID (if action is OpenReport)<br>Example: **reportObjectId=6114cec7-78e1-4926-88ff-0bc5338452cf** |
| **tileObjectId** | 36 character guid | Tile object ID (if action is OpenTile)<br>Example: **tileObjectId=a845dcb8-a289-43a8-94ea-67a8c0a068f9** |
| **reportPage** | ReportSection&lt;num&gt; | Page name if you want to open a specific report page. (if action is OpenReport)<br>Example: **reportPage=ReportSection6**  |
| **ctid** | 36 character guid | Item organization ID (relevant for B2B scenarios. This can be omitted if the item belongs to the user's organization)<br>Example: **ctid=5367c770-09d0-4110-bf6a-d760cb5ef681** . |
||||

**Examples:**

In the following examples, placeholders for the parameter values are highlighted in bold. To get the actual values, you open the item you want to link to in the Power BI service and extract the values you need from the item's URL.

* Open an app

    https<nolink>://app.powerbi.com/Redirect?action=OpenApp&appId=**&lt;appid-guid&gt;**&ctid=**&lt;ctid-guid&gt;**
   
* Open a dashboard that is part of an app

    https<nolink>://app.powerbi.com/Redirect?action=OpenDashboard&appId=**&lt;appid-guid&gt;**&dashboardObjectId=**&lt;dashboardid-guid&gt;**&ctid=**&lt;ctid-guid&gt;**
* Open a report that is part of a workspace other than My Workspace

    https<nolink>://app.powerbi.com/Redirect?Action=OpenReport&reportObjectId=**&lt;reportid-guid&gt;**&groupObjectId=**&lt;groupobjectid-guid&gt;**&reportPage=**ReportSection&lt;num&gt;**

### How to get the correct link format

#### Links to apps and items in apps

For **apps, and for reports and dashboards that are part of an app**, the easiest way to get the link is to go to the app workspace and choose **Update app**. This opens the "publish app" experience. Open the permissions tab and expand the links section to see the links to the app and all its contents. You can use these links to access the app and its contents directly.

![Power BI publish app links ](./media/mobile-apps-links/mobile-link-copy-app-links.png)

#### Links to items that are not in an app 

For reports and dashboards that are not part of an app, you need to extract the object IDs you need from the item's URL. To do this, navigate to the item you want to link to in the Power BI service, and look for the values you need in the URL you see in the browser's address bar.

For example, to find the 36-character dashboard object ID, navigate to the specific dashboard in the Power BI service and find the dashboard object ID and any other required IDs in the places indicated below:

https<nolink>://app.powerbi.com/groups/me/dashboards/**&lt;dashboard-object-id&gt;**?ctid=**&lt;org-object-id&gt;**

To find the 36-character report object ID, navigate to the specific report in the Power BI service and find the necessary IDs as illustrated below. Note that the example also contains a reference to a specific report page.

https<nolink>://app.powerbi.com/groups/me/reports/**&lt;report-object-id&gt;**/**ReportSection&lt;num&gt;**?ctid=**&lt;org-object-id&gt;**

The following example, like the one above also points to a specific report with a reference to a specific report page. However, in this case, the report not located in My Workspace, hence a group object ID is required.
The following is an example of a report from a workspace other than My Workspace. In such cases you need to extract the group object ID as well.

https<nolink>://app.powerbi.com/groups/**&lt;group-object-id&gt;**/reports/**&lt;report-object-id&gt;**/**ReportSection&lt;report-section-num&gt;**?ctid=**&lt;org-object-id&gt;**

## Use report URL with filter
Same as Power BI service, Power BI Mobile apps also support report URL that contains a filter query param. You can open a report in Power BI Mobile app and filter it to specific state. 
For example, this URL opens the Sales report and filter it by Territory

```html
https://app.powerbi.com/groups/me/reports/<report-guid-comes-here>/ReportSection3?ctid=<ctid-guid-comes-here>&filter=Store/Territory eq 'NC'
```

Read more about [how to build query param to filter reports](../../collaborate-share/service-url-filters.md).

## Create a link that opens only on a device the Power BI mobile app installed

You can create and use a uniform resource identifier (URI) to link to a specific location (a *deep link*) within the Power BI mobile apps on all the mobile platforms: iOS, Android devices, and Windows 10.

URI links can point directly to dashboards, tiles, and reports.

The destination of the deep link determines the format of the URI. Follow these steps to create deep links to different locations. 

### Open the Power BI mobile app

Use this URI to open the Power BI mobile app on any device:

```html
mspbi://app/
```
### Open to a specific dashboard

This URI opens the Power BI mobile app to a specific dashboard:

```html
mspbi://app/OpenDashboard?DashboardObjectId=<36-character-dashboard-id>
```

To find the 36-character dashboard object id, navigate to the specific dashboard in the Power BI service (https://powerbi.com). For example, see the highlighted section of this URL:

<code>https<nolink>://powerbi.com/groups/me/dashboards/**61b7e871-cb98-48ed-bddc-6572c921e270**</code>

If the dashboard is not in My Workspace, you need to add the group object ID as well, either before or after the dashboard ID. The following URL from the Power BI service illustrates the IDs you would need to extract from the regular URL in the Power BI service in this case.

<code>mspbi<nolink>://app/OpenDashboard?DashboardObjectId=**e684af3a-9e7f-44ee-b679-b9a1c59b5d60**&GroupObjectId=**8cc900cc-7339-467f-8900-fec82d748248**</code>

Note the ampersand (&) between the two.

### Open to a specific tile in focus

This URI opens a specific tile in focus mode in the Power BI mobile app:

```html
mspbi://app/OpenTile?DashboardObjectId=<36-character-dashboard-id>&TileObjectId=<36-character-tile-id>
```

To find the 36-character dashboard and tile object IDs, navigate to the specific dashboard in the Power BI service (https://powerbi.com) and open the tile in focus mode. In the example below the dashboard and tile IDs are highlighted.

<code>https<nolink>://powerbi.com/groups/me/dashboards/**3784f99f-b460-4d5e-b86c-b6d8f7ec54b7**/tiles/**565f9740-5131-4648-87f2-f79c4cf9c5f5**/infocus</code>

To open to this tile directly then, the URI would be:

<code>mspbi<nolink>://app/OpenTile?DashboardObjectId=3784f99f-b460-4d5e-b86c-b6d8f7ec54b7&TileObjectId=565f9740-5131-4648-87f2-f79c4cf9c5f5</code>

Note the ampersand (&) between the two parameters.

If the dashboard is not in My Workspace, add the GroupObjectId parameter, e.g. <code>&GroupObjectId=<36-character-group-id></code>

### Open to a specific report

This URI opens a specific report in the Power BI mobile app:

```html
mspbi://app/OpenReport?ReportObjectId=<36-character-report-id>
```

To find the 36-character report object id, navigate to the specific report in the Power BI service (https://powerbi.com). The following URL from the Power BI service illustrates the report ID you would need to extract.

<code>https<nolink>://powerbi.com/groups/me/reports/**df9f0e94-31df-450b-b97f-4461a7e4d300**</code>

If the report is not in My Workspace, you need to add `&GroupObjectId=<36-character-group-id>` as well, either before or after the report ID. For example,

<code>mspbi<nolink>://app/OpenReport?ReportObjectId=**e684af3a-9e7f-44ee-b679-b9a1c59b5d60**&GroupObjectId=**8cc900cc-7339-467f-8900-fec82d748248**</code>

Note the ampersand (&) between the two.

### Open to a specific report page

This URI opens a specific report page in the Power BI mobile app:

```html
mspbi://app/OpenReport?ReportObjectId=<36-character-report-id>&reportPage=ReportSection<number>
```

The report page is called **ReportSection**, followed by a number. Again, to find the values you need, open the report in the Power BI service (https://powerbi.com), navigate to the specific report page, and extract the values you need from the URL. For example, the highlighted sections of this URL represent the values you would need to open to a specific report page:

<code>https<nolink>://powerbi.com/groups/me/reports/**df9f0e94-31df-450b-b97f-4461a7e4d300**/ReportSection**11**</code>

https<nolink>://powerbi.com/groups/me/reports/**df9f0e94-31df-450b-b97f-4461a7e4d300**/ReportSection**11**

### Open in full-screen mode
You can also add the **openFullScreen** parameter to open specific report in full-screen mode. For following example opens the same report page as above, but in full screen mode:

<code>https<nolink>://powerbi.com/groups/me/reports/df9f0e94-31df-450b-b97f-4461a7e4d300/ReportSection11</code>**&openFullScreen=true**

### Add context (optional)
You can also add context in the string. Then, if you need to contact us, we can use that context to filter our data to find what is relevant to your app. To add context, add the parameter `context=<app-name>` to the link:

For example, see the highlighted section of this URL: 

`https://powerbi.com/groups/me/reports/df9f0e94-31df-450b-b97f-4461a7e4d300/&context=SlackDeepLink`

mspbi://app/OpenDashboard?DashboardObjectId=<36-character-dashboard-id>


## Next steps
Your feedback helps us decide what to implement in the future, so don’t forget to vote for other features you'd like to see in Power BI mobile apps. 

* [Power BI apps for mobile devices](mobile-apps-for-mobile-devices.md)
* Follow @MSPowerBI on Twitter
* Join the conversation at the [Power BI Community](http://community.powerbi.com/)
* [What is Power BI?](../../power-bi-overview.md)
