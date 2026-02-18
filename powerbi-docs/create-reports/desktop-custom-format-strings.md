---
title: Use custom format strings in Power BI Desktop
description: Learn how to use custom format strings in Power BI Desktop to customize how fields appear in visuals. Includes syntax reference, examples, and troubleshooting tips.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/18/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
---
# Use custom format strings in Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

By using custom format strings in **Power BI Desktop**, you can customize how fields appear in visuals and make sure your reports look just the way you want.

:::image type="content" source="media/desktop-custom-format-strings/custom-format-strings-01.png" alt-text="Screenshot of Power BI Desktop in Modeling view, highlighting Custom in the Format dropdown menu.":::

Format strings exist on three levels:

- **Model**. Set a format string for fields in the model or use a [dynamic format string](../create-reports/desktop-dynamic-format-strings.md) to format your measure. The format string applies anywhere you use that field, unless a visual or element level format string overrides it.
- **Visual**. Set format strings on any column, measure, or visual calculation that is on your visual, even if they already had a format string. In that case, the visual level format string overrides the model level format string. If you change the aggregation on a field, which invalidates a previously set visual level format string, the format string is removed. Visual level format strings for fields persist for fields, but not for visual calculations. If you set a visual level format string on a field and then remove and readd that field to the same visual, the visual level format string is reinstated. In contrast, for a visual calculation, the format string isn't reinstated.
- **Element**. Set a format string for data labels and for specific elements of the new card and the new slicer visuals. Any format string you set here overrides the format string set on the visual and model level.

These levels are hierarchical, with the model level as the lowest level and the element level as the highest. A format string defined on a column, measure, or visual calculation on a higher level overrides what was defined on a lower level.

Since visual calculations aren't in the model, they can't have a format string set on the model level but can have one on the visual or element level. Measures and columns can have format strings on all three levels:

| **Level** | **Impacts** | **Available for**|
| --- | --- | --- |
| Element | Selected element of the selected visual | Measures, Columns, Visual Calculations |
| Visual | Selected visual | Measures, Columns, Visual Calculations |
| Model | All visuals, all pages, all reports on the same model | Measures, Columns |

:::image type="content" source="media/desktop-custom-format-strings/custom-format-strings-levels.png" alt-text="Diagram showing the three levels of format strings available (model, visual, element). It shows that visual calculations can only have visual and element level format strings, while measures and columns can have format strings on all levels." lightbox="media/desktop-custom-format-strings/custom-format-strings-levels-larger.png":::

The element level format string is only available to specific visuals and data labels at this time.

## How to use custom format strings

To use custom format strings, first decide which level you want to work on: model, visual, or element.

### Common format string examples

Here are some commonly used format strings to get you started.

> [!IMPORTANT]
> **Before using these examples:** The new card visual and visual-level formatting currently require .NET syntax, while model-level and element-level formatting use VBA syntax. Numeric formats (like `#,##0`) work the same in both, but date and time formats differ. Also, you must set **Display units** to **None** on the new card visual, or you'll see K/M/B suffixes regardless of your format string. See [Troubleshooting unwanted automatic scaling](#troubleshooting-unwanted-automatic-scaling-k-m-b-suffixes).

#### Numeric formats (work at all levels)

| Format string | Example input | Example output | Description |
|---------------|---------------|----------------|-------------|
| `#,##0` | 1234567 | 1,234,567 | Number with thousands separator, no decimals |
| `#,##0.00` | 1234.5 | 1,234.50 | Number with thousands separator, two decimals |
| `0` | 1234.56 | 1235 | Whole number, no thousands separator |
| `00000` | 42 | 00042 | Fixed-width with leading zeros (for example, ID numbers) |
| `0%` | 0.156 | 16% | Percentage, no decimals |
| `0.0%` | 0.156 | 15.6% | Percentage, one decimal |
| `$#,##0.00` | 1234.5 | $1,234.50 | Currency with two decimals |
| `€#,##0.00` | 1234.5 | €1,234.50 | Currency with Euro symbol |
| `#,##0.00;(#,##0.00)` | -1234.5 | (1,234.50) | Negative numbers in parentheses |
| `#,##0.00;-#,##0.00;"Zero"` | 0 | Zero | Custom text for zero values |
| `0.00" units"` | 42.5 | 42.50 units | Number with custom suffix |
| `0.0" °C"` | 23.4 | 23.4 °C | Number with degree symbol |
| `0.00E+00` | 1234567 | 1.23E+06 | Scientific notation |

