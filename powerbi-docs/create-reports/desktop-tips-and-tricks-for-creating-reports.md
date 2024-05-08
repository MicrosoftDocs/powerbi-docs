---
title: Tips and tricks for creating reports in Power BI
description: Learn the best practices, tips, and tricks for building reports in the Power BI service and Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: willthom
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/07/2024
---
# Tips and tricks for creating reports in Power BI Desktop

To get the most out of your data, sometimes you need a little extra help. This article has tips & tricks you can use when creating reports in the Microsoft Power BI Desktop. These tips also work in Microsoft Excel 2016, or Excel 2013 Pro-Plus editions with the Power Pivot add-in enabled and Power Query installed and enabled.

## Learn to use the Query Editor

Query Editor in Power BI Desktop is similar to the Power Query add-in capability in Excel 2013. While there are several helpful articles in Power BI Support, you might also want to review the Power Query documentation on support.office.com to get started.

You can get additional information from the [Power Query Resource Center](https://support.office.com/article/Microsoft-Power-Query-for-Excel-Help-2b433a85-ddfb-420b-9cda-fe0e60b82a94).

You can also view the [Formula Reference](https://support.office.com/Article/Learn-about-Power-Query-formulas-6bc50988-022b-4799-a709-f8aafdee2b2f).

## Data types in Query Editor

Query Editor in Power BI Desktop loads data by doing a best guess data type detection. With formulas, sometimes data type settings on columns aren't preserved. Ensure the data type of columns are correct after doing the following operations: Load data initially to the Power Query Editor, First Row as Header, Add column, Group by, Merge, Append, and before pressing loading the data for the first time.

One key thing to remember: italics in the data grid don't mean the data type is correctly set, they just mean the data isn't considered as Text.

## Reference queries in the Query Editor

In Query Editor's navigator in Power BI Desktop, when you right-click one of the queries, an option for **Reference** is available. This is useful for the following reason:

* When you use files as the data source for a query, the absolute path to the file is stored in the query. When you share or move a Power BI Desktop file or Excel workbook, you save time when you update the paths by updating the file or workbook once rather than updating the paths.

By default, all queries load to the data model. Some queries are intermediary steps and not intended for end users. When you reference queries as mentioned previously, this is often the case. You can control query loading behavior by right-clicking the query in the **Navigator** and toggling the **Enable Load** option. When **Enable Load** doesn't have a checkmark next to it, the query is still available in the **Power Query Editor**, and you can use it with other queries. It's especially useful in combination with Merge, Append, and Reference transforms. However, since the query results aren't loaded to the data model, the query won't clutter your reports field list or your data model.

## Scatter charts need a point identifier

Take an example of a simple table of Temperatures and the Time the reading was taken. If you plot directly on a scatter chart, Power BI aggregates all the values into a single point. To show individual data points, you must add a field to the Details bucket in the field list. A simple way to do this in Power BI Desktop is on the **Power Query Editor** by using the **Add index column** option on the **Add Column** ribbon.

## Reference lines in your report

You can use a calculated column in Power BI Desktop to define a reference line. Identify the table and column on which you want to create a reference line. On the **Home tab** select **New Column** in the ribbon, and in the formula bar, type the following formula:

```console
Target Value = 100
```

This calculated column returns the value *100* regardless of where it's used. Your new column shows up in the Field List. Add the Target Value calculated column to a line chart to show how any series relates to that specific reference line.

## Sort by another column

When you use a categorical (string) value in Power BI for chart axes or in a slicer or filter, the default order is alphabetical. If you need to override this order&mdash;for example, for things like days of the week or months&mdash;then you can tell Power BI Desktop to sort by a different column. For more information, see [Sort one column by another column in Power BI](desktop-sort-by-column.md).

## Build maps more easily with hints to Bing

Power BI integrates with Bing to provide default map coordinates, in a process called geo-coding, so it's easier for you to create maps. Bing uses algorithms and hints to try to get the right location, but it's a best guess. To increase the likelihood of correct geo-coding, you can use the following tips:

When you create a map, you're often looking to plot countries/regions, states, and cities. In Power BI Desktop, if you name columns after the geographic designation, Bing is better able to find what you're looking to display. For example, if you have a field of US state names such as "California" and "Washington" Bing might return the location of Washington, DC instead of Washington state for the word "Washington". Naming the column "State" improves the geo-coding. The same goes for columns named "Country or Region" and "City".

Some designations are ambiguous when considered in the context of multiple countries/regions. In some cases, what one country/region considers a 'state' is treated as a 'province', a 'county', or some other designation. You can increase the accuracy of geo-coding by building columns that append multiple fields together and use those for plotting data locations. An example would be instead of passing only "Wiltshire", you can pass "Wiltshire, England" to get a more accurate geo-coding result.

You can always provide specific latitude and longitude locations in Power BI Desktop or the Power BI service. When you do this, you also need to pass a Location field. Otherwise, the data is aggregated by default, so the location of the latitude and longitude might not match what you expected.

## Categorize geographic fields to hint Bing's geo-coding

Another way to ensure fields are correctly geo-coded is by setting the Data Category on the data fields. In Power BI Desktop, select the desired table, go to the Advanced ribbon, and then set the Data Category to Address, City, Continent, Country/Region, Postal Code, State, or Province. These data categories help Bing to correctly encode the data. To learn more, see [Specify data categories in Power BI Desktop](../transform-model/desktop-data-categorization.md).

## Better geo-coding with more specific locations

Sometimes, even setting the data categories for mapping is insufficient. Build a more specific location like a street address by using the Query Editor in Power BI Desktop. Use the *Add Column* feature to build a custom column. Then build the desired location as follows:

```console
= [Field1] & " " & [Field2]
```

Then use this resulting field in the map visualizations. This is useful for building street addresses from shipping address fields that are common in data sets. One note is that the concatenation only works with text fields. If needed, convert the street number to a text data type before you use it to build an address.

## Histograms in the query stage

There are several ways to build histograms in Power BI Desktop:

Simplest Histograms: Determine which query has the field you want to build a histogram on. Use the **Reference** option for the query to create a new query and name it **FieldName Histogram**. Use the **Group by** option in the **Transform** ribbon and select the **count rows** aggregate. Ensure the data type is a number for the resulting aggregate column. Then visualize this data on the reports page. This histogram is fast and easy to build, but it doesn't work well if you have many data points, and it doesn't allow brushing across visuals.

Defining buckets to build a histogram: Determine which query has the field you want to build a histogram on. Use the **Reference** option for the query to create a new query and name it **FieldName**. Now define the buckets with a rule. Use the *Add Custom Column* option on the **Add Column** ribbon and build a custom rule. A simple bucketing rule might look like this:

```console
if([FieldName] \< 2) then "\<2 min" else
if([FieldName] \< 5) then "\<5 min" else
if([FieldName] \< 10) then "\<10 min" else
if([FieldName] \< 30) then "\<30 min" else
"longer")
```

Ensure the data type is a number for the resulting aggregate column. Now you can use the group by technique described in Simplest Histogram to achieve the histogram. This option handles more data points but still doesn't help with brushing.

Defining a histogram that supports brushing: Brushing is when visuals are linked together so that when a user selects a data point in one visual, other visuals on the report page highlight or filter data points related to the selected data point. Since you're manipulating data at query time, you need to create a relationship between tables and ensure you know which detail item relates to the bucket in the histogram and vice-versa.

Start the process by using the **Reference** option on the query that has the field you want to build a histogram on. Name the new query "Buckets". For this example, let's call the original query **Details**. Next remove all columns except the column you want to use as the bucket for the histogram. Now use the **Remove Duplicates** feature in query. The feature is on the **right+click** menu when you select the column, so the remaining values are the unique values in the column. If you have decimal numbers, you can first use the tip for defining buckets to build a histogram to get a manageable set of buckets. Now, check the data shown in the query preview. If you see blank values or null, you need to fix those before creating a relationship. The use of this approach can be problematic due to the need to sort.

>[!NOTE]
>It's useful to think about the sort order before building any visuals.

The next step in the process is to define a relationship between the **Buckets** and **Details** queries on the buckets column. In Power BI Desktop, select **Manage Relationships** in the ribbon. Create a relationship where Buckets is in the left table and Details in on the right table and select the field you're using for the histogram.

The last step is to create the histogram. Drag the Bucket field from the **Buckets** table. Remove the default field from the resulting column chart. Now from the **Details** table, drag the histogram field into the same visual. In the field list, change the default aggregate to Count. The result is the histogram. If you create another visual like a treemap from the Details table, select a data point in treemap to see the histogram highlight and show the histogram for the selected data point relative to the trend for the entire data set.

## Histograms

In Power BI Desktop, you can use a calculated field to define a Histogram. Identify the table and column onto which you want to create a histogram. In the calculation area, type the following formula:

> Frequency:=COUNT(\<Column Name\>)
>
>

Save your changes and return to your report. Add the \<Column Name\> and the Frequency to a table then convert to a bar chart. Ensure the \<Column Name\> is on the x-axis and the calculated field Frequency is on the y-axis.

## Tips and tricks for creating relationships in Power BI Desktop

Often, when you load detail data sets from multiple sources, issues like null values, blank values, or duplicate values prevent you from creating relationships.

Let's look at an example with loaded data sets of active customer support requests and another data set of work items that have schemas as follows:

> CustomerIncidents: {IncidentID, CustomerName, IssueName, OpenedDate, Status}
> WorkItems: {WorkItemID, IncidentID, WorkItemName, OpenedDate, Status, CustomerName }
>
>

When tracking all incidents and work items that relate to a specific CustomerName, you can't just create a relationship between these two data sets. Some WorkItems might not be related to a CustomerName, so that field would be blank or NULL. There might be multiple records in WorkItems and CustomerIncidents for any given CustomerName.

### Create relationships in Power BI Desktop when the data has null or blank values

Often, data sets contain columns with null or blank values. This can cause problems when trying to use relationships. You essentially have two options for addressing the issues.

1. You can remove the rows that have null or blank values. You can do this by using either the filter feature in the Power Query Editor or, if you're merging queries, by selecting the "keep only matching rows" option.
1. Alternatively, you can replace the null or blank values with values that work in relationships, typically strings like "NULL" and "(Blank)".

There's no right approach here. Filtering out rows at the query stage removes rows and can affect summary statistics and calculations. Replacing values preserves data rows but can make unrelated rows appear related in the model leading to miscalculations. If you adopt this second option, ensure you use filters at the View/Chart where appropriate to ensure you're getting accurate results. Most importantly, evaluate which rows are kept/removed, and understand the overall effect on the analysis.

### Create relationships in Power BI Desktop when the data has duplicate values

Often, when you load detailed data sets from multiple sources, duplicate data values prevent you from creating relationships. You can overcome this by creating a dimension table with the unique values from both data sets.

Let's look at an example with loaded data sets of active customer support requests and another data set of work items that have schemas as follows:

> CustomerInicdents: {IncidentID, CustomerName, IssueName, OpenedDate, Status}
> WorkItems: {WorkItemID, IncidentID, WorkItemName, OpenedDate, Status, CustomerName }
>
>

When tracking all incidents and work items that relate to a specific CustomerName, you can't just create a relationship between these two data sets. Some WorkItems might not be related to a CustomerName, so that field would be blank or NULL. If you have any blank values or null in the CustomerNames table, you might still not be able to create a relationship. There might be multiple WorkItems and CustomerIncidents for a single CustomerName.

To create a relationship in this case, first create a logical data set of all the CustomerNames across the two data sets. In the Power Query Editor, you can use the following sequence to create the logical data set:

1. Duplicate both queries, naming the first **Temp** and the second **CustomerNames**.
1. In each query, remove all columns *except* the CustomerName column
1. In each query, use **Remove Duplicate**.
1. In the **CustomerNames** query, select the **Append** option in the ribbon, select the query **Temp**.
1. In the **CustomerNames** query, select **Remove Duplicates**.

Now you have a dimension table that you can use to relate to *CustomerIncidents* and *WorkItems* that contains all the values of each.

## Patterns to jump-start your use of the Query Editor

Query Editor is powerful in how it can manipulate, shape, and clean data so that the data is ready to be visualized or modeled. There are a few patterns you should be aware of

### Temporary columns can be deleted after computing a result

Often you need to build a calculation in Power BI Desktop that transforms data from multiple columns into single new column. This can be complex. One easy way to overcome the problem is to decompose the operation into steps.

* Duplicate the initial columns.
* Build the temporary columns.
* Create the column for the final result.
* Delete the temporary columns so the final data set isn't cluttered.

This is possible because the Power Query Editor  executes steps in order.

### Duplicate or Reference queries followed by merge to original query

Sometimes it's useful to compute summary statistics for a data set. The easy way to do this is to duplicate or reference the query in the Power Query Editor. Then use **Group by** to compute the summary statistics. Summary statistics help you normalize the data in the original data, so they're more comparable. This is especially useful for comparing individual values to the whole. To do this, go to the original query and select the **merge** option. Then merge the data from the summary statistics query matching on the appropriate identifiers. Now you're ready to normalize the data as needed for your analysis.

## Use DAX for the first time

DAX is the calculations formula language in Power BI Desktop. It's optimized for BI analytics. It's a little different than what you might be familiar with if you've only used a standardized query language like SQL. There are good resources online and in literature for learning DAX.

[Learn DAX Basics in Power BI Desktop](../transform-model/desktop-quickstart-learn-dax-basics.md)

[Data Analysis Expressions (DAX)](/dax/)

[DAX Resource Center](https://social.technet.microsoft.com/wiki/contents/articles/1088.dax-resource-center.aspx)

## Power BI service *and* Power BI Desktop

### Read or watch "How to design visually stunning reports (and dashboards)"

Community member Miguel Myers is a data scientist and a graphic designer.

:::image type="content" source="media/desktop-tips-and-tricks-for-creating-reports/power-bi-reports.png" alt-text="Screenshot showing an example Power BI report.":::

* [Read the blog](https://powerbi.microsoft.com/blog/how-to-design-visually-stunning-reports/)
* [Watch the webinar](https://community.powerbi.com/t5/Webinars-and-Video-Gallery/5-3-17-Webinar-How-to-Design-Visually-Stunning-Power-BI-Reports/m-p/168204?Is=Website)

### Consider your audience

What are the key metrics that will help your audience make decisions? How will the report be used? What learned or cultural assumptions might affect design choices? What information does your audience need to be successful?

Where is the report going to be displayed? If it will be on a large monitor, you can put more content on it. If readers will view it on their tablets, then fewer visualizations are more readable.

### Tell a story and keep it to one screen

Each report page should tell a story at a glance. Can you avoid scroll bars on your pages? Is the report too cluttered or too busy? Remove all but essential information that can be easily read and interpreted.

### Make the most important information biggest

If the text and visualizations on your report page are all the same size, your readers will have a hard time focusing on what's most important. For example, card visualizations are a good way to display an important number prominently:

:::image type="content" source="media/service-dashboards-design-tips/pbi_card.png" alt-text="Screenshot showing a card visualization.":::

### But be sure to provide context

Use features such as textboxes and tooltips to add context to your visualizations.

### Put the most important information in the upper corner

Most people read from top to bottom, so put the highest level of detail at the top, and show more detail as you move in the direction the audience uses for reading (left-to-right, right-to-left).

### Use the right visualization for the data and format it for easy reading

Avoid visualization variety for the sake of variety. Visualizations should paint a picture and be easy to "read" and interpret. For some data and visualizations, a simple graphic visualization is enough. However, other data might call for a more-complex visualization&mdash;be sure to make use of titles and labels and other customization to help the reader.

* Be careful when you use charts that distort reality, such as 3-D charts and charts that don't start at zero. Keep in mind that it's more difficult for the human brain to interpret circular shapes. Pie charts, donut charts, gauges and other circular chart types might look pretty but perhaps there's a different visual you can use instead?
* Be consistent with chart scales on axes, chart dimension ordering and also the colors used for dimension values within charts.
* Be sure to encode quantitative data nicely. Don’t exceed three or four numerals when displaying numbers. Display measures to one or two numerals left of the decimal point and scale for thousands or millions. For example, 3.4 million not 3,400,000.
* Try to avoid mixing levels of precision and time. Make sure that time frames are well understood. Don’t have one chart that has last month next to filtered charts from a specific month of the year.
* Also try to avoid mixing large and small measures on the same scale, such as on a line or bar chart. For example, one measure can be in the millions and the other measure in the thousands. With such a large scale, it's difficult to see the differences of the measure that's in the thousands. If you need to mix, choose a visualization like a combo chart that allows the use of a second axis.
* Avoid cluttering your charts with data labels that aren't needed. The values in bar charts, if large enough, are usually understood without displaying the actual number.
* Pay attention to how [charts are sorted](../consumer/end-user-change-sort.md). If you want to draw attention to the highest or lowest number, sort by the measure. If you want people to be able to quickly find a particular category within many other categories, sort by the axis.
* Pie charts are best if they have fewer than eight categories. Because you can't compare values side by side, it’s harder to compare values in a pie chart than in bar and column charts. Pie charts can be good for viewing part-to-whole relationships rather than for comparing the parts. Gauge charts are great for displaying the current status in the context of a goal.

For more visualization-specific guidance, see [Visualization types in Power BI](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md).

### Learn more about Best Practice Dashboard Design

A few of our favorite books include:

* *Storytelling with Data* by Cole Nussbaumer Knafic
* *Data points* by Nathan Yau
* *The truthful Art* by Alberto Cairo
* *Now You See It* by Stephen Few
* *Envisioning Information* by Edward Tufte
* *Advanced Presentations Design* by Andrew Abela

## Related content

* [Design effective reports in Power BI](/training/paths/power-bi-effective/)
* [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)
* [Reports in Power BI](../consumer/end-user-reports.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
