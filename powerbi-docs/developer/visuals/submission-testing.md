---
title: Testing submissions of Power BI custom visuals
description: Learn how to perform test cases that your Power BI custom visual must pass before publishing it on AppSource.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/09/2024
#customer intent: As a Power BI visual developer, I want to learn how to test my custom visual before submitting it for publication so that it meets the required test cases.
---

# Test a Power BI custom visual before submitting it for publication

Before you publish your visual to [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals), it must pass the tests listed in this article. It's important to test your visual before you submit it. If your visual doesn't pass the required test cases, it will be rejected.

For more information about the publishing process, see [Publish Power BI visuals to Partner Center](./office-store.md).

## Testing a new version of a published visual

By default, Power BI loads the latest published version of the visual from AppSource, even if you import the visual from a local file.
Version numbers consist of four digits in the following format: `X.X.X.X`.

When testing or updating a visual that's already published, make sure you're using the correct version of the visual **without changing the GUID**. To override the AppSource version with a local file version, enable Developer mode in either Power BI Desktop or Power BI service.

>[!IMPORTANT]
>When testing or debugging a new version of a visual that's available in AppSource, **do not change the GUID of the visual**. Use Developer mode instead.

### Enable Developer mode in Power BI Desktop

In Power BI Desktop, Developer mode is valid for only one session. If you open a new Power BI Desktop instance for testing, you need to enable Developer mode again.

To enable Developer mode, follow these steps:

1. Open Power BI Desktop.
2. Select **File** > **Options and settings**.
3. Select **Options**.
4. In the Options window, from the CURRENT FILE list, select **Report settings**.
5. In Developer Mode, select the **Turn on developer mode for this session** option.

:::image type="content" source="media/submission-testing/developer-mode-desktop.png" alt-text="Screenshot of Developer mode in Power BI Desktop.":::

### Enable Developer mode in Power BI service

In Power BI service, Developer mode is kept per user account. Whenever a user loads the package from the local file, Power BI will ignore the AppSource version of the visual.

