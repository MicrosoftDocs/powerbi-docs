<properties 
   pageTitle="What's new in the latest Power BI Desktop update?"
   description="What's new in the latest Power BI Desktop update?"
   services="powerbi" 
   documentationCenter="" 
   authors="pcw3187" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/14/2015"
   ms.author="v-pawrig"/>
# What's new in the latest Power BI Desktop update?

## September 2015 Update (2.27.4163.351)

You can download the latest version of Power BI Desktop from here:
https://powerbi.com/dashboards/downloads/designer

The following massive collection of 44 features has been added to this update:

###Report Authoring

- Report-level filters
- Drill Up/Down for column and scatter charts
- New Page Size and Page View options
- Support for inserting Shapes in the Report canvas
- Fields pane improvements
	- Search Box to make it easier to find fields by name
	- “Expand/Collapse All” to improve navigation when there are multiple tables in the Fields pane
	- Field well cardinality support, drag-replace for buckets with 1 item
	- Additional Data Labels formatting options
	- Chart Cartesian Axis Improvements:
		- X-Axis label direction (horizontal / diagonal)
		- Support for Logarithmic & Linear scales for values in Y-axis
		- Display Text for hyperlinks in text boxes
		- Improvements to existing visualizations: Table, Matrix, Slicer, Scatter Chart, Single Cards, Combo Charts and Gauges
		- Support for displaying Color Saturation values in tooltips
		- Ability to resize images and apply additional formatting options


###Data Modeling

- Calculated Tables.
- Relationships view:
	- Create relationships via drag/drop between two tables in the diagram.
	- Delete relationships in relationship view by selecting and hitting the Delete key.
	- Rename/delete tables and columns
- Data view:
	- Copy Table contents to clipboard.
- Field Summarization:
	- Support for additional operations in the Fields pane: median, standard deviation, and variance
	- Default summarization: Users can now customize the default summarization operation for any given field in their model

###Data Connectivity

- Support for on-premises Spark distributions
- Support for SharePoint lists from non-English sites
- Exchange connector - Enhanced support, now allowing connections to multiple mailboxes
- Excel Workbook Connector – Automatic Column Type detection when importing .XLS files
- “Select Related Tables” option when connecting to database sources
- Enhanced Active Directory connector credentials, allowing alternate Windows Credentials
- Improved Function Invocation experience when loading functions from a data source (such as a database)
- “Import Excel Workbook Contents” feature released last month now also supports external connections to Analysis Services tabular models
- New option to “Delete All” entries in the Data Source Settings dialog
- Option to “Enable Relationship Import during Refresh operations”

###Data Transformations and Query Editor Improvements

- Copy to clipboard (available for cells/columns/tables)
- Filter date columns by earliest/latest date (dynamic filter)
- Extract min/max date/time value from a column
- Replace Values - Provision for specifying special characters
- “Detect Column Types” option to trigger type detection on demand
- “Refresh All Previews” to refresh all Query Editor previews with a single click
- Performance Improvements:
	- Choose Columns dialog: Faster user experience for dealing with wide tables
	- Auto-filter & Expand/Aggregate popups: Faster for large number of values/fields

The following video covers these features in more detail.

<iframe width="500" height="281" src="https://www.youtube.com/embed/Jm44dLXdarQ" frameborder="0" allowfullscreen></iframe>

