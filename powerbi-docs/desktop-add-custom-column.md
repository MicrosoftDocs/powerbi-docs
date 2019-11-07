---
title: Add a custom column in Power BI Desktop
description: Quickly create a new custom column in Power BI Desktop
author: davidiseminger
manager: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/18/2019
ms.author: davidi

LocalizationGroup: Create reports
---
# Add a custom column in Power BI Desktop

In Power BI Desktop, you can easily add a new custom column of data to your model by using Query Editor. With Query Editor, you create and rename your custom column to create [PowerQuery M formula queries](https://docs.microsoft.com/en-us/powerquery-m/quick-tour-of-the-power-query-m-formula-language) to define your custom column. PowerQuery M formula queries have a [comprehensive function reference content set](https://docs.microsoft.com/powerquery-m/power-query-m-function-reference). 

When you create a custom column in Query Editor, Power BI Desktop adds it as an **Applied Step** in the **Query Settings** of the query. It can be changed, moved, or modified at any time.

![Add Custom Column page](media/desktop-add-custom-column/add-custom-column_01.png)

## Use Query Editor to add a custom column

To start creating a custom column, follow these steps:

1. Launch Power BI Desktop and load some data.

2. From the **Home** tab on the ribbon, select **Edit Queries**, and then select **Edit Queries** from the menu.

   ![Select Edit Queries](media/desktop-add-custom-column/add-column-from-example_02.png)

   The **Query Editor** window appears. 

2. From the **Add Column** tab on the ribbon, select **Custom Column**.

   ![Select Custom Column](media/desktop-add-custom-column/add-custom-column_02.png)

   The **Add Custom Column** window appears.

## The Add Custom Column window

The **Add Custom Column** window has the following features: 
- A list of available columns, in the **Available columns** list on the right.

- The initial name of your custom column, in the **New column name** box. You can rename this column.

- [PowerQuery M formula queries](https://docs.microsoft.com/en-us/powerquery-m/power-query-m-function-reference), in the **Custom column formula** box. You create these queries by building the formula on which your new custom column is defined. 

   ![Add Custom Column page](media/desktop-add-custom-column/add-custom-column_03.png)

## Create formulas for your custom column

1. Select a column from the **Available columns** list on the right, and then select **Insert** below the list to add them to the custom column formula. You can also add a column by double-clicking it in the list.

2. As you enter the formula and build your column, note the indicator in the bottom of the **Add Custom Column** window. 

   If there are no errors, you'll see a green check mark and the message *No syntax errors have been detected*.

   ![Successful syntax check on Add Custom Column page](media/desktop-add-custom-column/add-custom-column_04.png)

   If there's a syntax error, you'll see a yellow warning icon, along with a link to where the error occurred in your formula.

   ![Error on Add Custom Column page](media/desktop-add-custom-column/add-custom-column_05.png)

3. Select **OK**. 

   Power BI Desktop adds your custom column to the model, and adds the **Added Custom** step to your query's **Applied Steps** list in **Query Settings**.

   ![Custom column added to Query Settings](media/desktop-add-custom-column/add-custom-column_06.png)

4. To modify your custom column, double-click the **Added Custom** step in the **Applied Steps** list. 

   The **Add Custom Column** window appears with the custom column formula you created.

## Use the Advanced Editor for custom columns

After you've created your query, you can also use the **Advanced Editor** to modify any step of your query. To do so, follow these steps:

1. In the **Query Editor** window, select the **View** tab on the ribbon. 

2. Select **Advanced Editor**.

   The **Advanced Editor** page appears, which gives you full control over your query. 

   ![Advanced Editor page](media/desktop-add-custom-column/add-custom-column_07.png)

   
## Next steps

- You can create a custom column in other ways, such as creating a column based on examples you provide to Query Editor. For more information, see [Add a column from an example in Power BI Desktop](desktop-add-column-from-example.md).

- For Power Query M reference information, see [Power Query M function reference](/powerquery-m/power-query-m-function-reference).

