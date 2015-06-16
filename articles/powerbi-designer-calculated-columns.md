<properties pageTitle="Calculated columns in Power BI Designer" description="Calculated columns in Power BI Designer" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/> 
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/16/2015" ms.author="v-anpasi"/>
#Calculated columns in Power BI Designer

[← Power BI Designer](https://support.powerbi.com/knowledgebase/topics/68530-power-bi-designer)

With calculated columns, you can add new data to a table already in your model. But instead of querying and loading values into your new column from a data source, you create a Data Analysis Expressions (DAX) formula that defines the column’s values. In Power BI Designer, calculated columns are created by using the New Column feature in Report View.

Unlike custom columns created as part of a query by using Add Custom Column in Query View, calculated columns created in Report View are based on data you’ve already loaded into the model. For example, you might choose to concatenate values from two different columns in two different but related tables , perform addition, or extract sub-strings.

Calculated columns you create appear in the Fields list just like any other field, but they’ll have a special icon showing its values are the result of a formula. You can name your columns whatever you want, and add them to a report visualization just like other fields.

 ![](media/powerbi-designer-calculated-columns/CalcColInPBID_Fields.png)

Calculated columns calculate results by using [Data Analysis Expressions](https://support.office.com/en-us/article/Data-Analysis-Expressions-DAX-Reference-411C6891-614D-438C-BF45-C7E061DD9E08) (DAX), a formula language meant to work with relational data like in Power BI Designer. DAX includes a library of over 200 functions, operators, and constructs, providing immense flexibility in creating formulas to calculate results for just about any data analysis need. To learn more about DAX, see the Additional resources section at the end of this article.

DAX formulas are similar to Excel formulas. In fact, DAX has many of the same functions as Excel. DAX functions, however, are meant to work with relational data, like in Power BI Designer. Unlike Excel, where you can have a different formula for each row in a table, when you create a DAX formula for a new column in the designer, it will calculate a result for every row in the table. Column values are recalculated as necessary, like when the underlying data is refreshed and values have changed.

##Let’s look at an example

Jeff is a shipping manager at Contoso. He wants to create a report showing the number of shipments to different cities. He has a Geography table with separate fields for city and state. But, Jeff wants his reports to show City, State as a single value on the same row. Right now, Jeff’s Geography table doesn’t have the field he wants.

![](media/powerbi-designer-calculated-columns/CalcColInPBID_CityAndStateFields.png)


But with a calculated column, Jeff can simply put together, or concatenate, the cities from the City column with the states from the State column.

Jeff right clicks on the Geography table and then clicks New Column. He then enters the following DAX formula into the formula bar:

![](media/powerbi-designer-calculated-columns/CalcColInPBID_Formula.png)


This formula simply creates a new column named CityState, and for each row in the Geography table, it takes values from the City column, adds a comma and a space, and then concatenates values from the State column.

Now Jeff has the field he wants.

![](media/powerbi-designer-calculated-columns/CalcColInPBID_CityStateField.png)


And, he can add it to his report canvas along with the number of shipments.

![](media/powerbi-designer-calculated-columns/CalcColInPBID_CityStateMap.png)


Very quickly and with minimal effort, Jeff now has a City, State field. He can add to just about any type of visualization. Jeff even sees that when he creates a map visualization, the designer even knows how to read the City, State values in his new column.

##Learn more

We’ve only provided a quick introduction to calculated columns here. Be sure to see the [Create calculated columns in Power BI Designer](https://support.powerbi.com/knowledgebase/articles/590610-tutorial-create-calculated-columns-in-power-bi-de) tutorial, where you can download a sample file and get step-by-step lessons on how to create more columns.  

To learn more about columns you create as part of a query, see the Create custom columns section in [Common query tasks in Power BI Designer](https://support.powerbi.com/knowledgebase/articles/471648-common-query-tasks-in-power-bi-designer).
