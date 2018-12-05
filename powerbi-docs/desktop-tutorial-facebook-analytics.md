---
title: 'Tutorial: Facebook analytics using Power BI Desktop'
description: 'Tutorial: Facebook analytics using Power BI Desktop'
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: tutorial
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Learn more
---
# Tutorial: Facebook analytics using Power BI Desktop

In this tutorial you learn how to import data from Facebook and use it in Power BI Desktop. You'll connect and import data from the Power BI Facebook page, apply transformations to the imported data, and use the data in report visualizations.

## Connect to a Facebook page

This tutorial uses data from the [Microsoft Power BI Facebook page](https://www.facebook.com/microsoftbi) (*https://www.facebook.com/microsoftbi*). You don't need any special credentials to connect and import data from this page except for a personal Facebook account.

1. Open Power BI Desktop and select **Get data** in the **Getting Started** dialog, or in the **Home** ribbon tab, select **Get Data** and then select **More...**.
   
2. In the **Get Data** dialog, select **Facebook** from the **Online Services** group, and then select **Connect**.
   
   ![Get data](media/desktop-tutorial-facebook-analytics/t_fb_getdataother.png)
   
   A dialog appears to alert you to the risks of using a third-party service.
   
   ![Third-party warning](media/desktop-tutorial-facebook-analytics/t_fb_connectingtotps.png)
   
3. Select **Continue**. The **Facebook** dialog box appears.
   
4. Type or paste the page name **microsoftbi** into the **Username** text box, select **Posts** from the **Connection** dropdown, and then select **OK**.
   
   ![Connect](media/desktop-tutorial-facebook-analytics/2.png)
   
5. When prompted for credentials, sign in to your Facebook account, and allow Power BI access through your account.
   
   ![Credentials](media/desktop-tutorial-facebook-analytics/facebookcredentials.png)

   After connecting to the Power BI Facebook page, you see a preview of the page's **Posts** data. 
   
   ![Data preview](media/desktop-tutorial-facebook-analytics/t_fb_1-loadpreview.png)
   
## Shape and transform the imported data

You want to see and show which posts have the most comments over time, but you notice in the **Posts** data preview that the **created_time** data is hard to read and understand, and there is no comments data at all. You need to perform some shaping and cleansing of the data to pull the most out of it. You can use the Power BI Desktop **Power Query Editor** to edit the data, before or after importing it into Power BI Desktop. 

### Split the date/time column

First, separate the date and time values in the **created_time** column to be more readable. 

1. In the Facebook data preview, select **Edit**. 
   
   ![Data preview edit](media/desktop-tutorial-facebook-analytics/t_fb_1-editpreview.png)
   
   The Power BI Desktop **Power Query Editor** opens in a new window and displays the data preview from the Power BI Facebook page. 
   
   ![Power Query Editor](media/desktop-tutorial-facebook-analytics/t_fb_1-intoqueryeditor.png)
   
2. Select the **created_time** column. Note that it is currently a Text data type, denoted by an **ABC** icon in the column header. Right-click the header and select **Split Column > By Delimiter** in the dropdown, or select **Split Column > By Delimiter** under **Transform** in the Home tab of the ribbon.  
   
   ![Split column by delimiter](media/desktop-tutorial-facebook-analytics/delimiter1.png)
   
3. In the **Split column by delimiter** dialog, select **Custom** from the dropdown, enter **T** (the character that starts the time part of the created_time values) in the input field, and select **OK**. 
   
   ![Split column by delimiter dialog](media/desktop-tutorial-facebook-analytics/delimiter2.png)
   
   The column splits into two columns that contain the strings before and after the **T** delimiter and are named **created_time.1** and **created_time.2**, respectively. Note that Power BI has automatically detected and changed the data types to **Date** for the first column and **Time** for the second column, and formatted the date and time values to be more readable.
   
4. Rename the columns by double-clicking each column header, or selecting each column and then selecting **Rename** in the **Any Column** Group of the **Transform** tab in the ribbon, and typing new column headers **created_date** and **created_time**, respectively.
   
   ![New date and time columns](media/desktop-tutorial-facebook-analytics/delimiter3.png)
   
### Expand the nested column

Now that the date and time data are the way you want them, you'll expose comments data by expanding a nested column. 

1. Select the **object_link** column and then select the ![expand icon](media/desktop-tutorial-facebook-analytics/14.png) icon to open the **Expand/Aggregate** dialog. Select **connections**, and then select **OK**. 
   
   ![Expand object_link](media/desktop-tutorial-facebook-analytics/expand1.png)
   
   The column heading changes to **object_link.connections**.
2. Again select the ![expand icon](media/desktop-tutorial-facebook-analytics/14.png) icon at the top of the **object_link.connections** column, select **comments**, and then select **OK**. The column heading changes to **object_link.connections.comments**.
   
3. Select the ![expand icon](media/desktop-tutorial-facebook-analytics/14.png) icon at the top of the **object_link.connections.comments** column, and this time select **Aggregate** instead of Expand in the dialog box. Select **# Count of id**, and then select **OK**. 
   
   ![Aggregate comments](media/desktop-tutorial-facebook-analytics/expand2.png)
   
   The column now displays the number of comments for each message. 
   
4. Rename the **Count of object_link.connections.comments.id** column to **Number of comments**.
   
5. Select the down arrow next to the **Number of comments** header and select **Sort Descending** to see the Posts sorted from most to fewest comments. 
   
   ![Comments per message](media/desktop-tutorial-facebook-analytics/data-fixed.png)
   
### Review query steps

As you shaped and transformed data in the **Power Query Editor**, each step was recorded in the **Applied Steps** area of the **Query Settings** pane at the right side of the Power Query Editor window. You can step back through the Applied Steps to see exactly what changes you made, and edit, delete, or rearrange them if necessary (although this can be risky, because changing preceding steps can break later steps). 

After applying the data transformations so far, your Applied Steps should look like the following:
   
   ![Applied Steps](media/desktop-tutorial-facebook-analytics/applied-steps.png)
   
   >[!TIP]
   >Underlying the Applied Steps are formulas written in the **Power Query Language**, also known as the **M** language. To see and edit the formulas, select **Advanced Editor** in the **Query** group of the Home tab of the ribbon. 

### Import the transformed data

When you are satisfied with the data, select **Close & Apply** > **Close & Apply** in the Home tab of the ribbon to import it into Power BI Desktop. 
   
   ![Close & Apply](media/desktop-tutorial-facebook-analytics/t_fb_1-loadandclose.png)
   
   A dialog displays the progress of loading the data into the Power BI Desktop data model. 
   
   ![Loading data](media/desktop-tutorial-facebook-analytics/t_fb_1-loading.png)
   
   Once the data is loaded, it appears in the Report view as a new Query in the Fields list.
   
   ![New query](media/desktop-tutorial-facebook-analytics/fb-newquery.png)
   
## Use the data in report visualizations 

Now that you have imported data from the Facebook page, you can quickly and easily gain insights about your data by using visualizations. Creating a visualization is easy; just select a field or drag it from the **Fields** list onto the report canvas.

### Create a bar chart

1. In Power BI Desktop Report view, select **message** from the field list, or drag it onto the canvas. A table showing all post messages appears on the canvas. 
   
   ![New query](media/desktop-tutorial-facebook-analytics/table-viz.png)
   
2. With that table selected, also select **Number of comments** from the Fields list, or drag it into the table. 
   
3. Select the **Stacked bar chart** icon in the Visualizations pane. The table changes to a bar chart showing the number of comments per post. 
   
   ![Bar chart](media/desktop-tutorial-facebook-analytics/barchart1.png)
   
4. Select the ellipsis (...) in the upper right of the visualization, and then select **Sort by Number of comments** to sort the table by descending number of comments. 
   
   ![Sort by number of comments](media/desktop-tutorial-facebook-analytics/barchart2.png)
   
5. Note that the most comments were associated with **Blank** messages (these posts may have been stories, links, videos, or other non-text content). To filter out the Blank row, select **message (all)** under **Filters** at the bottom of the Visualizations pane, select **Select All**, and then select **Blank** to deselect it. The Filters entry changes to **message is not (Blank)**, and the Blank row disappears from the chart visualization. 
   
   ![Filter out blank](media/desktop-tutorial-facebook-analytics/barchart3.png)
   
### Format the chart

The visualization is getting more interesting, but you can't see much of the post text in the chart. To show more of the post text:

1. Using the handles on the chart visualization, resize the chart to be as large as possible. 
   
2. With the chart selected, select the **Format icon** (paint roller) in the Visualizations pane.
   
3. Select the down arrow next to **Y-axis**, and drag the slider next to **Maximum size** all the way to the right (50%). 
4. Also reduce the **Text size** to **10** to fit more text.
   
   ![Formatting changes](media/desktop-tutorial-facebook-analytics/barchart4.png)
   
   The chart now shows more of the post content. 
   
   ![Show more posts](media/desktop-tutorial-facebook-analytics/barchart5.png)
   
The X axis (number of comments) of the chart does not show exact values, and looks lost at the bottom of the chart. You decide to use data labels instead. 

1. Select the Format icon, and then select the slider next to **X-axis** to turn it **Off**. 
   
2. Select the slider next to **Data labels** to turn them **On**. Now the chart shows the exact number of comments for each post.
   
   ![Apply data labels](media/desktop-tutorial-facebook-analytics/barchart6.png)
   
### Edit the data type

That's better, but the data labels all have a **.0** decimal place, which is distracting and misleading, since **Number of posts** must be a whole number. You need to change the data type of the **Number of posts** column to Whole Number.

1. To edit the data type, right-click **Query1** in the Fields list, or hover over it and select the **More options** ellipsis (...), and then select **Edit Query**. You can also select **Edit Queries** from the **External data** area of the Home tab in the ribbon, and then select **Edit Queries** from the dropdown. The Power BI Desktop **Power Query Editor** opens in a separate window.
   
   ![Edit Query from Fields list](media/desktop-tutorial-facebook-analytics/editquery1.png)     ![Edit Queries from ribbon](media/desktop-tutorial-facebook-analytics/t_fb_editquery.png)
   
2. In the Power Query Editor, select the **Number of comments** column, and change the data type to **Whole Number** by either: 
   - Selecting the **1.2** icon next to the **Number of comments** column header, and selecting **Whole number** from the dropdown, or
   - Right-clicking the column header and selecting **Change type > Whole Number**, or
   - Selecting **Data type: Decimal Number** in the **Transform** group of the Home tab, or the **Any Column** group of the **Transform** tab, and selecting **Whole Number**.
   
   The icon in the column header changes to **123**, denoting a Whole Number data type.
   
   ![Change data type](media/desktop-tutorial-facebook-analytics/change-datatype.png)
   
3. Select **Close & Apply**, or just **Apply** to apply the changes while keeping the Power Query Editor window open. Once the changes load, the data labels on the chart become whole numbers. 
   
   ![Chart with whole numbers](media/desktop-tutorial-facebook-analytics/vis-3.png)
   
### Create a date slicer

You want to visualize the number of comments on posts over time. You can create a slicer visualization to filter the chart data to different time frames. 

1. Click a blank area of the canvas, and then select the **Slicer icon** in the Visualizations pane. A blank slicer visualization appears. 
   
   ![Select slicer icon](media/desktop-tutorial-facebook-analytics/slicer1.png)
   
2. Select the **created_date** field from the Fields list, or drag it into the new slicer. The slicer changes to a date range slider, based on the field's Date data type.
   
   ![Date range slider slicer](media/desktop-tutorial-facebook-analytics/slicer2.png)
   
3. Move the slider handles to select different date ranges, and note how the chart data filters accordingly. You can also select the date fields in the slicer and type in specific dates, or choose them from a calendar popup.
    
   ![Slice data](media/desktop-tutorial-facebook-analytics/slicer3.png)
   
### Format the visualizations

You decide to give the chart a more descriptive and attractive title. 

1. With the chart selected, select the **Format** icon, and select the dropdown arrow to expand **Title**.
2. Change the **Title text** to **Comments per post**. 
3. Select the dropdown arrow next to **Font color**, and select a green color to match the green bars of the visualization.
4. Increase the **Text size** to **10**, and change the **Font family** to **Segoe (Bold)**.

![Format chart title](media/desktop-tutorial-facebook-analytics/formatting1.png)

Experiment with other formatting options and settings to change the appearance of your visualizations. 

![Visualizations](media/desktop-tutorial-facebook-analytics/vis-1.png)

## Create more visualizations

As you can see, it's easy to customize visualizations in your report to present the data in ways that you want. For example, try using the imported Facebook data to create this line chart showing number of comments over time.

![Line chart](media/desktop-tutorial-facebook-analytics/moreviz.png)

Power BI Desktop provides a seamless end-to-end experience, from getting data from a wide range of data sources and shaping it to meet your analysis needs, to visualizing this data in rich and interactive ways. When your report is ready, you can [upload it to Power BI service](desktop-upload-desktop-files.md) and create dashboards based on it, which you can share with other Power BI users.

## Next steps
* [Read other Power BI Desktop tutorials](http://go.microsoft.com/fwlink/?LinkID=521937)
* [Watch Power BI Desktop videos](http://go.microsoft.com/fwlink/?LinkID=519322)
* [Visit the Power BI Forum](http://go.microsoft.com/fwlink/?LinkID=519326)
* [Read the Power BI Blog](http://go.microsoft.com/fwlink/?LinkID=519327)

﻿