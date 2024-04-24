---
title: Assume Referential Integrity setting in Power BI Desktop
description: Learn how to have Power BI Desktop assume referential integrity, which enables queries to use INNER JOIN statements.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/18/2023
LocalizationGroup: Connect to data
---
# Apply the Assume Referential Integrity setting in Power BI Desktop

When connecting to a data source using DirectQuery, you can use the **Assume Referential Integrity** selection to enable running more efficient queries against your data source. This feature has a few requirements of the underlying data, and it's only available when using DirectQuery.

Setting **Assume Referential Integrity** enables queries on the data source to use *INNER JOIN* statements rather than *OUTER JOIN*, which improves query efficiency.

![Screenshot of an Edit Relationship dialog to select Assume Referential Integrity.](media/desktop-assume-referential-integrity/assume-referential-integrity_1.png)

## Requirements for using Assume Referential Integrity

This setting is an advanced setting, and is only enabled when connecting to data using DirectQuery. The following requirements are necessary for **Assume Referential Integrity** to work properly:

- Data in the **From** column in the relationship is never *Null* or *blank*
- For each value in the **From** column, there's a corresponding value in the **To** column

In this context, the **From** column is the *Many* in a *One-to-Many* relationship, or it's the column in the first table in a *One-to-One* relationship.

## Example of using Assume Referential Integrity

The following example demonstrates how **Assume Referential Integrity** behaves when used in data connections. The example connects to a data source that includes an **Orders** table, a **Products** table, and a **Depots** table.

- In the following image that shows the **Orders** table and the **Products** table, referential integrity exists between **Orders[ProductID]** and **Products[ProductID]**. The **[ProductID]** column in the **Orders** table is never *Null*, and every value also appears in the **Products** table. As such, **Assume Referential Integrity** should be set to get more efficient queries. Using this setting doesn't change the values shown in visuals.

  ![Screenshot of Orders table and Products table.](media/desktop-assume-referential-integrity/assume-referential-integrity_2.png)

- In the next image, notice that no referential integrity exists between **Orders[DepotID]** and **Depots[DepotID]**, because the **DepotID** is *Null* for some *Orders*. As such, **Assume Referential Integrity** should *not* be set.

  ![Screenshot of Orders table and Depots table.](media/desktop-assume-referential-integrity/assume-referential-integrity_3.png)

- Finally, no referential integrity exists between **Orders[CustomerID]** and **Customers[CustID]** in the following tables. The **CustomerID** contains some values, in this case, *CustX*, that don't exist in the *Customers* table. As such, **Assume Referential Integrity** should *not* be set.

  ![Screenshot of Orders table and Customers table.](media/desktop-assume-referential-integrity/assume-referential-integrity_4.png)

## Setting Assume Referential Integrity

To enable this feature, select **Assume Referential Integrity** as shown in the following image.

![Screenshot of an Edit Relationship dialog that allows you to select Assume Referential Integrity.](media/desktop-assume-referential-integrity/assume-referential-integrity_1.png)

When selected, the setting is validated against the data to ensure there are no *Null* or mismatched rows. However, for cases with a very large number of values, the validation isn't a guarantee that there are no referential integrity issues.

In addition, the validation occurs at the time of editing the relationship, and does *not* reflect any subsequent changes to the data.

## What happens if you incorrectly set Assume Referential Integrity?

If you set **Assume Referential Integrity** when there are referential integrity issues in the data, that setting doesn't result in errors. However, it does result in apparent inconsistencies in the data. For example, for the relationship to the **Depots** table described here, it would result in the following:

- A visual showing the total *Order Qty* would show a value of 40
- A visual showing the total *Order Qty by Depot City* would show a total value of only *30*, because it wouldn't include Order ID 1, where **DepotID** is *Null*.

## Related content

- Learn more about [DirectQuery](desktop-use-directquery.md).
- Get more information about [Relationships in Power BI](../transform-model/desktop-create-and-manage-relationships.md).
- Learn more about [Relationship View in Power BI Desktop](../transform-model/desktop-relationship-view.md).
