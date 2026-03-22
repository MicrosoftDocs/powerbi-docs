---
title: Create a card visual in Power BI
description: Learn how to create and customize the card visual in Power BI, including callout images, categories, reference labels, and data-driven SVG images.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 03/22/2026
ai-usage: ai-assisted
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the card visual so that I can effectively and more easily build card visuals in Power BI Desktop.
---

# Create a card visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The **card visual** in Power BI displays key metrics in a flexible, visually appealing format. Each card shows a measure value with optional callout images, reference labels, and supporting details. You can display multiple cards in a single visual, break them down by categories, and customize layouts to match your report design.

Combining multiple measures and reference labels in one visual improves report performance by reducing visual load time and optimizing underlying queries to the semantic model. You can also use data-driven images to create custom visualizations that respond to your data.

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

> [!NOTE]
> This walkthrough uses the [modern visual defaults preview](../create-reports/power-bi-reports-visual-defaults.md) turned on. Enable this feature in **Options** > **Preview features** > **Modern visual defaults and customize theme improvements** to match the examples shown.

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
createOrReplace

	ref table 'Product Line Sales'

		/// Sums the _Units column in the 'Product Line Sales' table to return the total units sold.
		measure Units = SUM('Product Line Sales'[_Units])
			formatString: #,##0

		/// Calculate total revenue by summing the _Revenue column from the 'Product Line Sales' table.
		measure Revenue = SUM('Product Line Sales'[_Revenue])
			formatString: $#,##0

		/// Calculates the total revenue target from the '_Revenue Target' column in the current filter context.
		measure 'Revenue target' = SUM('Product Line Sales'[_Revenue Target])
			formatString: $#,##0

		/// Sums the total number of product returns recorded in the 'Product Line Sales' table.
		measure Returns = SUM('Product Line Sales'[_Returns])
			formatString: #,##0

		/// Calculates the percentage of actual revenue achieved versus the revenue target by dividing [Revenue] by [Revenue target].
		measure 'Revenue % to target' = DIVIDE([Revenue], [Revenue target])
			formatString: 0.0%

		/// Calculates the return rate by dividing the number of returned units by the total units.
		measure 'Return rate' = DIVIDE([Returns], [Units])
			formatString: 0.0%

		/// Calculates the difference between actual revenue and revenue target to show the revenue variance.
		measure 'Revenue variance' = [Revenue] - [Revenue target]
			formatString: $#,##0
