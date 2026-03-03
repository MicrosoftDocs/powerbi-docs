---
title: Create Page and Bookmark Navigators
description: Learn how to use Power BI built-in navigators to quickly build page and bookmark navigation experiences. Create professional report navigation in just a few steps.
author: julcsc
ms.author: juliacawthra
ms.reviewer: jacindaeng
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.custom: video-RWRCPO
ms.date: 02/05/2026
LocalizationGroup: Create reports
# customer intent: As a Power BI user, I want to find out how to use built-in navigators so that I can quickly add page and bookmark navigation experiences to my reports.
---

# Create page and bookmark navigators

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

By using built-in navigators in Power BI, you can build page and bookmark navigation experiences in a few steps. These navigators save you hours of effort building and managing your page or bookmark navigation experiences.

:::image type="content" source="media/desktop-buttons/example-report.png" alt-text="Screenshot of a Power BI report. On the side, a vertical navigator lists report pages. On the top, tabs are labeled with bookmark names." lightbox="media/desktop-buttons/example-report.png":::

You can find this capability in Power BI Desktop or the Power BI service.

## Video

Watch this video to see how to add page and bookmark navigators, and then try it yourself.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=d91b6399-1318-4c56-b0aa-9d3a81272d6a]

## Create a page navigator

# [Power BI Desktop](#tab/powerbi-desktop)

On the **Insert** tab, select **Buttons** > **Navigator** > **Page navigator**.

:::image type="content" source="media/desktop-buttons/select-page-navigator.png" alt-text="Screenshot of the ribbon Insert tab. In the Buttons shortcut menu, Navigator is highlighted. In its shortcut menu, Page navigator is highlighted." lightbox="media/desktop-buttons/select-page-navigator.png":::

# [Power BI service](#tab/powerbi-service)

Select **Edit** to edit the report. Then on the menu bar, select **Buttons** > **Navigator** > **Page navigator**.

:::image type="content" source="media/desktop-buttons/select-page-navigator-service.png" alt-text="Screenshot of the Power BI service. On the expanded Buttons menu, Navigator is highlighted. In its shortcut menu, Page navigator is highlighted." lightbox="media/desktop-buttons/select-page-navigator-service.png":::

---

When you select **Page navigator**, Power BI automatically creates a page navigator for you:

:::image type="content" source="media/desktop-buttons/example-page-navigator.png" alt-text="Screenshot of a page navigator. Five buttons are aligned horizontally. Each is labeled with a page name like Home or Sales." lightbox="media/desktop-buttons/example-page-navigator.png":::

The page navigator automatically syncs with your report pages:

- The button labels match the page display names.
- The ordering of the buttons matches the order of your report pages.
- The selected button corresponds to the current page.
- The navigator updates automatically as you add or remove pages in your report.
- The button labels update automatically as you rename pages.

To further customize the pages that appear in the page navigator or to hide pages, go to the **Format navigator** pane. Under **Pages**, adjust the settings for showing hidden pages and tooltip pages:

:::image type="content" source="media/button-navigators/page-settings.png" alt-text="Screenshot of the Format navigator pane in Power BI. The Pages settings are highlighted, with controls for hiding and showing pages and tooltips." lightbox="media/button-navigators/page-settings.png":::

> [!NOTE]
> To use the page navigator in Power BI Desktop or in edit mode of the Power BI service, first select **Ctrl**. Then on the page navigator, select the page that you want to go to.

## Create a bookmark navigator

Before you can create a bookmark navigator, you need to [create bookmarks](desktop-bookmarks.md). Also, create separate bookmark groups if you plan on creating different bookmark navigators within the same report.

:::image type="content" source="media/desktop-buttons/example-bookmarks.png" alt-text="Screenshot of the Bookmarks pane in Power BI. Four groups are listed. The top group is expanded and contains three bookmarks.":::  

After you create your bookmarks, create a bookmark navigator:

# [Power BI Desktop](#tab/powerbi-desktop)

On the **Insert** tab, select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/select-bookmark-navigator.png" alt-text="Screenshot of the ribbon Insert tab. In the Buttons shortcut menu, Navigator is highlighted. In its shortcut menu, Bookmark navigator is highlighted." lightbox="media/desktop-buttons/select-bookmark-navigator.png":::

# [Power BI service](#tab/powerbi-service)

