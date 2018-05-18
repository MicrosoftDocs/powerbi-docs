---
title: Use the SAP BW Connector in Power BI Desktop
description: Use the SAP BW Connector in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 04/09/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# Use the SAP BW Connector in Power BI Desktop
With Power BI Desktop, you can access **SAP Business Warehouse (BW)** data.

For information about how SAP customers can benefit from connecting Power BI to their existing SAP Business Warehouse (BW) systems, see the [Power BI and SAP BW whitepaper](https://aka.ms/powerbiandsapbw).

## Installation of SAP BW Connector
To use the **SAP BW Connector**, go through the following installation steps:

1. Install the **SAP NetWeaver** library on your local machine. You can get the **SAP Netweaver** library from your SAP administrator, or directly from the [SAP Software Download Center](https://support.sap.com/swdc). Since the **SAP Software Download Center** changes its structure frequently, more specific guidance for navigating that site is not available. The **SAP NetWeaver** library is usually included also in the SAP Client Tools installation.
   
   You may be able to search for *SAP Note #1025361* to get the download location for the most recent version. Make sure the architecture for the **SAP NetWeaver** library (32-bit or 64-bit) matches your **Power BI Desktop** installation, then install all files included in the **SAP NetWeaver RFC SDK** according to the SAP Note.
2. The **Get Data** dialog includes an entry for **SAP Business Warehouse Application Server** and **SAP Business Warehouse Message Server** in the **Database** category.
   
   ![](media/desktop-sap-bw-connector/sap_bw_2a.png)

## SAP BW Connector features
The **SAP BW Connectors** in Power BI Desktop let you import data from your **SAP Business Warehouse Server** cubes, or use DirectQuery. 

To learn more about the **SAP BW connector** and how to use it with DirectQuery, take a look at the [DirectQuery and SAP Business Warehouse (BW)](desktop-directquery-sap-bw.md) article.

When connecting, you must specify a *Server*, *System Number*, and *Client ID* to establish the connection.

![](media/desktop-sap-bw-connector/sap_bw_3a.png)

You can also specify two additional **Advanced options**: Language code, and a custom MDX statement to run against the specified server.

![](media/desktop-sap-bw-connector/sap_bw_4a.png)

If no MDX statement was specified you are presented with the **Navigator** window, which displays the list of cubes available in the server, with the option to drill down and select items from the available cubes, including dimensions and measures. Power BI exposes queries and cubes exposed by the [BW Open Analysis Interface OLAP BAPIs](https://help.sap.com/saphelp_nw70/helpdata/en/d9/ed8c3c59021315e10000000a114084/content.htm).

When you select one or more items from the server, a preview of the output table is created, based on their selection.

![](media/desktop-sap-bw-connector/sap_bw_5.png)

The **Navigator** window also provides a few **Display Options** that allow you to do the following:

* **Display *Only Selected Items* versus *All Items* (default view):** This option is useful for verifying the final set of items selected. An alternative approach to viewing this is to select the *Column Names* in the *Preview* area.
* **Enable Data Previews (default behavior):** You can also control whether data previews should be displayed in this dialog. Disabling data previews reduces the amount of server calls, since it no longer requests data for the previews.
* **Technical Names:** SAP BW supports the notion of *technical names* for objects within a cube. Technical names allow a cube owner to expose *user friendly* names for cube objects, as opposed to only exposing the *physical names* for those objects in the cube.

![](media/desktop-sap-bw-connector/sap_bw_6.png)

After selecting all necessary objects in the **Navigator**, you can decide what to do next, by selecting one of the following buttons on the bottom of the **Navigator** window:

* Selecting **Load** triggers loading the entire set of rows for the output table into the Power BI Desktop data model, then takes you to **Report** view where you can begin  visualizing the data or making further modifications using the **Data** or **Relationships** views.
* Selecting **Edit** brings up **Query Editor**, where you can perform additional data transformation and filtering steps before the entire set of rows is brought into the Power BI Desktop data model.

In addition to importing data from **SAP BW** cubes, remember that you can also import data from a wide range of other data sources in Power BI Desktop, and then you can combine them into a single report. This presents all sorts of interesting scenarios for reporting and analytics on top of **SAP BW** data.

## Troubleshooting
This section provides troubleshooting situations (and solutions) for working with this preview version of the **SAP BW** connector.

1. Numeric data from **SAP BW** returns decimal points instead of commas. For example, 1,000,000 is returned as 1.000.000.
   
   **SAP BW** returns decimal data with either a *,* (comma) or a *.* (dot) as the decimal separator. To specify which of those **SAP BW** should use for the decimal separator, the driver used by **Power BI Desktop** makes a call to *BAPI_USER_GET_DETAIL*. This call returns a structure called **DEFAULTS**, which has a field called *DCPFM* that stores *Decimal Format Notation*. It takes one of the following three values:
   
       ‘ ‘ (space) = Decimal point is comma: N.NNN,NN
       'X' = Decimal point is period: N,NNN.NN
       'Y' = Decimal point is N NNN NNN,NN
   
   Customers who have reported this issue found that the call to  *BAPI_USER_GET_DETAIL* is failing for a particular user (the user who is showing the incorrect data), with an error message similar to the following:
   
       You are not authorized to display users in group TI:
           <item>
               <TYPE>E</TYPE>
               <ID>01</ID>
               <NUMBER>512</NUMBER>
               <MESSAGE>You are not authorized to display users in group TI</MESSAGE>
               <LOG_NO/>
               <LOG_MSG_NO>000000</LOG_MSG_NO>
               <MESSAGE_V1>TI</MESSAGE_V1>
               <MESSAGE_V2/>
               <MESSAGE_V3/>
               <MESSAGE_V4/>
               <PARAMETER/>
               <ROW>0</ROW>
               <FIELD>BNAME</FIELD>
               <SYSTEM>CLNTPW1400</SYSTEM>
           </item>
   
   To solve this error, users must ask their SAP admin to grant the SAPBW user being used in Power BI the right to execute *BAPI_USER_GET_DETAIL*. It’s also worth verifying that the user has the required *DCPFM* value, as described earlier in this troubleshooting solution.
2. **Connectivity for SAP BEx queries**
   
   You can perform **BEx** queries in Power BI Desktop by enabling a specific property, as shown in the following image:
   
   ![](media/desktop-sap-bw-connector/sap_bw_8.png)

## Next steps
For more information about SAP HANA and DirectQuery, check out the following resources:

* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data Sources supported by DirectQuery](desktop-directquery-data-sources.md)
* [Power BI and SAP BW whitepaper](https://aka.ms/powerbiandsapbw)
