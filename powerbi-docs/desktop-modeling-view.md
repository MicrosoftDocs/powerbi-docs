---
title: Use Modeling view in Power BI Desktop
description: Use Modeling view to see complex datasets in a visual format in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 04/15/2018
ms.author: davidi

LocalizationGroup: Transform and shape data
---

# Modeling view in Power BI Desktop

With the **Modeling view** in **Power BI Desktop**, you can view and work with complex datasets that contain many tables.


## Using Modeling view

To access Modeling view, select the Modeling view icon found on the left side of **Power BI Desktop**, as shown in the following image.

![The Modeling view icon  in Power BI Desktop](media/desktop-modeling-view/modeling-view_02.png)

## Creating separate diagrams

With Modeling view, you can create diagrams of your model that contain only a subset of the tables in your model. This can help provide a clearer view into the tables you want to work with, and make working with complex datasets easier. To create a new diagram with only a subset of the tables, click the **+** sign next to the **All tables** tab along the bottom of the Power BI Desktop window.

![Create a new diagram by clicking the + sign in the tabs section](media/desktop-modeling-view/modeling-view_03.png)

You can then drag a table from the **Fields** list onto the diagram surface. Right click the table, and then select **Add related tables** from the menu that appears.

![Right-click a table and select Add related tables](media/desktop-modeling-view/modeling-view_04.png)

When you do, tables that are related to the original table are displayed in the new diagram. The following image shows how related tables are displayed after selecting the **Add related tables** menu option.

![Showing related tables](media/desktop-modeling-view/modeling-view_05.png)

## Setting common properties

You can select multiple objects at once in Modeling view by holding down the **CTRL** key and clicking multiple tables. When you select multiple tables they become highlighted in Modeling view. When multiple tables are highlighted, changes applied in the **Properties** pane apply to all selected tables.

For example, you could change the [storage mode](desktop-storage-mode.md) for multiple tables in your diagram view by holding down the **CTRL** key, selecting tables, then changing the storage mode setting in the **Properties** pane.

![Select multiple tables by holding CTRL, then set common properties across all selected tables](media/desktop-modeling-view/modeling-view_06.png)


## Next steps

The following articles describe more about data models, and also describe DirectQuery in detail.

* [Aggregations in Power BI Desktop (Preview)](desktop-aggregations.md)
* [Composite models in Power BI Desktop (Preview)](desktop-composite-models.md)
* [Storage Mode in Power BI Desktop (Preview)](desktop-storage-mode.md)
* [Many-to-many relationships in Power BI Desktop (Preview)](desktop-many-to-many-relationships.md)


DirectQuery articles:

* [Using DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery in Power BI](desktop-directquery-data-sources.md)
