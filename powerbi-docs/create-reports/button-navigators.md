---
title: Create Page and Bookmark Navigators
description: Find out how to use Power BI built-in navigators to quickly build page and bookmark navigation experiences in just a few steps.
author: julcsc
ms.author: juliacawthra
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.custom: video-RWRCPO
ms.date: 10/02/2023
LocalizationGroup: Create reports
# customer intent: As a Power BI user, I want to find out how to use built-in navigators in Power BI so that I can quickly add page and bookmark navigation experiences to my reports.
---

# Create page and bookmark navigators

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Using built-in navigators in Power BI, you can build page and bookmark navigation experiences in a few steps. These navigators should save hours of effort building and managing your page or bookmark navigation experiences.

:::image type="content" source="media/desktop-buttons/example-report.png" alt-text="Screenshot of a Power BI report. On the side, a vertical navigator lists report pages. On the top, tabs are labeled with bookmark names."lightbox="media/desktop-buttons/example-report.png":::

You can find this capability in Power BI Desktop or the Power BI service.

## Video

Watch this video showing how to add page and bookmark navigators, and then try it yourself.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=d91b6399-1318-4c56-b0aa-9d3a81272d6a]

## Page navigator

# [Power BI Desktop](#tab/powerbi-desktop)

On the **Insert** tab, select **Buttons** > **Navigator** > **Page navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-ribbon.png" alt-text="Screenshot of the ribbon Insert tab. In the Buttons shortcut menu, Navigator is highlighted. In its shortcut menu, Page navigator is highlighted.":::

# [Power BI service](#tab/powerbi-service)

Select **Edit** to edit the report. Then on the menu bar, select **Buttons** > **Navigator** > **Page navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-menu-bar.png" alt-text="Screenshot of the Power BI service. On the Buttons menu, Navigator is highlighted. In its shortcut menu, Page navigator is highlighted." lightbox="media/desktop-buttons/navigator-in-menu-bar.png":::

---

When you select **Page navigator**, Power BI automatically creates a page navigator for you:

:::image type="content" source="media/desktop-buttons/example-page-navigator.png" alt-text="Screenshot of a page navigator. Five buttons are aligned horizontally. Each is labeled with a page name like Home or Sales.":::

The page navigator is automatically in sync with your report pages:

- The button labels match the page display names.
- The ordering of the buttons matches the order of your report pages.
- The selected button is the current page.
- The navigator is updated automatically as you add or remove pages in your report.
- The titles of the buttons are updated automatically as you rename pages.

If you want to further customize the pages that appear in the page navigator or are hidden, go to the **Format navigator** pane. Under **Pages**, adjust the settings for showing hidden pages and tooltip pages:

:::image type="content" source="media/button-navigators/page-settings.png" alt-text="Screenshot of the Power BI Desktop Format navigator pane. The Pages settings are highlighted, with controls for hiding and showing pages and tooltips."lightbox="media/button-navigators/page-settings.png":::

> [!NOTE]
> To use the page navigator in Power BI Desktop or in edit mode of the Power BI Service, first select **Ctrl**. Then on the page navigator, select the page that you want to go to.

## Bookmark navigator

Before you can create the bookmark navigator, you need to [create the bookmarks](desktop-bookmarks.md). Also, create separate bookmark groups if you plan on creating different bookmark navigators within the same report.

:::image type="content" source="media/desktop-buttons/example-bookmarks.png" alt-text="Screenshot of the Bookmarks pane in Power BI. Four groups are listed. The top group is expanded and contains three bookmarks.":::  

After you create your bookmarks, create a bookmark navigator:

# [Power BI Desktop](#tab/powerbi-desktop)

On the **Insert** tab, select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-ribbon.png" alt-text="Screenshot of the ribbon Insert tab. In the Buttons shortcut menu, Navigator is highlighted. In its shortcut menu, Bookmark navigator is highlighted.":::

# [Power BI service](#tab/powerbi-service)

