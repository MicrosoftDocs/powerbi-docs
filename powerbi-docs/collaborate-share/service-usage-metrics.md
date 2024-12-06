---
title: Monitor report usage metrics
description: How to view, save, and use usage metrics for Power BI dashboards and reports. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 08/29/2023
LocalizationGroup: Dashboards
---

# Monitor report usage metrics

Usage metrics help you understand the impact of your dashboards and reports. When you run either dashboard usage metrics or report usage metrics, you discover how those dashboards and reports are being used throughout your organization, who's using them, and for what purpose. This article outlines usage metrics reports.

Interested in the new usage report? It's currently in preview. See [Monitor usage metrics in the workspaces (preview)](service-modern-usage-metrics.md) for details.

Usage metrics reports are read-only. However, you can copy a usage metrics report. Copying creates a standard Power BI report that you can edit. You can also build your own reports in Power BI Desktop based on the underlying semantic model, which contains usage metrics for all dashboards or all reports in a workspace. To begin with, the copied report shows metrics just for the selected dashboard or report. You can remove the default filter and have access to the underlying semantic model, with all the usage metrics of the selected workspace. You may even see the names of specific users, if your admin has allowed that.

![Screenshot showing usage metrics report.](media/service-usage-metrics/power-bi-dashboard-usage-metrics-update-3.png)

> [!NOTE]
> Usage metrics track usage of reports that are embedded in SharePoint Online. However, usage metrics don't track dashboards and reports embedded via the “user owns credentials” or “app owns credentials” flow. Usage metrics also don't track usage of reports embedded via [publish to web](service-publish-to-web.md).

## Why usage metrics are important

Knowing how your content is being used helps you demonstrate your impact and prioritize your efforts. Your usage metrics may show that one of your reports is used daily by a huge segment of the organization and it may show that a dashboard you created isn't being viewed at all. This type of feedback is invaluable in guiding your work efforts.

You can only run usage metrics reports in the Power BI service. However, if you save a usage metrics report or pin it to a dashboard, you can open and interact with that report on mobile devices.

## Prerequisites

- You need a Power BI Pro or Premium Per User (PPU) license to run and access the usage metrics data. However, the usage metrics feature captures usage information from all users, regardless of the license they're assigned.
- To access usage metrics for a particular dashboard or report, you must have edit access to that dashboard or report.
- Your Power BI admin has to have enabled usage metrics for content creators. You Power BI admin may have also enabled collecting per-user data in usage metrics. Read about how to [enable these options in the admin portal](/fabric/admin/service-admin-portal-audit-usage). 

## View a Usage Metrics report

1. Start in the workspace that contains the dashboard or report.
1. From the workspace content list, select **More options (...)** for the report and select **View usage metrics report**.

    ![Screenshot of steps to view Usage Metrics.](media/service-modern-usage-metrics/power-bi-modern-view-usage-metrics.png)

    Or open the report, then on the command bar, select **More options (...)** > **Open usage metrics**.

    :::image type="content" source="media/service-modern-usage-metrics/service-more-options-open-usage-metrics.png" alt-text="Screenshot of selecting More options, Open usage metrics.":::

1. The first time you do this, Power BI creates the usage metrics report and lets you know when it's ready.

    ![Screenshot showing metrics are ready.](media/service-usage-metrics/power-bi-usage-metrics-ready.png)

1. To see the results, select **View usage metrics**.

1. Power BI prompts you to ask if you want to **Try the new usage report**. Select **Got it**.

    :::image type="content" source="media/service-usage-metrics/try-new-usage-report.png" alt-text="Screenshot showing Try the new usage report.":::

1. To display the improved usage metrics report, in the upper right corner, toggle the **New usage report** switch to **On**.

    :::image type="content" source="media/service-usage-metrics/toggle-new-usage-report-on.png" alt-text="Screenshot showing toggling the new usage report on.":::

