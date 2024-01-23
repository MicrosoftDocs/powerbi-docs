---
title: Create page and bookmark navigators
description: Using Power BI built-in navigators, you can quickly build page and bookmark navigation experiences with just a few clicks.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.custom: video-RWRCPO
ms.date: 03/10/2023
LocalizationGroup: Create reports
---

# Create page and bookmark navigators

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Using Power BI’s built-in navigators, you can quickly build page and bookmark navigation experiences with just a few clicks. These navigators should save hours of effort building and managing your page or bookmark navigation experiences.

:::image type="content" source="media/desktop-buttons/example-report.png" alt-text="Screenshot of an example report with page and bookmark navigation."lightbox="media/desktop-buttons/example-report.png":::

You can find this capability in Power BI Desktop or Power BI service.

## Video

Watch this video showing how to add page and bookmark navigators, and then try it yourself.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWRCPO]

## Page navigator

# [Power BI Desktop](#tab/powerbi-desktop)

On the **Insert** tab, select **Buttons** > **Navigator** > **Page navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-ribbon.png" alt-text="Screenshot of the Buttons dropdown menu, with Navigator selected.":::

# [Power BI service](#tab/powerbi-service)

Select **Edit** to edit the report, then on the menu bar select **Buttons** > **Navigator** > **Page navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-menu-bar.png" alt-text="Screenshot of the Buttons dropdown menu.":::

---

When you select the **Page navigator** option, Power BI automatically creates a page navigator for you:

:::image type="content" source="media/desktop-buttons/example-page-navigator.png" alt-text="Screenshot of an example page navigator.":::

The page navigator is automatically in sync with your report pages, meaning:

- The titles of the buttons match the page display names.
- The ordering of the buttons matches the order of your report pages.
- The selected button is the current page.
- The navigator updates automatically as you add or remove pages in your report.
- The titles of the buttons update automatically as you rename pages.

If you want to further customize the pages that show or hide in the page navigator, go to the **Format navigator** pane > **Pages** tab. There, you can **Show/hide hidden pages** or **Show/hide tooltip pages**:

:::image type="content" source="media/button-navigators/page-settings.png" alt-text="Screenshot of the Format navigator, highlighting the Pages settings."lightbox="media/button-navigators/page-settings.png":::

> [!NOTE]
> If you’re testing out the page navigator in Power BI Desktop or in edit mode of the Power BI Service, you need to press Ctrl + click to navigate to the desired page.

## Bookmark navigator
Before you can create the bookmark navigator, you need to [create the bookmarks](desktop-bookmarks.md). Additionally, create separate bookmark groups if you plan on creating different bookmark navigators within the same report.

:::image type="content" source="media/desktop-buttons/example-bookmarks.png" alt-text="Screenshot showing a Bookmarks navigator example.":::  

Once you’ve created your bookmarks, select the **Bookmark navigator** option.

# [Power BI Desktop](#tab/powerbi-desktop)

On the **Insert** tab, select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-ribbon.png" alt-text="Screenshot of the Buttons dropdown, showing Navigator selected.":::

# [Power BI service](#tab/powerbi-service)

Select **Edit** to edit the report, then on the menu bar select **Buttons** > **Navigator** > **Bookmark navigator**.

:::image type="content" source="media/desktop-buttons/navigator-in-menu-bar.png" alt-text="Screenshot of the Buttons dropdown menu from the menu bar.":::

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

:::image type="content" source="media/button-navigators/bookmark-settings.png" alt-text="Screenshot of the Format navigator, highlighting the Bookmark settings."lightbox="media/button-navigators/bookmark-settings.png":::

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

:::image type="content" source="media/button-navigators/grid-layout-settings.png" alt-text="Screenshot of Grid layout settings with sample buttons in the visual.":::

It also includes the option to change the **Padding** between buttons in the navigator.

### Selected state

The navigators can customize the Selected state of the button. You can use this option to help the selected state of the button stand out from the default state. In this example, we’ve customized both the **Fill** and **Text** formatting for the **Selected** state:

:::image type="content" source="media/button-navigators/selected-state-settings.png" alt-text="Screenshot of the Selected state settings in the Format navigator.":::

## Set the page navigation destination conditionally

You can use conditional formatting to set the navigation destination, based on the output of a measure you create in Power BI Desktop. For example, you may want to save space on your report canvas by having a single button to navigate to different pages based on the user’s selection:

:::image type="content" source="media/desktop-buttons/button-navigate-go.png" alt-text="Screenshot showing Navigate with a Go button.":::

To create this example, start by creating a single-column table in Power BI Desktop with the names of the navigation destinations:

1. On the **Home** tab, select **Enter data**.

   The **Create Table** dialog box opens.

2. In the **Create Table** dialog box, enter the names of your pages in the column. Power BI uses an exact string match to set the drillthrough destination, so ensure that the values you entered exactly match your drillthrough page names.

   :::image type="content" source="media/desktop-buttons/button-create-table.png" alt-text="Screenshot showing Create a table.":::

3. After you've created the table, add it to the page as a single-select slicer:

   :::image type="content" source="media/desktop-buttons/button-navigate-slicer.png" alt-text="Screenshot showing Navigate slicer.":::

Create a page navigation button and select the conditional formatting option for the destination:

1. Under **Style**, set **Action** to **On**, and then expand **Action**. Select **Page navigation** for **Type**, and then select the **Conditional formatting** (**fx**) icon next to the **Destination**.

   :::image type="content" source="media/desktop-buttons/button-set-page-nav-destination.png" alt-text="Screenshot showing Page navigation button.":::

1. On the **Destination - Action** page, select the name of the column you created. In this case, it's **Select a destination**.

   :::image type="content" source="media/desktop-buttons/button-select-destination.png" alt-text="Screenshot showing Select a destination.":::

   Now the button can navigate to different pages, depending on the user’s selection.

   :::image type="content" source="media/desktop-buttons/button-navigate-go.png" alt-text="Screenshot showing Navigate with a Go button.":::

## Related content

For more information about features that are similar or interact with buttons, take a look at the following articles:

- [Create buttons in Power BI reports](desktop-buttons.md)
- [Identify and use buttons in the Power BI service](../consumer/end-user-buttons.md)
- [Use drillthrough in Power BI reports](desktop-drillthrough.md)
- [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
- [Create a drillthrough button](desktop-drill-through-buttons.md)