#### Date and time formats (VBA syntax for model level)

Use these formats when applying custom format strings at the **model level** in the Properties pane.

| Format string | Example input | Example output | Description |
|---------------|---------------|----------------|-------------|
| `m/d/yyyy` | 1/15/2025 | 1/15/2025 | Date with numeric month |
| `mmm d, yyyy` | 1/15/2025 | Jan 15, 2025 | Date with abbreviated month |
| `mmmm d, yyyy` | 1/15/2025 | January 15, 2025 | Date with full month name |
| `dddd, mmmm d` | 1/15/2025 | Wednesday, January 15 | Full day and month names |
| `h:nn AM/PM` | 14:30 | 2:30 PM | 12-hour time format |
| `hh:nn:ss` | 14:30:05 | 14:30:05 | 24-hour time with seconds |

#### Date and time formats (.NET syntax for visual level)

Use these formats when applying custom format strings at the **visual level** (for example, on the new card visual). 

> [!NOTE]
> Uppercase `M` = month, lowercase `m` = minutes.

| Format string | Example input | Example output | Description |
|---------------|---------------|----------------|-------------|
| `M/d/yyyy` | 1/15/2025 | 1/15/2025 | Date with numeric month |
| `MMM d, yyyy` | 1/15/2025 | Jan 15, 2025 | Date with abbreviated month |
| `MMMM d, yyyy` | 1/15/2025 | January 15, 2025 | Date with full month name |
| `dddd, MMMM d` | 1/15/2025 | Wednesday, January 15 | Full day and month names |
| `h:mm tt` | 14:30 | 2:30 PM | 12-hour time format |
| `HH:mm:ss` | 14:30:05 | 14:30:05 | 24-hour time with seconds |

