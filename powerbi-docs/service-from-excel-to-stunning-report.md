---
title: 'From Excel workbook to stunning report in no time'
description: 'From Excel workbook to stunning report in no time'
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/28/2018
ms.author: maggies

LocalizationGroup: Data from files
---
# From Excel workbook to stunning report in no time
Your manager wants to see a report on your latest sales figures combined with your last campaign impressions by the end of the day. But the latest data resides on various third party systems and on files in your laptop. In the past it’s taken hours to create visuals and format a report. You’re beginning to feel anxious.

No worries. With Power BI, you can create a stunning report in no time.

In this example, we’ll upload an Excel file from a local system, create a new report, and share it with colleagues—all from within Power BI.

## Prepare your data
Let’s take a simple Excel file as an example. Before you can load your Excel file into Power BI, you must organize your data in a flat table. This means that each column contains the same data type--for example, text, date, number, or currency. You should have a header row, but there should not be any column or row that displays totals.

![data organized in Excel](media/service-from-excel-to-stunning-report/pbi_excel_file.png)

Next, format your data as a table. In Excel, on the Home tab, in the Styles group, select **Format as Table**. Select a table style to apply to your worksheet. Your Excel worksheet is now ready to load into Power BI.

![data formatted as a table](media/service-from-excel-to-stunning-report/pbi_excel_table.png)

## Upload your Excel file into Power BI
Power BI connects to many data sources, including Excel files that live on your computer. To get started, sign in to Power BI service. If you haven’t signed up, [you can do so for free](https://powerbi.com).

You want to create a new dashboard. Open **My workspace** and select the **+ Create** icon.

![Create icon](media/service-from-excel-to-stunning-report/power-bi-new-dash.png)

Select **Dashboard**, enter a name, and select **Create**. The new dashboard displays -- with no data.

![Create dropdown](media/service-from-excel-to-stunning-report/power-bi-create-dash.png)

At the bottom of the left navigation pane, select **Get Data**. On the Get Data page, under Import or Connect to Data, in the Files box, select **Get**.

![Get data from files](media/service-from-excel-to-stunning-report/pbi_get_files.png)

On the Files page, select **Local File**. Navigate to the Excel workbook file on your computer and select it to load into Power BI. Select **Import**.

> **NOTE**: To follow along with the rest of this tutorial, use the [Financial sample workbook](sample-financial-download.md).
> 
> 

![Get data > Files window](media/service-from-excel-to-stunning-report/pbi_local_file.png)

## Build your report
After Power BI imports your Excel file, start building your report. When the **Your dataset is ready** message appears, select **View dataset**.  Power BI opens in Editing view and displays the report canvas. On the right side are the Visualizations, Filters, and Fields panes.

Notice that your Excel workbook table data appears in the Fields pane. Under the name of the table, Power BI lists the column headings as individual fields.

![what Excel data looks like in the Fields pane](media/service-from-excel-to-stunning-report/pbi_report_fields.png)

Now you can begin to create visualizations. Your manager wants to see profit over time. In the Fields pane, drag **Profit** to the report canvas. Power BI displays a bar chart by default. Next, drag **Date** to the report canvas. Power BI updates the bar chart to show profit by date.

![column chart in report editor](media/service-from-excel-to-stunning-report/pbi_report_pin-new.png)

> **TIP**: If your chart doesn't look like you expected, check your aggregations. For example, in the **Value** well, right click the field you just added and make sure the data is being aggregated the way you'd like it to be.  In this example, we're using **Sum**.
> 
> 

Your manager wants to know which countries are the most profitable. Impress her with a map visualization. Select a blank area on your canvas, and from the Fields pane, simply drag over the **Country** and then **Profit** fields. Power BI creates a map visual with bubbles representing the relative profit of each location.

![map visual in report editor](media/service-from-excel-to-stunning-report/pbi_report_map-new.png)

What about displaying a visual showing sales by product and market segment? Easy. In the Fields pane, select the checkboxes next to the Sales, Product and Segment fields. Power BI creates a bar chart instantly. Change the type of chart by choosing one of the icons in the Visualizations menu. For instance, change it to a Stacked Bar chart.  To sort the chart, select the ellipses (...) > **Sort by**.

![stacked column chart in report editor](media/service-from-excel-to-stunning-report/pbi_barchart-new.png)

Pin all of your visuals to your Dashboard. You’re ready to share it with your colleagues.

![dashboard with the 3 visuals pinned](media/service-from-excel-to-stunning-report/pbi_report.png)

## Share your dashboard
You want to share your dashboard with your manager, Paula. You can share your dashboard and underlying report with any colleague who has a Power BI account. They can interact with your report, but cannot save changes.

To share your report, at the top of the dashboard, select **Share**.

![Share icon](media/service-from-excel-to-stunning-report/power-bi-share.png)

Power BI displays the Share Dashboard page. In the top area, enter the email addresses of the recipients. Add a message in the field below. To allow recipients to share your dashboard with others, select **Allow recipients to share your dashboard**. Select **Share**.

![Share dashboard window](media/service-from-excel-to-stunning-report/power-bi-share-dash-new.png)

Next steps

* [Get started with Power BI service](service-get-started.md)
* [Get started with Power BI Desktop](desktop-getting-started.md)
* [Power BI - Basic Concepts](consumer/end-user-basic-concepts.md)
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

