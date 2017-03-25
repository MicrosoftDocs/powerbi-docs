<properties
   pageTitle="Add Power BI report parameters using the url"
   description="Filter a report using URL query string parameters, even filter on more than one field."
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   featuredVideoId=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/23/2017"
   ms.author="mihart"/>

# Filter a report using query string parameters in the URL

When you open a report in Power BI service, each page of the report has its own unique URL. To filter that report page, you could use the Filters pane on the report canvas.  Or you could add query string parameters to the URL to filter the report. Perhaps you have a report you'd like to show colleagues and you want to pre-filter it for them. One way to do this is to start with the default URL for the report, add the filter parameters to the URL, and then email them the entire URL.

![](media/powerbi-service-url-filters/power-bi-report2.png)

##  Query string parameter syntax for filtering
The syntax is fairly straightforward; start with the report URL, add a question mark, and then add your filter syntax.

URL?filter=***Table***/***Field*** eq '***value***'

![](media/powerbi-service-url-filters/power-bi-filter-urls7b.png)

- **Table** and **Field** names are case sensitive, **value** is not.
- Fields that are hidden from report view can still be filtered.
- **Value** has to be enclosed with single quotes.
- Field type has to be .
- Table and field names cannot have any spaces.

If it's still confusing, continue reading and we'll break it down.  

##  Filter on a field
Let’s assume that the URL to our report is the following.

![](media/powerbi-service-url-filters/power-bi-filter-urls6.png)

And we see in our map visualization (above) that we have stores in North Carolina.

>**Note**: This example is based on the [Retail Analysis sample](powerbi-sample-datasets.md).

To filter the report to show data only for stores in "NC" (North Carolina), append the URL with the following;

?filter=Store/Territory eq 'NC'

![](media/powerbi-service-url-filters/power-bi-filter-urls7.png)

>**Note**: *NC* is a value stored in the **Territory** field of the **Store** table.

Our report is filtered for North Carolina; all the visualizations on the report page show data for only North Carolina.

![](media/powerbi-service-url-filters/power-bi-report4.png)
 
 
##  Filter on multiple fields
By default, you can only filter on a single field with the query string. But you may have situations where you want to filter on multiple fields. One way to do this is by creating a calculated column that concatenates two fields to a single value. Then you can filter on that value.

For example, we have two fields: Territory and Chain. In Power BI Desktop, [create a new Calculated column](powerbi-desktop-tutorial-create-calculated-columns.md) (Field) called TerritoryChain. Remember that the **Field** name cannot have any spaces. Here is the DAX formula for that column.

TerritoryChain = [Territory] & " - " & [Chain]

Publish the report to Power BI service and then use the URL query string to filter to display data for only Lindseys stores in NC.

https://app.powerbi.com/groups/me/reports/8d6e300b-696f-498e-b611-41ae03366851/ReportSection3?filter=Store/TerritoryChain eq 'NC–Lindseys'

##  Pin a tile from a filtered report
Once we've filtered the report using query string parameters, we can pin visualizations from that report to our dashboard. The tile on the dashboard will display the filtered data and selecting that dashboard tile will open the report that was used to create it.  However, the filtering we did using the URL is not saved with the report and when the dashboard tile is selected, the report opens in its unfiltered state.  This means that the data displayed in the dashboard tile will not match the data displayed in the report visualization.

There may be some cases where this will be helpful from an end user experience when interacting between the dashboard and reports.

##  Limitations and troubleshooting

There are a couple of things to be aware of when using the query string parameters.
- Query string filtering does not work with [Publish to web](powerbi-service-publish-to-web) URLs.
- Field type has to be string.  
- Table and field names cannot have any spaces.  

## See also  
[Reports in Power BI](powerbi-service-reports.md)  
[Add a visualization to a report](https://powerbi.uservoice.com/knowledgebase/articles/441777)  
[Visualization types in Power BI](powerbi-service-visualization-types-for-reports-and-q-and-a.md)
[ Pin a visualization to a dashboard](powerbi-service-pin-a-tile-to-a-dashboard-from-a-report.md)  
[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)  
[Try it out -- it's free!](https://powerbi.com/)

More questions? [Try the Power BI Community](http://community.powerbi.com/)  
