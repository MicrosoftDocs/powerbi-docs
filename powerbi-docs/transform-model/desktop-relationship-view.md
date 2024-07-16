---
title: Model view in Power BI Desktop
description: Learn how you can use Model view in Power BI Desktop to visualize the tables, column, and complex relationships in your model.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 08/10/2023
LocalizationGroup: Model your data
---
# Work with Model view in Power BI Desktop

*Model view* shows all of the tables, columns, and relationships in your model. This view can be especially helpful when your model has complex relationships between many tables.

Select the **Model view** icon near the side of the window to see a view of the existing model. Hover your cursor over a **relationship line** to show the columns used.

:::image type="content" source="media/desktop-relationship-view/model-view-03.png" alt-text="Screenshot of Model view, the model view icon, and relationship details are highlighted." lightbox="media/desktop-relationship-view/model-view-03.png":::

In the image, the *Connections* table has a *Seat ID* column that’s related to the *Unique Seats* table, which also has a *seatId* column. The two tables have a *Many to One* (\*:1) relationship. An arrow in the middle of the line shows the direction of the filter context flow. Double arrows would mean the cross-filter direction is set to *Both*.

You can double-click a relationship to open it in the **Edit relationship** dialog box. For more information about relationships, see [Create and manage relationships in Power BI Desktop](desktop-create-and-manage-relationships.md).

## Updated Model View

Current releases of Power BI Desktop have the updated **Model view** enabled.

:::image type="content" source="media/desktop-relationship-view/model-view-02.png" alt-text="Screenshot of Model view after the update.":::

The colors in the table card headers automatically match the colors you've selected in any report theme you're using. If the color is too close to white, Model view doesn't use it in the theme headers to avoid situations where it's difficult to differentiate tables in dual mode. In the previous image the card headers are white; if the report theme was using blue, the card headers in the **Model view** shown in the previous image would be blue instead of white. 

If your model has fewer than 75 tables, Model view shows all of your tables. If your model has more than 75 tables, instead of showing all tables you see the following image:

:::image type="content" source="media/desktop-relationship-view/model-view-04.png" alt-text="Screenshot of the Power BI slowdown warning for a model that has more than 75 tables.":::

 When your model has more than 75 tables, Power BI Desktop warns you that slowdowns might occur. Create a custom layout (select the *Create a custom layout* button) to reduce the significant CPU and memory used when Model view shows more than 75 tables.

## Related content

There are all sorts of things you can do with Power BI Desktop. For more information on data sources, see the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data Sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Connect to Excel in Power BI Desktop](/power-query/connectors/excel)
* [Enter data directly into Power BI Desktop](../connect-data/desktop-enter-data-directly-into-desktop.md)
