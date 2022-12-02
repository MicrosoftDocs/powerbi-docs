---
title: Bookmarks in the Power BI service
description: In the Power BI service, learn how to open, create, and share personal bookmarks and report bookmarks.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 12/01/2022
LocalizationGroup: Create reports
---
# Bookmarks in the Power BI service

[!INCLUDE[consumer-appliesto-ynnm](../includes/consumer-appliesto-ynnm.md)]

## Introduction to bookmarks

A bookmark captures the state of a report page. It saves the settings that you make to filters, slicers, and visuals on a page. When the report page is set the way you want, give it a suitable name. Now you can return to that state of the report page by selecting the bookmark.

## Types of bookmarks

There are two types of bookmarks, *personal* and *report*. Designers add report bookmarks to a report. When a designer shares the report with colleagues, the bookmarks go with the report. Everyone that opens and views that report can see and use the report bookmarks. Personal bookmarks can be created by anyone who can open a report. They don't require edit permissions. If you create personal bookmarks and share your report, the personal bookmarks don't go with the report. Personal bookmarks are for your use only. However, if you want to share your personal bookmarks, this article provides tips and tricks to do so.

:::image type="content" source="media/end-user-bookmarks/power-bi-both-bookmark.png" alt-text="A screenshot showing the Bookmarks menu.":::

Report bookmarks are created by others and shared with you. To view shared content, a Power BI Pro or Premium Per User license is required. For more information, see [Licenses and subscriptions for business users](end-user-license.md).

If you design reports and create report bookmarks for others to use, see [Create report bookmarks in Power BI](../create-reports/desktop-bookmarks.md).

## Use personal bookmarks to save insights and build stories in Power BI

There are many uses for personal bookmarks. For example, if you discover an interesting insight and want to preserve it, you can create a personal bookmark to return to later. Or, if you need to step away from your work and want to preserve it, use a personal bookmark. You can even make a personal bookmark your default view of a report, so each time you return, that view of the report page opens.

Create a collection of bookmarks, arrange them in the order you want, and show each bookmark in a presentation to highlight a series of insights. This feature works like a slideshow where you select an arrow to go forward or backward. There's a limit of 20 personal bookmarks per report.

### Open the Bookmarks pane

Select the :::image type="icon" source="media/end-user-bookmarks/power-bi-bookmark.png"::: icon in the upper right corner of a visual to open the **Bookmarks** pane. Select **Add a personal bookmark** or **Show more bookmarks**.

:::image type="content" source="media/end-user-bookmarks/power-bi-bookmark-icon.png" alt-text="A screenshot showing the bookmarks icon in the action bar.":::

### Share changes

You can't share your personal bookmarks with others, but you can save a report with your personal bookmarked view active. When colleagues with read access open that report, they see the view you selected. The personalized view of the report doesn't override the designer's original report or the designer's report bookmarks. When you share with colleagues who don't have read access, reshare permissions are required. If you're unable to share your view of the report, contact the report owner to request reshare permission.

If you do have reshare permissions, you can select **Include my changes** when you share the report. Then the recipients can see your bookmarked view.

:::image type="content" source="media/end-user-bookmarks/power-bi-share-changes.png" alt-text="A screenshot showing the Share dialog. Include my changes is outlined.":::

These are a few ways you can share your view with others:

- **Share your active view**. If you have a personal bookmark active when you share your report, recipients see the bookmarked version of that report page but don't see your bookmark in their "Personal bookmarks" list. They see the result of your personal bookmark.

- **Chat in teams**. Similar to the previous method, with a personal bookmark active, you can share a report in Microsoft Teams. Select **Chat in Teams** from **More options** on the top menu. In the **Chat in Teams** dialog, enter the name of the Team or Channel that you want to share to. Select **Share**. You can also copy and share the URL from the **Chat in Teams** dialog. For more information, see [Share personal bookmarks in Teams chat](../collaborate-share/service-share-reports.md).

- **Use the comment feature**. With a personal bookmark active, add a comment. When other users select the comment, the current view is saved for them to view. For more information, see [Add comments to dashboards and reports](end-user-comment.md).

If you make changes to your personal bookmark after you share a report, it has no effect on your recipients' view. For example, if you share a report with a 2021 date filter applied and then change the year to 2022 in your bookmark, your recipient still sees the 2021 filter.

> [!NOTE]
> To share reports, you need a Power BI Pro or Premium Per User license, or the report must be saved in reserved capacity. To learn more, see [Licensing and subscriptions for business users](end-user-license.md).

## Create personal bookmarks

If you can view a report, you can add personal bookmarks. You can create up to 20 personal bookmarks per report. When you create a bookmark, the following elements are saved with the bookmark:

- The current page
- Filters
- Slicers, including slicer type (for example, dropdown or list) and slicer state
- Visual selection state, such as cross-highlight filters
- Sort order
- Drill location

If you have access to the **Selection** pane, you can also set and save:

- The visibility of an object
- The focus or **Spotlight** modes of any visible object

### Create two bookmarks

Configure a report page how you want it to appear in the bookmark. The following example has filters applied. There are changes to the:

