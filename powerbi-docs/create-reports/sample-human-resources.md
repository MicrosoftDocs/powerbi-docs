---
title: 'Human Resources sample: Take a tour'
description: Learn how to use Power BI with business-oriented data, reports, and dashboards, with this human resources sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: amac
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 02/22/2023
LocalizationGroup: Samples
---
# Human Resources sample for Power BI: Take a tour

The Human Resources built-in sample contains a dashboard, report, and dataset for a human resources department. In this sample, the human resources department has the same reporting model across different companies, even when they differ by industry or size. This sample looks at new hires, active employees, and employees who have left. It strives to uncover any trends in the hiring strategy. The main objectives are to understand:

- Who you hire
- Biases in your hiring strategy
- Trends in voluntary separations

:::image type="content" source="media/sample-human-resources/hr1.png" alt-text="Screenshot shows the dashboard for the Human Resources sample." lightbox="media/sample-human-resources/hr1.png":::

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com/) created this sample using real, anonymized data. The data is available in several formats: built-in sample in the Power BI service, .pbix Power BI Desktop file, or Excel workbook. See [Samples for Power BI](sample-datasets.md).

This tutorial explores the Human Resources built-in sample in the Power BI service. Because the report experience is similar in Power BI Desktop and in the service, you can also follow along by using the sample .pbix file in Power BI Desktop.

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Power BI free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

## Get the sample

Before you can use the sample, get the sample in one of the following ways:

