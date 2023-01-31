---
title: Connect to an Impala database in Power BI Desktop
description: Learn how to connect to an Impala database in Power BI Desktop to use the underlying data just like you can with any other data source.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/01/2023
LocalizationGroup: Connect to data
---
# Connect to an Impala database in Power BI Desktop

In Power BI Desktop, you can connect to an *Impala* database and use the underlying data just like you can with any other data source in Power BI Desktop.

## Connect to an Impala database

To connect to an Impala database, take the following steps:

1. Select **Get data** from the **Home** ribbon in Power BI Desktop.

1. Select **Database** from the categories on the left. Then you see **Impala**.

    ![Screenshot shows the Get Data dialog with Impala selected.](media/desktop-connect-impala/connect_impala_2.png)

1. In the **Impala** window that appears, type or paste the name of your Impala server into the box. Then select **OK**. You can **Import** data directly into Power BI Desktop or you can use **DirectQuery**. For more information, see [Use DirectQuery in Power BI Desktop](desktop-use-directquery.md).

    ![Screenshot shows the Impala window, where you can enter your server.](media/desktop-connect-impala/connect_impala_3a.png)

1. When prompted, enter your credentials or connect anonymously. The Impala connector supports Anonymous, Basic (user name and password), and Windows authentication.

    ![Screenshot shows the Impala dialog where you authenticate your connection.](media/desktop-connect-impala/connect_impala_4.png)

    > [!NOTE]
    > After you put in your user name and password for a particular Impala server, Power BI Desktop uses those same credentials in subsequent connection attempts. You can modify those credentials by going to **File** > **Options and settings** > **Data source settings**.

1. After you connect, a **Navigator** window appears and displays the data that's available on the server. Choose elements from this data to import and use in Power BI Desktop.

   :::image type="content" source="media/desktop-connect-impala/connect_impala_5.png" alt-text="Screenshot shows the Navigator window where you can load or transform data." lightbox="media/desktop-connect-impala/connect_impala_5.png":::

## Considerations and limitations

There are a few considerations and limitations to keep in mind with the **Impala** connector:

* The Impala connector is supported on the on-premises data gateway, using any of the three supported authentication mechanisms.
* The Impala connector uses the Impala driver, which limits the size of string types to 32 K by default.

## Next steps

There are many different data sources that you can connect to by using Power BI Desktop. For more information about data sources, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)   
* [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)   