1. If you turn the new usage report on, see the article [Monitor usage metrics in the workspaces (preview)](service-modern-usage-metrics.md) to continue.

    If you stay with the current usage report, continue in this article.

    Usage metrics are a powerful ally as you work to deploy and maintain Power BI dashboards and reports. Wondering which pages of your report are most useful, and which ones you should phase out? Slice by **Report page** to find out. Wondering if you should build a mobile layout for your dashboard? Slice by **Platforms** to discover how many users are accessing your content via the mobile apps vs. via web browser.

5. Optionally, hover over a visualization and select the pin icon to add the visualization to a dashboard. Or, from the top menu bar, select **Pin Live Page** to add the entire page to a dashboard. From the dashboard, you can monitor the usage metrics more easily or share them with others.

    > [!NOTE]
    > If you pin a tile from a usage metrics report to a dashboard, you can't add that dashboard to an app.

### Dashboard Usage Metrics report

![Screenshot showing Dashboard usage metrics report.](media/service-usage-metrics/power-bi-dashboard-usage-metrics-update-3.png)

### Report Usage Metrics

![Screenshot showing Report usage metrics report.](media/service-usage-metrics/power-bi-report-usage-metrics-update.png)

## About the Usage Metrics report

When you select **Usage metrics** or the icon ![usage metrics icon.](media/service-usage-metrics/power-bi-usage-metrics-report-icon.png) next to a dashboard or report, Power BI generates a pre-built report with usage metrics for that content for the last 90 days.  The report looks similar to the Power BI reports you're already familiar with. You can slice based on how your end users received access, whether they accessed via the web or mobile app, and so on. As your dashboards and reports evolve, so too will the usage metrics report, which updates every day with new data.  

Usage metrics reports don't show up in **Recent**, **Workspaces**, **Favorites**, or other content lists. They can't be added to an app. If you pin a tile from a usage metrics report to a dashboard, you can't add that dashboard to an app.

To dig into the report data, or to build your own reports against the underlying semantic model, you have two options: 

