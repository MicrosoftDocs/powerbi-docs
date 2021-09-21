---
title: Model view in Power BI Desktop
description: Model view in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 02/24/2021
LocalizationGroup: Model your data
---
# Work with Model view in Power BI Desktop

*Model view* shows all of the tables, columns, and relationships in your model. This view can be especially helpful when your model has complex relationships between many tables.

Select the **Model** icon near the side of the window to see a view of the existing model. Hover your cursor over a relationship line to show the columns that are used.

:::image type="content" source="media/desktop-relationship-view/model-view-03.png" alt-text="Model view showing relationships":::

In the image, the *Connections* table has a *Seat ID* column that’s related to the *Unique Seats* table, which also has a *seatId* column. The two tables have a *Many to One* (\*:1) relationship. An arrow in the middle of the line shows the direction of the filter context flow. Double arrows would mean the cross-filter direction is set to *Both*.

You can double-click a relationship to open it in the **Edit Relationship** dialog box. To learn more about relationships, see [Create and manage relationships in Power BI Desktop](desktop-create-and-manage-relationships.md).


## New Model View (Preview)

Current releases of Power BI Desktop have a preview version of the new **Model view**, which you can enable. Once you switch to the new Model view, the change is permanent.

:::image type="content" source="media/desktop-relationship-view/model-view-01.png" alt-text="Model view before update":::

Once you update, you can see that the tables and connections are updated.

:::image type="content" source="media/desktop-relationship-view/model-view-02.png" alt-text="Model view after update":::

The colors in the table card headers will automatically match the colors you've selected in any report theme you're using. If the color is too close to white, it won't be used in the Model view theme headers to avoid situations where it's difficult to differentiate tables in dual mode.

If your model has less than 75 tables, all tables will be shown in Model view. If your model has more than 75 tables, instead of showing all tables you see the following image:

:::image type="content" source="media/desktop-relationship-view/model-view-04.png" alt-text="More than 75 tables":::

We recommend you create a custom layout when your model has more than 75 tables (select the *Create a custom layout* button) to reduce the significant CPU and memory used when more than 75 tables are displayed.

## Next steps
There are all sorts of things you can do with Power BI Desktop. For more information on data sources, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data Sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](../connect-data/desktop-connect-excel.md)   
* [Enter data directly into Power BI Desktop](../connect-data/desktop-enter-data-directly-into-desktop.md)   
