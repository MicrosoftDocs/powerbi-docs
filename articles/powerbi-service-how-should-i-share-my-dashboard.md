<properties
   pageTitle="How should I collaborate on & share dashboards and reports?"
   description="In Power BI you can collaborate on and share dashboards, reports, and tiles in several different ways. Each has its advantages."
   services="powerbi"
   documentationCenter=""
   authors="ajayan"
   manager="erikre"
   backup="maggiesMSFT"
   editor=""
   tags=""
   qualityFocus="monitoring"
   qualityDate="02/28/2017"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/01/2017"
   ms.author="ajayan"/>

# How should I collaborate on & share dashboards and reports?  

You create dashboards and reports yourself. Sometimes you want to collaborate on them with your colleagues, and then you want others to have access to them, too. What's the best way to distribute them?

In this article, we'll talk about options for collaborating and sharing in Power BI: 

- Collaborating with colleagues to create meaningful reports and dashboards in *app workspaces*.
- Bundling the finished dashboards and reports into *apps*, and distributing them to a larger group or your whole organization.
- Sharing dashboards from the service or the Power BI mobile apps.
- Publishing to the web, where anyone can interact with them. 
- printing. 

![](media/powerbi-service-how-should-i-share-my-dashboard/power-bi-apps-home-blog.png)

*Apps in the Power BI service*

This article compares these and other activities.

> [AZURE.NOTE] In most cases, the people you collaborate and share with need [Power BI free or Pro](https://powerbi.microsoft.com/) licenses before they can see your dashboards and reports. Read more about [Power BI Premium](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/).

## Collaborate with colleagues to create an app, with dashboards and reports

Say you and your teammates want to cdistribute your Power BI insights to your organization. The best way to do that is to create an *app*. An app is a collection of dashboards and reports purpose-built by your organization to deliver key metrics for faster and easier data-driven decisions. Apps are easy to find and install in the Power BI service ([https://powerbi.com](https://powerbi.com)). After you install them, you can view them in your browser or mobile device.

To create an app, you need a *app workspace*, with your teammates as members. Think of the app workspace as a staging area where you and they can collaborate on your Power BI dashboards and reports. All of you can create reports in Power BI Desktop and publish those reports to the app workspace. 

![](media/powerbi-service-how-should-i-share-my-dashboard/power-bi-apps-workspaces.png)

**If you just want to share a finished dashboard with colleagues, don't add those colleagues to the app workspace.** Instead, [create the app in an app workspace, and distribute it](powerbi-service-create-apps.md) to them. 

### Distribute your app

You and your colleagues have created an *app workspace*, then created and refined a dashboard with its reports and datasets in the app workspace. Now you bundle them together as an app and distribute them &#151; either to members of a security group or distribution list, or to your whole organization. 

![](media/powerbi-service-how-should-i-share-my-dashboard/power-bi-app-publish-600.png)

You can send your business users a direct link to the app, or they can search for it in AppSource. Read more about [distributing your apps](powerbi-service-what-are-apps.md#distribute-an-app).  

## Share a dashboard with others 
Let's say you've finalized a dashboard in your own My Workspace or in an app workspace and you want others have access to it. One way to get it to them is to *share* it. 

![](media/powerbi-service-how-should-i-share-my-dashboard/power-bi-service-share.png)

When you share a dashboard, those you share it with can view it and interact with it, but can't edit it. They see the same data that you see in the dashboard and reports unless row-level security (RLS) is applied to the underlying dataset. The colleagues you share it with can share the dashboard with their colleagues, if you allow them to. 

You can share dashboards to security groups or to your entire organization, and you can share with people outside your organization. They can view and interact with the dashboard too, but can't share it. More about [sharing a dashboard from the Power BI service](powerbi-service-share-unshare-dashboard.md).

> [AZURE.NOTE] You can't share with dynamic distribution lists.

You can also [share a dashboard from any of the Power BI mobile apps](powerbi-mobile-share-a-dashboard-from-the-iphone-app.md). 

### Share a dashboard with colleagues outside an app workspace 
If you're a member of an app workspace in Power BI, you can share the dashboards with colleagues outside the app workspace. It's the same as [sharing a dashboard with colleagues](powerbi-service-share-unshare-dashboard.md).

## Annotate and share from the Power BI mobile apps
In the Power BI mobile apps for iOS and Android devices, you can annotate a tile, report, or visual and then share it with anyone via email. 

![](media/powerbi-service-how-should-i-share-my-dashboard/power-bi-iphone-annotate.png)

You're sharing a snapshot of the tile, report, or visual, and your recipients see it exactly as it was when you sent the mail. The mail also contains a link to the dashboard or report, and if you've shared that with them already, they can open it. You can send snapshots of tiles to anyone &#151; not just colleagues in the same email domain.

More about [annotating and sharing tiles, reports, and visuals](powerbi-mobile-annotate-and-share-a-tile-from-the-iphone-app.md) from the iOS and Android mobile apps.

You can also share a snapshot of a tile from the [Power BI app for Windows 10 devices](powerbi-mobile-annotate-and-share-a-snapshot-from-the-windows-app.md).

## Publish to the web

You can publish Power BI reports to the whole Internet by embedding interactive visualizations in blog posts, websites, social media, and other online communications on any device. Anyone on the Internet can view your reports, and you have no control over who can see what you've published. They don't need a Power BI license. Publishing to the web is available only for reports that you can edit. You can't publish reports to the web if they're shared with you or if they're in an app. More about [publishing to the web](powerbi-service-publish-to-web.md).


## Print or save as PDF or other static file

You can print or save as PDF (or other static file format) an entire dashboard, dashboard tile, report page, or visualization from the Power BI service. Reports can only be printed one page at a time -- you can't print the entire report at once. More about [printing or saving as a static file](powerbi-service-print.md).

## Next steps
-   [Share a dashboard with colleagues](powerbi-service-share-unshare-dashboard.md)
-   [Create and distribute an app in Power BI](powerbi-service-create-apps.md)
-   More questions? [Try the Power BI Community](http://community.powerbi.com/).



