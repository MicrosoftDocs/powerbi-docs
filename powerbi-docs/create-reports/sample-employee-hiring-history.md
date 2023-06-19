---
title: 'Employee Hiring and History sample: Take a tour'
description: Learn how to use Power BI with business-oriented data, reports, and dashboards, with this employee hiring and history sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: amac
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 06/21/2023
LocalizationGroup: Samples
---
# Employee Hiring and History sample for Power BI: Take a tour

The Employee Hiring and History built-in sample contains a report and dataset for a human resources department. In this sample, the human resources department has the same reporting model across different companies, even when they differ by industry or size. This sample looks at new hires, active employees, and employees who have left. It strives to uncover any trends in the hiring strategy. The main objectives are to understand:

- Who you hire
- Biases in your hiring strategy
- Trends in voluntary separations

:::image type="content" source="media/sample-employee-hiring-history/power-bi-employee-dashboard.png" alt-text="Screenshot shows a dashboard for the Employee Hiring and History sample." lightbox="media/sample-employee-hiring-history/power-bi-employee-dashboard.png":::

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com/) created samples using real, anonymized data. The data is available in several formats: built-in sample in the Power BI service and *.pbix* Power BI Desktop file. See [Samples for Power BI](sample-datasets.md).

This tour explores the Employee Hiring and History built-in sample in the Power BI service. Because the report experience is similar in Power BI Desktop and in the service, you can also follow along by using the sample *.pbix* file in Power BI Desktop.

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Power BI free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

## Get the sample

Before you can use the sample, get the sample in one of the following ways:

