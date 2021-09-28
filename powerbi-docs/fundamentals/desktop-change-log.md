---
title: Change log for Power BI Desktop
description: This change log is for Power BI Desktop and lists new items along with bug fixes for each released build.
author: willthom
ms.author: v-okkyry
ms.reviewer: maggies, davidi
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 09/24/2021
---

# Change log for Power BI Desktop

This change log is for Power BI Desktop and lists new items along with bug fixes for each released QFE build.

See [What's new in Power BI](desktop-latest-update.md) for more information about new features. 

## September 2021 QFE 1

*Version: 2.97.861.0, Released: September 24, 2021*

Bug fixes/improvements:
- Azure Analysis Services fix: now when connecting to AAS and proxy detection is required, the connection will succeed.

## August 2021 QFE 2

*Version: 2.96.1061.0, Released: August 30, 2021*

Bug fixes/improvements:
- Fix for custom visuals: now there will be no crash if a managed organizational store custom visual doesn't appear in the app source.

## August 2021 QFE 1

*Version: 2.96.901.0, Released: August 23, 2021*

Bug fixes/improvements:
- Fix to hide Business apps launch event ad.
- Fix for Query Editor: now 'Enable load' will work after the query was renamed.

## July 2021 QFE 1

*Version: 2.95.983.0, Released: July 29, 2021*

Bug fixes/improvements:
- Fix for script visuals: now they can be enabled.
- Fix for SAP BW reports: now tables are not duplicated if click refresh.
- Fix for Enhanced-Tooltips: now tooltips stick long enough for users to interact with the drill buttons in the tooltip.

## June 2021 QFE 1

*Version: 2.94.921.0, Released: June 29, 2021*

Bug fixes/improvements:
- Fix for Google Auth: Google Auth is moved to System Browser (non-embedded) to allow users to sign in to Google Analytics and Google Big Query.
- Fix for FinalNameCalculator that treated measure names as case sensitive: now when looking for measure name conflicts case will be ignored.
- Fix for Q&A visual: now visual column renames are recognized as synonyms.
 
## May 2021 QFE 1

*Version: 2.93.981.0, Released: May 27, 2021*

Bug fixes/improvements:
- Registry settings improvement: now registry settings are applied according to the [Desktop evaluation configuration](../create-reports/desktop-evaluation-configuration.md) article and impact evaluations are done in the Analysis Services process (msmdsrv.exe) as well as the Power BI Desktop process (PBIDesktop.exe).

## April 2021 QFE 2

*Version: 2.92.1067.0, Released: May 4, 2021*

Bug fixes/improvements:
- Fix for Adobe Analytics Connector V1 endpoint token not renewed issue.
- Fix for a frown error that could occur in the model view while loading older PBIX files: now no frown dialog will be shown. 
- Fix for a model view bug: now users can't create relationships between DirectQuery tables from the same Power BI dataset or Azure Analysis Services instance as this scenario isn't supported.

## April 2021 QFE 1

*Version: 2.92.943.0, Released: April 27, 2021*

Bug fixes/improvements:

- Improvements in Microsoft Information Protection SDK detection of the machine stopping to respond and stop throwing "Unknown hard error" dialog.
- Fix for corrupted credentials: users will not get the alert warning that their credentials can't be decrypted, now users may consider manually removing credentials folder (user.zip file) as a workaround.

## March 2021 QFE 1

*Version: 2.91.884.0, Released: March 29, 2021*

Bug fixes:

- Fix where the Microsoft Information Protection SDK stops responding during evaluation shutdown.
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
