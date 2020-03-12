---
title: Submission testing
description: This article describes main test cases should be passed by your visual before  publishing to AppSource
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 03/12/2019
---

# Submission testing

This article describes main test cases should be passed by your visual before  publishing to AppSource. You should check it before sending a submission.

 If visual fits the rules it should be published, otherwise it will be rejected.

## Test cases
Passed | Test case | Expected Results
------ | --------- | ----------------
 | Create a Stacked column chart with Category and Value, convert to your visual. Convert back to column chart. | No error should appear after these conversions. 
 | Create a Gauge with three measures and convert to your visual.  Convert back to Gauge.  | No error should appear after these conversions. 
 | Make selections in your visual.  | Other visuals should reflect the selections. 
 | Select elements in other visuals.  | Your visual should respond to these selections. Your visual should show filtered data according to selection in other visual. 
 | Some field buckets accept multiple fields, some accept only one, some are conditional based on other buckets.   | Make sure that min/max dataViewMapping conditions are correctly set up in visual's capabilities. 
 | Remove all fields in different orders.   | Visual should clean up properly as fields are removed in arbitrary order and there are no errors in the console of the browser. 
 | Open the Format Pane with each possible bucket configuration.   | Null reference exceptions should not be triggered. 
 | Filter data using the filter pane (visual, page, and report level), a Slicer and by using a first-party visual (click a pie slice or a column, etc.).   | Tooltips must be correct after applying different types of filters and properly show the filtered value. 
 | If cross-filtering is supported.  | Filter should work correctly. Applied selection should filter other visuals on this page of the report. 
 | Test Ctrl, Alt, Shift plus click.   | No unexpected behaviors should appear.  
 | Change the View type to Actual Size, Fit to Page, and Fit to Width.  | Mouse coordinates should be accurate. 
 | Resize the custom visual. to ensure everything reacts correctly to resize.   | Visual should react correctly to resize. 
 | Set the report size to minimal.  | There should be no display errors. 
 | Scrollbars should exist, if required.  | Ensure scrollbars work correctly. Check scrollbar sizes. Scrollbars should not be too wide or tall. Position and size of scrollbars must be accorded with other elements of your visual. Verify that scrollbars are actually needed for different sizes of the visual. 
 | Pin the visual to a Dashboard.  | The visual should display properly. 
 | Add multiple versions of the visual to a single report page.  | All versions of the visual should display and operate properly. 
 | Add multiple versions of the visual to multiple report pages.  | All versions of the visual should display and operate properly. 
 | Switch between pages.  | Verify that the visual is displayed correctly. 
 | Test the visual Reading mode and Edit mode.  | All functions should work correctly. 
 | If the visual uses animations test adding, changing, and deleting elements of your visual.  | Animation of visual elements works correctly. 
 | Open the property pane and turn properties on and off, type in custom text where applicable, stress the options available, and input bad data.  | The visual should respond correctly. 
 | Save the report and re-open it.  | All properties settings should be persisted. 
 | Switch pages in the report and then switch back.  | All properties settings should be persisted. 
 | Test all functionality of the visual including different options which the visual provides.  | All displays and features should work correctly. 
 | Test all numeric, date, and character data types.  | All data should be formatted properly. 
 | Tooltip values, axis labels, data labels and other visual elements, where values can be formatted,  | All data should be formatted properly. 
 | Data labels need to use the format string.  | All data labels are formatted correctly. 
 | Tooltips are not required to have formatted values.  | Tooltips display exact values. 
 | Test with a variety of different data types – numeric, text, date-time, different data volumes (thousands of rows, 1 row, 2 rows, etc.), and different format strings from the model.  | All displays and features should work correctly. 
 | Provide bad data to the visual (null, infinity, negative values, wrong value types, etc.).  | All displays and features should work correctly. 

## Browser Testing - Optional
Passed | Test case | Expected Results
------ | --------- | ----------------
 | **Windows** | 
 | Chrome (previous version) | All displays and features should work correctly.
 | Firefox (previous version) | All displays and features should work correctly.
 | Edge (previous version) | All displays and features should work correctly.
 | Internet Explorer 11 (Optional) | All displays and features should work correctly. 
 | **macOS** | 
 | Chrome (previous version) | All displays and features should work correctly. 
 | Firefox (previous version) | All displays and features should work correctly. 
 | Safari (previous version) | All displays and features should work correctly. 
 | **Linux** | 
 | Firefox (latest and previous version) | All displays and features should work correctly. 
 | **Mobile iOS** |
 | Safari iPad (previous Safari version) | All displays and features should work correctly. 
 | Chrome iPad (latest Safari version) | All displays and features should work correctly. 
 | **Mobile Android** | 
 | Chrome (previous version) | All displays and features should work correctly. 

## Desktop Testing 
Use the currently released Power BI Desktop version (Download [here](https://powerbi.microsoft.com/en-us/desktop/)).

Passed | Test case | Expected Results
------ | --------- | ----------------
 | Test all features of the visual. | All displays and features should work correctly. 
 | Import, save, file open, and publish to the Power BI web service by using the Publish button the Desktop application. | All displays and features should work correctly.  
 | Change the numeric format string to have zero decimal places or 3 decimal places by increasing/decreasing the precision. | The visual should display correctly. 
 
## Performance Testing 
Passed | Test case | Expected Results
------ | --------- | ----------------
 | Create a visual with many visual elements. | The visual should perform well – no issues (animation speed, resizing, filtering, selecting, etc.). 
 | Use dev tools to validate performance, do not simply rely on visual cues and the console time logs. | Performance should be on acceptable level. Visual should not freeze application


## Next steps
More information about publishing to AppSource process [here](../office-store.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)