1. existing Date filter on the **Filters** pane.
1. existing Regions filter on the **Filters** pane. **West** is selected.
1. data point on the doughnut chart visual. It cross-filters and cross-highlights the report canvas.

:::image type="content" source="media/end-user-bookmarks/power-bi-personal.png" alt-text="A screenshot showing a report with filters applied.":::

1. When your report page and visuals are arranged how you want, select **Personal bookmarks** from the **Bookmarks** pane and then select **Add**.

1. The personal bookmark gets a generic name, or you can enter a name. Select **Save**. To *rename*, *make default*, *delete*, or *update* your bookmark, select the ellipses next to the bookmark's name.

1. Open the **YTD Category** page of your report and create another personal bookmark. The bookmark in the following example captures the YTD information for the VanArsdel company.

    :::image type="content" source="media/end-user-bookmarks/power-bi-second-bookmark.png" alt-text="A screenshot showing the Bookmarks pane. One of the listed bookmarks is outlined.":::

1. To open the **Bookmarks** pane, select **Show more bookmarks** in the **Bookmarks** menu. To switch between your two bookmarks, select the name of a bookmark in the **Bookmarks** pane.

    ![Display a particular bookmark by selecting.](media/end-user-bookmarks/bookmarks.gif)

1. To return to the original published view of the report, select the **Reset** icon, and then select **Reset** on the dialog.

    :::image type="content" source="media/end-user-bookmarks/power-bi-revert.png" alt-text="A screenshot showing the revert icon on the action bar.":::

## Open report bookmarks

To view the report bookmarks created by the report designer, select **Report bookmarks** from the **Bookmarks** pane.

:::image type="content" source="media/end-user-bookmarks/power-bi-show-bookmark.png" alt-text="A screenshot showing the Bookmarks pane. Report bookmarks is outlined.":::

> [!NOTE]
> To view shared reports, you need a Power BI Pro or Premium Per User license, or the report must be saved in reserved capacity. For more information, see [Licensing and subscriptions for business users](end-user-license.md).

### Report bookmarks

If the report designer includes report bookmarks, they appear under the **Report bookmarks** heading. The following example has four bookmarks named B1 ON, B2 ON, VanArsdel YTD, and All YTD. **All YTD** is selected. Select a bookmark to change to that report view.

:::image type="content" source="media/end-user-bookmarks/power-bi-bookmark-list.png" alt-text="A screenshot showing the Bookmarks pane. A list of bookmarks is outlined.":::

## Bookmarks as a slideshow

To present or view bookmarks in a slideshow, select **View** from the **Bookmarks** pane.

When in **View** mode, there are a few features to notice:

- The name of the bookmark appears in the bookmark title bar, which appears at the bottom of the canvas.
- The bookmark title bar has arrows where you can move to the next or previous bookmark.
- To exit **View** mode, select **Exit** from the **Bookmarks** pane, or select the **X** in the bookmark title bar.

:::image type="content" source="media/end-user-bookmarks/power-bi-view-bookmarks.png" alt-text="A screenshot showing bookmarks in view mode. The title bar is outlined.":::

In **View** mode, you can close the **Bookmarks** pane to provide more space for your presentation. While in **View** mode, all visuals are interactive and available for cross-highlighting, like they are when interacting with them in other modes.

### Reset all your changes to a report

You can remove all your changes in the report and set it back to the designer's last saved view of the report. From the upper right corner of your report canvas, select **Reset to default**.

:::image type="content" source="media/end-user-bookmarks/power-bi-personalize-reset-all.png" alt-text="Reset all changes":::

## Considerations and limitations

In this release of **personal bookmarks**, there are a few considerations and limitations to keep in mind.

- The bookmark captures the state of the page at the time the bookmark was created. When someone selects the bookmark, Power BI attempts to show them that bookmark in its original report state. However, there are situations where showing the bookmark isn't possible. For example, if the report owner changes the name of a field that's used by the bookmark, Power BI is no longer able to show visuals, filters, or slicers that use that field. Some visuals show no data for the renamed field. Filtered or sliced visuals revert to the default view.

- Most Power BI custom visuals work well with personal bookmarking. If you run into trouble bookmarking a Power BI custom visual, contact the creator of that visual, and ask them to add support for bookmarks.

- Your personal bookmarks typically aren't affected if the report designer updates or republishes a report. However, if the designer makes major changes to a report, such as removing fields that are used by a personal bookmark, then you receive an error message the next time you attempt to open that bookmark.

- The personal bookmarks feature is supported in the Power BI mobile app for iOS and Android tablets and in the Power BI Windows app. It's not supported in the Power BI mobile app for phones. However, any change to a visual that you save to a personal bookmark in the Power BI service is valid in all the Power BI mobile apps.

- Personal bookmarks capture the exploration state of the current page. They don't capture changes to other pages. For example, if you have sync-slicers in your report and you personalize the sync-slicer to use a different field and capture a personal bookmark, then the personal bookmark only captures the slicer change on the current page.

## Next steps

[Personalize visuals in a report](end-user-personalize-visuals.md)
