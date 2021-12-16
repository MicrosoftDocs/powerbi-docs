---
title: Create report bookmarks in Power BI to share insights and build stories
description: Bookmarks in Power BI let you save views and settings in your reports, and build story-like presentations
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/03/2021
LocalizationGroup: Create reports
---
# Create report bookmarks in Power BI to share insights and build stories

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

When you edit a report in Power BI Desktop and the Power BI service, you can add *report bookmarks* to capture the current state of a report page. Bookmarks save the current filters and slicers, cross-highlighted visuals, sort order, and so on. When others view your report, they can get back to that exact state by selecting your saved bookmark.

> [!NOTE]
> In the Power BI service, anyone viewing a report can create a *personal bookmark*. For more about personal bookmarks, see [Bookmarks in the Power BI service](../consumer/end-user-bookmarks.md).

![Screenshot showing Bookmarks in Power BI.](media/desktop-bookmarks/bookmarks_01.png)

There are many uses for bookmarking. For example, you can create a collection of bookmarks, arrange them in the order you want, and later step through each bookmark in a presentation to highlight a series of insights, or the story you want to tell with your visuals and reports. You can also use bookmarks to keep track of your own progress in creating reports (bookmarks are easy to add, delete, and rename).

## Create report bookmarks

You have to have permissions to edit a report to create report bookmarks that others can use.

# [Power BI Desktop](#tab/powerbi-desktop)
 
On the **View** tab, select **Bookmarks**. 

    ![Screenshot showing how to turn on the Bookmarks pane in Power B I Desktop.](media/desktop-bookmarks/bookmarks_03.png)

# [Power BI service](#tab/powerbi-service)

Select **Edit**, then select **View** and turn on **Bookmarks pane**. 

    :::image type="content" source="media/desktop-bookmarks/service-view-bookmarks.png" alt-text="Screenshot showing how to turn on the Bookmarks pane in the Power B I service.":::

---

When you create a bookmark, the following elements are saved with the bookmark:

* The current page
* Filters
* Slicers, including slicer type (for example, dropdown or list) and slicer state
* Visual selection state (such as cross-highlight filters)
* Sort order
* Drill location
* Visibility of an object (by using the **Selection** pane)
* The focus or [Spotlight mode of any visible object](../consumer/end-user-spotlight.md)

Configure a report page as you want it to appear in the bookmark. After your report page and visuals are arranged how you want them, select **Add** from the **Bookmarks** pane to add a bookmark. 

![Add a bookmark.](media/desktop-bookmarks/bookmarks_04.png)

Power BI creates a bookmark and gives it a generic name. You can easily **Rename**, **Delete**, or **Update** a bookmark by selecting the ellipsis next to the bookmark's name, then selecting an action from the menu that appears.

![Screenshot showing selecting the bookmark menu by using the ellipsis.](media/desktop-bookmarks/bookmarks_05.png)

After you've created a bookmark, display it by selecting it in the **Bookmarks** pane. 

You can also select whether each bookmark will apply **Data** properties, such as filters and slicers; **Display** properties, such as spotlight and its visibility; and **Current page** changes, which present the page that was visible when the bookmark was added. These capabilities are useful when you use bookmarks to switch between report views or selections of visuals, in which case you'd likely want to turn off data properties, so that filters aren't reset when users switch views by selecting a bookmark. 

To make such changes, select the ellipsis next to the bookmark's name, then select or unselect the checkmarks next to **Data**, **Display**, and other controls. 

## Arranging bookmarks

As you create report bookmarks, you might find that the order in which you create them is different from the order you'd like to present to your audience. No problem, you can easily rearrange the order of bookmarks.

- In the **Bookmarks** pane, drag-and-drop bookmarks to change their order. 

   The yellow bar between bookmarks designates where the dragged bookmark will be placed.

   ![Screenshot showing changing bookmark order by drag-and-drop.](media/desktop-bookmarks/bookmarks_06.png)

The order of your bookmarks can be important when you use the **View** feature of bookmarks, as described in the next section.

> [!NOTE]
> You can't rearrange personal bookmarks.

## Bookmarks as a slide show
When you have a collection of bookmarks you would like to present, in order, you view them as a slide show in Power BI Desktop, and in the Power BI service in either **Edit** or **Reading mode**.  

- In the **Bookmarks** pane, select **View**.

    :::image type="content" source="media/desktop-bookmarks/service-bookmarks-pane-view-slide-show.png" alt-text="Select View in the Bookmarks pane.":::

