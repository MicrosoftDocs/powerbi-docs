---
title: 'Tutorial: Create your own measures in Power BI Desktop'
description: 'Tutorial: Create your own measures in Power BI Desktop'
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/06/2017
ms.author: davidi

LocalizationGroup: Learn more
---
# Tutorial: Create your own measures in Power BI Desktop
Some of the most powerful data analysis solutions in Power BI Desktop can be created by using measures. Measures help you by performing calculations on your data as you interact with your reports. This tutorial will guide you through understanding measures and creating your own basic measures in Power BI Desktop.

### Prerequisites
- This tutorial is intended for Power BI users already familiar with using Power BI Desktop to create more advanced models. You should already be familiar with using Get Data and Query Editor to import data, working with multiple related tables, and adding fields to the Report Canvas. If you’re new to Power BI Desktop, be sure to check out [Getting Started with Power BI Desktop](desktop-getting-started.md).
- Download the [Contoso Sales Sample for Power BI Desktop](http://download.microsoft.com/download/4/6/A/46AB5E74-50F6-4761-8EDB-5AE077FD603C/Contoso%20Sales%20Sample%20for%20Power%20BI%20Desktop.zip) file, which includes online sales data from the fictitious company Contoso, Inc. Because data in the file was imported from a database, you won’t be able to connect to the datasource or view it in Query Editor. Extract the file on your own computer, and open it in Power BI Desktop.

## Understand measures

Measures are most often created for you automatically, like when you select the checkbox next to the **SalesAmount** field from the **Sales** table in the Fields pane, or drag **SalesAmount** onto the Report canvas. A new column chart visualization appears, showing the sum total of all SalesAmounts in the Sales table.

![](media/desktop-tutorial-create-measures/measurestut_salesamountinfieldlist.png) ![](media/desktop-tutorial-create-measures/meastut_salesamountchart.png)

Rather than showing a table with all two million rows of SalesAmount values, Power BI Desktop detected a numeric datatype and automatically created and calculated a measure to aggregate the data. Any field in the Fields list with a sigma icon ![](media/desktop-tutorial-create-measures/meastut_sigma.png) is numeric, and its values can be aggregated. Sum is the default aggregation for a numeric datatype, but you can easily apply different aggregations like average or count. Understanding aggregations is fundamental to understanding measures, because every measure performs some type of aggregation. 

To change the type of aggregation to average, in the **Value** area of the Visualizations pane, click the down arrow next to **SalesAmount** and select **Average**. The visualization changes to an average of all sales values in the SalesAmount field.

![](media/desktop-tutorial-create-measures/meastut_salesamountaverage.png) ![](media/desktop-tutorial-create-measures/meastut_salesamountaveragechart.png)

We can change the type of aggregation depending on the result we want, but not all types of aggregation apply to just any numeric datatype. For example, for our SalesAmount field, Sum and Average make sense. Minimum and Maximum have their place as well. But, Count won’t really make much sense for our SalesAmount field because while its values are numeric, they’re really currency.

Values calculated from measures change in response to your interactions with your report. For example, drag the **RegionCountryName** field from the **Geography** table to your chart to see the average sales amounts for each country.

![](media/desktop-tutorial-create-measures/meastut_salesamountavchartbyrcn.png)

When the result of a measure changes because of an interaction with your report, you have affected your measure’s *context*. Every time you interact with your report, you are changing the context in which a measure calculates and displays its results.

## Create and use your own measures

In most cases, Power BI automatically calculates and returns values according to the fields you’ve added and the types of aggregation you choose, but in some cases you might want to create your own measures to perform more complex, unique calculations. With Power BI Desktop, you create your own measures with the Data Analysis Expressions (DAX) formula language. DAX formulas use many of the same functions, operators, and syntax as Excel. However, DAX functions are designed to work with relational data and perform more dynamic calculations as you interact with your reports. There are over 200 DAX functions that do everything from simple aggregations like Sum and Average to more complex statistical and filtering functions. There are many resources to help you learn more about DAX. After you've finished this tutorial, be sure to see [DAX basics in Power BI Desktop](desktop-quickstart-learn-dax-basics.md).

When you create your own measure, it's added to the Fields list for the table you select and is called a *model* measure. Some advantages of model measures are that you can name them whatever you want, making them more identifiable; you can use them as an argument in other DAX expressions; and you can create measures that perform complex calculations very quickly.

### Create a measure

You want to analyze your net sales by subtracting discounts and returns from sales amounts. For whatever context exists in your visualization, you need a measure that subtracts the sum of DiscountAmount and ReturnAmount from sum of SalesAmount. There's no field for Net Sales in the Fields list, but you have the building blocks to create your own measure to calculate net sales. 

1.  Select the down arrow or right-click on the **Sales** table in the Fields pane, and then select **New Measure**. This will save your new measure in the Sales table, where it will be easier to find.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure.png)
    
    You can also create a new measure by selecting **New Measure** on the Home tab of the Power BI Desktop ribbon.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasureribbon.png)
    
    >[!TIP]
    >When you create a measure from the ribbon, it could be created in any of the tables, but it will be easier to find if you create it where you plan to use it. In this case, select the Sales table first to make it active, and then select **New Measure**. 
    
    The formula bar appears along the top of the Report canvas, where you can rename your measure and enter a DAX formula.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_formulabar.png)
    
