---
title: Set the default format string locale for a Power BI report
description: Learn how to set the default format string locale for dates and numbers in a Power BI report so values display in a specific locale regardless of the viewer's browser settings.
author: julcsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/01/2026
LocalizationGroup: Create reports
ai-usage: ai-assisted
---
# Set the default format string locale for a Power BI report

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You can set a default format string locale for a Power BI report so dates and numbers display in a specific locale, regardless of the viewer's browser settings. This setting is useful when you need consistent formatting across your organization or when your report targets a specific region.

When you set the format string locale for your report, all locale-aware format strings—such as date formats marked with an asterisk in **Format options**—use the locale you specify instead of the viewer's browser locale.

## Set the format string locale

You can set the default format string locale in either Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

1. Select **File** > **Options and settings** > **Options**.
1. Under **Current file**, select **Regional settings**.
1. Under **Default format string locale for dates and numbers**, select a locale from the dropdown.
1. Optionally, select **Default display units to 'none'** to display numbers without abbreviations.

# [Power BI service](#tab/powerbi-service)

Set the locale from **Reading** view, not **Editing** view. After you save the setting, you'll need to refresh the browser to see the change. Setting the locale from Reading view ensures no in-progress edits are lost when the browser refreshes.

1. Open the report in **Reading** view.
1. Select **File** > **Settings**.
1. Scroll to **Default format string locale for dates and numbers** and select a locale from the dropdown.
1. Optionally, select **Default display units to 'none'** to display numbers without abbreviations.
1. Select **Save**.
1. Refresh the browser to apply the change.

---

## What this setting affects

The format string locale setting only affects how values display in visuals.

## Set default display units to none

By default, most visuals have a **Display units** setting of **Auto**, which abbreviates large numbers (for example, *1.2M* instead of *1,200,000*). When you use [dynamic format strings for measures](desktop-dynamic-format-strings.md), or when you set a specific report locale, the abbreviation might not be what you want.

The **Default display units to 'none'** toggle turns off automatic abbreviation across the entire report, so you don't have to change the **Display units** setting on each visual value element one by one. It works even when the format string locale is set to **Auto**.

To turn it on, select **Default display units to 'none'** under **Default format string locale for dates and numbers** in the same location as the locale setting (**Current file** > **Regional settings** in Power BI Desktop, or **File** > **Settings** in the Power BI service).

## Considerations and limitations

The format string locale setting doesn't change the semantic model's awareness of user culture:

- [USERCULTURE](/dax/userculture-function-dax) still returns the viewer's browser locale.
- Metadata translations still use the viewer's browser locale.

## Related content

- [Use custom format strings in Power BI Desktop](desktop-custom-format-strings.md)
- [Create dynamic format strings for measures in Power BI](desktop-dynamic-format-strings.md)
