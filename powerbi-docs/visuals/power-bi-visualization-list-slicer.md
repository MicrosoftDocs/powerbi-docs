---
title: Use a list slicer (preview)
description: Learn how to create, customize, and use list slicers in Power BI Desktop. Filter data interactively with hierarchies, search, and conditional formatting. Try it now.
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/21/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the list slicer (preview) feature in Power BI Desktop, including how to create and customize it, so I can enhance my reports with interactive filtering options.
---

# Create and use a list slicer (preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The list slicer (preview) in Power BI is an interactive visual that filters data directly within reports and dashboards. It offers a dynamic way to explore large datasets by selecting values from a vertically arranged list.

List slicers balance simplicity and flexibility, making them ideal for both novice users and advanced report builders. You can apply hierarchies, search functionality, and conditional formatting to enhance your filtering experience.

> [!IMPORTANT]
> The list slicer (preview) is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that might be substantially modified before release. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites

In the following guide, use the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

# [Power BI Desktop](#tab/powerbi-desktop)

> [!IMPORTANT]
> Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

1. Launch **Power BI Desktop**.
1. From the left-side navigation pane, select **Open**, or select **File > Open** from the menu.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view.

# [Power BI service](#tab/powerbi-service)

1. Sign in to the Power BI service (`app.powerbi.com`).
1. From the left-side navigation pane, select **Learn**.
1. On the **Learning center** page, under **Sample reports**, locate and select **Retail Analysis Sample**. It opens in Reading mode and adds the dashboard, report, and semantic model to your workspace.
1. At the top of the report, select **Edit** to switch to the Report editor (Edit mode).

---

> [!NOTE]
> To share your report with a Power BI colleague, both of you need individual Power BI Pro licenses, or you need to save the report in Premium capacity.

## Create a list slicer

