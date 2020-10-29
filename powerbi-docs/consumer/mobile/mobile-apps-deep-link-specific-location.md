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

For the Power BI mobile apps, there are two two types of links that can be created for opening the Power BI mobile app on your device: 

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

```http
https://app.powerbi.com/Redirect?action=<action>&<param>=<value>[&<param>=<value>]*
```

> [!IMPORTANT]
> If your content is hosted in special datacenter like Government, China, etc., the link should start with the appropriate Power BI address, such as **app.powerbigov.us** or **app.powerbi.cn**.   
>


The **QUERY PARAMS** are:


|Parameter  | Value  | Description |
|---------|---------|---------|
|**action** (mandatory)    | OpenApp<br>OpenReport<br>OpenDashboard<br>OpenTile | |
|**appId**| 36 character guid | Must be specified if you want to open a report or dashboard that is part of an app. |
|**groupObjectId**| 36 character guid | Must be specified if you want to open a report or dashboard that is part of workspace (but not My Workspace). |
| **dashboardObjectId** | 36 character guid | Dashboard object ID (if action is OpenDashboard or OpenTile) |
| **reportObjectId** | 36 character guid | Report object ID (if action is OpenReport) |
| **tileObjectId** | 36 character guid | Tile object ID (if action is OpenTile) |
| **reportPage** | ? | Page name if you want to open a specific report page. (if action is OpenReport) |
| **ctid** | 36 character guid | Item organization ID (relevant for B2B scenarios. This can be omitted if the item belongs to the user's organization). |
||||

**Examples:**

* Open app link 
  ```html
  https://app.powerbi.com/Redirect?action=OpenApp&appId=appidguid&ctid=organizationid
  ```

* Open dashboard that is part of an app 
  ```html
  https://app.powerbi.com/Redirect?action=OpenDashboard&appId=**appidguid**&dashboardObjectId=**dashboardidguid**&ctid=**organizationid**
  ```

* Open report that is part of a workspace
  ```html
  https://app.powerbi.com/Redirect?Action=OpenReport&reportObjectId=**reportidguid**&groupObjectId=**groupidguid**&reportPage=**ReportSectionName**
  ```

### How to get the right link format

#### Links of apps and items in app

For **apps and reports and dashboard that are part of an app**, the easiest way to get the link is to go to the workspace and choose "Update app". This will open the "Publish app" experience, and in the Access tab, you will find a **Links** section. Expanding that section and you will see list of the app and all its content links that can be used to access them directly.

![Power BI publish app links ](./media/mobile-apps-links/mobile-link-copy-app-links.png)

#### Links of items not in app 

For reports and dashboards that are not part of an app, you need to extract the IDs from the item URL.

For example, to find the 36-character **dashboard** object ID, navigate to the specific dashboard in the Power BI service 

```html
https://app.powerbi.com/groups/me/dashboards/**dashboard guid comes here**?ctid=**organization id comes here**`
```

To find  the 36-character **report** object ID, navigate to the specific report in the Power BI service.
This is an example of report from "My Workspace"

```html
https://app.powerbi.com/groups/me/reports/**report guid comes here**/ReportSection3?ctid=**organization id comes here**`
```
The above URL contains also specific report page **"ReportSection3"**.

This is an example of a report from a workspace (not My Workspace)

```html
https://app.powerbi.com/groups/**groupid comes here**/reports/**reportid comes here**/ReportSection1?ctid=**organizationid comes here**
```

## Use report URL with filter
Same as Power BI service, Power BI Mobile apps also support report URL that contains a filter query param. You can open a report in Power BI Mobile app and filter it to specific state. 
For example, this URL opens the Sales report and filter it by Territory

```html
https://app.powerbi.com/groups/me/reports/**report guid comes here**/ReportSection3?ctid=**organization id comes here**&filter=Store/Territory eq 'NC'
```

Read more on [how to build query param to filter reports](../../collaborate-share/service-url-filters.md).

## Next steps
Your feedback helps us decide what to implement in the future, so don't forget to vote for other features you'd like to see in Power BI mobile apps. 

* [Power BI apps for mobile devices](mobile-apps-for-mobile-devices.md)
* Follow @MSPowerBI on Twitter
* Join the conversation at the [Power BI Community](https://community.powerbi.com/)
* [What is Power BI?](../../fundamentals/power-bi-overview.md)