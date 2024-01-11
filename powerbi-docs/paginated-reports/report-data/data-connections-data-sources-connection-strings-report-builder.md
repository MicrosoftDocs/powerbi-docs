---
title: "Create data connection strings (Power BI Report Builder)"
description: Learn how to create data connection strings and learn important information related to data source credentials.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---
# Create data connection strings (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  To include data in paginated reports, you must first create a *connection string* to your *data source*. This article explains how to create data connection strings and important information related to data source credentials. A data source includes the data source type, connection information, and the type of credentials to use. For more background, see [Intro to Report Data in Power BI Report Builder](report-data.md).
  
##  <a name="bkmk_DataConnections"></a> Available data sources
 For a full list of supported data sources, see [Supported data sources for Power BI paginated reports](../paginated-reports-data-sources.md).
  
##  <a name="bkmk_connection_examples"></a> Common connection string examples  
 Connection strings are the text representation of connection properties for a data provider. The following table lists some examples of connections strings for various data connection types.  
 
> [!NOTE]  
>  [Connectionstrings.com](https://www.connectionstrings.com/) is another resource to get examples for connection strings. 
  
|**Data source**|**Example**|**Description**|  
|---------------------|-----------------|---------------------|  
|SQL Server named instance|`Data Source=<host>\MSSQL15.<InstanceName>; Initial Catalog=AdventureWorks`|Set data source type to **Microsoft SQL Server**.|  
|Azure SQL Database|`Data Source=<host>.database.windows.net; Initial Catalog=AdventureWorks; Encrypt=True`|Set data source type to **Microsoft Azure SQL Database**.|
|Analysis Services tabular model database with Sales perspective|`Data Source=<servername>; Initial Catalog=Adventure Works DW; cube='Sales'`|Set data source type to **Microsoft SQL Server Analysis Services**. Specify perspective name in cube= setting.|  
|Azure Analysis Services|`Data Source=asazure://aspaaseastus2.asazure.windows.net/<server name>; Initial Catalog=AdventureWorks`|Set data source type to **Azure Analysis Services**.| 
|Oracle server|`Data Source=<host>`|Set the data source type to **Oracle Database**. The Oracle client tools must be installed on the Report Builder computer and on the machine hosting Power BI Gateway. For more information, see [Oracle Connection Type &#40;Power BI Report Builder&#41;](./oracle-connection-type.md).|
|Teradata data source|`Database=<database name>; Data Source=<NNN>.<NNN>.<NNN>.<NNN>; Use X Views=False; Restrict to Default Database=True`|Set the data source type to **Teradata**, similar to the previous example. Only use the default database that is specified in the Database tag, and do not automatically discover data relationships.|
| Power BI semantic model | `Data Source=powerbi://api.powerbi.com/v1.0/myorg/<workspacename>;  Initial Catalog=<datasetname>` | Set data source type to **Microsoft SQL Server Analysis Services** and under Credentials tab, select "Do not use credentials". |

##  <a name="bkmk_Expressions_in_connection_strings"></a> Expression-based connection strings  
 > [!NOTE]  
 > Expression-based connection strings are not supported on Power BI service

## Related content

- [Supported data sources for Power BI paginated reports](../paginated-reports-data-sources.md)
- [On-premises data gateway in-depth](../../connect-data/service-gateway-onprem-indepth.md)
- [Add or remove a gateway data source](../../connect-data/service-gateway-data-sources.md)
