---
title: Use custom format strings in Power BI Desktop
description: Learn how to customize format strings in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/07/2021
LocalizationGroup: Create reports
---
# Use custom format strings in Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

With custom format strings in **Power BI Desktop**, you can customize how fields appear in visuals, and make sure your reports look just the way you want them to look.

![Screenshot shows Power B I desktop with a custom format selected. ](media/desktop-custom-format-strings/custom-format-strings-01.png)


## How to use custom format strings

To create custom format strings, select the field in the **Modeling** view, and then select the dropdown arrow under **Format** in the **Properties** pane.

![Custom from the Format drop down](media/desktop-custom-format-strings/custom-format-strings-02.png)

Once you've selected **Custom** from the **Format** drop down menu, you can select from a list of commonly used format strings. 

![Screenshot shows details of the custom format.](media/desktop-custom-format-strings/custom-format-strings-03.png)


## Supported custom format syntax

Custom format strings follow the VBA style syntax, common to Excel and other Microsoft products, but do not support all syntax used in other products. 

The following tables define the syntax supported in Power BI.


The following table shows supported **Date symbols**:

| **Symbol** | **Range** |
| --- | --- |
| _d_ | 1-31 (Day of month, with no leading zero) |
| _dd_ | 01-31 (Day of month, with a leading zero) |
| _m_ | 1-12 (Month of year, with no leading zero, starting with January = 1) |
| _mm_ | 01-12 (Month of year, with a leading zero, starting with January = 01) |
| _mmm_ | Displays abbreviated month names (Hijri month names have no abbreviations) |
| _mmmm_ | Displays full month names |
| _yy_ | 00-99 (Last two digits of year) |
| _yyyy_ | 100-9999 (Three- or Four-digit year) |

The following table shows supported **Time symbols**:

| **Symbol** | **Range** |
| --- | --- |
| _h_ | 0-23 (1-12 with &quot;AM&quot; or &quot;PM&quot; appended) (Hour of day, with no leading zero) |
| _hh_ | 00-23 (01-12 with &quot;AM&quot; or &quot;PM&quot; appended) (Hour of day, with a leading zero) |
| _n_ | 0-59 (Minute of hour, with no leading zero) |
| _nn_ | 00-59 (Minute of hour, with a leading zero) |
| _m_ | 0-59 (Minute of hour, with no leading zero). Only if preceded by _h_ or _hh_ |
| _mm_ | 00-59 (Minute of hour, with a leading zero). Only if preceded by _h_ or _hh_ |
| _s_ | 0-59 (Second of minute, with no leading zero) |
| _ss_ | 00-59 (Second of minute, with a leading zero) |


