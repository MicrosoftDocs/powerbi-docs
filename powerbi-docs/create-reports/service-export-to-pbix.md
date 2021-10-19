---
title: Download a report from the Power BI service to Power BI Desktop
description: Download a report from the Power BI service to a Power BI Desktop file
author: maggiesMSFT
ms.author: maggies
ms.reviewer: jterh
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/19/2021
LocalizationGroup: Reports
---
# Download a report from the Power BI service to Power BI Desktop

In Power BI Desktop, you can publish a report from your local computer to the Power BI service. Power BI reports can go the other direction as well, you can download a report from the Power BI service to Power BI Desktop. The extension for a Power BI report file, in either case, is PBIX.

:::image type="content" source="media/service-export-to-pbix/power-bi-file-export.png" alt-text="A screenshot of the file menu in the Power B I service, with the download a P B I X file option highlighted.":::

## Requirements

Always use the latest version of Power BI Desktop when you open downloaded files. Downloaded PBIX files might not open in non-current versions of Power BI Desktop. For example, you cannot open downloaded PBIX files using a Power BI Desktop version that does not support information protection.

* You can download a file in either Reading view or [Editing view](./service-interact-with-a-report-in-editing-view.md), but you must have edit access to the report.

* The report must have been created using Power BI Desktop and *published* or *uploaded* to the Power BI service.

* The report you're downloading must be published or updated after November 23, 2016. Reports published earlier aren't downloadable.

## Download the report as a PBIX file

To download the .pbix file, follow these steps:

1. In the Power BI service, open the report you want to download. 

    >[!NOTE]
    >You can download the report in Reading view or Editing view. The image in this procedure is in Editing view.

2. From the top nav pane, select **File** > **Download report (Preview)**.

   :::image type="content" source="media/service-export-to-pbix/power-bi-file-export-editing.png" alt-text="A screenshot of the File menu in the Power B I service, with the Download report option highlighted.":::

3. While the report is downloading, a status banner displays the progress. When the file is ready, you're asked where to save the PBIX file. The default name of the file matches the title of the report.

4. If you haven't already, [install Power BI Desktop](../fundamentals/desktop-get-the-desktop.md), and open the PBIX file in Power BI Desktop.

## Report feature parity

When you open a report in Power BI Desktop, you may see a warning message letting you know that some features available in the Power BI service report aren't available in Power BI Desktop.

![A screenshot of a Power B I desktop Warning dialog box titled: Report layout differences might exist.](media/service-export-to-pbix/power-bi-export-to-pbix_2.png)

## Working offline

When working in Power BI Desktop without an internet connection, if you open a report with an [AppSource Power BI visual](./../developer/visuals/power-bi-custom-visuals.md#appsource-power-bi-visuals) that wasn't previously saved while Power BI Desktop was online, the visual will not render. To fix this problem, follow these steps:

1. Make sure you're working online.

2. Open the report in Power BI Desktop. If you're connection was reestablished after the report was opened, close the report and reopen it.

3. Save the report. After the report is saved, when you open it again without an internet connection, the Power BI visual will work.

## Considerations and limitations

This section lists the limitations of downloading a PBIX file.

* This feature won't work with reports and the built-in downloadable samples originally created in the Power BI service, unless the report was created through the [quick create experience](./service-quick-create-report.md).

* Reports created in the Power BI service must be saved before they can be downloaded.

* If your administrator has turned off the ability to download data, this feature won't be visible in the Power BI service.

* Datasets with incremental refresh can't be downloaded to a PBIX file.

* Datasets enabled for [large models](../admin/service-premium-large-models.md) and the reports created from these datasets can't be downloaded to a PBIX file.

* Downloading a PBIX file after deployment isn't supported as part of the [deployment pipeline (ALM)](./deployment-pipelines-process.md#limitations-1).

* Usage metric reports can't be downloaded to a PBIX file.

* Datasets modified by using the [XMLA endpoint](../admin/service-premium-connect-tools.md) can't be downloaded to a PBIX file.

* If you create a Power BI report based on a dataset in one workspace and publish to a different workspace, you and your users won't be able to download it. The download feature is not supported in this scenario.

* You can only download the original report. You can't download a copy of a report.

## Next steps

> [!div class="nextstepaction"]
> [Reports in Power BI](../consumer/end-user-reports.md)

> [!div class="nextstepaction"]
> [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

> [!div class="nextstepaction"]
> [Getting Started with Power BI Desktop](../fundamentals/desktop-getting-started.md)
