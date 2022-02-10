---
title: Optimize reports for the Power BI mobile apps
description: Learn how to optimize report pages for the Power BI mobile apps by creating a portrait version of the report specifically for phones.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.custom: contperf-fy20q4
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/08/2022
LocalizationGroup: Create reports
---
# About mobile-optimized Power BI reports

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Mobile users can view any Power BI report page in the Power BI mobile apps. However, reports designed for use on a computer can be difficult to read and interact with on phones.

In Power BI, after creating a report, it is possible to create an additional view of the report that is optimized for mobile devices to make it easy to read and use. When a mobile-optimized view exists for a page, it automatically displays when the mobile device is held in portrait orientation. If the user wants to see the regular non-optimized view of the page as they would see it on their computer, they can tip the phone onto its side, as shown in the image below.

![Screenshot showing how mobile-optimized report pages display on a phone in portrait and landscape orientation.](media/power-bi-create-phone-report/power-bi-mobile-optimized-report-portrait-landscape.png)

Power BI provides a number of features to help you create mobile-optimized versions of your reports:
* A **mobile layout view** where you create your mobile-optimized report by dragging and dropping visuals onto a phone emulator canvas.
* A **formatting pane** that enables you to precisely format your report visuals by changing their properties.
* **Visuals and slicers** that can be optimized for use on small, mobile screens.

an include just those visuals that are critical to see, and layout and format those visuals so that they are easy to read and interact with.
With these authoring capabilties, report creators can select, rearrange, and reformat just visuals that make sense for mobile users on the go. Easy to use report that focuses just on the critical information.

These capabilities make it possible to design and build attractive, interactive mobile-optimized reports.

This article introduces Power BI's mobile authoring capabilities and features, and presents some [examples](#examples) that demonstrate some of the things you can do to create attractive and effective report page views for phones. 

>[!NOTE]
> Formatting changes you make for your phone optimized layout do not affect the regular layout of your report.for mobile 

## Create a mobile-optimized portrait version of a report page

**Prerequisite**: The first step is to design and create the report in the regular web view. After you've created the report, you can optimize it for phones and tablets.

To create the mobile-optimized view, open the report in either Power BI Desktop or in the Power BI service. When the report is open, go the mobile layout view.

# [Power BI Desktop](#tab/powerbi-desktop)

Select the **View** ribbon and choose **Mobile layout**.

![Screenshot of the mobile layout button on the View ribbon in Power B I Desktop.](media/power-bi-create-phone-report/power-bi-mobile-layout-button-desktop.png)

# [Power BI service](#tab/powerbi-service)

Choose **Edit report > Mobile Layout**. If the Edit option is not visible, look under **More options (...)**.

   ![Screenshot of the mobile layout button on the View ribbon in the Power B I service.](media/power-bi-create-phone-report/power-bi-mobile-layout-button-service.png)

---

You see a scrollable canvas shaped like a phone, a **Page visuals** pane that lists all of the visuals that are on the original report page, and a **Visualizations** pane, where you will format visual properties. The features of the  Page visuals pane are described below. The Visualization pane is empty until you select a visual on the canvas.

![Screenshot of mobile layout view.](media/power-bi-create-phone-report/power-bi-mobile-layout-view.png)

## Publish a mobile-optimized report
To publish a mobile-optimized version of a report, [publish the main report from Power BI Desktop to the Power BI service](desktop-upload-desktop-files.md). This publishes the mobile-optimized version at the same time.

## Viewing optimized and unoptimized reports on a phone

In the Power BI mobile apps, mobile-optimized reports are indicated by a special icon.

![Mobile optimized report icon](media/power-bi-create-phone-report/desktop-create-phone-report-optimized-icon.png)

On phones, the app automatically detects whether the report is mobile-optimized or not.
* If a mobile-optimized report exists, the app automatically opens the report in mobile-optimized mode.
* If a mobile-optimized report doesn’t exist, the report opens in the regular unoptimized view. Turn the phone on it's side to get a slightly larger view of an unoptimzed report page. Alternatively, if all you need to do is get a quick look at the data, you can pinch and zoom into the data you're interested in.

The image below shows an optimized report page as well as an unoptimized version of the same page, in both portrait and landscape orientation.

![Screenshot of mobile-optimized reports in portrait and landscape orientation.](media/power-bi-create-phone-report/power-bi-mobile-optimized-report.png)


## Considerations when creating mobile-optimized layouts
* For reports with multiple pages, you can optimize all the pages or just a few.
* If you've defined a background color for a report page, the mobile-optimized report will have the same background color.

## Next steps
* Create an initial layout for a mobile-optimized report page
* Fine tune the visual in your mobile optimized report
* [Create a phone view of a dashboard in Power BI](service-create-dashboard-mobile-phone-view.md).
* [View Power BI reports optimized for your phone](../consumer/mobile/mobile-apps-view-phone-report.md).
* [Power BI documentation on creating reports and dashboards](./index.yml).
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
