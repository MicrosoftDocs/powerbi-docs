---
title: 'Change settings for Power BI reports'
description: Change settings for reports in the Power BI service
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/14/2020
LocalizationGroup: Reports
---
# Change settings for Power BI reports

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

With the report settings in Power BI Desktop and the Power BI service, you can control how report readers interact with your report. For example, you can allow them to save filters for the report, personalize the visuals in the report, or display the report pages as tabs across the bottom of the report instead of along the side.

:::image type="content" source="media/power-bi-report-settings/service-report-settings-pane.png" alt-text="Screenshot of the report Settings pane in the Power BI service.":::

It might be helpful to read these articles first:

- [Create a report in the Power BI service by importing a dataset](service-report-create-new.md), to understand the report creation experience.
- [Reports in Power BI](../consumer/end-user-reports.md), to understand your report readers' experience.

 Let's get started!

## Prerequisites

- For creating reports using Power BI Desktop, see [Desktop report view](desktop-report-view.md).
- [Sign up for the Power BI service](../fundamentals/service-self-service-signup-for-power-bi.md). 
- You need to have edit permission for the report in the Power BI service. See [Roles in the new workspaces](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) for details on permission.
- If you don't already have a report in the Power BI service, you can [install a sample](sample-datasets.md#install-built-in-samples) containing a dashboard, report, and dataset.

## Open the Settings pane in Power BI Desktop

1. Select **File** > **Options and settings** > **Options**.
1. Under **Current file**, select **Report settings**.

    :::image type="content" source="media/power-bi-report-settings/desktop-report-settings-pane.png" alt-text="Screenshot of report Settings pane in Power BI Desktop":::

    The rest of this article calls out some of the specific report settings.

## Open the Settings pane in the Power BI service

1. In report Reading view, select **File** > **Settings**.

    :::image type="content" source="media/power-bi-report-settings/service-report-file-settings.png" alt-text="Screenshot of File menu to Settings.":::

1. In the **Settings** pane, you see a number of toggles you can set, just for this report. The rest of this article calls out some of them.

## Set featured content

You can feature dashboards, reports, and apps so they appear in the Featured section of your colleagues' Power BI Home page. Read more about [how to feature content](../collaborate-share/service-featured-content.md).

## Set the Pages pane

Currently you can only change the Pages pane setting in the Power BI service. When you toggle **Pages pane** on, report readers see the report page tabs along the bottom of the report in Reading view, instead of along the side. In Edit view, the report page tabs are already along the bottom of the report.

:::image type="content" source="media/power-bi-report-settings/report-settings-pages-pane.png" alt-text="Screenshot of setting the Pages pane.":::

## Control filters

The report **Settings** pane has three settings for controlling reader interactions with the filters on your report. The following links go to the [Format the filters in Power BI reports](power-bi-report-filter.md) article for details on each setting.

- **Persistent filters** allow readers to [save filters on the report](power-bi-report-filter.md#allow-saving-filters).
- **Filtering experience** has two more settings:
    
    Allow report readers to [change filter types](power-bi-report-filter.md#restrict-changes-to-filter-type).

    Enable [search in the filter pane](power-bi-report-filter.md#filters-pane-search).

## Export data

By default, [report readers can export summarized or underlying data](../consumer/end-user-export.md) from visuals in your report. With **Export data**, you can allow them to export only summarized data, or to export no data at all from your report.

## Personalize visuals

Allow your readers to change and personalize the visuals in your report. Read more about [letting report readers personalize visuals](power-bi-personalize-visuals.md).

## Next steps

* [Feature content on others' Home pages](../collaborate-share/service-featured-content.md)
* [Let report readers personalize visuals in a report](power-bi-personalize-visuals.md)
* More questions? [Try the Power BI Community](https://community.powerbi.com/)
