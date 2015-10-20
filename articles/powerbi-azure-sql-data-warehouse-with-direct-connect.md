<properties 
   pageTitle="Azure SQL Data Warehouse with direct connect"
   description="Azure SQL Data Warehouse with direct connect"
   services="powerbi" 
   documentationCenter="" 
   authors="v-aljenk" 
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
   ms.author="v-aljenk"/>

# Azure SQL Data Warehouse with direct connect

[← Databases and more](https://support.powerbi.com/knowledgebase/topics/88773-databases-and-more)

Azure SQL Data Warehouse connector allows users to leverage powerful logical pushdown alongside the analytic capabilities of Power BI. With direct connect, queries are sent back to your Azure SQL Data Warehouse in real time as you explore the data. This, combined with the scale of SQL Data Warehouse enables users to create dynamic reports in minutes against terabytes of data. In addition, the introduction of the **﻿Open in Power BI **﻿button allows users to directly connect Power BI to their SQL Data Warehouse without having to manually specify the information.

NOTES: When using the SQL Data Warehouse connector:

-   specify the fully qualified server name when connecting (see below for details)

-   ensure firewall rules for the database are configured to "Allow access to Azure services"

-   every action such as selecting a column or adding a filter will directly query the data warehouse

-   tiles are set to refresh approximately every 15 minutes and refresh does not need to be scheduled

-   Q&A is not available for direct connect datasets

-   schema changes are not picked up automatically

-   Groups are only available with [Power BI Pro](https://support.powerbi.com/knowledgebase/articles/685479).

These restrictions and notes may change as we continue to improve the experiences. The step to connect are detailed below.

### Using the 'Open in Power BI' button

The easiest way to move between your SQL Data Warehouse and Power BI is with the **﻿Open in Power BI **﻿button. This button allows you to seamlessly begin creating new dashboards in Power BI.

1. To get started, navigate to your SQL Data Warehouse instance in the Azure Portal. Please note that SQL Data Warehouse only have a presence in the Azure Preview portal at this time.

2. Click the **﻿Open in Power BI**﻿ button

   ![](media/powerbi-azure-sql-data-warehouse-with-direct-connect/Open.png)

3. If we are not able to sign you in directly or if you do not have a Power BI account, you will need to sign in.

4. You will be directed to the SQL Data Warehouse connection page, with the information from your SQL Data Warehouse pre-populated. Enter your credentials and hit connect to create a connection.

### Connecting through Power BI

SQL Data Warehouse is also listed on the Power BI Get Data page. 

1. Select **Get Data﻿** at the bottom of the left navigation pane.  

   ![](media/powerbi-azure-sql-data-warehouse-with-direct-connect/GetDatabutton.png)

2. Select **Databases & More**﻿.

   ![](media/powerbi-azure-sql-data-warehouse-with-direct-connect/DatabasesMore.png)

3. Select the **SQL Data Warehouse** connector. \>**﻿ Connect.**

   ![](media/powerbi-azure-sql-data-warehouse-with-direct-connect/AzureSQLDataWarehouse.png)

4. Enter the necessary information to connect. The **﻿Finding Parameters**﻿ section below shows where this data can be located in your Azure Portal.

   ![](media/powerbi-azure-sql-data-warehouse-with-direct-connect/AzureSQLDataWarehouse2.png)

5. Drill into the dataset by selecting the new tile or the newly created dataset, indicated by the asterisk. This dataset will have the same name as your database.

   ![](media/powerbi-azure-sql-data-warehouse-with-direct-connect/Dataset.PNG)

6. You can explore all of the tables and columns. Selecting a column will send a query back to the source, dynamically creating your visual. Filters will also be translated into queries back to your data warehouse. These visuals can be saved in a new report and pinned back to your dashboard.

   ![](media/powerbi-azure-sql-data-warehouse-with-direct-connect/Explore2.png)

### Finding Parameter Values

Your fully qualified server name and database name can be found in the Azure Portal. Please note that SQL Data Warehouse only have a presence in the Azure Preview portal at this time.

