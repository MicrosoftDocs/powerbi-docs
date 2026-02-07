---
title: Create Visual Tooltips
description: Learn how to build hover‑based visual tooltips in Power BI with drill actions and theme‑based styling.
author: BlairJSArmstrong
ms.author: v-blaira
ms.reviewer: zodouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/06/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
---

# Create visual tooltips

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

Visual tooltips in Power BI improve usability, accessibility, and interactivity. Visual tooltips allow users to understand a data point without clicking or navigating away from the visual.  

When someone hovers over elements in a visual, the key field values are displayed in a tooltip. The tooltip can also include additional information to make the visual easier to understand. And if the visual supports actions, the user can explore the visual further without losing their place.

This article introduces visual tooltips and shows how to change their content and layout. These changes help the tooltips match your report’s style and give users a consistent experience. With these steps, you can create reports that feel clear, consistent, and easy for users to explore.

## Using tooltips in Power BI

### How Power BI displays tooltips

When a user hovers over a visual data point, the tooltip displays:

- The **field name and value** for each field used in the visual.  
- **Additional fields** placed in the **Tooltip** well.  
- Optional **actions**, such as:  
  - **Drill down** into the next level of a hierarchy  
  - **Drill through** to a related report page  
    These actions appear automatically when a visual supports them.  

Tooltips provide fast insight while keeping the user inside the flow of the report.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-example.png" alt-text="Tooltip displaying Field Name/ Value, Additional fields, and Drill down/through.":::

### Adjust tooltip behavior

Most visuals show tooltips by default, but the options can change depending on the visual. You can change how the tooltip behaves in the Format pane after you've selected the visual.

#### Find tooltip settings

1. Select a visual on the report canvas.
2. From the Visualizations pane, select the Format visual icon.
3. Under the General tab, expand the Tooltip card to access the settings for that visual.

These settings control when tooltips appear, which tooltip type is used, and how each tooltip is styled.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-card.png" alt-text="Tooltips card settings in Visualizations pane > Format visual > General tab.":::

### Tooltip settings and options

After selecting a supported visual and expanding the Tooltip control in the Format pane, you can configure:

- **Tooltip visibility:** Toggle tooltips On or Off for that visual.
- **Tooltip type:** Choose between a **Default** tooltip or a **Report page** tooltip.
- **Styling options:** Tooltips inherit their colors from the report theme.  
  Format options let you refine **Font**, **Label color**, **Value color**, **Drill text and icon color**, plus **Background** settings for **Color** and **Transparency**.
- **Actions footer:** Some visuals support drill actions (Drill down, Drill through) directly in the tooltip footer.  
  These actions appear only on visuals that support drill behavior.

These settings apply per visual, giving report creators full control over how tooltips appear and behave across a report.

### Visuals that fully support tooltips

Many visuals support the full default tooltip experience. These visuals show a Tooltip section in the Format pane and allow you to add more fields by using the Tooltip field well in the Build pane. Visuals with full tooltip capabilities include:

- Bar and column charts
- Line and area charts
- Treemaps
- Scatter and bubble charts
- Pie and donut charts
- Ribbon, funnel, and waterfall charts