Select **Edit** to edit the report. Then on the menu bar, select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/create-bookmark-navigator-service.png" alt-text="Screenshot of the Power BI service. On the Buttons menu, Navigator is highlighted. In its shortcut menu, Bookmark navigator is highlighted." lightbox="media/desktop-buttons/create-bookmark-navigator-service.png:::

---

Power BI automatically creates a bookmark navigator for you:

:::image type="content" source="media/desktop-buttons/example-bookmark-navigator.png" alt-text="Screenshot of a navigator with horizontally aligned buttons labeled with bookmark names. The Bookmarks configuration pane contains the same bookmarks.":::

The bookmark navigator is automatically in sync with your report bookmarks:

- The button labels match the bookmark display names.
- The ordering of the buttons matches the order of your report bookmarks.
- The selected button is the last selected bookmark.
- The navigator is updated automatically as you add or remove bookmarks in your report.
- The titles of the buttons are updated automatically as you rename bookmarks.

If you want to further customize the bookmarks that apper or are hidden in the bookmark navigator, go to the **Format navigator** pane, and then go to the **Bookmarks** tab:

:::image type="content" source="media/button-navigators/bookmark-settings.png" alt-text="Screenshot of the Power BI Desktop Format navigator pane. The Bookmarks settings are highlighted. Controls for selecting bookmarks are available."lightbox="media/button-navigators/bookmark-settings.png":::

By default, all bookmarks are shown in the bookmark navigator. However, you can create and select a specific bookmark group to show only the bookmarks within that group.

:::image type="content" source="media/desktop-buttons/selecting-all-bookmarks-or-bookmark-group.png" alt-text="Screenshot of the Bookmarks tab in the Format navigator pane. The Bookmark list is expanded, and a bookmark named EU sales is selected.":::

You also can turn on the **Allow deselection** option. If you do, users can deselect all the buttons in the bookmark navigator. This option is useful for building a toggle-like experience or offering a deselected default state. To set up either of these types of experiences, first create a bookmark with the desired deselected state. Here's an example of a deselected state:

:::image type="content" source="media/desktop-buttons/example-unselected-state.png" alt-text="Screenshot of a report page that contains only a welcome message and a bookmark navigator. None of the bookmark buttons are selected.":::

After you bookmark the deselected state, turn on **Allow deselection**. Under **Launch on deselection**, select the bookmark that you want to go to when no bookmark is selected in the navigator. In the following screenshot, that bookmark is named *No filter*. If you don't want the bookmark that you use for deselection to appear in the bookmark navigator, select **Hide deselection bookmark**.

:::image type="content" source="media/button-navigators/hide-deselection-bookmark-setting.png" alt-text="Screenshot of the Format navigator pane Bookmarks tab. Under Launch on deselection, No filter is selected. Hide deselection bookmark is turned on."lightbox="media/button-navigators/hide-deselection-bookmark-setting.png":::

## Formatting options

Just like for other buttons, there are lots of formatting options for the navigators including:

- Fill
- Text
- Outline
- Shape
- Shape shadow
- Shape glow
- Rotation

The navigators also include two more formatting options:

- Grid layout
- Selected state

### Grid layout

You can use the **Grid layout** tab to select from the following options for the navigator orientation:

- Horizontal
- Vertical
- Grid  

That tab also includes the option to change the **Padding** value between buttons in the navigator.

:::image type="content" source="media/button-navigators/grid-layout-settings.png" alt-text="Screenshot of the Power BI Desktop Format navigator pane. The Grid layout settings are highlighted, with controls for orientation and padding.":::

### Selected state

You can customize the selected state of a navigator button. This option is useful for making the selected state of the button stand out from the default state. In the following example, the **Fill** and **Text** values are customized for the **Selected** state:

:::image type="content" source="media/button-navigators/selected-state-settings.png" alt-text="Screenshot of the Format navigator pane with the State, Text, and Fill settings highlighted. A selected navigator button is darker than other buttons.":::

