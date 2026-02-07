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

When a user hovers over a bar, column, segment, or data point, Power BI displays a visual tooltip that includes the underlying field values and helpful context to make the data easier to understand. In supporting visuals, the tooltip also provides actions that let the user explore the visual further, without interrupting their flow.

This article introduces visual tooltips and shows you how to adjust their content and design so they match your report’s visual style and user experience. With these steps, you can create reports that feel clear, consistent, and easy for users to explore.

## Using tooltips in Power BI

### How Power BI displays tooltips

When a user hovers over a visual data point, the tooltip displays:

- The **field name and value** for each field used in the visual.
- **Additional fields** specifically placed in the **Tooltip** well.
- Optional **actions**, such as:

  - **Drill down** into the next level of a hierarchy
  - **Drill through** to a related report page
    These actions appear automatically when a visual supports them.  

Tooltips provide fast insight while keeping the user inside the flow of the report.

[image: Tooltip displayed  “Tooltip displaying Field Name/ Value, Additional fields, and Drill down/through.”]

### Adjust tooltip behavior

Most Power BI visuals support tooltips by default, but the available options vary slightly depending on the visual type. You can adjust how a tooltip behaves from the Format pane when a supported visual is selected.

#### Find tooltip settings

1. Select a visual on the report canvas.
2. From the Visualizations pane, select the Format visual icon.
3. Under the General tab, expand the Tooltip card to access the settings for that visual.```

These settings control when tooltips appear, which tooltip type is used, and how each tooltip is styled.

[image: Tooltip settings (format pane) “Tooltip settings for selected visual in Visualizations pane > Format visual > General tab.”]

### Tooltip settings and options

After selecting a supported visual and expanding the Tooltip control in the Format pane, you can configure:

- **Tooltip visibility:** Toggle tooltips On or Off for that visual.
- **Tooltip type:** Choose between a **Default** tooltip or a **Report page** tooltip.
- **Styling options:** Tooltips inherit their colors from the report theme. Format options let you refine **Font**, **Label** and **Value** color, **Drill text and icon** color, and **Background** color and transparency.
- **Actions footer:** Some visuals support drill actions (Drill down, Drill through) directly in the tooltip footer. These actions appear only on visuals that support drill behavior.

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
2. In the Fields pane, drag one or more fields into the Tooltip well.
3. Hover a data point to confirm those fields appear in the tooltip.

[image: Tooltip Field Well + resulting Tooltip “Adding fields to the Tooltip well in the Fields pane.”]

### Use drill actions from the actions footer

Tooltips support interactive exploration through the Actions footer to expose Drill down and Drill through.

When the Actions footer is enabled in a supported visual, users can:

- Select Drill down to navigate to the next hierarchy level
- Select Drill through to open a dedicated report page filtered to that data point

Using actions from the tooltip avoids the need for right-click menus or header icons, making the report feel more intuitive and discoverable.

[image: Tooltip + Actions footer. “Tooltip showing Drill down and Drill through actions in the Actions footer.”]

### Style tooltips using themes

Tooltip styling automatically aligns with the report theme, making the experience consistent and accessible.

Theme elements control:

- **Background color** (mapped to Background elements)
- **Text and icon color** (mapped to First level elements)
- **Separator and hover color** (mapped to Secondary background elements)

To adjust tooltip styling across a report:

1. In Power BI Desktop, open the **View** tab.
2. Select **Customize theme** > **Visuals**.
3. Open the **Tooltip** section to adjust Label text color, Value text color, Drill text and icon color, and Background color.

[image: Theme customization. “Tooltip styling options in the Customize current theme dialog.”]

You can also fine-tune styling by changing these values for each visual in the **Format** pane.

### Create a custom report tooltip page

A **report page tooltip** gives authors complete layout control and is useful when you want a highly personalized or visual heavy tooltip.

  To create a custom report page tooltip:

  1. Add a new page to the report.
  2. Open the page’s **Format** pane and, under **Page information**, enable **Allow use as tooltip**. Remember to give the page a clear **Name** so users can quickly recognize it and understand its purpose when choosing it in the Tooltip settings.

[image: Enabling Report Page Tooltip. “Enabling Tooltip in Page information for a report page tooltip.”]

  3. Design the page using visuals, cards, KPIs, or layouts that best fit your scenario.
  4. Return to your main report page, select a visual, and under **Tooltip** > **Type**, choose **Report page**.
  5. Select your custom page from the list.

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

Default tooltips are lightweight and work well for simple visuals or dashboards where users need quick facts without losing their place in the report.

Report page tooltips are helpful when users need more explanation. They can include extra calculations, comparisons, KPIs, or visuals that don’t fit inside a small hover card.

Choosing the right type improves performance and clarity.

Use **default tooltips** when:

- Users only need one or two values.
- The visual is small and meant for quick scanning.
- Hover interactions should remain fast and low friction.
- Users need a bit more detail on a single data point without loading another page or interrupting their flow.

Use **report page tooltips** when:

- You want to highlight supporting visuals or KPIs.
- Additional context improves interpretation but doesn’t belong on the main report page.
- You’re guiding users deeper into an analytical workflow.

### Add Help tooltips to visuals

Help tooltips let you add quick guidance directly on a visual. A small Help icon appears in the visual header. When a user selects the icon, a tooltip opens with either short text or a full report page.

Use help tooltips to explain what the visual shows or define key terms. They also point users to the next step without adding extra labels to the canvas.

[image: Help icon in visual header “Help icon shown in the visual header next to other header icons.”]

#### Turn on Help tooltips

1. Select the visual on the report canvas.
2. In the Visualizations pane, select Format visual.
3. On the General tab, expand Help tooltip.
4. Turn Help tooltip On.
5. Make sure the visual header is visible so users can see the Help icon.

[image: Help tooltip settings (Format pane) “Help tooltip card under Visualizations > Format visual > General tab.”]

When Help tooltips are turned on, a small icon appears in the visual header. Users can hover or select the icon to read the help content.

[!Note]
Help tooltips and the help icon only appear when the visual header is shown.

#### Choose the type of help content

Help tooltips support two content types. Pick the one that fits your scenario.

##### Typed text help

Use this text option for short explanations or simple instructions.

1. In the **Help tooltip** card, choose **Text**.
2. Enter a short message you wanat users to see. Keep it clear and action oriented.
3. Preview the tooltip by hovering over the help icon in the visual header.

Typed text isn’t data‑driven. It gives you a simple space to describe the visual, clarify what readers are looking at, and suggest what they might do next.

[image: Typed text help tooltip “Help tooltip card with Text selected and a short message entered.”]

##### Report page help

Use this option when you need more space or want to include visuals, KPIs, or structured examples.

1. Create a new page in the report.
2. In the page’s **Format** pane, turn on **Allow use as tooltip** under **Page information**.
3. Design the page with the content you want users to see.
4. Return to the visual. In Help tooltip, choose Report page and select your help page.

[image: Report page help tooltip “Help tooltip card with Report page selected and a help page chosen from the list.”]
[image: Help tooltip page settings “Page information with Allow use as tooltip turned on and a clear page name entered.”]

Report page help tooltips behave the same as regular report page tooltips. The only difference is that they open from the Help icon, not a data point.

#### When to use Help tooltips

Use Help tooltips when you want to:

- Explain how to read a visual
- Provide definitions, metric explanations, or instructions
- Offer troubleshooting hints for advanced visuals
- Provide guidance without adding visible text to the canvas
- Give users a way to learn about a visual without leaving the page

Help tooltips work especially well for new readers, complex report layouts, or scenarios where in‑context help reduces confusion.

##### TIP: Use an animated GIF in a report page help tooltip

- You can add a small animated GIF to a report page help tooltip to show users how an interaction works, such as drilling down or drilling up. When the help tooltip is set to a report page, the GIF starts playing when the tooltip opens. It continues to animate while the user hovers over the tooltip. This animation creates a simple visual cue without adding instructions on the report canvas.

###### Add an animated GIF to a help tooltip

1. Create a new report page.
2. Open the page’s **Format** pane and turn on **Allow use as tooltip** under **Page information**.
3. In the Wallpaper or Canvas background settings, upload the GIF as the background image.
4. Adjust the fit and transparency so the animation is visible but not distracting.
5. Return to the visual, open the Help tooltip settings, choose **Report page**, and select your help page.
When users open the Help tooltip from the Help icon in the visual header, the GIF animates inside the tooltip. This works well for showing actions like drill up or drill down without adding written instructions to the report.

### Tooltip testing and validation checklist

Before publishing a report or instructional article, verify:

- Tooltips appear for every expected visual element.
- Added fields appear cleanly and in the expected order.
- Drill actions show only where the visual supports them.
- Tooltip text remains readable on both light/dark themes.
- Tooltip placement does not obscure important parts of the visual.
- Report page tooltips scale well on various screen sizes.
- No tooltip shows inconsistent terminology or mismatched formatting.
- Keep text short for Help tooltips, one or two brief sentences.
- Write Help tooltips in plain language using the same terms as the visual.
- Use report page Help when a definition needs an example or a small walkthrough.
- Check contrast and readability in both light and dark themes.

## FAQ: Troubleshooting tooltip issues

**Why doesn’t my tooltip appear?**

  *The visual may not support standard tooltips or the Tooltip toggle might be off.*

**Why is the Actions footer missing?**

  *Only visuals with drillable hierarchies or drill-through mapping show the Actions footer.*

**Why can’t I add fields to the Tooltip well?**

  *Tables, matrices, and certain visuals don’t expose a Tooltip field in the Build pane.*

**Why is my tooltip text tiny?**

  *Too many fields force font auto shrinking; reduce field count.*

**Why doesn’t my report page tooltip show?**

  *Confirm Tooltip is enabled in Page information and the visual’s Tooltip Type is set to Report page.*

**Why is my Help tooltip icon missing?**

  *Make sure the Help tooltip is toggled on and the visual header is visible.*

**Why does my Help tooltip show the wrong content?**

  *Confirm the selected type (Text or Report page) and, for report pages, check that Allow use as tooltip is on.*

**Why is my Help tooltip difficult to read?**

  *Shorten the message or adjust theme colors for better contrast.*

## Considerations and limitations

### Tooltip capabilities

Some visuals handle tooltips differently:

- The **Key influencers** visual doesn’t use the standard tooltip system. Instead, it displays its own explanation panels, so tooltip settings don’t appear.

- With **Tables and matrices**, tooltips appear when hovering a cell, and tooltip formatting options are available in the *Format* pane. However, tables and matrices do not expose a *Tooltip field* in the *Build* pane. Tooltip content reflects the cell’s value, not additional data fields.

The Tooltip **Actions footer** is not available for:

- **Report page tooltips**
- **Custom visuals from AppSource**
- **Decomposition trees**

  These visuals still show standard tooltips where supported, but they won’t surface drill actions from the footer.

### Tooltip differences across visual types

Power BI uses two types of default tooltips, and the experience varies depending on the visual:

- **Tooltip behavior for line charts**

  Line charts use a dedicated tooltip style that is different from all other visuals:
  - The tooltip shows the series marker, series name, and value for each visible series.
  - The axis value (typically the X axis value) appears at the top of the tooltip in bold.
  - Only a limited number of series lines can be displayed at once.
    Power BI currently shows up to 15 series in a single line chart tooltip; any additional series are hidden.

- **Tooltip behavior for other supported visuals**

  All other visuals that support tooltips use a more flexible default tooltip format:
  - The tooltip lists each field name and its value.
  - Users can add many fields to the Tooltip well, and there is effectively no limit to how much content can be displayed.
  - When many fields are shown, the tooltip auto-shrinks the font size to fit the content.This can make tooltips harder to read when large numbers of fields are included.

### Changes to tooltip behavior

Power BI uses an updated tooltip experience for supported visuals. The newer design improves readability and gives users consistent access to actions within the tooltip. Authors can keep the existing experience or switch to the newer style when updating a report.

- **New reports automatically use the updated tooltip styling.**

    Theme colors apply to the tooltip background, text, and separators, and the Actions footer is turned on for visuals that support drill actions.

- **Existing reports continue to display tooltips the same way they were originally built.**
  
    If Actions footer wasn’t enabled before, it remains off to preserve current behavior.

- **When opening an older report, Power BI may display a prompt offering to update tooltips to the new defaults.**

  - Selecting Upgrade to modern defaults applies updated styling and turns on the Actions footer for all eligible visuals.
  - Selecting Keep existing tooltips preserves the original appearance and behavior.

### Help tooltip behavior and limits

- The Help icon respects visual header visibility and layout.
- Typed text help is not data bound and does not respond to slicers or filters.
- Report page help behaves like other tooltip pages and can respond to filters you design into the page.
- Theme colors apply to the help tooltip frame for a consistent look.

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
- [Custom visuals (AppSource Visuals)](../developer/visuals/develop-power-bi-visuals.md)
- [Decomposition trees](../visuals/power-bi-visualization-decomposition-tree.md)
