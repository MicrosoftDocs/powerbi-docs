---
title: Connect to data in Power BI Desktop
description: Practice how to bring connect to data and transform it for use in Power BI Desktop by using sample data from the internet.
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/30/2026
LocalizationGroup: Connect to data
---

# Connect to data sources in Power BI Desktop

By using Power BI Desktop, you can connect to the ever-expanding world of data. If you don't have Power BI Desktop, [download](https://go.microsoft.com/fwlink/?LinkID=521662) and install it.

Power BI Desktop supports many data sources. The following image shows a small sample of all the data sources you can use when you select **Get data**.

:::image type="content" source="media/desktop-connect-to-data/get-data-from-web.png" alt-text="Screenshot of the list of all data sources.":::

## Example of connecting to data

For this example, connect to a **Web** data source.

Imagine you’re retiring. You want to live where there’s lots of sunshine, preferable taxes, and good health care. Or perhaps you’re a data analyst, and you want that information to help your customers, as in, help your raincoat manufacturing client target sales where it rains a lot.

Either way, you find a Web resource that has interesting data about those topics, and more:

[https://www.kiplinger.com/retirement/happy-retirement/best-places-to-retire-in-the-us](https://www.kiplinger.com/retirement/happy-retirement/best-places-to-retire-in-the-us)

Select **Get data** > **Other** > **Web** > **Connect**. In the **From Web** dialog, you can choose between two options:

- **Basic**: Enter a single URL to connect to a web page or file.
- **Advanced**: Build a URL from multiple parts, add HTTP request headers, or specify a command timeout.

For this example, select **Basic** and enter the address.

:::image type="content" source="./media/desktop-connect-to-data/from-web-url.png" alt-text="Screenshot that shows providing the data source URL.":::

When you select **OK**, the *Query* functionality of Power BI Desktop goes to work. Power BI Desktop contacts the Web resource, and the **Navigator** window returns the results of what it found on that Web page. In this case, it found a table. You're interested in that table, so select it from the list. The **Navigator** window displays a preview.

:::image type="content" source="media/desktop-connect-to-data/navigator-select-table.png" alt-text="Screenshot that shows the preview of data in Navigator when you select a table." lightbox="media/desktop-connect-to-data/navigator-select-table.png":::

You can use the **Transform data** feature to edit the query before loading the table, or just load the table.

Select **Transform Data** to load the table and launch Power Query Editor. The **Query Settings** pane is displayed. If it's not, select **View** from the ribbon, then choose **Query Settings** to display the **Query Settings** pane. Here’s what the editor looks like.

:::image type="content" source="media/desktop-connect-to-data/query-settings.png" alt-text="Screenshot that shows the Power Query Editor with Query Settings open." lightbox="media/desktop-connect-to-data/query-settings.png":::

The final rank scores are text rather than numbers, and you need them to be numbers. No problem. First, clean the data so that there's no text in the column. Right-click the **Rank** column header, and select **Replace values...**. Enter `(same as 2024)` in the **Value to find** field, then select **OK**.

:::image type="content" source="./media/desktop-connect-to-data/replace-values.png" alt-text="Screenshot that shows using the 'Replace values' function to remove text.":::

Next, change the data type. Right-click the **Rank** header again. Select **Change Type** > **Whole Number** to change them. To choose more than one column, first select a column then choose **Shift**, select other adjacent columns, and then right-click a column header to change all selected columns. Use **Ctrl** to choose columns that aren't adjacent.

In **Query Settings**, the **APPLIED STEPS** reflect any changes that you made. As you make more changes to the data, Power Query Editor records those changes in the **APPLIED STEPS** section, which you can adjust, revisit, rearrange, or delete as necessary.

:::image type="content" source="media/desktop-connect-to-data/applied-steps.png" alt-text="Screenshot of the Applied Steps section in Query Settings.":::

You can make other changes to the table after it loads, but for now these changes are enough. When you're done, select **Close & Apply** from the **Home** ribbon, and Power BI Desktop applies the changes and closes Power Query Editor.

:::image type="content" source="media/desktop-connect-to-data/close-apply.png" alt-text="Screenshot of the Close and Apply button on the Home ribbon.":::

With the data model loaded, in **Report** view in Power BI Desktop, you can begin creating visualizations by dragging fields onto the canvas or selecting them from the **Data** pane.

:::image type="content" source="media/desktop-connect-to-data/visualize-data.png" alt-text="Screenshot of a visualization on the canvas created by dragging a value from the Data pane." lightbox="media/desktop-connect-to-data/visualize-data.png":::

This model is simple, with a single data connection. Most Power BI Desktop reports have connections to different data sources, shaped to meet your needs, with relationships that produce a rich data model.

## Related content

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview in Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and combine data in Power BI Desktop](desktop-shape-and-combine-data.md)
* [Perform common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)

Want to give us feedback? Great! Use the **Submit an Idea** menu item in Power BI Desktop or visit [Community Feedback](https://community.powerbi.com/t5/Community-Feedback/bd-p/community-feedback). The Power BI team looks forward to hearing from you!

:::image type="content" source="media/desktop-connect-to-data/sendfeedback.png" alt-text="Screenshot of the Submit an idea menu item in Power BI Desktop.":::
