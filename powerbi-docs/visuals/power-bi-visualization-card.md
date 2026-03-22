---
title: Create a card visual in Power BI
description: This article provides an understanding of the card visual and a quick three-step guide on how to build a card visual in Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/18/2025
ai-usage: ai-assisted
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the card visual so that I can effectively and more easily build card visuals in Power BI Desktop.
---

# Create a card visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The **card visual** in Power BI is a versatile tool for presenting summary measures in a visually appealing format. Each card can display a specific measure, such as total sales or profit growth, and you can customize it to reflect your objectives and key results (OKRs). This flexibility allows you to group multiple cards within a single visual, format them to match your report, and share a comprehensive overview in each card.

Combining multiple measures and reference labels in one visual improves the report performance by reducing visual load time and optimizing underlying queries to the semantic model.

> [!NOTE]
> The **(new) card visual** became generally available as the **card visual** with the November 2025 Power BI release. Reports with the legacy card visual continue to use the legacy card visual.

## Create a card visual

1. In the **Visualizations** pane, select the **Build visual** tab, then select the **Card** visual from the visual gallery.

1. Add a measure or any data column to the **Values** field well.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card.png" alt-text="Screenshot of the Data pane with StoreCount and TotalSalesLY measures added to the Value field well in the Visualizations pane." lightbox="media/power-bi-visualization-card-visual/build-card.png":::

You now have a simple card. You can add as many values as you like and more cards appear.

## Customize the card visual layout

The card visual offers several layout options to make your visuals more organized and visually appealing. Access these settings by selecting the **Format visual** icon in the **Visualizations** pane, then select the **Visual** tab.

:::image type="content" source="media/power-bi-visualization-card-visual/multicard-layout.png" alt-text="Screenshot of the Visualizations pane with Format visual and Visual tab selected, all Format controls highlighted." lightbox="media/power-bi-visualization-card-visual/multicard-layout.png":::

### Card layout

The **Cards** > **Layout** controls how elements are arranged within each card. Each card can have three sections: callout, image, and reference labels. Use these settings to adjust the positioning, alignment, and spacing of these elements.

The card visual includes a dynamic *collage* layout that lets you highlight one section while the other two share the remaining space. You can also customize the display order of the callout, reference label, and hero image and give them each different background colors.

:::image type="content" source="media/power-bi-visualization-card-visual/enhanced-layout.png" alt-text="Screenshot of the Image pane with the card and image settings you can apply." lightbox="media/power-bi-visualization-card-visual/enhanced-layout.png":::

### Callout layout

The **Callout** > **Layout** controls the vertical alignment and size of the callout within the callout section of each card.

### Reference labels layout

The **Reference labels layout** controls how reference labels are organized within the reference labels section of each card. You can customize the look and feel including gaps, padding, backgrounds, and more.

### Multi-card layout

The **Multi-card layout** customizes how multiple cards fit within the visual container. When you have multiple values, this setting controls the arrangement of cards. 

### Multi-category layout

The **Multi-category layout** formats how each category section is laid out (such as Canada, Germany). Use this setting when you have categories added to your card visual. Within each category section, cards are arranged according to the multi-card layout settings.

## Add an image

The card visual in Power BI lets you create visually appealing cards that combine metrics with multiple image options, including:

- **Image**: A large, prominent image that can showcase product photos, campaign graphics, or branded imagery directly within the card. Configure this in the **Image** section of the format pane.
- **Callout image**: A smaller image within the callout that provides subtle enhancements, working well for branding elements or small visual cues without overwhelming the metric display. Configure this in **Callout** > **Image**.
- **Category header background image**: A background image for category headers when you have categories added to the card visual. Configure this in the **Category header** section.

To add images to your card visual: 

- **Add an image:** With the card visual selected, select the **Format visual** icon in the **Visualizations** pane. Under the **Visual** tab, expand the **Image** card. Select your card in the **Cards** dropdown, and then set the **Image** toggle to *on*. 
- **Add a callout image**: From the **Visualizations** pane, select the **Format visual** icon. Under the **Visual** tab, expand the **Callout** card. Ensure your card is selected in the **Apply settings**, expand the **Image** controls, and then set the **Image** toggle to *on*. 

For all image types, you can add by uploading from your local device, pasting an image URL, or selecting an image from a data column. You can also customize the fit of the image and choose different image effects to enhance its appearance.

:::image type="content" source="media/power-bi-visualization-card-visual/add-image.png" alt-text="Screenshot of the Visual pane with the Image selections shown to upload an image and customize it." lightbox="media/power-bi-visualization-card-visual/add-image.png":::

## Add categories

You can add categories to your card visual by dragging a field into the **Categories** field well in the **Build visual** section of the **Visualizations** pane. When you add a category, the card visual expands to display a separate section for each category value, with each section showing data sliced to that category.

