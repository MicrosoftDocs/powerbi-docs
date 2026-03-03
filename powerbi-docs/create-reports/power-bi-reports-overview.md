---
title: Overview of Power BI reports
description: Learn about Power BI reports and the key features for creating interactive, data-driven reports in Power BI Desktop and the Power BI service.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: overview
ms.date: 02/01/2026
LocalizationGroup: Reports
---

# Power BI reports overview

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI reports are interactive, multi-page documents that present insights from your data through visualizations, text, and images. Reports connect to [semantic models](../connect-data/service-datasets-understand.md) that contain your data, and provide a canvas where you can arrange visuals, add interactivity, and tell a compelling data story.

You can create reports in Power BI Desktop for full authoring capabilities, or in the Power BI service for quick reports and basic editing. Reports support cross-filtering between visuals, drill-through navigation, bookmarks for saved views, and many other interactive features that help users explore data on their own.

Once created, reports can be published to the Power BI service in your own workspace or in a workspace shared with others. You can share reports with colleagues who can view and interact with them through Power BI apps. Reports can also be embedded publicly, embedded securely for specific users, or integrated into your own secure website or portal.

This article provides an overview of Power BI report capabilities to help you get started creating effective reports.

## Get started

You can create Power BI reports using Power BI Desktop for full authoring capabilities, or in the Power BI service for quick reports and basic editing.

### Create reports in Power BI Desktop

Power BI Desktop provides a comprehensive environment for creating reports with full access to data connectivity, modeling, and visualization features.

#### Power BI Desktop Home

The Home screen in Power BI Desktop provides quick access to recent files, learning resources, and common actions. From Home, you can start a new report, open existing files, or connect to data sources.

For more information, see [Use Power BI Desktop Home](desktop-home.md).

#### The Power BI ribbon

The ribbon in Power BI Desktop organizes commands into tabs for easy access. The **Home** tab includes the most common actions, while other tabs provide specialized tools for data modeling, formatting, and more.

For more information, see [Use the updated ribbon in Power BI Desktop](desktop-ribbon.md).

#### Report view

Report view is where you design and build your reports. You can add visuals from the Visualizations pane, drag fields from the Data pane, and use the Format pane to customize appearance.

For more information, see [Work with Report view in Power BI Desktop](desktop-report-view.md).

#### On-object interaction (preview)

On-object interaction lets you build and format visuals directly on the canvas. Select a visual to access formatting options, add fields, and make changes without switching between panes.

For more information, see [On-object interaction in Power BI Desktop](power-bi-on-object-interaction.md).

### Create reports in the Power BI service

The Power BI service provides options for creating reports directly in your browser without installing Power BI Desktop. While many report creation features are available in the web, some features are only available in Power BI Desktop. You can start creating a report in the web, then download the .pbix file and continue editing in Power BI Desktop.

#### Create page

The Create page in the Power BI service is your starting point for building new content. From the Create page, you can use Get Data to connect to any supported data connector, or connect to the OneLake catalog to access Fabric data sources and create a semantic model and report directly in your browser.

For more information, see [Tour the report editor in the Power BI service](service-the-report-editor-take-a-tour.md).

#### Quick reports

The Power BI service can automatically generate reports when you upload data or connect to a semantic model. These quick reports analyze your data and create appropriate visualizations, giving you a starting point that you can customize.

For more information, see [Create quick reports in the Power BI service](service-quick-create-report.md).

### Create reports with Copilot

Copilot in Power BI can help you create reports by generating visuals and report pages based on your data. Describe what you want to see, and Copilot suggests visualizations and layouts that match your request. Copilot works in both Power BI Desktop and the Power BI service.

For more information, see [Create reports in Power BI with Copilot](copilot-create-reports.md).

## Visuals

Visualizations are the building blocks of Power BI reports. They transform your data into charts, tables, maps, and other visual formats that reveal patterns and insights.

### Visualizations overview

Power BI offers many built-in visual types, each designed for specific scenarios. Choose from bar charts, line charts, scatter plots, maps, tables, matrices, cards, and more.

For more information, see [Visualizations overview in Power BI](../visuals/power-bi-visualizations-overview.md).

### Add visuals to reports

