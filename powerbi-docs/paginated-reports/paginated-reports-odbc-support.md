---
title: "Power BI Gateway and Report Builder support for ODBC data sources (Public Preview)"
description: This article spells out how to configure ODBC data sources in the Power BI Gateway, and how to use ODBC data sources in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: swgupt
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 03/11/2021
---

# Power BI Gateway and Report Builder support for ODBC data sources (Public Preview)


[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-service](../includes/yes-service.md)] [!INCLUDE [yes-paginated](../includes/yes-paginated.md)] [!INCLUDE [yes-premium](../includes/yes-premium.md)] [!INCLUDE [no-desktop](../includes/no-desktop.md)] 

This article spells out how to configure ODBC data sources in the Power BI Gateway, and how to use ODBC data sources in Power BI Report Builder.

DSN and driver connection strings are both supported. Note that for Power BI Report Builder you need to install the 32-bit version of an ODBC driver, the Power BI Gateway requires the 64-bit version.


## Before installing the Power BI Gateway

It is recommended to install the Power BI Gateway on a separate machine from Power BI Report Builder or Power BI Desktop.  There are some scenarios where using the same machine might cause problems. For instance, DB2 does not allow 32-bit and 64-bit drivers to be installed side-by-side on the same machine.

## Installing and configuring Power BI Report builder for ODBC data source support

The latest Power BI Report Builder already contains the ODBC data extension and query designer, but both are not enabled by default. To configure it for ODBC data source support, follow the steps outlined below:
1.	Install the latest [Power BI Report Builder](https://www.microsoft.com/en-us/download/details.aspx?id=58158).
2.	Download the **PBIReportBuilder.config** configuration file that enables support for the ODBC data extension and query designer from the same folder as this document.
3.	Drop the downloaded configuration file into the Power BI Report Builder installation folder (default is `C:\Program Files (x86)\Power BI Report Builder`).
4.	Install any ODBC drivers (32-bit) that you plan to use with Power BI Report Builder
After executing the steps above an `ODBC` data extension option will be available when creating a new data source in Power BI Report Builder.

## Installing the Power BI Gateway and configuring ODBC data sources

To setup the Power BI Gateway for ODBC data sources:
1.	Download the latest [Power BI Gateway](https://powerbi.microsoft.com/en-us/gateway).
    >[!NOTE]
    >Personal Gateways are not supported for Paginated Reports (as they require DirectQuery support).
2.	Refer to the [documentation](https://docs.microsoft.com/en-us/power-bi/connect-data/service-gateway-onprem) for setting it up.
3.	Install any ODBC drivers (64-bit) that you plan to use on the Gateway machine.

Please note that File DSNs are not supported. If you would like to use a DSN, you need to create a 64-bit [System DSN](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/odbc/dn170519(v=vs.85)) on the Gateway machine.

To configure an ODBC data source in the [Manage Gateway] page of the Power BI Service, choose `ADD DATA SOURCE` and then select the `ODBC` Data Source Type:

:::image type="content" source="media/paginated-reports-odbc-support/configure-datasource.png" alt-text="Add data source":::

Next you paste in the connection string (System DSN or driver) and select an authentication method. For ODBC data sources the following authentication methods are supported:
-	Basic
-	Windows

When you hit the `Add` button the Power BI Service will connect to the ODBC data source using the supplied connection string and credentials to validate that the Gateway is able to connect.

Please note that for the public preview the Anonymous authentication method is not supported. While you will be able to select it for an ODBC data source, you will receive an error like the one below while rendering the report:

:::image type="content" source="media/paginated-reports-odbc-support/anonymouse-error.png" alt-text="Anonymouse authentication is not supported.":::

We are re-evaluating this limitation for the public preview.

Here are some ODBC Connection String examples for a System DSN as well as a variety of ODBC drivers:
-	"dsn=Northwind"
-	"driver={Microsoft Access Driver (*.mdb, *.accdb)};dbq=c:\Data\Northwind.mdb"
-	"driver={SnowflakeDSIIDriver};warehouse=DEMO_WH;server=<span>org.snowflakecomputing</span>.com"
-	"driver={Amazon Redshift (x64)};server=<span>org.us-west-2.redshift.amazonaws</span>.com;database=dev"
Please note that certain drivers and configurations might not support all authentication methods.

In addition to creating ODBC data sources in the Gateway up-front you can create ODBC data sources on-demand when you upload a paginated report. If an ODBC data sources doesn’t exist, then the Upload process will prompt you to create one:

:::image type="content" source="media/paginated-reports-odbc-support/gateway-binding.png" alt-text="Create data source prompt.":::

## Known Issues

In general, all the limitations that apply to using the ODBC data extension in Power BI Report Builder apply to using the ODBC data extensions in the Power BI Gateway as well.

Some of the known limitations are:
-	For most ODBC drivers DateTime parameters require changes to the Command text in the RDL dataset to cast a DateTime parameter value to the appropriate format for a given ODBC data source.  
Example expression:  
```"SELECT * FROM DEMO_DB.PUBLIC.DATES WHERE DATE < DATE('" & Format(Parameters!Date.Value, "yyyy-MM-dd") & "')"```

-	Any special data types exposed by a given ODBC driver/ backend that are not simply mapped to an <span>ADO.Net</span> data type are not supported. One example for this is the Snowflake Array data type.
-	Scenarios where ODBC drivers use stored procedures with out parameters are generally not supported. However, the Amazon Redshift driver has in/out parameters that are supported.