## Set the page navigation destination conditionally

You can use conditional formatting to set the navigation destination, based on the output of a measure you create in Power BI Desktop. For example, you might want to save space on your report canvas by having a single button to navigate to the page that the user selects:

:::image type="content" source="media/desktop-buttons/button-navigate-go.png" alt-text="Screenshot of a dropdown list labeled Select a destination. In the list, Market details is selected. Next to the list, a green button is labeled Go.":::

To create this navigation experience, take the following steps to create a single-column table in Power BI Desktop that contains the names of the navigation destinations:

1. On the **Home** tab, select **Enter data**.

   The **Create Table** dialog opens.

1. In the **Create Table** dialog, enter the names of your pages in the column. Power BI uses an exact string match to set the drill-through destination. So ensure that the values you enter exactly match your drill-through page names.

   :::image type="content" source="media/desktop-buttons/button-create-table.png" alt-text="Screenshot of the Create Table dialog that shows a table with one column. One row contains Market details. The other contains Store details.":::

1. After you create the table, add it to the page as a single-select slicer:

   :::image type="content" source="media/desktop-buttons/button-navigate-slicer.png" alt-text="Screenshot of a dropdown list labeled Select a destination. In the list, Market details is selected.":::

1. Create a page navigation button by selecting **Insert** > **Buttons** > **Blank**. Use the **Format button** pane to add text to your button and to adjust its shape and fill.

1. Select the conditional formatting option for the destination by taking the following steps:
   1. Go to the **Format button** pane.
   1. Under **Style**, set **Action** to **On**.
   1. Expand **Action**.
   1. Under **Type**, select **Page navigation**.
   1. Under **Destination**, select the **Conditional formatting** (**fx**) icon.

   :::image type="content" source="media/desktop-buttons/button-set-page-nav-destination.png" alt-text="Screenshot showing Page navigation button.":::

1. On the **Destination - Action** page, select the name of the column you created. In this case, it's **Select a destination**.

   :::image type="content" source="media/desktop-buttons/button-select-destination.png" alt-text="Screenshot showing Select a destination.":::

   Now the button can navigate to different pages, depending on the user's selection.

   :::image type="content" source="media/desktop-buttons/button-navigate-go.png" alt-text="Screenshot of a dropdown list labeled Select a destination. In the list, Market details is selected. Next to the list is a green Go button.":::

## Accessibility guidance

To ensure your approach of using the bookmark navigator is accessible and meets requirements, follow these best practices:

- Name the bookmark buttons clearly and use alt text appropriately:
   - Use clear, descriptive labels for bookmark buttons so all users understand what content will be modified.
   - Use the **Alt text** field to provide an accessible name that gives screen reader users the same clarity.
   - Whenever possible, tie both to the name of the data grid or its containing group (for example, the Bookmark button's label is "Sales details" and alt text is "Show sales details data.")
- Ensure logical focus order:
   - The bookmark buttons and the content they control should be positioned so that users navigating by keyboard can move directly between them.
   - Avoid placing unrelated focusable elements (such as slicers) between the bookmark navigator and the content it adjusts to ensure smooth navigation and help users quickly associate the button with its corresponding data.
- Use meaningful names for data grids:
   - Each data grid should have a clear name that reflects which button is currently active.
   - The group containing the grid can have a consistent name, whereas the grid itself updates (for example, "Summary data" or "Detailed data").

## Considerations and limitations

- If the bold, italic and underline settings are **On** for the **Default** state, you can't turn them off for the **Selected** state.
- Bookmark navigator selected state is not reflected in exports of the report.

## Related content

For more information about features that are similar or interact with buttons, take a look at the following articles:

- [Create buttons in Power BI reports](desktop-buttons.md)
- [Identify and use buttons in the Power BI service](../consumer/end-user-buttons.md)
- [Use drillthrough in Power BI reports](desktop-drillthrough.md)
- [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)


