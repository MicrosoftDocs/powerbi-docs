---
title: Connect to a Web page from Power BI Desktop
description: Easily connect to and use Web page data in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.custom: seodec18
ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# Connect to a web page from Power BI Desktop
You can connect to a web page, and import its data into Power BI Desktop, to use in your visuals and in your data models.

In Power BI Desktop, select **Get Data > Web** from the **Home** ribbon.

![](media/desktop-connect-to-web/connect-to-web_1.png)

A dialog appears, asking for the URL of the web page from which you want to import data.

![](media/desktop-connect-to-web/connect-to-web_2.png)

Once you’ve typed in (or pasted) the URL, select **OK**. Power BI Desktop connects to that page, then presents the page’s available data in the **Navigator** window. When you select one of the available data elements, such as a table of the entire page, the **Navigator** window displays a preview of that data on the right side of the window.

![](media/desktop-connect-to-web/connect-to-web_3.png)

You can choose the **Edit** button, which launches **Query Editor**, where you can shape and transform the data on that Web page before importing it into Power BI Desktop. Or you can select the **Load** button, and import all of the data elements you selected in the left pane.

When we select **Load**, Power BI Desktop imports the selected items, and makes them available in the **Fields** pane, found on the right side of the Reports view in Power BI Desktop.

![](media/desktop-connect-to-web/connect-to-web_4.png)

That’s all there is to connecting to a web page and bringing its data into Power BI Desktop.

From there, you can drag those fields onto the Report canvas and create all the visualizations you want. You can also use the data from that Web page just like you would any other data – you can shape it, you can create relationships between it and other data sources in your model, and otherwise do what you’d like to create the Power BI report you want.

To see connecting to a Web page in more depth and action, take a look at the [Power BI Desktop Getting Started Guide](desktop-getting-started.md).

## Next steps
There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [Data Sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)   
* [Connect to CSV files in Power BI Desktop](desktop-connect-csv.md)   
* [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)   

