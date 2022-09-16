---
title: Download a report from the Power BI service to Power BI Desktop
description: Download a report from the Power BI service to a Power BI Desktop file
author: maggiesMSFT
ms.author: maggies
ms.reviewer: jterh
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 09/08/2022
LocalizationGroup: Reports
---
# Download a report from the Power BI service to Power BI Desktop

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI Desktop, you can publish a report from your local computer to the Power BI service. Power BI reports can go the other direction as well. This article explains how to download a report or a dataset from the Power BI service to Power BI Desktop. The extension for a Power BI file, in either case, is *.pbix*.

:::image type="content" source="media/service-export-to-pbix/power-bi-file-export.png" alt-text="A screenshot of the file menu in the Power B I service, with the 'Download a P B I X file' option highlighted.":::

There are two ways to download a .pbix file, each with different results and considerations:
- Download a [report as a .pbix file](#download-a-report-as-a-pbix-file). Depending on the configuration, this file might include a dataset.
- Download a [.pbix file from a dataset](#download-a-pbix-file-from-a-dataset).

## Prerequisites

* To download a .pbix file, you at least must be a Contributor to the workspace.

## Download a report as a .pbix file

To download a report as a .pbix file, follow these steps:

1. In the Power BI service, open the report you want to download. You can download the report in Reading view or Editing view.

2. From the top menu bar, select **File** > **Download this file**.

    If this option isn't shown or is disabled, you're likely trying to download a .pbix in a scenario listed under [Limitations](#limitations) later in this article.

3. A dialog will be shown that allows you to choose what type of download you prefer. You can choose between downloading the report including the data or the report with a live connection to the data. See [Modes](#download-modes) for more information. Please pick the mode you prefer and select **Download** to start the download process.

:::image type="content" source="media/service-export-to-pbix/power-bi-export-to-pbix-download-options.png" alt-text="A screenshot of the dialog that provides the choice to download the report including the data or the report with a live connection to the data.":::

4. While the report is downloading, a status banner displays the progress. The default name of the file matches the title of the report.

5. If you haven't already, [install Power BI Desktop](../fundamentals/desktop-get-the-desktop.md), and open the .pbix file in Power BI Desktop.

### Download modes
For downloading a report .pbix file, two **modes** are available:

- **report and data**. This mode is shown in the dialog as: *a copy of the report and data*. Choosing this mode will result in a .pbix being downloaded that includes both the report you are downloading as well as the data on which the report is based.
- **live connected report**. This option is shown in the dialog as: *a copy of the report with a live connection to the data online*. Choosing this mode will result in a .pbix being download that contains the report you are downloading, but no data. Instead, the .pbix will have a live connection to the dataset in the Power BI service. This is especially useful in situations in which Power BI Desktop would be unable to open the .pbix file if the data was included, such as for reports based on a dataset that is configured for [large models](../enterprise/service-premium-large-models.md), [incremental refresh](../connect-data/incremental-refresh-configure.md), or has been modified by using the [XMLA endpoint](../enterprise/service-premium-connect-tools.md).

Note that not all modes are available in all scenarios. If a mode is not available to you, a tooltip is provided that explains why. For example, here's the dialog that will be shown if you download a report that is based on a dataset that is configured for incremental refresh:

:::image type="content" source="media/service-export-to-pbix/power-bi-export-to-pbix-download-options-first-disabled.png" alt-text="A screenshot of the dialog for reports that are based on a dataset that is configured for incremental refresh. The first option is disabled and a tooltip is shown explaining that option is not available because the dataset is configured for incremental refresh.":::

Please see the [Limitations](#limitations) section for more details on what mode is available in what scenario.

## Download a .pbix file from a dataset

To download a dataset as a .pbix file, follow these steps:

1. In the Power BI service, open the workspace content view: 

    :::image type="content" source="../collaborate-share/media/service-new-workspaces/power-bi-workspace-opportunity.png" alt-text="A screenshot of the Power BI workspace content view.":::

1. Find the dataset you want to export and select the **More options** button:

    :::image type="content" source="media/service-export-to-pbix/powerbi-export-to-pbix-dataset-more-options.png" alt-text="A screenshot of the Power BI workspace content view with 'More options' button highlighted on a dataset.":::

1. In the menu, select **Download this file**, if it's available:

    :::image type="content" source="media/service-export-to-pbix/powerbi-export-to-pbix-dataset-more-options-download-pbix.png" alt-text="A screenshot of the Power BI workspace 'More options' menu on a dataset with 'Download the .pbix' option highlighted.":::

    If this option isn't shown, you are likely trying to download a .pbix in a scenario listed under [Limitations](#limitations) later in this article.

1. While the report is downloading, a status banner displays the progress. The default name of the file matches the title of the report.

1. If you haven't already, [install Power BI Desktop](../fundamentals/desktop-get-the-desktop.md), and open the .pbix file in Power BI Desktop.

## Considerations

* Always use the latest version of Power BI Desktop when you open downloaded files. Downloaded .pbix files might not open in non-current versions of Power BI Desktop. For example, you can't open downloaded .pbix files using a Power BI Desktop version that doesn't support information protection.
* If your administrator has turned off the ability to download data, this feature won't be visible in the Power BI service.
* If you download the same .pbix file multiple times, the SecurityBindings file section in the .pbix file changes each time. This is by design.

## Limitations

This section lists the limitations of downloading a .pbix file. This section is split into two parts:
- Limitations when [downloading a .pbix file from a report](#limitations-when-downloading-a-report-pbix-file).
- Limitations when [downloading a .pbix file from a dataset](#limitations-when-downloading-a-dataset-pbix-file).


### Limitations when downloading a report .pbix file

* You can download a file in either Reading view or [Editing view](./service-interact-with-a-report-in-editing-view.md). You must be at least a Contributor to the workspace that the report is in. If the report is based on a dataset in another workspace, you need to be at least a Contributor to that workspace as well.
* If you create a [report using the **Create** button](service-quick-create-report.md) in the Power BI service, and it's based on a dataset in another workspace, you can't download it.
* Reports created in Power BI Desktop must have been *published* or *uploaded* to the Power BI service before you can download them.
* If you create a report in the Power BI service, you have to save it before you can download it.
* You can't download reports based on datasets that are imported from OneDrive for Business.
* You can't download reports based on local [Excel](../connect-data/service-excel-workbook-files.md) or [CSV](../connect-data/service-comma-separated-value-files.md) files that were uploaded to Power BI.
* The report you're downloading must be published or updated after November 23, 2016. Reports published earlier aren't downloadable.
* You can't download the eight original built-in sample .pbix files from the Power BI service. However, you can [download those same .pbix files](sample-datasets.md#download-original-sample-power-bi-files) from the Power BI samples article.
* Usage metric reports can only be downloadeded in [live connected report mode](#download-modes).
* You can only download the original report. You can't download a copy of a report.
* If you download a live connection report (connected to [SSAS](../connect-data/desktop-analysis-services-tabular-data.md) or [AAS](/azure/analysis-services/analysis-services-connect-pbi)) after you change its data source by using REST APIs [Update Datasources](/rest/api/power-bi/datasets/update-datasources) or [Update Datasources In Group](/rest/api/power-bi/datasets/update-datasources-in-group), the downloaded .pbix will still contain the old data source.
* Reports created in the Power BI service that are based on a single dataset that is configured for [large models](../enterprise/service-premium-large-models.md), [incremental refresh](../connect-data/incremental-refresh-configure.md), or has been modified by using the [XMLA endpoint](../enterprise/service-premium-connect-tools.md) can only be downloaded in [live connected report mode](#download-modes).
* If you create a Power BI report based on a dataset in one workspace and publish the report to a different workspace, you can download the report in [live connected report mode](#download-modes) only, if the dataset is configured for [large models](../enterprise/service-premium-large-models.md), [incremental refresh](../connect-data/incremental-refresh-configure.md), or has been modified by using the [XMLA endpoint](../enterprise/service-premium-connect-tools.md).
* Downloading a .pbix file after deployment isn't supported as part of the [deployment pipeline (ALM)](deployment-pipelines-process.md#considerations-and-limitations).
* .pbix file that are larger than 1 GB can only be downloaded in [live connected report mode](#download-modes).
* Reports created in the Power BI service that are based on a dataset in **My Workspace** cannot be downloaded in [live connected report mode](#download-modes).

### Limitations when downloading a dataset .pbix file

* To download the .pbix file, you must be at least a Contributor to the workspace.
* Datasets with [incremental refresh](../connect-data/incremental-refresh-configure.md) can't be downloaded to a .pbix file.
* Datasets enabled for [large models](../enterprise/service-premium-large-models.md) can't be downloaded to a .pbix file.
* Downloading a .pbix file after deployment isn't supported as part of the [deployment pipeline (ALM)](deployment-pipelines-process.md#considerations-and-limitations).
* Datasets modified by using the [XMLA endpoint](../enterprise/service-premium-connect-tools.md) can't be downloaded to a .pbix file.
* You can't download datasets based on data imported from OneDrive for Business.
* Downloading a .pbix file that is larger than 1 GB isn't supported.
* Datasets with [automatic aggregations](../enterprise/aggregations-auto.md#considerations-and-limitations) enabled can't be downloaded to a .pbix file. You must disable automatic aggregations training in the dataset settings and delete the aggregations tables by selecting the checkbox Delete automatic aggregations tables.

## Parity between Power BI Desktop and the service

When you open a .pbix file in Power BI Desktop, you may see a warning message that some features available in the Power BI service aren't available in Power BI Desktop. 

![A screenshot of a Power B I desktop Warning dialog box titled: Report layout differences might exist.](media/service-export-to-pbix/power-bi-export-to-pbix_2.png)

If you need to see the latest version that you worked on in the Power BI service (app.powerbi.com), you need to view the report there.

## Working offline

Say you're working in Power BI Desktop without an internet connection and you open a report with an [AppSource Power BI visual](./../developer/visuals/power-bi-custom-visuals.md#appsource-power-bi-visuals). If you hadn't previously saved the report while Power BI Desktop was online, the visual won't render. To fix this problem, follow these steps:

1. Make sure you're working online.

2. Open the report in Power BI Desktop. If your connection was reestablished after you opened the report, close the report and reopen it.

3. Save the report. After you've saved the report, you can open it again without an internet connection, and the Power BI visual will work.

## Next steps

> [!div class="nextstepaction"]
> [Reports in Power BI](../consumer/end-user-reports.md)

> [!div class="nextstepaction"]
> [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

> [!div class="nextstepaction"]
> [Getting Started with Power BI Desktop](../fundamentals/desktop-getting-started.md)
