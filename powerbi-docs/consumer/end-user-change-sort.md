---
title: Change how a chart is sorted in a report
description: Change how a chart is sorted in a Power BI report
author: mihart
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 12/01/2019
ms.author: mihart
#customer intent: As a PBI consumer, I want to learn how to sort my report visuals so that they look the way I like and are easier to interpret. 
LocalizationGroup: Reports
---

# Change how a chart is sorted in a Power BI report

[!INCLUDE [power-bi-service-new-look-include](../includes/power-bi-service-new-look-include.md)]

This article explains sorting for Power BI users who do not have edit permissions to the report or dataset. For more detailed instructions for sorting, please read [Sort by column in Power BI Desktop]()

In the Power BI service, you can change how a visual looks by sorting it by different data fields. By changing how you sort a visual, you can highlight the information you want to convey, and ensure the visual reflects that trend (or emphasis).

Whether you're using numeric data (such as sales figures) or text data (such as state names), you can sort your visualizations as desired, and make them look like you want them to. Power BI provides lots of flexibility for sorting, and quick menus for you to use. On any visual, select **More actions** (...) and then select the field by which you want to sort.

![bar chart sorted alpha by X axis](media/end-user-change-sort/power-bi-more-actions.png)

Visuals on a dashboard cannot be sorted, but in a Power BI report, you can sort most visualizations alphabetically by the names of the categories in the chart, or by the numeric
values of each category. For example, this chart is sorted alphabetically by the category **store name**.

![bar chart sorted alpha by X axis](media/end-user-change-sort/pbi-chartsortcategory.png)

It's easy to change the sort from a category (store name) to a value (sales per square feet) instead.

1. Select **More actions** (...) and choose **Sort by > Sales Per Sq Ft**.
2. If necessary, select **More actions** (...) again and choose **Sort descending**. The field that is being used to sort is in bold and has a yellow bar.

   ![video showing selecting sort by and then ascending, descending](media/end-user-change-sort/sort.gif)

> [!NOTE]
> Not all visuals can be sorted. For example, the following visuals cannot be sorted: treemap, map, filled map, scatter, gauge, card, waterfall.

## Saving changes you make to sort order
Power BI reports retain the filters, slicers, sorting, and other data view changes that you make. So if you navigate away from a report, and return later, your changes are saved.  If you want to revert your changes back to the report designer's settings, select **Reset to default** from the upper menu bar. 

![persistent sorting](media/end-user-change-sort/power-bi-reset.png)

If however, the **Reset to default** button is greyed out, that means the report designer has disabled the ability to save (persist) your changes.

<a name="other"></a>
## Sorting using other criteria
Sometimes, you want to sort your visual using a different field (that isn't included in the visual) or other criteria.  For example, you might want
to sort by month (and not in alphabetical order) or you might
want to sort by entire numbers instead of by digit (example, 0, 1, 9, 20 and not 0, 1, 20, 9).  The report designer will be able to update the dataset to enable this type of sorting. Contact information for the designer can be found by selecting the report name from the header bar.

![Dropdown showing contact information](media/end-user-change-sort/power-bi-contact.png)

## Next steps
More about [Visualizations in Power BI reports](end-user-visualizations.md).

[Power BI - Basic Concepts](end-user-basic-concepts.md)