```

Alternatively, create the measures by selecting **Modeling** > **New measure** and entering each expression.

### Create a basic card

1. In the **Visualizations** pane, select the **Build visual** tab, then select the **Card** visual from the visual gallery.

1. Drag **Units** to the **Values** field well.

1. Drag **Revenue** to the **Values** field well.

You now have a multi-card visual displaying total units and total revenue.

:::image type="content" source="media/power-bi-visualization-card-visual/walkthrough-basic-card.png" alt-text="Screenshot of a basic card visual displaying total units and total revenue.":::

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
1. Set **Image fit** to **Center**.
1. Set **Size** to **20 px** to make the bar more visible.
1. In the **Apply settings to** dropdown, select **Revenue**.
1. Expand **Image** and toggle it to **On**.
1. Set **Image type** to **Select from data**.
1. Select **Revenue callout image** from the field dropdown.
1. Set **Image fit** to **Center**.
1. Set **Size** to **40 px**.

Each card now displays a data-driven image in the callout area alongside its metric value.

:::image type="content" source="media/power-bi-visualization-card-visual/walkthrough-add-callout-image.png" alt-text="Screenshot of a card visual with callout images showing data-driven SVG visualizations next to the metric values.":::

### Show by category

Add a category to display your data broken down by segment.

1. In the **Data** pane, drag **Product Line** to the **Categories** field well.

1. Drag **Channel** to the **Categories** field well to further break down the data by sales channel within each product line.

1. In the **Visualizations** pane, select the **Format visual** icon.

1. Under the **Visual** tab, expand **Multi-category layout**.

1. Expand **Layout**, toggle **Autogrid** to **Off**, and set **Rows** to **6** to display all categories.

> [!NOTE]
> When **Autogrid** is on, the maximum number of rows is 4. To display more rows, turn off **Autogrid**.

The card visual now shows a separate section for each product line and channel combination, with each section displaying units and revenue along with their callout images.

:::image type="content" source="media/power-bi-visualization-card-visual/walkthrough-add-show-by-category.png" alt-text="Screenshot of a card visual broken down by product line and channel categories.":::

### Add a category header background image

Add a background image to your category headers to make each category stand out further. For this example, add a measure that generates an SVG gradient image.

Select **TMDL** on the left side to open the TMDL view, paste the following script, and select **Apply**:

```tmdl
createOrReplace

	ref table 'Product Line Sales'

		/// Generates a 64x64 SVG image dynamically based on Product Line (color)
		/// and Channel (pattern). Product Line A=blue, B=green, C=purple.
		/// Online channel uses waves pattern, Retail uses dots pattern.
		/// Returns a data URI for use as an image in visuals.
		measure 'Category image' =

				-- Get the current filter context values
				VAR _ProductLine = SELECTEDVALUE('Product Line Sales'[Product Line])
				VAR _Channel = SELECTEDVALUE('Product Line Sales'[Channel])

				-- Define fill colors by Product Line (URL-encoded hex)
				-- A = Blue (#0078D4), B = Green (#107C10), C = Purple (#8764B8)
				VAR _FillColor =
					SWITCH(
						_ProductLine,
						"A", "%230078D4",
						"B", "%23107C10",
						"C", "%238764B8",
						"%23808080"  -- Default gray
					)

				-- Define stroke/pattern colors (lighter variants)
				VAR _StrokeColor =
					SWITCH(
						_ProductLine,
						"A", "%2350A0E0",
						"B", "%2350B050",
						"C", "%23A090D0",
						"%23A0A0A0"  -- Default gray
					)

				-- Waves pattern for Online channel (4 horizontal wave lines)
				VAR _WavesPattern =
					"<path d='M0,8 Q8,0 16,8 T32,8 T48,8 T64,8 " &
					"M0,24 Q8,16 16,24 T32,24 T48,24 T64,24 " &
					"M0,40 Q8,32 16,40 T32,40 T48,40 T64,40 " &
					"M0,56 Q8,48 16,56 T32,56 T48,56 T64,56' " &
					"stroke='" & _StrokeColor & "' stroke-width='3' fill='none'/>"

				-- Dots pattern for Retail channel (offset grid of circles)
				VAR _DotsPattern =
					-- Row 1: 4 dots at y=8
					"<circle cx='8' cy='8' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='24' cy='8' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='40' cy='8' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='56' cy='8' r='4' fill='" & _StrokeColor & "'/>" &
					-- Row 2: 3 dots at y=24 (offset)
					"<circle cx='16' cy='24' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='32' cy='24' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='48' cy='24' r='4' fill='" & _StrokeColor & "'/>" &
					-- Row 3: 4 dots at y=40
					"<circle cx='8' cy='40' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='24' cy='40' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='40' cy='40' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='56' cy='40' r='4' fill='" & _StrokeColor & "'/>" &
					-- Row 4: 3 dots at y=56 (offset)
					"<circle cx='16' cy='56' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='32' cy='56' r='4' fill='" & _StrokeColor & "'/>" &
					"<circle cx='48' cy='56' r='4' fill='" & _StrokeColor & "'/>"

				-- Select pattern based on Channel
				VAR _Pattern =
					IF(_Channel = "Online", _WavesPattern, _DotsPattern)

				-- Assemble final SVG with data URI prefix
				RETURN
					"data:image/svg+xml;utf8," &
					"<svg xmlns='http://www.w3.org/2000/svg' " &
						"width='64' height='64' viewBox='0 0 64 64'>" &
						"<rect width='64' height='64' fill='" & _FillColor & "'/>" &
						_Pattern &
					"</svg>"
			displayFolder: Images
			dataCategory: ImageUrl
```

To add the category header background image:

1. Select your card visual.
1. In the **Visualizations** pane, select the **Format visual** icon.
1. Under the **Visual** tab, expand **Category header**.
1. In the **Apply settings to** dropdown, select **All**.
1. Expand the **Background** section and toggle it to **On**.
1. Toggle **Add image** to **On**.
1. Set **Image source** to **Select from data**.
1. Select **Category image** from the field dropdown.
1. Set **Image fit** to **Fill**.
1. Set **Transparency** to **50%**.

Each category header now displays a subtle gradient background that helps visually separate the different category sections. You can also add individual images to each category by selecting a specific category in the **Apply settings to** dropdown.

### Add reference labels

Reference labels provide additional context for your main metric. You can also add detail values to reference labels for more granular information.

1. In the **Visualizations** pane, select the **Format visual** icon.

1. Under the **Visual** tab, expand the **Reference labels** section.

1. In the **Apply settings to** dropdown, select **Units**.

1. Drag **Returns** to the **Add label** data field.

1. In the **Add label** dropdown, select **Returns**.

1. Expand the **Detail** section and toggle it to **On**.

1. Drag **Return rate** to the **Details** data field.

1. In the **Apply settings to** dropdown, select **Revenue**.

1. Drag **Revenue variance** to the **Add label** data field.

1. In the **Add label** dropdown, select **Revenue variance**.

1. Expand the **Detail** section and toggle it to **On**.

1. Drag **Revenue % to target** to the **Details** data field.

Your cards now display reference labels with details: the Units card shows returns with return rate, and the Revenue card shows revenue variance with percentage to target. You can further format reference labels, including using conditional formatting to adjust colors based on values.

:::image type="content" source="media/power-bi-visualization-card-visual/walkthrough-add-reference-labels.png" alt-text="Screenshot of a card visual with reference labels showing returns and revenue variance with detail values.":::

### Add a top-level image

Add a prominent image to the card that displays outside the callout area. You can use this feature to show product images, store images, or manager photos. In this example, we create bespoke SVG images that combine callout imagery and reference label details into a single custom visualization.

Select **TMDL** on the left side to open the TMDL view, paste the following script, and select **Apply**:

```tmdl
createOrReplace

	ref table 'Product Line Sales'

		/// Generates an SVG status card that visualizes units return performance with a progress bar, pill label, and dynamic colors/text based on whether the return rate is at or below 5%.
		measure 'Units image' =
				VAR _Units = [Units]
				VAR _Returns = [Returns]
				VAR _ReturnRate = [Return rate]
				VAR _IsOnTrack = _ReturnRate <= 0.05  // 5% threshold

				// Formatting
				VAR _ReturnsFormatted = FORMAT(_Returns, "#,##0")
				VAR _RateFormatted = FORMAT(_ReturnRate * 100, "0.0") & "%25"

				// Filled rect - shows unreturned % (higher fill = better)
				VAR _UnreturnedPct = (1 - _ReturnRate) * 100
				VAR _FillWidth = MIN(80, MAX(0, _UnreturnedPct * 0.8))

				// Colors - light red background when needs attention
				VAR _BgFill = IF(_IsOnTrack, "none", "%23FDE7E9")
				VAR _StatusTextColor = IF(_IsOnTrack, "%23605E5C", "%23A80000")
				VAR _StatusText = IF(_IsOnTrack, "ON TRACK", "NEEDS ATTENTION")
				VAR _PillFill = IF(_IsOnTrack, "%23F3F2F1", "%23FFFFFF")
				VAR _PillStroke = IF(_IsOnTrack, "%23605E5C", "%23D83B01")
				VAR _PillText = IF(_IsOnTrack, "%23323130", "%23A80000")
				VAR _BarFill = IF(_IsOnTrack, "%23404040", "%23D83B01")
				VAR _BarStroke = IF(_IsOnTrack, "%23808080", "%23D83B01")

				RETURN
				"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='200' height='80' viewBox='0 0 200 80'%3E" &
				"%3Crect x='0' y='0' width='200' height='80' rx='4' fill='" & _BgFill & "'/%3E" &
				"%3Ctext x='100' y='18' text-anchor='middle' font-family='Segoe UI' font-size='12' font-weight='600' fill='" & _StatusTextColor & "'%3E" & _StatusText & "%3C/text%3E" &
				"%3Crect x='60' y='28' width='80' height='12' fill='none' stroke='" & _BarStroke & "' stroke-width='1.5' rx='2'/%3E" &
				"%3Crect x='60' y='28' width='" & FORMAT(_FillWidth, "0") & "' height='12' fill='" & _BarFill & "' rx='2'/%3E" &
				"%3Crect x='30' y='48' width='140' height='22' rx='11' fill='" & _PillFill & "' stroke='" & _PillStroke & "' stroke-width='1.5'/%3E" &
				"%3Ctext x='100' y='63' text-anchor='middle' font-family='Segoe UI' font-size='11' font-weight='600' fill='" & _PillText & "'%3E" & _ReturnsFormatted & " returns (" & _RateFormatted & ")%3C/text%3E" &
				"%3C/svg%3E"
			displayFolder: Images
			dataCategory: ImageUrl

		/// Generates an SVG-based KPI image summarizing revenue performance versus target, including variance, percent to target, and on/off-track status using conditional colors, text, and bar visuals.
		measure 'Revenue image' =
				VAR _Revenue = [Revenue]
				VAR _Target = [Revenue target]
				VAR _Variance = [Revenue variance]
				VAR _PctToTarget = [Revenue % to target]
				VAR _IsOnTrack = _PctToTarget >= 1

				// Formatting
				VAR _VarianceAbs = ABS(_Variance)
				VAR _VarianceFormatted = IF(_Variance >= 0, "%2B", "-") & FORMAT(_VarianceAbs / 1000, "#,##0") & "K"
				VAR _PctFormatted = IF(_PctToTarget >= 1, "%2B", "") & FORMAT((_PctToTarget - 1) * 100, "0.0") & "%25"

				// Colors - light red background when needs attention
				VAR _BgFill = IF(_IsOnTrack, "none", "%23FDE7E9")
				VAR _StatusTextColor = IF(_IsOnTrack, "%23605E5C", "%23A80000")
				VAR _StatusText = IF(_IsOnTrack, "ON TRACK", "NEEDS ATTENTION")
				VAR _PillFill = IF(_IsOnTrack, "%23F3F2F1", "%23FFFFFF")
				VAR _PillStroke = IF(_IsOnTrack, "%23605E5C", "%23D83B01")
				VAR _PillText = IF(_IsOnTrack, "%23323130", "%23A80000")

				// IBCS variance bar
				VAR _BarX = IF(_Variance >= 0, 100, 100 - MIN(40, ABS((_PctToTarget - 1) * 100) * 0.8))
				VAR _BarW = MIN(40, ABS((_PctToTarget - 1) * 100) * 0.8)
				VAR _BarColor = IF(_Variance >= 0, "%23605E5C", "%23D83B01")

				RETURN
				"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='200' height='80' viewBox='0 0 200 80'%3E" &
				"%3Crect x='0' y='0' width='200' height='80' rx='4' fill='" & _BgFill & "'/%3E" &
				"%3Ctext x='100' y='18' text-anchor='middle' font-family='Segoe UI' font-size='12' font-weight='600' fill='" & _StatusTextColor & "'%3E" & _StatusText & "%3C/text%3E" &
				"%3Cline x1='100' y1='24' x2='100' y2='44' stroke='%23808080' stroke-width='1'/%3E" &
				"%3Crect x='" & FORMAT(_BarX, "0") & "' y='28' width='" & FORMAT(_BarW, "0") & "' height='12' fill='" & _BarColor & "'/%3E" &
				"%3Crect x='30' y='50' width='140' height='22' rx='11' fill='" & _PillFill & "' stroke='" & _PillStroke & "' stroke-width='1.5'/%3E" &
				"%3Ctext x='100' y='65' text-anchor='middle' font-family='Segoe UI' font-size='11' font-weight='600' fill='" & _PillText & "'%3E" & _VarianceFormatted & " (" & _PctFormatted & ")%3C/text%3E" &
				"%3C/svg%3E"
			displayFolder: Images
			dataCategory: ImageUrl
```

To add the top-level images:

1. In the **Visualizations** pane, select the **Format visual** icon.

1. Under the **Visual** tab, expand the **Image** section.

1. In the **Apply settings to** dropdown, select **Cards** = **Units**.

1. Toggle **Image** to **On**.

1. Set **Image source** to **Select from data**.

1. Select **Units image** from the field dropdown.

1. Set **Image fit** to **Fill**.

1. In the **Apply settings to** dropdown, select **Cards** = **Revenue**.

1. Toggle **Image** to **On**.

1. Set **Image source** to **Select from data**.

1. Select **Revenue image** from the field dropdown.

1. Set **Image fit** to **Fill**.

With the bespoke SVG image approach, you can consolidate the reference label and detail information into the image itself. To streamline the card layout:

1. Under **Callout**, turn off the **Image** toggle for each card to remove the callout images.

1. Under **Reference labels**, remove any reference labels you added by deleting them from the **Add label** data fields.

1. Under **Cards** > **Layout**, set **Arrangement** to **Horizontal**.

1. Set the **Order** to **Image**, **Callout**, **Reference labels**.

1. Set **Callout size** to **40%**.

The image now appears in its own section of the card with a horizontal layout that emphasizes the custom SVG visualization alongside the callout value.

:::image type="content" source="media/power-bi-visualization-card-visual/walkthrough-add-top-level-image.png" alt-text="Screenshot of a card visual with a horizontal layout showing custom SVG images alongside callout values.":::

## Legacy single card and multi-card visuals

Before the November 2025 release, Power BI included two separate card visuals: the **single card** visual for displaying one measure and the **multi-card** visual for displaying multiple measures. These legacy visuals remain available for backward compatibility. Existing reports using these visuals continue to render without changes.

The new **card visual** replaces both legacy visuals and is recommended for new reports. When you select the Card icon in the Visualizations pane, it creates the new card visual introduced in the November 2025 general availability release.

To access the legacy single card and multi-card visuals:

1. In the **Visualizations** pane, select the three dots (**...**).
1. Select **Restore default visuals**.

The legacy visuals appear in the unpinned area of the Visualizations pane, where custom visuals typically appear. Users who need to maintain legacy behavior should continue using existing legacy card visuals in their reports.

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
For more information, see [Power BI report themes](../create-reports/desktop-report-themes.md).


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
For more information, see [Power BI report themes](../create-reports/desktop-report-themes.md).

#### Why can’t I see my image settings in the format pane?

During preview, the callout image was added using the **Image** section of the format pane and showed in the callout area next to the text. After November 2025, those images previously added were kept in the callout area, and their settings moved to **Callout** > **Image** section in the format pane. Setting the **Image** section of the format pane now adds a new image to the card with its own area. 

#### Why is my image now zoomed in?

During preview, the default settings for size of the image had some bugs corrected by the November 2025 update. Depending on your initial settings, the image can look “zoomed in” or different from before.

To fix the image, in the format pane, adjust the **Callout** > **Image** settings for **image fit** to be **fit** or **center**, and check the **size** and **image area size** controls in the same formatting section. Note this setting is in a new location, and the top-level **Image** section is now for the card image.

#### Why is my category header image gone?

Go to **Category header** settings and turn back on **add image**. Your image should still be there.

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

## Related content

- [Visualizations overview in Power BI](power-bi-visualizations-overview.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
