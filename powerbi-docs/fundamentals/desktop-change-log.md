---
title: Change log for Power BI Desktop
description: This change log is for Power BI Desktop and lists new items along with bug fixes for each released build.
author: davidiseminger
ms.author: davidi
ms.reviewer: maggies, davidi
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 02/28/2023
---

# Change log for Power BI Desktop

This change log is for Power BI Desktop and lists new items along with bug fixes for each released QFE build.

See [What's new in Power BI](desktop-latest-update.md) for more information about new features. 


## February 2023 QFE 2

*Version:2.114.864.0, Released: February 23, 2023*

Bug fixes/improvements:
* Fixed issues with  x86 installer


## February 2023 QFE 1

*Version:2.114.803.0, Released: February 21, 2023*

Bug fixes/improvements:
* Fix for Proxy models regression. Customers can now convert PBI Datasets and AS Live models with format strings to Direct Query and refresh existing models.
* Fix for creating Power Apps and Power Automate visuals.
* Fix for windows and dialogs rendering in some multimonitor configurations.
* Filter pane regression fix. Filter card input will now show blank values as default when advanced filtering is selected.



## December 2022 QFE 1

*Version: 2.112.1161.0, Released: January 10, 2023*

Bug fixes/improvements:
* AS Engine fix. DAX queries that contain query-scope calculated tables and send through external tools won't return error in certain cases.
* DAX window functions fix. Now function won't return error in certain cases when the *relation* parameter use CalculateTable function.
* Fix to data view filter menu.  Customers will see correct distinct values after applying filter/sort by another column.


## October 2022 QFE 2

*Version: 2.110.1161.0, Released: November 7, 2022*

Bug fixes/improvements:
* Fix for modeling regression: customers can now rename fields in tables created using DAX expressions, such as Calendar functions and Field parameter tables.

## October 2022 QFE 1

*Version: 2.110.1085.0, Released: November 3, 2022*

Bug fixes/improvements:
* Fix for Formula bar in model view: customers won't get an error message when deleting a table with selected DAX expression in Formula bar.
* Fix for Formula bar in model view: customers can now edit DAX expressions that contain special Japanese symbols.
* Fix for Proxy models regression: customers can now rename fields after converting Live connect model to a local model.

## September 2022 QFE 3

*Version: 2.109.1021.0, Released: October 4, 2022*

Bug fixes/improvements:
* Performance regression fix: customers will now see faster performance when they open and save .pbix files that have a large number of queries.

## September 2022 QFE 2

*Version: 2.109.844.0, Released: September 28, 2022*

Bug fixes/improvements:
* Horizontal Fusion improvement: now covers more query patterns, including patterns that rely on "TreatAs" to filter results.

## September 2022 QFE 1

*Version: 2.109.782.0, Released: September 20, 2022*

Bug fixes/improvements:
* Fix for Card visual: users can now set and modify the conditional formatting options to callout value color.
* Fix for charts with multiple series: conditional formatting will now correctly apply multiple colors to data labels.

## August 2022 QFE 2

*Version: 2.108.997.0, Released: August 25, 2022*

Bug fixes/improvements:
- Fix for OAuth token refresh for certain data sources like Synapse.
- Fix for live connections to AS models that have columns or measures included in more than one nested display folder.
- Data view regression fix: now list of filters in context menu will be displayed even when menu icons aren't in focus. 
- EvaluateAndLog  DAX function fix: now the function works as expected and won't return an error. 
- SAP HANA regression fixes: now power query won't show "the index is outside the bounds of the records" error message and there won't be missing values for columns when using Cube.AttributeMemberID on the query.  
- Roll back change for cashing: cashing will be done the same way as in previous releases
- Formula bar fixes for cases when “Shift+Enter” is used. 
- “Apply/discard changes” regression fix.


## August 2022 QFE 1

*Version: 2.108.825.0, Released: August 18, 2022*

Bug fixes/improvements:
- Fix for PBIX open file issue when connecting to Proxy models. 
- Data view filtering regression fix: now when filtering wide tables by selecting one column and scrolling to select one more column, the filtering/scrolling will work, and user will be able to select a column at the end of a wide table. 
- Data view regression fix: date and number filter options will be available in the right-click menu. 
- Formula bar fixes for cases when “Shift+Enter” is used. 
- “Apply/discard changes” regression fix.


## July 2022 QFE 1

*Version: 2.107.841.0, Released: July 21, 2022*

Bug fixes/improvements:
- Fix for SAP BW: now customers will be able to retrieve a full dataset when querying SAP BW and using paging operations (Table.skip, Table.FirstN etc.) even if the data exceeds the page size.
- Fix for SAP HANA: now when creating new connections or refreshing data, a display name will be shown instead of a technical column name in the fields well.


## June 2022 QFE 1

*Version: 2.106.883.0, Released: June 28, 2022*

Bug fixes/improvements:
- Fix for the start-up Sign-In ThreadStateException: now the logic for the sign-in process is split into two separate steps (users attempt to sign-in using cached credentials in the background as the first step, and then if needed they're returned back to the UI thread for the second step, that previously caused the ThreadStateException, and sign in with platform credentials).
- Fix for the legend color: now it will be the same for PBI Desktop and PBI Service.
- Fix for broken export 'data to file' content from custom visuals. 
- Fix for custom visuals using API above 4.4: definition for 4.5 and 4.6 custom visual API versions was added, and these custom visuals now run as expected. 

## May 2022 QFE 2

*Version: 2.105.1143.0, Released: June 3, 2022*

Bug fixes/improvements:
- Fix for the Azure Active Directory authentication issue on WebView2: now users will be able to authenticate and connect to all MS AAD resources.
- Assert failure fix for column names longer than 30 characters: now users will be able to connect to tables with columns names longer than 30 characters and refresh them. 

## May 2022 QFE 1

*Version: 2.105.923.0, Released: May 23, 2022*

Bug fixes/improvements:
- Datamarts data sources fix: primary keys are now supported.
- Axis scale setting persistence fix through version updates for category axis for scatter, line, stacked area, area and combo charts: now the setting for categorical axis with a log axis will persist. 

## April 2022 QFE 1

*Version: 2.104.941.0, Released: April 26, 2022*

Bug fixes/improvements:
- Fix for DAX expressions: the DAX parsing process in the formula bar now runs faster and the application doesn't hang.
- Fix for DirectQuery connections in Shared: it's now possible to add a DirectQuery connection to an existing report. 
- Fix for the format pane of bar charts: X-axis and Y-axis field well names are now mapped correctly and only their names are displayed. 
- Fix for stacked column charts with logarithmic scale: users can now apply Y axis log scale even if the legend field is present.
- Fix for the condition used to test disabled date bounds in calendar: users can now select last date in the calendar popup. 

## March 2022 QFE 1

*Version: 2.103.881.0, Released: March 28, 2022*

Bug fixes/improvements:
- Fix for the new format pane of matrix visuals: now the URL icon on rows/columns & horizontal scroll bar will work.
- Date picker defaults fix: now for the existing reports the datepicker icon in date range slicers won't be available and as a result, users' reports won't be changed. 
- Model refresh fix: now column descriptions for SimpleQueryMappingInput table inputs won't disappear after the model refresh.
- AS engine fix: now the `language` in the AS config file will always be set to en-us regardless of the Power BI Desktop UI language to prevent issues with the AS engine's start.
- Keyboard Navigation fix for the selection pane: now it will be accessible by keyboard while navigation define under "Format" tab.

## February 2022 QFE 1

*Version: 2.102.845.0, Released: February 24, 2022*

Bug fixes/improvements:
- Dynamics 365 (Dataverse) entry in GetData which redirects to Dataverse connector is removed from the GetData list.
- Fix for the conditional formatting regression: conditional formatting for action > page navigation will work. 
- Fix for fields well description: a multiline field's tooltip won't be cut off and will be fully visible.
- Mashup engine fix: headers will be requested just once when accessing headers on paged HTTP values.
- Fix for a DirectQuery connection to a dataset in workspace with a '/' in the name. 
- Fix for perspective selection in the proxy models navigator.

## December 2021 QFE 3

*Version: 2.100.1401.0, Released: January 20, 2022*

Bug fixes/improvements:
- Fix for creating hybrid incremental refresh policies on DirectQuery over M queries: now users will be able to create a hybrid incremental refresh policy for the import tables that use DirectQuery over M. 
- Fix for the "Power BI Desktop infrastructure update" preview feature: now when the feature is on, Quick measure dropdown dialog won't gray out and will work as expected.
- Fix for Proxy models: now when adding new table on the proxy source relationship with IncludeFutureArtifacts = false, the relationship to the original table will be created and proxy model will be refreshed.  

## December 2021 QFE 2

*Version: 2.100.1182.0, Released: January 10, 2022*

Bug fixes/improvements:
- Fix for the drop action: now no exception/error message will appear when dragging and dropping into a drill-through bucket.
- AS engine start telemetry fix: Power BI application and the corresponding AS engine process should start successfully after locking/unlocking the screen.
 
## December 2021 QFE 1

*Version: 2.100.785.0, Released: December 21, 2021*

Bug fixes/improvements:
- Fix for calculation groups: duplicated measures won't be shown in the field list for PBIX files with calculation groups.
- Accessibility fixes for hierarchical slicer. 
 
## November 2021 QFE 2

*Version: 2.99.862.0, Released: November 30, 2021*

Bug fixes/improvements:
- Fix for ArcGIS Maps visual sign-in issue: now the sign-in window for the visual will pop-up (when "Power BI Desktop infrastructure update" preview feature is off).

## November 2021 QFE 1

*Version: 2.99.782.0, Released: November 23, 2021*

Bug fixes/improvements:
- Fix for Custom Visuals Store: now if a user isn't connected to the internet, they can still close the marketplace window.
- Fix for Print to PDF: now works for users that have the WebView2 feature turned off and don't have the new version of WebView2 installed.


## October 2021 QFE 3

*Version: 2.98.1025.0, Released: November 3, 2021*

Bug fixes/improvements:
- Formula bar Intellisense fix: now it's possible to save DAX expressions in localized format and use localized DAX separators. 

## October 2021 QFE 2

*Version: 2.98.1004.0, Released: October 28, 2021*

Bug fixes/improvements:
- Fix for the progress dialog: now Import/Refresh progress bar will be shown as expected.
- Formula bar fixes: 
   - "best" available list will be shown as the suggestion list;
   - the parameter hints intellisense widget will cover function contents for multi-line measures; 
   - DAX intellisense service is updated to set the right UI culture and respect localized DAX separate options; 
   - the parameter hints will be shown when a suggestion is accepted;
   - error won't be thrown for table names that start with "'";
   - few icons are added to the suggestions list to make the suggestion clear and avoid confusion;
   - missing function parameter information is added for some DAX functions and now intellisense works for them;
   - the latest icon files will be shown for variable and enum formula bar icons.

## October 2021 QFE 1

*Version: 2.98.882.0, Released: October 22, 2021*

Bug fixes/improvements:
- Fix for proxy tables: now when a proxy table is deleted there will be no visible LocalDateTable left.
- Fix for the issue where opening a PBIX file with saved diagram layouts wouldn't properly restore those layouts in the model view.

## September 2021 QFE 2

*Version: 2.97.921.0, Released: September 28, 2021*

Bug fixes/improvements:
- Fix for proxy schema sync ordering issue: now when changing data source, refresh won't fail due to resolvable relationship ambiguity.

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
- Fix for SAP BW reports: now tables aren't duplicated if a user selects refresh.
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
- Fix for corrupted credentials: users won't get the alert warning that their credentials can't be decrypted, now users may consider manually removing credentials folder (user.zip file) as a workaround.

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
- Fix for Microsoft Purview Information Protection timeout issues: now when a user opens a file or signs in and faces network issues, MIP exception won't pop up.

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
