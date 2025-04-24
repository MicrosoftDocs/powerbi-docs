---
title: COVID-19 tracking sample for US state and local governments
description: Learn how to download and modify the sample report with US state and local data for the COVID-19 pandemic.
author: kfollis
ms.author: kfollis
ms.reviewer: kfollis
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/10/2023
LocalizationGroup: Samples
---
# COVID-19 tracking sample for US state and local governments

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The Power BI team has created a COVID-19 tracking sample that enables US state and local governments to publish or customize an interactive report about COVID-19. The Power BI file contains the data model and interactive graphics in a Power BI template (.pbit) file format you can edit in Power BI Desktop. When you open it in Power BI Desktop, you can analyze and visualize COVID-19 data to keep your community informed at the city, county, state, and national/regional levels. A typical customization is to filter the report to a specific state, and then to create your own publish-to-web embed code to share the report publicly and inform citizens. The article offers different options for using Power BI interactive visualizations in your own public story, blog, or website.

:::image type="content" source="media/sample-covid-19-us/covid-19-us-tracking-sample.png" alt-text="Screenshot showing COVID-19 sample with US data." lightbox="media/sample-covid-19-us/covid-19-us-tracking-sample.png":::

This article covers how to:

- Make customizations such as formatting a specific state.
- Publish to the Power BI service.
- Publish to the web.
- Mash up this data with data from another source.

## Prerequisites

Before you can get started using Power BI to tell your story, you need these prerequisites:

- Download the free [Power BI Desktop](https://powerbi.microsoft.com/desktop/) app.
- Sign up for the [Power BI service](https://powerbi.microsoft.com/get-started/).

COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University is provided under a Creative Commons License that requires attribution. Before publishing this data, review the [disclaimers](#disclaimers).

## Download the Power BI template (.pbit) file

To get started, select this link to [download the Power BI template (.pbit) file](https://go.microsoft.com/fwlink/?linkid=2125058). Power BI report template files contain this information from the report from which they were generated:

- Report pages, visuals, and other visual elements.
- The data model definition, including the schema, relationships, measures, and other model definition items.
- All query definitions, such as queries, query parameters, and other query elements.
- Template files *don't* include the report data, so they're often smaller than Power BI report (.pbix) files.

When you open a template (.pbit) file and save it, Power BI saves it as a report (.pbix) file. From then on, it's like any other Power BI report file. For more information about Power BI template files, see [Using report templates](desktop-templates.md#using-report-templates).

## Update your report

1. Download the latest version of the free app, [Power BI Desktop](https://powerbi.microsoft.com/desktop/), if you haven't already.

1. Download the [Power BI template (.pbit) file](https://go.microsoft.com/fwlink/?linkid=2125058), if you haven't already, and open it in Power BI Desktop.

1. When the report opens, you're prompted to set the **Start Date** parameter value. Then select **Load** to refresh the data. The earliest data is from 3/22/2020.

    :::image type="content" source="media/sample-covid-19-us/covid-19-us-tracking-parameter.png" alt-text="Screenshot showing setting the Start Data parameter.":::

1. To filter your report to a specific state, select the arrow to expand the Filters pane.

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-filters-pane.png" alt-text="Screenshot showing how to Expand the Filters pane.":::

1. Select a state that you're interested in.

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-filter-selection.png" alt-text="Screenshot showing how to Select a state.":::

1. To save your file, select **File** > **Save**.

## Refresh your report

1. Select the **Refresh** button.

    :::image type="content" source="media/sample-covid-19-us/power-bi-desktop-refresh-button.png" alt-text="Screenshot showing the Refresh button.":::

1. Select **Anonymous** > **Connect**.

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-azure-blob.png" alt-text="Screenshot showing how to Select Anonymous.":::

1. Select **Ignore Privacy Levels**, if shown > **Save**.

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-privacy-levels.png" alt-text="Screenshot showing how to Select privacy levels.":::

## Publish your report to the Power BI service

Once you've customized your report to your liking, [follow the steps outlined here to publish your report](../create-reports/desktop-upload-desktop-files.md) to the Power BI service.

## Configure scheduled refresh

To keep the data in the report up to date, you can [configure scheduled refresh](../connect-data/refresh-scheduled-refresh.md) after you publish your report.

When you follow the steps, choose the following options:

1. Data Source Credentials Authentication Method: Anonymous
1. Privacy level setting for this data source: Public

To test your refresh setting, select the [Refresh now](../connect-data/refresh-data.md#data-refresh) option, available from the semantic model item.

The refreshed data is loaded each time the schedule runs. The underlying data is provided by Center for Systems Science and Engineering (CSSE) at Johns Hopkins University and may not update as frequently as your refresh schedule. Check the [COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University website](https://github.com/CSSEGISandData/COVID-19) to know when the underlying data was last updated.

If you intend to publish the customized report on your website, it's best to configure your scheduled refresh to run at least as frequently as the COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University updates. Since the COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University may refresh their data at different times each day, you may want to configure several refreshes each day.

## Create a publish-to-web embed code

To embed your customized report in your own website, follow the instructions for how to [create your own publish-to-web embed code](../collaborate-share/service-publish-to-web.md#create-embed-codes-with-publish-to-web).

After you publish your embed code, use the iFrame on the confirmation dialog to embed in your website.

If you make changes to the report in Power BI Desktop, you can publish and replace the existing report in the Power BI service. The embed code doesn't change. It takes approximately an hour for changes to the report or refreshed data to appear on your website.

## About the data source for this report

This interactive report aggregates data from the Centers for Disease Control and Prevention (CDC), and state- and local-level public health agencies. County-level data is confirmed by referencing state and local agencies directly (link).

The COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University is licensed under the Creative Commons Attribution 4.0 International (CC BY 4.0) by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering. Copyright Johns Hopkins University 2020. Here are the full [Terms of Use](https://github.com/CSSEGISandData/COVID-19/blob/master/README.md). More information is available from the [Johns Hopkins University website](https://coronavirus.jhu.edu/map-faq.html).

## Disclaimers

This report and data are provided "as is", "with all faults", and without warranty of any kind. Microsoft gives no express warranties or guarantees and expressly disclaims all implied warranties, including merchantability, fitness for a particular purpose, and non-infringement.

## Related content

- Download the [Power BI template (.pbit) file](https://go.microsoft.com/fwlink/?linkid=2125058)
- [Get samples for Power BI](../create-reports/sample-datasets.md)
