<properties 
   pageTitle="Data refresh in Power BI"
   description="Data refresh in Power BI"
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
# Data refresh in Power BI

[← Get data](https://support.powerbi.com/knowledgebase/topics/63369-get-data)

Whenever you're reporting on data that's changing, it's important the data behind your reports is up-to-date. Power BI supports refresh for datasets that connect to and get data from both on-premises and online data sources.
﻿
## Data sources that support refresh

SCHEDULE REFRESH and REFRESH NOW are supported for datasets from:

-   Content packs from online data sources (content packs\\services). By default, datasets from content packs are automatically updated once a day, but you can also refresh manually or setup a refresh schedule.
-   Excel workbooks where Power Query or Power Pivot is used to connect to and query data from a supported online or on-premises data source.\*
-   Power BI Desktop files where Get Data is used to connect to and query data from a supported online or on-premises data source. 

### Supported on-premises data sources:

**![](media/powerbi-refresh-data/important.png) Important:** In order to refresh data from an on-premises data source, a Power BI Personal Gateway is required. To learn more, see [Power BI Personal Gateway](https://support.powerbi.com/knowledgebase/articles/649846-power-bi-personal-gateway).

-   Access Database
-   Custom SQL/Native SQL
-   Custom ODBC Drivers
-   File (CSV, XML, Text, Excel, Folder)
-   IBM DB2 Database
-   MySQL Database
-   Oracle Database
-   PostgreSQL Database
-   SharePoint List
-   SQL Server Database
-   SQL Server Analysis Services Tabular and Multidimensional models (data import scenario)\*\*
-   Sybase Database
-   Teradata Database

### Supported online data sources:

-   AppFigures (Beta)
-   Azure Blob store
-   Azure HD Insight
-   Azure Marketplace
-   Azure SQL Database\*\*\*
-   Azure Table store
-   Blank query (query that is not accessing any data source)
-   Dynamics CRM Online
-   Facebook
-   GitHub (Beta)
-   Google Analytics
-   Hadoop File (HDFS)
-   OData Feed
-   Salesforce
-   SharePoint Online
-   Sweet IQ (Beta)
-   Twilio (Beta)
-   QuickBooks Online (Beta)
-   Web
-   Zendesk (Beta)# Refresh your data

##Refresh your data
﻿There are two ways you can refresh a dataset, SCHEDULE REFRESH and REFRESH NOW. Either way, you’ll first need to specify credentials so Power BI can connect to the data source. Once specified, they are retained in that dataset's settings and you won’t have to enter them again.

## To specify credentials

1. ﻿In Power BI navigator, in **Datasets**, select a dataset \> **Open Menu**.

	![](media/powerbi-refresh-data/RefreshData_ConfigCred_1.png)

2. ﻿Click **SCHEDULE REFRESH** or **REFRESH NOW**.

	![](media/powerbi-refresh-data/RefreshData_ConfigCred_2.png)

3. In **Edit Credentials**, click **Edit**.

	![](media/powerbi-refresh-data/RefreshData_ConfigCred_3.png)

4. Select the type of **Authentication Method**, and enter account credentials. The type of authentication and credentials depend on the type of data source being connected to.

	![](media/powerbi-refresh-data/RefreshData_ConfigCred_4.png)

## To setup a refresh schedule

>NOTE: Refreshing data more frequently than daily is only available with [Power BI Pro](https://support.powerbi.com/knowledgebase/articles/685479).

1.  In Power BI navigation pane, in **Datasets**, select a dataset \> Open Menu \> **SCHEDULE REFRESH**.

	![](media/powerbi-refresh-data/RefreshData_RefSched_1.png)

2.  In **Settings for…** \> **Schedule Refresh**, set **Keep your data up-to-date** to **Yes**.

	![](media/powerbi-refresh-data/RefreshData_RefSched_2.png)

3. Select Refresh frequency, Time zone, Time, and **Send refresh failure notification** settings, and then click **Apply**.


## To refresh now

﻿In Power BI navigator, in **Datasets**, select a dataset > **Open Menu** > **REFRESH NOW**.

![](media/powerbi-refresh-data/RefreshData_RefNow_1.png)

## More about refreshing your data

In Power BI, you refresh datasets because this is where the data behind your reports is. You might be thinking ‘but, I uploaded an Excel worksheet that gets data from a SQL database’. Well, that’s true, but when you uploaded that Excel workbook into Power BI, the data, or more importantly, the connections from them are imported into Power BI to become a dataset. Once in Power BI, the data is stored in a model that keeps it in-memory and in a structure that makes it easy for visualizations in your reports and dashboards to change and recalculate metrics quickly. When Power BI refreshes data in the dataset, it uses connection information in the dataset to connect to the data source and get updates.

### When to refresh data

﻿﻿You will want to refresh your dataset as often as that data is updated at the source. For most data sources, data is updated daily, usually during the evening. If you schedule refresh, select days and times that will reflect the latest update from the source, but also provide an updated view of that data in Power BI when you need it most. For example, if your dataset connects to a SQLAzure database, and that database is updated every night at midnight, you'll want to schedule your dataset refresh between 12:00am and 6:00am. That way, when you get it in the morning and check your dashboards, they’ll reflect the most up-to-date data from the SQLAzure database﻿. You can always check the last time a refresh happened, or when the next refresh is scheduled by clicking the **Open Menu** icon next to a dataset.

### Authentication

﻿﻿﻿In order for Power BI to refresh your dataset, you will need to provide credentials and sign in to any data sources included in the dataset. The type of credentials required and the Authentication Method depend on the type of data source. A default Authentication Method will be selected for you; however, if you're unsure about what the Authentication Method setting should be, check with your data source administrator.

You will only be required to enter credentials the first time you use refresh. Once entered, those credentials will be retained as part of refresh settings for that dataset. If you get data from another workbook that uses the same data source in a dataset you've already configured credentials for, you won't need to configure credentials again for your new dataset﻿.

Keep in-mind, if the password you use to sign in to a data source expires or is changed, you'll need to change it for the data source in Manage Data Sources too.

### ![](media/powerbi-refresh-data/important.png) Important notes

- For Excel 2013 workbooks, make sure you've downloaded the latest version of Power Query before saving and uploading your workbook to Power BI.
- The data import scenario describes using Power Query or Power Pivot in Excel, or Power BI Desktop to connect to and import data from a SQL Server Analysis Server Tabular or Multidimensional model. This is different from connecting to an Analysis Services Tabular model by using the Power BI Analysis Services Connector, which creates a live connection to model data. In the live connection scenario, there's no need to schedule refresh. Model data you see in Power BI is automatically refreshed about every ten minutes.
- ﻿If you're having trouble scheduling refresh, be sure check out  [Troubleshooting scheduled refresh for Azure SQL databases in Power BI](https://support.powerbi.com/knowledgebase/articles/527228-troublehooting-scheduled-refresh-for-azure-sql-dat).
- To setup scheduled refresh for an Excel workbook that connects to an OData feed, you must use Power Query (Get & Transform Data in Excel 2016) to connect to the OData feed. OData feeds connected by using Power Pivot in Excel is not supported for scheduled refresh.

Besides the data source and authentication type, there is another restriction that could determine whether or not an Excel workbook for refresh. If you've loaded the data to an Excel worksheet, it cannot be scheduled for refresh. The alternative is to load the query directly into the data model by changing the query’s load settings.

