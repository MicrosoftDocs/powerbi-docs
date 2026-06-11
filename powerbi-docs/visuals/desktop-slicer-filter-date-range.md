---
title: Create a Relative Date Slicer or Filter in Power BI
description: Learn how to use a slicer or filter to constrain relative date ranges in Power BI.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 12/01/2025
LocalizationGroup: Create reports
ai-usage: ai-assisted
---

# Create a relative date slicer and filter in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

With the **relative date slicer**, **relative date filter**, or **date picker** slicer setting, you can apply time-based selections using a date column. For example, you can show only sales data from within the last 30 days or last calendar month. When you view the report, the relative date period is applied and the specified range filters the other visuals on the page. The **Date picker** slicer setting (preview) extends this capability by adding a calendar and slider for manual date selection and offering anchor options based on today, the first date, or the last date in your data.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-01.png" alt-text="Screenshot showing a sales report and a relative date slicer with the date slicer called out." lightbox="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-01.png":::

## Use the Date picker slicer setting (preview)

The **Date picker** slicer setting provides relative date selections similar to the **Relative date** setting, plus a calendar and slider for selecting specific dates or date ranges. Use **Date picker** when you want both relative options and the ability for report viewers to pick a manual date or date range.

Date picker offers three anchor options for the relative selection:

- **Today**: The relative range is calculated from the current date when the report is viewed. This anchor uses the same behavior as the **Relative date** setting.
- **Last date**: The relative range is calculated from the most recent date in the date column. Useful when your data isn't current or you want the slicer to follow the latest data.
- **First date**: The relative range is calculated from the earliest date in the date column.

When you set a relative selection like "last full month," the slicer keeps the date range up to date as the anchor date changes. Report viewers can change the relative options when interacting with the report, or select any manual date range or single date using the calendar or slider.

:::image type="content" source="media/power-bi-visualization-slicer-visual/date-picker.png" alt-text="Screenshot of a Date picker slicer showing relative date options and a calendar for manual date selection.":::

To change the slicer setting to **Date picker**, select the slicer, then in the **Format** pane, expand **Visual** > **Slicer settings** > **Options** and select **Date picker** from the **Style** dropdown.

> [!NOTE]
> Date picker is a preview feature. To enable it, go to **File** > **Options and settings** > **Options** > **Preview features** and select **Date picker slicer**.
>
> During preview, you can only create date picker slicers in Power BI Desktop. After you publish a report with a date picker slicer, you can use and edit it in the Power BI service.

## Create the relative date range slicer

You can use the relative date slicer just like any other slicer or visual when editing a report in Power BI. Select a **Slicer** visual to add it to your report page and then select a date column for the **Field** value. In the following image, we selected the *Date* column.

>[!Note]
>If your report has a hierarchy with your data column from the [auto date/time feature](../transform-model/desktop-auto-date-time.md), the date column itself must be used instead of the hierarchy to use the slicer in relative date mode.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-02.png" alt-text="Screenshot of the Visualizations pane with the slicer visual icon and the Field well called out.":::

Select the slicer visual, and in the **Format** pane, under **Visualizations** > **Slicer settings** > **Options**, change the **Style** to **Relative Date**.

:::image type="content" source="media/desktop-slicer-filter-date-range/set-relative-date-range-slicer-filter.png" alt-text="Screenshot of the slicer visual with the Format pane and the Relative Date selected.":::

You can then select the settings in the date slicers. These settings are relative to the day the report is viewed, not the data range in the date column.

For the first setting, you have the following choices:

- Last
- Next
- This

In the screenshot, **Last** is selected.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-04.png" alt-text="Screenshot of the Relative config options with the first setting called out.":::


In the second (middle) setting in the relative date slicer, you enter a number to define the relative date range. This option is only available for **Last** or **Next**, and disabled for **This** from the first setting. 

In the screenshot, **2** is selected. 

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-04a.png" alt-text="Screenshot of the Relative config options with the second setting called out.":::

In the third setting, you pick the date part. You have the following choices:

- Days
- Weeks
- Weeks (Calendar)
- Months
- Months (Calendar)
- Years
- Years (Calendar)

In the screenshot, **Years** is selected. The settings are read as **in the last 2 years** and the date column is filtered to only dates in the last 2 years for the other visuals on the report page.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-05.png" alt-text="Screenshot of the Relative config options with the third setting called out.":::


If you select **Months** instead, to make it the last 2 months, here's what happens:

- If today is July 20:

  - The data included in visuals constrained by the slicer shows data for the previous two months,
  - Starting on May 21 and going through July 20 (today's date).

In comparison, if you selected **Months (Calendar)**, the visuals constrained would show data from May 1 through June 30. The setting corresponds to the last two complete calendar months. 

>[!Tip]
>To avoid showing the partial current month in reports comparing months to prior months, use the **months (calendar)** setting to ensure only full months are selected.

## Create the relative date range filter

You can also create a relative date range filter for your report page or your entire report. To do so, drag a date column from the **Data** pane into the **Filters on this page** section or the **Filters on all pages** section in the **Filters** pane:

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-06.png" alt-text="Screenshot showing the Date field highlighted in the Fields pane and the Date field highlighted in the 'Filters on this page' well.":::

Once there, you can change the relative date range. It's similar to how you can customize the **relative date slicer**. Select **Relative date** from the **Filter type** drop-down.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-07.png" alt-text="Screenshot showing the Relative date option highlighted in the Filter type drop-down.":::

After you select **Relative date**, you see three sections to change under **Show items when the value**, including a middle numeric box, just like the slicer.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-08.png" alt-text="Screenshot showing the Filters on this page section of the Filters pane, with the 'Show items when the value' options called out.":::

## Use DAX measures to surface the latest value and its date

If you want to display the most recent value in your data along with the date it corresponds to, you can use DAX measures instead of or alongside a slicer. This approach is useful for card visuals or summary tiles that always show the latest data point.

Use the [LASTNONBLANKVALUE](/dax/lastnonblankvalue-function-dax) function to return the value for the last date that has data, and the [LASTNONBLANK](/dax/lastnonblank-function-dax) function to return that date.

Create two measures:

- **Latest value** returns the value for the most recent date that isn't blank:

    ```dax
    Latest Value = LASTNONBLANKVALUE('Sales'[Date], SUM('Sales'[Amount]))
    ```

- **Latest date** returns the date that corresponds to that value:

    ```dax
    Latest Date = LASTNONBLANK('Sales'[Date], SUM('Sales'[Amount]))
    ```

Replace `'Sales'`, `[Date]`, and `[Amount]` with the table and column names from your model. To give report viewers immediate context about the most recent data point, add the measures to a card visual or display them next to a slicer.

> [!NOTE]
> These measures respect filter context. When you add them to a visual with a date axis, each row reflects that specific date's value. When you group by a higher level such as month or year, the measures return the latest non-blank value within that grouping. 

## Considerations and limitations

The following considerations and limitations apply before showing the relative options in the slicer or filter pane.

- The data type for the column used in the slicer must be a date.
- The date hierarchy for auto date/time in Power BI can't be used. Use the date column directly.
- Date columns in **Power BI** don't include time zone info.
- When the report is published, slicer and filter relative options are always based on the time in UTC. If you set up a filter in a report and send it to a colleague in a different time zone, you both see the same data.

## Related content

- [Slicer visual in Power BI](power-bi-visualization-slicer-visual.md)
- [Slicers in Power BI](power-bi-visualization-slicers.md)
- [Create a relative time slicer and filter in Power BI](../create-reports/slicer-filter-relative-time.md)
- [Auto date/time in Power BI](../transform-model/desktop-auto-date-time.md)
