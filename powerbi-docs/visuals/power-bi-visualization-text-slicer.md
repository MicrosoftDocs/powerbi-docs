---
title: Create and Use a Text Slicer (Preview)
description: Learn how to create and customize a Text slicer in Power BI Desktop for dynamic data filtering. Follow step-by-step instructions to enhance your reports with interactive text-based filters.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ai-usage: ai-assisted
ms.date: 10/01/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the Text slicer (preview) feature in Power BI Desktop, including how to create and customize it, so I can enhance my reports with interactive filtering options.
---

# Create and use a text slicer (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

The Text slicer visual in Power BI Desktop is an interactive element that enables you to filter data directly within reports and dashboards using free-form text input. Unlike traditional slicers with predefined categories, text slicers let you define custom filter criteria, making them ideal for exact string matching and flexible data exploration.

This article shows you how to create and customize text slicers to enhance your Power BI reports with dynamic, text-based filtering capabilities.

> [!IMPORTANT]
> The Text slicer is currently in [preview](power-bi-visualizations-overview.md#preview-visuals).

## Text slicer modes

The text slicer behaves differently depending on whether you add a data column to it:

### With a data column (filtering mode)

When you add a data column to the text slicer, it functions as a filter. The slicer filters your report visuals based on whether values in the data column contain any of the entered text strings. This mode is ideal for searching and filtering data when you don't know the exact values in advance.

### Without a data column (input mode)

When you don't add a data column to the text slicer, it acts as a pure input control. In this mode, filtering is disabled and the slicer becomes a parameter input mechanism. This configuration is useful for passing parameters to [translytical task flows](../create-reports/translytical-task-flow-button.md), such as comments, annotations, or values for writebacks and approvals.

## Work with filter pills

When you enter text in a text slicer and press **Enter** or select the apply button, the value converts to a pill (also called a chip or tag). These pills provide a visual representation of your active filters and offer several interactive features:

- **Edit a pill** - Double-click any pill to edit its value. The pill becomes editable, allowing you to modify the filter text directly.
- **Remove a pill** - Select the dismiss (X) button on a pill to remove that filter value.
- **View clustered pills** - When you have many filter values, pills cluster together to save space. Select the cluster to expand and view all individual pills.

## Format the text slicer

You can customize the appearance of many elements in the text slicer to match your report design, including the apply and dismiss buttons. In the **Format** pane under **Visual**:

- **Apply button** - Expand **Apply button** to access formatting options for the apply button.
- **Dismiss button** - Expand **Filters** to access formatting options for the dismiss button on filter pills.

You can adjust colors, borders, and other visual properties to ensure the text slicer integrates seamlessly with your report's look and feel.

> [!TIP]
> To hide the apply or dismiss buttons from the visual, set their **Icon size** to 0.

## Prerequisites for the example

In the following guide, use the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

> [!IMPORTANT]
> Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494) installed before proceeding.

1. Launch **Power BI Desktop**.
1. From the left-side navigation pane, select **Open**, or select **File > Open** from the menu.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view.

[!INCLUDE[sharing-license-requirements](../includes/share-license-requirements.md)]

## Create a text slicer

In this quick and easy three-step guide, you create a **text slicer** in Power **BI Desktop**. Review the [Prerequisites for the example](#prerequisites-for-the-example) section before following these steps.

1. With the **Retail Analysis Sample PBIX** open, make sure you're on the Overview page by selecting the **Overview** tab. To make room for your text slicer, select and resize the scatter chart by dragging the dark **visualization handles**. Then, with nothing selected on the report canvas, select the **text slicer** icon in the **Build visual** tab on the **Visualizations** pane to create a new slicer on the report canvas.

   :::image type="content" source="media/text-slicer/text-slicer-icon-highlighted.png" lightbox="media/text-slicer/text-slicer-icon-highlighted.png" alt-text="Screenshot of Power BI Desktop showing the text slicer icon in the Visualizations pane with a slicer placeholder on the canvas.":::

1. To add data to the visual, use the **Data** pane. With your slicer selected on the report canvas, go to the Data pane, expand the **District** table, and select **DM** to populate the slicer. The slicer now displays an input text box for filtering district manager names. You can resize the slicer as needed and rearrange the elements on the canvas to your preference. Be careful not to make the slicer too small, which affects the displayed information.

   :::image type="content" source="media/text-slicer/text-slicer-district-highlighted.png" lightbox="media/text-slicer/text-slicer-district-highlighted.png" alt-text="Screenshot of Power BI Desktop with the District table expanded and DM field added to the text slicer.":::

1. To customize your slicer, select the **Format visual** icon in the **Visualizations** pane. This icon grants you access to all available format settings. You can tailor the slicer's appearance and functionality to your specific requirements.

   :::image type="content" source="media/text-slicer/text-slicer-displayed.png" lightbox="media/text-slicer/text-slicer-displayed.png" alt-text="Screenshot of the Format visual pane in Power BI Desktop showing customization options for the text slicer.":::

## Considerations and limitations

This section provides a list of known considerations and limitations. It helps you navigate the nuances of the Text slicer (preview) in Power BI Desktop.

> [!IMPORTANT]
> Because the Text slicer is a preview feature in Power BI Desktop, the following considerations and limitations apply.

- **Power BI service**:
  - Users can't see the Text slicer (preview) in the **Power BI service** because it's currently a preview feature exclusive to **Power BI Desktop**.
  - The Text slicer (preview) is in the preview phase and is only available within the Power BI Desktop environment. This limitation is a common practice for features that are still under development, allowing users to test and provide feedback before a broader release.
  - Although the Text slicer (preview) isn't directly available in the Power BI service, you can publish any Text slicer (preview) you create in Power BI Desktop, making it visible in the Power BI service. This capability allows users to take advantage of the new features while ensuring compatibility and stability within the Service environment.
- **Format settings**:
  - When you're formatting a text slicer (preview), you might notice that some of the format settings are in a different location, or the name of the setting is changed.
  - Often, new settings or controls are added from one product update to the next. Such changes are expected, as preview features are continuously under development.
  - They're subject to modifications that enhance functionality and user experience. It's the responsibility of report creators to stay informed about these changes when using preview features.
  - Keeping abreast of product updates ensure the effective use of these features in your reports.
- **Accessibility**:
  - During the preview phase, certain accessibility features such as keyboard navigation and screen-reader support might not be fully operational.
  - However, we're committed to ensuring that all functionalities comply with accessibility standards upon the conclusion of the preview period.
- **Filter logic and operators**:
  - The Text slicer uses contains as its default filter logic and applies an or operator when multiple values are entered. This logic means that any record containing one or more of the input strings is returned.

## Related content

- [List slicer](power-bi-visualization-list-slicer.md)
- [Button slicer](power-bi-visualization-button-slicer.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
