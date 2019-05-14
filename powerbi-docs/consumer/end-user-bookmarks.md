---
title: Overview of bookmarks in Power BI service reports
description: Documentation overview topic for Power BI Q&A natural language queries.
author: mihart
manager: kvivek
ms.reviewer: ''
ms.custom: seodec18

ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 05/10/2019
ms.author: mihart

LocalizationGroup: Create reports
---
# What are bookmarks?
Bookmarks capture the currently configured view of a report page, including filters, slicers, and the state of visuals. When you select a bookmark, Power BI takes you back to that view. There are two types of bookmarks - those you create yourself and those created by report *designers*.

## Use bookmarks to share insights and build stories in Power BI 
There are many uses for bookmarks. Say you discover an interesting insight and want to preserve it -- create a bookmark so you can return later. Need to leave and want to preserve your current work, create a bookmark. You can even make a bookmark your default view of the report, so each time you return, that view of the report page opens first. 

You can also create a collection of bookmarks, arrange them in the order you want, and subsequently step through each bookmark in a presentation to highlight a series of insights that tell a story.  

![Show Bookmarks Pane by selecting it from ribbon.](media/end-user-bookmarks/power-bi-bookmarks-pane.png)

## Using bookmarks
To open the Bookmarks pane, select **Bookmarks** from the menubar. To return to the original published view of the report, select **Reset to default**.

### Report bookmarks
If the report *designer* included report bookmarks, you'll find them under the **Report bookmarks** heading. 

![Show Report bookmarks.](media/end-user-bookmarks/power-bi-report-bookmark.png)

Select a bookmark to change to that report view. 

![Video showing report bookmarks being selected.](media/end-user-bookmarks/power-bi-bookmarks.gif)

### Personal bookmarks

When you create a bookmark, the following elements are saved with the bookmark:

* The current page
* Filters
* Slicers, including slicer type (for example, dropdown or list) and slicer state
* Visual selection state (such as cross-highlight filters)
* Sort order
* Drill location
* Visibility (of an object, using the **Selection** pane)
* The focus or **Spotlight** modes of any visible object

Configure a report page the way you want it to appear in the bookmark. Once your report page and visuals are arranged how you want them, select **Add** from the **Bookmarks** pane to add a bookmark. In this example, we've added some filters for region and date. 

![Add Personal bookmarks.](media/end-user-bookmarks/power-bi-add-personal.png)

**Power BI** creates a bookmark and gives it a generic name or a name you enter. You can *rename*, *delete*, or *update* a bookmark by selecting the ellipses next to the bookmark's name, then selecting an action from the menu that appears.

Once you have a bookmark, you can display it by simply selecting the bookmark in the **Bookmarks** pane. 

![Add Personal bookmarks.](media/end-user-bookmarks/power-bi-personal-bookmark.png)


<!--
## Arranging bookmarks
As you create bookmarks, you might find that the order in which you create them isn't necessarily the same order you'd like to present them to your audience. No problem, you can easily rearrange the order of bookmarks.

In the **Bookmarks** pane, simply drag-and-drop bookmarks to change their order, as shown in the following image. The yellow bar between bookmarks designates where the dragged bookmark will be placed.

![Change bookmark order by drag-and-drop](media/desktop-bookmarks/bookmarks_06.png)

The order of your bookmarks can become important when you use the **View** feature of bookmarks, as described in the next section. 

-->

## Bookmarks as a slide show
To present or view bookmarks, in order, select **View** from the **Bookmarks** pane to begin a slideshow.

When in **View** mode, there are a few features to notice:

1. The name of the bookmark appears in the bookmark title bar, which appears at the bottom of the canvas.
2. The bookmark title bar has arrows that let you move to the next or previous bookmark.
3. You can exit **View** mode by selecting **Exit** from the **Bookmarks** pane or by selecting the **X** found in the bookmark title bar. 

![Bookmark slide show](media/end-user-bookmarks/power-bi-bookmark-slideshow.png)

When you're in **View** mode, you can close the **Bookmarks** pane (by clicking the X on that pane) to provide more space for your presentation. And, while in **View** mode, all visuals are interactive and available for cross-highlighting, just as they would otherwise be when interacting with them. 

