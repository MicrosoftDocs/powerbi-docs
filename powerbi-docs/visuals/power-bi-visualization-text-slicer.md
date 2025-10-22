---
title: Create a text slicer (preview)
description: Learn how to create a text slicer (preview) in Power BI Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 05/20/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the text slicer (preview) feature in Power BI Desktop, including how to create and customize it, so I can enhance my reports with interactive filtering options.
---

# Create a text slicer (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

The text slicer (preview) visual in Power BI is an interactive element that enables users to filter data directly within reports and dashboards. It offers a dynamic and intuitive way to explore and analyze large datasets by triggering filters through input text values.

Text slicers provide a flexible and precise filtering experience by allowing users to input free-form text. Unlike traditional slicers that rely on predefined categories (for example, dropdowns or checkboxes), text slicers empower users to define their own filter criteria, making them ideal for scenarios where exact string matching or custom input is required.

> [!IMPORTANT]
> The text slicer (preview) is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that might be substantially modified before it is released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites

Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

For the purposes of this guide, in Power BI Desktop's **Global options**, under the **Preview features** section, the **text slicer visual** feature is *disabled* by default, however, by completing the following steps you can enable it:

1. Open **Power BI Desktop**.
1. Navigate to the **Options** section found under the **File** menu.
1. In the **Global options** window, go to the **Preview features** section and find the **text slicer visual** option.
1. Select the checkbox to enable the feature.

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). After downloading the file, let’s get started:

1. Launch **Power BI Desktop**.
1. On the left-side navigation pane, select **Open**; otherwise, on the top-left of the window, select **File > Open**.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view, ready for you to begin.

:::image type="content" source="media/button-slicer/button-slicer-sample.png" alt-text="Screenshot of the sample file showing district manager names as selectable tiles." lightbox="media/button-slicer/button-slicer-sample.png":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual **Power BI Pro license** or that you save the report in **Premium capacity**.

## Let’s create a text slicer

In this quick and easy three-step guide, we create a **text slicer** in Power **BI Desktop**. Review the [Prerequisites](#prerequisites) section before following these steps.

1. With the **Retail Analysis Sample PBIX** open, make sure you are on the Overview page by selecting the **Overview** tab. To make room for your text slicer, select and resize the Scatter chart by dragging the dark **visualization handles**. Then, with nothing selected on the report canvas, select the **text slicer** icon in the **Build visual** tab on the **Visualizations** pane to create a new slicer on the report canvas.

   :::image type="content" source="media/text-slicer/text-slicer-icon-highlighted.png" lightbox="media/text-slicer/text-slicer-icon-highlighted.png" alt-text="Screenshot of the Power BI Desktop Overview tab, Visualizations pane, Build visual, and text slicer icon highlighted, slicer placeholder with resize handles on canvas.":::

1. To add data to the visual, we use the **Data** pane. With your slicer selected on the report canvas, navigate to the Data pane, expand the **District** table, and select **DM** to populate the slicer. The slicer now displays tiles with the district manager names. You can resize the slicer as needed and rearrange the elements on the canvas to your preference. but be cautious not to make the slicer too small, which affects the displayed information.

   :::image type="content" source="media/text-slicer/text-slicer-district-highlighted.png" lightbox="media/text-slicer/text-slicer-district-highlighted.png" alt-text="Screenshot of the Data pane, District table, DM selected and highlighted, slicer on canvas displaying input text box.":::

1. To customize your slicer, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available format settings. This allows you to tailor the slicer's appearance and functionality to your specific requirements as demonstrated in the following example. 

   :::image type="content" source="media/text-slicer/text-slicer-displayed.png" lightbox="media/text-slicer/text-slicer-displayed.png"  alt-text="Screenshot of Visualizations pane expanded, Format visual icon selected, showing Visual and General tabs, and a formatted slicer with input values applied.":::

Great job! Congratulations on successfully creating a text slicer with Power BI.

Next, take time familiarize yourself with the [Considerations and limitations](power-bi-visualization-text-slicer-considerations-limitations.md) for text slicers. 

## Considerations and limitations

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

This article provides a list of known considerations and limitations, designed to help you navigate the nuances of the text slicer (preview) in Power BI Desktop.

> [!IMPORTANT]
> The text slicer (preview) is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that might be substantially modified before it is released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

### Preview feature

Because the text slicer is a preview feature in Power BI Desktop, the following considerations and limitations apply.

### Power BI service

Users can't see the text slicer (preview) in the **Power BI service** because it's currently a preview feature exclusive to **Power BI Desktop**.

The text slicer (preview) is in the preview phase and is only available within the Power BI Desktop environment. This limitation is a common practice for features that are still under development, allowing users to test and provide feedback before a broader release. Although the text slicer (preview) isn't directly available in the Power BI service, any text slicer (preview) created in Power BI Desktop can be published, making them visible in the Power BI service. This capability allows users to take advantage of the new features while ensuring compatibility and stability within the Service environment.

### Format settings

When you're formatting a text slicer (preview), you might notice that some of the format settings are in a different location, or the name of the setting is changed. Often, new settings or controls are added from one product update to the next. Such changes are expected, as preview features are continuously under development. They're subject to modifications that enhance functionality and user experience. It's the responsibility of report creators to stay informed about these changes when using preview features. Keeping abreast of product updates ensure the effective use of these features in your reports.

### Accessibility

During the preview phase, certain Accessibility features such as keyboard navigation and screen-reader support might not be fully operational. However, we're committed to ensuring that all functionalities comply with Accessibility standards upon the conclusion of the preview period.

### Filter logic and operators

The Text slicer uses contains as its default filter logic and applies an or operator when multiple values are entered. This means that any record containing one or more of the input strings will be returned. 

### Text slicer as input control 

The text slicer can be configured as a pure input control by a meeting the ‘Field’ assignment in the build pane. This disables its filtering capability and transforms it into a parameter input mechanism. This setup is essential for Translytical Task Flows, especially when passing parameters that are not tied to a specific data field, such as comments, annotations, or external triggers. When used this way, the slicer activates the User Data Function through a button, provided the parameter is marked as required. This enables workflows like writebacks, approvals, or notifications, without relying on dataset-bound filtering. 

## Related content

- [text slicer considerations and limitations](power-bi-visualization-text-slicer-considerations-limitations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
