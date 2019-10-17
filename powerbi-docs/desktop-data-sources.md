---
title: Data sources in Power BI Desktop
description: Data sources in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/14/2019
ms.author: davidi

LocalizationGroup: Connect to data
---
# Data sources in Power BI Desktop
With Power BI Desktop, you can connect to data from many different sources. A full list of available data sources is at the bottom of this page.

To connect to data, select **Get Data** from the **Home** ribbon. Selecting the down arrow, or the **Get Data** text on the button, shows the **Most Common** data types menu shown in the following image:

![Get Data in Power BI Desktop](media/desktop-data-sources/data-sources-01.png)

Selecting **More…** from the **Most Common** menu displays the **Get Data** window. You can also bring up the **Get Data** window (and bypass the **Most Common** menu) by selecting the **Get Data** **icon button** directly.

![Get Data button](media/desktop-data-sources/data-sources-02.png)

> [!NOTE]
> The Power BI team is continually expanding the data sources available to **Power BI Desktop** and the **Power BI service**. As such, you'll often see early versions of work-in-progress data sources marked as *Beta* or *Preview*. Any data source marked as *Beta* or *Preview* has limited support and functionality, and should not be used in production environments. 

> Additionally, any data source marked as *Beta* or *Preview* for **Power BI Desktop** may not be available for use in the **Power BI service** or other Microsoft services until the data source becomes generally available (GA).

## Data Sources
Data types are organized in the following categories:

* All
* File
* Database
* Power BI
* Azure
* Online Services
* Other

The **All** category includes all data connection types from all categories.

The **File** category provides the following data connections:

* Excel
* Text/CSV
* XML
* JSON
* Folder
* PDF
* SharePoint Folder

The following image shows the **Get Data** window for **File**.

![Get Data > File](media/desktop-data-sources/data-sources-03.png)

The **Database** category provides the following data connections:

* SQL Server Database
* Access Database
* SQL Server Analysis Services Database
* Oracle Database
* IBM DB2 Database
* IBM Informix database (Beta)
* IBM Netezza
* MySQL Database
* PostgreSQL Database
* Sybase Database
* Teradata
* SAP HANA Database
* SAP Business Warehouse Application Server
* SAP Business Warehouse Message Server
* Amazon Redshift
* Impala
* Google BigQuery
* Vertica
* Snowflake
* Essbase
* AtScale cubes (Beta)
* BI Connector
* Dremio
* Exasol
* Indexima (Beta)
* InterSystems IRIS (Beta)
* Jethro (Beta)
* Kyligence Enterprise (Beta)
* MarkLogic (Beta)

> [!NOTE]
> Some database connectors require that you enable them by selecting **File > Options and settings > Options** then selecting **Preview Features** and enabling the connector. If you don't see some of the connectors mentioned above and want to use them, check your **Preview Features** settings. Also note that any data source marked as *Beta* or *Preview* has limited support and functionality, and should not be used in production environments.

The following image shows the **Get Data** window for **Database**.

![Get Data > Databases](media/desktop-data-sources/data-sources-04.png)

The **Power Platform** category provides the following data connections:

* Power BI datasets
* Power BI dataflows
* Common Data Service
* Power Platform dataflows (Beta)

The following image shows the **Get Data** window for **Power Platform**.

![Get Data > Power BI](media/desktop-data-sources/data-sources-05.png)

The **Azure** category provides the following data connections:

* Azure SQL Database
* Azure SQL Data Warehouse
* Azure Analysis Services database
* Azure Blob Storage
* Azure Table Storage
* Azure Cosmos DB
* Azure Data Lake Storage Gen2 (Beta)
* Azure Data Lake Storage Gen1
* Azure HDInsight (HDFS)
* Azure HDInsight Spark
* HDInsight Interactive Query
* Azure Data Explorer (Kusto)
* Azure Cost Management (Beta)

The following image shows the **Get Data** window for **Azure**.

![Get Data > Azure](media/desktop-data-sources/data-sources-06.png)

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
* Facebook
* GitHub (Beta)
* MailChimp (Beta)
* Marketo (Beta)
* Mixpanel (Beta)
* Planview Enterprise One - PRM (Beta)
* Planview Projectplace (Beta)
* QuickBooks Online (Beta)
* Smartsheet
* SparkPost (Beta)
* Stripe (Beta)
* SweetIQ (Beta)
* Planview Enterprise One - CMT (Beta)
* Twilio (Beta)
* tyGraph (Beta)
* Webtrends (Beta)
* Zendesk (Beta)
* Dynamics 365 Customer Insights (Beta)
* Emigo Data Source (Beta)
* Entersoft Business Suite (Beta)
* Industrial App Store
* Intune Data Warehouse (Beta)
* Microsoft Graph Security (Beta)
* Quick Base
* TeamDesk (Beta)


The following image shows the **Get Data** window for **Online Services**.