Add visuals by selecting a visual type from the Visualizations pane, then dragging fields to the visual's field wells. You can also use the on-object interaction experience to build visuals directly on the canvas.

For more information, see [Add visuals to a Power BI report](../visuals/power-bi-report-add-visualizations.md).

### Customize visuals

Use the Format pane to customize colors, fonts, labels, titles, and other visual properties.

For more information, see [Get started formatting visuals](../visuals/service-getting-started-with-color-formatting-and-axis-properties.md).

### Visual interactions

Control how visuals interact with each other when users select data points. By default, selecting a data point in one visual cross-filters and cross-highlights other visuals on the page. You can customize these interactions to filter, highlight, or have no effect on specific visuals.

For more information, see [Change how visuals interact in a Power BI report](service-reports-visual-interactions.md).

### Personalize visuals

Enable the personalize visual feature to let report viewers make temporary changes to visuals to suit their needs. Viewers can change the visual type, swap out fields, or adjust formatting without affecting the original report. This opens up self-service options for report viewers to explore data in the way that works best for them.

For more information, see [Let users personalize visuals in a report](power-bi-personalize-visuals.md).

## Report layout and design

Good report design helps users find and understand information quickly.

### Visual elements

Add visual elements like backgrounds, wallpapers, and borders to create a polished report appearance. These elements help establish visual hierarchy and guide the reader's eye.

For more information, see [Add visual elements to Power BI reports](desktop-visual-elements-for-reports.md).

### Gridlines and snap-to-grid

Use gridlines and snap-to-grid to align visuals precisely on the report canvas. Consistent alignment creates a professional, organized appearance.

For more information, see [Use gridlines and snap-to-grid in Power BI Desktop reports](desktop-gridlines-snap-to-grid.md).

### Page display settings

Configure page size, orientation, and view settings to optimize your report for different display scenarios. You can create reports sized for standard screens, mobile devices, or custom dimensions.

For more information, see [Change page display settings in a Power BI report](power-bi-report-display-settings.md).

### Group visuals

Group related visuals together to move, resize, and layer them as a single unit. Grouping helps organize complex report layouts.

For more information, see [Group visuals in Power BI Desktop reports](desktop-grouping-visuals.md).

## Formatting and themes

Consistent formatting makes reports easier to read and reinforces your brand identity.

### Report themes

Report themes apply consistent colors, fonts, and formatting across all visuals in a report. Use built-in themes or create custom themes that match your organization's branding. You can export a theme from one report and apply it to other reports, making it easy to maintain consistent styling across multiple reports.

For more information, see [Use report themes in Power BI Desktop](desktop-report-themes.md).

### Organizational themes (preview)

Organizational themes let administrators define and share themes across the organization. When enabled, report creators can see organizational themes available to them when creating reports, ensuring consistent branding across all reports. You can also mark a theme for Copilot to use when generating reports.

For more information, see [Use organizational themes in Power BI](desktop-organizational-themes.md).

### Conditional formatting

Apply conditional formatting to highlight important values, show data bars, add icons, or change colors based on data values. Conditional formatting draws attention to key insights.

For more information, see [Conditional formatting in Power BI](../visuals/power-bi-visualization-conditional-formatting.md).

### Custom format strings

Power BI includes built-in format strings such as text, whole number, currency, and many date options to control how values appear in your reports. When the built-in options don't meet your needs, you can add custom format strings to display values in specific formats like custom currency patterns, percentages, or specialized number formats.

For more information, see [Use custom format strings in Power BI Desktop](desktop-custom-format-strings.md).

### Dynamic format strings

Static and custom format strings apply to an entire column. When data is aggregated in a DAX measure, you can add dynamic format strings that change based on the value or the slicers and filters applied to it. For example, display values in the correct currency format based on region, show time values in the appropriate unit (ms, s, h, d), use abbreviated formats like thousands or millions based on the value size, or switch between currency and percentages depending on what's being measured.

For more information, see [Create dynamic format strings for measures](desktop-dynamic-format-strings.md).

### Dynamic titles

Use expressions to create visual titles that update based on filter selections, slicer values, or other report context. Dynamic titles help users understand what data they're viewing.

For more information, see [Create dynamic, expression-based titles in Power BI Desktop](desktop-conditional-format-visual-titles.md).

## Filters and slicers

