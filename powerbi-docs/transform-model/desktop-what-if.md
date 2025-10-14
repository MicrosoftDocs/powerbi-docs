---
title: Use Parameters to Visualize Variables
description: Find out how to create your own parameters in Power BI Desktop so that you can adjust variable values and observe the impact on your reports.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom: FY25Q1-Linter
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 10/13/2025
LocalizationGroup: Create reports
#customer intent: As a Power BI user, I want to find out how to create my own parameters for variables in my Power BI reports so that I can interact with my data.
---
# Create and use parameters to visualize variables in Power BI Desktop

You can create variables for your Power BI Desktop reports. Variables provide a way for you to visualize and quantify key values and then interact with those values in your reports. To adjust the value of a variable, you can use a slicer.

In Power BI Desktop, you use a parameter to store a variable. This article shows you how to create a parameter and how to create a measure by using a formula that includes the parameter. The article then shows you how to create a visual that changes as you use a slicer to adjust the parameter value.

## Create a parameter

1. To create a parameter in Power BI Desktop, go to the **Modeling** tab, and then select **New parameter**.

   :::image type="content" source="media/desktop-what-if/create-new-parameter.png" alt-text="Screenshot of the Power BI Desktop ribbon. On the Modeling tab, the New parameter button is highlighted.":::

1. Select **Fields** or **Numeric range**. The examples in this article use **Numeric range** as the type of parameter. Similar procedures apply to using **Fields** as the type.

1. In the **Parameters** dialog, take the following actions:
   * For **Name**, enter **Discount percentage**.
   * For **Data type**, select **Decimal number**.
   * For **Minimum**, enter **0**.
   * For **Maximum**, enter **0.50**, which represents 50%.
   * For **Increment**, enter **0.05**, which represents 5%. The increment determines how much the parameter adjusts when you interact with it in a report.

   :::image type="content" source="media/desktop-what-if/parameters-dialog-box.png" alt-text="Screenshot of the Parameters dialog in Power BI Desktop. The Name, Data type, Minimum, Increment, and Maximum fields contain data.":::

   > [!NOTE]
   > For decimal numbers, precede the value with a zero, as in **0.50**, not **.50**. Otherwise, Power BI can't validate the value, and the **Create** button isn't available.

1. If you want Power BI to create a slicer for your parameter, select **Add slicer to this page**. After you select **Create**, a slicer is added to the current report page.

   :::image type="content" source="media/desktop-what-if/what-if_03.png" alt-text="Screenshot of the Discount percentage slicer on the report page. A control is available for setting the value, which is currently 0.05." lightbox="media/desktop-what-if/what-if_03.png":::

When you create a parameter, a measure is also automatically created. You can use the measure to visualize the current value of the parameter.

:::image type="content" source="media/desktop-what-if/measure-visual.png" alt-text="Screenshot of Power BI Desktop. In Fields, the Discount percentage Value measure is highlighted. A bar chart shows the value of that measure." lightbox="media/desktop-what-if/measure-visual.png":::

After you create a parameter, both the parameter and the measure become part of your model. They're available throughout the report, so you can use them on other report pages. Because they're part of the model, you can delete the slicer from the report page. If you want the slicer back, go to the **Fields** list. Select the parameter, drag it onto the canvas, and then change the visual to a slicer.

## Use a numeric range parameter

This next example shows you how to use a parameter to interact with your data. In this example, you put the parameter from the previous section to use. Specifically, you create a new measure by using a formula that includes the parameter. Then you adjust the value of that measure by using a slicer.

The new measure represents the total sales amount. Its value is calculated by applying the discount rate stored in your **Discount percentage** parameter.

In Power BI, you can create complex and interesting measures that consumers of your reports can use to visualize the variable of your parameter. For example, you can create a report that sales people can use to observe the following data:

* Their compensation if they meet certain sales goals or percentages
* The effect of discounts on sales

1. To create the measure, go to the **Modeling** tab, and then select **New measure**.

   :::image type="content" source="media/desktop-what-if/select-new-measure.png" alt-text="Screenshot of the Power BI Desktop ribbon. On the Modeling tab, the New measure button is highlighted.":::

1. In the formula bar, enter the following formula:

   ```dax
   Sales after Discount = SUM(Sales[SalesAmount]) - (SUM(Sales[SalesAmount]) * 'Discount percentage' [Discount percentage Value])
   ```

   This formula creates a measure named **Sales after Discount**.

1. Create a column visual with **OrderDate** on the x-axis. For the values, use **SalesAmount** and the new measure, **Sales after Discount**.

   :::image type="content" source="media/desktop-what-if/sales-amount-column-visual.png" alt-text="Screenshot of a clustered column chart that shows sales and discounted sales for a year when the discount is zero. The values are the same each month." lightbox="media/desktop-what-if/sales-amount-column-visual.png":::

1. Move the slider for the **Discount percentage** parameter. The **Sales after Discount** column reflects the discounted sales amount.

   :::image type="content" source="media/desktop-what-if/sales-amount-discount-column-visual.png" alt-text="Screenshot of a chart that shows sales and discounted sales when the discount slider is at 0.3. The discounted sales value is 30% less each month." lightbox="media/desktop-what-if/sales-amount-discount-column-visual.png":::

You can use this process to create parameters for any data you want to work with. Parameters are useful in all sorts of situations. Parameters provide a way for report consumers to interact with scenarios that you create in your reports.

## Considerations and limitations

When you work with parameters, keep in mind the following considerations and limitations:

* Parameters can have at most 1,000 unique values. If a parameter has more than 1,000 unique values, the parameter values get evenly sampled.
* Parameters are designed for measures within visuals. If you use a parameter in a dimension calculation, the parameter value might be calculated incorrectly.

## Related content

* [Use quick measures for common calculations](desktop-quick-measures.md)
* [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md)
* [Create calculated tables in Power BI Desktop](desktop-calculated-tables.md)