The category headers are selectable and filter other visuals in the report when selected. This behavior lets users interact with your card visual to explore data across different segments.

The layout of category sections is controlled by the **Multi-category layout** section in the format pane under the **Visual** tab. Within each category section, the arrangement of individual cards is still controlled by the **Multi-card layout** section. Elements within each card, such as the callout, image, and reference labels, are controlled by the **Cards** > **Layout** section.

## Card walkthrough

Follow this walkthrough to build a comprehensive card visual step by step.

### Sample data

To follow along with the examples in this walkthrough, create a calculated table with sample data in a blank Power BI Desktop report.

1. Open Power BI Desktop and create a new blank report.
1. Select **Modeling** > **New table**.
1. Paste the following DAX expression:

   ```dax
   Product Line Sales =
   DATATABLE(
       "Product Line", STRING,
       "Channel", STRING,
       "_Units", INTEGER,
       "_Revenue", INTEGER,
       "_Revenue Target", INTEGER,
       "_Returns", INTEGER,
       {
           {"A", "Online", 1200, 84000, 80000, 45},
           {"A", "Retail", 800, 48600, 60000, 154},
           {"B", "Online", 2400, 168000, 150000, 89},
           {"B", "Retail", 1600, 112000, 120000, 640},
           {"C", "Online", 600, 72000, 70000, 18},
           {"C", "Retail", 950, 114000, 100000, 31}
       }
   )
   ```

1. Press **Enter** to create the table.

Add measures to aggregate the sample data. Select **TMDL** on the left side to open the TMDL view, paste the following script, and select **Apply**:

```tmdl
measure Units = SUM('Product Line Sales'[_Units])
    formatString: #,##0

measure Revenue = SUM('Product Line Sales'[_Revenue])
    formatString: $#,##0

measure 'Revenue target' = SUM('Product Line Sales'[_Revenue Target])
    formatString: $#,##0

measure Returns = SUM('Product Line Sales'[_Returns])
    formatString: #,##0

measure 'Revenue % to target' = DIVIDE([Revenue], [Revenue target])
    formatString: 0.0%

measure 'Return rate' = DIVIDE([Returns], [Units])
    formatString: 0.0%

measure 'Revenue variance' = [Revenue] - [Revenue target]
    formatString: $#,##0
```

Alternatively, create the measures by selecting **Modeling** > **New measure** and entering each expression.

### Create a basic card

1. In the **Visualizations** pane, select the **Build visual** tab, then select the **Card** visual from the visual gallery.

1. Drag **Revenue** to the **Values** field well.

1. Drag **Units** to the **Values** field well.

You now have a multi-card visual displaying total revenue and total units.

### Add a callout image

Add an image to the callout area to make your card more visually engaging. For this example, add two measures that generate SVG images based on the data.

Select **TMDL** on the left side to open the TMDL view, paste the following script, and select **Apply**:

```tmdl
createOrReplace

	ref table 'Product Line Sales'

		/// Generates an SVG image data URI that visually represents the percentage of unreturned units based on the Return rate measure, scaling the fill width up to a fixed maximum.
		measure 'Units callout image' =
				VAR _ReturnRate = [Return rate]
				VAR _UnreturnedPct = (1 - _ReturnRate) * 100
				VAR _FillWidth = MIN(38, MAX(0, _UnreturnedPct * 0.38))
				RETURN
				"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='16'%3E%3Crect x='1' y='3' width='38' height='10' fill='none' stroke='%23808080' stroke-width='2' rx='2'/%3E%3Crect x='1' y='3' width='" & FORMAT(_FillWidth, "0") & "' height='10' fill='%23404040' rx='2'/%3E%3Ctext x='45' y='12' font-size='10' fill='%23404040'%3E%25%3C/text%3E%3C/svg%3E"
			displayFolder: Images
			lineageTag: 73d5fc74-c2b7-428e-81b9-0cc283171e70
			dataCategory: ImageUrl

		/// Generates an SVG callout image that visualizes revenue percentage to target as a bar whose length and direction reflect the variance from 100% achievement. Used in visual elements like cards or tables to show at-a-glance over- or under-performance versus the revenue target.
		measure 'Revenue callout image' =
				VAR _PctToTarget = [Revenue % to target]
				VAR _VariancePct = (_PctToTarget - 1) * 100
				VAR _IsPositive = _VariancePct >= 0
				VAR _BarLength = MIN(20, ABS(_VariancePct) * 0.4)
				RETURN IF(_IsPositive,
				    "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='16'%3E%3Cline x1='20' y1='3' x2='20' y2='13' stroke='%23404040' stroke-width='1'/%3E%3Crect x='20' y='5' width='" & FORMAT(_BarLength, "0") & "' height='6' fill='%23107C10'/%3E%3C/svg%3E",
				    "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='16'%3E%3Cline x1='20' y1='3' x2='20' y2='13' stroke='%23404040' stroke-width='1'/%3E%3Crect x='" & FORMAT(20 - _BarLength, "0") & "' y='5' width='" & FORMAT(_BarLength, "0") & "' height='6' fill='%23D13438'/%3E%3C/svg%3E")
			displayFolder: Images
			lineageTag: d8a2caf9-40b2-48f7-afe7-2a65b7958fe0
			dataCategory: ImageUrl
```

