---
title: Filter a report using query string parameters in the URL
description: Filter a report using URL query string parameters, even filter on more than one field.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.date: 12/13/2021
ms.topic: how-to
LocalizationGroup: Reports
---

# Filter a report using query string parameters in the URL

When you open a report in Power BI service, each page of the report has its own unique URL. To filter that report page, you could use the Filters pane on the report canvas.  Or you could add query string parameters to the URL to pre-filter the report. Perhaps you have a report you'd like to show colleagues and you want to pre-filter it for them. One way to filter it is to start with the default URL for the report, add the filter parameters to the URL, and then email them the entire new URL.

This article uses the Retail Analysis Sample report. If you want to follow along, you can [download the sample report](../create-reports/sample-retail-analysis.md#get-the-sample).

![Screenshot of Power BI report in the service.](media/service-url-filters/power-bi-retail-analysis-sample.png)

## Uses for query string parameters

Say you're working in Power BI Desktop. You want to create a report that has links to other Power BI reports, but you want to show only some of the information in the other reports. First, filter the reports using query string parameters and save the URLs. Next, create a table in Desktop with these new report URLs.  Then publish and share the report.

Another use for query string parameters is for someone creating an advanced Power BI solution.  Using DAX, they create a report that generates a filtered report URL dynamically based on the selection their customer makes in the current report. When customers select the URL, they see only the intended information. 

## Query string parameter syntax for filtering

With parameters, you can filter the report for one or more values, even if those values contain spaces or special characters. The basic syntax is fairly straightforward; start with the report URL, add a question mark, and then add your filter syntax.

*URL*?filter=*Table*/*Field* eq '*value*'

![Screenshot of U R L with filter.](media/service-url-filters/power-bi-filter-urls7b.png)

* **Table** and **Field** names are case-sensitive, **value** isn't.
* Fields that are hidden from report view can still be filtered.

### Field types

Field type can be a number, datetime, or string and the type used must match the type set in the dataset.  For example, specifying a table column of type "string" won't work if you're looking for a datetime or numeric value in a dataset column set as a date, such as Table/StringColumn eq 1.

* **Strings** must be enclosed with single quotes, as in 'manager name'.
* **Numbers** require no special formatting. See [Numeric data types](#numeric-data-types) in this article for details.
* **Dates and times** See [Date data types](#date-data-types) in this article. 

If it's still confusing, continue reading and we'll break it down.  

## Filter on a field

Let’s assume that the URL to our report is the following.

![Screenshot of starting URL.](media/service-url-filters/power-bi-filter-urls6.png)

And we see in our map visualization above that we have stores in North Carolina. *NC* is the value that represents North Carolina in the **Territory** field of the **Store** table. So to filter the report to show data only for stores in "NC", we append this string to the URL:

```
?filter=Store/Territory eq 'NC'
```

![Screenshot of U R L with filter for North Carolina.](media/service-url-filters/power-bi-filter-urls7.png)

Our report is now filtered for North Carolina; all the visualizations in the report show data for only North Carolina.

![Screenshot of Report filtered for North Carolina.](media/service-url-filters/power-bi-url-filter-nc.png)

## Filter on more than one value in a field

To filter on more than one value in a single field, you use the **in** operator instead of the **and** operator. The syntax is:

*URL*?filter=*Table*/*Field* **in** ('*value1*', '*value2*')

Using the same example, to filter the report to show data only for stores in "NC" (North Carolina) or "TN" (Tennessee), append the URL with the following;

```
?filter=Store/Territory in ('NC', 'TN')
```

See the [Operators](#operators) table later in the article for a list of other useful operators.

## Filter on multiple fields

You can also filter on multiple fields by adding additional parameters to your URL. Let's go back to our original filter parameter.

```
?filter=Store/Territory eq 'NC'
```

To filter on additional fields, add an '**and**' and another field in the same format as above. Here is an example.

```
?filter=Store/Territory eq 'NC' and Store/Chain eq 'Fashions Direct'
```

## Operators

Power BI supports many operators in addition to '**and**'. The table below lists those operators along with the content type they support.

|operator  | definition | string  | number | Date |  Example|
|---------|---------|---------|---------|---------|---------|
|**and**     | and |  yes      | yes |  yes|  product/price le 200 and price gt 3.5 |
|**eq**     | equals |  yes      | yes   |  yes       | Address/City eq 'Redmond' |
|**ne**     | not equal |   yes      | yes  | yes        |  Address/City ne 'London' |
|**ge**     |  greater than or equal       | no | yes |yes |  product/price ge 10
|**gt**     | greater than        |no | yes | yes  | product/price gt 20
|**le**     |   less than or equal      | no | yes | yes  | product/price le 100
|**lt**     |  less than       | no | yes | yes |  product/price lt 20
|**in\***     |  including       | yes | yes |  yes | Student/Age in (27, 29)


\* When using **in**, the values to the right of **in** can be a comma-separated list enclosed in parentheses, or a single expression that returns a collection. See the [IN Operator article](/odata/webapi/in-operator) for examples.

### Numeric data types

A Power BI URL filter can include numbers in the following formats.

|Number type  |Example  |
|---------|---------|
|**integer**     |   5      |
|**long**     |   5 L or 5 l      |
|**double**     |   5.5 or 55e-1 or 0.55e+1 or 5D or 5d or 0.5e1D or 0.5e1d or 5.5D or 5.5d or 55e-1D or 55e-1d     |
|**decimal**     |   5 M or 5 m or 5.5 M or 5.5 m      |
|**float**     | 5 F or 5 f or 0.5e1 F or 0.5e-1 d        |

### Date data types

Power BI supports both OData V3 and V4 for **Date** and **DateTimeOffset** data types. For OData V3, dates must be enclosed in single quotes and be preceded by the word datetime. Single quotes and the word datetime aren't needed in OData V4. 
  
Dates are represented using the EDM format (2019-02-12T00:00:00): When you specify a date as 'YYYY-MM-DD', Power BI interprets it as 'YYYY-MM-DDT00:00:00'. Make sure month and day are two digits, MM and DD.

Why does this distinction matter? Let's say you create a query string parameter **Table/Date gt '2018-08-03'**.  Will the results include August 3, 2018 or start with August 4, 2018? Power BI translates your query to **Table/Date gt '2018-08-03T00:00:00'**. So, your results include any dates that have a non-zero time part, because those dates would be greater than **'2018-08-03T00:00:00'**.

There are other differences between V3 and V4. OData V3 does not support Dates, only DateTime. So if you use the V3 format, you must qualify it with the full date time. Date literals like "datetime'2019-05-20'" aren't supported in V3 notation. But you can just write it as "2019-05-20" in V4 notation. Here are two equivalent filter queries in V3 and V4:

- OData V4 format: filter=Table/Date gt 2019-05-20
- OData V3 format: filter=Table/Date gt datetime'2019-05-20T00:00:00'


## Special characters in URL filters

### Special characters in table and column names

Special characters and spaces in table and column names require some additional formatting. When your query contains spaces, dashes, or other non-ASCII characters, prefix those special characters with an *escape code* starting with an underscore and an X (**_x**), then the four-digit **Unicode**, then another underscore. If the Unicode is fewer than four characters, you need to pad it with zeroes. Here are some examples.

|Identifier  |Unicode  | Coding for Power BI  |
|---------|---------|---------|
|**Table Name**     | Space is 0x20        |  Table_x0020_Name       |
|**Column**@**Number**     |   @ is 0x40     |  Column_x0040_Number       |
|**[Column]**     |  [ is 0x005B ] is 0x005D       |  _x005B_Column_x005D_       |
|**Column+Plus**     | + is 0x2B        |  Column_x002B_Plus       |

Table_x0020_Name/Column_x002B_Plus eq 3
![Screenshot of table visual rendering special characters for Unicode.](media/service-url-filters/power-bi-special-characters1.png)


Table_x0020_Special/_x005B_Column_x0020_Brackets_x005D_ eq '[C]'
![Screenshot of table visual rendering special characters for coding for Power B I.](media/service-url-filters/power-bi-special-characters2.png)

### Special characters in values

URL filters already support all special characters in field values, except the single quote ('). That's the only character you need to escape. To search for a single quote character, use two single quotes (''). 

For example:

- `?filter=Table/Name eq 'O''Brien'` becomes: 

    :::image type="content" source="media/service-url-filters/power-bi-url-filter-obrien.png" alt-text="Name is O'Brien":::

- `?filter=Table/Name eq 'Lee''s Summit'` becomes:

    :::image type="content" source="media/service-url-filters/power-bi-url-filter-lees.png" alt-text="Lee's Summit":::

- The `in` operator supports this escaping as well: `?filter=Table/Name in ('Lee''s Summit', 'O''Brien')` becomes:

    :::image type="content" source="media/service-url-filters/power-bi-url-filter-in.png" alt-text="Lee's Summit or O'Brien":::

## Use DAX to filter on multiple values

Another way to filter on multiple fields is by creating a calculated column that concatenates two fields to a single value. Then you can filter on that value.

For example, we have two fields: Territory and Chain. In Power BI Desktop, [create a new Calculated column](../transform-model/desktop-tutorial-create-calculated-columns.md) (Field) called TerritoryChain. Remember that the **Field** name can't have any spaces. Here is the DAX formula for that column.

TerritoryChain = [Territory] & " - " & [Chain]

Publish the report to Power BI service and then use the URL query string to filter to display data for only Lindseys stores in NC.

```
https://app.powerbi.com/groups/me/reports/8d6e300b-696f-498e-b611-41ae03366851/ReportSection3?filter=Store/TerritoryChain eq 'NC – Lindseys'
```

## Pin a tile from a filtered report

Once you've filtered the report using query string parameters, you can pin visualizations from that report to your dashboard.  The tile on the dashboard displays the filtered data and selecting that dashboard tile opens the report that was used to create it.  However, the filtering you did using the URL isn't saved with the report. When you select the dashboard tile, the report opens in its unfiltered state.  Thus, the data displayed in the dashboard tile doesn't match the data displayed in the report visualization.

This discrepancy is helpful when you want to see different results; filtered on the dashboard and unfiltered in the report.

## Considerations and troubleshooting

There are a couple of things to be aware of when using the query string parameters.

* When using the *in* operator, the values to the right of *in* must be a comma-separated list enclosed in parentheses.    
* Power BI Report Server also supports the ability to specify additional filters using the “filter” URL parameter. Here's an example of what the URL might look like in Power BI Report Server:
    `https://reportserver/reports/powerbi/Store Sales?rs:Embed=true&filter= Store/Territory eq 'NC' and Store/Chain eq 'Fashions Direct'`
* Report URL filters have a 10-expression limit (10 filters connected by AND).
* The long data type is (2^53-1) due to JavaScript limitations.
* Power BI doesn't limit the number of characters in URL query strings. Different browsers have different length restrictions.

URL filters are supported in some embedding scenarios and not in others.

- [Embedding a report in a secure portal or website](service-embed-secure.md) is supported.
- URL filters are supported in Power BI Embedded. See [Power BI Embedded advanced URL filtering capabilities](https://azure.microsoft.com/updates/power-bi-embedded-advanced-url-filtering-capabilities) for details.
- Query string filtering doesn't work with [Publish to web](service-publish-to-web.md) or [Export to PDF](../consumer/end-user-pdf.md).
- [Embed with report web part in SharePoint Online](service-embed-report-spo.md) doesn't support URL filters.
- Teams doesn't allow specifying a URL.

## Next steps

[Pin a visualization to a dashboard](../create-reports/service-dashboard-pin-tile-from-report.md)  
[Sign up for a free trial](https://powerbi.microsoft.com/get-started/)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)