- Get the [built-in sample in the service](#get-the-built-in-sample).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).

### Get the built-in sample

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see **Employee Hiring and History**.

1. Select the sample. It opens the report in Reading mode.

   Power BI imports the built-in sample, adding a report and a dataset to your current workspace.

### Get the .pbix file for this sample

Alternatively, you can download the Employee Hiring and History sample as a .pbix file, which is designed for use with Power BI Desktop.

1. Open the GitHub Samples repository to the [Employee Hiring and History sample .pbix file](https://github.com/microsoft/powerbi-desktop-samples/blob/main/new-power-bi-service-samples/Employee%20Hiring%20and%20History.pbix).

1. Select **Download** in the upper-right corner. It downloads automatically to your **Downloads** folder.

If you'd like to view it in the Power BI service, you can publish it there.

1. Open the file in Power BI Desktop and select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.

1. In the **Publish to Power BI** dialog box, choose a workspace, and then **Select**.

   Power BI imports the sample, adding the report and dataset to your selected workspace.

## Explore the report

To open the Employee Hiring and History report, go to your workspace and select that report:

:::image type="content" source="media/sample-employee-hiring-history/power-bi-select-employee-sample-report.png" alt-text="Screenshot shows My workspace with the Employee Hiring and History report highlighted.":::

If you're following along in Power BI Desktop, open the *.pbix* file to see the report.

### Look at new hires

This report has a page called **New Hires** that has useful visualizations.

1. In the Power BI service, select the **New Hires** page. The upper left visualization shows **Hires by Type**.

1. Select **YoY** to see year-over-year comparing new hires and new hires for the same period last year.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-year-over-year-data.png" alt-text="Screenshot shows new hires, year-over-year with percentage changes." lightbox="media/sample-employee-hiring-history/power-bi-year-over-year-data.png":::  

1. Hover over the elements in the visualization for details as tooltips.
1. Under **New Hires by AgeGroup and Gender**, select an element of the visualization. The other visualizations now include only the selected data.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-year-over-year-age-group-gender.png" alt-text="Screenshot shows the year-over-year values for just males 30 to 49." lightbox="media/sample-employee-hiring-history/power-bi-year-over-year-age-group-gender.png":::

   The table of data also reflects your choice in **New Hires by AgeGroup and Gender**.

1. Select whitespace to clear your selection and see all values again.

### Look at separation data

You can explore data for employees who no longer work for the company.

1. In the report view, select **Actives and Separations**.

1. In the upper left, compare voluntary and involuntary separations in a donut visualization. Select one or the other value to view only that data in the other visualizations of the page. Select whitespace to clear your previous selection.

1. To the right, view separations by month, with comparisons to the same period last year.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-separation.png" alt-text="Screenshot shows visualizations for separated employees." lightbox="media/sample-employee-hiring-history/power-bi-separation.png":::

1. Select involuntary separations for June.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-separation-june.png" alt-text="Screenshot shows the involuntary separations value selected." lightbox="media/sample-employee-hiring-history/power-bi-separation-june.png":::

   You can look at the raw data in the matrix. You can select voluntary, involuntary, or same period last year for any month to specific data.

Suppose you don't want to view numeric data. Instead, you can choose from many visualizations.

1. Select **Edit** to open the report in Edit mode.

1. Select the matrix visualization.

1. Choose a visualization. This example uses a clustered bar chart.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-separation-clustered-bar-chart.png alt-text="Screenshot shows the visualization as a clustered bar chart." lightbox="media/sample-employee-hiring-history/power-bi-separation-clustered-bar-chart.png":::

   Try different visualizations to find one that makes your data easy to understand.

1. Select **Reading view** to leave Edit mode. Be sure to save your changes.

### Review data for bad hires

Another area to explore is bad hires. Bad hires are defined as employees who didn't last for more than 60 days. You're hiring rapidly, but are you hiring good candidates? In the report, select the **Bad Hires** page. You can see several visualizations showing data by gender, age, and group.

:::image type="content" source="media/sample-employee-hiring-history/power-bi-bad-hire.png"  alt-text="Screenshot shows several visualizations dealing with bad hire data." lightbox="media/sample-employee-hiring-history/power-bi-bad-hire.png":::

Look at the **BadHires YoY % changes by Month and AgeGroups** visualization.

:::image type="content" source="media/sample-employee-hiring-history/power-bi-bad-hire-age-group.png"  alt-text="" lightbox="media/sample-employee-hiring-history/power-bi-bad-hire-age-group.png":::

The line visualization shows variation by month for the selected age group. You can look at the raw numbers in the matrix to try to determine if there are underlying causes to the variation.

## Create an Employee Hiring and History dashboard

A Power BI *dashboard* is a single page containing visualizations that can come from one or more reports, and each report is based on one dataset. You can also generate visualizations on the dashboard by using the Q&A *Ask a question about your data* feature to explore the data associated with a report. Think of a dashboard as an entryway into the underlying reports and datasets. Select a visualization to take you to the report that was used to create it.

To create a dashboard in the Power BI service:

1. Open a report by selecting it in a workspace.

1. To add all of the visualizations in a page to a dashboard, from the report menu, select **...** (More options) > **Pin to a dashboard**.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-pin-page-dashboard.png" alt-text="Screenshot shows a Power BI report page with the pin to dashboard option highlighted.":::

   Or, to add a single visualization to a dashboard, hover over it and then select **Pin visual**.

1. In **Pin to dashboard**, select **New Dashboard** and enter a name for your dashboard.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-new-dashboard.png" alt-text="Screenshot shows the Pin to dashboard dialog box for adding to new dashboard.":::

   You can add visuals to an existing dashboard to show visualizations from different reports.

1. Then select **Pin live**.

Your new dashboard now appears in **My workspace**.

For more information, see [Introduction to dashboards for Power BI designers](service-dashboards.md).

## Ask a question in the dashboard Q&A box

No matter whether you downloaded the dashboard or created your own, you can use Q&A in the dashboard to discover other details in the data. Let's get more specific.

In the [Q&A question box](power-bi-tutorial-q-and-a.md) in the dashboard, you can ask a question about your data by using natural language. Q&A recognizes the words you type and figures out where in your dataset to find the answer.

1. Select the Q&A question box. Even before you start typing, Q&A displays suggestions to help form your question.

   :::image type="content" source="media/sample-employee-hiring-history/hr-sample-qa-box.png" alt-text="Screenshot shows the Q&A box suggestions." lightbox="media/sample-employee-hiring-history/hr-sample-qa-box.png":::

1. You can pick one of those suggestions, or enter: *show age group, gender, and bad hires SPLY where region is East*.  

   :::image type="content" source="media/sample-employee-hiring-history/hr-sample-qa-answer.png" alt-text="Screenshot shows the Q&A box answers.":::

   Most of the female bad hires are under 30.

## Next steps

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started with the Power BI service](../fundamentals/service-get-started.md).
