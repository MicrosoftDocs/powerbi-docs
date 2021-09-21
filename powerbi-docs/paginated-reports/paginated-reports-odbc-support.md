---
title: "Power BI gateway and Report Builder support for ODBC data sources (preview)"
description: This article spells out how to configure ODBC data sources in the Power BI gateway, and how to use ODBC data sources in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: swgupt
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 09/01/2021
---

# Power BI gateway and Report Builder support for ODBC data sources (preview)


[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] 

This article spells out how to configure ODBC data sources in the Power BI gateway, and how to use ODBC data sources in Power BI Report Builder.

Data Source Name (DSN) and driver connection strings are both supported. 

>[!NOTE]
>Power BI Report Builder is now 64-bit, and will no longer work with 32-bit drivers. Both Power BI Report Builder and The Power BI Gateway require the 64-bit version.

## Before you install the Power BI gateway

You need a Power BI gateway version February 2021 or later. We recommend installing the gateway on a separate machine from Power BI Report Builder or Power BI Desktop.  There are some scenarios where using the same machine might cause problems. 

## Install, configure Power BI Report Builder for ODBC data source

The latest version of Power BI Report Builder already contains the ODBC data extension.

1.	Install the latest version of [Power BI Report Builder](https://go.microsoft.com/fwlink/?linkid=2086513).
2.	Install the 64-bit ODBC driver that you plan to use with Power BI Report Builder.

## Install Power BI gateway, configure ODBC data sources

Follow these steps to set up the Power BI gateway for ODBC data sources.

1.	Download the latest [Power BI gateway](https://powerbi.microsoft.com/gateway).

    >[!NOTE]
    >Personal gateways aren't supported for paginated reports, because they require DirectQuery support.

2.	Refer to the article [What is an on-premises data gateway?](../connect-data/service-gateway-onprem.md) for information on setting it up.
3.	Install the 64-bit ODBC driver that you plan to use on the gateway machine.

    >[!NOTE]
    >File DSNs aren't supported. If you'd like to use a DSN, create a 64-bit [System DSN](/previous-versions/windows/desktop/odbc/dn170519(v=vs.85)) on the gateway machine.

1. To configure an ODBC data source in the **Manage Gateway** page of the Power BI Service, select **Add data source** >  **ODBC Data Source Type**:

    :::image type="content" source="media/paginated-reports-odbc-support/configure-datasource.png" alt-text="Add data source":::

1. Paste in the connection string (System DSN or driver) and select an authentication method. For ODBC data sources the following authentication methods are supported:

    - Basic
    - Windows

1. When you select the **Add** button, the Power BI service connects to the ODBC data source using the supplied connection string and credentials to validate that the gateway is able to connect.

    >[!NOTE]
    >For the public preview, the Anonymous authentication method isn't supported. You can select it for an ODBC data source, but you receive an "Unexpected error occurred" like the following one when rendering the report:

    :::image type="content" source="media/paginated-reports-odbc-support/anonymouse-error.png" alt-text="Anonymous authentication isn't supported.":::

### ODBC connection string examples

Here are some ODBC connection string examples for a System DSN, as well as a variety of ODBC drivers:

- "dsn=Northwind"
- "driver={Microsoft Access Driver (*.mdb, *.accdb)};dbq=c:\Data\Northwind.mdb"
- "driver={SnowflakeDSIIDriver};warehouse=DEMO_WH;server=<span>org.snowflakecomputing</span>.com"
- "driver={Amazon Redshift (x64)};server=<span>org.us-west-2.redshift.amazonaws</span>.com;database=dev"

Certain drivers and configurations might not support all authentication methods.

In addition to creating ODBC data sources in the Gateway up front, you can create ODBC data sources on demand when you upload a paginated report. If an ODBC data source doesn’t exist, the Upload process prompts you to create one:

:::image type="content" source="media/paginated-reports-odbc-support/gateway-binding.png" alt-text="Create data source prompt.":::

## Known issues

In general, all the limitations that apply to using the ODBC data extension in Power BI Report Builder apply to using the ODBC data extensions in the Power BI gateway as well.

Here are some of the known limitations:

- For most ODBC drivers DateTime parameters require changes to the Command text in the RDL dataset to cast a DateTime parameter value to the appropriate format for a given ODBC data source.  

    Example query:  
    `SELECT * FROM DEMO_DB.PUBLIC.DATES WHERE DATE < DATE(?)`

    >[!NOTE]
    >Some data sources might require specific formatting. You can use an expression to format the parameter in the example above. For example, `=Format(Parameters!Date.Value, "yyyy-MM-dd")`.

- For some ODBC drivers, there is a behavior difference between the Gateway and Power BI Report Builder. This may apply to all, some, or just one driver. One known example is that the Simba-BigQuery query requires casting of the parameter if it is not a string type. 

   Example error string: "A data source used by this report returned an error. An exception encountered while accessing the target data source ERROR [42000] [Simba][BigQuery] (70) Invalid query: No matching signature for operator = for argument types: INT64, STRING. Supported signature: ANY = ANY at [2:7]"

   Example query with proper cast for an INT64 column:  
   `SELECT * FROM 'teamplz.Sample.SampleTable' WHERE DataID=CAST(? as INT64)`

- Any special data types exposed by a given ODBC driver or backend that aren't simply mapped to an <span>ADO.Net</span> data type aren't supported. One example is the Snowflake Array data type.
- Scenarios where ODBC drivers use stored procedures without parameters are generally not supported. However, the Amazon Redshift driver has in/out parameters that are supported.