- Make a copy of the report in the Power BI service. See [Save a copy of the Usage Metrics report](#save-a-copy-of-the-usage-metrics-report) later in this article for details.
- Connect to the semantic model from Power BI Desktop. For every workspace, the semantic model has the name "Report Usage Metrics Model." See [Establish a connection to a published semantic model](../connect-data/desktop-report-lifecycle-datasets.md#establish-a-power-bi-service-live-connection-to-the-published-semantic-model) for details.

    ![Screenshot showing Connect to a usage report semantic model.](media/service-usage-metrics/power-bi-usage-dataset.png)

## Which metrics are reported?

| Metric | Dashboard | Report | Description |
| --- | --- | --- | --- |
| Platforms slicer |yes |yes |Was the dashboard or report accessed via the Power BI service (powerbi.com) or a mobile device? Mobile includes all our iOS, Android, and Windows apps. |
| Report page slicer |no |yes |If the report has more than 1 page, slice the report by the page(s) that was viewed. "Blank" means a report page was recently added (within 24 hours the actual name of the new page appears in the slicer list) or report pages have been deleted. "Blank" captures these types of situations. |
| Views per day |yes |yes |Total number of views per day - a view is defined as a user loading a report page or dashboard. |
| Unique viewers per day |yes |yes |Number of *different* users who viewed the dashboard or report (based on the Microsoft Entra user account). |
| Views per user |yes |yes |Number of views in the past 90 days, broken down by individual users. |
| Shares per day |yes |no |Number of times the dashboard was shared with another user or group. |
| Total views |yes |yes |Number of views in the past 90 days. |
| Total viewers |yes |yes |Number of unique viewers in the past 90 days. |
| Total shares |yes |no |Number of times the dashboard or report was shared in the past 90 days. |
| Total in organization |yes |yes |Count of all dashboards or reports in the entire organization that had at least one view in the past 90 days.  Used to calculate rank. |
| Rank: Total views |yes |yes |For total views of all dashboards or reports in the organization over the past 90 days, where does this dashboard or report rank. |
| Rank: Total shares |yes |no |For total shares of all dashboards in the organization over the past 90 days, where does this dashboard or report rank. |

## Save a copy of the Usage Metrics report

Use **Save as** to convert the usage metrics report to a regular Power BI report that you can customize to meet your specific needs. Better yet, the underlying semantic model includes the usage details for all dashboards or reports in the workspace. This opens up more possibilities. You could, for example, create a report that compares the dashboards in your workspace, based on usage. Or you could create a usage metrics dashboard for your Power BI app by aggregating usage across all the content distributed within that app.  See how to remove the filter and [see all usage metrics for the workspace](#see-all-workspace-usage-metrics) later in this article.

### Create a copy of the usage report

When you create a copy of the read-only, pre-built usage report, Power BI creates an editable copy of the report. At first glance, it looks the same. However, you can now open the report in Editing view, add new visualizations, filters, and pages, modify or delete existing visualizations, and so on. Power BI saves the new report in the current workspace.

1. From the pre-built usage metrics report, select **File > Save As**. Power BI creates an editable Power BI report, saved in the current workspace.

    ![Screenshot showing Save as.](media/service-usage-metrics/power-bi-save-as.png)
2. Open the report in Editing view and [interact with it as you would with any other Power BI report](../create-reports/service-interact-with-a-report-in-editing-view.md). For example, add new pages and build new visualizations, add filters, format the fonts and colors, and so on.

    ![Screenshot showing Open report in Editing view.](media/service-usage-metrics/power-vi-editing-view.png)
3. The new report is saved to the **Reports** tab in the current workspace, and added to the **Recent** content list.

    ![Screenshot showing Reports tab.](media/service-usage-metrics/power-bi-new-report.png)
    
### Create a custom report in Power BI Desktop

You can use Power BI Desktop to build custom usage metrics reports based on the underlying semantic model. See [Establish a connection to a published semantic model](../connect-data/desktop-report-lifecycle-datasets.md#establish-a-power-bi-service-live-connection-to-the-published-semantic-model) for details. 

> [!NOTE]
> Power BI Desktop uses a Live Connection to the Report Usage Metrics Model semantic model. This cannot be changed to DirectQuery since the semantic model is owned by Power BI. Attempting to do so will result in an error in Power BI Desktop.

## See *all* workspace usage metrics

To see the metrics for all the dashboards or for all the reports in the workspace, you have to remove a filter. By default, the report is filtered to display metrics for only the dashboard or report that you used to create it.

1. Select **Edit report** to open the new editable report in Editing view.

    ![Screenshot showing select Edit report.](media/service-usage-metrics/power-bi-editing-view.png)
2. In the Filters pane, locate the **Report level filters** bucket and remove the filter by selecting the eraser next to **ReportGuid**.

    ![Screenshot showing Remove the filter.](media/service-usage-metrics/power-bi-usage-report-clear-filter.png)

    Now your report displays metrics for the entire workspace.

## Power BI admin controls for usage metrics

Usage metrics reports are a feature that the Power BI administrator can turn on or off. Administrators have granular control over which users have access to usage metrics; they are **On** by default for all users in the organization.

> [!NOTE]
> Only admins for the Power BI tenant can see the Admin portal and edit settings. 

By default, per-user data is enabled for usage metrics, and content consumer account information is included in the metrics report. If admins don’t want to expose this information for some or all users, they can disable the feature for specified security groups or for an entire organization. Account information then shows in the report as *Unnamed*.

When admins disable usage metrics for their entire organization, they can use the **delete all existing usage metrics content** option to delete all existing reports and dashboard tiles that were built using the usage metrics reports. This option removes access to usage metrics data for users in the organization who may already be using it. Deleting existing usage metrics content is irreversible.

See [Audit and usage metrics](/fabric/admin/service-admin-portal-audit-usage) in the Admin portal article for details on these settings. 

## Usage metrics in national/regional clouds

Power BI is available in separate national/regional clouds. These clouds offer the same levels of security, privacy, compliance, and transparency as the global version of Power BI, combined with a unique model for local regulations on service delivery, data residency, access, and control. Because of this unique model for local regulations, usage metrics aren't available in national/regional clouds. For more information, see [national/regional clouds](https://powerbi.microsoft.com/clouds/).

## Considerations and limitations

The usage metrics report isn't supported for My Workspace.

### Discrepancies between audit logs and usage metrics

It's important to understand that differences can occur when comparing usage metrics and audit logs, and why. *Audit logs* are collected using data from the Power BI service, and *usage metrics* are collected on the client. Aggregate counts of activities in audit logs may not always match usage metrics, because of the following differences:

* Usage metrics may sometimes undercount activities because of inconsistent network connections, ad blockers, or other issues that can disrupt sending the events from the client.
* Certain types of views aren't included in usage metrics, as described earlier in this article.
* Usage metrics may sometimes overcount activities, in situations where the client refreshes without the need for a request being sent back to the Power BI service. For example, switching report pages doesn't issue a request a report load to the server since the page definition is already in the browser.
* Sharing is disabled for the usage metrics report. To give people read access to the report, you first need to give them access to the workspace.
* Certain metrics in usage metrics report aren't included in audit logs. For example, report page views aren't part of audit logs.

### Discrepancies between REST APIs and usage metrics

The Power BI [Reports REST APIs](/rest/api/power-bi/reports) and [Admin REST APIs](/rest/api/power-bi/admin) also use Power BI service data. For the reasons described in the previous section, report counts (the number of reports) from the APIs can differ from report counts in usage metrics. Report counts derived from the APIs are unaffected by client issues and should be considered accurate. Also note that the admin APIs give you the "current state" of the Power BI deployment and only consider what exists at the time of the request. The report usage metrics report has 90 days of data, and the "total count" represents unique reports viewed over 90 days. If reports are deleted after they are viewed, they are not counted by the admin APIs but will be counted in the historical data feeding the usage report.

### Report usage metrics aren't supported with Private Links 

If your organization is using [Private Links](/fabric/security/security-private-links-overview), report usage metrics will contain no data. There is currently a limitation when transferring client information over private links.

### Other considerations

You need to view the content in your report, from within that workspace, at least once. If there are no views of the content from the workspace itself at least once, data isn't correlated from the application views in the Usage Metrics Report. To unblock the processing of data for this report, just view the content from your workspace at least once.


## Frequently asked questions

In addition to potential differences between usage metrics and audit logs, the following questions and answers about usage metrics may be helpful for users and administrators.

### I can't run usage metrics on a dashboard or report

**A:** You can only see usage metrics for content you own or have permissions to edit.

### Do usage metrics capture views from embedded dashboards and reports?

**A:** Usage metrics currently don't support capturing usage for embedded dashboards, reports, and the [publish to web](service-publish-to-web.md) flow. In those cases, we recommend using existing web analytics platforms to track usage for the hosting app or portal.

### I can't run usage metrics on any content at all.

**A1:** Admins can turn off this feature for their organization.  Contact your admin to see if this is the case.

**A2:** Usage metrics reports are a Power BI Pro feature.

### The data doesn't seem up to date. For example, distribution methods don't show up, report pages are missing, and so on.

**A:** It can take up to 24 hours for data to update.

### There are four reports in the workspace but the usage metrics report only displays three.

**A:** The usage metrics report only includes reports (or dashboards) that have been accessed in the past 90 days.  If a report (or dashboard) doesn't show up, likely it hasn't been used in more than 90 days.

## Related content

- [Administering Power BI in the admin portal](../admin/service-admin-portal.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