To enable Developer mode in Power BI service, follow the instructions in [Set up Power BI service for developing a visual](environment-setup.md#enable-developer-mode).

## General test cases

Verify that your visual passes the general test cases.

| Test case | Expected results
| --------- | ----------------
| Create a **Stacked column chart** with **Category** and **Value**. Convert it to your visual and then back to column chart. | No error appears after these conversions. |
| Create a **Gauge** with three measures. Convert it to your visual and then back to **Gauge**. | No error appears after these conversions. |
| Make selections in your visual. | Other visuals reflect the selections. |
| Select elements in other visuals. | Your visual shows filtered data according to selection in other visuals. |
| Check min/max **dataViewMapping** conditions. | Field buckets can accept multiple fields, a single field, or are determined by other buckets. The min/max **dataViewMapping** conditions must be correctly set up in the capabilities of your visual. |
| Remove all fields in different orders. | Visual cleans up properly as fields are removed in arbitrary order. There are no errors in the console or the browser. |
| Open the **Format** pane with each possible bucket configuration. | This test doesn't trigger null reference exceptions. |
| Filter data using the **Filter** pane at the visual, page, and report level. | Tooltips are correct after applying filters. Tooltips show the filtered value. |
| Filter data using a **Slicer**. | Tooltips are correct after applying filters. Tooltips show the filtered value. |
| Filter data using a published visual. For instance, select a pie slice or a column. | Tooltips are correct after applying filters. Tooltips show the filtered value. |
| If cross-filtering is supported, verify that filters work correctly. | Applied selection filters other visuals on this page of the report. |
| Select with <kbd>Ctrl</kbd>, <kbd>Alt</kbd>, and <kbd>Shift</kbd> keys. | No unexpected behaviors appear. |
| Change the **View Mode** to **Actual size**, **Fit to page**, and **Fit to width**. | Mouse coordinates are accurate. |
| Resize your visual. | Visual reacts correctly to resizing. |
| Set the report size to the minimum. | There's no display errors. |
| Ensure scroll bars work correctly. | Scroll bars should exist, if necessary. Check scroll bar sizes. Scroll bars shouldn't be too wide or tall. Position and size of scroll bars must be in accord with other elements of your visual. Verify that scroll bars are needed for different sizes of the visual. |
| Pin your visual to a **Dashboard**. | The visual displays properly. |
| Add multiple versions of your visual to a single report page. | All versions of the visual display and operate properly. |
| Add multiple versions of your visual to multiple report pages. | All versions of the visual display and operate properly. |
| Switch between report pages. | The visual displays properly. |
| Test Reading view and Edit view for your visual. | All functions work correctly. |
| If your visual uses animations, add, change, and delete elements of your visual. | Animation of visual elements works correctly. |
| Open the **Property** pane. Turn properties on and off, enter custom text, stress the options available, and input bad data. | The visual responds correctly. |
| Save the report and reopen it. | All properties settings persist. |
| Switch pages in the report and then switch back. | All properties settings persist. |
| Test all functionality of your visual, including different options that the visual provides. | All displays and features work correctly. |
| Test all numeric, date, and character data types, as in the following tests. | All data is formatted properly. |
| Review formatting of tooltip values, axis labels, data labels, and other visual elements with formatting. | All elements are formatted correctly. |
| Verify that data labels use the format string. | All data labels are formatted correctly. |
| Switch automatic formatting on and off for numeric values in tooltips. | Tooltips display values correctly. |
| Test data entries with different types of data, including numeric, text, date-time, and different format strings from the model. Test different data volumes, such as thousands of rows, one row, and two rows. | All displays and features work correctly. |
| Provide bad data to your visual, such as null, infinity, negative values, and wrong value types. | All displays and features work correctly. |

## Optional browser testing

The AppSource team validates a visual on the most current Windows versions of Google Chrome, Microsoft Edge, and Mozilla Firefox browsers.
Optionally, test your visual in the following browsers.

| Test case | Expected results
| --------- | ----------------
| **Windows** |
| Google Chrome (previous version) | All displays and features work correctly. |
| Mozilla Firefox (previous version) | All displays and features work correctly. |
| Microsoft Edge (previous version) | All displays and features work correctly. |
| Microsoft Internet Explorer 11 (optional) | All displays and features work correctly. |
| **macOS** |
| Chrome (previous version) | All displays and features work correctly. |
| Firefox (previous version) | All displays and features work correctly. |
| Safari (previous version) | All displays and features work correctly. |
| **Linux** |
| Firefox (latest and previous versions) | All displays and features work correctly. |
| **Mobile iOS** |
| Apple Safari iPad (previous Safari version) | All displays and features work correctly. |
| Chrome iPad (latest Safari version) | All displays and features work correctly. |
| **Mobile Android** |
| Chrome (latest and previous versions) | All displays and features work correctly. |

## Desktop testing

Test your visual in the current version of [Power BI Desktop](https://powerbi.microsoft.com/desktop/).

| Test case | Expected results
| --------- | ----------------
| Test all features of your visual. | All displays and features work correctly. |
| Import, save, open a file, and publish to the Power BI web service by using the **Publish** button in Power BI Desktop. | All displays and features work correctly. |
| Change the numeric format string to have zero decimal places or three decimal places by increasing or decreasing the precision. | The visual displays correctly. |

## Performance testing

Your visual should perform at an acceptable level. Use developer tools to validate its performance. Don't rely on visual cues and the console time logs.

| Test case | Expected results
| --------- | ----------------
| Create a visual with many visual elements. | The visual should perform well and not freeze the application. There should be no performance issues with elements such as animation speed, resizing, filtering, and selecting. Check out these [tips for optimal performance](performance-tips.md).

## Related content

* [Publish Power BI visuals to Partner Center](./office-store.md)
* [Get a Power BI visual certified](power-bi-custom-visuals-certified.md)
* [Performance tips for creating quality Power BI custom visuals](performance-tips.md)

**More questions?** [Ask the Power BI Community](https://community.powerbi.com/).