These visuals show a tooltip when the user hovers over a data point such as a bar, column, point, or segment.  
Keep in mind that tooltips can vary between visuals. For more information, see the [Considerations and Limitations](#considerations-and-limitations) section.

### Customize tooltip content

You can enrich a tooltip by adding fields that aren’t already used in the visual. This added context gives readers more context without adding clutter to the visual itself.

1. Select the visual.
2. In the Visualizations pane > Build visual, drag one or more fields into the Tooltip field well.
3. Hover a data point to confirm those fields appear in the tooltip.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-field-well.png" alt-text="Adding fields to the Tooltip field well in the Visualizations pane, under Build visual.":::

### Use drill actions from the actions footer

Tooltips support interactive exploration through the Actions footer to expose Drill down and Drill through.

When the Actions footer is enabled in a supported visual, users can:

- Select Drill down to navigate to the next hierarchy level  
- Select Drill through to open a dedicated report page filtered to that data point

  Using actions from the tooltip avoids the need for right-click menus or header icons, making the report feel more intuitive and discoverable.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-drill-down-through.png" alt-text="Tooltip showing Drill-down and Drill-through actions in the Actions footer.":::

### Style tooltips using themes

Tooltip styling automatically aligns with the report theme, making the experience consistent and accessible.

Theme elements control:

- **Background color** (mapped to Background elements)
- **Text and icon color** (mapped to First-level elements)
- **Separator and hover color** (mapped to Secondary background elements)

To adjust tooltip styling across a report:

1. In Power BI Desktop, open the **View** tab.
2. Select **Customize current theme** > **Visuals**.
3. Select the **Tooltip** section to adjust **Label text color**, **Value text color**, **Drill text and icon color**, and **Background color**.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-customize-report-theme.png" alt-text="Tooltip styling options in the Customize current theme dialog.":::

You can also fine-tune styling for each visual in the **Visualizations** pane, on the **Visual** tab, in the **Format visual** section.

### Create a custom report tooltip page

A **report page tooltip** gives authors complete layout control and is useful when you want a highly personalized or visual heavy tooltip.

  To create a custom report page tooltip:

  1. Add a new page to the report.
  2. From the **Visualizations** pane, select the **Format page** icon. Open the **Page information** section and enable the **Allow use as tooltip** toggle.

    Remember to give the page a clear **Name** so users can quickly recognize it and understand its purpose when choosing it in the Tooltip settings.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-enable-report-page-tooltip.png" alt-text="Enabling and naming report page tooltip in Visualizations > Format page > Page information.":::

  1. Design your custom page using visuals, cards, KPIs, or layouts that best fit your scenario.
  2. Return to your main report page, select a visual, and under **Tooltip** > **Type**, choose **Report page**.
  3. Select your custom page from the list.

Use report page tooltips when you want deeper contextual storytelling or richer data presentation beyond the default tooltip layout.

### Keep tooltips visually consistent

Since visual tooltips inherit theme colors and typography automatically, choosing a strong, modern report theme helps tooltips look crisp and up to date.

To create a strong user experience:

- Favor **simplified color palettes** that enhance readability
- Ensure **contrast accessibility** meets WCAG standards
- Align tooltip font sizes with overall report design
- Use visual treatments that reflect current Power BI visuals

  This approach helps counter customer perceptions that “tooltips haven’t changed” while highlighting the visual polish now available in Power BI.

### Choosing between default tooltips and report page tooltips

**Default tooltips** are lightweight and work well for simple visuals or dashboards where users need quick facts without losing their place in the report.

**Report page tooltips** are helpful when users need more explanation. They can include extra calculations, comparisons, KPIs, or visuals that don’t fit inside a small hover card.

Choosing the right type improves performance and clarity.

Use **default tooltips** when:  

- Users only need one or two values.
- The visual is small and meant for quick scanning.
- Hover interactions should remain fast and low friction.
- Users need a bit more detail on a single data point without loading another page or interrupting their flow.

Use **report page tooltips** when:  

- You want to highlight supporting visuals or KPIs.
- More context improves interpretation but doesn’t belong on the main report page.
- You’re guiding users deeper into an analytical workflow.

### Add Help tooltips to visuals

Help tooltips let you add quick guidance directly on a visual. A small Help icon appears in the visual header. When a user selects the icon, a tooltip opens with either short text or a full report page.

Use help tooltips to explain what the visual shows or define key terms. They also point users to the next step without adding extra labels to the canvas.

#### Turn on Help tooltip

1. Select the visual on the report canvas.
2. In the **Visualizations** pane, select **Format visual**.
3. On the **General** tab, make sure **Header icons** is enabled, then expand the card.
4. Under Header icons, expand the **Icons** dropdown and enable the **Help tooltip** toggle.
5. Now that the **Help tooltip** section is revealed, verify the **Help tooltip icon** appears in the **Visual header**.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltips-enable-help-tooltip.png" alt-text="Format visual pane, Header icons expanded, Help tooltip enabled, Help tooltip icon visible in the visual header.":::

   When Help tooltips are turned on, a small icon appears in the visual header. Users can hover or select the icon to view the help content.

  > [!Note]
  > The Help tooltip and the help icon only appears when **Header icons** are enabled and the **Visual header** is visible.

#### Choose the type of Help tooltip content

Help tooltips support two content types. Pick the one that fits your scenario.

- **Typed text help**

  Use this text option for short explanations or simple instructions.

  1. In the **Help tooltip** card, choose **Text**.
  2. Enter a short message you want users to see. Keep it clear and action oriented.
  3. Preview the tooltip by hovering over the Help icon in the Visual header.

  Typed text isn’t data‑driven. It gives you a simple space to describe the visual, clarify what readers are looking at, and suggest what they might do next.

- **Report page help**

  Use this option when you need more space or want to include visuals, KPIs, or structured examples.
  
  1. Create a new page in the report.
  2. From the **Visualizations** pane, select the **Format page** icon. Open the **Page information** section and enable the **Allow use as tooltip** toggle.
  3. Give the page a clear **Name** so users can quickly recognize it and understand its purpose when choosing it in the **Help tooltip** settings.
  4. Design the page with the content you want users to see.
  5. Return to the visual. In Help tooltip settings, choose **Report page** and select the help page you created.
  6. Preview the tooltip by hovering over the Help icon in the Visual header.

  Report page Help tooltips behave the same as regular report page tooltips. The only difference is that they open from the Help icon, not a data point.

  **TIP: Use an animated GIF in a Report page Help tooltip**  
  You can add a small animated GIF to a Report page Help tooltip to show users how an interaction works, such as drilling down or drilling up. When the Help tooltip is set to a Report page, the GIF starts playing when the tooltip opens. It continues to animate while the user hovers over the tooltip. This animation creates a simple visual cue without adding instructions on the report canvas.

   **Add an animated GIF to a Help tooltip**  
  
   1. Create a new report page.
   2. Open the page’s **Format** pane and turn on **Allow use as tooltip** under **Page information**.
   3. In the Wallpaper or Canvas background settings, upload the GIF as the background image.
   4. Adjust the fit and transparency so the animation is visible but not distracting.
   5. Return to the visual, open the Help tooltip settings, choose **Report page**, and select your help page.  

      When someone opens the Help tooltip, the GIF starts moving right away. It gives a quick, visual cue that shows actions like drill‑up without adding any extra text on the report.

#### When to use Help tooltips

  Use Help tooltips when you want to:

- Explain how to read a visual
- Provide definitions, metric explanations, or instructions
- Offer troubleshooting hints for advanced visuals
- Provide guidance without adding visible text to the canvas
- Give users a way to learn about a visual without leaving the page

  Help tooltips work especially well for new readers, complex report layouts, or scenarios where in‑context help reduces confusion.

### Tooltip testing and validation checklist

Before publishing a report or instructional article, verify:

- Tooltips appear for every expected visual element.
- Added fields appear cleanly and in the expected order.
- Drill actions show only where the visual supports them.
- Tooltip text remains readable on both light/dark themes.
- Tooltip placement doesn't obscure important parts of the visual.
- Report page tooltips scale well on various screen sizes.
- No tooltip shows inconsistent terminology or mismatched formatting.
- Help tooltips with text have one or two brief sentences.
- Help tooltips are written in plain language using the same terms as the visual.
- Report page help tooltips are used when a definition needs an example or a small walkthrough.
- Contrast and readability have been checked in both light and dark themes.

## FAQ: Troubleshooting tooltip issues

***Why doesn’t my tooltip appear?***  
: The visual might not support standard tooltips or the Tooltip toggle might be off.

***Why is the Actions footer missing?***  
: Only visuals with drillable hierarchies or drill-through mapping show the Actions footer.

***Why can’t I add fields to the Tooltip well?***  
: Tables, matrices, and certain visuals don’t expose a Tooltip field in the Build pane.

***Why is my tooltip text tiny?***  
: Too many fields force font auto shrinking; reduce field count.

***Why doesn’t my report page tooltip show?***  
: Confirm Tooltip is enabled in Page information and the visual’s Tooltip Type is set to Report page.

***Why is my Help tooltip icon missing?***  
: Make sure the Help tooltip is toggled on and the visual header is visible.

***Why does my Help tooltip show the wrong content?***  
: Confirm the selected type (Text or Report page) and, for report pages, check the **Allow use as tooltip** setting to make sure it's enabled.

***Why is my Help tooltip difficult to read?***  
: Shorten the message or adjust theme colors for better contrast.

## Considerations and limitations

### Tooltip capabilities

Some visuals handle tooltips differently:

- **Key influencers**  
  This visual doesn’t use the standard tooltip system. Instead, it displays its own explanation panels, so tooltip settings don’t appear.

- **Tables and matrices**  
  Tooltips appear when hovering a cell, and tooltip formatting options are available in the *Format* pane. However, tables and matrices don't expose a *Tooltip field* in the *Build* pane. Tooltip content reflects the cell’s value, not additional data fields.

The Tooltip **Actions footer** isn't available for:

- **Report page tooltips**  
- **Custom visuals from AppSource**  
- **Decomposition trees**  

  These visuals still show standard tooltips where supported, but they won’t surface drill actions from the footer.

### Tooltip differences across visual types

Power BI uses two types of default tooltips, and the experience varies depending on the visual:

- **Tooltip behavior for line charts**

  Line charts use a dedicated tooltip style that's different from all other visuals:
  - The tooltip shows the series marker, series name, and value for each visible series.
  - The axis value (typically the X-axis value) appears at the top of the tooltip in bold.
  - Only a limited number of series lines can be displayed at once.
    Power BI currently shows up to 15 series in a single line chart tooltip; any additional series are hidden.

- **Tooltip behavior for other supported visuals**

  All other visuals that support tooltips use a more flexible default tooltip format:
  - The tooltip lists each field name and its value.
  - Users can add many fields to the Tooltip well. There's effectively no limit to how much content can be displayed.
  - When a tooltip shows many fields, Power BI shrinks the font to make everything fit. Smaller text can make the tooltip harder to read.

### Changes to tooltip behavior

Power BI uses an updated tooltip experience for supported visuals. The newer design improves readability and gives users consistent access to actions within the tooltip. Authors can keep the existing experience or switch to the newer style when updating a report.

- **New reports use the updated tooltip style.**  

    Theme colors fill the tooltip background, text, and separators. The Actions footer turns on automatically for visuals that support drill actions.

- **Existing reports continue to display tooltips the same way they were originally built.**  

    If Actions footer wasn’t enabled before, it remains off to preserve current behavior.

- **When opening an older report, Power BI may display a prompt offering to update tooltips to the new defaults.**  
  - Selecting Upgrade to modern defaults applies updated styling and turns on the Actions footer for all eligible visuals.
  - Selecting Keep existing tooltips preserves the original appearance and behavior.

### Help tooltip behavior and limits

- The Help icon respects visual header visibility and layout.
- Typed text help isn't data bound and doesn't respond to slicers or filters.
- Report page help behaves like other tooltip pages and can respond to filters you design into the page.
- Theme colors apply to the help tooltip frame for a consistent look.

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
- [Custom visuals (AppSource Visuals)](../developer/visuals/develop-power-bi-visuals.md)
- [Decomposition trees](../visuals/power-bi-visualization-decomposition-tree.md)
