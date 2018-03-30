---
title: 'Tutorial: Facebook analytics using Power BI Desktop'
description: 'Tutorial: Facebook analytics using Power BI Desktop'
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
ms.date: 12/06/2017
ms.author: davidi

LocalizationGroup: Learn more
---
# Tutorial: Facebook analytics using Power BI Desktop

In this tutorial you learn how to import data from Facebook and use it in Power BI Desktop. You'll connect and import data from the Power BI Facebook page, apply transformations to the imported data, and use the data in report visualizations.

## Connect to a Facebook page

This tutorial uses data from the [Microsoft Power BI Facebook page](https://www.facebook.com/microsoftbi) (*https://www.facebook.com/microsoftbi*). You don't need any special credentials to connect and import data from this page except for your personal Facebook account.

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

   After connecting to the Power BI Facebook page, you see the a preview of the page's **Posts** data in the model. 
   
   ![Data preview](media/desktop-tutorial-facebook-analytics/t_fb_1-loadpreview.png)
   
## Shape and transform the imported data

You want to see posts over time, and also which posts have the most comments. You notice in the data preview that the **created_time** data is hard to read and understand, and there is no comments data. You need to perform some data shaping and cleansing to get the most out of the data. You can use the Power BI Desktop **Power Query Editor** to edit the data, before or after importing it into Power BI Desktop. 

### Split the date/time column

1. In the Facebook Power BI data preview, select **Edit**. The Power BI Desktop **Power Query Editor** opens in a new window and displays the preview of the data from the Power BI Facebook page. 
   
2. Select the **created_time** column. Note that it is currently a Text data type, as denoted by the **ABC** icon in the column header. Right-click the header and select **Split Column > By Delimiter** in the dropdown, or select **Split Column > By Delimiter** under **Transform** in the Home tab of the ribbon.  
   
3. In the **Split column by delimiter** dialog, select **Custom** from the dropdown, enter **T** (the character that starts the time part of the created_time values) in the input field, and select **OK**. 
   The column splits into two columns that contain the strings before and after the **T** delimiter and are named **created_time.1** and **created_time.2**. Note that Power BI automatically detects and changes the data types to **Date** for the first column and **Time** for the second column, and formats the data to be more readable.
   
   ![](media/desktop-tutorial-facebook-analytics/9.png)
   
   ![](media/desktop-tutorial-facebook-analytics/10.png)
   
4. Double-click each column header, or select the column and then select choose **Rename** in the **Any Column** Group of the **Transform** tab in the ribbon, and type new column headers **created_date** and **created_time**, respectively.

### Expand the nested column

Next, you'll expand a nested column to expose comments data. 

1. Select the **object_link** column and then select the ![expand icon](media/desktop-tutorial-facebook-analytics/14.png) icon to open the **Expand/Aggregate** dialog. Select **connections**, and then select **OK**. 
   
2. Select the ![expand icon](media/desktop-tutorial-facebook-analytics/14.png) icon at the top of this column, select **comments**, and then select **OK**.
   
3. Select the ![expand icon](media/desktop-tutorial-facebook-analytics/14.png) icon one more time, and this time select **Aggregate** instead of Expand in the dialog. Select **# Count of id**, and then select **OK**. The column now displays the number of comments for each message. 
   
4. Rename the **Count of object_link.connections.comments.id** column to **Number of comments**.
   
5. Select the down arrow next to **Number of comments** and select **Sort Descending** to see the Comments per message sorted from most to fewest.

### Review query steps

As you shape and transform data in the **Power Query Editor**, each step is recorded in the **Applied Steps** area of the **Query Settings** pane. You can step back through the Applied Steps to see exactly what changes you made, and edit, delete, or rearrange them if necessary, although this can be risky because changing previous steps can break following steps. After applying the data transformations in the steps so far, your Applied Steps should look like the following:

>[!TIP]
>Underlying the Applied Steps are formulas written in the **Power Query Language**, also known as the **M** language. To see and edit the formulas, select **Advanced Editor** in the **Query** group of the Home tab of the ribbon. 

### Import the transformed data

When you are satisfied with the data, select **Close & Apply** > **Close & Apply** in the Home tab of the ribbon to import it into Power BI Desktop. 

A dialog displays the progress of loading the data into the Power BI Desktop data model. 

Once the data is loaded, it appears in the Report view as columns under a new Query in the Field list.

   ![New query](media/desktop-tutorial-facebook-analytics/fb-newquery.png)

## Use the data in report visualizations 
Now that you have imported data from the Facebook page, you can quickly and easily gain insights about your data by using visualizations. Creating a visualization is easy; just select a field or drag it from the **Fields** list onto the report canvas.

### Create a bar chart

1. In Power BI Report view, select **messages** from the field list to create a table showing all posts. 
   
2. With that table selected on the canvas, select **Number of comments** in the Fields list. 
   
3. Select the **Bar chart** icon in the Visualizations pane. 
   
   The table changes to a bar chart showing the number of comments per post. Select the ellipsis (...) in the upper right of the visualization, and then select **Sort by Number of comments** to sort the posts by number of comments. 
   
4. Note that the most comments were associated with **Blank** (not in response to any post). To filter out the Blank row, select **message (all)** under **Filters** in the Visualizations pane, select **Select All**, and then select **Blank** to deselect it. The Filters entry changes to **message is not (Blank)**, and Blank row disappears form the chart visualization. 
   
### Format the chart

You want to see as much of the post text as possible in the chart. To format the chart to show as much of the Y axis (messages) as possible:
1. With the chart selected, select the **Format icon** (paint roller) in the Visualizations pane.
   
2. Select the down arrow next to **Y-axis**, and drag the slider next to **Maximum size** all the way to the right (50%). 
   
3. Also reduce the **Text size** to **10** to fit more text.
   
4. Using the handles on the chart visualization, resize the chart to be as large as possible and see the maximum amount of text and rows. 
   
You decide to give the chart a friendlier and more descriptive title than "Count of Number of comments by message". 

1. With the chart selected, select the **Format** icon, and select the dropdown arrow to expand **Title**.
2. Change the **Title text** to **Comments per post**. 
3. Select the dropdown arrow next to **Font color**, and select a green color to match the green bars of the visualization.
4. Increase the **Font size** to **10**.

The X axis (number of comments) of the chart does not show exact values, and seems lost at the bottom of the chart. To apply data labels instead: 

1. Select the Format icon, and then select the slider next to **X-axis** to turn it **Off**. 
   
2. Select the slider next to **Data labels** to turn them **On**.
   
### Edit the data type

That's better, but the data labels all have a **.0** decimal place, which is distracting and inaccurate, since **Number of posts** is a whole number. To change the data type to Whole Number:

1. Right-click **Query1** in the Fields list, or hover over it and select the **More options** ellipsis (...), and then select **Edit Query**. You can also select **Edit Queries** from the **External data** area of the Home tab in the ribbon, and then select **Edit Queries** from the dropdown. The Power BI Desktop **Power Query Editor** opens in a separate window.
   
   ![](media/desktop-tutorial-facebook-analytics/t_fb_1-intoqueryeditor.png)
   
2. Select the **Number of comments** column, and change the data type to **Whole Number** by: 
   - Selecting the **123** icon next to the **Number of comments** column header, and selecting **Whole number** from the dropdown,
   - Right-clicking the column header and selecting **Change type > Whole Number**, or
   - Selecting **Data type: Decimal Number** in the **Transform** group of the Home tab, or the **Any Column** group of the **Transform** tab, and selecting **Whole Number**.
   
   ![](media/desktop-tutorial-facebook-analytics/12.png)
   
3. Select **Apply & Close**, or **Apply** the changes and return to the Power BI Desktop report view. The data labels are now whole numbers. 
   
   ![](media/desktop-tutorial-facebook-analytics/t_fb_1-loadandclose.png)
   

### Create a date slicer

You want to be able to filter the "Comments per post" data to different time frames. To create a date slicer to filter the chart data: 

1. Click a blank area of the canvas, and then select the **Slicer icon** in the Visualizations pane. 
2. Select the **created_date** field from the Fields list, or drag it into the new slicer. 
   The slicer changes to a date range slider, based on the field's Date data type.
3. Move and resize the slicer so it doesn't overlap the chart visualization. 
4. Move the slider handles to select different date ranges, and note how the chart data filters accordingly.
   You can also select the date fields in the slicer, and type in specific dates or choose them from the calendar dropdown. 

## Create more visualizations

As you can see, it's easy to customize visualizations in your report to present the data in ways that you want. Power BI Desktop provides a seamless end-to-end experience, from getting data from a wide range of data sources and shaping it to meet your analysis needs, to visualizing this data in rich and interactive ways. When your report is ready, you can [upload it to Power BI service](desktop-upload-desktop-files.md) and create dashboards based on it, which you can share with other Power BI users.

## Next steps
* [Read other Power BI Desktop tutorials](http://go.microsoft.com/fwlink/?LinkID=521937)
* [Watch Power BI Desktop videos](http://go.microsoft.com/fwlink/?LinkID=519322)
* [Visit the Power BI Forum](http://go.microsoft.com/fwlink/?LinkID=519326)
* [Read the Power BI Blog](http://go.microsoft.com/fwlink/?LinkID=519327)

﻿