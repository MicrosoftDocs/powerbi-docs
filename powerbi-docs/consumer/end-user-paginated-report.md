---
title: Paginated reports in the Power BI service
description: Learn what a paginated report is, how they work, and how to view and export them in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: christopher.finlan
ms.service: powerbi
ms.subservice: pbi-explore
ms.search.form: Get started with paginated reports
ms.topic: how-to
ms.date: 01/10/2023
LocalizationGroup: Common tasks
---
# Paginated reports in the Power BI service

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

There are two types of reports available on Power BI, [Power BI reports](end-user-reports.md) and *paginated reports*. 

Power BI reports are optimized for exploration and interactivity. A sales report where different salespeople want to slice the data in the same report for their specific region/industry/customer and see how the numbers change would be best served by a Power BI report.

*Paginated reports* are well suited for viewing reports as pages, printing as PDF, exporting to Excel, or generating documents. A sales detail report where you want to see row-level detail data for specific region/industry/customer and perhaps export it to Excel or print as accessible PDF would be best served by a paginated report.

## Identify a paginated report

In content lists and on your Home landing page, paginated reports can be identified by their icon :::image type="icon" source="media/end-user-paginated-report/power-bi-report-icon.png":::. A paginated report can be shared with you directly, or as part of a [Power BI app](end-user-apps.md). If the report *designer* gave you permissions, you'll be able to re-share the paginated report and subscribe yourself and others.


![Screenshot showing the report list with one standard report and one paginated report.](./media/end-user-paginated-report/power-bi-report-lists.png)

## What is a paginated report?

These reports are called *paginated* because they're formatted to fit well on a printed page. One advantage is that they display all the data in a table, even if the table spans multiple pages. Report *designers* can control the report page layout exactly.

Paginated reports are best for scenarios that require a highly formatted, print-ready output optimized for printing or PDF generation. A profit and loss statement is a good example of the type of report you would probably want to see as a paginated report.

## How do paginated reports work?

When report *designers* create a paginated report, they're really creating a *report definition*. It doesn't contain the data. It specifies where to get the data, which data to get, and how to display the data. When you run the report, the report processor takes the report definition, retrieves the data, and combines it with the report layout to generate the report. Sometimes, the report displays default data. Other times you need to enter parameters before the report can display any data. 

Select a paginated report to open it in the Power BI service. If it has parameters, you need to select them before you can view the report.

   ![Screenshot showing the parameters for the report.](./media/end-user-paginated-report/power-bi-select-parameters.png)

And that's typically the extent of the interaction - setting the parameters. If you're a billing analyst, you might use paginated reports to create or print invoices. If you're a sales manager, you might use paginated reports to view orders by store or sales person. 

This simple paginated report generates profit by year after you select the **Year** parameter. 

:::image type="content" source="./media/end-user-paginated-report/power-bi-one-parameter.png" alt-text="Screenshot showing a report with the year parameter selected.":::

Compared to paginated reports, Power BI reports are much more interactive. Power BI reports allow for ad hoc reporting, and support more types of visuals, including custom visuals.



## Interact with a paginated report

The way you interact with a paginated report is different from other reports. You can do things like print, bookmark, export, and comment, but there's less interactivity. Often, paginated reports require input from you to populate the report canvas.  Other times the report displays default data and you can enter parameters to see different data.

### Print a paginated report

*Paginated* reports are formatted to fit well on a page and to print well. What you see in the browser is what you see when you print. Plus, if the report has a long table, the entire table prints, even if it spans multiple pages. 

Paginated reports can have many pages. For example, this report has 563 pages. Each page is laid out exactly, with one page per invoice and repeating headers and footers. When you print this report, you'll get page breaks between invoices.

   ![Screenshot showing a page of the paginated report for Tailspin Toys.](./media/end-user-paginated-report/power-bi-paginated-500.png)


### Navigate the paginated report

In this sales order report, there are three parameters: Business type, Reseller, and Order number. 

:::image type="content" source="./media/end-user-paginated-report/power-bi-parameter-bar.png" alt-text="Screenshot showing the report with three parameters.":::

To change the information shown, enter new values for the three parameters and select **View report**. Here, we've selected **Specialty bike shop**, **Alpine Ski House**, and order number **SO46085**. Select **View report** to refresh the report canvas with the new sales order.

![Screenshot showing how to change the parameters.](./media/end-user-paginated-report/power-bi-orders.png)

The new sales order shows the parameters we selected. 

![Screenshot showing a sales order with new parameters.](./media/end-user-paginated-report/power-bi-new-orders.png)

Some paginated reports have many pages. Use the page controls to navigate through the report. 

![Screenshot showing the page controls in the top menu bar.](./media/end-user-paginated-report/power-bi-page-control.png)

### Export the paginated report
You have a variety of options for exporting paginated reports, including PDF, Word, XML, PowerPoint, and Excel. When you export, as much of the formatting as possible is preserved. Paginated reports exported to Excel, Word, PowerPoint, MHTML, and PDF, for example, keep their formatting. 

:::image type="content" source="./media/end-user-paginated-report/power-bi-export-menu.png" alt-text="Screenshot showing the formats for exporting a paginated report.":::

[![Screenshot showing four different export types.](./media/end-user-paginated-report/power-bi-four.png)](./media/end-user-paginated-report/power-bi-four.png#lightbox)

### Subscribe to the paginated report
When you subscribe to a paginated report, Power BI sends you an email with the report as an attachment. When you set up your subscription, you choose how often you want to receive the emails: daily, weekly, hourly, or monthly. The subscription contains an attachment of the entire report output, up to 25MB in size. Export the entire report, or choose the parameters ahead of time. Choose from many attachment types, like Excel, PDF, and PowerPoint.  

![Screenshot showing the export formats for subscribing.](./media/end-user-paginated-report/power-bi-export-subscription-choices.png)

## Considerations and troubleshooting

- A paginated report can appear blank until you select parameters and choose **View report**.

- If you don't have any paginated reports, check out these [sample paginated reports](../paginated-reports/paginated-reports-samples.md) that you can import to your workspace. 

## Related content

- [Power BI reports](end-user-reports.md)
- [Paginated reports in Power BI: FAQ](../paginated-reports/paginated-reports-faq.yml)
- More questions? Try the [Power BI Community](https://community.powerbi.com/).