Select **Edit** to edit the report. Then on the menu bar, select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/select-bookmark-navigator-service.png" alt-text="Screenshot of the Power BI service. On the expanded Buttons menu, Navigator is highlighted. In its shortcut menu, Bookmark navigator is highlighted." lightbox="media/desktop-buttons/select-bookmark-navigator-service.png":::

---

Power BI automatically creates a bookmark navigator for you:

:::image type="content" source="media/desktop-buttons/example-bookmark-navigator.png" alt-text="Screenshot of a navigator with horizontally aligned buttons labeled with bookmark names. The Bookmarks configuration pane contains the same bookmarks.":::

The bookmark navigator automatically stays in sync with your report bookmarks:

- The button labels match the bookmark display names.
- The ordering of the buttons matches the order of your report bookmarks.
- The selected button corresponds to the last selected bookmark.
- The navigator updates automatically as you add or remove bookmarks in your report.
- The button labels update automatically as you rename bookmarks.

To customize which bookmarks appear in the bookmark navigator or to hide certain bookmarks, go to the **Format navigator** pane, and then go to the **Bookmarks** tab:

:::image type="content" source="media/button-navigators/bookmark-settings.png" alt-text="Screenshot of the Format navigator pane in Power BI. The Bookmarks settings are highlighted. Controls for selecting bookmarks are available." lightbox="media/button-navigators/bookmark-settings.png":::

By default, the bookmark navigator shows all bookmarks. However, you can create and select a specific bookmark group to show only the bookmarks within that group.

:::image type="content" source="media/desktop-buttons/selecting-all-bookmarks-or-bookmark-group.png" alt-text="Screenshot of the Bookmarks tab in the Format navigator pane. The Bookmark list is expanded, and a bookmark named EU sales is selected.":::

Turn on the **Allow deselection** option to let users deselect all the buttons in the bookmark navigator. This option is useful for building a toggle-like experience or offering a deselected default state. To set up either of these types of experiences, first create a bookmark with the desired deselected state. Here's an example of a deselected state:

:::image type="content" source="media/desktop-buttons/example-unselected-state.png" alt-text="Screenshot of a report page that contains only a welcome message and a bookmark navigator. None of the bookmark navigator buttons are selected.":::

After you bookmark the deselected state, turn on **Allow deselection**. Under **Launch on deselection**, select the bookmark that you want to go to when no bookmark is selected in the navigator. In the following screenshot, that bookmark is named *No filter*. If you don't want the bookmark that you use for deselection to appear in the bookmark navigator, select **Hide deselection bookmark**.

:::image type="content" source="media/button-navigators/hide-deselection-bookmark-setting.png" alt-text="Screenshot of the Format navigator pane Bookmarks tab. Under Launch on deselection, No filter is selected. Hide deselection bookmark is turned on." lightbox="media/button-navigators/hide-deselection-bookmark-setting.png":::

## Format navigators

Just like other buttons, the navigators offer many formatting options. These options include the following settings:

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

### Set the grid layout

Use the **Grid layout** tab to select the navigator orientation from the following options:

- Horizontal
- Vertical
- Grid  

This tab also includes the option to change the **Padding** value between buttons in the navigator.

:::image type="content" source="media/button-navigators/grid-layout-settings.png" alt-text="Screenshot of the Format navigator pane in Power BI. The Grid layout settings are highlighted, with controls for orientation and padding.":::

### Format the selected state

You can customize the selected state of a navigator button. This option is useful for making the selected state of the button stand out from the default state. In the following example, the **Fill** and **Text** values are customized for the **Selected** state:

:::image type="content" source="media/button-navigators/selected-state-settings.png" alt-text="Screenshot of the Format navigator pane with the State, Text, and Fill settings highlighted. A selected navigator button is darker than other buttons.":::

## Set the page navigation destination conditionally

Use conditional formatting to set the navigation destination, based on the output of a measure you create in Power BI Desktop. For example, you might want to save space on your report canvas by having a single button to navigate to the page that the user selects:

:::image type="content" source="media/desktop-buttons/button-navigate-go.png" alt-text="Screenshot of a dropdown list labeled Select a destination, with the Market details option selected. Next to the list, a green button is labeled Go.":::

### Create a table and a slicer

To create this navigation experience, start by creating a single-column table in Power BI Desktop that contains the names of the navigation destinations:

1. On the **Home** tab, select **Enter data**.

   The **Create Table** dialog opens.

