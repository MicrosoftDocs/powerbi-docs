---
title: "Report Views for paginated report in the Power BI service"
description: In this article, you learn to about the different report views available for paginated reports in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer:
ms.service: powerbi
ms.subservice: 
ms.topic: conceptual
ms.date: 04/22/2020
---

# Report Views for paginated report in Power BI service

When you render a paginated report in Power BI Service, the view is HTML based and interactive, which is the default. The other report view is for fixed page formats like PDF and this is the new Paginated View.

**Default Interactive View**

![Default View](media/paginated-reports-page-view/power-bi-paginated-default-view.png)

**Paginated View**

![Paginated View](media/paginated-reports-page-view/power-bi-paginated-page-view.png)

## Paginated View

In Paginated View, the rendered report looks quite different compared to the default view since there are properties and concepts in paginated reports that only apply to fixed pages. The view will be similar to when the report is printed or exported, and still be able to change parameter values, etc. However it does not have some of the interactive features like column sorting, toggles or links.

Paginated View supports all the features similar to the browser's PDF Viewer like options to Zoom in, Zoom out and Fit to page.

When you open a paginated report, it will be rendered in interactive view by default. If the report has parameters, select parameters, then select View Report. Below are steps to switch to Paginated View, once the report has been rendered.

1. Select **View** on the toolbar, then select **Page View**

    ![Switch to Page View](media/paginated-reports-page-view/power-bi-paginated-page-view-dropdown.png)

2. You can change the settings of the page view by selecting the **Page Settings** in **View** menu on the toolbar. 

    ![Select Page Settings](media/paginated-reports-page-view/power-bi-paginated-page-settings-dropdown.png)
    
   Page Settings dialog has options to set Page Size and Orientation for the Page View. Once the page setting is saved, the same will be applied when you choose to Print later.
   
    ![Page Settings Dialog](media/paginated-reports-page-view/power-bi-paginated-page-settings-dialog.png)

You can switch back to the interactive view using the **Default** in the **View** Dropdown.

## Browser Support

Page View is not supported in Internet Explorer and Safari, so the option will be disabled. It is also not supported in mobile browsers and in native Power BI mobile app.

## Next steps

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)
- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)
