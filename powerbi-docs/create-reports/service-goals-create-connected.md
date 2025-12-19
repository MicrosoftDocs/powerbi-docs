---
title: Create connected goals in Power BI
description: Learn how to create connected goals.
author: kgremban
ms.author: kgremban
ms.reviewer: monicacl
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/19/2025
ms.custom: sample-salesandmarketing
#customer intent: As a Power BI user I want to learn how to show the same goal on multiple Power BI scoredcards.
---

# Create connected goals in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics in Power BI let you curate your goals and track them against key business objectives. When you choose values for your goals, you can:

- Manually enter the current and target values.
- Connect the current value, the target value, or both to data in an existing Power BI report.

This article is about connecting the values to data in an existing Power BI report. Connected values change whenever the underlying data is updated.

## Connect values to data

You can connect either the current or the target value, or both, to a value in a report.

1. [Create a goal or edit an existing goal](service-goals-create.md) in a scorecard.

1. In the **Current value** or **Final target** field, select **Connect to data**.

   :::image type="content" source="media/service-goals-create-connected/connect-to-data.png" alt-text="Screenshot that shows selecting connect to data for the current value of a goal." lightbox="media/service-goals-create-connected/connect-to-data.png":::

1. In the dialog, search for the report with the data that you want to track. Select the report, and then select **Next**.

   :::image type="content" source="media/service-goals-create-connected/power-bi-goals-select-report.png" alt-text="Screenshot of Select the report that contains the data value you want to connect to.":::

   This list contains all the reports that you have access to, across all workspaces, in Power BI.  

1. In the report that you selected, go to the visual that contains the data you want to track.

1. Select the data point or visual. Power BI displays the measure card, summarizing all the filters applied to the selection.

    :::image type="content" source="media/service-goals-create-connected/power-bi-goals-select-data-point.png" alt-text="Screenshot of Select the data point you want to use as your Current or Target.":::

    Currently, some limitations exist on the values you can select. See the [Considerations and limitations](#considerations-and-limitations) section in this article for details.

1. Select **Connect**.

    Power BI automatically represents values in numeric notation. For example, *2044* is represented as *2 K*.

1. Select **Save**.

### Choose measures for connected goals

The **Connect to data** experience simplifies automating goals for scorecard authors. You can select and calculate measures at these levels:

- Visual
- Legend
- Data point
- Axis value

Two main types of cases exist for connecting to data in goals and subgoals:

- Categorical data
- Time-series data

### Categorical data

Categorical data refers to cases where you're connecting a goal or subgoal to data other than time-series data. For example, you might connect to the total sales of the **Outdoor** product category:

:::image type="content" source="media/service-goals-create-connected/power-bi-goals-connect-categorical-pie-chart.png" alt-text="Screenshot of Select the Outdoor product category.":::

Or you might connect to the total number of results in the **Family** customer segment:

:::image type="content" source="media/service-goals-create-connected/power-bi-goals-connect-categorical-column-chart.png" alt-text="Screenshot of Select the Family customer segment.":::

In these cases, depending on what you select, Power BI calculates the measures as follows:

- **Visual** – Power BI calculates the measure at the aggregate level.
- **Legend** – Power BI filters the measure to the selected legend.
- **Data point** – Power BI filters the measure to the selected data point.  
- **Axis value** – Power BI filters the measure to the category selected in the axis.

### Time-series data

The time series refers to cases where you have a Date/Time field in the axis. In these cases, Power BI calculates the measures at the last data point in the time series and pulls in history.

## Considerations and limitations

The following list describes the current limitations on the values you can choose in a visual:

- In a 100% stacked bar or column chart, Power BI uses the measure value rather than the percentage.
- In a multi-row card, Power BI uses the first measure in the card.
- Multi-Geo isn't supported.
- In gauges and KPI tiles, Power BI uses the value, but not the target, or the min or max value in the gauge.
- In a table with more than one column of measures, Power BI uses the first measure in the row.
- Connected goal values don't update automatically when connected to data from a datamart using DQ/Live connection.

## Related content

- [Get started with goals in Power BI](service-goals-introduction.md)
- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
