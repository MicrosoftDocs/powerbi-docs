---
title: Change log for Power BI Report Server
description: This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.
author: jtarquino
ms.author: jaimeta
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 09/28/2021
---

# Change log for Power BI Report Server

This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.

See [What's new in Power BI Report Server](whats-new.md) for more information about new features. 

## September 2021
- **Power BI Report Server**
    - *Version: 1.12.7936.39665 (Build 15.0.1107.146), Released: September 27, 2021*
        - Features
            - Updated support for Power BI Reports including those with small multiples.
            - Updated Power BI Report Server portal experience as default experience.
        - Bug fixes
        - Deprecated support for Internet Explorer.

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.97.863.0 (September 2021), Released: September 27, 2021*
        - Contains changes required for connection with Power BI Report Server (September 2021).
        - Updated gallery view for custom visuals.
        - Bug fixes

## May 2021
- **Power BI Report Server**
    - *Version: 1.11.7815.26414 (Build 15.0.1106.169), Released: May 27, 2021*
        - Features
            - Added enhancements for PBIX reports containing "models with enhanced metadata".
            - Custom Visual API shipped with release - version 3.5.0
        - Bug fixes
            - Fixed issue with caching of linked reports.
            - Fixed issue where "Changed by" section would show incorrect date on some PBIX reports.
            - Fixed issue causing "Datasource is not found" for PBIX report data sources.
            - Fixed issue causing "No credentials were found for the datasource" for PBIX report data sources.
            - Fixed permission issue for live connect of SSAS tabular PBIX reports.
            - Fixed various issues in new portal preview.
        - Security updates

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.93.1681.0 (May 2021), Released: July 6, 2021*
       - Contains fix for Google Auth: Google Auth is moved to System Browser (non embedded) to allow users to log into Google Analytics and Google Big Query.
    - *Version: 2.93.982.0 (May 2021), Released: May 27, 2021*
        - Contains changes required for connection with Power BI Report Server (May 2021).
        - "Models with enhanced metadata" is now the only option for modeling in Power BI Desktop for RS.
        - Bug fixes

## January 2021
- **Power BI Report Server**
    - *Version: 1.10.7737.32652 (Build 15.0.1105.230), Released: March 12, 2021*
        - Bug fixes
            - Fixed issue with URL filters causing PBIX reports to not load.
    - *Version: 1.10.7698.27886 (Build 15.0.1105.195), Released: January 28, 2021*
        - Features
            - New Icons releate to Power BI and Power BI reports.
            - Custom Visual API shipped with release - version 3.5.0
            - New portal preview experience added behind 'UsePortalV2' feature switch in ReportServer catalog's ConfigurationInfo table.
        - Bug fixes
            - Fixed issue with scheduled refresh of Power BI reports with certain models using enhanced model metadata.
            - Fixed issue editing data driven subscriptions in portal.
        - Security updates

- **Power BI Desktop (optimized for Power BI Report Server)**
   - *Version: 2.88.2361.0 (January 2021), Released: March 12, 2021*
        - Bug fixes
   - *Version: 2.88.1382.0 (January 2021), Released: January 28, 2021* (new build and new version)
        - Contains changes required for connection with Power BI Report Server (January 2021)        
   
## October 2020
- **Power BI Report Server**
    - *Version: 1.9.7709.41358 (Build 15.0.1104.310), Released: March 9, 2021*
        - Security Updates [(KB 5001285)](https://support.microsoft.com/topic/description-of-the-security-update-for-power-bi-report-server-october-2020-march-9-2021-kb5001285-d2b664c1-5622-4d07-bb92-9543f95ec4de)
    - *Version: 1.9.7675.15620 (Build 15.0.1104.300), Released: January 8, 2021*
        - Bug fixes
            - Fixed issue with refresh of reports with two or more datasources that differ only by the casing of the letters.
            - Fixed issue with refresh of reports certain combinations of nested joins.
    - *Version: 1.9.7627.11028 (Build 15.0.1104.264), Released: November 18, 2020*
        - Bug fixes
            - Fixed issue preventing users from changing fields in site settings via the portal.
            - Fixed issue with refresh of Power BI Reports when using 'EnterData' data source.
            - Fixed issue with refresh of some models using enhanced dataset metadata.
            - Fixed issue where some Power BI reports could not be published to the Report Server.
    - *Version: 1.9.7604.41261 (Build 15.0.1104.239), Released: October 27, 2020*
         - Features
            - Enabled support for enhanced dataset metadata in Power BI Report Server.
            - Enabled the ability to update connections for Power BI reports for DirectQuery and refresh (see [Change data source connection strings](./connect-data-source-apis.md) for more details).
        - Security updates
        - Bug fixes
            - Fixed issue preventing users from changing Power BI report refresh schedules.
            - Fixed confusing error message users got managing reports when credentials had expired.
            - Fixed issue with exporting reports with periods in their name.
            - Fixed screen reader issues in a tablix.
            - Fixed issue with log files being blank in some circumstances.
            - Fixed issue with overwriting Excel file during upload.
            - Fixed issue with Model.UpdateCacheSnapshot REST API method.
            - Fixed issue with SAP BW data source connections via XMLA.
            - Fixed issue with "Connect to Power BI" dialog not closing.
            - Fixed issue with CustomHeaders advanced feature default value.
            - Updated MHTML renderer to use newer HTML DOCTYPE.

- **Power BI Desktop (optimized for Power BI Report Server)**
   - *Version: 2.86.3481.0 (October 2020), Released: March 31, 2021*
        - Bug fixes
   - *Version: 2.86.2841.0 (October 2020), Released: Feburary 5, 2021*
        - Bug fixes
   - *Version: 2.86.1321.0 (October 2020), Released: November 18, 2020*
        - Bug fixes
   - *Version: 2.86.961.0 (October 2020), Released: October 27, 2020* (new build and new version)
        - Contains changes required for connection with Power BI Report Server (October 2020)        
   
## May 2020
- **Power BI Report Server**
    - *Version: 1.8.7710.39564 (Build 15.0.1103.241), Released: March 9, 2021*
        - Security Updates [(KB 5001284)](https://prod.support.services.microsoft.com/topic/description-of-the-security-update-for-power-bi-report-server-may-2020-march-9-2021-kb5001284-578b456e-a4de-4ceb-b4f8-61455a74ca58)
    - *Version: 1.8.7485.35104 (Build 15.0.1103.234), Released: June 30, 2020*
        - Bug fixes
            - Fixed an issue in scale-out scenarios where reports weren't reflecting edits immediately in the server after upload.
    - *Version: 1.8.7468.41510 (Build 15.0.1103.232), Released: June 15, 2020*
        - Bug fixes
            - Fixed an issue where reports weren't reflecting edits immediately in the server after upload.
            - Fixed an issue where refresh failed when fuzzy matching was used to merge queries.
    - *Version: 1.8.7450.37410 (Build 15.0.1103.227), Released: May 27, 2020*
         - Features
            -  Added support for customizable catalog connection pool size (see [MaxCatalogConnectionPoolSizePerProcess setting](/sql/reporting-services/report-server/rsreportserver-config-configuration-file#bkmk_service) for more details).
            -  Improved behavior when viewing a report during a refresh operation.
        - Security updates
        - Bug fixes
            - Fixed two issues relating to single quotes in folder and report names.
            - Fixed an issue relating the horizontal scroll with certain browsers and the See Records feature.
            - Fixed an issue where scheduled refresh while report open can sometimes lead to schema errors in the underlying model.
            - Fixed an issue where alt text for PDF export were not correctly encoded for multi-byte characters.
            - Fixed an issue where custom applications executing LoadReport would incorrectly receive a TrustedHeader error.
            - Fixed an issue where heavy load from scheduled refresh could lead to failed refreshes.
            - Fixed an issue where reports would save to the wrong location if the report name matched the folder name.
            - Fixed tabbing issues in the Document Map.
            - Fixed an issue with data-driven subscriptions failing when they used DAX queries.
            - Fixed an issue in URL Access causing FindString to not locate matches.
            - Fixed an issue that broke embedded data sources when reports were moved.
            - Fixed an issue causing scheduled refresh to fail for certain data sources.
            - Added validation to report scheduling to reduce opportunity for invalid requests.


- **Power BI Desktop (optimized for Power BI Report Server)**
   - *Version: 2.81.5831.1181 (May 2020), Released: June 9, 2020*
        - Bug Fix
	       -  Fix for MarketPlace visuals
   - *Version: 2.81.5831.941 (May 2020), Released: May 27, 2020* (new build and new version)
        - Contains changes required for connection with Power BI Report Server (May 2020)        
   
## January 2020
- **Power BI Report Server**
    - *Version: 1.6.7364.4075 (Build 15.0.1102.777), Released: March 2, 2020*
         - Bug Fixes
	       -  Fix for Power BI reports failing to upload for certain data sources
	       -  Fix for Power BI Report Server Desktop link download location from the portal
	       -  Fix for DynamicImageDPI for Excel rendering
	       -  Fix for Oracle connections using incorrect thread culture in certain multi-user scenarios (see [UseInstalledUICulture documentation](./connect-data-sources.md) for more details)
	       -  Fix for CustomHeaders default value causing failures for report embedding
	       -  Fix for SQL parameter names being incorrectly generated in certain cases
    - *Version: 1.6.7327.3007 (Build 15.0.1102.759), Released: January 23, 2020*
         - Features
            -  Export to Excel from Power BI reports.
	       -  Power BI Premium dataset support for paginated reports.
	       -  AltText (alternative text) support for paginated report elements.
	       -  Support for custom headers.
	       -  Support for Azure SQL Managed Instances as the catalog.
	       -  Transparent Database Encryption for the catalog.
        - Security updates
        - Bug fixes
            - Fixes for accessibility for screen readers, report rendering, and keyboard navigation.
	        - Fix for saving multi-byte Report titles.
	        - Fix for verbose logging affecting report server reliability.
		  - Fix for ensuring live data in Power BI reports on mobile.
		  - Fix for applying cross-visual highlighting across as visuals in filtered export of Power BI reports.
		  - Fix for writing footer when exporting to Word with expression for visibility for paginated reports. 
	 
- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.76.5678.1521 (January 2020), Released: January 23, 2020* (new build and new version)
        - Contains changes required for connection with Power BI Report Server (January 2020)        


## September 2019
- **Power BI Report Server**
    - *Version: 1.6.7236.4246 (Build 15.0.1102.646), Released: October 25, 2019*
        - Security updates
        - Bug fixes
            - Fix for .net framework 4.7 not installed.
	        - Fix for paginated reports for Teradata with multivalue parameters with error 110083.
	        - Fix for URLRoot value not work if there are multiple web service URL bindings and one of them is https://+80/reportserver.
		  - Fix for paginated reports multivalue parameter values showing up outside the report area.
		  
    - *Version: 1.6.7221.30698 (Build 15.0.1102.620), Released: October 9, 2019*
        - Bug fixes
            - Fix for Text Filter custom visual.
	        - Fix for the performance of drop-down slicers.
	        - Fix for Strip PII from telemetry.
		  - Fix for URLs to not be case sensitive.
 		  
    - *Version 1.6.7206.38019 (Build 15.0.1102.597), Released: September 26, 2019*
        - Security updates
        - Bug fixes
           - Paginated reports
             - Fix for accessibility issues encountered while using Internet Explorer and Microsoft Edge.
             - Fix for SAP HANA issues while testing connection.
             - Fix for issues found while providing list of email addresses.
             - Fix for for Power BI reports that use a DirectQuery data source and integrated authentication.
             - Fix for Paginated reports to render with filter parameters when snapshot is enabled.
             - Fix for double execution of stored procedures during report execution.
             - Fix for default service account being granted SQL Server login permissions, when custom service account is configured to run the Power BI Report Server.
             - Fix for accessing models meanwhile refreshing in Japanese time zone.
             - Fix for stale models when a new version of the report is uploaded during refresh.
             - Fix for parameter values that contain the '&' character'.
         - Programmability
             - Updated Web API: /PowerBIReports({Id})/DataSources (PATCH) to allow connection string updates.
         
- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.73.5586.1501 (September 2019), Released: October 25, 2019*
        - Bug fixes
            - Fix for Telemetry.
	        
    - *Version: 2.73.5586.1241 (September 2019), Released: October 9, 2019*
        - Bug fixes
            - Fix for Text Filter custom visual.
	        - Fix for the performance of drop down slicers.
	        - Fix for Strip PII from telemetry.
            
    - *Version: 2.73.5586.821 (September 2019), Released: September 26, 2019* (new build and new version)
        - Contains changes required for connection with Power BI Report Server (September 2019)

    
## May 2019

- **Power BI Report Server**          
    - *Version 1.5.7074.36177 (Build 15.0.1102.371), Released: May 21, 2019*
        - Bug Fixes
            - Paginated Reports
                - Fix to always enable pdf font-embedding.
                - Fix to set cookies sent over https as Secure
                - Fix to issues with pop ups due to script errors
                - Fix for display issues with Mobile App on Android phones
                - Fix for Mobile Report Time Navigator to show the correct week numbers irrespective of the start of Fiscal year
                - Added 'RestrictedResourceMimeTypeForUpload' configurable property for admins to specify banned mime types
         - Features
            - Adding support for Trusted Visuals to PBIRS

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.69.5467.1801 (May 2019), Released: May 21, 2019*
        - Bug fixes
            - Fix to avoid re-entry of credentials during PBIX upload to PBIRS
            - Fixes opening documents with # in the filename
            - Added easier link for back navigation on PBIRS Selection window
            - Fix to High Contrast mode in PBIRS to display Back button, show warning visual messages.
            - UI fixes to Selection pane, canvas scaling.

    - *Version: 2.69.5467.5201 (May 2019), Released: July 30, 2019*
        - Bug fixes
            - Fix for incorrect telemetry logging

## January 2019

- **Power BI Report Server**          
    - *Version 1.4.7024.16477 (Build 15.0.1102.299), Released: March 28, 2019*
        - Bug Fixes
            - Power BI Reports
                - Fix for issue with basic credentials when using direct query for SAP Hana and SAP BW
                - Fix for OData feed data refresh fails with "Could not load file or assembly 'Microsoft.OData.Core.NetFX35.V7"

- **Power BI Report Server**            
    - *Version 1.4.6969.7395 (Build 15.0.1102.235), Released: January 30, 2019*
        - Bug Fixes
            - Power BI Reports
                - Fix for issue with basic credentials when using direct query
                - Fix for bidirectional relationships with row-level security filters applied
                - Fix for stale data after a model refresh in a scale-out environment
                - Fix for double scrollbar for table/ matrix on Firefox 63+
                - Fix for +/- icon size in Internet Explorer
            - Paginated Reports
                - Fix for issue with updating usage of a shared datasource for a report

    - *Version 1.4.6960.38798 (Build 15.0.1102.222), Released: January 22, 2019*
        - Features
            - Power BI Reports 
                - Support for Row-level security
                - Expand and collapse on matrix row headers
                - Copy and paste between .pbix files
                - Smart alignment guides
                - Support for SAP BW 2.0 Connector
            - Administrators
                - Ability to restrict extensions of resources that can be uploaded to the report server
                - Ability to restrict supported hyperlink schemes
            - Programmability
                - New Web API: /PowerBIReports({Id})/DataModelRoles (GET)
                - New Web API: /PowerBIReports({Id})/DataModelRoleAssignments (GET & PUT)
                - See [Power BI Report Server REST API](https://app.swaggerhub.com/apis/microsoft-rs/PBIRS/2.0) for more details
        - Bug Fixes
            - HTML Injection Vulnerability
            - Export to PDF is not showing Euro symbol
            - Saving a password with multiple data sources in Power BI reports invalidates non changed passwords
            - Visuals display issues in Power BI Mobile App after being idle

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.65.5313.1562 (January 2019), Released: January 30, 2019*
        - Shortcut and pinned icons remain after uninstalling Power BI Report Server
        - Fix for pinning Power BI Report Server to start menu giving black text on a black icon

    - *Version: 2.65.5313.1421 (January 2019), Released: January 22, 2019* (new build and new version)
        - Contains changes required for connection with Power BI Report Server (January 2019) 
    - *Version: 2.65.5313.5141 (January 2019), Released: July 31, 2019* (new build and new version)
        - Bug fixes
            - Fix for incorrect telemetry logging

## August 2018

- **Power BI Report Server**
    - *Version 1.3.6816.37243 (Build 15.0.2.557), Released: August 30, 2018*
        - Bug fixes
            - Fixed an issue when server was upgraded from earlier versions of PBI Report Server where a binding redirect was not updated, customers saw this message:      
            *`
            Failed to load expression host assembly. Details: Could not load file or assembly 'Microsoft.ReportingServices.ProcessingObjectModel, Version=2018.7.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91' or one of its dependencies. The located assembly's manifest definition does not match the assembly reference. (Exception from HRESULT: 0x80131040) (rsErrorLoadingExprHostAssembly)
             `*
             
            - Bug for Data Label Transparency is now fixed.
            
    - *Version 1.3.6801.38816 (Build 15.0.2.540), Released: August 15, 2018*
        - Features
            - SAP HANA SSO Direct Query support with Kerberos now available for Power BI Reports
            - Custom Visual API shipped with release  - version 1.13.0
            - Power BI visuals will fall back to a previous version compatible with the current version of the server API (if available)

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.61.5192.641 (August 2018), Released: August 15, 2018*
        - Contains changes required for connection with Power BI Report Server (August 2018)         
    - *Version: 2.61.5192.7701 (August 2018), Released: August 8, 2019* (new build and new version)
        - Bug fixes
            - Fix for incorrect telemetry logging
            
## March 2018

- **Power BI Report Server**
    - *Version 1.2.6690.34729 (Build 15.0.2.402), Released: April 27, 2018*
        - Bug fixes
            - Enable migration of SQL Server Reporting Services 2017 catalogs
            - For Power BI Reports (PBIX)
                - Reports can be refresh when a server is configured to use custom authentication
                - Modifying the properties of a report does not reset data source credentials
            - For Paginated Reports (RDL)
                - Usage of `Lookup()` or derivative functions such as `LookupSet()` and `MultiLookup()` in RDL Expressions no longer result in `#Error`
                - Linked reports respect the page size of the target report when printing
                - Subscriptions can be created for linked reports that use cascading parameters
                - Multi-value parameter defaults can be modified when using IE11
                - Data-driven subscription delivery options are editable
                - Subscriptions can be viewed and edited while the subscription is executing
                - Setting data source credentials does not remove expression-based connection strings
            - For KPIs
                - Trend lines are refreshed when data is updated
            - General stability improvements

    - *Version 1.2.6660.39920 (Build 15.0.2.389), Released: March 28, 2018*
        - Bug fixes
            - For Power BI Reports (PBIX), fix for Export Data not working from Power BI Visuals
            - For Power BI Reports (PBIX), fix for URL filters not working
            - For Paginated Reports (RDL), fix for images not being displayed correctly in IE11 after upgrading to Power BI Report Server March release

    - *Version 1.2.6648.38132 (Build 15.0.2.378), Released: March 19, 2018*
        - Security Updates
        - Accessibility Improvements
        - Bug fixes
            - For Paginated Reports (RDL), fix for parameters visibility in a linked report that is reverted after editing its properties
            - Fix for web portal with custom forms authentication that is ignoring the sliding expiration cookie
            - Fix for export to Word that creates unequal row height if row content is empty
            - For Paginated Reports (RDL), fix for expression-based connection string that is deleted when we change credential for data source
            - Fix for ability to use KPI with text values
            - For Paginated Reports (RDL), fix for ability to assign a new dataset to an existing Paginated Report (RDL)
            - Other stability and usability fixes

- **Power BI Desktop (optimized for Power BI Report Server)**
    - Version: 2.56.5023.1043 (March 2018), Released: March 19, 2018
        - Contains changes required for connection with Power BI Report Server (March 2018)

## October 2017

- **Power BI Report Server**
    - *Version 1.1.6582.41691 (Build 14.0.600.442), Released: January 10, 2018*
        - Security Updates
        - Bug Fixes
            - Fix for Model.GetParameters returning 400
            - Fix for setting shared data set to existing Paginated Reports (RDL)
            - Fix for ExecutionNotFoundException when exporting report with different parameter values to PDF

    - *Version 1.1.6551.5155 (Build 14.0.600.438), Released: December 11, 2017*
        - Bug Fixes
            - Failure to save data after refreshing for certain Power BI Desktop reports.

    - *Version 1.1.6530.30789 (Build 14.0.600.437), Released: November 17, 2017*
        - Bug Fixes
            - Fix for Basic Authentication Scenarios 
            - Fix for weekdays were not selectable on schedule page for Subscriptions, Cache Refresh Plans and History Snapshots on Portal
            - For Paginated Reports (RDL), fix for having expressions in Textbox with CanGrow property set to false is resulting in values not showing colors and fonts not being proper
            - For Power BI Reports (PBIX), fix for adding Legends to line chart renders an empty visual

    - *Version 1.1.6514.9163 (Build 14.0.600.434), Released: November 1, 2017*
        - Bug Fixes
            - Fix for upload reliability problems for PBIX reports over 500 MB
            - Fix for data loading issue for PBIX reports over 1 GB

    - *Version 1.1.6513.3500 (Build 14.0.600.433), Released: October 31, 2017*
        - Features
            - Embedded Data Model Support
            - Excel Workbook Viewing (with Office Online Server integration enabled)
            - Scheduled Data Refresh (PBIX)
            - Direct Query Support
            - Large File Support (up to 2 GB)
            - Public REST API
            - Shared Dataset support in Power BI Desktop (via oData)
            - URL Parameter Support for PBIX files
            - Accessibility improvements

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.51.4885.3981 (October 2017), Released: April 10, 2018*
        - Security Updates

    - *Version: 2.51.4885.2501 (October 2017), Released: January 10, 2018*
        - Security Updates

    - *Version: 2.51.4885.1423 (October 2017), Released: November 17, 2017*
        - Bug Fixes
            - Fix for 32-bit Power BI Desktop failing to run on x86 OS
            - For Power BI Reports (PBIX), fix to show x-axis gridlines
            - Other minor bug fixes

    - *Version: 2.51.4885.1041 (October 2017), Released: October 31, 2017*
        - Features
            - Contains changes required for connection with Power BI Report Server (October 2017)

## June 2017

- **Power BI Report Server**
    - *Build 14.0.600.309, Released: January 10, 2018*
        - Security Updates

    - *Build 14.0.600.305, Released: September 19, 2017*  
        - Bug Fixes
            - Update to the latest [Bing Maps Web Control](/bingmaps/v8-web-control/)

    - *Build 14.0.600.301, Released: July 11, 2017*
        - Bug Fixes
            - The `{{UserId}}` tag resolves to the stored credentials instead of the user executing the report in Power BI Reports
            - Some images fail to render in Power BI Report Server reports
            - Unable to change the name of a Power BI Report in the Power BI Report Server
            - Unable to load Power BI visuals in the Power BI mobile application (it requires reinstall of the mobile app to clear up the local cache)

    - *Build 14.0.600.271, Released: June 12, 2017*
        - Power BI Report Server initial release

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.47.4766.4901 (June 2017), Released: January 10, 2018*
        - Security Updates

## Next steps

[What is Power BI Report Server?](get-started.md)
[Administrator overview](admin-handbook-overview.md)  
[Install Power BI Report Server](install-report-server.md)  
[Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
[Download SQL Server Data Tools (SSDT)](/sql/ssdt/download-sql-server-data-tools-ssdt)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