In this quick and easy three-step guide, you create a **List slicer** in Power **BI Desktop**. Review the [Prerequisites](#prerequisites) section before following these steps.

1. With the **Retail Analysis Sample PBIX** open, make sure you're on the Overview page by selecting the **Overview** tab. To make room for your list slicer, select and resize the scatter chart by dragging the dark **visualization handles**. Then, with nothing selected on the report canvas, select the **List slicer** icon in the **Build visual** tab on the **Visualizations** pane to create a new slicer on the report canvas.

   :::image type="content" source="media/list-slicer/list-slicer-icon-highlighted.png" lightbox="media/list-slicer/list-slicer-icon-highlighted.png" alt-text="Screenshot of the Power BI Desktop Overview tab, Visualizations pane, Build visual, and list slicer icon highlighted, slicer placeholder with resize handles on canvas.":::

1. To add data to the visual, use the **Data** pane. With your slicer selected on the report canvas, go to the Data pane, expand the **District** table, and select **DM** to populate the slicer. The slicer now displays tiles with the district manager names. You can resize the slicer as needed and rearrange the elements on the canvas to your preference. Be careful not to make the slicer too small, which affects the displayed information.

   :::image type="content" source="media/list-slicer/list-slicer-district-highlighted.png" lightbox="media/list-slicer/list-slicer-district-highlighted.png" alt-text="Screenshot of the Data pane, District table, DM selected and highlighted, slicer on canvas displaying district manager names.":::

1. To customize your slicer, select the **Format visual** icon in the **Visualizations** pane. This icon grants you access to all available format settings. You can tailor the slicer's appearance and functionality to your specific requirements.

## Build a list slicer hierarchy

Power BI's slicer hierarchy feature lets you organize data into structured levels within a single slicer visual. By layering fields, you can create a dynamic, drillable view that mirrors real-world relationships like organizational structures or product categories. This approach enhances clarity, improves navigation, and empowers you to explore data more intuitively. Instead of scrolling through long flat lists, you can expand and collapse sections to focus on specific segments, making reports more interactive and insightful.

In the following steps, you learn how to build and apply a hierarchical slicer in Power BI, so your report delivers a more organized and interactive data exploration experience.

1. With the list slicer selected on your report canvas, go to the **Visualizations** pane and open the **Build visual** tab. In the **Values** field well, you see the current field is populated with **DM** (District Managers) providing the DM names for your list slicer. From the **Data** pane, locate and expand the **Store** table, and drag the **Chain** field into the **Values field well**, placing it above the existing DM field. Once added, your slicer shifts from a flat list to a structured hierarchy.
1. With the hierarchy now visible in your list slicer, right-click on either of the hierarchy groups and choose **Expand \> All** from the context menu. This action fully unfolds the hierarchy, displaying every available **Chain** along with the corresponding **District Managers** nested beneath each one.
1. By expanding all levels at once, you can immediately grasp the full organizational structure without needing to select each item individually. This action not only improves visibility but also streamlines analysis by presenting grouped relationships in a clear, accessible format.

   :::image type="content" source="media/list-slicer/image3.png" lightbox="media/list-slicer/image3.png" alt-text="Screenshot of list slicer with fully expanded hierarchy showing Chains and District Managers.":::

By following these steps, you enhance your Power BI report with an interactive hierarchical slicer that makes data exploration more intuitive, structured, and insightful.

## Restrict to leaf nodes

Restricting list slicer selection to leaf nodes in Power BI ensures that users can only select the most granular level of data within a hierarchy, such as individual employees or specific items, rather than broader parent categories like departments or chains.

In the following steps, you learn how to enable the "Restrict selection to leaf nodes" option in Power BI's list slicer. This setting ensures that users can only select the most detailed items within a hierarchy, such as individual employees, while preventing selection of higher-level categories like departments or chains. It helps maintain precise filtering and improves report clarity by guiding users toward specific, actionable data points.

Before proceeding, ensure your list slicer is configured with a hierarchy, as outlined in the **Build a list slicer hierarchy** section of this article. This setting is only available when a hierarchical structure is present. Let's begin.

1. With the hierarchical list slicer selected on your report canvas, ensure all hierarchy levels are expanded. In the slicer, locate a top-level group such as **Fashions Direct** and select it. You see that all child items (for example, District Managers) under this group are automatically selected, even though **Single Select** is enabled in the slicer settings.

1. To limit selection to only the lowest-level items (leaf nodes), go to the **Visualizations** pane. With the slicer still selected, find the **Slicer settings** under the **Visual** tab, and toggle **Restrict to leaf nodes** to **On**.

   :::image type="content" source="media/list-slicer/ListLeaf-02.png" alt-text="Screenshot of Visualizations pane with Slicer settings and Restrict to leaf nodes toggle turned on.":::

   When you turn on this setting, all previously *selected* items are now *unselected*. This behavior is expected, as the slicer now prohibits selection of parent-level items like *Fashions Direct*.

1. Now, select one of the child items under **Fashions Direct**, for example, a specific District Manager. You see that only this individual is selected, and the parent group remains unselectable.

1. Test the restriction by selecting **Fashions Direct**. It no longer responds as a selectable item, it can only be expanded or collapsed. This restriction ensures users can only filter by specific individuals or lowest-level entries.

This feature is especially useful when precise filtering is required, as it prevents users from selecting high-level groups that could lead to ambiguous or overly broad results.

## Search and filter list slicer

Power BI’s list slicer includes a built-in search feature that helps users quickly locate specific items within long or hierarchical lists. This feature is especially useful when working with large datasets, such as lists of District Managers, where scrolling manually can be time-consuming. By enabling the search option, users can type in part of a name and instantly filter the slicer to show only matching entries, making data exploration faster and more efficient.

In the following section, you learn how to search and filter your list slicer by using a practical example, enabling you to quickly and easily locate specific items within long or hierarchical lists.

1. Open the search box by selecting the three-dot **ellipsis menu (...)** in the top-right corner of your list slicer visual. From the dropdown, select **Search**. This action adds a search bar at the top of the slicer, so you can quickly find items without scrolling through the entire list.

1. Select the **search bar** and start typing a name or keyword. For example, entering the letter **C** instantly filters the slicer to show only District Managers whose names begin with or contain the letter **C**. In this example, the search feature makes it much easier to locate specific District Managers, like *Carlos Grilo*, *Chris Gray*, and *Chris McGurk*, in the dataset.

   :::image type="content" source="media/list-slicer/ListSearch-02.png" alt-text="Screenshot of list slicer search bar with letter C entered, filtering results to show District Managers with names containing C.":::

The search feature in list slicers helps you quickly find and select specific entries, making navigation smoother and more efficient—especially when working with long or hierarchical lists.

## Clear selections with eraser tool

Power BI’s list slicer now includes a convenient **eraser icon** that allows you to quickly clear all selected items in a slicer. This feature is especially helpful when working with multiple selections, such as choosing several District Managers from a hierarchical slicer. Instead of manually deselecting each item, you can select the eraser to reset the slicer instantly. It’s a small but powerful addition that improves usability and speeds up report interaction.

In the following section, you learn how to quickly clear multiple selections in your list slicer.

1. Prepare the slicer for multiple selections. First, select the list slicer on your report canvas. In the **Visualizations** pane, select the **Format visual** icon. Under this section, go to the **Visual** tab, then expand **Slicer** **settings**. Locate the **Single select** toggle and turn it **Off**. This setting allows you to select multiple items in the slicer, which is necessary before using the eraser feature.

1. Select multiple names in the slicer, for example, multiple **District Managers**. You see that each selected item is highlighted, and the slicer filters the report based on those selections.

1. To clear all selections at once, select the **eraser icon** located next to the **ellipsis menu (...)** in the top-right corner of the slicer. Instantly, all selected items are deselected, and the slicer returns to its default state.

   :::image type="content" source="media/list-slicer/ListEraser-03.png" alt-text="Screenshot of list slicer with eraser icon highlighted and all selections cleared.":::

The eraser icon in Power BI's list slicer offers a quick and user-friendly way to reset selections. It makes it easier to explore data without manually clearing filters, particularly when working with multiple or hierarchical values.

## Use conditional formatting

Conditional formatting in Power BI's list slicer lets you customize the appearance of slicer items based on dynamic data conditions. Whether you want to highlight top performers, flag exceptions, or align visuals with business logic, this feature enhances the user experience and helps guide users' attention to the most relevant selections. It adds clarity, improves interactivity, and helps create a more intuitive and impactful interface.

In the following section, you learn how to apply conditional formatting to the list slicer by using a practical example. With this knowledge, you can further tailor your reports with precision and impact.

1. Select the list slicer visual on your report canvas. This action ensures that any formatting changes you apply are specific to that slicer.
1. In the **Visualizations pane**, select the **Format visual icon**. Make sure you're in the **Visual tab**, then scroll down to locate the **Buttons** card to reveal further customization options.
1. Within the **Buttons** card, locate and expand the **Background** group to display the **Fill color** control, along with an 'fx' button beside the color picker.
1. Select the 'fx' button to launch the conditional formatting dialog window. Ensure the Format style is set to Rules. In the **What field should we base this on** dropdown, select **Status measure** for the **This Year Sales**, and then define the rules as follows:

   - First rule: **\>= 0 Percent** and **\< 0 Number** then **red** (*\#D64550*).
   - Second rule: **\>= 0 Number** and **\<=** **100 Percent** then **blue** (*\#118DFF*).

   Once the rules are defined, select **OK** to apply the desired formatting based on your conditions.

1. The district managers associated with a negative sales status are now displayed in red, while those with a positive status appear in blue. This color coding makes it easier and quicker for users to identify key information.

   :::image type="content" source="media/list-slicer/ListFx-03.png" alt-text="Screenshot of list slicer with District Managers color-coded red for negative sales and blue for positive sales.":::

Conditional formatting in list slicers helps you visually emphasize important data points, making your reports more intuitive and impactful. It's a simple way to guide users toward meaningful selections and improve overall report clarity.

## Paste values to select

The **Paste** feature lets you apply multiple selections to a button slicer by pasting a list of values. You don't need to manually select each option one by one. This feature streamlines the filtering process, especially when working with large datasets or predefined lists.

Instead of spending time selecting items individually, you can copy values from external sources (like Excel, Notepad, or emails) and paste them directly into the slicer. The slicer then automatically recognizes and applies all matching selections at once.

This approach not only saves time but also reduces the likelihood of overlooking values. It's perfect for scenarios where precision and speed are essential.

In the next section, you learn how to use this feature with a practical example to maximize its effect on your workflow.

1. To paste a set of values into a list slicer, open Excel. Create a new worksheet and enter your desired list of values. For example, type "Brad Sutton" in cell A1, "Carlos Grilo" in cell A2, and "Tina Lassila" in cell A3. Your worksheet should look like:

   :::image type="content" source="media/list-slicer/ListPaste-01.png" alt-text="Screenshot of Excel worksheet with names Brad Sutton, Carlos Grilo, and Tina Lassila in cells A1 through A3.":::

1. After entering the names in Excel, highlight the cells containing your list (A1 to A3) and copy them. Next, return to Power BI, select your list slicer on the report canvas, or use the slicer's ellipsis menu, and paste the copied values. Each entry with the matching names appears selected within the slicer, enabling straightforward filtering and analysis.

Pasting values into the list slicer streamlines filtering by quickly selecting multiple relevant entries at once. You save time and effort during data analysis.

Next, take time to familiarize yourself with the considerations and limitations for list slicers.

## Considerations and limitations

This section provides a list of known considerations and limitations, designed to help you navigate the nuances of the List slicer (preview) in Power BI Desktop.

> [!IMPORTANT]
> Because the List slicer is a preview feature in Power BI Desktop, the following considerations and limitations apply.

- **Power BI service**:
  - Users can't see the Button slicer (preview) in the **Power BI service** because it's currently a preview feature exclusive to **Power BI Desktop**.
  - The Button slicer (preview) is in the preview phase and is only available within the Power BI Desktop environment. This limitation is a common practice for features that are still under development, allowing users to test and provide feedback before a broader release.
  - Although the Button slicer (preview) isn't directly available in the Power BI service, you can publish any Button slicer (preview) you create in Power BI Desktop, making it visible in the Power BI service. This capability allows you to take advantage of the new features while ensuring compatibility and stability within the Service environment.
- **Format settings**:
  - When you're formatting a List slicer (preview), you might notice that some of the format settings are in a different location, or the name of the setting is changed.
  - Often, new settings or controls are added from one product update to the next. Such changes are expected, as preview features are continuously under development.
  - They're subject to modifications that enhance functionality and user experience. It's the responsibility of report creators to stay informed about these changes when using preview features.
  - Keeping abreast of product updates ensures the effective use of these features in your reports.
- **Accessibility**:
  - During the preview phase, certain accessibility features such as keyboard navigation and screen-reader support might not be fully operational.
  - However, we're committed to ensuring that all functionalities comply with accessibility standards upon the conclusion of the preview period.
- **Paste values**:
  - You can paste up to 2,000 values into the List slicer; any extras are ignored.
  - Pasting new values removes all previous selections.
  - When you paste values, the slicer applies exact-match ("IS") filtering by only selecting buttons with values that precisely correspond. If the pasted values don't match any available entries, those values still act as filters; so, visuals might display as blank due to the absence of matching data.
- **Sort buttons**:
  - Sorting via the ellipsis menu is limited to Value; Label sorting is currently unavailable.
- **Single select toggle**:
  - The **Single select** toggle permits multiple selections only when the 'Force selection' toggle is OFF. To select multiple options, hold CTRL and select other buttons.
  - If the Single select and Force selection toggle are ON, only one option can be selected at a time. CTRL + clicking other buttons isn't allowed.
- **Force selection toggle**:
  - When the Force selection toggle is ON, the button slicer ensures that one item is always selected. This setting requires the Single select toggle to be ON as well.
  - If a user applies another filter that hides the currently selected button, the slicer might look unselected. However, the previously selected (but now hidden) value continues to affect other visuals. Selected items are never cleared, even if they're temporarily removed from the current data due to filtering.
  - Currently, the slicer doesn't automatically select the first visible option when the forced selection is ON and the selected button is filtered out. Instead, the hidden selection remains active until the user chooses another visible option.