Read more about [using bookmarks as a slideshow](../consumer/end-user-bookmarks.md#bookmarks-as-a-slide-show).

## Visibility: Using the Selection pane
Related to the **Bookmarks** pane, the **Selection** pane provides a list of all objects on the current page and allows you to select an object and specify whether it's visible. In Power BI Desktop, the Selection pane is on the **View** tab. When you're editing a report in the Power BI service, it's on the **View** menu. You don't see it if you can't edit the report.

![Screenshot showing enabling the Selection pane.](media/desktop-bookmarks/bookmarks_08.png)

In the **Selection** pane, you select an object and toggle whether the object is currently visible by selecting the eye icon to the right of the object. 

![Screenshot showing Selection pane.](media/desktop-bookmarks/bookmarks_09.png)

When you add a bookmark, the visibility status of each object is also saved, based on its setting in the **Selection** pane. 

It's important to note that slicers continue to filter a report page, regardless of whether they're visible. As such, you can create many different bookmarks, with different slicer settings, and make a single report page appear different (and highlight different insights) in various bookmarks.

> [!NOTE]
> When using the **Selection** pane in combination with bookmarks, changing the visibility of a selection results in its visibility reverting to the default setting. After making such changes, you can right-click a bookmark and select *update* to update its visibility.

## Assign bookmarks to buttons
You can also link shapes and images to bookmarks. With this feature, when you select an object, it shows the bookmark associated with that object. This feature can be especially useful when you work with buttons. For more information, see [Using buttons in Power BI](desktop-buttons.md). 

To assign a bookmark to an object: 

1. Select the object in the report canvas. Then, from the **Format shape** pane that appears, turn the **Action** slider to **On**.

2. Expand the **Action** section. Under **Type**, select **Bookmark**.

3. Under **Bookmarks**, select a bookmark.

   ![Screenshot showing adding a bookmark link to an object.](media/desktop-bookmarks/bookmarks_10.png)

There are all sorts of interesting things you can do with object-linked bookmarking. You can create a visual table of contents on your report page, or you can provide different views (such as visual types) of the same information.

When you're in editing mode, press **Ctrl** and select the link to follow it. When you're not in editing mode, select the object to follow the link. 

## Bookmark groups

When editing a report, you can create and use bookmark groups. A bookmark group is a collection of bookmarks that you specify, which can be shown and organized as a group. You can't create groups of personal bookmarks.

### Create a bookmark group

1. Press **Ctrl** and select the bookmarks you want to include in the group. 

2. Select the ellipsis next to your selected bookmarks, and then select **Group** from the menu that appears.

   ![Screenshot showing creating a bookmark group.](media/desktop-bookmarks/bookmarks_15.png)

    Power BI Desktop automatically names the group *Group 1*. You can select the ellipsis next to this name, select **Rename**, and rename it to whatever you want.

    ![Screenshot showing renaming a bookmark group.](media/desktop-bookmarks/bookmarks_16.png)

Expanding the bookmark group's name only expands or collapses the group of bookmarks, and doesn't represent a bookmark by itself.

### Bookmark groups in View mode

When you use the **View** feature of bookmarks, the following details apply:

* If the selected bookmark is in a group when you select **View** from bookmarks, only the bookmarks *in that group* are shown in the viewing session. 

* If the selected bookmark isn't in a group, or is on the top level (such as the name of a bookmark group), then all bookmarks for the entire report are played, including bookmarks in any group. 

### Ungroup bookmarks

1. Select any bookmark in a group and select the ellipsis. 

2. Select **Ungroup** from the menu that appears.

   ![Screenshot showing ungrouping a bookmark group.](media/desktop-bookmarks/bookmarks_17.png)

   Selecting **Ungroup** for any bookmark from a group removes all bookmarks from the group; it deletes the group, but not the bookmarks themselves. 

### Remove a single bookmark from a group

1. **Ungroup** any member from that group, which deletes the entire grouping. 

2. Select the members you want in the new group by pressing **Ctrl** and selecting each bookmark, then and select **Group** again. 

## Considerations and limitations
In this release of bookmark features, there are a few considerations and limitations to keep in mind.

* Most Power BI visuals work well with bookmarks. However, if you encounter problems with bookmarks and a custom visual, contact the creator of that custom visual and ask them to add support for bookmarks to their visual. 
* If you add a visual on a report page after creating a bookmark, the visual is displayed in its default state. That is, if you add a slicer to a page where you previously created bookmarks, the slicer behaves in its default state.
* If you move a visual after you create a bookmark, when you select the bookmark, the visual appears where you moved it.

## Next steps
For more information about features that are similar or interact with bookmarks, see the following articles:

* [Use drillthrough in Power BI Desktop](desktop-drillthrough.md)
* [Display a dashboard tile or report visual in focus mode](../consumer/end-user-focus.md)
