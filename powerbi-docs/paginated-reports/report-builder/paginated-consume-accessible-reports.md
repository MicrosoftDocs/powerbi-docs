---
title: "Use accessibility tools to interact with Power BI paginated reports | Microsoft Docs"
description:  Learn about the accessibility tools available for consuming paginated reports.
ms.date: 05/12/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cookiemccray
---
# Use accessibility tools to interact with paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

People with physical disabilities, low-vision, or temporary disabilities can consume and interact with paginated reports and get the same information and value from a report as people without disabilities. This article describes the accessibility tools available for consuming paginated reports.

:::image type="content" source="media/paginated-create-accessible-reports/paginated-color-contrast.png" alt-text="high-contrast report.":::

You can consume paginated reports by using the following accessibility tools:

- [Keyboard navigation](#keyboard-navigation-in-the-power-bi-service)
- [Screen reader](#consume-a-power-bi-service-report-using-a-screen-reader)

The following sections describe in detail how to use these tools to consume paginated reports.

## Keyboard navigation in the Power BI service

You can consume paginated reports shared in the Power BI service by using keyboard navigation. This section covers how to navigate the different areas of the Power BI service page when consuming a paginated report.

### Keyboard navigation for the Power BI service interface

You can navigate the Power BI report service interface with the Tab key. Pressing the Tab key moves focus to the different areas of the page. Shifting focus in the Power BI report service Interface progresses in the following order:

1. App Launcher
1. Power BI Home button
1. Current Workspace link
1. Report Name
1. Search Content
1. Notification
1. Settings
1. Download
1. Help & Support
1. Feedback
1. Profile
1. Home button
1. Create button
1. Browse button
1. Data hub button
1. Metrics button
1. Apps button
1. Learn button
1. Workspaces button
1. Current workspace button
1. Menu bar
1. Add to favorite button
1. Comments button
1. Share button
1. Sub menu options
1. Report Parameters
1. View Report button

 


Keyboard navigation for the Power BI service Menu Bar
You can access the menu bar in Power BI service by using the Tab key. When you open a report link, press the Tab key until you reach the first item on the menu bar, which is the File menu.
 
To switch between the menu options, use Left and Right arrow keys. Use the Space or Enter key when focus is on any of the menu options, to view the items under that menu group. The image below shows the items under the Home tab. 
 

Pressing the Tab key will move focus to the first item on that menu group, you can then use the Left and Right arrow keys to switch between the items displayed. To select any of the options use the Space or Enter key.
Keyboard navigation for Report Parameters pane in Service
To access the any of the Report Parameters, navigate to the Report Parameters pane by pressing the Tab key until focus lands on the first parameter. You can move from one object to another on the pane by pressing the Tab key. The tab order moves in the following order:

1. Parameter 1
1. Parameter 2
1. View Report button

 
When focus is any of the parameters, you can use the Down arrow key to open the list and use the Up and Down arrow keys to navigate through the available value options. To select any value press Space or Enter keys. For the text parameters you can directly write the values in the textbox.

## Keyboard navigation for the report body in the Power BI service

When you’re done selecting the report parameters, you can use the Space bar or Enter key to navigate to the View Report button and select it. The report displays based on the selected parameters.

You can zoom in on the report body by pressing the Ctrl and + keys. To zoom out, press Ctrl and – keys.

You can switch pages by using the pagination control in the Home tab. The image of the pagination control can be seen below. Navigate to the Home tab using the Tab key, use the Space or Tab key to move to the sub-menu options of the Home tab. Use the arrow keys to move focus to the paginated control. Use the Tab key to change the page number, use the Space or Enter key to select the desired page number.
 

 

## Keyboard navigation in Accessible PDF 

An Accessible PDF can be viewed on any PDF reader such as Adobe Acrobat reader. You can navigate through the report objects using the Up and Down arrow keys. You can also navigate between individual characters with the Left and Right arrow keys. 
When you open the Accessible PDF, the focus (the blinking line) stays on the report title, you can then use the down arrow key, shifting focus from one object to another from top to bottom.  You can also move through the cells of a table or matrix using the Up and Down arrow keys.
 

## Consume a Power BI service report using a screen reader

A screen reader will read aloud every object on the report as you navigate through the paginated report in service. It reads aloud each report object, its description and the Alt text provided by the report creator.
 
Consume Accessible PDF report using a screen reader
As you navigate to the different objects in an Accessible PDF report using the Up and Down arrow keys, the screen reader will read aloud the object value, its description and the Alt text if any was provided by the report creator.
To consume a Table or Matrix in an Accessible PDF report, navigate through each cell using the Up and Down arrow keys. Depending on the screen reader used, it will read aloud the row number, the column name and then the cell value of each cell you navigate to. 




## Next steps

- [Accessibility in Power BI paginated reports (Power BI Report Builder)](paginated-accessibility-overview.md)
- [Use accessibility tools to create accessible paginated reports (Power BI Report Builder)](paginated-use-accessibility-tools.md)
