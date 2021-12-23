---
title: Share a filtered Power BI report
description: Learn how to filter a Power BI report and share it with coworkers in your organization.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 12/02/2021
LocalizationGroup: Share your work
---
# Share a filtered Power BI report

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Sharing is a good way to give a few people access to your reports and dashboards. What if you want to share a filtered version of a report? Maybe you want the report to show only data for a specific city or salesperson or year. This article explains how to filter a report and share the filtered version of the report. 

You can share the filtered report in a couple different ways:
* [Link sharing](#share-via-link)
* [Chat in Teams](#share-a-report-in-teams)
* [Direct access sharing](#share-directly)

In both cases, the report is filtered when recipients first open it. They can clear the filter selections in the report. In this example, we're filtering the report page to show only values where **Business Area** equals **Distribution**, **Infrastructure**, or **Manufacturing**.

[![Sharing report with filter](media/service-share-reports/share-report-with-filter.png)](media/service-share-reports/share-report-with-filter-expanded.png#lightbox)

Another way to share a filtered report is to [add query parameters to the report URL](service-url-filters.md). Again, the report is filtered when recipients first open it. They can clear the filter selections in the report.

Power BI also offers [other ways to collaborate and distribute your reports](service-how-to-collaborate-distribute-dashboards-reports.md). With sharing, you and your recipients need a [Power BI Pro license](../fundamentals/service-features-license-type.md), or the content needs to be in a [Premium capacity](../admin/service-premium-what-is.md). 


## Share via link

1. Open a report in [Reading view](../consumer/end-user-reading-view.md) and apply a filter.
1. Select **Share** and make sure **Include my changes** is selected: 

    :::image type="content" source="media/service-share-reports/include-my-changes-setting.png" alt-text="Screenshot of sharing Share via link.":::

## Share a report in Teams

1. Open a report in [Reading view](../consumer/end-user-reading-view.md) and apply a filter.
1. You can access **Chat in Teams** from the action bar: 

    ![Chat in Teams in action bar](media/service-share-reports/power-bi-chat-teams-action-bar.png)

1. For the **Chat in Teams** dialog, you need provide the name of the Team or Channel that you wish to share to, then click **Share**:

    ![Chat in teams](media/service-share-reports/power-bi-share-teams-dialog.png)

## Share directly

If you prefer to share directly to users, you can also share your filtered report through direct access sharing. 

1. Open a report in [Reading view](../consumer/end-user-reading-view.md) and apply a filter.
1. Select **Share** > **More options (...)** > **Manage permissions**: 

    ![Manage permissions filter](media/service-share-reports/manage-permissions-filter.png)

1. Select the plus icon (+) to **Grant people access**:

    ![grant people access](media/service-share-reports/grant-people-access.png)

1. In the **Grant people access** dialog, make sure the **Include my changes** option is selected so that filters are included when you share the report with others.

    ![include my changes](media/service-share-reports/include-my-changes.png)

    The **Include my changes** setting includes any changes to the following:
    - Filters (filter pane or URL filters)
    - Slicers
    - Personalize visuals
    - Cross-filtering or cross-highlighting
    - Drill down or drill up
    - Applied bookmark
    - Spotlight

## Manage the shared view

After you've shared the filtered report, you can also manage the shared view. 

1. To navigate to the management page, select **Advanced** in the footer of the **Manage Permissions** pane:

    ![Advanced in the Manage Permissions pane.](media/service-share-reports/advanced-direct-access.png)

1. Select **Shared views** in the **Related content** section: 

    ![Shared views.](media/service-share-reports/power-bi-shared-view.png)

    Here you can see any shared views for the report and when those views were created and when they expire. 

1. To copy the link to the view, right-click the URL you want, and select **Copy link**.

    ![Copy shared view.](media/service-share-reports/power-bi-copy-shared-view.png)

When you share this link, recipients with access to the report will see your filtered report.

## Considerations and limitations
Things to keep in mind about sharing reports:

* When you share a dataset by managing permissions, by sharing reports or dashboards, or by publishing an app, you're granting access to the entire dataset unless [row-level security (RLS)](../admin/service-admin-rls.md) limits access. Report authors may use capabilities that customize user experiences when viewing or interacting with reports, for example hiding columns, limiting the actions on visuals, and others. These customized user experiences don't restrict what data users can access in the dataset. Use [row-level security (RLS)](../admin/service-admin-rls.md) in the dataset so that each person's credentials determine which data they can access.
* The shared report view will automatically expire after 180 days.

## Next steps
* [Ways to share your work in Power BI](service-how-to-collaborate-distribute-dashboards-reports.md)
* [Share a report or dashboard](service-share-dashboards.md)
* More questions? [Try the Power BI Community](https://community.powerbi.com/).
* Have feedback? Go to the [Power BI Community site](https://community.powerbi.com/) with your suggestions.
