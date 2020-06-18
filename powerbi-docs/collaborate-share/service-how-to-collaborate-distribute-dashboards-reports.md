---
title: Ways to collaborate and share in Power BI
description: In Power BI you can collaborate on and share dashboards, reports, tiles, and apps in different ways. Each way has its advantages.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 06/18/2020 
LocalizationGroup: Share your work
---

# Ways to collaborate and share in Power BI

You've created dashboards and reports. Maybe you want to collaborate on them with your coworkers. Or maybe you're ready to distribute them more widely. What's the best way to collaborate and share them them? In this article, we compare your options.

![Apps in the Power BI service](media/service-how-to-collaborate-distribute-dashboards-reports/power-bi-apps-new-look.png)

*Apps in the Power BI service*

**Collaborate**

- Collaborate with coworkers in *workspaces* to create meaningful reports and dashboards.

**Distribute or share dashboards and reports**

- *Share dashboards or reports* from your My Workspace or another workspace.
- Annotate and share from the Power BI *mobile apps*.
- Bundle dashboards and reports in workspaces into *apps* and distribute them to a larger group or your whole organization.
- Embed a report in *Microsoft Teams*.
- Embed reports in *secure portals* or *public web sites*.
- Print reports.
- Create a *template app* that you can distribute to external Power BI users, via Microsoft AppSource.
 
**Share data**

- Create *shared datasets* that coworkers can use as the basis for their own reports, in their own workspaces.
- Create *dataflows* as a way to share a common data source. Read about [self-service data prep with dataflows](../transform-model/service-dataflows-overview.md).

No matter which option you choose, to share your content you need a [Power BI Pro license](../fundamentals/service-features-license-type.md), or the content needs to be in a [Premium capacity](../admin/service-premium-what-is.md). License requirements vary for the colleagues who view your content, depending on the option you choose. The following sections spell out details. 

## Share dashboards and reports

Let's say you've finalized a report in Power BI Desktop, and you want other people to have access to it. One way to get it to them is to *share* it in the Power BI service. You publish it to your own My Workspace or another workspace. Maybe you create a dashboard to go with it, and you're ready.

![Share a report](media/service-how-to-collaborate-distribute-dashboards-reports/power-bi-share-report.png)

You need a Power BI Pro license to share your content. The people you share it with do too, or the content needs to be in a workspace in a [Premium capacity](../admin/service-premium-what-is.md). When you share a dashboard or report, recipients can view it and interact with it. If you give them permission, they can edit it, make a copy of it, and share it with their coworkers. They see the same data that you see in the dashboard or report, and get access to all the data in the underlying dataset, unless [row-level security (RLS)](../admin/service-admin-rls.md) is applied.

You can share with people outside your organization, too. They can view and interact with the dashboard or report too, but can't share it. 

Read about how to [share dashboards and reports](service-share-dashboards.md) from the Power BI service. Or read about adding a filter to a link and [share a filtered view of your report](service-share-reports.md).

## Annotate and share from the Power BI mobile apps

In the Power BI mobile apps for iOS and Android devices, you can annotate a tile, report, or visual and then share it with anyone via email.

![Annotate and share in the mobile apps](media/service-how-to-collaborate-distribute-dashboards-reports/power-bi-iphone-annotate.png)

You're sharing a snapshot of the tile, report, or visual, and your recipients see it exactly as it was when you sent the mail. The mail also contains a link to the dashboard or report. If they have a Power BI Pro license or the content is in a [Premium capacity](../admin/service-premium-what-is.md), and you've shared the content with them already, they can open it. You can send snapshots of tiles to anyone, not just coworkers in the same email domain.

Read more about [annotating and sharing tiles, reports, and visuals](../consumer/mobile/mobile-annotate-and-share-a-tile-from-the-mobile-apps.md) from the iOS and Android mobile apps.

You can also [share a snapshot of a tile](../consumer/mobile/mobile-windows-10-phone-app-get-started.md) from the Power BI app for Windows 10 devices, but not annotate it.


## Collaborate in a workspace

When teams work together, they need access to the same documents so they can collaborate easily. In Power BI workspaces, teams share the ownership and management of their dashboards, reports, datasets, and workbooks. Sometimes Power BI users organize their workspaces based on organizational structures, or they create them for specific projects. Still other organizations use several workspaces to store different versions of reports or dashboards they use. 

