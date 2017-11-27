---
title: Use the matrix visual in Power BI Desktop
description: Learn how the matrix visual enables step layouts and granular highlighting in Power BI Desktop
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
ms.date: 10/05/2017
ms.author: davidi

---
# Use the Matrix visual in Power BI Desktop
With the **Matrix** visual, you can create matrix visuals (sometimes also referred to as *tables*) in **Power BI Desktop** reports, and cross-highlight elements within the matrix with other visuals. In addition, you can select rows, columns, and even individual cells and cross-highlight. Lastly, to make better use of layout space, the matrix visual supports a stepped layout.

![](media/desktop-matrix-visual/matrix-visual_2a.png)

There are many features associated with the matrix, and we'll go through them in the following sections of this article.

> [!NOTE]
> Beginning with the July 2017 release of **Power BI Desktop**, matrix and table visuals reflect styling (including colors) from the applied **Report Theme**. These may not be the colors you expect for your matrix visual, which you can change in your **Report Theme** configuration. See [**Use Report Themes in Power BI Desktop**](desktop-report-themes.md) for more information about themes.
> 
> 

## Using drill-down with the Matrix visual
With the **Matrix** visual, you can do all sorts of interesting drill-down activities that weren't available before. This includes the ability to drill-down using rows, columns, and even into individual sections and cells. Let's take a look at how each of these work.

### Drill-down on row headers
In the **Visualizations** pane, when you add multiple fields to the **Rows** section of the **Fields** well, you enable drill-down on the rows of the matrix visual. This is similar to creating a hierarchy, which then allows you to drill-down (and then back up) through that hierarchy, and analyze the data at each level.

In the following image, the **Rows** section contains *Category* and *SubCategory*, creating a grouping (or hierarchy) in the rows that we can drill through.

![](media/desktop-matrix-visual/matrix-visual_4.png)

When the visual has grouping created in the **Rows** section, the visual itself displays the *drill* and *expand* icons in the top-left corner of the visual.

![](media/desktop-matrix-visual/matrix-visual_5.png)

Similar to the drill and expand behavior in other visuals, selecting those buttons lets us drill-down (or back up) through the hierarchy. In this case we can drill down from *Category* to *SubCategory*, as shown in the following image, where the drill-down one level icon (the pitchfork) has been selected.

![](media/desktop-matrix-visual/matrix-visual_6.png)

In addition to using those icons, you can right-click on any of those row headers, and drill down by selecting from the menu that appears.

![](media/desktop-matrix-visual/matrix-visual_7.png)

Notice there are a few options from the menu that appears, which generates different results:

Selecting **Drill Down** expands the matrix for *that* row level, *excluding* all other row headings except the row header that was right-clicked. In the following image, *Computers* was right-clicked, and **Drill Down** was selected. Notice that other top-level rows no longer appear in the matrix. This is a useful feature, and becomes especially cool when we get to the **cross-highlighting** section.

![](media/desktop-matrix-visual/matrix-visual_8.png)

We can click the **Drill up** icon to get back to the previous top-level view. If we then select **Show Next Level** from the right-click menu, we get an alphabetical listing of all the next-level items (in this case, the *SubCategory* field), without the higher-level hierarchy categorization.

![](media/desktop-matrix-visual/matrix-visual_8a.png)

When we click on the **Drill up** icon in the upper-left corner to have the matrix show all top-level categories, then right-click again and select **Expand to next level**, we see the following:

![](media/desktop-matrix-visual/matrix-visual_9.png)

You can also use the **Include** and **Exclude** menu items to keep (or remove, respectively) the right-clicked row (and any subcategories) from the matrix.

### Drill-down on column headers
Similar to the ability to drill-down on Rows, you can also drill-down on **Columns**. In the following image, you can see that there are two fields in the **Columns** field well, creating a hierarchy similar to what we used for the rows earlier in this article. In the **Columns** field well, we have *Class* and *Color*.

![](media/desktop-matrix-visual/matrix-visual_10.png)

In the **Matrix** visual, when we right-click a column, we see the option to drill-down. In the following image, we right-click on *Deluxe* and select **Drill Down**.

![](media/desktop-matrix-visual/matrix-visual_11.png)

When **Drill Down** is selected, the next level of the column hierarchy for *Deluxe* is displayed, which in this case is *Color*.

![](media/desktop-matrix-visual/matrix-visual_12.png)

