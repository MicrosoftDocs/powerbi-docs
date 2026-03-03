---
title: Create Visual Tooltips in Power BI
description: Learn how to create and customize visual tooltips in Power BI reports. Configure tooltip content, styling, drill actions, and report page tooltips to enhance data insights.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ZoeDouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/03/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
---

# Create visual tooltips in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Tooltips display contextual information when users hover over data points in visuals. They help users understand data without clicking or navigating away from the report.

When you hover over a visual, the tooltip shows field values and any other fields you add. If the visual supports drill actions, users can explore hierarchies and related pages directly from the tooltip. This article shows how to configure tooltip content, styling, and behavior. The tooltip displays:

- The **field name and value** for each field used in the visual.  
- **Additional fields** that you add in the **Tooltip** field well. To learn how to add fields and customize tooltip content, see [Customize tooltips in Power BI](desktop-custom-tooltips.md).  
- Optional **actions**, such as:  
  - **Drill down** into the next level of a hierarchy  
  - **Drill through** to a related report page  
    These actions appear automatically when a visual supports them.  

Tooltips provide fast insight while keeping the user inside the flow of the report.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-example.png" alt-text="Screenshot of Tooltip displaying Field Name and Value, Additional fields, and Drill down/through.":::

## Configure tooltip settings

Find tooltip settings in the **Format visual** pane under **General** > **Tooltips**. Select a visual on the report canvas, and then select the **Format visual** icon from the **Visualizations** pane to access these settings.

Available settings include:

- **Tooltip visibility:** Toggle tooltips On or Off for that visual.
- **Tooltip type:** Choose between a **Default** tooltip or a **Report page** tooltip.
- **Styling options:** Tooltips inherit colors from the report theme. **Text** settings let you refine **Font**, **Label color**, **Value color**, and **Drill text and icon color**. **Background** settings control **Color** and **Transparency**.
- **Actions footer:** Some visuals support drill actions (Drill down, Drill through) directly in the tooltip footer. Drill actions appear only on visuals that support drill behavior.

## Use drill actions from the actions footer

Tooltips support interactive exploration through the **Actions** footer to expose **Drill down** and **Drill through**.

When you enable the **Actions** footer in a supported visual, users can:

- Select **Drill down** to go to the next hierarchy level  
- Select **Drill through** to open a dedicated report page filtered to that data point
- Select **Drill up** to go to the previous hierarchy level, whenever displayed  

By using actions from the tooltip, users don't need to use right-click menus or header icons. This approach makes the report feel more intuitive and discoverable.

## Style tooltips by using themes

Tooltip styling automatically aligns with the report theme, making the experience consistent and accessible.

Theme elements control:

- **Background color** (mapped to Background elements)
- **Text and icon color** (mapped to First-level elements)
- **Separator and hover color** (mapped to Secondary background elements)

To adjust tooltip styling across a report:

1. In Power BI Desktop, open the **View** tab.
1. Select **Customize current theme** > **Visuals**.
1. Select the **Tooltip** section to adjust **Label text color**, **Value text color**, **Drill text and icon color**, and **Background color**.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-customize-report-theme.png" alt-text="Screenshot of Tooltip styling options, in the Customize current theme dialog.":::

You can also fine-tune styling for each visual in the **Visualizations** pane, on the **Visual** tab, in the **Format visual** section.

### Create a custom report tooltip page

Use a **report page tooltip** when you need richer context—like key performance indicators (KPIs), comparisons, or supporting visuals—that doesn't fit in a default hover card. Create a dedicated report page, enable **Allow use as tooltip** in the page's **Page information** settings, then assign it to a visual by setting **Tooltip** > **Type** to **Report page**.

For detailed steps, see [Create tooltips based on report pages](desktop-tooltips.md).

## Add Help tooltips to visuals

Help tooltips add quick guidance directly on a visual through a small **Help tooltip** icon in the visual header. When enabled, users can select the icon to view either short text or a full report page with richer content.

To enable Help tooltips:

1. Select a visual, then go to **Format visual** > **General** > **Header icons**.
1. Expand **Icons** and turn on **Help tooltip**.
1. Choose your content type:
   - **Typed text help** for short explanations
   - **Report page help** for richer content with visuals and KPIs (see [Create tooltips based on report pages](desktop-tooltips.md) for steps)

> [!NOTE]
> The **Help tooltip** icon only appears when **Header icons** are enabled and the **Visual header** is visible.

> [!TIP]
> You can add an animated GIF as the background of a report page Help tooltip to demonstrate interactions like drilling.

## Troubleshoot tooltip problems

- **Tooltip doesn't appear**: The visual might not support standard tooltips or the Tooltip toggle might be off. For visual-specific differences and exceptions, see [Considerations and limitations](#considerations-and-limitations). The following visuals support the full tooltip experience, including a Tooltip field well in the Build pane:
  - Bar and column charts
  - Line and area charts
  - Treemaps
  - Scatter and bubble charts
  - Pie and donut charts
  - Ribbon, funnel, and waterfall charts
- **Report page tooltip doesn't appear**: Confirm Tooltip is enabled in Page information and the visual's Tooltip Type is set to Report page.
- **Actions footer is missing**: Only visuals with drillable hierarchies or drill-through mapping show the Actions footer.
- **Can't add fields to the Tooltip well**: Tables, matrices, and certain visuals don't expose a Tooltip field in the Build pane.
- **Tooltip text is too small**: Too many fields force font auto shrinking. Reduce field count for better readability.
- **Help tooltip icon is missing**: Make sure **Help tooltip** is toggled on and the visual header is visible.
- **Help tooltip shows the wrong content**: Confirm the selected type (Text or Report page) and, for report pages, check the **Allow use as tooltip** setting to make sure it's enabled.
- **Help tooltip is hard to read**: Shorten the message or adjust theme colors for better contrast.

## Considerations and limitations

For limitations specific to report page tooltips, see [Considerations and limitations](desktop-tooltips.md#considerations-and-limitations) in the report page tooltips article.

### Tooltip capabilities by visual type

- **Key influencers:** Displays its own explanation panels instead of standard tooltips. Tooltip settings don't appear.
- **Tables and matrices:** Show cell value only on hover. Tooltip formatting options are available in the Format pane, but tables and matrices don't expose a Tooltip field well in the Build pane.
- **Decomposition trees:** Show standard tooltips but don't support the Actions footer.
- **Custom visuals from AppSource:** Show standard tooltips where supported but don't support the Actions footer.
- **Report page tooltips:** Don't support the Actions footer.

### Default tooltip differences

- **Line charts:** Show series marker, name, and value for up to 15 series. The X-axis value appears bold at the top.
- **Other visuals:** List each field name and value. No limit on fields, but many fields cause font shrinking.

### Tooltip behavior changes

- **New reports:** Use updated theme-based styling. Actions footer turns on automatically for supported visuals.
- **Existing reports:** Keep original tooltip appearance. Actions footer stays off if it wasn't enabled before.
- **Upgrade prompt:** When opening older reports, Power BI might prompt you to upgrade to modern defaults or keep existing tooltips.

### Help tooltip limits

- Help icon visibility depends on visual header settings.
- Typed text help doesn't respond to slicers or filters.
- Report page help can respond to filters you design into the page.
- Theme colors apply to the help tooltip frame.

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Customize tooltips in Power BI](desktop-custom-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
- [Custom visuals (AppSource)](../developer/visuals/develop-power-bi-visuals.md)
- [Decomposition trees](../visuals/power-bi-visualization-decomposition-tree.md)
