<properties
   pageTitle="Aggregates (sum, average, maximum, etc.) in Power BI"
   description="Change the aggregation in a chart (sum, average, maximum, etc.) in Power BI"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="modifying"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/15/2016"
   ms.author="mihart"/>

# Aggregates in Power BI  

## What is an aggregate?

A numeric field is a value that will be aggregated (summed or averaged, for example).  These are often referred to as **measures**. Measures in Power BI are imported with the data (defined in the data model your report is based on). In the Fields list, measures are shown with the ∑ symbol. For more information see [The report editor... take a tour](powerbi-service-the-report-editor-take-a-tour.md).

## Change how a numeric field is aggregated

Say you have a chart that sums the sales data for different regions, but you'd rather have the average. 

1.  In report Editing view, add the measure to a visualization.

2.  Find that field in the Visualizations pane, right-click, and select the aggregate type you need. If you don't see the aggregation you need, contact the dataset owner. It could be an issue with how the field was categorized by the owner.  

    ![](media/powerbi-service-change-the-aggregation-in-a-chart/aggregate_new.png)

    >[AZURE.NOTE]   The options available in the dropdown will vary depending on 1) the field selected and 2) the way that field was categorized by the dataset owner.

Some of the options that may be available for aggregating a field:

-   **Do Not Summarize**. With this option chosen, each value in that field is treated separately and not summarized. This is often used if you have a numeric ID column that shouldn't be summed.

-   **Sum**. This adds all the values in that field up.

-   **Average**. Takes an arithmetic mean of the values.

-   **Minimum**. Shows the smallest value.

-   **Maximum**. Shows the largest value.

-   **Count (Not Blanks).** This counts the number of values in that field that are not blank.

-   **Count (Distinct).** This counts the number of different values in that field.

- **Standard deviation.**

- **Variance**.

- **Median**.  Shows the median (middle) value. This is the value that has the same number of items above and below.  If there are 2 medians, Power BI averages them.


For example, this data:

| Country   | Amount |
|:----------|:-------|
| USA       | 100    |
| UK        | 150    |
| Canada    | 100    |
| Germany   | 125    |
| France    |        |
| Japan     | 125    |
| Australia | 150    |

Would give the following results:

-   **Do Not Summarize**: Each value is shown separately

-   **Sum**: 750

-   **Average**: 125

-   **Maximum**:  150

-   **Minimum**: 100

-   **Count (Not Blanks):** 6

-   **Count (Distinct):** 4

- **Standard deviation:** 20.4124145...

- **Variance:** 416.666...

- **Median:** 125


## Use a non-aggregated field as a numeric field

You can also use a non-aggregated field as a numeric field. For example, if you have a Product Name field, you can add it as a value and then set it to **Count** or **Distinct count**. 

1.  For example, if you select **Store > Chain**.

    ![](media/powerbi-service-aggregates/count-of-chain-do_not_summarize.png)

2.  And if you change the aggregation from the default **Do not summarize** to **Count (Distinct)**, Power BI counts the number of different chains. In this case, there are 2: Fashions Direct and Lindseys.

    ![](media/powerbi-service-aggregates/aggregates_count.png)

3.  And if you change the aggregation to **Count**, Power BI counts the total number. In this case, there are 104 entries for **Chain**. By adding **Chain** as a filter, you can see that there are 37 rows for Fashions Direct and 67 rows for Lindseys.  

    ![](media/powerbi-service-aggregates/count_of_chain_104.png)

##  Tips and Troubleshooting
-   If your dropdown only lists **count** and/or **distinct count**, that means the data is not a numeric field.  This could be because it is actually non-numeric or because the dataset owner did not "categorize" the field as numeric (on purpose or as an oversight). For example, if a dataset has a **year** field, the dataset owner may categorize that as text because it is more likely that the **year** field will be counted (i.e., number of people born in 1974) and not that it will be summed or averaged.

-   You cannot re-categorize fields in Power BI service. 

-   You can re-categorize fields in Power BI Desktop.

-   To remove an aggregation, from the dropdown select a different aggregation.  If "Do not sum" is not an option, try removing the field and adding it back in. 




More questions? [Try the Power BI Community](http://community.powerbi.com/)