The rest of the right-click menu items work on Columns in the same way they do for rows (see the previous section, **Drill-down on row headers**). You can **Show Next Level**, **Expand to next level**, and **Include** or **Exclude** your columns just as you can with rows.

> [!NOTE]
> The icons drill-down and drill-up icons in the upper left of the matrix visual only apply to rows. In order to drill-down on columns, you must use the right-click menu.
> 
> 

## Stepped layout with matrix visuals
The **Matrix** visual automatically indents subcategories in a hierarchy beneath each parent, which is called a **stepped layout**.

In the *original* version of the matrix visual, subcategories were shown in an entirely different column, taking up much more space in the visual. The following image shows the table in original **matrix** visual; notice the subcategories in a completely separate column.

![](media/desktop-matrix-visual/matrix-visual_14.png)

In the following image, you see a **Matrix** visual, with **stepped layout** in action. Notice the category *Computers* has its subcategories (Computers Accessories, Desktops, Laptops, Monitors, and so on) slightly indented, providing a cleaner and much more condensed visual.

![](media/desktop-matrix-visual/matrix-visual_13.png)

You can easily adjust the **stepped layout** settings. With the **Matrix** visual selected, in the **Format** section (the paint roller icon) of the **Visualizations** pane, expand the **Row headers** section. In there are two options: the **Stepped layout** toggle (which turns it off or on), and the **Stepped layout indentation** (specifies the indentation amount, in pixels).

![](media/desktop-matrix-visual/matrix-visual_15.png)

If you turn off **Stepped layout**, the subcategories are shown in another column rather than indented beneath the parent category.

## Subtotals with matrix visuals
You can turn subtotals on or off in matrix visuals, for both rows and columns. In the following image, you can see that the row subtotals are set to **on**.

![](media/desktop-matrix-visual/matrix-visual_20.png)

In the **Format** section of the **Visualizations** pane, expand the **Subtotals** card and turn the **Row subtotals** slider to **Off**. When you do so, the subtotals are not shown.

![](media/desktop-matrix-visual/matrix-visual_21.png)

The same process applies for column subtotals.

## Cross-highlighting with matrix visuals
With the **Matrix** visual, any elements in the matrix can be selected as the basis for cross-highlighting. Select a column in a **Matrix** and that column is highlighted, as are any other visuals on the report page. This has been a common feature of other visuals and the selection of a data point, and now the **Matrix** visual can participate.

In addition, using CTRL+Click also works for cross-highlighting. For example, in the following image a collection of subcategories were selected from the **Matrix** visual. Notice how items that weren't selected from the visual are grayed out, and how the other visuals on the page reflect the selections made in the **Matrix** visual.

![](media/desktop-matrix-visual/matrix-visual_16.png)

## Shading and font colors with matrix visuals
With the **Matrix** visual, you can apply **conditional formatting** (colors and shading) to the background of cells within the matrix, and you can apply conditional formatting to the text and values themselves.

To apply conditional formatting, you can do either of the following when a matrix visual is selected:

* In the **Fields** pane, right-click the Field, and select **Conditional formatting** from the menu.
  
  ![](media/desktop-matrix-visual/matrix-visual_17.png)
* Or, in the **Format** pane, expand the **Conditional formatting** card and for either **Background color scales** or **Font color scales**, turn the slider to **On**. Turning either on displays a link for *Advanced controls*, which allows you to customize the colors and values for the color formatting.
  
  ![](media/desktop-matrix-visual/matrix-visual_18.png)

Either approach achieves the same result. Selecting *Advanced controls* displays the following dialog, which lets you make adjustments:

![](media/desktop-matrix-visual/matrix-visual_19.png)

## Limitations and considerations
In this release of the **Matrix** visual, there are a few limitations and considerations to keep in mind.

* Drill on columns can only be done by using the right-click menu, and there's currently no indication on the visual that you can drill into row or column groups
* You can only expand all items in a level at once, rather than expanding one category at a time
* **See Records** may appear on a menu when right-clicking a column headers, but it is not operational
* There currently is no *Grand total* row
* Turning off the subtotal row in stepped layout doesn't have any effect
* Column headers may be truncated if inner groups have shorter text than the outer group
* Changing the stepped layout indentation shouldn't indent the outermost row group's indent

We're always eager to hear your thoughts. We're currently conducting a **survey** on this **Matrix** visual, so if you have a few minutes, please [take the survey](https://www.instant.ly/s/PYXT1).

