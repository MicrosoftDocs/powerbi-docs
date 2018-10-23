---
title: "Enter data directly in a paginated report in Power BI Report Server | Microsoft Docs"
description: In this article, you see how you can enter data directly into a paginated report in Report Builder. 
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 10/22/2018
ms.author: maggies
---

# Enter data directly in a paginated report in Power BI Report Server

In this article, you see how you can enter data directly into a paginated report in Report Builder. The new version of SQL Server 2016 Report Builder contains a new feature – the ability to enter data directly into an RDL report as an embedded dataset.  This feature is similar to the one found in Power BI Desktop. Now, you can either type the data in directly into a dataset in your report, or paste it in from another program like Microsoft Excel. After you've created a dataset by entering data, you can use it just like you would any other embedded dataset you've created. Plus you can add more than one table and join them in a query. This feature is especially useful for small, static datasets you might need to use in your report, like report parameters.
 
## Prerequisite

To enter data directly in a paginated report, install the new version of [Report Builder from the Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53613). 

## Get started

After you’ve downloaded and installed Report Builder, you follow the same workflow you’ve previously used to add an embedded data source and dataset to your report. Under Data Sources, you see a new option labeled “Enter Data” to select.  You only need to set this data source up once. After that, you can create multiple tables of entered data as separate datasets using that single data source.

image

To begin entering data in a new table, create a new dataset in your report and hit the “Query Designer” button to start entering data into the table that appears.

1. In the Report Data pane, select **New** > **Dataset**.
2. In the **Dataset Properties** dialog box, select **Use a dataset embedded in my report**.
3. Next to **Data source**, select **New**.
4. In the **Data Source Properties** dialog box, select **Use a connection embedded in my report**.
5. In the **Select connection type** box, select **ENTER DATA** > **OK**.
6. Back in the **Dataset Properties** dialog box, select **Query Designer**.
7. In the **Query Designer** pane, type or paste your data in the table.

image

You can set the column headers by double-clicking the cell or using the option in the right-click menu to change the name.  By default, the data type for each column is a String.  You can optionally right-click the column header and set it to other data types like Date or Integer.  Once you’ve finished creating the table, click OK.  Note: Long time users of Report Builder will notice that the query that’s generated is the same as you’d see with an XML data source. Under the covers, that’s what we’re using as the data provider.  We’ve just re-purposed it to enable this scenario as well.


## Upload the paginated report to a report server

To upload your paginated report to a Power BI Report Server or SQL Server 2016 or 2017 Reporting Services report server, you need to add the following item to your RsReportServer.config as an additional data extension. Back up your RsReportServer.config file before you make the change, in case you run into any issues.

```
<Extension Name=”ENTERDATA” Type=”Microsoft.ReportingServices.DataExtensions.XmlDPConnection,Microsoft.ReportingServices.DataExtensions”>
<Configuration>
<ConfigName>ENTERDATA</ConfigName>
</Configuration>
</Extension>
```

Once completed, the list of data providers in the config file should look like this:

"image here"

That’s it – you can now publish your reports that use this new functionality to your report server.


## Next steps

[What is Power BI Report Server?](report-server/get-started.md)
