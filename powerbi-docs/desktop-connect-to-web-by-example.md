---
title: Extract data from a Web page by example in Power BI Desktop (Preview)
description: Extract data from a Web page by providing an example of what you want to pull
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 05/07/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# Get data from a Web page by providing an example (Preview)

Getting data from a web page lets users easily extract data from web pages, and import that data into **Power BI Desktop**. Often however, data on Web pages aren't in tidy tables that are easy to extract, so getting data from such pages - even if it's structured and consistent -  can be challenging. 

There is a solution. With the **Get Data from Web by example** feature, you can essentially show **Power BI Desktop** which data you want to extract by providing one or more examples within the connector dialog, and it will gather other data on the page that match your examples. With this solution you can extract all sorts of data from Web pages, including  data found in tables *and* other non-table data. 

![Get data from web by example](media/desktop-connect-to-web-by-example/web-by-example_01.png)


## Enabling the preview feature Get Data from Web by example

The **Get Data from Web by example** is in Preview, and must be enabled in **Power BI Desktop**. To enable it, select **File > Options and Settings > Options > Preview Features**, then select the **New from Web experience** checkbox. You'll need to restart Power BI Desktop after you make the selection.

![enable the preview feature](media/desktop-connect-to-web-by-example/web-by-example_02.png)

Once the preview feature is enabled you're ready to start using it. 

## Using Get Data from Web by example

To use **Get Data from Web by example**, select **Get Data** from the **Home** ribbon menu. In the window that appears, select **Other** from the categories in the left pane, and then select **Web**.

![select Web from Get Data](media/desktop-connect-to-web-by-example/web-by-example_03.png)

From there, enter the URL of the Web page from which you'd like to extract data. In this article we'll use the Microsoft Store Web page, and show how this connector works. 

If you want to follow along, you can use the [Microsoft Store URL](https://www.microsoft.com/en-us/store/top-paid/games/xbox?category=classics) that we use in this article:

    https://www.microsoft.com/en-us/store/top-paid/games/xbox?category=classics

![Web dialog](media/desktop-connect-to-web-by-example/web-by-example_04.png)

When you select **OK**, you're taken to the **Navigator** dialog where any auto-detected tables from the Web page are presented. In the case shown in the image below, no tables were found, but there is a button on the bottom of the page called **Extract table using examples** that let's you provide examples.


![Navigator window](media/desktop-connect-to-web-by-example/web-by-example_05.png)

Selecting the **Extract table using examples** presents an interactive window where you can preview the content of the Web page, and enter sample values of the data you would like to extract. 

In this example, we'll extract the *Name* and *Price* for each of the games on the page. We can do that by specifying a couple of exapmes from teh page for each column, as shown in the following image. As those examples are typed in, **Power Query** (which is the underlying technology that extracts the data from the Web page) is able to extract data that fits the pattern of example entries using smart data extraction algorithms.

![data by example](media/desktop-connect-to-web-by-example/web-by-example_06.png)

Once we're happy with the data extracted from the Web page, we select **OK** to go to **Query Editor**, where we can apply more transformations or shape the data, such as combining this data with other data our sources.

![data by example](media/desktop-connect-to-web-by-example/web-by-example_07.png)

From there, you can create visuals or otherwise use the Web page data when creating your **Power BI Desktop** reports.


## Next steps
There are all sorts of data you can connect to using **Power BI Desktop**. For more information on data sources, check out the following resources:

* [Add columny by example](desktop-add-column-from-example.md)
* [Connect to a Web page](desktop-connect-to-web.md)
* [Data Sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)   
* [Connect to CSV files in Power BI Desktop](desktop-connect-csv.md)   
* [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)   

