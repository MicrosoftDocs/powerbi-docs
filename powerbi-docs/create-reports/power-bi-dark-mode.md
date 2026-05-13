---
title: Dark Mode in Power BI Desktop
description: Learn how you can create reports in Power BI reports in different modes.
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
#  Dark mode in Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

When you create reports in Power BI Desktop, you can choose different modes, depending on what you're more comfortable looking at. For example, *Dark mode* replaces all the chrome around the design surface with white-on-black text instead of black-on-white.

> [!NOTE]
> This article is about dark mode in Power BI Desktop. For information about dark mode in Power BI Mobile, see [Dark mode in Power BI Mobile](../explore-reports/mobile/mobile-apps-dark-mode.md).

## Select a mode

1. Go to **File** > **Options and settings** > **Options** > **Global** > **Report settings**.
1. In the **Customize appearance (preview)** section, select the theme you want:

    - **Legacy**: The standard white theme of the desktop application.
    - **Dark**: A dark theme that transforms the desktop application into a darker interface.
    - **Light**: A white theme with a more stylish look than the default theme.
    - **System default**: Adapts the theme based on your Windows system settings.
1. Select **OK** to save your settings.

## Disable dark mode

To turn off dark mode and return to a light appearance:

1. Go to **File** > **Options and settings** > **Options** > **Global** > **Report settings**.
1. In the **Customize appearance (preview)** section, select one of these options:
   - **Legacy** - Returns to the original white theme.
   - **Light** - Uses a modern white theme.
   - **System default** - If your Windows system is set to a light theme, Power BI Desktop uses a light appearance.
1. Select **OK** to save your settings.
1. Restart Power BI Desktop for the change to take full effect.

There's a mode for every window in Power BI Desktop. For example, for dark mode:

- [Report view](#report-view)
- [Model view](#model-view)
- [Table view](#table-view)
- [DAX query view](#dax-query-view)
 
## Report view

:::image type="content" source="media/power-bi-dark-mode/dark-mode-report-view.png" alt-text="Screenshot of Dark mode for report view." lightbox="media/power-bi-dark-mode/dark-mode-report-view.png":::

> [!NOTE]
> Dark mode is not applied to the Report view Canvas, including the Filter Pane and Wallpaper.


## Model view

:::image type="content" source="media/power-bi-dark-mode/dark-mode-model-view.png" alt-text="Screenshot of Dark mode for model view." lightbox="media/power-bi-dark-mode/dark-mode-model-view.png":::

## Table view

:::image type="content" source="media/power-bi-dark-mode/dark-mode-table-view.png" alt-text="Screenshot of Dark mode for table view." lightbox="media/power-bi-dark-mode/dark-mode-table-view.png":::

## DAX query view

:::image type="content" source="media/power-bi-dark-mode/dark-mode-dax-query-view.png" alt-text="Screenshot of Dark mode for DAX query view." lightbox="media/power-bi-dark-mode/dark-mode-dax-query-view.png":::

Try the different modes and see which you prefer.

## Considerations and limitations

- Collapsing of the Power Query editor ribbon isn't currently available in dark or light mode.
- The Power Query editor doesn't support the Quick access tool bar in dark or light mode.


## Related content

- [Create reports in Power BI with Copilot](copilot-create-reports.md)
- [Mobile layout view](power-bi-create-mobile-optimized-report-mobile-layout-view.md)
- [Dark mode in Power BI Mobile](../explore-reports/mobile/mobile-apps-dark-mode.md)
