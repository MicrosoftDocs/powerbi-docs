---
title: Shape and Combine Data in Power BI Desktop Tutorial
description: Learn how to shape and combine data in Power BI Desktop to create data models and build reports. Follow this step-by-step tutorial
author: kgremban
ms.author: kgremban
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: tutorial
ms.date: 09/04/2025
ai-usage: ai-assisted
LocalizationGroup: Transform and shape data
#Customer intent: As a Power BI Desktop user, I want to learn how to connect to data sources, then shape and combine the data in Power Query Editor, so that I can create data models and build reports.
---

# Shape and combine data in Power BI Desktop

Learn how to connect to multiple data sources, shape data to meet your analysis needs, and combine it into a single model in Power BI Desktop. This tutorial uses the **Sales & Returns** sample, a Microsoft-hosted dataset.

> [!NOTE]  
> This tutorial uses the Power BI Desktop application. If you don’t have it installed, download it from the official Power BI site.

## Prerequisites

To follow along, download one of the sample files available in Power BI. **This tutorial uses the "Sales & Returns" sample (.pbix).** Selecting a sample file option in Power BI opens the [GitHub repo for Power BI Desktop samples](https://github.com/microsoft/powerbi-desktop-samples/blob/main/Sample%20Reports/Sales%20%26%20Returns%20Sample%20v201912.pbix). 

- Select **Download** to save the Sales & Returns sample *.pbix* file to your computer.  
- [Learn more about Power BI sample files](../create-reports/sample-datasets.md) to explore additional datasets for practice.

- Select **Download** to save the Sales & Returns sample *.pbix* file to your computer. 

> [!TIP]
> Take a tour of the Sales & Returns sample report by visiting the [Power BI updates blog](https://powerbi.microsoft.com/blog/take_a_tour_of_the_new_sales_returns_sample_report/).
>
> Learn more about using sample files in [Get samples for Power BI](../create-reports/sample-datasets.md).

## Open the sample file

After downloading the sample file, open it in Power BI Desktop.

1. Open **Power BI Desktop**.
1. Select **File > Open**, and browse to the downloaded `.pbix` file.
1. After the file opens, you see a report with visuals already created. To explore the data behind the visuals, go to **Home > Transform data** to open **Power Query Editor**.

## Shape data in Power BI Desktop

Shaping data means transforming it to meet your needs, like renaming columns, changing data types, or removing unnecessary rows. For a deeper dive into shaping data, see [Power Query Editor overview](../transform-model/desktop-query-overview.md).

In the **Power Query Editor**, follow these steps:

1. In the **Queries pane**, select the **Sales** table.
2. Notice the applied steps in the **Query Settings** pane. These steps show how the data is shaped:
   - **Source**: Connects to the original data.
   - **Changed Type**: Automatically detects and sets data types.
   - **Removed Columns**: Removes unnecessary columns.
3. Rename a column:
   - Right-click the column header (for example, `ProductID`) and select **Rename**.
   - Enter a new name, such as `Product ID`.

Filter rows:

1. Select the dropdown arrow in the **Region** column.
2. Clear the regions you want to exclude.
3. Select **OK** to apply the filter.

## Combine data in Power BI Desktop

Combining data means merging or appending queries. In this example, merge the **Sales** and **Returns** tables to analyze returned products. For more examples of combining data, see [Perform common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md#shape-and-combine-data).

To merge queries:

1. On the **Home** tab, select **Merge queries > Merge queries as new**.
2. In the merge dialog box:
   - Select **Sales** as the first table.
   - Select **Returns** as the second table.
   - Choose the `Product ID` column in both tables.
   - Use the default join type: **Left Outer (all from first, matching from second)**.
3. Select **OK**.

A new query is created. Expand the merged data:

1. In the new query, select the expand icon beside the **Returns** column.
2. Select the columns to include (for example, `Return Reason`).
3. Select **OK**.

## Apply changes

When you're done shaping and combining data:

1. Select **Close and apply** on the **Home** tab.
1. Power BI applies the changes and loads the data into the model.

You can now use the combined data in your report visuals.

## Next steps

- Explore relationships between tables in **Model view**.
- Create visuals using fields from both **Sales** and **Returns**.
- Add calculated columns or measures using **Data Analysis Expressions (DAX)**.

## Related content

- [Analyze webpage data by using Power BI Desktop](desktop-tutorial-importing-and-analyzing-data-from-a-web-page.md)
- [Connect to a GitHub repo with Power BI](service-tutorial-connect-to-github.md)
- Learn more about the [query overview in Power BI Desktop](../transform-model/desktop-query-overview.md).
