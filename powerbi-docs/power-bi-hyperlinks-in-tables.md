---
title: Add hyperlinks (URLs) to a table
description: This topic teaches you how to add hyperlinks (URLs) to a table. You use Power BI Desktop to add hyperlinks (URLs) to a table or matrix. Then, in either Power BI Desktop or the Power BI service, you can add those hyperlinks to your report tables and matrixes.
author: maggiesMSFT
manager: kfollis
ms.reviewer: ''
ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/29/2019
ms.author: maggies

LocalizationGroup: Visualizations
---
# Add hyperlinks (URLs) to a table
This topic teaches you how to add hyperlinks (URLs) to a table. You use Power BI Desktop to add hyperlinks (URLs) to a table or matrix. Then, in either Power BI Desktop or the Power BI service, you can add those hyperlinks to your report tables and matrixes. 

![Table with hyperlinks](media/power-bi-hyperlinks-in-tables/hyperlinkedtable.png)

> [!NOTE]
> You can create hyperlinks in [tiles on dashboards](service-dashboard-edit-tile.md) and [text boxes on dashboards](service-dashboard-add-widget.md) on the fly in the Power BI service. You can create hyperlinks in [text boxes in reports](service-add-hyperlink-to-text-box.md) on the fly in the Power BI service and Power BI Desktop.
> 

## To create a hyperlink in a table or matrix using Power BI Desktop
You can create hyperlinks in tables and matrixes in Power BI Desktop, but not in the Power BI Service. You can also create hyperlinks in Excel Power Pivot before you import the workbook into Power BI. Both methods are described below.

## Create a table or matrix hyperlink in Power BI Desktop
The procedure for adding a hyperlink depends on whether you've imported the data or connected to it using DirectQuery. Both scenarios are described below.

### For data imported into Power BI
1. If the hyperlink doesn't already exist as a field in your dataset, use Power BI Desktop to add it as a [custom column](desktop-common-query-tasks.md).
2. In Data view, select the column and in the **Modeling** tab choose the dropdown for **Data Category**.
   
    ![Data category dropdown list](media/power-bi-hyperlinks-in-tables/pbi_data_category.png)
3. Select **Web URL**.
4. Switch to Report view and create a table or matrix using the field categorized as a Web URL. The hyperlinks will be blue and underlined.

    ![Blue and underlined links](media/power-bi-hyperlinks-in-tables/power-bi-table-with-hyperlinks2.png)

    > [!NOTE]
    > URLS must start with certain prefixes. See [Considerations and troubleshooting](#considerations-and-troubleshooting) for the complete list.
    >
   
1. If you don't want to display a long URL in a table, you can display a hyperlink icon  ![Hyperlink icon](media/power-bi-hyperlinks-in-tables/power-bi-hyperlink-icon.png) instead. Note that you can't display icons in matrixes.
   
    Select the chart to make it active.

    Select the Format icon ![Paint roller icon](media/power-bi-hyperlinks-in-tables/power-bi-paintroller.png) to open the Formatting tab.

    Expand **Values**, locate **URL icon**, and turn it to **On.**

    ![Turn on URL icon](media/power-bi-hyperlinks-in-tables/power-bi-url-icon-on.png)

1. (Optional) [Publish the report from Power BI Desktop to the Power BI service](/learn/modules/publish-share-power-bi/2-publish-reports) and open the report in the Power BI service. The hyperlinks will work there as well.

### For data connected with DirectQuery
You can't create a new column in DirectQuery mode.  But if your data already contains URLs, you can turn them into hyperlinks.

1. In Report view, create a table using a field that contains URLs.
2. Select the column, and in the **Modeling** tab, choose the dropdown for **Data Category**.
3. Select **Web URL**. The hyperlinks will be blue and underlined.
4. (Optional) [Publish the report from Power BI Desktop to the Power BI service](/learn/modules/publish-share-power-bi/2-publish-reports) and open the report in the Power BI service. The hyperlinks will work there as well.

## Create a table or matrix hyperlink in Excel Power Pivot
Another way to add hyperlinks to your Power BI tables and matrixes is to create the hyperlinks in the dataset before you import/connect to that dataset from Power BI. This example uses an Excel workbook.

1. Open the workbook in Excel.
2. Select the **PowerPivot** tab and then choose **Manage**.
   
   ![Open PowerPivot in Excel](media/power-bi-hyperlinks-in-tables/createhyperlinkinpowerpivot2.png)
1. When PowerPivot opens, select the **Advanced** tab.
   
   ![PowerPivot Advanced tab](media/power-bi-hyperlinks-in-tables/createhyperlinkinpowerpivot3.png)
4. Place your cursor in the column that contains the URLs that you'd like to turn into hyperlinks in Power BI tables.
   
   > [!NOTE]
   > URLS must start with certain prefixes. See [Considerations and troubleshooting](#considerations-and-troubleshooting) for the complete list.
   > 
   
5. In the **Reporting Properties** group, select the **Data Category** dropdown and choose **Web URL**. 
   
   ![Data category dropdown in Excel](media/power-bi-hyperlinks-in-tables/createhyperlinksnew.png)

6. From the Power BI service or Power BI Power BI Desktop, connect to or import this workbook.
7. Create a table visualization that includes the URL field.
   
   ![Create a table in Power BI with the URL field](media/power-bi-hyperlinks-in-tables/hyperlinksintables.gif)

## Considerations and troubleshooting

URLS must start with one of the following:
- http
- https
- -mailto
- file
- ftp
- news
- telnet

Q: Can I use a custom URL as a hyperlink in a table or matrix?    
A: No. You can use a link icon. If you need custom text for your hyperlinks and your list of URLs is short, consider using a text box instead.


## Next steps
[Visualizations in Power BI reports](visuals/power-bi-report-visualizations.md)

[Basic concepts for designers in the Power BI service](service-basic-concepts.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)