Filters and slicers let users focus on specific subsets of data.

### Filters pane

The Filters pane is a pane alongside the report that's generally always available to report viewers. It provides filtering at the visual, page, or report level. You can configure which filters are visible to report consumers and which are hidden.

For more information, see [Format filters in Power BI reports](power-bi-report-filter.md).

### Slicers

Slicers are on-canvas filter controls that let users interactively filter report data. Power BI offers several slicer types including dropdown, list, button, and date range slicers. Slicers can also be configured to include pictures and data elements for a richer filtering experience.

For more information, see [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md).

### Hierarchy slicers

Add multiple fields to a single slicer to create a hierarchy that users can expand and collapse. Hierarchy slicers are useful for filtering by categories like geography or product hierarchy.

For more information, see [Add multiple fields to a hierarchy slicer](power-bi-slicer-hierarchy-multiple-fields.md).

### Field parameters

Field parameters let users dynamically switch which fields appear in visuals. Create parameters that let report consumers choose which measures or dimensions to display.

For more information, see [Let report readers use field parameters to change visuals](power-bi-field-parameters.md).

## Bookmarks and buttons

Bookmarks and buttons add interactivity and navigation to your reports.

### Bookmarks

Bookmarks capture the current state of a report page, including filter selections, slicer values, and visual visibility. Users can return to saved views or you can use bookmarks to create interactive experiences.

For more information, see [Create bookmarks in Power BI Desktop to share insights and build stories](desktop-bookmarks.md).

### Buttons

Add buttons that perform actions like navigating to other pages, applying bookmarks, opening URLs, or running Q&A queries. Buttons make reports more interactive and user-friendly.

For more information, see [Create buttons in Power BI reports](desktop-buttons.md).

### Page and bookmark navigators

Page navigators and bookmark navigators automatically create navigation controls for your report. These navigators update automatically as you add pages or bookmarks.

For more information, see [Create page and bookmark navigators](button-navigators.md).

## Drillthrough and navigation

Drillthrough lets users navigate from summary data to detailed information.

### Drillthrough

Configure drillthrough pages that show detailed information for a specific context. Users can right-click a data point and drill through to see related details.

For more information, see [Use drillthrough in Power BI reports](desktop-drillthrough.md).

### Cross-report drillthrough

Enable drillthrough between reports so users can navigate from one report to a detail page in another report. Cross-report drillthrough works across reports in the same workspace.

For more information, see [Use drillthrough in Power BI reports](desktop-drillthrough.md).

## Translytical task flows (preview)

Translytical task flows enable data write-back capabilities in Power BI reports, allowing users to update records, add annotations, or trigger actions in other systems directly from a report. Using Fabric user data functions, you can add, edit, or delete data in Fabric databases, or call external APIs to take action in other systems.

For more information, see [Understand translytical task flows](translytical-task-flow-overview.md).

## Tooltips

Tooltips provide additional context when users hover over data points.

### Visual tooltips

Visual tooltips show each data point value when hovering, aligning to your report theme. You can also include drill actions in tooltips to help users navigate to related data.

For more information, see [Create modern visual tooltips](desktop-visual-tooltips.md).

### Additional tooltip fields

Add additional measures or dimensions to tooltips to give users more context without cluttering the visual. You can customize which fields appear in tooltips and how they're formatted.

For more information, see [Customize tooltips in Power BI Desktop](desktop-custom-tooltips.md).

### Report page tooltips

Create entire report pages that appear as tooltips when users hover over data points. Report page tooltips can include multiple visuals, images, and formatted text.

For more information, see [Create tooltips based on report pages in Power BI Desktop](desktop-tooltips.md).

### Help tooltips

Add help tooltips to visuals via the visual header icons. Help tooltips provide guidance or explanations to help users understand the data or how to interact with the visual.

## Data display in tables and matrices

Tables and matrices can display rich content beyond simple text and numbers.

### Hyperlinks

Add hyperlinks to table and matrix cells that open URLs when clicked. You can create static links or dynamic links based on data values.

For more information, see [Add hyperlinks to a table in Power BI](power-bi-hyperlinks-in-tables.md).

### Images

Display images in table and matrix cells using image URLs in your data. Images can show product photos, icons, flags, or other visual content.

