---
title: Monitor usage metrics in workspaces (preview)
description: How to view, save, and use usage metrics for Power BI dashboards and reports in workspaces. 
author: kfollis
ms.author: kfollis
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 01/14/2025
LocalizationGroup: Dashboards
---

# Monitor usage metrics in the workspaces (preview)

Knowing how your content is being used helps you demonstrate your impact and prioritize your efforts. Your usage metrics may show that one of your reports is used daily by a huge segment of the organization. It may show that nobody is viewing a dashboard you created at all. This type of feedback is invaluable in guiding your work efforts.

If you create reports in workspaces, you have access to improved usage metrics reports. They enable you to discover who's using those reports throughout your organization, and how they're using them. You can also identify high-level performance issues. The improved usage reports for shared workspaces replace the usage metrics reports documented in [Monitor report usage metrics](service-usage-metrics.md).

:::image type="content" source="media/service-modern-usage-metrics/power-bi-modern-usage-metrics.png" alt-text="Screenshot of the new Usage Metrics report." lightbox="media/service-modern-usage-metrics/power-bi-modern-usage-metrics.png":::

> [!NOTE]
> You can only run usage metrics reports in the Power BI service. However, if you save a usage metrics report or pin it to a dashboard, you can open and interact with that report on mobile devices.

## Prerequisites

- You need a Power BI Pro or Premium Per User (PPU) license to run and access the usage metrics data. However, the usage metrics feature captures usage information from all users, regardless of the license they're assigned.
- To access usage metrics for a report, you must have edit access to the report.
- Your Power BI admin must have enabled usage metrics for content creators. Your Power BI admin may have also enabled collecting per-user data in usage metrics. Read about how to [enable these options in the admin portal](/fabric/admin/service-admin-portal-audit-usage).

## Create and view a new usage metrics report

Only users with admin, member, or contributor permissions can view the usage metrics report. Viewer permissions aren't enough. If you're at least a contributor in a workspace in which your report resides, you can use the following procedure to display the usage metrics:

1. Open the workspace that contains the report for which you want to analyze the usage metrics.
2. From the workspace content list, select **More options (...)** for the report and select **View usage metrics report**.

    ![Screenshot of steps to view Usage Metrics.](media/service-modern-usage-metrics/power-bi-modern-view-usage-metrics.png)

    Or open the report, then on the command bar, select **More options (...)** > **Open usage metrics**.

    :::image type="content" source="media/service-modern-usage-metrics/service-more-options-open-usage-metrics.png" alt-text="Screenshot of selecting More options, Open usage metrics.":::

1. The first time you do this, Power BI creates the usage metrics report and lets you know when it's ready.

    ![Screenshot of Usage Metrics report being ready.](media/service-modern-usage-metrics/power-bi-modern-usage-metrics-ready.png)

1. To see the results, select **View usage metrics**.
2. If this is the first time you've viewed a usage metrics report, Power BI might open the old usage metrics report. To display the improved usage metrics report, in the upper right corner, toggle the **New usage report** switch to **On**.

    ![Screenshot of switching to the Usage Metrics report.](media/service-modern-usage-metrics/toggle-new-usage-report-on.png)

## About the new usage metrics report

When you display the usage metrics report, Power BI generates a pre-built report. It contains usage metrics for that content for the last 30 days. The report looks similar to the Power BI reports you're already familiar with. You can slice based on how your end users received access, whether they accessed via the web or mobile app, and so on. As your reports evolve, so too will the usage metrics report. It updates every day with new data.

> [!NOTE]
> Usage metrics reports don't show up in Recent, Workspaces, Favorites, or other content lists. They can't be added to an app. If you pin a tile from a usage metrics report to a dashboard, you can't add that dashboard to an app.

### Usage metrics report semantic model

When you first launch the usage metrics report, Power BI automatically creates a Usage Metrics Report semantic model. The usage metrics report relies on that semantic model. Power BI then refreshes this semantic model daily. Although you can't change the refresh schedule, you can update the credentials that Power BI uses to refresh the usage metrics data.

