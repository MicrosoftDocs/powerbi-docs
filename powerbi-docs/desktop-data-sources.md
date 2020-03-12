---
title: Data sources in Power BI Desktop
description: Data sources in Power BI Desktop
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 02/13/2020
ms.author: davidi

LocalizationGroup: Connect to data
---
# Data sources in Power BI Desktop

With Power BI Desktop, you can connect to data from many different sources. For a full list of available data sources, see [Power BI data sources](power-bi-data-sources.md).

You connect to data by using the **Home** ribbon. To show the **Most Common** data types menu, select the **Get Data** button label or the down arrow.

![Most Common data types menu, Get Data in Power BI Desktop](media/desktop-data-sources/data-sources-01.png)

To go to the **Get Data** dialog box, show the **Most Common** data types menu and select **More**. You can also bring up the **Get Data** dialog box (and bypass the **Most Common** menu) by selecting the **Get Data** icon directly.

![Get Data button, Power BI desktop](media/desktop-data-sources/data-sources-02.png)

> [!NOTE]
> The Power BI team is continually expanding the data sources available to Power BI Desktop and the Power BI service. As such, you'll often see early versions of work-in-progress data sources marked as **Beta** or **Preview**. Any data source marked as **Beta** or **Preview** has limited support and functionality, and it shouldn't be used in production environments. Additionally, any data source marked as **Beta** or **Preview** for Power BI Desktop may not be available for use in the Power BI service or other Microsoft services until the data source becomes generally available (GA).

> [!NOTE]
> There are many data connectors for Power BI Desktop that require Internet Explorer 10 (or newer) for authentication. 


## Data sources

The **Get Data** dialog box organizes data types in the following categories:

* All
* File
* Database
* Power Platform
* Azure
* Online Services
* Other

The **All** category includes all data connection types from all categories.

### File data sources

The **File** category provides the following data connections:

* Excel
* Text/CSV
* XML
* JSON
* Folder
* PDF
* SharePoint folder

The following image shows the **Get Data** window for **File**.

![File data sources, Get Data dialog box, Power BI Desktop](media/desktop-data-sources/data-sources-03.png)

### Database data sources

The **Database** category provides the following data connections:

* SQL Server database
* Access database
* SQL Server Analysis Services database
* Oracle database
* IBM DB2 database
* IBM Informix database (Beta)
* IBM Netezza
* MySQL database
* PostgreSQL database
* Sybase database
* Teradata database
* SAP HANA database
* SAP Business Warehouse Application Server
* SAP Business Warehouse Message Server
* Amazon Redshift
* Impala
* Google BigQuery
* Vertica
* Snowflake
* Essbase
* AtScale cubes
* BI Connector
Data Virtuality LDW (Beta)
* Denodo
* Dremio
* Exasol
* Indexima (Beta)
* InterSystems IRIS (Beta)
* Jethro (Beta)
* Kyligence
* MarkLogic

> [!NOTE]
> Some database connectors require that you enable them by selecting **File > Options and settings > Options** then selecting **Preview Features** and enabling the connector. If you don't see some of the connectors mentioned above and want to use them, check your **Preview Features** settings. Also note that any data source marked as *Beta* or *Preview* has limited support and functionality, and should not be used in production environments.

The following image shows the **Get Data** window for **Database**.

![Database data sources, Get Data dialog box, Power BI Desktop](media/desktop-data-sources/data-sources-04.png)

### Power Platform data sources

The **Power Platform** category provides the following data connections:

* Power BI datasets
* Power BI dataflows
* Common Data Service
* Power Platform dataflows

The following image shows the **Get Data** window for **Power Platform**.

![Power Platform data sources, Get Data dialog box, Power BI Desktop](media/desktop-data-sources/data-sources-05.png)

### Azure data sources

The **Azure** category provides the following data connections:

* Azure SQL database
* Azure SQL Data Warehouse
* Azure Analysis Services database
* Azure Blob Storage
* Azure Table Storage
* Azure Cosmos DB
* Azure Data Lake Storage Gen2
* Azure Data Lake Storage Gen1
* Azure HDInsight (HDFS)
* Azure HDInsight Spark
* HDInsight Interactive Query
* Azure Data Explorer (Kusto)
* Azure Cost Management
* Azure Time Series Insights (Beta)