For more information, see [Display images in a table, matrix, or slicer](power-bi-images-tables.md).

### Sparklines

Add sparklines to table and matrix cells to show trends and patterns inline with your data. Sparklines are small charts that fit within a cell.

For more information, see [Create sparklines in Power BI](power-bi-sparklines-tables.md).

## Quick reports

Power BI can automatically generate reports to help you get started quickly.

### Autogenerated reports in the service

The Power BI service can automatically create a report when you upload data or connect to a semantic model. These quick reports provide a starting point that you can customize.

For more information, see [Create quick reports in the Power BI service](service-quick-create-report.md).

### Quick reports from Excel

Upload an Excel file to the Power BI service to automatically generate a report based on your data. Power BI analyzes your data and creates appropriate visualizations.

For more information, see [Create a report from an Excel file in the Power BI service](service-report-create-new.md).

### Quick reports from Dynamics 365

Create quick reports directly from Power Apps and Dynamics 365 apps to visualize your business data without leaving your application.

For more information, see [Visualize data quickly from Power Apps and Dynamics 365 apps](dynamics-quick-create-report.md).

## Mobile-optimized reports

Create report layouts optimized for viewing on mobile devices through the Power BI mobile app.

### About mobile layouts

Mobile-optimized reports provide a layout designed for phone screens, viewed through the Power BI mobile app. You can arrange visuals specifically for portrait orientation and smaller screens.

For more information, see [About Power BI mobile-optimized reports](power-bi-create-mobile-optimized-report-about.md).

### Create mobile layouts

Use the mobile layout view in Power BI Desktop to create phone-optimized versions of your report pages. Drag visuals onto the phone canvas and resize them for mobile viewing. You can also use the auto-create option to automatically generate a mobile layout based on your existing report page.

For more information, see [Create a mobile-optimized report layout](power-bi-create-mobile-optimized-report-initial-layout.md).

## Publishing and templates

Share your reports and create reusable templates.

### Publish reports

Publish reports from Power BI Desktop to the Power BI service to share them with others. Published reports appear in workspaces where team members can view and interact with them.

For more information, see [Publish semantic models and reports from Power BI Desktop](desktop-upload-desktop-files.md).

### Report templates

Create report templates that include report structure, visuals, and formatting without the data. Templates let you create consistent reports or share report designs with others.

For more information, see [Create report templates in Power BI Desktop](desktop-templates.md).

### Export reports

Export reports from the Power BI service back to Power BI Desktop (.pbix) files for further editing. You can also export report data to various formats.

For more information, see [Export a report to Power BI Desktop](service-export-to-pbix.md).

## Performance and optimization

Optimize your reports for fast loading and smooth interaction.

### Performance Analyzer

Use Performance Analyzer to measure how long each visual takes to load and refresh. Identify slow visuals and optimize them for better performance.

For more information, see [Use Performance Analyzer to examine report element performance](performance-analyzer.md).

### Automatic page refresh

Configure pages to refresh automatically at set intervals. Automatic page refresh is useful for dashboards and monitoring scenarios where data changes frequently.

For more information, see [Automatic page refresh in Power BI](desktop-automatic-page-refresh.md).

### Evaluation configuration

Configure how Power BI evaluates DAX queries in your report. Evaluation settings can affect performance and resource usage.

For more information, see [Evaluation configuration settings in Power BI Desktop](desktop-evaluation-configuration.md).

## Accessibility

Create reports that everyone can use, including people who use assistive technologies.

### Accessibility overview

Power BI includes many features to make reports accessible, including keyboard navigation, screen reader support, and high contrast themes.

For more information, see [Overview of accessibility in Power BI](desktop-accessibility-overview.md).

### Design accessible reports

Follow accessibility best practices when designing reports. Use descriptive titles, alt text for visuals, and logical tab order to make reports usable by everyone.

For more information, see [Design Power BI reports for accessibility](desktop-accessibility-creating-reports.md).

## Related content

- [Visualizations overview in Power BI](../visuals/power-bi-visualizations-overview.md)
- [Tour the report editor in the Power BI service](service-the-report-editor-take-a-tour.md)
- [Tips and tricks for creating reports in Power BI](desktop-tips-and-tricks-for-creating-reports.md)