2.  By default, a new measure is simply named Measure. If you don’t rename it, additional new measures will be named Measure 2, Measure 3, and so on. You want your measures to be more identifiable, so highlight **Measure** in the formula bar, and then type **Net Sales**.
    
3.  Now you can begin entering your formula. After the equals sign, start to type **Sum**. As you type, a drop-down suggestion list appears, showing all the DAX functions beginning with the letters you type. Select **SUM** from the list, and then press Enter.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_formula_s.png)
    
    An opening parenthesis appears, along with another drop-down suggestion list of all of the available columns you can pass to the SUM function.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_formula_sum.png)
    
    Expressions always appears between opening and closing parentheses. In this case, your expression will contain a single argument to pass to the SUM function: the SalesAmount column. Begin typing "SalesAmount" until only one value is left in the list: Sales(SalesAmount). The column name preceded by the table name is called the *fully-qualified name* of the column. Fully-qualified column names make your formulas easier to read. 
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_formula_salesam.png)
    
4. Select **Sales[SalesAmount]**, and then type a closing parenthesis.
    
    > [!TIP]
    > Syntax errors are most often caused by a missing or misplaced closing parenthesis.
    
    
    
5.  To subtract the other two columns:
    1. After the closing parenthesis for the first expression, type a space, a minus operator (**-**), and another space. 
    2. Enter another SUM function, and start typing "DiscountAmount" until you can choose the **Sales[DiscountAmount]** column as the argument. 
    3. Enter a closing parenthesis, space, another minus operator, space, another SUM function with **Sales[ReturnAmount]" as the argument, and another closing parenthesis.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_complete.png)
    
6.  Press Enter or click the checkmark in the formula bar to complete and validate the formula. The validated measure is now ready to use in the Field list for the Sales table. 
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_formula_discamount.png)
    
If you run out of room for entering a formula or want it to be on separate lines, select the down chevron on the right side of the formula bar to open up more space.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_formula_chevron.png)
    
You can separate parts of your formula on different lines by pressing Alt-Enter, or move things over by using Tab.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_newmeasure_formula_expanded.png)

### Use your measure in the report
Now you can add your Net Sales measure to the report canvas, and net sales will be calculated for whatever other fields you add to the report. 

1. To look at net sales by country:
    
    1. Drag the **Net Sales** measure from the **Sales** table onto the Report canvas.
       
    2. Drag the **RegionCountryName** field from the **Geography** table into the chart.
       
       ![](media/desktop-tutorial-create-measures/meastut_netsales_byrcn.png)
    
2.  Drag the **SalesAmount** field into the chart to see the difference between net sales and sales amount by country.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_byrcnandsalesamount.png)
    
    The chart now uses two measures: SalesAmount, which was summed automatically, and the Net Sales measure you created. Each measure was calculated in the context of another field, RegionCountryName.
    
