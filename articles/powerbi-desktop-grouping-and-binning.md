<properties
   pageTitle="Use grouping and binning in Power BI Desktop"
   description="Learn how to group and bin elements in Power BI Desktop"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/12/2016"
   ms.author="davidi"/>

# Use grouping and binning in Power BI Desktop

When **Power BI Desktop** creates visuals, it aggregates your data into chunks (or **groups**) based on values found in the underlying data. Often that's fine, but there may be times when you want to refine how those chunks are presented. For example, you might want to place three categories of products in one larger category (one *group*). Or you might want to see sales figures put into bin-sizes of 1,000,000 dollars, instead of evenly-divided 923,983 dollars.

In Power BI Desktop, you can **group** data points to help you more clearly view, analyze, and explore data and trends in your visuals. You can also define the **bin size**, often called **binning**, to put values into equally sized groups that better enable you to visualized data in ways that are meaningful.

### Using grouping

To use **grouping**, select two or more elements on a visual by using CTRL+CLICK to multi-select elements. Then right-click one of the multi-select elements, and select *Group* from the menu that appears.

![](media/powerbi-desktop-grouping-and-binning/grouping-binning_1.png)

Once created, the group is added to the **Legend** bucket for the visual, and also appears in the **Fields** list.

![](media/powerbi-desktop-grouping-and-binning/grouping-binning_2.png)

Once you have a group, you can easily edit the members of that group by right-clicking the field from the **Legend** bucket or from the **Fields** list, and selecting *Edit Groups*.

![](media/powerbi-desktop-grouping-and-binning/grouping-binning_3.png)

In the **Groups** window that appears, you can create new groups or modify existing groups. You can also select whether ungrouped categories should be placed into the **Other** group, or should remain ungrouped.

![](media/powerbi-desktop-grouping-and-binning/grouping-binning_4.png)

> Note: You can create groups for any field in the **Fields** well, without having to multi-select from an existing visual. Just right-click the field, and select **Group** from the menu that appears.

### Using binning

You can set the bin size for numerical and time fields in **Power BI Desktop.** You can use binning to right-size the data that **Power BI Desktop** displays.

To apply a bin size, right-click a **Field** and select **Groups**.

![](media/powerbi-desktop-grouping-and-binning/grouping-binning_5.png)

From the **Groups** window, set the **Bin size** to the size you want.

![](media/powerbi-desktop-grouping-and-binning/grouping-binning_6.png)

When you select **OK**, you'll notice that a new field appears in the **Fields** pane with *(bins)* appended. You can then drag that field onto the canvas to use the bin size in a visual.

![](media/powerbi-desktop-grouping-and-binning/grouping-binning_7.png)

To see **binning** in action, take a look at this [video](https://youtu.be/UXEYSvgvMaQ?t=12m17s).

And that's all there is to using **grouping** and **binning** to ensure the visuals in your reports show your data just the way you want them to.