To add the callout images:

1. Select your card visual.
1. In the **Visualizations** pane, select the **Format visual** icon.
1. Under the **Visual** tab, expand **Callout**.
1. In the **Apply settings to** dropdown, select **Units**.
1. Expand **Image** and toggle it to **On**.
1. Set **Image type** to **Select from data**.
1. Select **Units callout image** from the field dropdown.
1. In the **Apply settings to** dropdown, select **Revenue**.
1. Expand **Image** and toggle it to **On**.
1. Set **Image type** to **Select from data**.
1. Select **Revenue callout image** from the field dropdown.

Each card now displays a data-driven image in the callout area alongside its metric value.

### Show by category

Add a category to display your data broken down by segment.

1. In the **Data** pane, drag **Product Line** to the **Categories** field well.

1. Drag **Channel** to the **Categories** field well to further break down the data by sales channel within each product line.

The card visual now shows a separate section for each product line and channel combination, with each section displaying units and revenue along with their callout images.

### Add reference labels

Reference labels provide additional context for your main metric.

1. Drag **Units** and **Revenue % to target** to the **Reference labels** field well.

Your card now displays revenue as the main callout, with units and percentage to target as supporting reference labels.

### Add a top-level image

Add a prominent image to the card that displays outside the callout area.

1. In the **Visualizations** pane, select the **Format visual** icon.
1. Under the **Visual** tab, expand the **Image** card.
1. In the **Apply settings to** dropdown, choose which card to configure, or leave it as **All** to apply to all cards.
1. Toggle **Image** to **On**.
1. Select your image source and add your image.

The image appears in its own section of the card, separate from the callout and reference labels. Use the **Cards** > **Layout** settings to adjust the arrangement of the callout, image, and reference labels sections.

## Considerations and limitations

### Category header selection

When you select a category header to filter other visuals, the following limitations apply:

- The selected category header doesn't indicate it's selected.
- Selection only works when the category header position is set to top or bottom. Left or right positions don't support selection.
- To deselect a category header, you must select somewhere else on the card. Selecting the category header again doesn't deselect it.
- You can't use **Edit interactions** to control which visuals the card filters.

### Frequently asked questions for cards used in reports during preview

#### Why is the column setting reset to 5 or row setting reset to 3 when I had it previously set to a different number?

During preview, you could set a column or row number for a grid, vertical, or horizontal arrangement of cards. After the November 2025 release, only the grid arrangement setting is kept. Vertical and horizontal arrangements reset to 5 columns and 3 rows on existing reports, including published reports. Scrollbars may appear in your existing card visuals to accommodate these settings. Only reports published or created with the card visual during preview are impacted. 

To return your cards to the previous column and row number, update these settings in the November 2025 Power BI Desktop and publish the report or edit the report in the web.

#### Why do the cards take up more space?

During preview, the default settings had less padding in the cards. After the November 2025 release, more padding and padding options were added to the card. The new default is 12px. 

To find and adjust these settings, search for “Padding” in the format pane and adjust as needed. In some cases, toggling on **individual padding** can restore previous padding settings.

Padding can be set in a custom theme file or added to your own custom theme file to apply them to all cards in your report.

```json
{
  "$schema": "https://raw.githubusercontent.com/microsoft/powerbi-desktop-samples/main/Report%20Theme%20JSON%20Schema/reportThemeSchema-2.149.json",
  "name": "CardVisualGA",
  "visualStyles": {
    "cardVisual": {
      "*": {
        "*": [{
            "$id": "default",
            "paddingUniform": 0        
        }]
      }
    }
  }
}
```
See the [Power BI report themes](/power-bi/create-reports/desktop-report-themes) documentation or more information.


#### Why is there a reference label area on cards without a reference label?

During preview, the **reference labels** were part of the callout area when the **divider** was turned off. After November 2025, the **reference labels** have their own area. Once an area is used in at least one card, the other cards keep that area available to maintain consistency across cards. 

#### Why is the reference label obscuring the text in the callout?

During preview, the **reference labels** were part of the callout area. After November 2025, the **reference labels** have their own area. They also now take up 50% of the card by default. 

To adjust the card area sizes, go to **Cards**, make sure the **Apply setting to** control is set to **All**, then in **Layout** adjust the **Callout size** %.

