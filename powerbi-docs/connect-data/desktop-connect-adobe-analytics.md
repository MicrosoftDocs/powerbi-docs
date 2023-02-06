---
title: Connect to Adobe Analytics in Power BI Desktop
description: Learn how to easily connect to and use Adobe Analytics in Power BI Desktop. Use the underlying data just like any other data source.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/02/2023
LocalizationGroup: Connect to data
---
# Connect to Adobe Analytics in Power BI Desktop

In Power BI Desktop, you can connect to *Adobe Analytics* and use the underlying data just like any other data source in Power BI Desktop.

:::image type="content" source="media/desktop-connect-adobe-analytics/connect-adobe-analytics_01.png" alt-text="Screenshot shows the Get Data dialog where you can select Adobe Analytics.":::

## Connect to Adobe Analytics data

To connect to Adobe Analytics data, select **Get data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, and you see **Adobe Analytics**.

:::image type="content" source="media/desktop-connect-adobe-analytics/connect-adobe-analytics_01.png" alt-text="Screenshot shows the Get Data dialog with Adobe Analytics selected.":::

In the **Connecting to a third-party service**, select **Continue**.

Select an implementation: **1.0** or **2.0 (Beta)**. Choose **OK**.

In the **Adobe Analytics** window that appears, select the **Sign in** button, and provide your credentials to sign in to your Adobe Analytics account. The **Adobe Sign in** window appears, as shown in the following image.

:::image type="content" source="media/desktop-connect-adobe-analytics/connect-adobe-analytics_03.png" alt-text="Screenshot shows the Sign in dialog for Adobe Analytics.":::

When prompted, put in your account information. Once the connection is established, you can preview and select multiple dimensions and measures within the Power BI **Navigator** dialog to create a single tabular output. You can also provide any necessary input parameters required for the selected items.

:::image type="content" source="media/desktop-connect-adobe-analytics/connect-adobe-analytics_04.png" alt-text="Screenshot shows where you can select data using Navigator.":::

You can **Load** the selected table, which brings the entire table into Power BI Desktop. You can edit the query by selecting **Transform Data**, which opens Query Editor. You can filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

:::image type="content" source="media/desktop-connect-adobe-analytics/connect-adobe-analytics_05.png" alt-text="Screenshot shows where you can load or edit data in Navigator.":::

## Next steps

There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data Sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)
* [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)