You can see an [example](/office/vba/language/reference/user-interface-help/format-function-visual-basic-for-applications#example) of how to format custom value strings.

A user-defined format expression for numbers can have from one to three sections separated by semicolons. If you include semicolons with nothing between them, the missing section will not be displayed (it will be &quot;&quot;). If the semi-colon is not specified, it will use the positive format.

Here are examples of different formats for different value strings:

|Values   | Format String | Format String  | Format String  | Format String  |
| --- | --- | --- | --- | --- |
| |**0.00;-0.0;&quot;Zero&quot;** | **0.00;;** | **0.00;-0.0;** | **0.00;** |
| **-1.234** | -1.2 | &quot;&quot; | -1.2 | &quot;&quot; |
| **0** | &quot;Zero&quot; | &quot;&quot; | &quot;&quot; | 0.00 |
| **1.234** | 1.23 | 1.23 | 1.23 | 1.23 |

The following table identifies the predefined **named date and time formats**:

| **Format name** | **Description** |
| --- | --- |
| **General Date** | Display a date and/or time, for example, 4/3/93 05:34 PM. If there is no fractional part, display only a date, for example, 4/3/93. If there is no integer part, display time only, for example, 05:34 PM. Date display is determined by your system settings. |
| **Long Date** | Display a date according to your system&#39;s long date format. |
| **Short Date** | Display a date using your system&#39;s short date format. |
| **Long Time** | Display a time using your system&#39;s long time format; includes hours, minutes, seconds. |
| **Short Time** | Display a time using the 24-hour format, for example, 17:45. |

Named numeric formats

The following table identifies the predefined **named numeric formats**:

| **Format name** | **Description** |
| --- | --- |
| **General Number** | Display number with no thousand separator. |
| **Currency** | Display number with thousand separator, if appropriate; display two digits to the right of the decimal separator. Output is based on system locale settings. |
| **Fixed** | Display at least one digit to the left and two digits to the right of the decimal separator. |
| **Standard** | Display number with thousand separator, at least one digit to the left and two digits to the right of the decimal separator. |
| **Percent** | Display number multiplied by 100 with a percent sign ( **%** ) appended to the right; always display two digits to the right of the decimal separator. |
| **Scientific** | Use standard scientific notation. |



The following table identifies characters you can use to create **user-defined date/time formats**.

| **Character** | **Description** |
| --- | --- |
| ( **:** ) | Time separator. In some locales, other characters may be used to represent the time separator. The time separator separates hours, minutes, and seconds when time values are formatted. The actual character used as the time separator in formatted output is determined by your system settings. |
| ( **/** ) | Date separator. In some locales, other characters may be used to represent the date separator. The date separator separates the day, month, and year when date values are formatted. The actual character used as the date separator in formatted output is determined by your system settings. |
| d | Display the day as a number without a leading zero (1–31). |
| dd | Display the day as a number with a leading zero (01–31). |
| ddd | Display the day as an abbreviation (Sun–Sat). Localized. |
| dddd | Display the day as a full name (Sunday–Saturday). Localized. |
| m | Display the month as a number without a leading zero (1–12). If m immediately follows h or hh, the minute rather than the month is displayed. |
| mm | Display the month as a number with a leading zero (01–12). If m immediately follows h or hh, the minute rather than the month is displayed. |
| mmm | Display the month as an abbreviation (Jan–Dec). Localized. |
| mmmm | Display the month as a full month name (January–December). Localized. |
| yy | Display the year as a 2-digit number (00–99). |
| yyyy | Display the year as a 4-digit number (100–9999). |
| h | Display the hour as a number without a leading zero (0–23). |
| hh | Display the hour as a number with a leading zero (00–23). |
| n | Display the minute as a number without a leading zero (0–59). |
| nn | Display the minute as a number with a leading zero (00–59). |
| s | Display the second as a number without a leading zero (0–59). |
| ss | Display the second as a number with a leading zero (00–59). |
| AM/PM | Use the 12-hour clock and display an uppercase AM with any hour before noon; display an uppercase PM with any hour between noon and 11:59 P.M. |

The following table identifies characters you can use to create **user-defined number formats**.

| **Character** | **Description** |
| --- | --- |
| None | Display the number with no formatting. |
| ( **0** ) | Digit placeholder. Display a digit or a zero. If the expression has a digit in the position where the 0 appears in the format string, display it; otherwise, display a zero in that position. If the number has fewer digits than there are zeros (on either side of the decimal) in the format expression, display leading or trailing zeros. If the number has more digits to the right of the decimal separator than there are zeros to the right of the decimal separator in the format expression, round the number to as many decimal places as there are zeros. If the number has more digits to the left of the decimal separator than there are zeros to the left of the decimal separator in the format expression, display the extra digits without modification. |
| ( **#** ) | Digit placeholder. Display a digit or nothing. If the expression has a digit in the position where the # appears in the format string, display it; otherwise, display nothing in that position. This symbol works like the 0 digit placeholder, except that leading and trailing zeros aren&#39;t displayed if the number has the same or fewer digits than there are # characters on either side of the decimal separator in the format expression. |
| ( **.** ) | Decimal placeholder. In some locales, a comma is used as the decimal separator. The decimal placeholder determines how many digits are displayed to the left and right of the decimal separator. If the format expression contains only number signs to the left of this symbol, numbers smaller than 1 begin with a decimal separator. To display a leading zero displayed with fractional numbers, use 0 as the first digit placeholder to the left of the decimal separator. The actual character used as a decimal placeholder in the formatted output depends on the Number Format recognized by your system. |
| (**%)** | Percentage placeholder. The expression is multiplied by 100. The percent character ( **%** ) is inserted in the position where it appears in the format string. |
| ( **,** ) | Thousand separator. In some locales, a period is used as a thousand separator. The thousand separator separates thousands from hundreds within a number that has four or more places to the left of the decimal separator. Standard use of the thousand separator is specified if the format contains a thousand separator surrounded by digit placeholders ( **0**  or  **#** ). Two adjacent thousand separators or a thousand separator immediately to the left of the decimal separator (whether or not a decimal is specified) means &quot;scale the number by dividing it by 1000, rounding as needed.&quot; For example, you can use the format string &quot;##0,,&quot; to represent 100 million as 100. Numbers smaller than 1 million are displayed as 0. Two adjacent thousand separators in any position other than immediately to the left of the decimal separator are treated simply as specifying the use of a thousand separator. The actual character used as the thousand separator in the formatted output depends on the Number Format recognized by your system. |
| ( **:** ) | Time separator. In some locales, other characters may be used to represent the time separator. The time separator separates hours, minutes, and seconds when time values are formatted. The actual character used as the time separator in formatted output is determined by your system settings. |
| ( **/** ) | Date separator. In some locales, other characters may be used to represent the date separator. The date separator separates the day, month, and year when date values are formatted. The actual character used as the date separator in formatted output is determined by your system settings. |
| ( **E- E+ e- e+** ) | Scientific format. If the format expression contains at least one digit placeholder ( **0**  or  **#** ) to the right of E-, E+, e-, or e+, the number is displayed in scientific format and E or e is inserted between the number and its exponent. The number of digit placeholders to the right determines the number of digits in the exponent. Use E- or e- to place a minus sign next to negative exponents. Use E+ or e+ to place a minus sign next to negative exponents and a plus sign next to positive exponents. |
| **- + $**  ( ) | Display a literal character. To display a character other than one of those listed, precede it with a backslash (\) or enclose it in double quotation marks (&quot; &quot;). |
| ( **\** ) | Display the next character in the format string. To display a character that has special meaning as a literal character, precede it with a backslash (\). The backslash itself isn&#39;t displayed. Using a backslash is the same as enclosing the next character in double quotation marks. To display a backslash, use two backslashes (\\). Examples of characters that can&#39;t be displayed as literal characters are the date-formatting and time-formatting characters (a, c, d, h, m, n, p, q, s, t, w, /, and :), the numeric-formatting characters (#, 0, %, E, e, comma, and period), and the string-formatting characters (@, &amp;, \&lt;, \&gt;, and !). |
| (&quot;ABC&quot;) | Display the string inside the double quotation marks (&quot; &quot;). |


## Next steps
You might also be interested in the following articles:

* [VBA format strings](/office/vba/language/reference/user-interface-help/format-function-visual-basic-for-applications#example)
* [Measures in Power BI Desktop](../transform-model/desktop-measures.md)
* [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)
* [Conditional formatting in tables](desktop-conditional-table-formatting.md)