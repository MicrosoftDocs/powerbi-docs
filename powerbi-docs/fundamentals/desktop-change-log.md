---
title: Change log for Power BI Desktop
description: This change log is for Power BI Desktop and lists new items along with bug fixes for each released build.
author: willthom
ms.author: v-okkyry
ms.reviewer: maggies, davidi
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 05/04/2021
---

# Change log for Power BI Desktop

This change log is for Power BI Desktop and lists new items along with bug fixes for each released QFE build.

See [What's new in Power BI](desktop-latest-update.md) for more information about new features. 

## April 2021 QFE 2

*Version: 2.92.1067.0, Released: May 4th, 2021*

Bug fixes/improvements:
- Fix for Adobe Analytics Connector V1 endpoint token not renewed issue.
- Fix for a frown error that could occur in the model view while loading older PBIX files: now no frown dialog will be shown. 
- Fix for a model view bug: now users can't create relationships between DirectQuery tables from the same Power BI dataset or Azure Analysis Services instance as this scenario isn't supported.

## April 2021 QFE 1

*Version: 2.92.943.0, Released: April 27, 2021*

Bug fixes/improvements:
- Improvements in Microsoft Information Protection SDK hang detection and stop throwing "Unknown hard error" dialog.
- Fix for corrupted credentials: users will not get the alert warning that their credentials can't be decrypted, now users may consider manually removing credentials folder (user.zip file) as a workaround.

## March 2021 QFE 1

*Version: 2.91.884.0, Released: March 29, 2021*

Bug fixes:
- Fix for Microsoft Information Protection SDK hanging during evaluation shutdown.
- Amazon Redshift driver update to fix the issue with non-nullable primary key columns being treated as empty strings after merge queries.
- Fix for slicers to contain unique (non-duplicated) values when using aggregations.
- Fix for formula bar: prevent UI interactions when empty measures, calculated columns, calculated tables are deleted from the model.
- Fix for PBI.FormatAnnotationStats telemetry event.
- Fix for customized fields display folders: now the folders won't disappear after data refresh or **Choose Columns** changes in Power Query.
- ODBC drivers update to newer versions.
- Fix for Microsoft Information Protection timeout issues: now when a user opens a file or signs in and faces network issues, MIP exception won't pop up.

## February 2021 QFE 1

*Version: 2.90.1081.0, Released: March 8, 2021*

Bug fixes: 
- Fix for Azure Analysis Services OAuth token refresh.
- Fix for Power Query model import from Excel to Power BI Desktop.
- Fix for combo chart with dynamic format strings, series, categories, column values, and line values.
- Fix for Power BI Desktop save validation: now it doesn't overwrite the customer's previous file with an invalid .pbix file, if it's caused by Analysis Services writing to the zip file.
- Fix for Model view large .pbix files: now it will not throw an error when you quickly switch to model view. 
- Fix for Model view blurry fields and icon text inside a table card. 
- Fix for Color picker: now it closes when you press ESC. 

## Next steps

[What's new in Power BI](desktop-latest-update.md)
[Previous monthly updates to Power BI](desktop-latest-update-archive.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
