---
title: Use report themes in Power BI
description: Learn how to use report themes to create a custom color palette and apply it to an entire report in Power BI Desktop and the Power BI service.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
ai-usage: ai-assisted
LocalizationGroup: Create reports
#customer intent: As a Power Bi user I want to learn how to use report themes to create a custom color palette.
---
# Use report themes in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI *report themes* let you apply design changes to your entire report. You can change theme colors, set default visual formatting, and define [custom style presets](report-themes-create-custom.md#create-style-presets-in-custom-themes). When you apply a report theme, all visuals in your report use the colors and formatting from that theme as their default style.

You can use the formatting pane to format individual visuals. When formatted individually on the report canvas, the custom theme doesn't override those changes until you reset the visual to default.

To select report themes:

- In Power BI Desktop, go to the **View** ribbon. In the **Themes** section, select the dropdown arrow.
- In the Power BI service, select **View** > **Theme**.

From the dropdown, select the built-in theme you want, browse for a custom theme file, or customize the current theme.

:::image type="content" source="media/desktop-report-themes/report-themes-dropdown-menu.png" alt-text="Screenshot of the Themes dropdown menu.":::

The upper section shows:

- **Built-in report themes** provide different kinds of predefined themes.
- **[Organizational report themes](desktop-organizational-themes.md)** appear in the dropdown when your tenant admin makes additional custom report themes available.

The lower section shows:

- **Browse for themes** to find a report theme file you downloaded to use in this report.
- **Theme gallery** takes you to the community site where you can find report themes to download.
- **Customize current theme** lets you adjust or create a current theme for this report. Selecting this option opens a dialog where you can specify different colors, fonts, visual background styles, page background and wallpaper styles, and the filter pane style. When we make updates to our base theme, or the default look of reports without a custom theme specified, a banner shows in this dialog to update the base theme of existing reports using the base theme from when the report was created.
- **Save current theme** lets you export the custom theme of this report so you can share it with others, make further modifications to it in a text editor, or use it in another report.
- **How to create a theme** navigates you to this documentation.

> [!NOTE]
> The lower section of the **Themes** dropdown is only available in Power BI Desktop. When editing reports in the Power BI service, you can only see the upper section (built-in and organizational themes).

## Understand how the report uses themes

Every report has a base theme defining the default colors and style used across all visuals. The styles include common styles across visuals, such as border, padding, and title font, and styles specific to visuals types, such as line style for line charts. Power BI adds the base theme when you create a report. New releases might update the base theme, but your report keeps its original base theme until you update it. The base theme is what is used for the default style of any new visual created. Microsoft manages the base theme as part of Power BI.

Individual visuals can be formatted differently using the format pane. You can pick another color from the theme colors or a color not in the theme colors. You can deviate from the theme on padding or title font, for just that visual. To revert the style of a visual back to the theme style, you can **reset to default** for the entire visual, or formatting section on that visual.

> [!NOTE]
> **Reset to default** also removes formatting pane items controlling actions on buttons and images, all conditional formatting rules, images from URLs or data-bound fields, and other data-bound items such as reference labels.

If you want to modify the colors and styles for an entire report, including existing visuals and new visuals, you use a custom theme. The custom theme layers on top of the base theme, letting you override or add to any style or color defined in the base theme, including style presets for specific visual types.

With a custom theme applied, **reset to default** reverts a visual to the custom theme style, and for anything not defined in the custom theme, the base theme style. Custom themes can be created or modified in a limited way in Power BI Desktop and created or modified extensively in the `JSON` theme file. You can export any report's custom theme as a file for use in another report, and add a custom theme to a report by browsing for the `JSON` theme file.

Custom themes are also called report themes.

## Understand how theme colors are used by the report

Theme colors are used when you create any visuals in the report. The colors come from data colors in the theme. When you edit any color element in a visual, the dialog shows you the theme colors with various shades of those colors to pick from. You can also select **More colors** to pick any color you need.

It's best practice to use the theme colors. When you pick a theme color and then change the theme later, the visuals update to the new theme colors automatically. To avoid having to manually update every visual to new colors on a theme update, pick theme colors.

The colors in the color palette are relative to the current theme. For example, suppose you select the third color of the top row for a data point. If you change to a different theme, that data point's color automatically updates to the third color of the top row in the new theme. This behavior is similar to changing themes in Microsoft Office.

If you prefer a visual to not automatically update, don't use a theme color by going to **more colors** in the color palette. To return any visual to the theme colors, choose **reset to default** in the visual's formatting pane.

### Colors used by dynamic and static series in visuals

