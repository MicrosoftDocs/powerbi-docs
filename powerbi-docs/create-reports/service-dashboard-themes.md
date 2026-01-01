---
title: Use Dashboard Themes in the Power BI Service
description: Learn how to use dashboard themes to apply custom color palettes, background images, and JSON theme files to your entire Power BI dashboard.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
LocalizationGroup: Create reports
ai-usage: ai-assisted
---

# Use dashboard themes in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

By using *dashboard themes*, you can apply a color theme to your entire dashboard, such as corporate colors, seasonal coloring, or any other color theme you want to apply. When you apply a dashboard theme, all visuals on your dashboard use the colors from your selected theme. A few exceptions apply, described in this article's [Considerations and limitations](#considerations-and-limitations) section.

:::image type="content" source="media/service-dashboard-themes/power-bi-full-dashboard-theme.png" alt-text="Screenshot of an example dashboard with a theme background image." lightbox="media/service-dashboard-themes/power-bi-full-dashboard-theme.png":::

Changing the report visual colors on a dashboard doesn't affect the visuals in the associated report. Also, when you pin tiles from a report that already has a [report theme applied](desktop-report-themes.md), you can choose to keep the current theme or use the dashboard theme.

## Prerequisites

To follow along, open the [Sales and Returns sample dashboard](sample-sales-returns.md). You can [publish this file](/power-bi/create-reports/desktop-upload-desktop-files) to your workspace in the Power BI service.

## How dashboard themes work

To get started, open a dashboard that you created or can edit. Select **Edit** > **View** > **Theme**.

:::image type="content" source="media/service-dashboard-themes/power-bi-dashboard-theme.png" alt-text="Screenshot of the Edit drop down menu, highlighting the Dashboard theme option." lightbox="media/service-dashboard-themes/power-bi-dashboard-theme.png":::

In the dashboard pane that appears, select one of the prebuilt themes.

:::image type="content" source="media/service-dashboard-themes/power-bi-theme-menu.png" alt-text="Screenshot of the Dashboard theme window and dropdown menu.":::

The following example shows the **Dark** theme applied.

:::image type="content" source="media/service-dashboard-themes/power-bi-theme-dark.png" alt-text="Screenshot of the dashboard with the Dark option applied." lightbox="media/service-dashboard-themes/power-bi-theme-dark.png":::

## Create a custom theme

The default theme for Power BI dashboards is **Light**. If you want to customize the colors or create your own theme, select **Custom** in the drop-down.

:::image type="content" source="media/service-dashboard-themes/power-bi-theme-custom.png" alt-text="Screenshot of the Dashboard theme dialog box with the Custom theme option selected.":::

Use the custom options to create your own dashboard theme. If you add a background image, use a resolution of at least 1920x1080. To use an image as a background, upload the image to a public website, copy the URL, and paste it into the **Image URL** field.

## Use a JSON theme

Another way to create a custom theme is to upload a JSON file that has settings for all the colors you'd like to use for your dashboard. In Power BI Desktop, report creators use JSON files to [create themes for reports](desktop-report-themes.md). You can upload these same JSON files for dashboards or find and upload JSON files from the [Themes Gallery](https://community.fabric.microsoft.com/t5/Themes-Gallery/bd-p/ThemesGallery) in the Power BI Community.

:::image type="content" source="media/service-dashboard-themes/power-bi-theme-gallery.png" alt-text="Screenshot of the Themes Gallery site." lightbox="media/service-dashboard-themes/power-bi-theme-gallery.png":::

You can also save your custom theme as a JSON file and then share it with other dashboard creators.

### Use a theme from the Theme Gallery

As with the built-in and custom options, when you upload a theme, the colors automatically apply to all tiles on the dashboard.

1. Hover over a theme and choose **View report**.

   :::image type="content" source="media/service-dashboard-themes/power-bi-choose-theme.png" alt-text="Screenshot of a Theme Gallery report option.":::

1. Scroll down and find the link to the JSON file. Select the download icon and save the file.

   :::image type="content" source="media/service-dashboard-themes/power-bi-theme-json.png" alt-text="Screenshot of the download icon for the JSON file.":::

1. In the Power BI service, in the Custom Dashboard theme window, select **Upload JSON theme**.

   :::image type="content" source="media/service-dashboard-themes/power-bi-upload-theme.png" alt-text="Screenshot of the Dashboard theme window with the Upload JSON theme option highlighted.":::

1. Navigate to the location where you saved the JSON theme file and select **Open**.

1. On the Dashboard theme page, select **Save**. The new theme is applied to your dashboard.

   :::image type="content" source="media/service-dashboard-themes/power-bi-json.png" alt-text="Screenshot of a Dashboard with the new theme applied." lightbox="media/service-dashboard-themes/power-bi-json.png":::

## Reports and dashboards with different themes

If your report uses a different theme from the dashboard theme, you can usually control whether the visual keeps the current report theme or uses the dashboard theme. However, card visuals in dashboards use the *DIN* font family, with black text. You can change the text color for all the tiles on a dashboard, including the cards, by creating a custom dashboard theme.

- When you pin a tile to a dashboard, select **Keep current theme** to keep the report theme. The visual on the dashboard keeps the report theme, including transparency settings.

   You see the **Tile Theming** options only when you create the report in Power BI Desktop, [add a report theme](desktop-report-themes.md), and then publish the report to the Power BI service.

   :::image type="content" source="media/service-dashboard-themes/power-bi-keep-current.png" alt-text="Screenshot of the Pin to dashboard window with the Keep current theme option highlighted.":::

- Try repinning the tile and selecting **Use dashboard theme**.

   :::image type="content" source="media/service-dashboard-themes/power-bi-use-destination.png" alt-text="Screenshot of the Pin to dashboard window with the Use destination theme option highlighted.":::

## Dashboard theme JSON file format

At its most basic level, the theme JSON file has only one required line: **name**.

```json
{
    "name": "Custom Theme"
}
```

Other than **name**, everything else is optional. Add only the properties you want to format to the theme file and continue to use the Power BI defaults for the rest.

The JSON file for dashboard theming includes:

- **name**: The theme name (only required field).
- **foreground** and **background**: Colors for the dashboard.
- **dataColors**: A list of hex codes to use for data in charts. You can include as few or as many colors as you want.
- **tiles**: Background and color configurations for dashboards.
- **visualStyles**: Granular formatting for visuals.

Here's a sample theme JSON for the default Light theme:

```json
{

"name":"Light",

"foreground":"#000000",

"background":"#EAEAEA",

"dataColors":["#01B8AA","#374649","#FD625E","#F2C80F","#5F6B6D","#8AD4EB","#FE9666","#A66999"],

"tiles":{"background":"#FFFFFF","color":"#000000"},

"visualStyles":{"*":{"*":{"*":[{"color":{"solid":{"color":"#000000"}}}]}}}

}
```

## Considerations and limitations

- You can't apply dashboard themes to pinned live report pages, iframe tiles, SSRS tiles, workbook tiles, or images.
- You see dashboard themes on mobile devices, but you can only create a dashboard theme in the Power BI service.
- Dashboard custom themes only work with tiles pinned from reports.

## Related content

- [Use report themes in Power BI Desktop](desktop-report-themes.md)

More questions? Ask the [Power BI Community](https://community.fabric.microsoft.com/t5/Power-BI-forums/ct-p/powerbi).
