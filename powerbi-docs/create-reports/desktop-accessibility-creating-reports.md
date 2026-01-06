---
title: Design Power BI Reports for Accessibility
description: Learn how to design and create accessible reports in Power BI Desktop and the Power BI service, including keyboard navigation, screen reader compatibility, alt text, and high contrast themes.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
LocalizationGroup: Create reports
ai-usage: ai-assisted
---
# Design Power BI reports for accessibility

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You can design and create compelling reports while also designing for accessibility. Whenever building a report, no matter who your audience is, create your reports to be usable by as many people as possible, without the need for the report to be adapted for a special design.

> [!TIP]
> **Accessibility in Power BI** means designing reports that people with disabilities can use effectively, including support for keyboard navigation, screen readers, high contrast themes, and alternative text descriptions for visuals.

For Windows users, select high contrast from the **Settings** app.

This article describes the accessibility features and tools for creating accessible reports in Power BI.

In general, when using Power BI with a screen reader, turn off scan mode or browse mode.

To improve the process of creating reports with screen readers, a context menu is available. The menu allows fields in the well to be moved up or down in the **Fields** list. The menu also allows moving the field to other wells, such as **Legend** or **Value** or others.

:::image type="content" source="media/desktop-accessibility/accessibility-09.png" alt-text="Screenshot of the Visualizations and Fields panes, highlighting the options to move fields.":::

## Types of accessibility features

Power BI provides the capability to create accessible reports, but as the report author, it's up to you to incorporate that capability into your reports. Three categories of accessibility features are described in this article:

- Built-in accessibility features (no configuration required)
- Built-in accessibility features (requiring configuration)
- Other tips and considerations

The following sections describe each of these categories.

## Built-in accessibility features

Power BI has accessibility features built into the product, which don't require any configuration from the report author. These features include the following features:

- Keyboard navigation
- Screen-reader compatibility
- High contrast colors view
- Focus mode
- Show data table

