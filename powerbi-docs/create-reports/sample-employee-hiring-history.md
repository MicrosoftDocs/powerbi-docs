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

The Employee Hiring and History built-in sample contains a dashboard, report, and dataset for a human resources department. In this sample, the human resources department has the same reporting model across different companies, even when they differ by industry or size. This sample looks at new hires, active employees, and employees who have left. It strives to uncover any trends in the hiring strategy. The main objectives are to understand:

- Who you hire
- Biases in your hiring strategy
- Trends in voluntary separations

:::image type="content" source="media/sample-employee-hiring-history/power-bi-employee-dashboard.png" alt-text="Screenshot shows a dashboard for the Employee Hiring and History sample." lightbox="media/sample-employee-hiring-history/power-bi-employee-dashboard.png":::

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com/) created samples using real, anonymized data. The data is available in several formats: built-in sample in the Power BI service, *.pbix* Power BI Desktop file, or Excel workbook. See [Samples for Power BI](sample-datasets.md).

This tutorial explores the Employee Hiring and History built-in sample in the Power BI service. Because the report experience is similar in Power BI Desktop and in the service, you can also follow along by using the sample *.pbix* file in Power BI Desktop.

Before you can use the sample, get the sample in one of the following ways:

- Get the [built-in sample in the service](#get-the-built-in-sample-in-the-power-bi-service).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).

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

   Power BI imports the built-in sample, adding report and dataset to your current workspace.

### Get the .pbix file for this sample

Alternatively, you can download the Employee Hiring and History sample as a .pbix file, which is designed for use with Power BI Desktop.

1. Open the GitHub Samples repository to the [Employee Hiring and History sample .pbix file](https://github.com/microsoft/powerbi-desktop-samples/blob/main/new-power-bi-service-samples/Employee%20Hiring%20and%20History.pbix).

1. Select **Download** in the upper-right corner. It downloads automatically to your Downloads folder.

If you'd like to view it in the Power BI service, you can publish it there.

1. Open the file in Power BI Desktop and select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.

1. In the **Publish to Power BI** dialog box, choose a workspace, and then **Select**.

   Power BI imports the sample, adding the report and dataset to your selected workspace.

## Explore the report

To open the Employee Hiring and History report, go to your workspace and select


power-bi-select-employee-sample-report.png

### Look at new hires

If you got the built-in report in the Power BI service or published the *.pbix* file from Power BI Desktop, you can see the report that comes with the sample. If you imported from Excel, your automatically generated report doesn't look as described.

Let's explore new hires first.

1. If you got the [built-in sample](#get-the-built-in-sample-in-the-power-bi-service) in your workspace, select the **Dashboards** tab, and open the **Employee Hiring and History Sample** dashboard.

    If you [uploaded the .pbix file](#get-the-pbix-file-for-this-sample), skip the next step and open the **New Hires** page of the report in your workspace.

1. On the dashboard, select the **New Hire Count, New Hires Same Period Last Year, Actives YoY % Change By Month** tile.  

   :::image type="content" source="media/sample-employee-hiring-history/hr-2.png" alt-text="Screenshot shows the New Hire Count tile.":::  

   The Employee Hiring and History Sample report opens to the **New Hires** page.  

   :::image type="content" source="media/sample-employee-hiring-history/hr-3.png" alt-text="Screenshot shows the New Hires page." lightbox="media/sample-employee-hiring-history/hr-3.png":::

1. Look at these items of interest:

   - The **New Hire Count, New Hires SPLY and Actives YoY % Change by Month** combo chart shows that you hired more people every month this year compared to last year. Significantly more people in some months.
   - In the combo chart **New Hire Count and Active Employee Count by Region and Ethnicity**, notice that you're hiring fewer people in the **East** region.
   - The **New Hires YoY Var by Age Group** waterfall chart shows you're hiring mainly younger people. This trend might be due to the mostly part-time nature of the jobs.
   - The **New Hire Count by Gender** pie chart shows a roughly even split.

   Can you find more insights? For example, a region where gender isn't evenly split.

1. Select different age groups and genders in the charts to explore the relationships between age, gender, region, and ethnicity group.

1. Select **Employee Hiring and History Sample** from the black **Power BI** header bar to see detailed information about the dashboard.

   :::image type="content" source="media/sample-employee-hiring-history/power-bi-breadcrumbs.png" alt-text="Screenshot showing selection of Employee Hiring and History Sample in the black Power BI header bar." lightbox="media/sample-employee-hiring-history/power-bi-breadcrumbs.png":::

### Compare currently active and former employees

Let's explore data for currently active employees and employees who no longer work for the company.

1. If you got the [built-in sample](#get-the-built-in-sample-in-the-power-bi-service) in your workspace, in the dashboard, select the **Active Employee Count by Age Group** tile.

    If you [uploaded the .pbix file](#get-the-pbix-file-for-this-sample), open the **Active Employees vs. Separations** page of the report in your workspace.

    :::image type="content" source="media/sample-employee-hiring-history/hr-sample-active-pie.png" alt-text="Screenshot shows the Active Employee Count by Age Group tile.":::

    The Employee Hiring and History Sample report opens to the **Active Employees vs. Separations** page.  

    :::image type="content" source="media/sample-employee-hiring-history/hr-5.png" alt-text="Screenshot shows the Active Employees vs. Separations page." lightbox="media/sample-employee-hiring-history/hr-5.png":::

1. Look at these items of interest:

   - The two combo charts on the left show the year-over-year change for active employees and employee separations. You have more active employees this year due to rapid hiring, but also more separations than last year.
   - In August, you had more separations compared to other months. Select the different age groups, genders, or regions to see if you can find any outliers.
   - Looking at the pie charts, you have an even split in our active employees by gender and age groups. Select different age groups to see how the gender split differs by age. Do you have an even split by gender in every age group?

### Understand reasons for separation

Look at the report in Editing View. You can change the pie charts to show employee separations data instead of active employee data.

1. Select **Edit** in the upper-right corner.

1. Select the **Active Employee Count by Age Group** pie chart.

1. In **Data**, select **Employees** to expand the **Employees** table. Clear **Active Employee Count** to remove that field.

1. Select **Separation Count** in the **Employees** table to add it to the **Values** box in the **Data** area.

1. On the report canvas, select the **Voluntary** bar in the **Separation Count by Separation Reason** bar chart.

   This bar highlights those employees who left voluntarily in the other visuals in the report.

1. Select the 50+ slice of the **Separation Count by Age Group** pie chart.

1. Look at the line chart in the lower-right corner. This chart is filtered to show voluntary separations.  

   :::image type="content" source="media/sample-employee-hiring-history/hr-sample-separations-over-50.png" alt-text="Screenshot shows Employee separations over 50 by selecting a slice.":::

   Notice the trend in the 50+ age group. During the latter part of the year, more employees over age 50 left voluntarily. This trend is an area to investigate further with more data.

   You can also follow the same steps for the **Active Employee Count by Gender** pie chart, changing it to separations instead of active employees. Look at the voluntary separation data by gender to see if you find any other insights.

1. Select **Human Resource Sample** from the workspace to return to the dashboard. You can choose to save the changes you've made to the report.

## Review data for bad hires

The last area to explore is bad hires. Bad hires are defined as employees who didn't last for more than 60 days. You're hiring rapidly, but are you hiring good candidates?

1. Again, if you got the [built-in sample](#get-the-built-in-sample-in-the-power-bi-service) in your workspace, in the dashboard, select the **Bad Hires as % of Actives by Age Group** dashboard tile. The report opens to tab three, **Bad Hires**.

    If you [uploaded the .pbix file](#get-the-pbix-file-for-this-sample), open the **Bad Hires** page of the report in your workspace.

   :::image type="content" source="media/sample-employee-hiring-history/hr-7.png" alt-text="Screenshot shows the Bad Hires as % of Actives by Age Group tile.":::  

1. Select **Northwest** in the **Region** slicer on the left and select **Male** in the **Bad Hire Count by Gender** donut chart. Look at the other charts on the **Bad Hires** page. There are more male bad hires than females and many Group A bad hires.

   :::image type="content" source="media/sample-employee-hiring-history/hr-sample-bad-hires-page.png" alt-text="Screenshot shows bad hires with the northwest slicer selected." lightbox="media/sample-employee-hiring-history/hr-sample-bad-hires-page.png":::  

1. If you look at the **Bad Hire Count by Gender** donut chart and select different regions in the **Region** slicer, you see that the East region is the only region with more female than male bad hires.

1. Select the name of the dashboard from the workspace return to the dashboard.

## Create an Employee Hiring and History dashboard

A Power BI *dashboard* is a single page, often called a *canvas*. A dashboard tells a story through visualizations. You can create a dashboard from a Power BI report. You can use the *Ask a question about your data* feature to explore the data associated with a report.

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