### Use your measure with a slicer

You can add a slicer to further filter net sales and sales amounts by calendar year.
    
1.  Click a blank area next to the chart, then in **Visualizations**, click on the Table visualization. This creates a blank table visualization on the report canvas.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_blanktablevisbutton.png) ![](media/desktop-tutorial-create-measures/meastut_netsales_blanktable.png)
    
2.  Drag the **Year** field from the **Calendar** table into the new blank table. Because Year is a numeric field, Power BI Desktop sums up its values, but that doesn’t make much sense as an aggregation. 
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_yearaggtable.png)
    
3.  In **Values** in the Visualizations pane, select the down arrow next to **Year**, and then select **Don't summarize**.
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_year_donotsummarize.png)
    
4.  Select the **Slicer** icon in the Visualizations pane.

    ![](media/desktop-tutorial-create-measures/meastut_netsales_year_changetoslicer.png)
    
5.  Select any value in the Year slicer to filter all the other visualizations on the page accordingly. The Net Sales and SalesAmount measures re-calculate and display results in the context of the selected Year field. 
    
    ![](media/desktop-tutorial-create-measures/meastut_netsales_chartslicedbyyear.png)

### Use your measure to create another measure

To find out which products have the highest net sales amount per unit sold, you need a measure that divides net sales by the quantity of units sold. You can create a new measure that divides the result of your Net Sales measure by the sum of Sales[SalesQuantity].

1.  Create a new measure named **Net Sales per Unit** in either the Sales or Products table.
    
2.  Begin typing **Net Sales**. The suggestion list will show what we can add. Select **[Net Sales]**.
    
    ![](media/desktop-tutorial-create-measures/meastut_nspu_formulastep2a.png)
    
    You can also reference measures by just typing an opening bracket (**[**). The suggestion list will show only the measures you can add to your formula.
    
    ![](media/desktop-tutorial-create-measures/meastut_nspu_formulastep2b.png)
    
3.  Enter a space, a divide operator (**/**), another space, a SUM function, and then type **Quantity**. The suggestion list shows all the columns with Quantity in the name. Select **Sales[SalesQuantity]**. The formula should now look like this:
    
    `Net Sales per Unit = [Net Sales] / SUM(Sales[SalesQuantity])`
    
4. Drag the **Net Sales per Unit** measure onto a blank area in the report canvas. The chart shows the average net sales amount over all products sold, which is not very informative. 
    
    ![](media/desktop-tutorial-create-measures/meastut_nspu_chart.png)
    
5. Drag the **ProductCategory** field from the **ProductCategory** table into the chart. That shows more useful information. 
    
    ![](media/desktop-tutorial-create-measures/meastut_nspu_byproductcat.png)
    
6. For a different look, change the chart visualization type to **Tree Map**.
    
    ![](media/desktop-tutorial-create-measures/meastut_nspu_changetotreemap.png)
    
7. Try removing the **ProductCategory** field, and dragging the **ProductName** field from the **Product** table into the chart instead. 
    
    ![](media/desktop-tutorial-create-measures/meastut_nspu_byproductname.png)
    
8. Experiment with other ways to filter and format the visualization.

## What you've learned
Measures give you a lot of power to get the insights you want from your data. You've learned how to create measures by using the formula bar, name them whatever makes most sense, and find and select the right formula elements by using the suggestion lists. You've also been introduced to context, where the result of calculations in measures change according to other fields, or by other expressions in your measure formula.

## Next steps
If you want to take a deeper dive into DAX formulas, and create some more advanced measures, see [DAX basics in Power BI Desktop](desktop-quickstart-learn-dax-basics.md). This article focuses on fundamental concepts in DAX, such as syntax, functions, and a more thorough understanding of context.

Be sure to add the [Data Analysis Expressions (DAX) Reference](https://msdn.microsoft.com/library/gg413422.aspx) to your favorites. This is where you'll find detailed info on DAX syntax, operators, and the over 200 DAX functions.