#### Why is there a background color added to the card reference label?
During preview, the background color only showed when the reference label had a divider. The divider gave the reference labels their own area in the card to then apply a background to. After the November 2025 release, reference labels always have their own area with or without a divider, and a default background is used. 

The background can be turned off by going to **reference labels layout** > **background** in the format pane and toggling **off** the setting.

This setting can be set in a custom theme file or added to your own custom theme file to apply them to all cards in your report. 

```json
{
  "$schema": "https://raw.githubusercontent.com/microsoft/powerbi-desktop-samples/main/Report%20Theme%20JSON%20Schema/reportThemeSchema-2.149.json",
  "name": "CardVisualGA",
  "visualStyles": {
    "cardVisual": {
      "*": {
        "*": [{
            "$id": "default",
            "backgroundTransparency": 100          
        }]
      }
    }
  }
}
```
See the [Power BI report themes](/power-bi/create-reports/desktop-report-themes) documentation or more information.

#### Why can’t I see my image settings in the format pane?

During preview, the callout image was added using the **Image** section of the format pane and showed in the callout area next to the text. After November 2025, those images previously added were kept in the callout area, and their settings moved to **Callout** > **Image** section in the format pane. Setting the **Image** section of the format pane now adds a new image to the card with its own area. 

#### Why is my image now zoomed in?

During preview, the default settings for size of the image had some bugs corrected by the November 2025 update. Depending on your initial settings, the image can look “zoomed in” or different from before.

To fix the image, in the format pane, adjust the **Callout** > **Image** settings for **image fit** to be **fit** or **center**, and check the **size** and **image area size** controls in the same formatting section. Note this setting is in a new location, and the top-level **Image** section is now for the card image.

#### Why is my category header image gone?

Go to **Category header** settings and turn back on **add image**. Your image should still be there.

#### Where did the legacy card and multi-card visuals go?

The legacy single card and multi-card visuals reappear if you go to the three dots in the visualization pane and choose **Restore default visuals**. In a report having one of these visuals they may show in the unpinned area of the visualization pane, where you generally find custom visuals.  

#### Why does the new card visual in a published report look different than it looks in Desktop?

Differences between Desktop and the service can happen in two scenarios.

-	You are using a version of Desktop before November 2025, when the card was in preview. When published to the service it was upgraded to be the generally available version of the new card visual. Either update your Power BI Desktop or edit the report in the web after publishing to adjust the style.
   
-	You are using November 2025 version of Power BI Desktop, and the update for the generally available card isn't in your service region. Once the service region is updated, the card looks the same. This behavior should only happen in a few regions in late November 2025.


### Default behavior changes from public preview

During preview, the card visual's default behavior was different to how it now behaves in general availability. At general availability, we made updates to enhance the layout consistency, visual alignment, and overall user experience. 

- **Callout image alignment:** During preview, the callout image aligned was constrained to the callout label text, which may leave part of the callout container empty. Now the image aligns to the callout container. 

- **Background image fit:** During preview, the background image could repeat to fill the container. Now the **image fit** options align with other visual image options of fit, stretch, fill, and center.  
   
- **Reference label outer padding:** During preview, **reference labels** had an **outer padding** setting that unintentionally affected the callout area by pushing elements out of place around the divider. Now the **outer padding** setting is removed from **reference labels**.

- **Autogrid columns:** During preview, the visuals would leave an empty column to match the specified number of columns. With the addition of **autogrid**, it arranges cards to fill the visual container based the cards present. This setting can be toggled off to return to previous behavior.

### Format settings

- The **(new) card visual** is generally available as the **card visual** with the November 2025 Power BI release. If you used the card visual during the public preview phase, you might notice behavior or formatting changes that reflect the improvements in the general availability release.
- The new Card visual includes updated default styling. Newly created cards may look different from legacy cards and from cards created during Public Preview, while existing visuals remain unchanged.
- When formatting the card visual, you might notice that some of the format settings are in a different or new location, or the name of the setting is changed.
- In earlier versions of the card visual, the **Callout** image was available as part of the **Image card**. This image is now in the **Callout** section of the **Format** pane.
- Certain **Layout** arrangements might affect existing reports that used the card visual during its public preview phase. This effect is due to updates made to all card components as part of the general availability release, including enhancements to layout, styling, and image handling.
- If you previously relied on the Image card layout, update your visuals accordingly by using the Format pane to access and configure the Callout image settings.

### Legacy Card visual

The previous (legacy) Card visual remains available for backward compatibility. Existing reports using the legacy Card visual continue to render without changes. The new Card visual is recommended for new reports. When you select the Card icon in the Visualizations pane, it creates the new Card visual introduced in the November 2025 general availability release. Users who need to maintain legacy behavior should continue using existing legacy Card visuals in their reports.

## Related content

- [Visualizations overview in Power BI](power-bi-visualizations-overview.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
