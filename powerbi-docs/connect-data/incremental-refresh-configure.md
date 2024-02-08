---
title: Configure incremental refresh and real-time data for Power BI semantic models
description: Learn how to configure incremental refresh for Power BI semantic models and real-time data.
author: kfollis
ms.author: kfollis
ms.reviewer: chwade
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/01/2023
LocalizationGroup: 
---

# Configure incremental refresh and real-time data

This article describes how to configure incremental refresh and real-time data for **semantic models**. To learn about configuring incremental refresh for dataflows, see [Premium features of dataflows - Incremental refresh](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh).

Configuring incremental refresh includes creating RangeStart and RangeEnd parameters, applying filters, and defining an incremental refresh policy. After publishing to the Power BI service, you'll perform an initial refresh operation on the model. The initial refresh operation, and subsequent refresh operations apply the incremental refresh policy you defined. Before completing these steps, be sure you fully understand the functionality described in [Incremental refresh and real-time data for semantic models](incremental-refresh-overview.md).

## Create parameters

In this task, you'll use Power Query Editor to create RangeStart and RangeEnd parameters with default values. The default values apply only when filtering the data to be loaded into the model in Power BI Desktop. The values you enter should include only a small amount of the most recent data from your data source. When published to the service, these time range values are overridden by the incremental refresh policy. That is, the policy creates windows of incoming data, one after another.

1. In Power BI Desktop, select **Transform data** on the **Home** ribbon to open Power Query Editor.

1. Select the **Manage Parameters** dropdown and then choose **New Parameter**.

1. In the **Name** field, enter *RangeStart* (case-sensitive). In the **Type** field, select **Date/Time** from the dropdown. In the **Current Value** field, enter a start date and time value. 
 
    :::image type="content" source="media/incremental-refresh-configure/create-range-start.png" alt-text="Define the Range Start parameter in the Manage Parameters dialog.":::

1. Select **New** to create a second parameter named *RangeEnd*. In the **Type** field, select **Date/Time**, and then in the **Current Value** field enter an end date and time value. Select **OK**. 

    :::image type="content" source="media/incremental-refresh-configure/create-range-end.png" alt-text="Define the Range End parameter in the Manage Parameters dialog.":::

Now that you've defined the RangeStart and RangeEnd parameters, you'll filter the data to be loaded into the model based on those parameters.

## Filter data

> [!NOTE]
> Before continuing with this task, verify your source table has a date column of Date/Time data type. If it doesn’t have a Date/Time column, but it has a date column of integer surrogate keys in the form of `yyyymmdd`, follow the steps in [**Convert DateTime to integer**](#convert-datetime-to-integer) later in this article to create a function that converts the date/time value in the parameters to match the integer surrogate key of the source table.

You'll now apply a filter based on *conditions* in the RangeStart and RangeEnd parameters.

1. In Power Query Editor, select the date column you want to filter on, and then choose the dropdown arrow > **Date Filters** > **Custom Filter**.

1. In **Filter Rows**, to specify the first condition, select **is after** or **is after or equal to**, then choose **Parameter**, and then choose **RangeStart**.

    To specify the second condition, if you selected **is after** in the first condition, then choose **is before or equal to**, or if you selected **is after or equal to** in the first condition, then choose **is before** for the second condition, then choose **Parameter**, and then choose **RangeEnd**.

    :::image type="content" source="media/incremental-refresh-configure/filter-rows.png" alt-text="Filter rows dialog showing Range Start and Range End conditions.":::

   **Important:** Verify queries have an equal to (=) on either RangeStart or RangeEnd, but not both. If the equal to (=) exists on both parameters, a row could satisfy the conditions for two partitions, which could lead to duplicate data in the model. For example, `= Table.SelectRows(#"Changed Type", each [OrderDate] >= RangeStart and [OrderDate] <= RangeEnd)` could result in duplicate data if there's an OrderDate that equals both RangeStart and RangeEnd.

    Select **OK** to close.

1. On the **Home** ribbon in Power Query Editor, select **Close & Apply**. Power Query loads data based on the filters defined by the RangeStart and RangeEnd parameters, and any other filters you've defined.

    Power Query loads only data specified between the RangeStart and RangeEnd parameters. Depending on the amount of data in that period, the table should load quickly. If it seems slow and process-intensive, it's likely [the query isn't folding](incremental-refresh-troubleshoot.md).

## Define policy

After you've defined RangeStart and RangeEnd parameters, and filtered data based on those parameters, you'll define an incremental refresh policy. This policy is applied only after the model is published to the service, and a manual or scheduled refresh operation is performed.

1. In Data view, right-click a table in the **Data pane** and select **Incremental refresh**. 

    :::image type="content" source="media/incremental-refresh-configure/incremental-refresh-context-menu.png" alt-text="Data view showing Table context menu with Incremental refresh selected.":::