<!--
## Visibility - using the Selection pane
With the release of bookmarks, the new **Selection** pane is also introduced. The **Selection** pane provides a list of all objects on the current page and allows you to select the object and specify whether a given object is visible. 

![Enable the Selection pane](media/desktop-bookmarks/bookmarks_08.png)

You can select an object using the **Selection** pane. Also, you can toggle whether the object is currently visible by clicking the eye icon to the right of the visual. 

![Selection pane](media/desktop-bookmarks/bookmarks_09.png)

When a bookmark is added, the visible status of each object is also saved based on its setting in the **Selection** pane. 

It's important to note that **slicers** continue to filter a report page, regardless of whether they are visible. As such, you can create many different bookmarks, with different slicer settings, and make a single report page appear very different (and highlight different insights) in various bookmarks.


## Bookmarks for shapes and images
You can also link shapes and images to bookmarks. With this feature, when you click on an object, it will show the bookmark associated with that object. This can be especially useful when working with buttons; you can learn more by reading the article about [using buttons in Power BI](desktop-buttons.md). 

To assign a bookmark to an object, select the object, then expand the **Action** section from the **Format Shape** pane, as shown in the following image.

![Add bookmark link to an object](media/desktop-bookmarks/bookmarks_10.png)

Once you turn the **Action** slider to **On** you can select whether the object is a back button, a bookmark, or a Q&A command. If you select bookmark, you can then select which of your bookmarks the object is linked to.

There are all sorts of interesting things you can do with object-linked bookmarking. You can create a visual table of contents on your report page, or you can provide different views (such as visual types) of the same information, just by clicking on an object.

When you are in editing mode you can use ctrl+click to follow the link, and when not in edit mode, simply click the object to follow the link. 


## Bookmark groups

Beginning with the August 2018 release of **Power BI Desktop**, you can create and use bookmark groups. A bookmark group is a collection of bookmarks that you specify, which can be shown and organized as a group. 

To create a bookmark group, hold down the CTRL key and select the bookmarks you want to include in the group, then click the ellipses beside any of the selected bookmarks, and select **Group** from the menu that appears.

![Create a bookmark group](media/desktop-bookmarks/bookmarks_15.png)

**Power BI Desktop** automatically names the group *Group 1*. Fortunately, you can just double-click on the name and rename it to whatever you want.

![Rename a bookmark group](media/desktop-bookmarks/bookmarks_16.png)

With any bookmark group, clicking on the bookmark group's name only expands or collapses the group of bookmarks, and does not represent a bookmark by itself. 

When using the **View** feature of bookmarks, the following applies:

* If the selected bookmark is in a group when you select **View** from bookmarks, only the bookmarks *in that group* are shown in the viewing session. 

* If the selected bookmark is not in a group, or is on the top level (such as the name of a bookmark group), then all bookmarks for the entire report are played, including bookmarks in any group. 

To ungroup bookmarks, just select any bookmark in a group, click the ellipses, and then select **Ungroup** from the menu that appears. 

![Ungroup a bookmark group](media/desktop-bookmarks/bookmarks_17.png)

Note that selecting **Ungroup** for any bookmark from a group takes all bookmarks out of the group (it deletes the group, but not the bookmarks themselves). So to remove a single bookmark from a group, you need to **Ungroup** any member from that group, which deletes the grouping, then select the members you want in the new group (using CTRL and clicking each bookmark), and select **Group** again. 
-->





## Limitations and considerations
In this release of the **bookmarks**, there are a few limitations and considerations to keep in mind.

* Most custom visuals should work well with bookmarking. If you run into trouble with bookmarking and a custom visual, contact the creator of that custom visual and ask them to add support for bookmarks to their visual. 
* If you add a visual on a report page after creating a bookmark, the visual will be displayed in its default state. This also means that if you introduce a slicer into a page where you previously created bookmarks, the slicer will behave in its default state.
* Moving around visuals after a bookmark has been created will be reflected in the bookmark. 
* Generally, your bookmarks will not be affected if the report *designer* updates or republishes the report. However, if the designer makes major changes to the report, such as removing fields used by a bookmark, then you will receive an error message the next time you attempt to open that bookmark. 

<!--
## Next steps
spotlight?
-->