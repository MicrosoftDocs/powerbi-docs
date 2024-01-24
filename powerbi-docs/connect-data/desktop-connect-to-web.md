---
title: Connect to a webpage from Power BI Desktop
description: Learn how to easily connect to and use webpage data in your Power BI Desktop visuals and in your data models.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/12/2023
LocalizationGroup: Connect to data
---
# Connect to webpages from Power BI Desktop

You can connect to a webpage and import its data into Power BI Desktop, to use in your visuals and in your data models.

In Power BI Desktop, select **Get data** > **Web** from the **Home** ribbon.

![Screenshot of the Power BI Desktop, showing the Web selection.](media/desktop-connect-to-web/connect-to-web-01.png)

A dialog appears, asking for the URL of the webpage from which you want to import data.

![Screenshot of the Web dialog, showing the URL field.](media/desktop-connect-to-web/connect-to-web-02.png)

Once you've typed or pasted the URL, select **OK**.

Power BI Desktop connects to the webpage and then presents the page's available data in the **Navigator** window. When you select one of the available data elements, such as **Table 1**, the **Navigator** window displays a preview of that data on the right side of the window.

:::image type="content" source="media/desktop-connect-to-web/connect-to-web-04.png" alt-text="Screenshot of the Navigator dialog, showing a preview of the selected table's data." lightbox="media/desktop-connect-to-web/connect-to-web-04.png":::

You can choose the **Transform Data** button, which launches **Power Query Editor**, where you can shape and transform the data on that webpage before importing it into Power BI Desktop. Or you can select the **Load** button, and import all of the data elements you selected in the left pane.

When you select **Load**, Power BI Desktop imports the selected items, and makes them available in the **Fields** pane, found on the right side of the Reports view in Power BI Desktop.

![Screenshot of the Fields pane, showing the list of selected tables.](media/desktop-connect-to-web/connect-to-web-05.png)

That's all there is to connecting to a webpage and bringing its data into Power BI Desktop.

From there, you can drag those fields onto the Report canvas and create all the visualizations you want. You can also use the data from that webpage just like you would any other data. You can shape it, you can create relationships between it and other data sources in your model, and otherwise do what you like to create the Power BI report you want.

To see connecting to a webpage in more depth and action, take a look at the [Power BI Desktop Getting Started Guide](../fundamentals/desktop-getting-started.md).

## Certificate revocation check

Power BI applies security for web connections to protect your data. In some scenarios, such as capturing web requests with Fiddler, web connections may not work properly. To enable such scenarios, you can modify the **Check if your certificates have been revoked** option in Power BI Desktop, then restart Power BI Desktop.

To change this option, select **File** > **Options and settings** > **Options**, then select **Security** in the left pane.

![Screenshot shows the Options dialog where you can enable or disable certificate revocation check.](media/desktop-connect-to-web/connect-to-web-06.png)

## Related content

There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [Data Sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](/power-query/connectors/excel)
* [Connect to CSV files in Power BI Desktop](/power-query/connectors/text-csv)
* [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)