The following image shows the **Get Data** window for **Azure**.

![Azure data sources, Get Data dialog box, Power BI Desktop](media/desktop-data-sources/data-sources-06.png)

### Online Services data sources

The **Online Services** category provides the following data connections:

* SharePoint Online List
* Microsoft Exchange Online
* Dynamics 365 (online)
* Dynamics NAV
* Dynamics 365 Business Central
* Dynamics 365 Business Central (on-premises)
* Microsoft Azure Consumption Insights (Beta)
* Azure DevOps (Beta)
* Azure DevOps Server (Beta)
* Salesforce Objects
* Salesforce Reports
* Google Analytics
* Adobe Analytics
* appFigures (Beta)
* Data.World - Get Dataset (Beta)
* GitHub (Beta)
* LinkedIn Sales Navigator (Beta)
* MailChimp (Beta)
* Marketo (Beta)
* Mixpanel (Beta)
* Planview Enterprise One - PRM (Beta)
* Planview Projectplace (Beta)
* QuickBooks Online (Beta)
* Smartsheet
* SparkPost (Beta)
* SweetIQ (Beta)
* Planview Enterprise One - CTM (Beta)
* Twilio (Beta)
* tyGraph (Beta)
* Webtrends (Beta)
* Zendesk (Beta)
* Dynamics 365 Customer Insights (Beta)
* Emigo Data Source
* Entersoft Business Suite (Beta)
* FactSet Analytics (Beta)
* Industrial App Store
* Intune Data Warehouse (Beta)
* Microsoft Graph Security (Beta)
* Product Insights (Beta)
* Quick Base
* TeamDesk (Beta)
* Workplace Analytics (Beta)

The following image shows the **Get Data** window for **Online Services**.

![Online Services data sources, Get Data dialog box, Power BI Desktop](media/desktop-data-sources/data-sources-07.png)

### Other data sources

The **Other** category provides the following data connections:

* Web
* SharePoint list
* OData Feed
* Active Directory
* Microsoft Exchange
* Hadoop File (HDFS)
* Spark
* R script
* Python script
* ODBC
* OLE DB
* BI360 - Budgeting & Financial Reporting (Beta)
* FHIR
* Information Grid (Beta)
* Jamf Pro (Beta)
* MicroStrategy for Power BI
* Paxata
* QubolePresto (Beta)
* Roamler (Beta)
* Siteimprove (Beta)
* SurveyMonkey (Beta)
* Tenforce (Smart)List (Beta)
* Vena (Beta)
* Workforce Dimensions (Beta)
* Zucchetti HR Infinity (Beta)
* Blank Query

The following image shows the **Get Data** window for **Other**.

![Other data sources, Get Data dialog box, Power BI Desktop](media/desktop-data-sources/data-sources-08.png)

> [!NOTE]
> At this time, it's not possible to connect to custom data sources secured using Azure Active Directory.

## Connecting to a data source

To connect to a data source, select the data source from the **Get Data** window and select **Connect**. In the following image, **Web** is selected from the **Other** data connection category.

![Connect to web, Get Data dialog box, Power BI Desktop](media/desktop-data-sources/data-sources-08.png)

A connection window is displayed, specific to the type of data connection. If credentials are required, you’ll be prompted to provide them. The following image shows a URL being entered to connect to a Web data source.

![Input URL, From Web dialog box, Power BI Desktop](media/desktop-data-sources/datasources-fromwebbox.png)

Enter the URL or resource connection information, and then select **OK**. Power BI Desktop makes the connection to the data source, and it presents the available data sources in the **Navigator**.

![Navigator dialog box, Power BI Desktop](media/desktop-data-sources/datasources-fromnavigatordialog.png)

To load the data, select the **Load** button at the bottom of the **Navigator** pane. To transform or edit the query in Power Query Editor before loading the data, select the **Transform Data** button.

That’s all there is to connecting to data sources in Power BI Desktop! Try connecting to data from our growing list of data sources, and check back often - we continue to add to this list all the time.

## Using PBIDS files to get data

