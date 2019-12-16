---
title: Explore reports in the Power BI mobile apps
description: 'Learn about viewing and interacting with reports in the Power BI mobile apps on your phone or tablet. You create reports in the Power BI service or Power BI Desktop, and then interact with them in the mobile apps.'
author: paulinbar
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 12/02/2019
ms.author: painbar

---
# Explore reports in the Power BI mobile apps
Applies to:

| ![iPhone](././media/mobile-reports-in-the-mobile-apps/ios-logo-40-px.png) | ![iPad](././media/mobile-reports-in-the-mobile-apps/ios-logo-40-px.png) | ![Android phone](././media/mobile-reports-in-the-mobile-apps/android-logo-40-px.png) | ![Android tablet](././media/mobile-reports-in-the-mobile-apps/android-logo-40-px.png) | ![Windows 10 devices](./media/mobile-reports-in-the-mobile-apps/win-10-logo-40-px.png) |
|:---: |:---: |:---: |:---: |:---: |
| iPhones |iPads |Android phones |Android tablets |Windows 10 devices |

A Power BI report is an interactive view of your data, with visuals that represent different findings and insights from that data. Viewing reports in the Power BI mobile apps is the third step in a three-step process:

1. [Create reports in Power BI Desktop](../../desktop-report-view.md). You can even [optimize a report for phones](mobile-apps-view-phone-report.md) in Power BI Desktop.
2. Publish those reports to the Power BI service [(https://powerbi.com)](https://powerbi.com) or [Power BI Report Server](../../report-server/get-started.md).  
3. Interact with the reports in the Power BI mobile apps.

## Open a Power BI report in the mobile app
Power BI reports are stored in different places in the mobile app, depending on where you got them. They can be in Apps, Shared with me, Workspaces (including My Workspace), or on a report server. Sometimes, you go through a related dashboard to get to a report, and sometimes they're listed.

In lists and menus, you'll find an icon next to a report name, which helps you understand that the item is a report:

![Reports in My Workspace](./media/mobile-reports-in-the-mobile-apps/reports-my-workspace.png)

There are two icons for reports in the Power BI mobile apps:

* ![Report icon](./media/mobile-reports-in-the-mobile-apps/report-default-icon.png) indicates a report that will appear in landscape orientation in the app. It will look the same as it looks in a browser.

* ![Phone report icon](./media/mobile-reports-in-the-mobile-apps/report-phone-icon.png) indicates a report that has at least one phone-optimized page that will appear in portrait orientation.

> [!NOTE]
> When you hold your phone in a landscape orientation, you'll always get the landscape layout, even if the report page is in phone layout.

To get to a report from a dashboard, tap **More options** (...) in the upper-right corner of a tile and then tap **Open report**:
  
  ![Open report](./media/mobile-reports-in-the-mobile-apps/power-bi-android-open-report-tile.png)
  
  Not all tiles can be opened as reports. For example, tiles that are created when you ask a question in the Q&A box don't open reports when you tap them.
  
## Interact with reports
After you have a report open in the app, you can start working with it. You can do many things with your report and its data. In the report footer, you'll find actions that you can take on the report. By tapping and long tapping on the data shown in the report, you can also slice and dice the data.

### Using tap and long tap
A tap is the same as a mouse click. So, if you want to cross-highlight the report based on a data point, tap that data point.
When you tap a slicer value, the value is selected and the rest of the report is sliced by that value.
When you tap a link, button, or bookmark, the action defined by the report author will occur.

You probably noticed that when you tap a visual, a border appears. In the upper-right corner of the border, you'll see **More options** (...). If you tap the ellipsis, you'll see a menu of actions you can take on that visual:

![Visual and menu](./media/mobile-reports-in-the-mobile-apps/report-visual-menu.png)

### Tooltip and drill actions

When you long tap (tap and hold) a data point, a tooltip that shows the values the data point represents will appear:

![Tooltip](./media/mobile-reports-in-the-mobile-apps/report-tooltip.png)

If the report author configured a report page tooltip, the default tooltip is replaced with the report page tooltip:

![Report page tooltip](./media/mobile-reports-in-the-mobile-apps/report-page-tooltip.png)

> [!NOTE]
> Report tooltips are supported for devices of at least 640 pixels and 320 pixel viewports. If your device is smaller, the app shows default tooltips.

Report authors can define hierarchies in the data and relationships among report pages. Hierarchies allow you to drill down, drill up, and drill through to another report page from a visual and a value. So, when you long tap a value, in addition to the tooltip, the relevant drill options will appear in the footer:

![Drill actions](./media/mobile-reports-in-the-mobile-apps/report-drill-actions.png)


When you tap a specific part of a visual and then tap the *drillthrough* option, Power BI takes you to a different page in the report, filtered to the value you tapped. A report author can define one or more drillthrough options, each taking you to a different page. In that case, you can choose which option you want to drill through. The back button takes you back to the previous page.


For more information, read about how to [add drillthrough in Power BI Desktop](../../desktop-drillthrough.md).
   
   > [!IMPORTANT]
   > In the Power BI mobile apps, drill actions in matrix and table visuals are enabled through cell values only, not through column or row headers.
   
   
   
### Using the actions in the report footer
From the report footer, you can perform several actions on the current report page or on the entire report. The footer provides quick access to the most commonly used actions. You can access other actions by tapping the **More options** (...) button:

![Report footer](./media/mobile-reports-in-the-mobile-apps/report-footer.png)

You can perform from these actions from the footer:
* Reset the report filter and cross-highlight selections back to their original state.
* Open the conversation pane to view comments or to add comments to the report.
* Open the filter pane to view or modify the filter currently applied to the report.
* List all pages in the report. Tapping a page name will load and present that page.
You can move between report pages by swiping from the edge of your screen to the center.
* View all report actions.

#### All report actions
When you tap the **More options** (...) button in the report footer, you'll see all the actions that you can perform on a report:


![All report actions](./media/mobile-reports-in-the-mobile-apps/power-bi-mobile-report-all-actions.png)

Some of the actions might be disabled because they're dependent on the specific report capabilities.
For example:

**Bookmarks** is present only if [bookmarks](https://docs.microsoft.com/power-bi/consumer/end-user-bookmarks) have been set in the report. Both [personal bookmarks](https://docs.microsoft.com/power-bi/consumer/end-user-bookmarks#personal-bookmarks) that you can define in Power BI service and bookmarks defined by the report creator are shown. If one of the bookmarks has been defined as the default bookmark, the report will open to that view when it loads.

**Annotate and share** might be turned off if there's an [Intune protection policy](https://docs.microsoft.com/intune/app-protection-policies) in your organization that prohibits sharing from a Power BI mobile app.

**Invite** is enabled only if you have permission to share the report with others. You'll have permission only if you're the owner of the report or if the owner has given you reshare permission.

**Filter by current location** is enabled if the report author categorized the report with geographical data. For more information, read about [identifying geographical data in a report](https://docs.microsoft.com/power-bi/desktop-mobile-geofiltering).

**Scan to filter the report by barcode** is enabled only if the dataset in your report is tagged as **Barcode**. For more information, read about [tagging barcodes in Power BI Desktop](https://docs.microsoft.com/power-bi/desktop-mobile-barcodes).

### Bookmarks

The Power BI mobile app supports both report bookmarks that the report creator has defined and personal bookmarks that you can define in the Power BI service. Bookmarks can be found under **More options** (...) on the [report actions toolbar](https://docs.microsoft.com/power-bi/consumer/mobile/mobile-reports-in-the-mobile-apps#all-report-actions).

![bookmark menu](./media/mobile-reports-in-the-mobile-apps/power-bi-mobile-report-bookmark-menu.png)

When a bookmark view of a report is open, the name of the bookmark appears at the top of the report.

![bookmark view](./media/mobile-reports-in-the-mobile-apps/power-bi-mobile-report-bookmark-title.png)

[Learn more about bookmarks in the Power BI service](https://docs.microsoft.com/power-bi/consumer/end-user-bookmarks).


## Next steps
* [View and interact with Power BI reports optimized for your phone](mobile-apps-view-phone-report.md)
* [Create a version of a report that's optimized for phones](../../desktop-create-phone-report.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)

