<properties
   pageTitle="Hyperlinks in tables"
   description="Hyperlinks in tables"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/14/2015"
   ms.author="mihart"/>
# Hyperlinks in tables

This topic teaches you how to create and work with hyperlinks in tables and matrixes.  URLs in Power BI tables (and matrixes) can function as hyperlinks. Underlined text in a table or matrix that changes color as you hover over it, is a hyperlink.  Clicking on it will take you to the linked URL. 

To learn how to add hyperlinks to visualization titles, see xxxx.

![](media/powerbi-service-hyperlinks-in-tables/hyperlinkedTable.png)

## To create a hyperlink in Power BI

Hyperlinks are created in Excel Power Pivot before the workbook is imported into Power BI.  Hyperlinks in tables cannot be added from Power BI.

1.  Open the workbook in Excel.

2.  Select the **PowerPivot** tab and then choose **Manage**.

    ![](media/powerbi-service-hyperlinks-in-tables/createHyperlinkInPowerPivot2.png)

3.  When Power Pivot opens, select the **Advanced **tab.

    ![](media/powerbi-service-hyperlinks-in-tables/createHyperlinkInPowerPivot3.png)

4.  Place your cursor in the column that contains the URLs that you'd like to turn into hyperlinks in Power BI tables.

    >**NOTE**: The URLS must start with either **http:// , https://** or **www**.

5.  In the **Reporting Properties** group, select the **Data Category** dropdown and choose **Web URL**. 

    ![](media/powerbi-service-hyperlinks-in-tables/createHyperlinksNew.png)

6.  From the Power BI service, connect to this workbook.

7.  Create a table visualization that includes the URL field.

    ![](media/powerbi-service-hyperlinks-in-tables/hyperlinksInTables.gif)


## See also

[Visualizations in Power BI reports](powerbi-service-visualizations-for-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