When a visual has a series, Power BI applies colors in the order they appear in the theme's data colors. A visual has a series when you add a legend or use more than one measure in the values section.

A **dynamic series** is when you add a column to a legend or axis that then shows the series per value. These values are dynamic in that a column can have any number of values and the values may change based on interactions within the report, such as filters applied and slicer selections.

For example, if you show *Profit by Region* in a visual, you might have two sales regions, or you might have four or a different set of regions. The number and selected set of regions is dynamic, making this a dynamic series.

A **static series** is when you add more than one measure, or stack, measures in the field well of a visual. For *static series*, you control the number of members in the series and their order. For example, *Profit* and *Revenue* measures used in a visual are a static series.

Colors are assigned to the value of the series by the order they appear in the visual. The first theme color is assigned to the first in the series, and second theme color is assigned to the next, etc.

In the dynamic series example, if I have a visual showing *Profit* by *North* and *South* region, and another visual showing it by *East* and *North* regions, then the first values, *North* and *East* use the first color, and *South* and *North* use the second color. *North* has a different color as it's used in a different order in the visuals.

In the static series example, if I have *Profit* then *Revenue* in one visual, and *Revenue* then *Profit* in another visual, the colors are different.

You can always assign specific members of a series to a particular theme color by using the formatting pane: see more information about how to [change the color of a single data point](../visuals/service-tips-and-tricks-for-color-formatting.md#change-the-color-of-a-single-data-point). 

Visual level color assignment can be undone at any time by choosing **reset to default** on the particular formatting pane section for that visual, and the visual again automatically uses the theme colors in the order the series members appear in the visual.

## Apply a built-in report theme

Built-in themes let you quickly apply a custom theme to your report. Any report custom theme previously added or adjusted in the report is replaced with what you select. Visuals formatted directly using the format pane maintain their customizations until you reset them to default.

1. On the **View** ribbon, select the dropdown arrow next to **Themes** .
1. Select from the themes on the dropdown menu.

The report theme is now applied to the report.

### Built-in report themes available

The following table shows the available built-in report themes.

| Built-in report theme | Default color sequence |
|------ |---------- |
| Default | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-default.png" alt-text="Screenshot of the color sequence for the Default theme.":::|
| Highrise | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-highrise.png" alt-text="Screenshot of the color sequence for the Highrise theme.":::|
| Executive | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-executive.png" alt-text="Screenshot of the color sequence for the Executive theme.":::|
| Frontier| :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-frontier.png" alt-text="Screenshot of the color sequence for the Frontier theme.":::|
| Innovate | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-innovative.png" alt-text="Screenshot of the color sequence for the Innovate theme.":::|
| Bloom | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-bloom.png" alt-text="Screenshot of the color sequence for the Bloom theme.":::|
| Tidal| :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-tidal.png" alt-text="Screenshot of the color sequence for the Tidal theme.":::|
| Temperature | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-temperature.png" alt-text="Screenshot of the color sequence for the Temperature theme.":::|
| Solar| :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-solar.png" alt-text="Screenshot of the color sequence for the Solar theme.":::|
| Divergent | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-divergent.png" alt-text="Screenshot of the color sequence for the Divergent theme.":::|
| Storm | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-storm.png" alt-text="Screenshot of the color sequence for the Storm theme.":::|
| Classic | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-classic.png" alt-text="Screenshot of the color sequence for the Classic theme.":::|
| City park | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-city-park.png" alt-text="Screenshot of the color sequence for the City park theme.":::|
| Classroom | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-classroom.png" alt-text="Screenshot of the color sequence for the Classroom theme.":::|
| Color-blind safe | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-colorblind-safe.png" alt-text="Screenshot of the color sequence for the Color blind safe theme.":::|
| Electric | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-electric.png" alt-text="Screenshot of the color sequence for the Electric theme.":::|
| High contrast | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-high-contrast.png" alt-text="Screenshot of the color sequence for the High contrast theme.":::|
| Sunset | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-sunset.png" alt-text="Screenshot of the color sequence for the Sunset theme.":::|
| Twilight | :::image type="content" source="media/desktop-report-themes/report-themes-color-scheme-twilight.png" alt-text="Screenshot of the color sequence for the Twilight theme.":::|
| Accessible default | :::image type="content" source="media/desktop-report-themes/accessible-theme-default.png" alt-text="Screenshot of the color sequence for the Accessible default theme."::: |
| Accessible city park |:::image type="content" source="media/desktop-report-themes/accessible-theme-city-park.png" alt-text="Screenshot of the color sequence for the Accessible city park theme."::: |
| Accessible tidal | :::image type="content" source="media/desktop-report-themes/accessible-theme-tidal.png" alt-text="Screenshot of the color sequence for the Accessible tidal theme.":::|
| Accessible neutral | :::image type="content" source="media/desktop-report-themes/accessible-theme-neutral.png" alt-text="Screenshot of the color sequence for the Accessible neutral theme."::: |
| Accessible orchid |:::image type="content" source="media/desktop-report-themes/accessible-theme-orchid.png" alt-text="Screenshot of the color sequence for the Accessible orchid theme."::: |

## Apply an organizational report theme

More themes may be available in the theme dropdown if your tenant admin adds them to [organizational themes](desktop-organizational-themes.md). These themes are applied like the built-in themes; they remove any previous custom theme and use the selected custom theme.

## Customize the current report theme

In Power BI Desktop, some of the visual options are available to be customized by selecting **Customize current theme**. 

You can create the custom theme or edit a custom theme added to the report already from built-in themes, organizational themes, or a theme you already added to your report with **browse for themes**.

1. From the **View** ribbon, select the **Themes** dropdown button and select **Customize current theme**.

   :::image type="content" source="media/desktop-report-themes/customize-current-report-theme.png" alt-text="Screenshot of the Power BI Themes dropdown menu, highlighting Customize current theme.":::

1. A dialog appears where you can make changes to the current theme. You can save your settings as a new theme.

   :::image type="content" source="media/desktop-report-themes/report-themes-07.png" alt-text="Screenshot of the Customize theme dialog.":::

These categories are available in the **Customize theme** dialog:

- **Name and colors**: Theme name and color settings include [theme colors](report-themes-create-custom.md#set-theme-colors), sentiment colors, divergent colors, and [structural colors (Advanced)](report-themes-create-custom.md#set-structural-colors).
- **Text**: Text settings include font family, size, and color, which sets [the primary text class defaults](report-themes-create-custom.md#set-formatted-text-defaults) for labels, titles, cards and KPIs, and tab headers.
- **Visuals**: Visual settings include background, border, header, and tooltips.
- **Page**: Page element settings include wallpaper and background.
- **Filter pane**: Filter pane settings include background color, transparency, font and icon color, size, and filter cards.

After you make your changes, select **Apply and save** to save your theme. You can now use the theme in the current report or export it with **Save current theme**.

Customizing the current theme in this way is easy but limited. However, you can also make finer adjustments to themes by modifying the custom theme's [JSON file](report-themes-create-custom.md) in a text editor, such a VS Code. Browse for the theme file after making changes to add it to the report.

## Manage the base report theme

The base theme is the underlying default styling that Power BI applies before any customizations. When you apply a custom theme, it layers on top of the base theme. Any styles defined in the custom theme override the corresponding styles in the base theme, while styles not specified in the custom theme fall back to the base theme defaults. The base theme may be updated with Power BI releases. To avoid disrupting existing reports, these changes don't automatically get applied.

To check if you're using the latest and to update base theme, follow these steps.

1.Go to the **View** ribbon, select the **Themes** dropdown, and select **Customize current theme**. 

1. If your theme is out of date, a banner appears at the top of the **Customize theme** dialog, encouraging you to update your base theme.

1. Select **Update theme** to see the changes, and then select **Apply**.

:::image type="content" source="media/desktop-report-themes/update-theme.png" alt-text="Screenshot showing the Update theme option.":::

You can revert this update by selecting undo if you preferred the previous base theme.

## Save a report theme file

You can save or export the currently applied report theme directly from Power BI Desktop to a theme `JSON` file. After you export a report theme, you can then reuse it in other reports. 

To export the currently applied theme from Power BI Desktop:

1. Select **View** and select the **Themes** dropdown menu.

   :::image type="content" source="media/desktop-report-themes/save-current-theme.png" alt-text="Screenshot of the Themes dropdown menu, highlighting Save current theme.":::

1. Near the bottom of the dropdown menu, select **Save current theme**.
1. From the **Save As** dialog box, go to a directory in which to save the JSON file, and then select **Save**.

## Apply a custom report theme `JSON` file

Custom theme `JSON` files saved from another report, or shared with you by someone else, can be applied to any other report.

To install the custom theme `JSON` file: 

1. Select **Browse for themes** from the **Themes** dropdown menu

1. Go to the location where you downloaded the JSON file, and select it.

When successful, Power BI shows a dialog that the import was successful. A dialog also shows when it isn't successful with details on the error in the custom theme file.

> [!TIP]
> You can find theme files created by others by selecting **Theme gallery** and downloading it to your machine. You can also use online tools or simply use a text editor such as VS Code to create your own or edit an existing custom theme file.


### Custom report theme files you can use right now

Want to get started with report themes? Browse the [themes gallery](https://community.powerbi.com/t5/Themes-Gallery/bd-p/ThemesGallery) for custom themes. You can also download and import the following JSON files into your Power BI Desktop report:

- [Waveform theme](https://community.powerbi.com/t5/Themes-Gallery/Waveform/m-p/140536). This report theme was introduced in the [blog post](https://powerbi.microsoft.com/blog/power-bi-desktop-march-feature-summary/) that announced the first release of report themes. [Download Waveform.json](https://go.microsoft.com/fwlink/?linkid=843924).

  :::image type="content" source="media/desktop-report-themes/report-themes_10.png" alt-text="Screenshot of the Waveform JSON theme.":::

- [Color-blind friendly theme](https://community.powerbi.com/t5/Themes-Gallery/Color-Blind-Friendly/m-p/140597).
This report theme is easier to read for the visually impaired. [Download ColorblindSafe-Longer.json](https://go.microsoft.com/fwlink/?linkid=843923).

  :::image type="content" source="media/desktop-report-themes/report-themes_11.png" alt-text="Screenshot of the Color-blind Safe Longer JSON theme.":::

- Valentine's Day theme.

  :::image type="content" source="media/desktop-report-themes/report-themes_13.png" alt-text="Screenshot of the Valentine's Day JSON theme.":::

Here's the code for the Valentine's Day JSON file:

   ```json
       {
           "name": "Valentine's Day",
           "dataColors": ["#990011", "#cc1144", "#ee7799", "#eebbcc", "#cc4477", "#cc5555", "#882222", "#A30E33"],
           "background":"#FFFFFF",
           "foreground": "#ee7799",
           "tableAccent": "#990011"
       }
   ```

Here are a few more report themes you can use as starting points:

- [Sunflower-twilight](https://community.powerbi.com/t5/Themes-Gallery/Sunflower-Twilight/m-p/140749)
- [Plum](https://community.powerbi.com/t5/Themes-Gallery/Plum/m-p/140711)
- [Autumn](https://community.powerbi.com/t5/Themes-Gallery/Autumn/m-p/140746)
- [High contrast](https://community.powerbi.com/t5/Themes-Gallery/Color-Blind-Friendly/m-p/140597)

Report themes can make your Power BI Desktop reports a colorful reflection of you, your organization, or even the current season or holiday.

### More sources of report themes

The following GitHub repository has sample JSON for all the different components in the JSON themes file: [Power BI Theme Templates](https://github.com/mattrudy/PowerBI-ThemeTemplates/blob/master/README.md).

In addition, try searching for ["Power BI theme generator"](https://www.bing.com/search?q=power+bi+theme+generator) on Bing.


## Create a custom theme file

To create your own custom report theme JSON files with complete control over colors, fonts, and visual styles, see [Create custom report themes in Power BI Desktop](report-themes-create-custom.md).

## Considerations and limitations

If you use one of the original themes, the Classic theme, or a custom theme that you import on top of one of these themes, you can't access the text section of the theme dialog box.

Built-in themes affected by this limitation:

- Classic
- City park
- Classroom
- Color blind safe
- Electric
- High contrast
- Sunset
- Twilight

If you use one of the affected themes and you don't need to modify the text settings, you can safely use the other tabs of the dialog box. However, if you want to use the text classes with one of the affected themes, you have the following options:

- Select the Default theme options to enable the text classes.
- To keep your current custom theme and enable the text tab:
    1. Export your current theme.
    1. Select the default theme.
    1. Import the custom theme you exported in the first step.

The text in your report might change to match the default theme, but you can then access the text tab in the theme dialog box.

Elements that are considered part of the interface can't be changed using a report theme, including the Filter, Format, and Data panes and the [visual matrix in visual calculations](../transform-model/desktop-visual-calculations-overview.md).

**Reset to default** also removes formatting pane items controlling actions on buttons and images, all conditional formatting rules, images from URLs or data-bound fields, and other data-bound items such as reference labels.

## Related content

- [Create custom report themes in Power BI Desktop](report-themes-create-custom.md)
- [Design Power BI reports for accessibility](desktop-accessibility-creating-reports.md)
- [Tips and tricks for color formatting](../visuals/service-tips-and-tricks-for-color-formatting.md)
- [Conditional formatting in Power BI](../visuals/power-bi-visualization-conditional-formatting.md)