> [!NOTE]
> **New card and other visuals:** If your custom format doesn't appear as expected (for example, you see `12K` instead of `11,732`), the visual's **Display units** setting is likely set to **Auto**. Change **Display units** to **None** before applying your custom format string. This change is especially common with new card visuals, data labels, and slicers. For more information, see [Troubleshooting unwanted automatic scaling](#troubleshooting-unwanted-automatic-scaling-k-m-b-suffixes).

### Add a model level format string

To create custom format strings in the model, select the field in the **Modeling** view, and then select the dropdown arrow under **Format** in the **Properties** pane.

:::image type="content" source="media/desktop-custom-format-strings/custom-format-strings-02.png" alt-text="Screenshot of the Properties pane, highlighting the Format menu.":::

When you select **Custom** from the **Format** dropdown menu, you see a list of commonly used format strings.

:::image type="content" source="media/desktop-custom-format-strings/custom-format-strings-03.png" alt-text="Screenshot of the Formatting menu, highlighting Custom.":::

### Add a visual level format string

To create a visual level format string, first add the field or [visual calculation](../transform-model/desktop-visual-calculations-overview.md) to your visual. Then, with your visual selected, open the format pane and go to the **General** section of the format pane. Find the **Format data** settings and configure the format string there:

:::image type="content" source="media/desktop-custom-format-strings/custom-format-strings-visual-level-format-string.png" alt-text="Screenshot of the Format pane for a visual, showing the Data format settings in the General section.":::

> [!NOTE]
> For now, you need to enter a [.NET format string](/dotnet/standard/base-types/formatting-types#format-strings-and-net-types) instead of a [VBA format string](#supported-custom-format-syntax). This is a temporary problem that will be resolved in a future release.

### Add an element level format string

To create an element level format string, open the format pane and find the format string sections for the element you want to set the format on. Keep in mind that not all elements support format strings. Also, element-level **Display units** can still apply automatic K/M/B scaling unless you set them to **None**. To set a format string on a data label, open the **Visual** section of the format pane, set **Data Labels** > **Value** > **Display units** to custom and enter the format code:

:::image type="content" source="media/desktop-custom-format-strings/custom-format-strings-element-level-format-string.png" alt-text="Screenshot of the Format pane for a visual, showing the Value format settings for Data Labels in the Visual section.":::

## Supported custom format syntax

Custom format strings follow the VBA style syntax, common to Excel and other Microsoft products, but they don't support all syntax used in other products.

> [!NOTE]
> Visual level format strings currently use **.NET** date/time and numeric format tokens (temporary limitation). This means casing matters (`M` = month, `m` = minute). Model- and element-level custom format strings use the VBA-style tokens documented in the following tables. This limitation will be removed in a future release so all levels use a unified syntax.

### Troubleshooting unexpected month or minute values

If a custom format shows minutes where you expected a month:

1. Confirm whether you applied the format at the visual level (currently .NET syntax).
1. If so, change `m` to `M` for month, or move the custom format string to the model level to use VBA-style `m`.
1. Use `nn` for minutes in VBA-style contexts to avoid confusion with month symbols.

### Troubleshooting unwanted automatic scaling (K, M, B suffixes)
>
> [!NOTE]
> This section addresses the most common issue users encounter when custom format strings appear not to work, especially with the **new card** visual.
If your visual shows a suffix such as K (thousands), M (millions), or B (billions) even though you set a custom number format (for example `#.###` or `#,##0`), the suffix usually isn't coming from the custom format string. The **Display units** (autoscaling) setting on the visual or element applies it.

**Typical causes:**

- Display units set to **Auto** (default) for a card, KPI, gauge, new card, slicer value, or data label.
- Element-level formatting applied, but element’s Display units still autoscale.
- A visual calculation or aggregation readded after changing format (Display units reverted to Auto).

**How to remove the K/M/B suffix:**

1. Select the visual.
1. Open the **Format** pane (paint roller icon).
1. Locate the **Display units** setting based on your visual type:

   | Visual type | Path to Display units |
   |-------------|----------------------|
   | **New card** | **Visual** > **Callout values** > **Values** > **Display units** |
   | **Card (classic)** | **Visual** > **Callout value** > **Display units** |
   | **KPI** | **Visual** > **Callout value** > **Display units** |
   | **Gauge** | **Visual** > **Callout value** > **Display units** |
   | **Data labels** (bar, column, line charts) | **Visual** > **Data labels** > **Values** > **Display units** |
   | **Slicer** | **Visual** > **Slicer settings** > **Options** > **Display units** |
   | **Table/Matrix values** | **General** > **Data format** > (select field) > **Display units** |

1. Change **Display units** from **Auto** to **None**.
1. Apply or confirm your custom format string (for example `#,##0`, `0`, `0.0`).

**If still present:**

- Check for an element-level override (for example data label settings) also set to Auto.
- Confirm you didn't embed a literal "K" in the custom format (for example `0" K"`).  
- For model-level measures, ensure no DAX logic already scales the value (for example dividing by 1,000).

**Example comparison:**

| Setting | Display units | Custom format | Result |
| --- | --- | --- | --- |
| Card visual (default) | Auto | `#,##0` | `12K` (scaled) |
| Card visual (changed) | None | `#,##0` | `11,732` |
| Data label (clustered column) | Auto | `0` | `12K` |
| Data label (clustered column) | None | `0` | `11,732` |
| New card (Value formatting) | Auto | `0.0" °C"` | `23.4K °C` (undesired) |
| New card (Value formatting) | None | `0.0" °C"` | `23.4 °C` |

> [!TIP]  
> If you want custom *abbreviations* but not the default K/M/B logic, keep **Display units: None** and append literal text in the format string (for example `0.0"k"`). This approach preserves raw numeric precision control.

> [!NOTE]  
> Dynamic scaling based on value size (for example, switching between no suffix, K, and M) requires a measure returning text (for example, using `FORMAT()` or conditional logic) or a dynamic format string measure. Static custom format strings alone don't provide conditional suffix logic.

The following tables define the syntax supported in Power BI.

### Supported date symbols (VBA-style syntax used by model and element level)

The following symbols apply to custom format strings that use the VBA-style (Excel-like) syntax.

> [!IMPORTANT]  
> Visual-level custom format strings temporarily require **.NET** format tokens (see note that follows). In .NET custom date/time formats, uppercase `M` represents month and lowercase `m` represents minutes. In VBA-style formats (used at model and element levels here), lowercase `m` represents month. This difference is a common source of confusion.

| Symbol | Meaning or output |
| --- | --- |
| d | Day of month without leading zero (1–31). |
| dd | Day of month with leading zero (01–31). |
| m | Month number without leading zero (1–12). If immediately after `h` or `hh`, it's interpreted as minutes (see “Minute symbols” that follow). |
| mm | Month number with leading zero (01–12). If immediately after `h` or `hh`, it's interpreted as minutes with leading zero (00–59). |
| mmm | Abbreviated month name (Jan–Dec). (Hijri month names have no abbreviations.) |
| mmmm | Full month name (January–December). |
| yy | Two‑digit year (00–99). |
| yyyy | Four‑digit year (0001–9999). |

> [!NOTE]  
> If you see unexpected minute values where you expect months, confirm whether you entered the format in a visual-level setting (currently .NET style) or a model and element level setting (VBA style).

### Supported time symbols (VBA-style)

| Symbol | Meaning or output |
| --- | --- |
| h | Hour without leading zero (0–23). When combined with AM/PM, represents 1–12. |
| hh | Hour with leading zero (00–23). When combined with AM/PM, represents 01–12. |
| n | Minute without leading zero (0–59). |
| nn | Minute with leading zero (00–59). |
| m / mm | ALSO minutes (0–59 / 00–59) **only when they immediately follow `h` or `hh`**. Otherwise they're treated as month symbols (see date symbols). |
| s | Second without leading zero (0–59). |
| ss | Second with leading zero (00–59). |

> [!TIP]  
> Use `n` and `nn` for minutes to avoid confusion with `m` and `mm` month symbols.

### Date and time examples

Assume the sample timestamp: 2025-09-04 15:07:08 (September 4, 2025, 3:07:08 PM).

| Format string | Context (VBA-style versus .NET) | Expected output | Notes |
| --- | --- | --- | --- |
| m/d/yy | VBA-style (model) | 9/4/25 | Month as number; day no leading zero. |
| mm/dd/yyyy | VBA-style (model) | 09/04/2025 | Leading zeros. |
| mmm d, yyyy | VBA-style (model) | Sep 4, 2025 | Abbreviated month. |
| mmmm d | VBA-style (model) | September 4 | Full month name. |
| h:nn:ss | VBA-style (model) | 15:07:08 | Uses `nn` to avoid month ambiguity. |
| h:m:s | VBA-style (model) | 15:7:8 | `m` interpreted as minutes (follows `h`). |
| m | VBA-style (model) | 9 | Standalone month number. |
| M | .NET visual-level | 9 | In .NET, uppercase M = month. |
| m | .NET visual-level | 07 | In .NET, lowercase m = minutes. |
| mm/dd | Mixed misuse (.NET visual-level) | 07/04 | Shows minutes/day if user expected month/day—source of confusion. |

> [!NOTE]  
> If you see a minute value (like 07) where you expected a month (like 09), you likely entered a .NET-style format (visual level) thinking it was VBA-style. Adjust the casing (`M` vs `m`) or move the formatting to the model level.

### Add Unicode or special symbols (degree, currency, superscripts)

Custom format strings don't support hex or escape sequences (for example, `\u00B0`, `0xB0`, or `&#176;`). To include a symbol, insert (paste or type) the actual Unicode character inside a quoted literal or, for some numeric formats, use an unquoted trailing literal.

| Goal | Format string (model / VBA style) | Output example | Notes |
| --- | --- | --- | --- |
| Append Celsius with a space | `0.0" °C"` | `23.4 °C` | Space is inside quotes so it's preserved. |
| Add percent text (not automatic scaling) | `0.00" pct"` | `12.34 pct` | Different from `%` placeholder (which multiplies by 100). |
| Show thousands with KB suffix | `0" KB"` | `512 KB` | Literal "KB". |
| Currency with explicit symbol | `#,##0.00" €"` | `1,234.00 €` | Prefer locale-based model-level currency if dynamic symbol needed. |
| Microseconds label | `0" µs"` | `15 µs` | Paste µ (U+00B5). |
| Degree without trailing unit | `0"°"` | `90°` | No space added. |
| Superscript squared | `0" m²"` | `25 m²` | Paste `²` (U+00B2). |

> [!TIP]  
> To insert a symbol:
>
> - Windows: Press `Win + .` (emoji/symbol panel) or use an ALT code (for example, hold `Alt`, type `0176` on numeric keypad for °).  
> - Copy/paste from a character map.  
> Once the literal is in the format string, it's treated as plain text.

> [!IMPORTANT]  
> Power BI doesn't translate backslash (`\`), `\uXXXX`, or `0xNN` escape patterns to Unicode in custom format strings. Use the character itself. For visual-level (.NET) formats, include the actual character inside quotes (for example, `0.0" °C"`). A backslash only escapes the next character; it doesn't create Unicode sequences.

> [!NOTE]  
> For dynamic symbol logic (for example, switching °C / °F based on slicer selection) use a DAX measure returning a text value, or a dynamic format string measure rather than only a static custom format string.

You can see an [example](/office/vba/language/reference/user-interface-help/format-function-visual-basic-for-applications#example) of how to format custom value strings.

A user-defined format expression for numbers can have one to three sections separated by semicolons. If you include semicolons with nothing between them, the missing section doesn't display, and you see `""`. If you don't specify the semicolon, it uses the positive format.

Here are examples of different formats for different value strings:

|Values   | Format String | Format String  | Format String  | Format String  |
| --- | --- | --- | --- | --- |
| |**0.00;-0.0;"Zero"** | **0.00;;** | **0.00;-0.0;** | **0.00;** |
| **-1.234** | -1.2 | "" | -1.2 | "" |
| **0** | "Zero" | "" | "" | 0.00 |
| **1.234** | 1.23 | 1.23 | 1.23 | 1.23 |

The following table identifies the predefined **named date and time formats**:

| **Format name** | **Description** |
| --- | --- |
| **General Date** | Display a date and time, for example, 4/3/93 05:34 PM. If there's no fractional part, display only a date, for example, 4/3/93. If there's no integer part, display time only, for example, 05:34 PM. Date display is determined by your system settings. |
| **Long Date** | Display a date according to your system's long date format. |
| **Short Date** | Display a date using your system's short date format. |
| **Long Time** | Display a time using your system's long time format; includes hours, minutes, seconds. |
| **Short Time** | Display a time using the 24-hour format, for example, 17:45. |

The following table identifies the predefined **named numeric formats**:

| **Format name** | **Description** |
| --- | --- |
| **General Number** | Display number with no thousands separator. |
| **Currency** | Display number with a thousands separator. Display two digits after the decimal separator. Output is based on system locale settings. |
| **Fixed** | Display at least one digit before and two digits after the decimal separator. |
| **Standard** | Display number with a thousands separator, at least one digit before and two digits after the decimal separator. |
| **Percent** | Display number multiplied by 100 with a percent sign ( **%** ). Always display two digits after the decimal separator. |
| **Scientific** | Use standard scientific notation. |

### Other date and time formatting characters

The following table describes supplemental characters that apply to date and time formatting (not already covered):

| Character | Description |
| --- | --- |
| : | Time separator (locale-specific). |
| / | Date separator (locale-specific). |
| tt | AM/PM designator (12-hour clock, uppercase). |

> [!NOTE]  
> Other day, month, year, hour, minute, and second tokens already defined follow VBA-style semantics at model and element level, and .NET semantics (case-sensitive) at visual level.

The following table identifies characters you can use to create **user-defined number formats**.

| Character | Description |
| --- | --- |
| None | Display the number with no formatting. |
| ( **0** ) | Digit placeholder. Display a digit or a zero. If the expression has a digit in the position where the 0 appears in the format string, display it. Otherwise, display a zero in that position. If the number has fewer digits than there are zeros (on either side of the decimal) in the format expression, display leading or trailing zeros. If the number has more digits than there are zeros after the decimal separator, round the number to as many decimal places as there are zeros. If the number has more digits than there are zeros before the decimal separator, display the extra digits without modification. |
| ( **#** ) | Digit placeholder. Display a digit or nothing. If the expression has a digit in the position where the # appears in the format string, display it; otherwise, display nothing in that position. This symbol works like the zero-digit placeholder. However, leading and trailing zeros don't display if the number has the same or fewer digits as the # characters on either side of the decimal separator in the format expression. |
| ( **.** ) | Decimal placeholder. In some locales, a comma is used as the decimal separator. The decimal placeholder determines how many digits are displayed before and after the decimal separator. If the format expression contains only number signs to the left of this symbol, numbers smaller than one begin with a decimal separator. To display a leading zero displayed with fractional numbers, use 0 as the first-digit placeholder to the left of the decimal separator. The actual character used as a decimal placeholder in the formatted output depends on the Number Format recognized by your system. |
| (**%)** | Percentage placeholder. The expression is multiplied by 100. The percent character ( **%** ) is inserted in the position where it appears in the format string. |
| ( **,** ) | Thousands separators. In some locales, a period is used as a thousands separator. The thousands separator separates thousands from hundreds within a number that has four or more places to the left of the decimal separator. Standard use of the thousands separator is specified if the format contains a thousands separator surrounded by digit placeholders ( **0**  or  **#** ). Two adjacent thousands separators or a thousands separator immediately to the left of the decimal separator (whether or not a decimal is specified) means "scale the number by dividing it by 1,000, rounding as needed." For example, you can use the format string "##0,," to represent 100 million as 100. Numbers smaller than one million are displayed as 0. Two adjacent thousands separators in any position other than immediately to the left of the decimal separator are treated simply as specifying the use of a thousands separator. The actual character used as the thousands separator in the formatted output depends on the Number Format recognized by your system. |
| ( **:** ) | Time separator. In some locales, other characters might be used to represent the time separator. The time separator separates hours, minutes, and seconds when time values are formatted. The actual character used as the time separator in formatted output is determined by your system settings. |
| ( **/** ) | Date separator. In some locales, other characters might be used to represent the date separator. The date separator separates the day, month, and year when date values are formatted. The actual character used as the date separator in formatted output is determined by your system settings. |
| ( **E- E+ e- e+** ) | Scientific format. If the format expression contains at least one digit placeholder ( **0**  or  **#** ) after `E-`, `E+`, `e-`, or `e+`, the number is displayed in scientific format and `E` or `e` is inserted between the number and its exponent. The number of digit placeholders determines the number of digits in the exponent. Use `E-` or `e-` to place a minus sign next to negative exponents. Use `E+` or `e+` to place a minus sign next to negative exponents and a plus sign next to positive exponents. |
| - **+ $**  ( ) | Display these literal characters. Any other Unicode character (°, €, µ, ², and so on) can be included by typing or pasting it inside double quotes (for example `0.0" °C"`). Use a backslash only to escape the next character if it would otherwise be interpreted (it doesn't introduce hex or `\u` escapes). |
| ( **\\** ) | Display the next character in the format string. To display a character that has special meaning as a literal character, precede it with a backslash (\\). The backslash itself isn't displayed. Using a backslash is the same as enclosing the next character in double quotation marks. To display a backslash, use two backslashes (\\\\). Date-formatting and time-formatting characters (a, c, d, h, m, n, p, q, s, t, w, /, and :) can't be displayed as literal characters, the numeric-formatting characters (#, 0, %, E, e, comma, and period), and the string-formatting characters (@, &, <, >, !). |
| ("ABC") | Display the string inside the double quotation marks (" "). |

## Considerations and limitations

- You can't set a custom format string for fields that are of type string or Boolean.

## Related content

For more information, see:

- [VBA format strings](/office/vba/language/reference/user-interface-help/format-function-visual-basic-for-applications#example)
- [Measures in Power BI Desktop](../transform-model/desktop-measures.md)
- [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)
- [Conditional formatting in tables](desktop-conditional-table-formatting.md)
