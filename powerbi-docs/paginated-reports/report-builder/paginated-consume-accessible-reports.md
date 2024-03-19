---
title: "Use accessibility tools to interact with Power BI paginated reports | Microsoft Docs"
description:  Learn about the accessibility tools available for consuming paginated reports.
ms.date: 05/19/2023
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

:::image type="content" source="media/paginated-create-accessible-reports/paginated-color-contrast.png" alt-text="Screenshot showing high-contrast report." lightbox="media/paginated-create-accessible-reports/paginated-color-contrast.png":::

You can consume paginated reports by using the following accessibility tools:

- [Keyboard navigation](#keyboard-navigation-in-the-power-bi-service)
- [Screen reader](#consume-a-paginated-report-in-the-power-bi-service-by-using-a-screen-reader)

The following sections describe in detail how to use these tools to consume paginated reports.

## Keyboard navigation in the Power BI service

You can consume paginated reports shared in the Power BI service by using keyboard navigation. This section covers how to navigate the different areas of the Power BI service page when consuming a paginated report.

### Keyboard navigation for the Power BI service interface

You can navigate the Power BI report service interface with the <kbd>Tab</kbd> key. Pressing the <kbd>Tab</kbd> key moves focus to the different areas of the page. Shifting focus in the Power BI report service interface progresses in the following order:

1. File menu
1. Home menu
1. View menu
1. Export
1. Page navigation
1. Subscribe to report

:::image type="content" source="media/paginated-consume-accessible-reports/paginated-accessible-tab-keyboard-nav.png" alt-text="Screenshot showing Keyboard navigation for the Power BI service interface.":::

## Keyboard navigation for the Power BI service menu bar

You can access the menu bar in Power BI service by using the <kbd>Tab</kbd> key. When you open a report link, press the <kbd>Tab</kbd> key until you reach the first item on the menu bar, which is the **File** menu.

:::image type="content" source="media/paginated-consume-accessible-reports/paginated-file-menu.png" alt-text="Screenshot showing Paginated menu bar.":::
 
To switch between the menu options, use <kbd>Left</kbd> and <kbd>Right</kbd> arrow keys. Use the <kbd>Space bar</kbd> or <kbd>Enter</kbd> key when focus is on any of the menu options, to view the items under that menu group. The following image shows the items under the Home tab.
 
:::image type="content" source="media/paginated-consume-accessible-reports/paginated-home-menu.png" alt-text="Screenshot showing Paginated Home menu.":::

Pressing the <kbd>Tab</kbd> key moves focus to the first item on that menu group, you can then use the <kbd>Left</kbd> and <kbd>Right</kbd> arrow keys to switch between the items displayed. To select any of the options, use the <kbd>Space bar</kbd> or <kbd>Enter</kbd> key.

## Keyboard navigation for the report parameters pane in the Power BI service

To access any of the report parameters, navigate to the report parameters pane by pressing the <kbd>Tab</kbd> key until focus lands on the first parameter. You can move from one object to another on the pane by pressing the <kbd>Tab</kbd> key. The tab order moves in the following order:

1. Parameter 1
1. Parameter 2
1. View Report button

:::image type="content" source="media/paginated-consume-accessible-reports/paginated-accessible-parameter-pane.png" alt-text="Screenshot showing Paginated report parameters pane.":::
 
When focus is any of the parameters, you can use the <kbd>Down</kbd> arrow key to open the list and use the <kbd>Up</kbd> and <kbd>Down</kbd> arrow keys to navigate through the available value options. To select any value press <kbd>Space bar</kbd> or <kbd>Enter</kbd> keys. For the text parameters, you can directly write the values in the textbox.

## Keyboard navigation for the report body in the Power BI service

When you’re done selecting the report parameters, you can use the <kbd>Space bar</kbd> or <kbd>Enter</kbd> key to navigate to the View Report button and select it. The report displays based on the selected parameters.

You can zoom in on the report body by pressing the <kbd>Ctrl</kbd> and <kbd>+</kbd> keys. To zoom out, press <kbd>Ctrl</kbd> and <kbd>-</kbd> keys.

You can switch pages by using the pagination control in the Home tab. The image of the pagination control can be seen in the following image. Navigate to the Home tab using the <kbd>Tab</kbd> key, use the <kbd>Space bar</kbd> or <kbd>Tab</kbd> key to move to the submenu options of the Home tab. Use the arrow keys to move focus to the paginated control. Use the <kbd>Tab</kbd> key to change the page number, use the <kbd>Space bar</kbd> or <kbd>Enter</kbd> key to select the desired page number.

:::image type="content" source="media/paginated-consume-accessible-reports/paginated-pagination-control.png" alt-text="Screenshot showing Pagination control.":::
 
> [!NOTE]
> Moving focus from one report object to another isn't supported in the Power BI service. You can't move the cursor pointer from on object to another to place focus on it.
 

## Keyboard navigation in Accessible PDF 

An Accessible PDF can be viewed on any PDF reader such as Adobe Acrobat reader. You can navigate through the report objects using the <kbd>Up</kbd> and <kbd>Down</kbd> arrow keys. You can also navigate between individual characters with the <kbd>Left</kbd> and <kbd>Right</kbd> arrow keys. 

When you open the Accessible PDF, the focus (the blinking line) stays on the report title, you can then use the <kbd>Down</kbd> arrow key, shifting focus from one object to another from top to bottom.  You can also move through the cells of a table or matrix using the <kbd>Up</kbd> and <kbd>Down</kbd> arrow keys.

:::image type="content" source="media/paginated-consume-accessible-reports/paginated-accessible-pdf-report.png" alt-text="Screenshot showing Paginated Accessible PDF." lightbox="media/paginated-consume-accessible-reports/paginated-accessible-pdf-report.png":::

> [!NOTE]
> When you navigate to an image on the Accessible PDF, the image isn't highlighted to show that focus is on it.

## Consume a paginated report in the Power BI service by using a screen reader

A screen reader reads aloud every object on the report as you navigate through the paginated report in service. It reads aloud each report object, its description and the Alt text provided by the report creator.

> [!NOTE]
> The screen reader doesn't read Alt texts for images aloud in Power BI service.
 
## Consume Accessible PDF paginated report by using a screen reader

As you navigate to the different objects in an Accessible PDF report using the <kbd>Up</kbd> and <kbd>Down</kbd> arrow keys, the screen reader reads aloud the object value, its description and the Alt text if any was provided by the report creator.
To consume a Table or Matrix in an Accessible PDF report, navigate through each cell using the <kbd>Up</kbd> and <kbd>Down</kbd> arrow keys. Depending on the screen reader used, it reads aloud the row number, the column name and then the cell value of each cell you navigate to. 

> [!NOTE]
> When using a screen reader alongside the keyboard to navigate through the report objects, the cursor (blinking line) isn't highlighted on the object in focus. You can only tell the object in focus when navigating by what the screen reader reads aloud.

## Related content

- [Accessibility in Power BI paginated reports (Power BI Report Builder)](paginated-accessibility-overview.md)
- [Use accessibility tools to create accessible paginated reports (Power BI Report Builder)](paginated-use-accessibility-tools.md)
