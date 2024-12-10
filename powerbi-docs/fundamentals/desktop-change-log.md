---
title: Change log for Power BI Desktop
description: This change log is for Power BI Desktop and lists new items along with bug fixes for each released build.
author: davidiseminger
ms.author: davidi
ms.reviewer: maggies, davidi
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 12/10/2024
no-loc: [Copilot]
---

# Change log for Power BI Desktop

This change log is for Power BI Desktop and lists new items and bug fixes for each released QFE build.

See [What's new in Power BI](desktop-latest-update.md) for more information about new features. 


## November 2024 QFE 3

*Version: 2.138.1452.0, Released: December 9, 2024*

Bug fixes/improvements:

* Fixed the frowns observed by customers when using the older version of WebView2 Runtime


## November 2024 QFE 2

*Version 2.138.1203.0, Released: November 27, 2024*

Bug fixes/improvements:

* Fixed a regression issue where users in certain regions were seeing an error because they can access and use the Copilot pane, even though it shouldn't have been available to them
* Fixed an issue where incorrect column names were being returned from *AdomdDataReader* results after changing column format or aggregation, causing broken data views and visual updates.=


## November 2024 QFE 1
*Version 2.138.1004.0, Released: November 19, 2024*

Bug fixes/improvements:

* Diagnostic telemetry to capture logs related to the broken data view and visuals issue, when a user changes the column format or aggregation
* Disabled *Inline Sparkline Measure* since it broke previously created reports that used calculation groups with sparklines
* Fixed an issue preventing users from connecting to SAP HANA due to a *Non-null assertion failure: queryName* error
* Removed telemetry service suspend for Power BI Desktop applications, and introduced configuration for page visibility service
* Fixed the endless retry of the V2 client-side copilot orchestrator and added a limit to the number of retries
* Fixed an issue where Q&A tooling was broken due to improper error handling



## October 2024 QFE 2
*Version 2.137.1102.0, Released: October 28, 2024*

Bug fixes/improvements:

* Fixed issue with disambiguation preference settings when using composite models
* Fixed a browser compatibility issue
* Upgrade from npgsql 4.0.16 to npgsql 4.0.17, which fixed the issue of PostgreSQL connections not working when using prefer or required secure connections


 
## October 2024 QFE 1
*Version 2.137.952.0, Released: October 21, 2024*

Bug fixes/improvements:

* Fixed issue with importing/opening a *Live Connected* report
* Downgraded Drill ODBC driver version from 1.5.14 to 1.5.5
* Fixed refresh issue with the Dremio connector
* Fixed the Navigator dialog, allowing Perspective selections when using Composite models


## September 2024 QFE 1 
*Version 2.136.1478.0, Released: October 7, 2024*

Bug fixes/improvements:

* Fixed an issue associated with being unable to connect to the Spark Connector
* Provided a fix to handle the parsing of spaced parameter query names


## August 2024 QFE 2
*Version 2.135.7627.0, Released: September 20,2024*

Bug fixes/improvements:

* Fixed the error *InvalidOrMalformedDataShapeBinding* that prevented Cartesian charts from displaying when it had a reference line based on the aggregate of a measure. This error could occur when the same field with the same aggregate is used as a conditional formatting source for a different formatting option in the same visual.


## August 2024 QFE 1
*Version 2.132.1053.0, Released: August 21,2024*

Bug fixes/improvements:

* Fixed an issue with July build to August build upgrade


## July 2024 QFE 1
*Version 2.131.1126.0, Released July 21, 2024*

Bug fixes/improvements:

* Fixed the issue with bookmark groups serializing in exploration for version 2
* Updated Analysis Services engine version to 16.0.138.23-PBID
* Switched Power BI tests configurations to use the default VHD image
* Fixed named expressions running through the table inclusion/exclusion logic for synchronizer sub-select


## June 2024 QFE 1
*Version 2.130.930.0, Released: June 17, 2024*

Bug fixes/improvements:

* Bug fix for an issue where the "Refresh" popup showing the number of rows loaded was not appearing on refresh of the data in the table view
* Reverted cross-highlight optimization behavior for Custom Visuals
* Improved the token fetching process in the SubstrateService of the Power BI client
* Serialized bookmark groups properly

## May 2024 QFE 1

*Version 2.129.1229.0, Released: May 30, 2024*

Bug fixes/improvements:

* Subfolders preview feature is disabled by default  
* Fixed issue with hiding **Select** and **Cancel** buttons when publishing with the **Subfolder** feature and the tenant pre-publish message is visible
* Added more telemetry for acquiring token to identify dynamic user impersonation culprits
* Fixed **CTRL + F6** navigation so the Diagram view can be focused, also updated the focus priorities of some components.




## April 2024 QFE 3

*Version : 2.128.1380.0, Released: May 02 , 2024*

Bug fixes/improvements:

* Introduced a new feature to synchronize the *DataType* when the *SourceProviderType* changes in the Power BI Modeling Engine
* Added locks to prevent clearing the cache of the Data Grid data when it's being read at the same time
* Set Trust Server Certificate irrespective of encrypt connection settings
* Fixed issue occurring when select visuals' calculation groups were returning incorrect results due to incorrect optimization


## April 2024 QFE 2
 
*Version 2.128.1177.0: , Released: April 24 , 2024*

Bug fixes/improvements:

* Version update for Mashup Provider NuGet packages (to include QFE fixes)
* Disabled contextual summarize columns for Power BI Desktop to make consistent with the Power BI service
* Updated error messages in the Azure Data Lake Storage (ADLS) connector



## April 2024 QFE 1
 
*Version: 2.128.952.0, Released: April 15, 2024*

Bug fixes/improvements:

* Fix for drag and drop picker tooltip, empty title fix
* Fix duplicated truncation problem on Gauge Chart
* Added error messaging when ignoring the workspace picker for Desktop Report Authoring Copilot 


## March 2024 QFE 2

*Version: 2.127.1327.0, Released: April 01, 2024*

Bug fixes/improvements:

* Fix for customize theme dialog margins: Fixed issue where theme dialog's margins were too large and were occluding the *Cancel* and *Apply* buttons.
* Fix for DAX Query View copilot usage telemetry: Fix for spike in Customer Counts/Tenant Counts for Feature powerbi-copilot-usage.
* Fixed issue where an error is thrown in live connect when users clicked on relationships.
 

## March 2024 QFE 1

*Version: 2.127.1235.0, Released: March 28, 2024*

Bug fixes/improvements:

* Fix for DataGrid copy to clipboard :  Fixed issue of "Copy Table" not working in datagrid view of Power BI Desktop
* Bug fixes for the DAX inline Copilot:  Fixed issue where invalid DAX query banner shows up unexpectedly in some cases. Prevents cancel button from being stuck when pressed too early. Prevents stale user input from showing when signing in again


## February 2024 QFE 1

*Version: 2.126.1261.0, Released: March 01, 2024*

Bug fixes/improvements:

* Fix for refresh failures for certain reports having a DirectQuery connection to AAS or a published semantic model
* Fix for null reference to telemetry object
* Make visual calculation look up invisible in Power BI Desktop


## December 2023 QFE 3

*Version: 2.124.2028.0, Released: January 29, 2024*

Bug fixes/improvements:

* Fix v5.50 upgrader for multi-static series and 100% stacked charts
*	Remove Force Refresh on Token Refresh

## December 2023 QFE 2

*Version: 2.124.1805.0, Released: January 19, 2024*

Bug fixes/improvements:

*	Sign-in Flighting Feature Update
* Updated Q&A Copilot telemetry

## December 2023 QFE 1

*Version: 2.124.1554.0, Released: January 09, 2024*

Bug fixes/improvements:

*	Updated PQO announcement dialog image path.
*	Updated the learn more link for PQO announcement dialog.
*	Added flighted features to Power BI Desktop frown telemetry event.
*	Disable NewNonEmptyFilteringSemantics feature switch.
*	Small-multiple single-series column-chart style-formatting.
*	Fixed formatting pane isn't allowing formatting multiple visuals of the same type

## November 2023 QFE 1

*Version: 2.123.742.0, Released: November 21, 2023*

Bug fixes/improvements:

* Fixed mobile canvas watermark that was throwing exceptions in autocreate
* Frown fix - users no longer get a frown from the sync slicer view model update when a slicer is selected

## October 2023 QFE 1

*Version: 2.122.1066.0, Released: November 01, 2023*

Bug fixes/improvements:
 

* 32-bit sign-in fix. Customers can now sign in to 32-bit Power BI Desktop.
* CDM connector fix.
* Telemetry fix.
* Print PDF fix. Customers can now print and open .pdf files.
* Semantic model fix. It's now confirmed whether a report object exists before showing Power BI semantic model *Unable to connect* dialog.
* The freshness requirement for collecting AS logs and traces has been removed. 


 
## September 2023 QFE 2

*Version: 2.121.903.0, Released: September 25, 2023*

Bug fixes/improvements:

* Formula bar fix. An error message now appears when a user types an expression in the formula bar that results in an error from AS and reverting their expression.
* Fix to data exporting. Customers exporting data from a visual are no longer restricted to 300 rows.
 



## September 2023 QFE 1

*Version: 2.121.762.0, Released: September 18, 2023*
 
Bug fixes/improvements:

* Fix to On Object. Now customers can select all sections on Pie/Donut chart.
 


## August 2023 QFE 1

*Version: 2.120.963.0, Released: August 29, 2023*

Bug fixes/improvements:

* Security update. Open SSL version updated to 3.0.9
* Telemetry fix.


## July 2023 QFE 2

*Version: 2.119.986.0, Released: July 26, 2023*

Bug fixes/improvements:

* Fix to large models. Now customers would be able to see relationships lines in Model View. Template files with multiple queries now load faster.


## July 2023 QFE 1

*Version: 2.119.870.0, Released: July 24, 2023*

Bug fixes/improvements:

* TheProductForX tests fix
* Template files with multiple queries now load faster.
* Visual fix. Measure-driven data label now supports adding date type field to custom label and allows to adjust the size of the visual.
* On-object fix. Disambig menu on treemap wouldn't be auto expanding.
* ExeutingUserObjectId is now properly populated.
* The calculation group ribbon button in the model view is now behind a feature switch.
* Component governance fix.
* On-object fix. Customers won't get an error when selecting two groups on selection pane and merge them.


## June 2023 QFE 2

*Version: 2.118.1063.0, Released: July 05, 2023*

Bug fixes/improvements:

* Sign in fix. Users are now able to sign in to Power BI Desktop using Azure Virtual Desktop
* Users are now able to sign out from their accounts.


## June 2023 QFE 1

*Version: 2.118.828.0, Released: June 22, 2023*

Bug fixes/improvements:

* Fix to visual. Customers now could add field parameter to their visuals.
* Fix to On-object. Updated table selector getter.
* All accent and special characters are now supported in Spanish.
* Fix to On-object. Build visual menu now supports setting values as *percent of column total* or *Percent of row total*.
* Google analytics V2 is now able to save data to Power BI.
* Telemetry fix.
* Fix to UnappliedQueries. All exported templates would now include lineage tags.
* Fix to AS on-premises connection type.
* Localization fix. Tooltip for OneLake data hub button on Home Tab is now available in multiple languages.
* Fix to the ribbon. Customers won't see the key tips in the ribbon when formula bar is edited.



 ## April 2023 QFE 3

*Version: 2.116.966.0, Released: April 26, 2023*

Bug fixes/improvements:

* Telemetry fix.
* Fix to data grid header. Updated design is now available to customers.
* Fix to context menu. In the data grid checkable options for sorting and hide in report view now available.
* On-object fix. Customers now able to use the Format pane to change Row Subtotals position from bottom to top on Matrix.


## April 2023 QFE 2

*Version: 2.116.884.0, Released: April 21, 2023*

Bug fixes/improvements:

* Fixed issues with x86 installer
* 20% increment ranges are now available for 100% stacked bar chart bar chart in x-axis and 100% stacked column visual in y-axis

## April 2023 QFE 1

*Version: 2.116.843.0, Released: April 19, 2023*

Bug fixes/improvements:

* Fixed issues with x86 installer
* Fix to title bar. Customers are now able to update from *Untitled* to the Report Title


## March 2023 QFE 2

*Version: 2.115.1006.0, Released: April 03, 2023*
 
Bug fixes/improvements:

* Fix for Proxy models. Customers can now use calculated column with time intelligence function.
* Reduced installer file size to match previous version.
 
## March 2023 QFE 1

*Version:2.115.842.0, Released: March 24, 2023*

Bug fixes/improvements:
* Fix for on-object interaction. Customers can now update selected items from the dropdown selection menu.
* Fix for visuals with rounded corners. Default padding values now aligned with border radius.

## February 2023 QFE 2

*Version:2.114.864.0, Released: February 23, 2023*

Bug fixes/improvements:
* Fixed issues with  x86 installer


## February 2023 QFE 1

*Version:2.114.803.0, Released: February 21, 2023*

Bug fixes/improvements:
* Fix for Proxy models regression. Customers can now convert PBI semantic models and AS Live models with format strings to Direct Query and refresh existing models.
* Fix for creating Power Apps and Power Automate visuals.
* Fix for windows and dialogs rendering in some multimonitor configurations.
* Filter pane regression fix. Filter card input will now show blank values as default when advanced filtering is selected.



## December 2022 QFE 1

*Version: 2.112.1161.0, Released: January 10, 2023*

Bug fixes/improvements:
* AS Engine fix. DAX queries that contain query-scope calculated tables and send through external tools won't return error in certain cases.
* DAX window functions fix. Now function won't return error in certain cases when the *relation* parameter use CalculateTable function.
* Fix to data view filter menu. Customers will see correct distinct values after applying filter/sort by another column.


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
* Horizontal Fusion improvement: now covers more query patterns, including patterns that rely on *TreatAs* to filter results.

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
- Formula bar fixes for cases when **Shift+Enter** is used. 
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
- Fix for SAP BW: now customers will be able to retrieve a full semantic model when querying SAP BW and using paging operations (Table.skip, Table.FirstN etc.) even if the data exceeds the page size.
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
- Dynamics 365 (Dataverse) entry in GetData, which redirects to Dataverse connector is removed from the GetData list.
- Fix for the conditional formatting regression: conditional formatting for action > page navigation will work. 
- Fix for fields well description: a multiline field's tooltip won't be cut off and will be fully visible.
- Mashup engine fix: headers will be requested just once when accessing headers on paged HTTP values.
- Fix for a DirectQuery connection to a semantic model in workspace with a '/' in the name. 
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
- Fix for ArcGIS Maps visual sign-in issue: now the sign-in window for the visual will pop up (when "Power BI Desktop infrastructure update" preview feature is off).

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
- Fix for a model view bug: now users can't create relationships between DirectQuery tables from the same Power BI semantic model or Azure Analysis Services instance as this scenario isn't supported.

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

## Related content

* [What's new in Power BI](desktop-latest-update.md)
* [Previous monthly updates to Power BI](desktop-latest-update-archive.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
