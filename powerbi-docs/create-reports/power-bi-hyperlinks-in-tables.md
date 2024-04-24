---
title: Add hyperlinks (URLs) to a table or matrix
description: This topic teaches how to add hyperlinks (URLs) to a table. You use Power BI Desktop to add hyperlinks (URLs) to a semantic model. Then, in Power BI Desktop or the Power BI service, you can add those hyperlinks to your report tables and matrixes.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 08/03/2022
LocalizationGroup: Visualizations
---
# Add hyperlinks (URLs) to a table or matrix

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This topic teaches how to add hyperlinks (URLs) to a table. You use Power BI Desktop to add hyperlinks (URLs) to a semantic model. You can add those hyperlinks to your report tables and matrixes in either Power BI Desktop or the Power BI service. Then you can display the URL or a link icon, or format another column as link text. When report readers select a link, it opens in another browser page.

![Table with hyperlinks](media/power-bi-hyperlinks-in-tables/power-bi-url-link-text.png)

You can also create hyperlinks in [text boxes in reports](service-add-hyperlink-to-text-box.md) in the Power BI service and Power BI Desktop. And in the Power BI service, you can add hyperlinks to [tiles on dashboards](service-dashboard-edit-tile.md) and to [text boxes on dashboards](service-dashboard-add-widget.md). 


## Format a URL as a hyperlink in Power BI Desktop

You can format a field with URLs as hyperlinks in Power BI Desktop, but not in the Power BI service. You can also [format hyperlinks in Excel Power Pivot](#create-a-table-or-matrix-hyperlink-in-excel-power-pivot) before you import the workbook into Power BI.

1. In Power BI Desktop, if a field with a hyperlink doesn't already exist in your semantic model, add it as a [custom column](../transform-model/desktop-common-query-tasks.md).

    > [!NOTE]
    > You can't create a column in DirectQuery mode.  But if your data already contains URLs, you can turn them into hyperlinks.

2. In Data view, select the column. 

3. On the **Column tools** tab, select **Data category** > **Web URL**.
   
    ![Data category dropdown list](media/power-bi-hyperlinks-in-tables/power-bi-format-web-url.png)

    > [!NOTE]
    > URLS must start with certain prefixes. See [Considerations and troubleshooting](#considerations-and-troubleshooting) in this article for the complete list.

## Create a table or matrix with a hyperlink

1. After you've [formatted a hyperlink as a URL](#format-a-url-as-a-hyperlink-in-power-bi-desktop), switch to Report view.
2. Create a table or matrix with the field that you categorized as a Web URL. The hyperlinks are blue and underlined.

    ![Blue and underlined links](media/power-bi-hyperlinks-in-tables/power-bi-url-blue-underline.png)


## Display a hyperlink icon instead of a URL

If you don't want to display a long URL in a table, you can display a hyperlink icon ![Hyperlink icon](media/power-bi-hyperlinks-in-tables/power-bi-hyperlink-icon.png) instead. 

> [!NOTE]
> You can't display icons in a matrix.

1. First, [create a table with a hyperlink](#create-a-table-or-matrix-with-a-hyperlink).

2. Select the table to make it active.

    Select the **Format** icon to open the Formatting tab.

    Under **Visual** > **URL icon**, for **Values**, select **On**.

    ![Screenshot shows the U R L icon value set to On.](media/power-bi-hyperlinks-in-tables/power-bi-desktop-url-icon-on.png)

1. (Optional) [Publish the report](desktop-upload-desktop-files.md) from Power BI Desktop to the Power BI service. When you open the report in the Power BI service, the hyperlinks work there, too.

## Format link text as a hyperlink

You can also format another field in a table as the hyperlink, and not have a column for the URL at all. In this case, you don't format the column as a Web URL.

> [!NOTE]
> You can't format another field as the hyperlink in a matrix.

### Create a column with a hyperlink

1. If a field with a hyperlink doesn't already exist in your semantic model, use Power BI Desktop to add it as a [custom column](../transform-model/desktop-common-query-tasks.md). Again, you can't create a column in DirectQuery mode.  But if your data already contains URLs, you can turn them into hyperlinks.

1. In Data view, select the column that contains the URL. 

1. On the **Column tools** tab, select **Data Category**. Make sure the column is formatted as **Uncategorized**.

### Format the link text

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Report view, create a table or matrix with the URL column and the column you're going to format as link text.

# [Power BI service](#tab/powerbi-service)

1. In your report in the Power BI service, select **Edit**. Create a table or matrix with the URL column and the column you're going to format as link text.

---

2. With the table selected, select the **Format** icon to open the Formatting tab.

1. Under **Visual**, expand **Cell elements**. For **Apply settings to**, make sure the name in the box is the column you want as link text. Locate **Web URL**, and set it to **On**.

    ![Screenshot shows the Web U R L setting with a value of On.](media/power-bi-hyperlinks-in-tables/power-bi-desktop-format-conditional-web-url.png)

    > [!NOTE]
    > If you don't see a **Web URL** option, in Power BI Desktop make sure the column that contains the hyperlinks is *not* formatted as **Web URL** in the **Data Category** dropdown box.

1. In the **Web URL** dialog box, select the field that contains the URL in the **Based on field** box > **OK**.

    ![Web URL dialog box](media/power-bi-hyperlinks-in-tables/power-bi-format-web-url-dialog.png)

    Now the text in that column is formatted as the link.

    ![Text formatted as hyperlink](media/power-bi-hyperlinks-in-tables/power-bi-url-link-text.png)

## Create a table or matrix hyperlink in Excel Power Pivot

Another way to add hyperlinks to your Power BI tables and matrixes is to create the hyperlinks in the semantic model before you import/connect to that semantic model from Power BI. This example uses an Excel workbook.

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

6. From the Power BI service or Power BI Desktop, connect to or import this workbook.
7. Create a table visualization that includes the URL field.

## Considerations and troubleshooting

URLs must start with one of the following:
- http
- https
- mailto
- ftp
- news
- telnet

Q: Can I use a custom URL as a hyperlink in a table or matrix?    
A: No. You can use a link icon. If you need custom text for your hyperlinks and your list of URLs is short, consider using a text box instead.

## Related content

- [Visualizations in Power BI reports](../visuals/power-bi-report-visualizations.md)

- [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
