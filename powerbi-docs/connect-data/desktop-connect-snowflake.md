---
title: Connect to Snowflake computing warehouse in Power BI Desktop
description: Easily connect to and use a Snowflake computing warehouse in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 04/30/2021
LocalizationGroup: Connect to data
---
# Connect to Snowflake in Power BI Desktop
In Power BI Desktop, you can connect to a **Snowflake** computing warehouse and use the underlying data just like any other data source in Power BI Desktop. 

## Connect to a Snowflake computing warehouse
To connect to a **Snowflake** computing warehouse, select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Database** from the categories on the left, and you see **Snowflake**.

![Screenshot of the Get Data dialog, showing the Snowflake database selection.](media/desktop-connect-snowflake/connect-snowflake-2b.png)

In the **Snowflake** window that appears, type or paste the name of your Snowflake computing warehouse into the box and select **OK**. Note that you can choose to **Import** data directly into Power BI, or you can use **DirectQuery**. You can learn more about [using DirectQuery](desktop-use-directquery.md). Please note that AAD SSO only supports DirectQuery.

![Screenshot of the Snowflake dialog, showing the Import radio button selected.](media/desktop-connect-snowflake/connect-snowflake-3.png)

When prompted, put in your username and password.

![Screenshot of the Snowflake credential prompt, showing the Username and Password fields.](media/desktop-connect-snowflake/connect-snowflake-4.png)

> [!NOTE]
> Once you enter your username and password for a particular **Snowflake** server, Power BI Desktop uses those same credentials in subsequent connection attempts. You can modify those credentials by going to **File > Options and settings > Data source settings**.
> 
> 

If you want to use the Microsoft account option, the Snowflake AAD integration must be configured on the Snowflake side. To do this, read the Getting Started section of the [Snowflake documentation on the topic](https://docs.snowflake.net/manuals/user-guide/oauth-powerbi.html#power-bi-sso-to-snowflake).

![Microsoft account authentication type in Snowflake connector.](media/desktop-connect-snowflake/connect-snowflake-6.png)


Once you successfully connect, a **Navigator** window appears and displays the data available on the server, from which you can select one or multiple elements to import and use in **Power BI Desktop**.

![ODBC Error 28000 causing a failure to connect.](media/desktop-connect-snowflake/connect-snowflake-5.png)

You can **Load** the selected table, which brings the entire table into **Power BI Desktop**, or you can **Transform Data** the query, which opens **Power Query Editor** so you can filter and refine the set of data you want to use, and then load that refined set of data into **Power BI Desktop**.

## Custom Roles

The Snowflake connector supports *Custom Roles*.

## Next steps
There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data Sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)   
* [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)   