1. In **Incremental refresh and real-time data** > **Select table**, verify or select the table. The default value of the **Select table** listbox is the table you selected in Data view.

1. Specify required settings:
    
    In **Set import and refresh ranges** > **Incrementally refresh this table** move the slider to **On**. If the slider is disabled, it means the Power Query expression for the table doesn't include a filter based on the RangeStart and RangeEnd parameters.

    In **Archive data starting**, specify the historical *store* period you want to include in the model. All rows with dates in this period will be loaded into the model in the service, unless other filters apply.

    In **Incrementally refresh data starting**, specify the *refresh* period. All rows with dates in this period will be refreshed in the model each time a manual or scheduled refresh operation is performed by the Power BI service.

1. Specify optional settings:

    In **Choose optional settings**, select **Get the latest data in real time with DirectQuery (Premium only)** to include the latest data changes that occurred at the data source after the last refresh period. This setting causes the incremental refresh policy to add a DirectQuery partition to the table.

    Select **Only refresh complete days** to refresh only whole days. If the refresh operation detects a day isn't complete, rows for that whole day aren't refreshed. This option is automatically enabled when you select **Get the latest data in real time with DirectQuery (Premium only)**.

    Select **Detect data changes** to specify a date/time column used to identify and refresh only the days where the data has changed. A date/time column must exist, usually for auditing purposes, at the data source. This column **should not be the same column** used to partition the data with the RangeStart and RangeEnd parameters. The maximum value of this column is evaluated for each of the periods in the incremental range. If it hasn't changed since the last refresh, the current period isn't refreshed. For models published to Premium capacities, you can also specify a custom query. To learn more, see [Advanced incremental refresh - Custom queries for detect data changes](incremental-refresh-xmla.md#custom-queries-for-detect-data-changes).
    
    Depending on your settings, your policy should look something like this:

    :::image type="content" source="media/incremental-refresh-overview/incremental-refresh-dialog.png" alt-text="Incremental refresh and real-time data policy dialog showing incremental refresh range.":::

1. Review your settings and then select **Apply** to complete the refresh policy. This step doesn't load data.

## Save and publish to the service

Now that your RangeStart and RangeEnd parameters, filtering, and refresh policy settings are complete, save your model, and then publish to the service. If your model will become large, be sure to enable [Large model storage format](../enterprise/service-premium-large-models.md) *before* invoking the first refresh in the service.

## Refresh model

In the service, refresh the model. The first refresh will load both new and updated data in the refresh period as well as historical data for the entire store period. Depending on the amount of data, this refresh can take quite a while.  Subsequent refreshes, whether manual or scheduled, are typically much faster because the incremental refresh policy is applied and only data for the period specified in the refresh policy setting is refreshed.

## Convert DateTime to integer

This task is only required if your table uses integer surrogate keys instead of Date/Time values in the date column you use for the RangeStart and RangeEnd filter definition.

The data type of the RangeStart and RangeEnd parameters must be of date/time data type regardless of the data type of the date column. However, for many data sources, tables don't have a column of date/time data type but instead have a date column of integer surrogate keys in the form of `yyyymmdd`. You typically can't convert these integer surrogate keys to the Date/Time data type because the result would be a non-folding query expression, but you can create a function that converts the date/time value in the parameters to match the integer surrogate key of the data source table without losing foldability. The function is then called in a filter step. This conversion step is required if the data source table contains *only* a surrogate key as integer data type.

1. On the **Home** ribbon in Power Query Editor, select the **New Source** dropdown and then choose **Blank Query**. 

1. In **Query Settings**, enter a name, for example, DateKey, and then in the formula editor, enter the following formula:

    `= (x as datetime) => Date.Year(x)*10000 + Date.Month(x)*100 + Date.Day(x)`

    :::image type="content" source="media/incremental-refresh-configure/datekey-function.png" alt-text="Power BI function editor showing the integer surrogate DateKey function.":::

1. To test the formula, in **Enter Parameter**, enter a date/time value, and then select **Invoke**. If the formula is correct, an integer value for the date is returned. After verifying, delete this new **Invoked Function** query.

1. In **Queries**, select the table, and then edit the query formula to call the function with the RangeStart and RangeEnd parameters.

    `= Table.SelectRows(#"Reordered Column OrderDateKey", each [OrderDateKey] > DateKey(RangeStart) and [OrderDateKey] <= DateKey(RangeEnd))`

    :::image type="content" source="media/incremental-refresh-configure/apply-datekey-filter.png" alt-text="Power BI table showing DateKey filter.":::

## Related content

- [Troubleshoot configuring incremental refresh](incremental-refresh-troubleshoot.md#configuring-in-power-bi-desktop)  
- [Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)  
- [Configure scheduled refresh](../connect-data/refresh-scheduled-refresh.md)  
