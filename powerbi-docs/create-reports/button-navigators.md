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

- The titles of the buttons match the page display names.
- The ordering of the buttons matches the order of your report pages.
- The selected button is the current page.
- The navigator updates automatically as you add or remove pages in your report.
- The titles of the buttons update automatically as you rename pages.

If you want to further customize the pages that appear in the page navigator or are hidden, go to the **Format navigator** pane. Under **Pages**, adjust the settings for showing hidden pages and tooltip pages:

:::image type="content" source="media/button-navigators/page-settings.png" alt-text="Screenshot of the Power BI Desktop Format navigator pane. The Pages settings are highlighted, with controls for hiding and showing pages and tooltips."lightbox="media/button-navigators/page-settings.png":::

> [!NOTE]
> To use the page navigator in Power BI Desktop or in edit mode of the Power BI Service, first select **Ctrl**. Then on the page navigator, select the page that you want to go to.

## Bookmark navigator

Before you can create the bookmark navigator, you need to [create the bookmarks](desktop-bookmarks.md). Additionally, create separate bookmark groups if you plan on creating different bookmark navigators within the same report.

:::image type="content" source="media/desktop-buttons/example-bookmarks.png" alt-text="Screenshot showing a Bookmarks navigator example.":::  

Once you’ve created your bookmarks, select the **Bookmark navigator** option.

# [Power BI Desktop](#tab/powerbi-desktop)

On the **Insert** tab, select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-ribbon.png" alt-text="Screenshot of the ribbon Insert tab. In the Buttons shortcut menu, Navigator is highlighted. In its shortcut menu, Bookmark navigator is highlighted.":::

# [Power BI service](#tab/powerbi-service)

Select **Edit** to edit the report, then on the menu bar select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/create-bookmark-navigator-service.png" alt-text="Screenshot of the Power BI service. On the Buttons menu, Navigator is highlighted. In its shortcut menu, Bookmark navigator is highlighted." lightbox="media/desktop-buttons/create-bookmark-navigator-service.png:::

---

Power BI automatically creates a bookmark navigator for you:

:::image type="content" source="media/desktop-buttons/example-bookmark-navigator.png" alt-text="Screenshot of a Bookmark navigator example.":::

The bookmark navigator is automatically in sync with your report bookmarks, meaning:

- Titles of the buttons match the bookmark display names.
- Ordering of the buttons matches the order of your report bookmarks.
- The selected button is the last selected bookmark.
- The navigator updates automatically as you add or remove bookmarks in your report.
- The titles of the buttons update automatically as you rename bookmarks.

If you want to further customize the bookmarks that show or hide in the bookmark navigator, go to the **Format navigator** pane > **Bookmarks** tab:

:::image type="content" source="media/button-navigators/bookmark-settings.png" alt-text="Screenshot of the Power BI Desktop Format navigator pane. The Bookmarks settings are highlighted, with controls for selecting bookmarks."lightbox="media/button-navigators/bookmark-settings.png":::

By default, **All** bookmarks are shown in the bookmark navigator; however, you can create and select a specific bookmark group to show only the bookmarks within that group.

:::image type="content" source="media/desktop-buttons/selecting-all-bookmarks-or-bookmark-group.png" alt-text="Screenshot of the bookmark group options within the Bookmark dropdown menu.":::

You also can **Allow deselection**, meaning users can deselect all the buttons in the bookmark navigator. This option is great for building a toggle-like experience or allowing for a deselected default state. To set up either of these types of experiences, first create a bookmark with the desired deselected state. Here’s an example of a deselected state:

:::image type="content" source="media/desktop-buttons/example-unselected-state.png" alt-text="Screenshot of an example bookmark navigator in the deselected state.":::

Once you've bookmarked the deselected state, turn on **Allow deselection** and select the bookmark that you want to **Launch on deselection**. In this case, that bookmark is named *No filter*.

If the bookmark that you’re using for deselection is within the bookmark navigator already, you can choose to **Hide the deselection bookmark** within the navigator if you don’t want to show it:

:::image type="content" source="media/button-navigators/hide-deselection-bookmark-setting.png" alt-text="Screenshot of the Bookmarks navigator option to Hide deselection bookmark."lightbox="media/button-navigators/hide-deselection-bookmark-setting.png":::
 
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

The grid layout tab includes options to change the orientation of the navigator in the following forms:

- Horizontal
- Vertical
- Grid  

It also includes the option to change the **Padding** between buttons in the navigator.

:::image type="content" source="media/button-navigators/grid-layout-settings.png" alt-text="Screenshot of the Power BI Desktop Format navigator pane. The Gird layout settings are highlighted, with controls for orientation and padding.":::

### Selected state

The navigators can customize the Selected state of the button. You can use this option to help the selected state of the button stand out from the default state. In this example, we’ve customized both the **Fill** and **Text** formatting for the **Selected** state:

:::image type="content" source="media/button-navigators/selected-state-settings.png" alt-text="Screenshot of the Power BI Desktop Format navigator pane. Under Style, the State, Text, and Fill settings are highlighted.":::

## Set the page navigation destination conditionally

You can use conditional formatting to set the navigation destination, based on the output of a measure you create in Power BI Desktop. For example, you may want to save space on your report canvas by having a single button to navigate to different pages based on the user’s selection:

:::image type="content" source="media/desktop-buttons/button-navigate-go.png" alt-text="Screenshot of a dropdown list labeled Select a destination. In the list, Market details is selected. Next to the list, a green button is labeled Go.":::

To create this example, start by creating a single-column table in Power BI Desktop with the names of the navigation destinations:

1. On the **Home** tab, select **Enter data**.

   The **Create Table** dialog box opens.

1. In the **Create Table** dialog box, enter the names of your pages in the column. Power BI uses an exact string match to set the drillthrough destination, so ensure that the values you entered exactly match your drillthrough page names.

   :::image type="content" source="media/desktop-buttons/button-create-table.png" alt-text="Screenshot of the Create Table dialog that shows a table with one column. One row contains Market details. The other contains Store details.":::

1. After you've created the table, add it to the page as a single-select slicer:

   :::image type="content" source="media/desktop-buttons/button-navigate-slicer.png" alt-text="Screenshot of a dropdown list labeled Select a destination. In the list, Market details is selected.":::

Create a page navigation button by selecting **Insert** > **Buttons** > **Blank**. Use the **Format button** pane to add text to your button and to adjust its shape and fill. Then select the conditional formatting option for the destination:

1. Go to the **Format button** pane. Under **Style**, set **Action** to **On**, and then expand **Action**. Select **Page navigation** for **Type**, and then select the **Conditional formatting** (**fx**) icon next to the **Destination**.

   :::image type="content" source="media/desktop-buttons/button-set-page-nav-destination.png" alt-text="Screenshot showing Page navigation button.":::

1. On the **Destination - Action** page, select the name of the column you created. In this case, it's **Select a destination**.

   :::image type="content" source="media/desktop-buttons/button-select-destination.png" alt-text="Screenshot showing Select a destination.":::

   Now the button can navigate to different pages, depending on the user’s selection.

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


