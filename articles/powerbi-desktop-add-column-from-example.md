<properties
   pageTitle="Add a column from an example in Power BI Desktop"
   description="Quickly create a new column in Power BI Desktop using existing columns as examples"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/08/2017"
   ms.author="davidi"/>

# Add a column from an example in Power BI Desktop

Starting with the April 2017 release of **Power BI Desktop**, you can add new columns of data to your model using **Query Editor** by simply providing one or more sample values for your new column. You can create a new column example from a current selection, or from providing input based on all (or selected) columns in a given table.

![](media/powerbi-desktop-add-column-from-example/add-column-from-example_01.png)

This approach helps you quickly and easily create new columns, and is great for the following situations:

-   You know the data result you want in your new column, but you're not sure which transformation (or collection of transformations) will get you there.
-   You already know which transformations you need, but you're not sure where to click or select in the UI to make them happen.
-   You know all about the transformations you need using a *Custom Column* expression in **M**, but one (or more) of those expressions aren't available to click or add in the UI.

Using the **add column from example** feature is easy and straightforward. In the next few sections, we see just how easy it is.

## Use Query Editor to add a new column from examples

To create a new column from an example, launch **Query Editor**. You can do this by selecting **Edit Queries** from the **Home** ribbon in **Power BI Desktop**.

![](media/powerbi-desktop-add-column-from-example/add-column-from-example_02.png)

In this article, we'll use data from the following Wikipedia article (it's a link, so you can click it to get the data for yourself and follow along):

-   [**List of states and territories of the United States**](https://wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States)

Once **Query Editor** is launched and you have some data loaded, you can get started adding a column from examples. To add a new column, in **Query Editor** select the **Add Column** tab on the ribbon and select **Column from Examples**. If you choose the drop-down, you can select either **From All Columns** (the default, if you just select the button instead of the drop-down) or select **From Selection**. In this article, we'll walk through selecting **From All Columns**.

![](media/powerbi-desktop-add-column-from-example/add-column-from-example_03.png)

## The Add Column From Examples pane

Once you make a selection to add a new column from examples, a new pane appears that shows the columns in the current table (you may need to scroll to see them all). The new **Column1** is also shown to the right, which is the column that **Power BI Desktop** will create based on your examples. Below the new **Column1** header are blank cells, where you can type in your examples that Power BI uses to create rules and transformations to match your example.

Notice too that this is an **Applied Step** in the **Query Settings** pane. As always, **Query Editor** will record your transformation steps and apply them to the query, in order.

![](media/powerbi-desktop-add-column-from-example/add-column-from-example_04.png)

This is called the **Add Columns From Examples** pane, and it consists of four primary areas:

1.  The **Command bar** which includes a brief description of the feature, or the transformation.
2.  The **Send Feedback** option to help Power BI improve this feature.
3.  The **OK** and **Cancel** buttons, which lets you commit your transformations and add the column, or cancel.
4.  The new column area, where you can type your sample values in any of the rows (to provide Power BI with your example), relating to other columns in that row.

![](media/powerbi-desktop-add-column-from-example/add-column-from-example_05.png)

As you type your example in the new column, Power BI gives you a preview of how the column it's creating will appear, based on the transformations it detects. For example, we typed *Alabama* in the first row, corresponding to the *Alabama* value in the first column of the table. As soon as we hit *Enter* Power BI fills in the column based on that value.

But then we went to the row that included *Massachusetts[E]* and deleted that last *[E]* portion (because we didn't want it) and Power BI detected the change, and used the example to create a transformation. Notice the explanation of the transform in the upper middle pane.

![](media/powerbi-desktop-add-column-from-example/add-column-from-example_06.png)

As you continue to provide examples, **Query Editor** adds to the transformations. When you're satisfied, you can select **OK** to commit your changes.


## See Add Column from Examples in action

Want to see this working? The following video shows this feature being put to use, using the data source provided earlier in this example. Take a look, and follow along for yourself!

<iframe width="560" height="315" src="https://www.youtube.com/embed/-ykbVW9wQfw" frameborder="0" allowfullscreen></iframe>

## Considerations and limitations

There are many transformations that are available when using **Add column from Examples**, but not every transformation is included. The following list provides all the transformations that *are* supported.


-   **Reference**
    -   Reference to a specific column (including trim and case transformations)


-   **Text transformations**
    -   Text.Combine (supports combination of literal strings and entire column values)
    -   Text.Replace
    -   Text.Start
    -   Text.Middle
    -   Text.End
    -   Text.BeforeDelimiter
    -   Text.AfterDelimiter
    -   Text.BetweenDelimiters

    > **Note:** All *Text* transformations take into account the potential need to trim or apply a case transformation to the column value.

-   **Date transformations**
    -   Date.Day
    -   Date.DayOfWeek
    -   Date.DayOfWeekName
    -   Date.DayOfYear
    -   Date.Month
    -   Date.MonthName
    -   Date.QuarterOfYear
    -   Date.WeekOfMonth
    -   Date.WeekOfYear
    -   Date.Year


-   The following supported **Date transformations** are available beginning with the June 2017 **Power BI Desktop** release:
    -   Date -> Age
    -   Date -> Year -> Start of Year
    -   Date -> Year -> End of Year
    -   Date -> Month -> Start of Month
    -   Date -> Month -> End of Month
    -   Date -> Quarter -> Start of Quarter
    -   Date -> Month -> Days in Month
    -   Date -> Quarter -> End of Quarter
    -   Date -> Week -> Start of Week
    -   Date -> Week -> End of Week
    -   Date -> Day -> Day of Month
    -   Date -> Day -> Start of Day
    -   Date -> Day -> End of Day


-   **Time transformations**
    -   Time.Hour
    -   Time.Minute
    -   Time.Second

    > **Note:** All *Date* and *Time* transformations take into account the potential need to convert the column value to *Date* or *Time* or *DateTime*.

    -   **Other transformations** (added with the June 2017 **Power BI Desktop** release)
        -   Format -> Clean
        -   Extract -> Length