PBIDS files are Power BI Desktop files that have a specific structure, and they have a .PBIDS extension to identify it is a Power BI data source file.

You can create a PBIDS file to streamline the **Get Data** experience for report creators in your organization. To make it easier for a new report author to use PBIDS files, we recommend that an administrator create these files for commonly used connections.

When an author opens a PBIDS file, Power BI Desktop opens and prompts the user for credentials to authenticate and connect to the data source that's specified in the file. The **Navigation** dialog box appears, and the user must select the tables from that data source to load into the model. Users may also need to select the database(s) if none was specified in the PBIDS file.

From that point forward, the user can begin building visualizations or select **Recent Sources** to load a new set of tables into the model.

Currently, PBIDS files only support a single data source in one file. Specifying more than one data source results in an error.

To create the PBIDS file, an administrator must specify the required inputs for a single connection. They can also specify the connection mode as either DirectQuery or Import. If **mode** is missing/null in the file, the user who opens the file in Power BI Desktop is prompted to select **DirectQuery** or **Import**.

### PBIDS file examples

This section provides some examples from commonly used data sources. The PBIDS file type only supports data connections that are also supported in Power BI Desktop, with two exceptions: Live Connect and Blank Query.

The PBIDS file *doesn't* include authentication information and table and schema information.  

The following code snippets show several common examples for PBIDS files, but they aren't complete or comprehensive. For other data sources, you can refer to the [Data Source Reference (DSR) format for protocol and address information](https://docs.microsoft.com/azure/data-catalog/data-catalog-dsr#data-source-reference-specification).

These examples are for convenience only, aren't meant to be comprehensive, and don't include all supported connectors in DSR format. An administrator or organization can create their own data sources using these examples as guides, from which they can create and support their own data source files.

#### Azure AS

```json
{ 
    "version": "0.1", 
    "connections": [ 
    { 
        "details": { 
        "protocol": "analysis-services", 
        "address": { 
            "server": "server-here" 
        }, 
        } 
    } 
    ] 
}
```

#### Folder

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "folder", 
        "address": { 
            "path": "folder-path-here" 
        } 
      } 
    } 
  ] 
} 
```

#### OData

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "odata", 
        "address": { 
            "url": "URL-here" 
        } 
      } 
    } 
  ] 
} 
```

#### SAP BW

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "sap-bw-olap", 
        "address": { 
          "server": "server-name-here", 
          "systemNumber": "system-number-here", 
          "clientId": "client-id-here" 
        }, 
      } 
    } 
  ] 
} 
```

#### SAP Hana

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "sap-hana-sql", 
        "address": { 
          "server": "server-name-here:port-here" 
        }, 
      } 
    } 
  ] 
} 
```

#### SharePoint list

The URL must point to the SharePoint site itself, not to a list within the site. Users get a navigator that allows them to select one or more lists from that site, each of which becomes a table in the model.

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "sharepoint-list", 
        "address": { 
          "url": "URL-here" 
        }, 
       } 
    } 
  ] 
} 
```

#### SQL Server

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "tds", 
        "address": { 
          "server": "server-name-here", 
          "database": "db-name-here (optional) "
        } 
      }, 
      "options": {}, 
      "mode": "DirectQuery" 
    } 
  ] 
} 
```

#### Text file

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "file", 
        "address": { 
            "path": "path-here" 
        } 
      } 
    } 
  ] 
} 
```

#### Web

```json
{ 
  "version": "0.1", 
  "connections": [ 
    { 
      "details": { 
        "protocol": "http", 
        "address": { 
            "url": "URL-here" 
        } 
      } 
    } 
  ] 
} 
```

#### Dataflow

```json
{
  "version": "0.1",
  "connections": [
    {
      "details": {
        "protocol": "powerbi-dataflows",
        "address": {
          "workspace":"workspace id (Guid)",
          "dataflow":"optional dataflow id (Guid)",
          "entity":"optional entity name"
        }
       }
    }
  ]
}
```

## Next steps

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](desktop-what-is-desktop.md)
* [Query overview with Power BI Desktop](desktop-query-overview.md)
* [Data types in Power BI Desktop](desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](desktop-common-query-tasks.md)