Features that help with the report consumption experience are described in the [Related content](#related-content) section at the end of this article.

Let's take a look at each of these built-in accessibility features.

### Keyboard navigation

As a report author, you don't need to worry about whether your consumers can use their keyboard to navigate through a report. All Power BI visuals support keyboard navigation. Your report consumer can walk through the data points in visuals, switch between page tabs, and access interactive capabilities including cross-highlighting, filtering, and slicing.

As a report consumer navigates around a report, focus shows up to indicate where the user is in the report. Depending on the browser being used, focus mode might appear differently.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-01.png" alt-text="Screenshot of a visual in focus for accessibility navigation.":::

To access the most frequently used keyboard shortcuts, press **Shift + ?** to display a keyboard shortcut dialog. For more information, see the articles on accessible consumption experiences and keyboard shortcuts in the [Related content](#related-content) section at the end of this article.

### Screen reader compatibility

In general, every object in Power BI that supports keyboard navigation is also compatible with screen readers. When a report consumer navigates to a visual, the screen reader reads out the title, visual type, and any alt text if you set it.

### High contrast color view

Power BI supports high contrast for reports. If you use a high contrast mode in Windows, Power BI Desktop automatically detects which high contrast theme you're using and applies those settings to your reports. Those high contrast colors follow the report when you publish it to the Power BI service or elsewhere.

:::image type="content" source="media/desktop-accessibility/accessibility-05b.png" alt-text="Screenshot showing a report in high contrast Windows settings.":::

The Power BI service also attempts to detect the high contrast settings you select for Windows, but the effectiveness and accuracy of that detection depends on the browser you're using for the Power BI service. If you want to set the theme manually in the Power BI service, select **View** > **High contrast colors** while in Edit mode and then select the theme you want to apply to the report.

### Focus mode

If a report consumer is looking at a visual in a dashboard, they can expand the visual to fill up more of their screen by selecting the **Focus mode** icon in the context menu of the visual.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-03.png" alt-text="Screenshot of a visual set in Focus mode.":::

### Show data table

Report consumers can also view the data in a visual in a tabular format by pressing **Alt+Shift+F11**. This table is similar to pressing **Show Data** in the visual context menu, but it shows a table that is screen reader friendly.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-04.png" alt-text="Screenshot of a visual with a table that is screen reader friendly.":::

## Built-in accessibility features that require configuration

Power BI has accessibility features that are built into the product and require configuration from the report author. These features include:

- Alt text
- Tab order
- Titles and labels
- Markers
- Report themes

## Alt text

Add alt text (an alternative text description) to describe the appearance and function of visuals and images on the report page to screen reader users. Report authors should add alt text to every object that conveys meaningful information on a report. Providing alt text ensures that consumers of your report understand what you're trying to communicate with a visual, even if they can't see the visual, image, shape, or textbox. You can provide alt text for any object on a Power BI Desktop report by selecting the object (such as a visual, shape, and so on) and in the **Visualizations** pane, select the **Format** section, expand **General**, scroll to the bottom, and fill in the **Alt Text** textbox. The **Alt Text** textbox has a limit of 250 characters.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-05.png" alt-text="Screenshot of the Visualizations pane, highlighting the Alt text box.":::

Alt text should include information about the insight that you'd like the report consumer to take away from a visual. Because a screen reader reads out the title and type of a visual, you only need to fill in a description. An example of alt text for the following visual could be: *Net user satisfaction by color of product sold, further broken down by product class.*

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-06.png" alt-text="Screenshot of an example visual for the example alt text.":::

Keep in mind that calling out an insight or specific data points might not be the best thing to put in static alt text because data in Power BI is dynamic. If you'd like to use dynamic alt text, see the next section that describes conditional formatting for alt text.

> [!NOTE]
> When you export a report to PowerPoint, PowerPoint adds alt text for each item on the page. If you don't specify alt text for each item, the default alt text in PowerPoint is "No alt text provided."

### Conditional formatting for alt text

One feature that makes Power BI so compelling is that its data is dynamic. You can use DAX measures and conditional formatting to create dynamic alt text. Screen readers can then call out values specific to the data that a report consumer is viewing.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-07.png" alt-text="Screenshot of the Alt text pane, highlighting the conditional formatting icon.":::

### Tab order

Setting the tab order helps keyboard users navigate your report in an order that matches the way users visually process the report visuals. If you include decorative shapes and images in your report, remove those elements from the tab order.

To set the tab order, select the **View** tab in the ribbon. Under **Show panes**, select **Selection** to display the **Selection** pane.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-08.png" alt-text="Screenshot of the View tab in the ribbon, highlighting Selection.":::

In the **Selection** pane, selecting **Tab order** displays the current tab order for your report. You can select an object, then use the up and down arrow buttons to move the object in the hierarchy. You can also select an object with your mouse and drag it to the position you'd like in the list. Clicking on the number next to an object hides the object from the tab order.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-18.png" alt-text="Screenshot of Tab order in the Selection pane" lightbox="media/desktop-accessibility/accessibility-creating-reports-18.png":::

### Titles and labels

Visual and report page titles are important accessibility features that serve as a point of reference for the report consumer. Avoid using acronyms or jargon in your report titles. If you share the report with a new user or someone who is external to your organization, they might not know what your terms or acronyms mean. The following image shows a visual with an acronym in the title (on the left), and a clearer title for the visual on the right.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-10.png" alt-text="Screenshot of two sample titles, the vague CY Totals, and the clearer Current Year Sales Amount USD Totals.":::

Within a visual, make sure that any titles, axis labels, legend values, and data labels are easy to read and understand. Compare the following images, where the first image has few numbers or descriptions of the data, and the second has many.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-11.png" alt-text="Screenshot of two example images, where one is a simple bar graph and the other is a bar graph with numbers and details.":::

For data labels, you can choose to turn on or off the labels for each series in your visual or position them above or below a series. While Power BI does its best to place data labels above or below a line, sometimes it isn't clear. In the following visual, the data labels are jumbled and not easy to read.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-12.png" alt-text="Screenshot of a line chart with overlapping lines and numbers.":::

Positioning your data labels above or below your series can help, especially if you're using a line chart with multiple lines. With a few adjustments, the data labels now look much better.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-13.png" alt-text="Screenshot of a line chart with clearly separated lines and numbers.":::

### Markers

Avoid using color (including features conditional formatting) as the only way of conveying information. Instead, use markers to convey different series.

For Line, Area, and Combo visuals, as well as for Scatter and Bubble visuals, turn on markers and use a different Marker shape for each line.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-14.png" alt-text="Screenshot of an example visual with markers.":::

To turn on markers, select the Format section in the Visualizations pane, expand the **Shapes** section, then scroll down to find the **Show Markers** toggle and turn it to **On**, as shown in the following image.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-15.png" alt-text="Screenshot of the Visualizations pane with Markers turned on.":::

Use **Customize Series** to select the name of each line (or area, if using an Area chart) from the drop-down box in that Shapes section. Below the drop-down, you can then adjust many aspects of the marker used for the selected line, including its shape, color, and size.

While it's recommended to turn on data labels and markers for report authors, turning them all on for every visual might be distracting and make your report less accessible. In the following image, you can compare a visual that has data labels and markers both on, and then a more understandable version with data labels off.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-16.png" alt-text="Screenshot of two example visuals, one with labels and markers on, the other with only markers on.":::

If you're not sure whether your visual or report is too busy, test that by doing a [squint test](https://chromewebstore.google.com/detail/blurry-eye-test/panidpjdcjkdhjamnogampinhbkjdkpo?hl=en). If your eyes are drawn more to the data labels than the data points, turn off your data labels.

### Themes, contrast, and colorblind-friendly colors

Ensure your reports have enough contrast between text and any background colors. WCAG 2.1 success criterion 1.4.3 states that text and background color should have a contrast ratio of at least 4.5:1. Use tools such as [Color Contrast Analyzer](https://developer.paciellogroup.com/resources/contrastanalyser/), [WebAIM](https://webaim.org/resources/contrastchecker/), and [Accessible Colors](https://accessible-colors.com/) to check your report colors.

Consider that some report viewers might have difficulty with color. Tools like [Coblis](https://www.color-blindness.com/coblis-color-blindness-simulator/) and [Vischeck](https://www.vischeck.com/vischeck/vischeckImage.php) simulate what report viewers with different visual abilities see. Using fewer colors or a monochrome palette in your report can help make your reports more accessible.

Certain color combinations can be difficult for users to distinguish. These combinations include the following:

- green and red
- green and brown
- blue and purple
- green and blue
- light green and yellow
- blue and grey
- green and grey
- green and black

Avoid using these colors together in a chart or on the same report page.
Power BI has some built-in themes to help make your report more accessible, but check your report with some of the other tools suggested in this article.

:::image type="content" source="media/desktop-accessibility/accessibility-creating-reports-17.png" alt-text="Screenshot showing the Power BI built-in themes.":::

## Tips and considerations

This section provides some guidance, tips, and considerations to keep in mind when creating reports with accessibility in mind.

### Understand what your audience wants

Creating a report is an iterative process. Before you begin placing visuals on the page, talk to some of your report consumers to better understand what information they want to get from your report and how they want to see it.

Building in accessibility should be part of this process. You might find out that your vision isn't what your report consumers have in mind. Once you prepare an initial draft of your report, show it to a report consumer and gather more feedback. As a report author, gathering feedback can help prevent a future deluge of change requests from unhappy report consumers.

### Keep your report simple and consistent

Keep your report as simple as possible. People often try to put too much information into a single visual. Often breaking it into multiple visuals makes it simpler and easier to understand. Consider using multiple visuals if they show different facets of the data and use filters or visual interactions to create a rich experience. At the same time, keep the number of visuals on a page to a minimum. Try to avoid unnecessary redundancy and page clutter. You don't need two visuals to show the same thing. Report consumers might get overwhelmed from all the information being given from too many visuals, or they might have a limited attention span and get distracted. Not only does this make your report easier to consume, but also having too many visuals on a page can slow down the performance of your report.

Keep your report consistent by using the same font color and style for the visual elements across your report. Use the same font size for all visual titles, just as you should for data labels and axis titles. If you use slicers on multiple report pages, keep them in the same location on every page of your report.

### Test for low vision

A quick way to test what a report looks like for consumers with low vision is to turn down the brightness of your screen or mobile device. Some browser add-ons can help you perform a squint test.

## Report accessibility checklist

In addition to providing accessibility tools and functionality, Power BI provides the following checklist you can use when creating reports. This checklist helps ensure your reports are accessible and available to the largest audience before you publish it.

### All visuals

- Ensure color contrast between title, axis label, and data label text and the background are at least 4.5:1.
- Avoid using color as the only means of conveying information. Use text or icons to supplement or replace the color.
- Replace unnecessary jargon or acronyms.
- Ensure **alt text** is added to all non-decorative visuals on the page.
- Check that your report page works for users with color vision deficiency.

### Slicers

- If you have a collection of several slicers on your report pages, ensure your design is consistent across pages. Use the same font, colors, and spatial position as much as possible.

### Textbox

- Ensure color contrast between font and background is at least 4.5:1.
- Make sure to put text contents in the **alt text** box so screen readers can read them.

### Visual interactions

- Is key information only accessible through an interaction? If so, rearrange your visuals so they're pre-filtered to make the important conclusion more obvious.
- Are you using bookmarks for navigation? Try navigating your report with a keyboard to ensure the experience is acceptable for keyboard-only users.

### Sort order

- Have you purposefully set the sort order of each visual on the page? The accessible **Show Data** table shows the data in the sort order you set on the visual.

### Tooltips

- Don't use tooltips to convey important information. Users with motor problems and users who don't use a mouse have difficulties accessing them.
- Do add tooltips to charts as ancillary information. It's included in the accessible **Show Data** table for each visual.

### Video

- Avoid video that automatically starts when the page renders.
- Ensure your video has captions, or provide a transcript.

### Audio

- Avoid audio that automatically starts when the page renders.
- Provide a transcript for any audio.

### Shapes

- Make sure any decorative shapes are hidden in the tab order, so screen readers don't announce them.
- Avoid using too many decorative shapes to the point where they're distracting.
- When you use shapes to call out data points, use **alt text** to explain what you're calling out.

### Images

- When you use images to call out data points, use **alt text** to explain what you're calling out.
- Make sure any decorative images are hidden in the tab order, so screen readers don't announce them.
- Avoid using too many decorative images to the point where they're distracting.

### Power BI visuals

- Check the accessible **Show Data** table for Power BI visuals. If the information shown isn't enough, look for another visual.
- If you use the *Play Axis* custom visual, ensure it doesn't auto play. Make it obvious that the user must press the play/pause button to start or stop the changing values.

### Across visuals on the page

- Set tab order and turn off tab order (mark the item as hidden) on any decorative items.

## Considerations and limitations

The accessibility features have a few known problems and limitations. The following list describes those problems and limitations:

- When you use screen readers with **Power BI Desktop**, you get the best experience if you open your screen reader before opening any files in **Power BI Desktop**.

## Related content

The collection of articles for Power BI accessibility includes the following resources:

- [Overview of accessibility in Power BI](desktop-accessibility-overview.md)
- [Consume Power BI reports by using accessibility features](desktop-accessibility-consuming-tools.md)
- [Creating reports in Power BI by using accessibility tools](desktop-accessibility-creating-tools.md)
- [Keyboard shortcuts in Power BI Desktop](desktop-accessibility-keyboard-shortcuts.md)
- [Report accessibility checklist](#report-accessibility-checklist)
