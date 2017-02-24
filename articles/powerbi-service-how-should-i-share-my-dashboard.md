<properties
   pageTitle="How should I share dashboards, reports, and tiles?"
   description="In Power BI you can share dashboards, reports, and tiles in several different ways. Each has its advantages."
   services="powerbi"
   documentationCenter=""
   authors="ajayan"
   manager="erikre"
   backup="maggiesMSFT"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/23/2017"
   ms.author="ajayan"/>

# How do I collaborate on and share dashboards and reports?  

In this article, we'll talk about collaborating and sharing in Power BI as a process. First, you want to *collaborate in a group workspace* with your colleagues to create meaningful reports and dashboards. When they're ready, you may want other people to access them, and you have options for how you do that. You can *share* them, either from the Power BI service or from one of the Power BI mobile apps. You can bundle them into an *organizational content pack* and publish them to your whole organization or other large group. You can even publish them to the web, where anyone can interact with them. This article compares and contrasts these different activities.

In most cases, the people you collaborate and share with need [Power BI free or Pro](https://powerbi.microsoft.com/) licenses before they can see your dashboards and reports. 

## Collaborate on dashboards and reports in a group workspace 
Say you and a group of your workmates want to work on dashboards and reports together, and you all want full read and write access to those reports and dashboards. In that case, you need a *group workspace* with your workmates as members. Think of the group workspace as a place where you and they can collaborate on your Power BI dashboards and reports. Anyone in the group can create Power BI Desktop reports and publish them to the group workspace. Group workspaces in Power BI are built on Office 365 groups, so you can save Excel workbooks and other files to the workspace, too. Then you and other group members can create dashboards in the group workspace, and everyone in the group can edit them. Everyone in the group has the same permissions. 

**If you just want to share a finished dashboard with colleagues, don't add those colleagues to the group.** 

Instead, [share the dashboard](powerbi-service-how-should-i-share-my-dashboard.md#share-a-dashboard-with-colleagues-and-others) with them, or [create an organizational content pack](powerbi-service-how-should-i-share-my-dashboard.md#create-an-organizational-content-pack-and-publish-it) and publish it. You can't add security groups to Power BI group workspaces, so you have to manage individual users. Instead, by sharing dashboards or creating organizational content packs, you can distribute to Active Directory security groups, or even to your entire organization.

Everyone in your Power BI group workspace needs a Power BI Pro license. More about [creating groups in Power BI](powerbi-service-create-a-group-in-power-bi.md).

## Share a dashboard with others 
Now that you've created a dashboard, in your own My Workspace or in a group workspace, maybe you want others have access to it. One way to get it to them is to *share* it. Sharing has a specific meaning in Power BI. When you share a dashboard, those you share it with can view it and interact with it, but can't edit it. They see the same data that you see in the dashboard and reports. Those colleagues you share it with can share the dashboard with their colleagues, if you allow them to. Those outside your organization can view and interact with the dashboard, but can't share it. More about [sharing a dashboard](powerbi-service-share-unshare-dashboard.md).

### Share a dashboard with colleagues outside a group workspace 
If you're a member of a group in Power BI, you can share the group's dashboards with colleagues outside the group. It works the same as [sharing a dashboard with colleagues](powerbi-service-share-unshare-dashboard.md).

## Create an organizational content pack and publish it  
Another way to get your dashboard into other people's hands is to create an *organizational content pack*. They're a great way to distribute your Power BI insights with your colleagues. You've created a dashboard with its reports and datasets, either in your own workspace or in a group workspace. Now you publish them all together as a content pack &#151; either for your whole organization or for those in a specific security group or distribution list. When those colleagues go to the Content Pack Library for your organization, they see your content pack along with any others they have permission to see. More about [organizational content packs](powerbi-service-organizational-content-packs-introduction.md).  

## Publish to the web

When you publish Power BI reports to the web, you can embed interactive visualizations in blog posts, websites, social media, and other online communications, on any device. Publishing to web is available on reports in your personal workspace that you can edit. You can't publish to the web reports that were shared with you, and anyone on the Internet can view your reports. They don't need a Power BI license, but you have no control over who can see your reports. More about [publishing to the web](powerbi-service-publish-to-web.md).

## Share a snapshot of a tile from a Power BI mobile app
When you share a tile from one of the Power BI mobile apps, you're sharing a snapshot of the tile. Your recipients see the tile exactly as it was when you sent the mail. They can't open the dashboard. You can send snapshots of tiles to anyone &#151; not just colleagues in the same email domain.

In some of the mobile apps, you can add annotations before you send the snapshot of the tile.

Share a snapshot of a tile from:

- The [iPad app (Power BI for iOS)](powerbi-mobile-annotate-and-share-a-snapshot-from-the-ipad-app.md)
- The [iPhone app (Power BI for iOS)](powerbi-mobile-annotate-and-share-a-tile-from-the-iphone-app.md)
- The [Power BI app for Android phones](powerbi-mobile-annotate-and-share-a-tile-from-the-android-app.md)
- The [Power BI app for Windows 10 devices](powerbi-mobile-annotate-and-share-a-snapshot-from-the-windows-app.md)

## Print or save as PDF or other static file

You can also print or save as PDF (or other static file format) an entire dashboard, a dashboard tile, a report page, or a report visualization from the Power BI service. Reports can only be printed one page at a time -- you can't print the entire report at once. More about [printing or saving as a static file](powerbi-service-print.md).

## Table summarizing collaboration and sharing options

Here's a summary of how sharing and collaborating works, depending on which you do. Details follow below.

|        | When you: |  |  |  |  |  |
|:------------------------|:----------------------------|:----------------------------------------|:---------------------------------|:-----------------------------|:-----------------------------|:-----------------------------|
| Other people:         | Create a dashboard in a group | Share a dashboard | Publish a content pack | Publish to the web | Share a snapshot of a tile | Save as PDF |
| Can view and interact       | group members, yes   | yes                         | yes                              | yes                          | View, not interact | View, not interact |
| Can edit the original       | group members, yes  | no                          | no                               | no                           | no | no |
| Can create their own copies | group members, yes  | no                          | yes                              | no                           | yes | yes |
| Can share with others       | group members, yes  | colleagues, yes. others, no | no                               | no                           | yes | yes |
| Need a Power BI license       | Pro   | free or Pro | Pro  | none  | none | none |


## See also
-   [Share a dashboard with colleagues](powerbi-service-share-unshare-dashboard.md)
-   [Create a group in Power BI](powerbi-service-create-a-group-in-power-bi.md)
-   More questions? [Try the Power BI Community](http://community.powerbi.com/).