- Get the [built-in sample in the service](#get-the-built-in-sample).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).
- Download the [Excel workbook](#get-the-excel-workbook-for-this-sample).

### Get the built-in sample

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Human Resources Sample**.

1. Select the sample. It opens in Reading mode.

1. Power BI imports the built-in sample, adding a new dashboard, report, and dataset to your current workspace.

   :::image type="content" source="media/sample-human-resources/hr-sample-entry.png" alt-text="Screenshot shows the Human Resources Sample dashboard link.":::

   Select the dashboard to view the sample dashboard.

### Get the .pbix file for this sample

Alternatively, you can download the Human Resources sample as a [.pbix file](https://download.microsoft.com/download/6/9/5/69503155-05A5-483E-829A-F7B5F3DD5D27/Human%20Resources%20Sample%20PBIX.pbix), which is designed for use with Power BI Desktop.

### Get the Excel workbook for this sample

If you want to view the data source for this sample, it's also available as an Excel workbook. To see the raw data, enable the Data Analysis add-ins, and then select **Power Pivot** > **Manage**. To download the eight original Excel files, see [Explore the Excel samples in Excel](sample-datasets.md#explore-excel-samples-in-excel).

## New hires

Let's explore new hires first.

1. In your workspace, select the **Dashboards** tab, and open the **Human Resources Sample** dashboard.

1. On the dashboard, select the **New Hire Count, New Hires Same Period Last Year, Actives YoY % Change By Month** tile.  

   :::image type="content" source="media/sample-human-resources/hr2.png" alt-text="Screenshot shows the New Hire Count tile.":::  

   The Human Resources Sample report opens to the **New Hires** page.  

   :::image type="content" source="media/sample-human-resources/hr3.png" alt-text="Screenshot shows the New Hires page." lightbox="media/sample-human-resources/hr3.png":::

1. Look at these items of interest:

   - The **New Hire Count, New Hires SPLY and Actives YoY % Change by Month** combo chart shows that you hired more people every month this year compared to last year. Significantly more people in some months.
   - In the combo chart **New Hire Count and Active Employee Count by Region and Ethnicity**, notice that you're hiring fewer people in the **East** region.
   - The **New Hires YoY Var by Age Group** waterfall chart shows you're hiring mainly younger people. This trend might be due to the mostly part-time nature of the jobs.
   - The **New Hire Count by Gender** pie chart shows a roughly even split.

   Can you find more insights? For example, a region where gender isn't evenly split.

1. Select different age groups and genders in the charts to explore the relationships between age, gender, region, and ethnicity group.

1. Select **Human Resources Sample** from the black **Power BI** header bar to see detailed information about the dashboard.

   :::image type="content" source="media/sample-human-resources/power-bi-breadcrumbs.png" alt-text="Screenshot showing selection of Human Resources Sample in the black Power BI header bar.":::

## Compare currently active and former employees

Let's explore data for currently active employees and employees who no longer work for the company.

1. On the dashboard, select the **Active Employee Count by Age Group** tile.

   :::image type="content" source="media/sample-human-resources/pbi_hr_sample_activepie.png" alt-text="Screenshot shows the Active Employee Count by Age Group tile.":::

   The Human Resources Sample report opens to the **Active Employees vs. Separations** page.  

   :::image type="content" source="media/sample-human-resources/hr5.png" alt-text="Screenshot shows the Active Employees vs. Separations page." lightbox="media/sample-human-resources/hr5.png":::

1. Look at these items of interest:

   - The two combo charts on the left show the year-over-year change for active employees and employee separations. You have more active employees this year due to rapid hiring, but also more separations than last year.
   - In August, you had more separations compared to other months. Select the different age groups, genders, or regions to see if you can find any outliers.
   - Looking at the pie charts, you have an even split in our active employees by gender and age groups. Select different age groups to see how the gender split differs by age. Do you have an even split by gender in every age group?

## Reasons for separation

Look at the report in Editing View. You can change the pie charts to show employee separations data instead of active employee data.

1. Select **Edit** in the upper-right corner.

1. Select the **Active Employee Count by Age Group** pie chart.

1. In **Data**, select **Employees** to expand the **Employees** table. Clear **Active Employee Count** to remove that field.

1. Select **Separation Count** in the **Employees** table to add it to the **Values** box in the **Data** area.

1. On the report canvas, select the **Voluntary** bar in the **Separation Count by Separation Reason** bar chart.

   This bar highlights those employees who left voluntarily in the other visuals in the report.

1. Select the 50+ slice of the **Separation Count by Age Group** pie chart.

1. Look at the line chart in the lower-right corner. This chart is filtered to show voluntary separations.  

   :::image type="content" source="media/sample-human-resources/pbi_hr_sample_sepsover50.png" alt-text="Screenshot shows Employee separations over 50 by selecting a slice.":::

   Notice the trend in the 50+ age group. During the latter part of the year, more employees over age 50 left voluntarily. This trend is an area to investigate further with more data.

   You can also follow the same steps for the **Active Employee Count by Gender** pie chart, changing it to separations instead of active employees. Look at the voluntary separation data by gender to see if you find any other insights.

1. Select **Human Resource Sample** from the workspace to return to the dashboard. You can choose to save the changes you've made to the report.

## Bad hires

The last area to explore is bad hires. Bad hires are defined as employees who didn't last for more than 60 days. you're hiring rapidly, but are you hiring good candidates?

1. Select the **Bad Hires as % of Actives by Age Group** dashboard tile. The report opens to tab three, **Bad Hires**.

   :::image type="content" source="media/sample-human-resources/hr7.png" alt-text="Screenshot shows the Bad Hires as % of Actives by Age Group tile.":::  

1. Select **Northwest** in the **Region** slicer on the left and select **Male** in the **Bad Hire Count by Gender** donut chart. Look at the other charts on the **Bad Hires** page. There are more male bad hires than females and many Group A bad hires.

   :::image type="content" source="media/sample-human-resources/pbi_hr_sample_badhirespage.png" alt-text="Screenshot shows bad hires with the northwest slicer selected." lightbox="media/sample-human-resources/pbi_hr_sample_badhirespage.png":::  

1. If you look at the **Bad Hire Count by Gender** donut chart and select different regions in the **Region** slicer, you see that the East region is the only region with more female than male bad hires.

1. Select the name of the dashboard from the workspace return to the dashboard.

## Ask a question in the dashboard Q&A box

In the [Q&A question box](power-bi-tutorial-q-and-a.md) in the dashboard, you can ask a question about your data by using natural language. Q&A recognizes the words you type and figures out where in your dataset to find the answer.

1. Select the Q&A question box. Even before you start typing, Q&A displays suggestions to help form your question.

   :::image type="content" source="media/sample-human-resources/pbi_hr_sample_qabox.png" alt-text="Screenshot shows the Q&A box suggestions." lightbox="media/sample-human-resources/pbi_hr_sample_qabox.png":::

1. You can pick one of those suggestions, or enter: *show age group, gender, and bad hires SPLY where region is East*.  

   :::image type="content" source="media/sample-human-resources/pbi_hr_sample_qa_answer.png" alt-text="Screenshot shows the Q&A box answers.":::

   Most of the female bad hires are under 30.

## Next steps

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the Learning center for a new copy of this sample.

We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started with the Power BI service](../fundamentals/service-get-started.md).
