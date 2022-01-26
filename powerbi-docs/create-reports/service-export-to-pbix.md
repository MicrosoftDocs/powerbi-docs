---
title: Download a report from the Power BI service to Power BI Desktop
description: Download a report from the Power BI service to a Power BI Desktop file
author: maggiesMSFT
ms.author: maggies
ms.reviewer: jterh
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/26/2022
LocalizationGroup: Reports
---
# Download a report from the Power BI service to Power BI Desktop

In Power BI Desktop, you can publish a report from your local computer to the Power BI service. Power BI reports can go the other direction as well. This article explains how to download a report or a dataset from the Power BI service to Power BI Desktop. The extension for a Power BI file, in either case, is *.pbix*.

:::image type="content" source="media/service-export-to-pbix/power-bi-file-export.png" alt-text="A screenshot of the file menu in the Power B I service, with the 'Download a P B I X file' option highlighted.":::

There are two ways to download a .pbix file, each with different results and considerations:
- Downloading a [report as a .pbix file](#download-a-report-as-a-pbix-file). Depending on the configuration, this file might include a dataset.
- Downloading a [.pbix file from a dataset](#download-a-pbix-file-from-a-dataset).

## Download a report as a .pbix file

To download a report as a .pbix file, follow these steps:

1. In the Power BI service, open the report you want to download. 

    >[!NOTE]
    >You can download the report in Reading view or Editing view. The image in this procedure is in Editing view.

2. From the top menu bar, select **File** > **Download report (Preview)**.

   :::image type="content" source="media/service-export-to-pbix/power-bi-file-export-editing.png" alt-text="A screenshot of the File menu in the Power B I service, with the Download report option highlighted.":::

    If this option isn't shown or is disabled, you're likely trying to download a .pbix in a scenario listed under [Limitations](#limitations) later in this article.

3. While the report is downloading, a status banner displays the progress. The default name of the file matches the title of the report.

4. If you haven't already, [install Power BI Desktop](../fundamentals/desktop-get-the-desktop.md), and open the .pbix file in Power BI Desktop.

## Download a .pbix file from a dataset

To download a dataset as a .pbix file, follow these steps:

1. In the Power BI service, open the workspace content view: 

    :::image type="content" source="../collaborate-share/media/service-new-workspaces/power-bi-workspace-opportunity.png" alt-text="Power BI workspace content view.":::

1. Find the dataset you want to export and select the **More options** button:

    :::image type="content" source="media/service-export-to-pbix/powerbi-export-to-pbix-dataset-more-options.png" alt-text="Power BI workspace content view with 'More options' button highlighted on a dataset.":::

1. In the menu, select **Download the .pbix**, if it's available:

    :::image type="content" source="media/service-export-to-pbix/powerbi-export-to-pbix-dataset-more-options-download-pbix.png" alt-text="Power BI workspace 'More options' menu on a dataset with 'Download the .pbix' option highlighted.":::

    If this option isn't shown, you are likely trying to download a .pbix in a scenario listed under [Limitations](#limitations) later in this article.

1. While the report is downloading, a status banner displays the progress. The default name of the file matches the title of the report.

1. If you haven't already, [install Power BI Desktop](../fundamentals/desktop-get-the-desktop.md), and open the .pbix file in Power BI Desktop.

## Considerations

* Always use the latest version of Power BI Desktop when you open downloaded files. Downloaded .pbix files might not open in non-current versions of Power BI Desktop. For example, you can't open downloaded .pbix files using a Power BI Desktop version that doesn't support information protection.
* If your administrator has turned off the ability to download data, this feature won't be visible in the Power BI service.
* If you download the same .pbix file multiple times, the SecurityBindings file section in the .pbix file changes each time. This is by design.

## Limitations

This section lists the limitations of downloading a .pbix file. This section is split into two parts:
- Limitations when [downloading a .pbix file from a report](#limitations-downloading-a-pbix-from-a-report).
- Limitations when [downloading a .pbix file from a dataset](#limitations-downloading-a-pbix-from-a-dataset).

### Limitations downloading a .pbix from a report

* You can download a file in either Reading view or [Editing view](./service-interact-with-a-report-in-editing-view.md), but you must have edit access to the report.
* The report must have been created using Power BI Desktop and *published* or *uploaded* to the Power BI service.
* Reports created in the Power BI service must be saved before they can be downloaded.
* The report you're downloading must be published or updated after November 23, 2016. Reports published earlier aren't downloadable.
* You can't download reports and the built-in downloadable samples originally created in the Power BI service, unless the report was created through the [quick create experience](./service-quick-create-report.md).
* Usage metric reports can't be downloaded to a .pbix file.
* You can only download the original report. You can't download a copy of a report.
* If you download a live connection report (connected to [SSAS](../connect-data/desktop-analysis-services-tabular-data.md) or [AAS](/azure/analysis-services/analysis-services-connect-pbi)) after you change its data source by using REST APIs [Update Datasources](/rest/api/power-bi/datasets/update-datasources) or [Update Datasources In Group](/rest/api/power-bi/datasets/update-datasources-in-group), the downloaded .pbix will still contain the old data source.
* You can't download reports created in the Power BI service that are based on a single dataset that is configured for [large models](../admin/service-premium-large-models.md), [incremental refresh](../connect-data/incremental-refresh-configure.md), or has been modified by using the [XMLA endpoint](../admin/service-premium-connect-tools.md).
* If you create a Power BI report based on a dataset in one workspace and publish the report to a different workspace, you can't download it.

### Limitations downloading a .pbix from a dataset

* To download the .pbix file, you need Edit access to the report and dataset.
* Datasets with [incremental refresh](../connect-data/incremental-refresh-configure.md) can't be downloaded to a .pbix file.
* Datasets enabled for [large models](../admin/service-premium-large-models.md) can't be downloaded to a .pbix file.
* Downloading a .pbix file after deployment isn't supported as part of the [deployment pipeline (ALM)](./deployment-pipelines-process.md#considerations-and-limitations).
* Datasets modified by using the [XMLA endpoint](../admin/service-premium-connect-tools.md) can't be downloaded to a .pbix file.
* Downloading a .pbix file that is larger than 1 GB isn't supported.

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