Workspaces provide roles that determine what permissions your coworkers have. You can use those roles to determine who can manage the entire workspace, edit or distribute its content, or just view its content. Read more about [roles in the new workspaces](service-new-workspaces.md#roles-in-the-new-workspaces).

![Workspaces](media/service-how-to-collaborate-distribute-dashboards-reports/power-bi-workspace.png)

Workspaces are better for collaboration than My Workspace, because they allow co-ownership of content. You and your entire team can easily make updates or give others access. My Workspace is best used by individuals for one-off or personal content.

Now, imagine you have a finished dashboard you need to share with your colleagues. What's the best way to give them access to the dashboard? The answer depends on a number of factors. 

- If colleagues need to keep the dashboard up to date, or need access to all the content in the workspace, add them to the workspace as Members or Contributors. 
- If colleagues just need to view the content in the workspace, add them as Viewers.
- If colleagues just need to see that dashboard and not all the content in the workspace, you can share the dashboard with them directly.
- If the dashboard is part of a set of dashboards and reports that you need to distribute to many colleagues, then publishing an *app* is likely the best choice.

Read more about [creating the new workspaces](service-create-the-new-workspaces.md). 

## Distribute insights in an app

Say you want to distribute your dashboard to a broad audience in your organization. You and your coworkers have created a *workspace*, then created and refined dashboards, reports, and datasets in the workspace. Now you select the dashboards and reports and publish them as an *app*, either to a group or to your whole organization.

![Publish app icon](media/service-how-to-collaborate-distribute-dashboards-reports/power-bi-publish-app.png)

Apps are easy to find and install in the Power BI service ([https://app.powerbi.com](https://app.powerbi.com)). You can send your business users a direct link to the app, or they can search for it in AppSource. If your Power BI administrator gives you permissions, you can install an app automatically in your coworkers' Power BI accounts. Read more about [publishing your apps](service-create-distribute-apps.md).

After they install an app, they can view it in their browser or mobile device.

For your users to view your app, either they need to have a Power BI Pro license, too, or the app needs to be stored in a Power BI Premium capacity. Read [What is Power BI Premium?](../admin/service-premium-what-is.md) for details.

You can publish apps to people outside your organization, too. They can view and interact with the app content, but can't share it with others. Now you can create *template apps* deploy them to any Power BI customer.

## Embed a report in Microsoft Teams

Increase data-driven collaboration in your organization by embedding your Power BI reports and Power BI paginated reports in Microsoft Teams. You can add separate Power BI tabs for each individual report, and give each tab the name of the report, or any other name. Your colleagues can view your reports on the Power BI tabs in Teams. They can also open the Conversation window and comment on the report right in Teams. Read more about [embedding a report in Microsoft Teams](service-embed-report-microsoft-teams.md).

## Embed reports in secure portals or public web sites

### Embed in secure portals

You can embed Power BI reports in portals or web sites where your users expect to see them.  
The **Embed in SharePoint Online** and the **Embed** option in the Power BI service allows you to embed reports for your internal users securely. 

- **Embed in SharePoint Online** works with the Power BI web part for SharePoint Online. It provides a single sign-on experience with control over how the report is embedded. 
- **Embed** works with any portal or web site that supports embedding content using a URL or an iFrame. 

Whichever option you choose, Power BI enforces all permissions and data security before users can see content. The person viewing the report needs the appropriate license. Read more about [Embedding in SharePoint Online](service-embed-report-spo.md) and the [Embed](service-embed-secure.md) option in Power BI.

### Publish to public web sites

With **Publish to web**, you can publish Power BI reports to the whole Internet by embedding interactive visualizations in blog posts, web sites, social media, and other online communications on any device. Anyone on the Internet can view your reports, and you have no control over who can see what you've published. They don't need a Power BI license. Publishing to the web is available only for reports that you can edit. You can't publish reports to the web if they're shared with you or if they're in an app. Read more about [publishing to the web](service-publish-to-web.md).
>[!Warning]
>Use [Publish to web](service-publish-to-web.md) only to share content publicly, not for internal sharing.

## Print or save as PDF or other static file

You can print or save as PDF (or other static file format) an entire dashboard, dashboard tile, report page, or visualization from the Power BI service. Reports can only be printed one page at a time -- you can't print the entire report at once. Read more about [printing or saving as a static file](../consumer/end-user-print.md).

## Create and deploy template apps

*Template apps* are designed to be distributed publicly, often in Microsoft AppSource. You build an app, and with little or no coding, you can deploy it to any Power BI customer. Your customers connect to their own data and instantiate their own accounts. Read more about [Power BI template apps](../connect-data/service-template-apps-overview.md).

## Share a dataset

Let's face it, some people are more skilled at creating high-quality, well-designed data models in their reports. Maybe you're that person. Your whole organization can benefit from using the same well-designed data models. *Shared datasets* fill that role. When you create a report with a data model that everyone should use, you can save that report to the Power BI service and give the right people permission to use it. Then they can build their reports on your dataset. That way, everyone is basing their reports on the same data, and seeing the same "version of the truth."

![Find a shared dataset](media/service-how-to-collaborate-distribute-dashboards-reports/power-bi-shared-datasets.png)

Read more about [creating and using shared datasets](../connect-data/service-datasets-across-workspaces.md).

## Considerations and limitations

- You can't share reports from Power BI Report Server. Instead, you can create [subscriptions for yourself or others](/sql/reporting-services/working-with-subscriptions-web-portal).


## Next steps

- [Share dashboards with coworkers and others](service-share-dashboards.md)
- [Create and publish an app in Power BI](service-create-distribute-apps.md)
- [Embed report in a secure portal or web site](service-embed-secure.md)

Have feedback? Go to the [Power BI Community site](https://community.powerbi.com/) with your suggestions.

More questions? [Try the Power BI Community](https://community.powerbi.com/)
