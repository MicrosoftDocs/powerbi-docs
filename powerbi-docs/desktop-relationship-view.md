---
title: Model view in Power BI Desktop
description: Model view in Power BI Desktop
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 01/17/2020
ms.author: davidi

LocalizationGroup: Model your data
---
# Work with Model view in Power BI Desktop

*Model view* shows all of the tables, columns, and relationships in your model. This view can be especially helpful when your model has complex relationships between many tables.

Select the **Model** icon near the side of the window to see a view of the existing model. Hover your cursor over a relationship line to show the columns that are used.

![Model view, Power BI Desktop](media/desktop-relationship-view/relationshipview_fullscreen.png)

In the figure, the *Stores* table has a *StoreKey* column that’s related to the *Sales* table, which also has a *StoreKey* column. The two tables have a *Many to One* (\*:1) relationship. An arrow in the middle of the line shows the direction of the filter context flow. The double arrows mean the cross-filter direction is set to *Both*.

You can double-click a relationship to open it in the **Edit Relationship** dialog box. To learn more about relationships, see [Create and manage relationships in Power BI Desktop](desktop-create-and-manage-relationships.md).