For more information about this update, [check out the blog announcement](http://blogs.msdn.com/b/powerbi/archive/2015/09/23/44-new-features-in-the-power-bi-desktop-september-update.aspx) that describes more details about each update.

## August 2015 Update (2.26.4128.403)

**You can download the latest version of Power BI Desktop from here:**  
https://powerbi.com/dashboards/downloads/designer

The following features have been added to this update:

**Overall Improvements:**

-   Import Excel Power BI artifacts (Data Model, Queries, Power View) into a new Power BI Desktop file

-   HDInsight Spark connector

-   Azure SQL Data Warehouse connector

-   Support for custom MDX/DAQ queries when importing data from SSAS

-   Live Analysis Services Connections: ability to change the database from **Edit Queries** dialog

**Navigator dialog improvements:**

-   Resizable Navigator dialog

-   Ability to multi-select items in Navigator (CTRL+click, SHIFT+click, etc)

**Query Editor improvements:**

-   Query Group creation/deletion improvements (multi-select, etc.)

-   Ability to Split Query (i.e. refactor common base steps into a new query)

-   Query Icons to reflect type of query in Queries navigator pane

**Data Modeling improvements:**

-   Resizing of columns in Data View

-   Moving Measures from one table to another


Take a look at the following video for more details about this update:

<iframe width="500" height="281" src="https://www.youtube.com/embed/2v7LUD7MJaw" frameborder="0" allowfullscreen></iframe>

## July 2015 Update (2.25.4095.554)

The following features have been added in this update:

-   **New Data Connectors**: appFigures, Quickbooks Online, Zendesk, Github, Twilio and SweetIQ.

-   **New Transformations**: Extract First/Last/Range of characters from a Text Column; Option to specify Join Type in the Merge Queries dialog; Ability to customize Quote Style in Split Column by Delimiter dialog.

-   **Report Authoring Improvements**: New visualizations (Area Chart, Waterfall, Donut & Matrix); New visual formatting and customization options (labels, titles, background, legend, colors, etc.); Insert Textbox and Picture in your report; Support for hyperlinks in reports and report tables; Undo/Redo actions.

-   **Direct Report Exploration** over Analysis Services Tabular Models.

-   **Data Modeling:** New Data View & Relationships views.

-   Publish reports to PowerBI.com, directly from Power BI Desktop.

-   Support for opening Recent Files in Start Page and "File -\> Open" menu.

-   Support for Exchange UPN Credentials in the Exchange connector.﻿

In addition to all these new features, we’re also making **Power BI Desktop available in 42 different languages.** Get the full list of languages and install the one you want from [our official download page](https://www.microsoft.com/download/details.aspx?id=45331).

Take a look at the following video for more details:

<iframe width="500" height="281" src="https://www.youtube.com/embed/JCaCcdMnsyM" frameborder="0" allowfullscreen></iframe>

## May 2015 Update (2.23.4036.161)

The following features have been added in this update:

**Modeling Features**

-   Calculated Columns

-   Data Categorization

-   Sort By Another Column

-   Improved DAX Formula Editor: Function Help and Prototype

**Get Data & Query**

-   New **ODBC Tables** connector (Beta)

-   Improved to the **Excel Workbook** connector: better column type inference and faster load for data previews

-   New Text Column Filters - **Does Not Begin With** and **Does Not End With**

-   Enhanced Privacy Levels dialog﻿

Take a look at the following video for details:

<iframe width="500" height="281" src="https://www.youtube.com/embed/LS0zMfup1pQ" frameborder="0" allowfullscreen></iframe>


### April 2015 Update (2.22.4009.122)

**You can download the latest version of the Power BI Designer from here:**

<https://powerbi.com/dashboards/downloads/designer>

The following features have been added in this update:

**Modeling Features**

-   Initial support for DAX Measures

-   New DAX functions

-   Data Types & Formatting options in Report view

-   Rename & Delete fields in Report view

**Get Data & Query**

-   OData V4 support

-   Support for Custom ADFS Authentication Services

-   Updated Facebook connector due to Facebook API changes

-   Unified Options dialog

-   Option to disable Native Database query prompts

-   Support for **Fixed Decimal Number** type

-   Alternate Windows Credentials

-   Remove Blank Rows

-   Median Operation available for **Group By** and **Aggregate Column**

-   Convert **DateTimeZone** value to **Local Time**

**Performance Improvements**

-   Faster load of medium & large datasets by about 20%

-   Improved time to open an existing PBIX file by about 50%

You can watch the following video for details: 

<iframe width="560" height="315" src="https://www.youtube.com/embed/FuL8agVKrcg" frameborder="0" allowfullscreen></iframe>

## March 2015 Update (2.21.3975.261)

The following features have been added in this update:

-   **Google Analytics** connector

-   Additional operators for **date filtering in Query view**

-   **Automatic Model Relationship Detection**

-   Enhanced **Add Relationship** dialog

-   **Report Pages Re-ordering** (drag & drop)

-   ~40-50% **Performance** **Improvement** filling database tables without filters/transforms

-   Lots of bug fixes

You can watch the following video for more details:

<iframe width="560" height="315" src="https://www.youtube.com/embed/xJTcGro08TI" frameborder="0" allowfullscreen></iframe>

## February 2015 Update (2.20.3945.102)

The following features have been added or improved in this update:

- Performance improvements
- Dynamics CRM Online connector
	> *Note: Currently, only URLs within the crm.microsoft.com domain are accepted by this dialog. This does not include non-production tenants. We’ll fix this issue in our March update. The temporary workaround is to connect to this feed using “From OData”.*
- Navigator Dialog improvements
	-   Better preview experience for multi-dimensional sources (Analysis Services and SAP BusinessObjects)
	-   Show Selected Items option
	-   Improved Search capabilities in the Navigator tree
-   New Transformations
	-   Age and Subtract operations for Date/Time columns
	-   Aggregate Columns: Option to disable new columns’ prefix
-   Field List improvements
	-   Expand/Collapse tables
	-   Hide/Unhide fields
	-   Optimized layout (spacing, margins, and fonts)
-   Report Pages Navigation - Keyboarding support
-   Lots of bug fixes

<iframe width="500" height="281" src="https://www.youtube.com/embed/-bZFeS1S1wU" frameborder="0" allowfullscreen></iframe>

**January 2015 Update (2.19.3923.101)**

This month we've made a number of improvements and bug fixes under the covers. Please try out the new version and continue to send us feedback if you find any issues!

