---
title: Add Power BI report parameters using the url
description: Filter a report using URL query string parameters, even filter on more than one field.
services: powerbi
documentationcenter: ''
author: mihart
manager: kfile
backup: ''
editor: ''
tags: ''
featuredvideoid: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 02/28/2018
ms.author: mihart

LocalizationGroup: Reports
---
# Filter a report using query string parameters in the URL
When you open a report in Power BI service, each page of the report has its own unique URL. To filter that report page, you could use the Filters pane on the report canvas.  Or you could add query string parameters to the URL to filter the report. Perhaps you have a report you'd like to show colleagues and you want to pre-filter it for them. One way to do this is to start with the default URL for the report, add the filter parameters to the URL, and then email them the entire URL.

![Power BI report in the service](media/service-url-filters/power-bi-report2.png)

<iframe width="640" height="360" src="https://www.youtube.com/embed/WQFtN8nvM4A?list=PLv2BtOtLblH3YE_Ycas5B1GtcoFfJXavO&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

## Query string parameter syntax for filtering
The syntax is fairly straightforward; start with the report URL, add a question mark, and then add your filter syntax.

URL?filter=***Table***/***Field*** eq '***value***'

![URL with filter](media/service-url-filters/power-bi-filter-urls7b.png)

* **Table** and **Field** names are case sensitive, **value** is not.
* Fields that are hidden from report view can still be filtered.
* **Value** has to be enclosed with single quotes.
* Field type has to be a number or string
* Table and field names cannot have any spaces.

If it's still confusing, continue reading and we'll break it down.  

## Filter on a field
Let’s assume that the URL to our report is the following.

![starting URL](media/service-url-filters/power-bi-filter-urls6.png)

And we see in our map visualization (above) that we have stores in North Carolina.

>[!NOTE]
>This example is based on the [Retail Analysis sample](sample-datasets.md).
> 

To filter the report to show data only for stores in "NC" (North Carolina), append the URL with the following;

?filter=Store/Territory eq 'NC'

![URL with filter](media/service-url-filters/power-bi-filter-urls7.png)

>[!NOTE]
>*NC* is a value stored in the **Territory** field of the **Store** table.
> 
> 

Our report is filtered for North Carolina; all the visualizations on the report page show data for only North Carolina.

![](media/service-url-filters/power-bi-report4.png)

## Filter on multiple fields
You can also filter on multiple fields by adding additional parameters to your URL. Let's go back to our original filter parameter.

```
?filter=Store/Territory eq 'NC'
```

To filter on additional fields, add an `and` and another field in the same format as above. Here is an example.

```
?filter=Store/Territory eq 'NC' and Store/Chain eq 'Fashions Direct'
```

<iframe width="640" height="360" src="https://www.youtube.com/embed/0sDGKxOaC8w?showinfo=0" frameborder="0" allowfullscreen></iframe>


### Using DAX to filter on multiple values
Another way to filter on multiple fields is by creating a calculated column that concatenates two fields to a single value. Then you can filter on that value.

For example, we have two fields: Territory and Chain. In Power BI Desktop, [create a new Calculated column](desktop-tutorial-create-calculated-columns.md) (Field) called TerritoryChain. Remember that the **Field** name cannot have any spaces. Here is the DAX formula for that column.

TerritoryChain = [Territory] & " - " & [Chain]

Publish the report to Power BI service and then use the URL query string to filter to display data for only Lindseys stores in NC.

https://app.powerbi.com/groups/me/reports/8d6e300b-696f-498e-b611-41ae03366851/ReportSection3?filter=Store/TerritoryChain eq 'NC–Lindseys'

## Pin a tile from a filtered report
Once you've filtered the report using query string parameters, you can pin visualizations from that report to your dashboard. The tile on the dashboard will display the filtered data and selecting that dashboard tile will open the report that was used to create it.  However, the filtering you did using the URL is not saved with the report and when the dashboard tile is selected, the report opens in its unfiltered state.  This means that the data displayed in the dashboard tile will not match the data displayed in the report visualization.

There may be some cases where this will be helpful when you'd like to see different results; filtered on the dashboard and unfiltered in the report.

## Limitations and troubleshooting
There are a couple of things to be aware of when using the query string parameters.

* Query string filtering does not work with [Publish to web](service-publish-to-web.md) or Power BI Embedded.   
* Field type has to be number or string.
* Table and field names cannot have any spaces.

## Next steps
[Pin a visualization to a dashboard](service-dashboard-pin-tile-from-report.md)  
[Try it out -- it's free!](https://powerbi.com/)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