1. In the **Create Table** dialog, enter the names of your pages in the column. Power BI uses an exact string match to set the drillthrough destination. So ensure that the values you enter exactly match your drillthrough page names.

   :::image type="content" source="media/desktop-buttons/button-create-table.png" alt-text="Screenshot of the Create Table dialog that shows a table with one column. One row contains Market details. Another row contains Store details." lightbox="media/desktop-buttons/button-create-table.png":::

1. After you create the table, add it to the page as a single-select slicer:

   :::image type="content" source="media/desktop-buttons/button-navigate-slicer.png" alt-text="Screenshot of a dropdown list labeled Select a destination. In the list, the Market details option is selected.":::

### Add conditional formatting

To complete the experience, use conditional formatting to link a page-navigation button to the slicer:

1. Create a button by selecting **Insert** > **Buttons** > **Blank**. Use the **Format button** pane to add text to your button and to adjust its shape and fill.

1. Select the conditional formatting option for the destination by taking the following steps:
   1. Select the button from the previous step.
   1. Go to the **Format button** pane.
   1. Under **Style**, set **Action** to **On**.
   1. Expand **Action**.
   1. Under **Type**, select **Page navigation**.
   1. Under **Destination**, select the **Conditional formatting** (**fx**) icon.

   :::image type="content" source="media/desktop-buttons/button-set-page-nav-destination.png" alt-text="Screenshot of the Format navigator pane with Action turned on. For Type, Page navigation is selected. Under Destination, the fx icon is highlighted.":::

1. On the **Destination - Action** page, under **What field should we base this on?**, select the name of the table column you created. In this case, it's **Select a destination**.

   :::image type="content" source="media/desktop-buttons/button-select-destination.png" alt-text="Screenshot of the Destination - Action dialog. The list for selecting a field to base the conditional formatting on is highlighted.":::

1. Select a page in the slicer, and then select the button. The selected page opens.

   :::image type="content" source="media/desktop-buttons/button-navigate-go.png" alt-text="Screenshot of a dropdown list labeled Select a destination. In the list, the Market details option is selected. Next to the list is a green Go button.":::

## Accessibility guidance

To help ensure your approach of using the bookmark navigator meets accessibility requirements, follow these best practices:

- **Label bookmark buttons clearly and use meaningful alt text:**
  - Use clear, descriptive labels for bookmark buttons to ensure all users understand the purpose of each button.
  - Use the **Alt text** field to provide an accessible name for the bookmark navigator. This name helps screen reader users understand what content the bookmark navigator modifies.
  - For example, if a bookmark navigator includes buttons labeled “**Sales details**” and “**Sales summary**,” and these bookmarks modify a table visual named “**2025 sales data**,” then the alt text for the bookmark navigator should be “**2025 sales data modifier**.” 
- **Maintain logical focus order for accessibility**:
  - Position bookmark buttons and the content they modify close together in the report layout. This positioning ensures that keyboard users can navigate directly between them (for example, tabbing from the bookmark navigator to the visual).
  - Avoid placing unrelated focusable elements, such as slicers, between the bookmark navigator and the modified content. This practice helps maintain smooth navigation and reinforces the connection between the bookmark and its associated data.
- **Name visuals to reflect bookmark context**:
  - Each visual should have a clear and descriptive name (alt text) that aligns with the labels used in the bookmark navigator (see the example in the first bullet).
  - Ideally, this name should also appear as the visual’s title. Displaying it as a heading helps users of assistive technology locate and understand the visual more easily.

## Considerations and limitations

- If you use two or more bookmark navigators on a report page, and the bookmarks in those groups control overlapping settings (such as filters, drill state, expansion, or formatting), the active bookmark shown on each navigator might not match what you expect. This behavior occurs because reports can have only one *active bookmark* at a time. Each navigator displays the last bookmark selected within that specific navigator, not necessarily the bookmark that's currently affecting the report. To avoid confusion, ensure that bookmarks in different groups control completely separate settings, and avoid using multiple bookmark navigators for complex analysis scenarios.
- The bookmark navigator selected state isn't reflected in exports of the report.

## Related content

For more information about features that are similar or interact with buttons, see the following articles:

- [Create and configure buttons in Power BI reports](desktop-buttons.md)
- [Identify and use buttons in the Power BI service](../explore-reports/end-user-buttons.md)
- [Drillthrough in Power BI reports: Navigate to detailed insights](desktop-drillthrough.md)
