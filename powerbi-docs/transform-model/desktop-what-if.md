---
title: Use parameters to visualize variables
description: Learn how to create your own parameters to imagine and visualize variables in your Power BI reports.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 02/03/2023
LocalizationGroup: Create reports
---
# Create and use parameters to visualize variables in Power BI Desktop

You can create variables for your reports, interact with the variable as a slicer, and visualize and quantify different key values in your reports.

:::image type="content" source="media/desktop-what-if/create-new-parameter.png" alt-text="Screenshot of Power BI Desktop highlighting the New parameter button.":::

Create a parameter on the **Modeling** tab in Power BI Desktop. When you select it, a dialog box appears where you can configure the parameter.

## Create a parameter

To create a parameter, select **New parameter** from the **Modeling** tab in Power BI Desktop, and choose either **Fields** or **Numeric range**. The following examples use **Numeric range**, similar procedures apply to using **Fields**. Name the example *Discount Percentage* and set its **Data type** to **Decimal number**. The **Minimum** value is zero. The **Maximum** is 0.50 (50 percent). Also set the **Increment** to 0.05, or five percent. The increment determines how much the parameter will adjust when interacted with in a report.

:::image type="content" source="media/desktop-what-if/parameters-dialog-box.png" alt-text="Screenshot of the Parameters dialog box with the example data filled out in the fields.":::

> [!NOTE]
> For decimal numbers, make sure you precede the value with a zero, as in 0.50 versus just .50. Otherwise, the number won't validate and the **OK** button won't be selectable.
>
>

For your convenience, the **Add slicer to this page** checkbox automatically puts a slicer with your parameter onto the current report page.

:::image type="content" source="media/desktop-what-if/what-if_03.png" alt-text="Screenshot of the Discount percentage slicer on the report page.":::

In addition to creating the parameter, you also create a measure automatically in this process, which you can use to visualize the current value of the parameter.

:::image type="content" source="media/desktop-what-if/what-if_04.png" alt-text="Screenshot of the parameter measure and visual highlighted in Power BI Desktop.":::

It's important and useful to note that after you create a parameter, both the parameter and the measure become part of your model. So, they're available throughout the report and can be used on other report pages. And, since they're part of the model, you can delete the slicer from the report page. If you want it back, choose the parameter from the **Fields** list and drag it onto the canvas, then change the visual to a slicer.

## Use a numeric range parameter

This next example shows you how to use a parameter with data. You created the parameter in the previous section. Now you'll put it to use by creating a new measure whose value adjusts with the slider.

:::image type="content" source="media/desktop-what-if/what-if_05.png" alt-text="Screenshot of the New Measure button highlighted in Power BI Desktop.":::

The new measure is going to be the total sales amount, with the discount rate applied. You can create complex and interesting measures that let the consumers of your reports visualize the variable of your parameter. For example, you could create a report that lets sales people see their compensation if they meet certain sales goals or percentages, or see the effect of increased sales to deeper discounts.

Enter the measure formula into the formula bar, and name the formula *Sales after Discount*.

```dax
Sales after Discount = SUM(Sales[SalesAmount]) - (SUM(Sales[SalesAmount]) * 'Discount percentage' [Discount percentage Value])
```

Then, create a column visual with **OrderDate** on the axis, and both **SalesAmount** and the just-created measure, **Sales after Discount** as the values.

:::image type="content" source="media/desktop-what-if/what-if_07.png" alt-text="Screenshot visualizing SalesAmount from the example measure formula.":::

Then, as you move the slider, you'll see that the **Sales after Discount** column reflects the discounted sales amount.

:::image type="content" source="media/desktop-what-if/what-if_08.png" alt-text="Screenshot of the SalesAmount visual changed by using the parameter slider.":::

This process is how you create parameters for any data you might want to work with. You can use parameters in all sorts of situations. These parameters enable the consumers of reports to interact with different scenarios that you create in your reports.

## Considerations and limitations

There are a couple considerations and limitations for parameters to keep in mind:

* Parameters can only have 1,000 unique values. For parameters with more than 1,000 unique values, the parameter values will be evenly sampled.

* Parameters are designed for measures within visuals, and might not calculate properly when used in a dimension calculation.

## Related content

You might also be interested in the following articles:

* [Use quick measures for common calculations](desktop-quick-measures.md)
* [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md)
* [Create calculated tables in Power BI Desktop](desktop-calculated-tables.md)
