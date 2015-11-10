<properties
   pageTitle="Retail Analysis sample for Power BI: Take a tour"
   description="Retail Analysis sample for Power BI: Take a tour"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/18/2015"
   ms.author="mihart"/>

# Retail Analysis sample for Power BI: Take a tour

This industry sample dashboard and underlying report analyze retail sales data of items sold across multiple stores and districts. The metrics compare this year’s performance to last year’s in these areas:  sales, units, gross margin, and variance, as well as new store analysis. This is real data from obviEnce ([www.obvience.com](http://www.obvience.com)) that has been anonymized.

[Download the Retail Analysis sample content pack](powerbi-sample-tutorial-connect-to-the-samples.md), with a dashboard, report, and dataset.

You can also [download just the dataset (Excel workbook) for this sample](http://go.microsoft.com/fwlink/?LinkId=528592).

![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_newDash.png)

1.  On the dashboard, select the "Total Stores" tile:

    ![](media/powerbi-sample-retail-analysis-take-a-tour/retail-analysis-7.png)  

    This takes you to the "Store Sales Overview" page in the report. You see we have 104 total stores, 10 of them new. We have two chains, Fashions Direct and Lindseys. Fashions Direct stores are larger on average.

2.  In the doughnut chart, select **Fashions Direct**.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_donut.png)  

    Notice the result in the bubble chart:

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlBubbles.png)  

    FD-01 district has the highest Average Sales per Square Foot, FD-02 has the lowest Variance in Sales compared to last year, FD-03 and FD-04 are worst performers overall.

3.  Select individual bubbles or other charts to see cross highlighting, revealing the impact of your selections.

4.  Select Power BI in the top navigation bar to return to the dashboard.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/retail-analysis.png)

5.  On the dashboard, select the tile that has "This Year’s Sales."

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlThisYrSales.png)

    This is equivalent to typing "This year sales" in the question box.

    You see this screen:

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_QnA.png)

Let’s get more specific.

1.  Add “this year sales **by district**” onto the question. Observe the result: It automatically put the answer in a bar chart and suggests other phrases:

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlQnABar.png)

2.  Now change the question to “this year sales **by zip and chain**”.

    Notice how it answers the question as you type with the appropriate charts.

3.  Play around with more questions and see what kind of results you get.

4.  When you’re ready, return to the dashboard by selecting Power BI in the upper-left corner.

Now let's explore on a more detailed level, looking at the districts' performances.

1.  On the dashboard, select the tile comparing this year's sales to last year’s.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlAreaCht.png)

    Notice the large variability on Variance % to last year, with Jan, Apr, and Jul being particularly bad months.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlSalesVarCol.png)

    Let’s see if we can narrow down where the issues might be.

2.  Select the bubble chart, and choose **020-Mens**.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlMensXfltr.png)  

    Observe the men's category wasn't as severely affected in April as the business overall, but January and July were still problem months.

3.  Now, select the **010-Womens’ bubble**.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlWomensXfilter.png)

    Notice the women's category performed much worse than business overall across all months, and much worse in almost every month compared to the previous year.

4.  Select the bubble again to clear the filter.

Let’s look at how specific districts are doing.

1.  Select Allan Guinot in the slicer on the top left.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlAllanAll.png)

    Note that Allan’s district outperformed Last Year in March and June.

2.  Now, while Allan is still selected, select the Women’s bubble.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/PBI_Sample_RetAnlAllanWomen.png)

    Note that for the Women’s category, his district never met last year’s volume.

3.  3.Explore the other district managers and categories – what other insights can you find?

4.  When you are ready – return to the dashboard.

The last area we want to explore is our growth – new stores opened this year.

1.  Select the 'Stores Opened This Year’ tile.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/retail-analysis-4.png)

    As evident from the tile – more Fashions Direct stores than Lindseys stores opened this year.

2.  Observe the Sales Per Sq Ft by Name chart:

    ![](media/powerbi-sample-retail-analysis-take-a-tour/15.png)

     There is quite a bit of difference in Average Sales per SQF across the new stores.

3.  Click on the Fashions Direct legend item in the bottom right chart. Notice, even for the same chain, the best store (Winchester Fashions Direct) significantly outperforms the worst store (Cincinnati 2 Fashions Direct) $21.22 vs $12.86 respectively.

    ![](media/powerbi-sample-retail-analysis-take-a-tour/17b.png)

4.  In the line chart at the bottom, click Winchester Fashions Direct in the legend. The first sales numbers were reported in February and is a leading store in terms of volume for almost every month.

5.  Click on Cincinnati 2 Fashions Direct in the line chart and you will see it was opened in June and it seems to be the worst performing store.

6.  As before, explore by clicking on other bars, lines and bubbles throughout the charts and see what insights you can discover.

This is a safe environment to play in. You can always choose not to save your changes. But if you do save them, you can always go to Get Data for a new copy of this sample.

## Next steps: Connect to your data

We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into retail data. Now it’s your turn — connect to your own data. With Power BI you can connect to a wide variety of data sources. Learn more about [getting started with Power BI](https://support.office.com/article/Get-Started-with-Power-BI-Preview-0f0237e2-f74f-49ab-82ea-1990c3c3deb8).

## See Also:

-   [Download the Retail Analysis sample content pack](powerbi-sample-tutorial-connect-to-the-samples.md)
-   [Download the Excel workbook for this Power BI sample](http://go.microsoft.com/fwlink/?LinkId=528592)
-   [Get data (for Power BI)](powerbi-service-get-data.md)
-   [Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