![Get Data > Online Services](media/desktop-data-sources/data-sources-07.png)

The **Other** category provides the following data connections:

* Web
* SharePoint List
* OData Feed
* Active Directory
* Microsoft Exchange
* Hadoop File (HDFS)
* Spark
* R Script
* Python script
* ODBC
* OLE DB
* BI360 - Budgeting & Financial Reporting (Beta)
* Denodo
* Information Grid (Beta)
* Paxata 
* QubolePresto (Beta)
* Roamler (Beta)
* SurveyMonkey (Beta)
* Tenforce (Smart)List (Beta)
* Workforce Dimensions (Beta)
* Blank Query

The following image shows the **Get Data** window for **Other**.

![Get Data > Other](media/desktop-data-sources/data-sources-08.png)

> [!NOTE]
> At this time, it's not possible to connect to custom data sources secured using Azure Active Directory.

## Connecting to a Data Source
To connect to a data source, select the data source from the **Get Data** window and select **Connect**. In the following image, **Web** is selected from the **Other** data connection category.

![Connect to web](media/desktop-data-sources/data-sources-08.png)

A connection window is displayed, specific to the type of data connection. If credentials are required, you’ll be prompted to provide them. The following image shows a URL being entered to connect to a Web data source.

![input web URL](media/desktop-data-sources/datasources-fromwebbox.png)

When the URL or resource connection information is entered, select **OK**. Power BI Desktop makes the connection to the data source, and presents the available data sources in the **Navigator**.

![Navigator screen](media/desktop-data-sources/datasources-fromnavigatordialog.png)

You can either load the data by selecting the **Load** button at the bottom of the **Navigator** pane, or edit the query before loading data by selecting the **Edit** button.

That’s all there is to connecting to data sources in Power BI Desktop! Try connecting to data from our growing list of data sources, and check back often - we continue to add to this list all the time.

## Using PBIDS files to get data

PBIDS files are Power BI Desktop files that have a specific structure, and have a .PBIDS extension to identify it is a Power BI data source file.

You can create a .PBIDS file to streamline the **Get Data** experience for report creators in your organization. It’s recommended that administrators create these files for commonly used connections, to facilitate the use of PBIDS files for new report authors. 

When an author opens a .PBIDS file, Power BI Desktop opens and prompt the user for credentials to authenticate and connect to the data source that's specified in the file. The Navigation dialog appears, and the user must select the tables from that data source to load into the model. Users may also need to select the database(s) if one was not specified in the .PBIDS file. 

From that point forward, the user can begin building visualizations or revisit *Recent sourcesU to load a new set of tables into the model. 

Currently, .PBIDS files only support support a single data source in one file. Specifying more than one data source results in an error. 

To create the .PBIDS file, administrators must specify the required inputs for a single connection, and can specify the mode of the connection, as either **DirectQuery** or **Import**. If **mode** is missing/null in the file, the user who opens the file in Power BI Desktop is prompted to select DirectQuery or Import. 

### PBIDS file examples

This section provides some examples from commonly used data sources. The .PBIDS file type only supports data connections that are also supported in Power BI Desktop, with two exceptions: Live Connect and Blank query. 

The .PBIDS file does *not* include authentication information and table and schema information.  

The following are several common examples for .PBIDS file, and are not complete or comprehensive. For other data sources, you can refer to the [Data Source Reference (DSR) format for protocol and address information](https://docs.microsoft.com/azure/data-catalog/data-catalog-dsr#data-source-reference-specification).

These examples are for convenience only, are not meant to be comprehensive, and do not include all supported connectors in DSR format. Administrators or organizations can create their own data sources using these examples as guides, from which they can create and support their own data source files. 


**Azure AS**
```
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


 

**Folder**
```
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

**OData**
```
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
 
**SAP BW**
```
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
 
**SAP Hana**
```
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

**SharePoint List**

The URL must point to the SharePoint site itself, and not to a list within the site. Users get a navigator that allows them to select one or more lists from that site, each of which becomes a table in the model. 
```
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
 
 
**SQL Server**
```
{ 
  “version”: “0.1”, 
  “connections”: [ 
    { 
      “details”: { 
        “protocol”: “tds”, 
        “address”: { 
          “server”: “server-name-here”, 
          “database”: “db-name-here (optional)” 
        } 
      }, 
      “options”: {}, 
      “mode”: “DirectQuery” 
    } 
  ] 
} 
} 
```
 

**Text file**
```
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
 

**Web**
```
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
 



## Next steps
There are all sorts of things you can do with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](desktop-what-is-desktop.md)
* [Query Overview with Power BI Desktop](desktop-query-overview.md)
* [Data Types in Power BI Desktop](desktop-data-types.md)
* [Shape and Combine Data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common Query Tasks in Power BI Desktop](desktop-common-query-tasks.md)    