You may need to resume scheduled refresh if one of the following occurs:

- The credentials expire.
- You removed the user who first launched the usage metrics report from the workspace where the semantic model resides.
- The user who first launched the usage metrics report leaves or is no longer a part of the organization.

> [!NOTE]
> While still in preview, the usage metrics semantic model may have minor changes which affect custom reports.  

### Usage metrics report pages

The improved usage metrics report includes the following report pages:

- **Report usage**    Provides information about report views and report viewers, such as how many users viewed the report by date.
- **Report performance**    Shows the typical report opening times broken down by consumption method and browser types.
- **FAQ**     Provides answers to frequently asked questions, such as What is a "Viewer" and what is a "View"?

### Which metrics are reported?

| **Page** | **Metric** | **Description** |
| --- | --- | --- |
| Report usage | Report views/Report opens | A Report View is recorded each time someone opens a report and represents unique landings on the report. It answers the question, "How often is the report accessed?" This definition of a Report View differs from previous usage metrics reports. Changing report pages is no longer considered an additional Report View. Instead, changing report pages counts for the next metric, Report Page Views. Activities such as sharing and pinning are no longer considered in usage metrics. |
| Report usage | Report Page views | A Report Page View is recorded every time someone views a report page. It represents total views across any pages. It answers the question, "How often are report pages accessed?" So changing report pages counts for Report Page Views. See [Considerations and Limitations](#considerations-and-limitations) for important details. |
| Report usage | Unique viewers | A viewer is someone who opened the report at least once during the time period, based on the Microsoft Entra user account. |
| Report usage | View trend | The view trend reflects view count changes over time. It compares the first half of the selected time period with the second half. |
| Report usage | Date slicer | You can change the time period on the Report usage page, such as to calculate week-over-week or biweekly trends. In the lower left corner of the Report usage page, you can set the earliest and latest date for which usage data is available for the selected report. |
| Report usage | Rank | Based on view count, the rank shows the popularity of a report in comparison to all other reports in the organization. A rank of one would mean the report has the most views of all reports in the organization.   |
| Report usage | Report views per day | Usage is counted at the report level and doesn't consider Report Page Views. |
| Report usage | Report viewers per day | Total number of different users who viewed the report, based on the Microsoft Entra user account. |
| Report usage | Distribution method | How users got access to the report, such as by being members of a workspace, having the report shared with them, or installing an app. |
| Report usage | Platform slicer | If users accessed the report via the Power BI service (powerbi.com), Power BI Embedded, or a mobile device. |
| Report usage | Users with report views | Shows the list of users who opened the report sorted by view count. |
| Report usage | Pages | If the report has more than one page, slice the report by the pages that were viewed. "Blank" means either a report page was added within 24 hours of the new page appearing in the slicer list, or report pages have been deleted. "Blank" captures these types of situations. |
| Report performance | Typical opening time | The typical report opening time corresponds to the 50th percentile of the time it takes to open the report. In other words, it is the time below which 50% of the open-report actions are completed. The Report performance page also breaks down the typical report opening time by consumption method and browser type. At present, we measure the performance for the initial report load and first page viewed. The measurement starts when the report is requested and ends when the last visual completes rendering. Report interactions such as slicing, filtering, or changing pages aren't included in performance metrics.  |
| Report performance | Opening time trend | The opening time trend reflects open-report performance changes over time. It compares the opening times for the report of the first half of the selected time period with the opening times of the second half. |
| Report performance | Date slicer | You can change the time period on the Report performance page, such as to calculate week-over-week or biweekly trends. In the lower left corner of the Report performance page, you can determine the earliest and latest date for which usage data is available for the selected report. |
| Report performance | Daily performance | The performance for 25%, 50%, and 75% of the open report actions calculated for each individual day. |
| Report performance | seven-day performance | The performance for 25%, 50%, and 75% of the open report actions calculated across the past seven days for each date. |
| Report performance | Consumption method | How users opened the report, such as via the Power BI service (powerbi.com), Power BI Embedded, or a mobile device. |
| Report performance | Browsers | What browser the users used to open the report, such as Firefox, Edge, and Chrome. |
| Report list | Active reports | What reports are being used across the workspace. |
| Report list | Total views | Total report opens across the workspace. |
| Report list | Total viewers | Total report viewers across the workspace. |
| Report list | View trend | The view trend reflects view count changes over time. It compares the first half of the selected time period with the second half. |
| Report list | Unused  reports | Count of reports that have not been opened over time. |
| Report list | Report usage (table) | Shows which reports contribute to individual counts shown in cards. Shows report open percentages, users interacting with report, viewing trends and days. |
| Report list | Distribution method | How users got access to the report, such as being members of a workspace, having the report shared with them, or installing an app. |
| Report list | Platform slicer | If the report was accessed via the Power BI service (powerbi.com), Power BI Embedded, or a mobile device. |
| Report list | Unique viewers | A viewer is someone who opened the report at least once during the time period (based on the Microsoft Entra user account). Shows number of report opens by individual viewers. |

### Worked example of View and Viewer metrics

Suppose we have four reports that are accessed by three users as follows:

| **Report Name** | **Usage Pattern** |
| --- | --- |
| KPI Report | <ul><li>User A opens the report on page one. |
| HR Report | <ul><li>User A opens the report on page one, then views page two, page three, and page four. Then they view page one again. |
| Finance Report | <ul><li>User A opens the report on page one, then views page two.</li><li>User B opens the report on page one.</li><li>User C opens the report on page one, then views page three.</li></ul> |
| Sales Report | <ul><li>User A opens the report on page one, then views page two</li><li>User C opens the report on page two (e.g. via bookmark)</li><li>Later in the day, User C opens the report on page one </li></ul> |

Assuming all client telemetry reaches Power BI, the resulting metrics would be:

| **Report Name** | **Report Views** | **Report Page Views** | **Viewers** |
| --- | --- | --- | --- |
| KPI Report | 1 | 1 | 1 |
| HR Report | 1 | 5 | 1 | 
| Finance Report | 3 | 5 | 3 |
| Sales Report | 3 | 4 | 2 |



## Update usage metrics report credentials

If semantic model owners in your workspace leave, are no longer a part of your organization, or if the credentials expire, the semantic models may become stale and refreshes may fail. In such cases, you can use the following procedure to take over a Usage Metrics Report semantic model and update the credentials.  
    
>[!NOTE]
> Updating credentials doesn't apply to My Workspace, because each user owns their own My Workspace, and they never need to transfer ownership of the semantic model. 

1. Open the workspace that contains the report for which you want to update the Usage Metrics Report semantic model.
2. In the gray header bar at the top, select the **Settings** icon, then select **Settings**.

    ![Screenshot of navigating to Settings menu.](media/service-modern-usage-metrics/power-bi-settings-settings.png)

3. Switch to the **Semantic models** tab.

1. Select the Usage Metrics Report semantic model. 

    ![Screenshot of selecting the Usage Metrics semantic model.](media/service-modern-usage-metrics/power-bi-select-usage-metrics.png)
    
    If you aren't the current semantic model owner, you must take over ownership before you can update the data source credentials. 
    
5. Select the **Take over** button, then in the **Take over semantic model settings** dialog box, select **Take over** again.

1. Under **Data source credentials**, select **Edit credentials**.

    ![Screenshot of editing credentials.](media/service-modern-usage-metrics/power-bi-usage-metrics-edit-credentials.png)

2. In the **Configure Usage Metrics Report** dialog box, select **Sign in**.

    ![Screenshot of signing in.](media/service-modern-usage-metrics/power-bi-modern-usage-metrics-configure.png)

1. Complete the sign-in sequence and note the notification that the data source was updated successfully.

    > [!NOTE]
    > The Usage Metrics Report semantic model contains usage data for the last 30 days. It can take up to 24 hours for new usage data to be imported. You can't trigger a manual refresh by using the Power BI user interface.


## Disable usage metrics reports

Usage metrics reports are a feature that the Power BI administrator can turn on or off. Administrators have granular control over which users have access to usage metrics; they're On by default for all users in the organization. See [Audit and usage metrics](/fabric/admin/service-admin-portal-audit-usage) in the Admin portal article for details on these settings.

> [!NOTE]
> Only admins for the Power BI tenant can see the Admin portal and edit settings.

## Exclude user information from usage metrics reports

By default, per-user data is enabled for usage metrics. This means content consumer account information such as user name and email address is included in the usage metrics report. Admins can limit exposure of identifying user information in the Power BI admin portal tenant settings. They can enable per-user data for the entire organization or specified security groups.

> [!NOTE]
> An embed scenario with excluded user information isn't supported. In such cases, usage metrics semantic model refresh will fail.

If user information is excluded, the usage report refers to users as 'Unnamed User _[unique_id]_', where _[unique_id]_ is a meaningless unique identifier assigned to support distinct user count measures.

1. On the **Tenant settings** tab in the admin portal, under **Audit and usage settings**, expand **Per-user data in metrics for content creators** and select **Disabled**. This will hide user account information for all users.

2. Decide whether to **Delete all existing per-user data in current usage metrics content**. Select **Apply**.

    ![Screenshot of disabling per-user metrics.](media/service-modern-usage-metrics/power-bi-admin-disable-per-user-metrics.png)

When admins disable usage metrics for their entire organization, they can use the **Delete all existing usage metrics content** option to delete all existing reports and dashboard tiles that were built using the usage metrics reports. This option removes all access to usage metrics data for all users in the organization who may already be using it. Deleting existing usage metrics content is irreversible.

> [!NOTE]
> Only admins for the Power BI tenant can see the Admin portal and configure the Per-user data in usage metrics for content creators setting.

## Customize the usage metrics report

To dig into the report data, or to build your own reports against the underlying semantic model, you have several options:

- **[Make a copy of the report](#create-a-copy-of-the-usage-report) in the Power BI service.**   Use **Save a copy** to create a separate instance of the usage metrics report, which you can customize to meet your specific needs.
- **[Connect to the semantic model](#create-a-usage-report-in-power-bi-desktop) with a new report.**   For every workspace, the semantic model has the name "Usage Metrics Report," as explained earlier in the section [Usage metrics report semantic model](#usage-metrics-report-semantic-model). You can use Power BI Desktop to build custom usage metrics reports based on the underlying semantic model.
- **[Use Analyze in Excel](#analyze-usage-data-in-excel).**   You can also analyze the Power BI usage data in PivotTables, charts, and slicer features in Microsoft Excel. Read more about the [Analyze in Excel](service-analyze-in-excel.md) feature.

### Create a copy of the usage report

When you create a copy of the read-only, pre-built usage report, Power BI creates an editable instance of the report. At first glance, it looks the same. However, you can now open the report in Editing view, add new visualizations, filters, and pages, modify or delete existing visualizations, and so on. Power BI saves the new report in the current workspace.

1. In the usage metrics report, select the **File** dropdown, then select **Save a copy**.

    ![Screenshot of saving a copy of the report.](media/service-modern-usage-metrics/power-bi-modern-usage-metrics-save.png)

2. In the **Save your report** dialog box, enter a name, then select **Save**.

    Power BI creates an editable Power BI report saved in the current workspace. Select **Go to report** in the **Report saved** dialog box that appears.

3. Select **Edit** to switch into Editing view.

    From here you can change filters, add new pages, build new visualizations, format the fonts and colors, and so on.

1. The new report is saved to the **All** tab and the **Content** tab in the current workspace and added to the **Recent** list.

    ![Screenshot of the new report on the Reports tab.](media/service-modern-usage-metrics/power-bi-modern-usage-metrics-new-report.png)
    
> [!NOTE]
> When you save a copy of the usage metrics report:
> - The report is treated like a regular Power BI report. It will be accessible to all users who have viewing permissions in the workspace, including users in the Viewer role.
> - The report is built on the original semantic model. If there are any changes from Power BI, this may break your copy of the report.

### Filter out pseudo-duplicates 

To remove pseudo-duplicates from the Usage Report, you can add a **Report views** measure to filter them out.

- Under **Model measures**, expand **Views**, and add **Report views** to the **Filters** pane.

  :::image type="content" source="media/service-modern-usage-metrics/report-views-measure.png" alt-text="Screenshot showing adding a Report Views measure.":::
  
### Create a usage report in Power BI Desktop

You can create a usage report in Power BI Desktop, based on the Usage Metrics Report semantic model. To establish a connection to the Usage Metrics Report semantic model and create your own report, you have to be signed in to the Power BI service in Power BI Desktop. 

1. Open Power BI Desktop.

2. If you aren't signed in to the Power BI service, on the **File** menu select **Sign in**.

1. To connect to the Usage Metrics Report semantic model, on the **Home** ribbon select **Get Data** > **More**.

4. In the left pane, select **Power Platform**, then select **Power BI semantic models** > **Connect**.

    ![Screenshot of getting data from Power BI semantic models.](media/service-modern-usage-metrics/power-bi-desktop-get-data.png)

1. Scroll to the desired semantic model or type *Usage Metrics* in the search box. 

6. Verify in the Workspace column that you're selecting the correct semantic model, then select **Create**. 

    ![Screenshot of selecting the Usage Metrics Report semantic model.](media/service-modern-usage-metrics/power-bi-desktop-select-usage-metrics.png)

7. Check the Fields list in Power BI Desktop, which gives you access to the tables, columns, and measures in the selected semantic model.

    ![Screenshot of viewing the Usage Metrics Report fields list.](media/service-modern-usage-metrics/power-bi-desktop-fields-list.png)

1. Now you can create and share custom usage reports, all from the same *Usage Metrics Report* semantic model.

> [!NOTE]
> When you create a usage metrics report, it's built on the original semantic model. If there are any changes from Power BI, this may break your copy of the report.

### Analyze usage data in Excel

When you connect to the usage data in Excel, you can create PivotTables that use the pre-defined measures. Note that Excel PivotTables do not support drag-and-drop aggregation of numeric fields when connecting to a Power BI semantic model.

1. First, if you haven't done so already, [create a copy of the usage metrics report](#create-a-copy-of-the-usage-report). 

2. Open the usage metrics report, select **Export** > **Analyze in Excel**.

    ![Screenshot of analyzing in Excel.](media/service-modern-usage-metrics/power-bi-export-excel.png)

1. If you see the **First, you need some Excel updates** dialog box, select **Download** and install the latest updates for Power BI connectivity. Otherwise, select **I've already installed these updates**.

    ![Screenshot of Excel updates.](media/service-modern-usage-metrics/power-bi-excel-updates.png)

    > [!NOTE]
    > Some organizations may have Group Policy rules that prevent installing the required Analyze in Excel updates to Excel. If you can't install the updates, check with your administrator.

1. In the browser dialog asking what you want to do with the Usage Metrics report.odc file, select **Open**.

    ![Screenshot of opening the .odc file](media/service-modern-usage-metrics/power-bi-open-odc-file.png)

1. Power BI launches Excel. Verify the file name and path for the .odc file, then select **Enable**.

    ![Screenshot of Excel security notice.](media/service-modern-usage-metrics/power-bi-excel-security-notice.png)

1. Now that Excel has opened and you have an empty PivotTable, you can drag fields onto the Rows, Columns, Filters, and Values boxes and create custom views into your usage data.

    ![Screenshot of PivotTable in Excel.](media/service-modern-usage-metrics/power-bi-pivottable-excel.png)

## Usage metrics in national/regional clouds

Power BI is available in separate national/regional clouds. These clouds offer the same levels of security, privacy, compliance, and transparency as the global version of Power BI, combined with a unique model for local regulations on service delivery, data residency, access, and control. Usage metrics are currently available in following national/regional clouds:

- US Government Community Cloud
- US Government Community Cloud High
- US Department of Defense
- China

For more information, see [national/regional clouds](https://powerbi.microsoft.com/clouds/).

## Considerations and limitations

It's important to understand that differences can occur when comparing the improved usage metrics report with its predecessor. Particularly Report View metrics are now based on activity data collected from the Power BI service. Previous versions of the usage metrics report relied only on client telemetry, which doesn't always match usage metrics collected from the service. Moreover, the improved usage metrics report uses a different definition for a "Report View." A Report View is an open-report event, as recorded in the service each time someone opens a report. Changing report pages is no longer considered an additional Report View. We now include a Report Page View metric, which specifically counts every page view.

> [!NOTE]
> Report Page Views rely on client telemetry and can be affected by undercounting and overcounting of activities due to inconsistent network connections, ad blockers, or other client-side issues. Report View metrics relies on activity data collected from Power BI service, and matches the aggregate counts of activities in audit logs and activity logs.

In addition to the above differences between previous and improved usage metrics reports, note the following limitations for the preview release:

- Dashboard usage metrics still rely on the previous version of the usage metrics reports and aren't yet available in modern usage metrics.
- There are fields in the _Report page views_ and _Report load times_ tables that are always blank.
- Pages for App reports can't be seen in the Report pages table.
- Performance data and Report Page View metrics rely on the client/device sending data to Power BI. Depending on network latency, ad blockers, firewalls, and network rules set by your organization, this data may never reach Power BI. Therefore, the performance and Report Page View data may not include all views or all users.
- Certain types of views aren't included in performance measurements. For example, when a user selects a link to a report in an email message, the Report View is accounted for in the report usage but there is no event in the performance metrics.
- Report performance metrics aren't available for Paginated Reports. The Pages tab on the Report usage page as well as the charts on the Report performance page don't show data for these types of reports.
- User masking isn't working as expected when using nested groups. Nested groups (subgroups) are groups that are members of existing groups. If your organization has disabled Per-user data in usage metrics for content creators in the Power BI admin portal tenant settings, only the members on the top level are being masked. Members of subgroups are still visible.
- If you're using user masking in an embed scenario in your report, the usage metrics semantic model refresh will fail.
- Initializing the Usage Metrics Report semantic model might take a few minutes, resulting in showing a blank usage metrics report because the Power BI user interface does not wait for the refresh to finish. Check the refresh history in the Usage Metrics Report semantic model settings to verify that the refresh operation succeeded.
- Initializing the Usage Metrics Report semantic model might fail due to a timeout encountered during refresh. Refer to the [Troubleshooting section](#troubleshoot-refresh-issues) below to resolve this or any general refresh issue.
- Sharing is disabled for the usage metrics report. To give people read access to the report, open the report and use the **Manage permissions** option to grant direct access.
- In some scenarios, you may notice the performance data is missing. This can occur if a user opens a report and interacts with the report before it has completed loading or if an error occurred during the report load. 
- If your organization is using [Azure Private Link](/fabric/security/security-private-links-overview) in Power BI, because client-telemetry is not available the usage metrics reports will only contain Report Open events.
- If your organization is using [Azure Private Link](/fabric/security/security-private-links-overview) and **Block Public Internet Access** in Power BI, the refresh for the semantic model will fail and the usage metrics report won't show any data.
- In order to create and refresh the usage metrics report, the user is required to authenticate to enable the backend API calls to extract the tenant telemetry. For privacy reasons, guest users aren't allowed this authentication. This authentication is only allowed for members of the tenant.
- Duplicate reports with different Report ObjectIds in the usage metrics report can show up for the following scenarios:
    - Reports have been deleted and re-created with the same name
       - If a report has been deleted and then re-created with the same name, it continues to show up in the filters for the usage metrics report.
    - Report is included in an App
       - When a report is included in a Power BI App, it generates a new Report ObjectId for the embedded report with the same name.
    - Semantic model re-initialization
       - Each time a new semantic model is created, a new report could be created.

  > [!NOTE]
  > Both GUID and ObjectsIDs may be used interchangeably. Each Report ObjectId is uniquely represented by a 32 hexadecimal GUID (a globally unique identifier).
- The usage metrics report is not supported in My Workspace.
- During the process of [disaster recovery (while Business continuity and disaster recovery (BCDR)](/azure/cloud-adoption-framework/ready/landing-zone/design-area/management-business-continuity-disaster-recovery) is in progress) any new incoming data experiencing data loss may be irrecoverable.
- Certain metrics in usage metrics report aren't included in audit logs. For example, report page views aren't part of audit logs.
- When a report is deleted, the ReportIds can show up in the usage metrics but not be available in the Reports semantic model.
- Customers may be unable to view or download the usage metrics semantic model from Power BI service.
- To access the user metrics report's semantic model settings and refresh history, follow the steps in [Update usage metrics report credentials](#update-usage-metrics-report-credentials).
- The report views count is influenced by subscriptions running on the reports. When the subscription service captures a snapshot of the report for emails, it triggers a flow that logs a ViewReport event.

## Frequently asked questions

In addition to the above considerations and limitations, the following questions and answers about usage metrics might be helpful for users and administrators.

#### **Why do I see fewer Report Page Views than Report Views, shouldn't they be at least the same?** 
Report Views rely on server telemetry that is generated when the report is first opened. Once a report is open, its page definitions are already loaded onto the user's device. Report Page Views rely on usage information from the user's device reaching Power BI. This can sometimes be blocked, as described in [Considerations and Limitations](#considerations-and-limitations).

#### **I can't run usage metrics on a report.**
You can only see usage metrics for reports you own or have permissions to edit.

#### **What time period is covered by the report?**
The usage report is based on activity data for the last 30 days, excluding activities of the current day. You can narrow the time period by using the Date slicer on the Report usage page, such as to analyze only last week's data.

#### **When will I see the most recent activity data?**
The usage report includes activity data up until the last complete day based on the UTC time zone. The data shown in the report is also dependent on the refresh time for the semantic model. Power BI refreshes the semantic model once per day.

#### **The data doesn't seem up to date.**
Note that it might take up to 24 hours for new activity data to appear in the usage report.

#### **What is the data source for the usage data?**
The Usage Metrics Report semantic model imports data from a Power BI internal usage metrics store by using a custom Usage Metrics Data Connector. You can update the credentials for the Usage Metrics Data Connector on the Usage Metrics Report semantic model settings page.

#### **How can I connect to the data? Or change the default report?**
You can create a copy of the read-only, pre-built usage report. The report copy connects to the same Usage Metrics Report semantic model and enables you to edit the report details.

#### **What is a "Viewer" and what is a "View"?**
A viewer is someone who opened the report at least once during the time period. A view is an open-report event. A report view is recorded each time someone opens a report.
Note that the definition of a view differs from previous usage metrics reports. Changing report pages is no longer considered an additional view.

#### **How is the "View trend" calculated?**
The view trend reflects view count changes over time. It compares the first half of the selected time period with the second half. You can change the time period by using the Date slicer on the Report usage page, such as to calculate week-over-week or biweekly trends.

#### **What do "Distribution" and "Platform" mean?**
Distribution shows how the viewers obtained access to a report: shared directly, through workspace access, or through an app.
The Platform indicates the technology a viewer used to open a report: via PowerBI.com, Mobile, or Embedded.

#### **How does report ranking work?**
Based on view count, the rank shows the popularity of a report in comparison to all other reports in the organization. A rank of 1 would mean the report has the most views of all reports in the organization.

#### **What are "Unnamed Users"?**
Your organization can decide to exclude user information from your usage report. If excluded, the usage report refers to users as Unnamed.

#### **What is the "Typical report opening time"?**
The typical report opening time corresponds to the 50th percentile of the time it takes to open the report. In other words, it is the time below which 50% of the open-report actions are completed. The Report performance page also breaks down the typical report opening time by consumption method, and browser type.

#### **How is the "Opening time trend" calculated?**
The opening time trend reflects open-report performance changes over time. It compares the opening times for the report of the first half of the selected time period with the opening times of the second half. You can change the time period by using the Date slicer on the Report performance page, such as to calculate week-over-week or biweekly trends.

#### **There are four reports in the previous version of the usage metrics report, but the improved version only displays three.**
The improved usage metrics report only includes reports that have been opened in the past 30 days, while the previous version covers the past 90 days. You can update it to cover only the past 30 days, if you want. If a report isn't included in the improved usage metrics report, it likely hasn't been used in more than 30 days.

## Troubleshoot refresh issues

If you suspect data consistency or refresh issues, it might make sense to delete the existing Usage Metrics Report semantic model. Then you can run View Usage Metrics again to generate a new semantic model with its associated usage metrics reports.

> [!NOTE]
> You can create a Power Automate flow to perform a refresh that can force the Report Usage model to reload data. When using this option, some refresh issues may not get resolved. For example, if an older version is in the workspace.

Follow these steps to delete the semantic model and then create a fresh data refresh report.

### Delete the semantic model

1. Open the workspace that contains the report for which you want to reset the Usage Metrics Report semantic model.

2. In the black header bar at the top, select the **Settings** icon, then select **Settings**.

    ![Screenshot of Settings menu.](media/service-modern-usage-metrics/power-bi-settings-settings.png)

3. Switch to the **Semantic models** tab, and select the Usage Metrics Report semantic model. 

    ![Screenshot of the Usage metrics semantic model.](media/service-modern-usage-metrics/power-bi-settings-usage-report-dataset.png)

5. Copy the workspace and semantic model IDs from the URL displayed in the address bar of your browser.

    ![Screenshot of the Usage metrics semantic model URL.](media/service-modern-usage-metrics/power-bi-usage-metrics-url.png)

1. In your browser, go to [Semantic models - Delete Semantic model In Group](/rest/api/power-bi/datasets/deletedatasetingroup), and select the **Try It** button.
    
    ![Screenshot showing Delete semantic model Try it.](media/service-modern-usage-metrics/power-bi-delete-dataset-try-it.png)

    > [!NOTE]
    > This **Try it** button does not apply to GCC customers since their API endpoint is different.

    You can use this API to delete the semantic model. You can use API tools to make an API call on this endpoint to delete the semantic model. 

1. If you don't see a **Try it** button, use the trigger **Scheduled cloud flow**. Select a starting time and run it every hour. Then refresh the semantic model. Let the flow run once, then switch off the flow. Read more about [cloud flows in Power Automate](/power-automate/run-scheduled-tasks).
    
1. Sign in to Power BI, paste the Workspace ID in the **groupId** text box and the semantic model ID into the **datasetId** text box, and then select **Run**.

    ![Screenshot showing Try the REST API.](media/service-modern-usage-metrics/power-bi-rest-api-try-it.png)

1. Under the **Run** button, verify that the service returns a Response Code of **200**. That code indicates that you have successfully deleted the semantic model and its associated usage metrics reports.

    ![Screenshot showing Response code 200.](media/service-modern-usage-metrics/power-bi-response-code-200.png)

### Create a fresh usage metrics report

1. Back in the Power BI service, you see the semantic model is gone.

    ![Screenshot of deleted usage metrics report.](media/service-modern-usage-metrics/power-bi-no-usage-metrics-dataset.png)

2. If you still see the Usage Metrics report in the Reports list, refresh your browser.

3. Start over and [create a fresh usage metrics report](#create-and-view-a-new-usage-metrics-report).

## Related content

- [Administering Power BI in the admin portal](../admin/service-admin-portal.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
