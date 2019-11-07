---
title: Download a report from the Power BI service to Power BI Desktop (Preview)
description: Download a report from the Power BI service to a Power BI Desktop file
author: maggiesMSFT
manager: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/12/2019
ms.author: maggies

LocalizationGroup: Reports
---
# Download a report from the Power BI service to Power BI Desktop (Preview)
In Power BI Desktop, you can publish a report (a *.pbix* file) from your local computer to the Power BI service. Power BI reports can go the other direction as well: You can download a report from the Power BI service to Power BI Desktop. The extension for a Power BI report, in either case, is .pbix.

There are a few limitations and considerations to keep in mind, which are discussed later in this article.

![File dropdown](media/service-export-to-pbix/power-bi-file-export.png)

## Download the report as a .pbix file

You can only download reports [created with Power BI Desktop](/learn/modules/publish-share-power-bi/2-publish-reports) after November 23, 2016, and updated since then. If it was created before then, the **Download report** menu option in the Power BI service is grayed out.

To download the .pbix file, follow these steps:

1. In the Power BI service, open the report you want to download in [Editing view](https://docs.microsoft.com/power-bi/service-interact-with-a-report-in-editing-view).

2. From the top nav pane, select **File > Download report**.
   
3. While the report is downloading, a status banner displays the progress. When the file is ready, you're asked where to save the .pbix file. The default name of the file matches the title of the report.
   
4. If you haven't already, [install Power BI Desktop](desktop-get-the-desktop.md), then open the .pbix file in Power BI Desktop.
   
    When you open the report in Power BI Desktop, you may see a warning message letting you know that some features available in the Power BI service report aren't available in Power BI Desktop.
   
    ![Warning dialog](media/service-export-to-pbix/power-bi-export-to-pbix_2.png)

5. The report editor in Power BI Desktop is similar to the report editor in the Power BI service.  
   
    ![Power BI Desktop report editor](media/service-export-to-pbix/power-bi-desktop.png)

## Considerations and troubleshooting
There are a few important considerations and limitations associated with downloading a .pbix file from the Power BI service.

* To download the file, you must have edit access to the report.
* The report must have been created by using Power BI Desktop and *published* to the Power BI service, or the .pbix file must have been *uploaded* to the Power BI service.
* Reports must be published or updated after November 23, 2016. Reports published earlier aren't downloadable.
* This feature won't work with reports and content packs originally created in the Power BI service.
* Always use the latest version of Power BI Desktop when you open downloaded files. Downloaded .pbix files might not open in non-current versions of Power BI Desktop.
* If your administrator has turned off the ability to download data, this feature won't be visible in the Power BI service.
* Datasets with incremental refresh can't be downloaded to a .pbix file.

## Next steps
View the **Guy in a Cube** one-minute video about this feature:

<iframe width="560" height="315" src="https://www.youtube.com/embed/ymWqU5jiUl0" frameborder="0" allowfullscreen></iframe>

Here are some additional articles that can help you learn to use the Power BI service:

* [Reports in Power BI](consumer/end-user-reports.md)
* [Basic concepts for designers in the Power BI service](service-basic-concepts.md)

After you've installed Power BI Desktop, see the following article to help you get up and running quickly:

* [Getting Started with Power BI Desktop](desktop-getting-started.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).

