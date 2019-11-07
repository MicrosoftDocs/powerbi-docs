---
title: Use SAP HANA in Power BI Desktop
description: Use SAP HANA in Power BI Desktop
author: davidiseminger
manager: kfollis
ms.reviewer: ''

ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 08/21/2019
ms.author: davidi

LocalizationGroup: Connect to data
---
# Use SAP HANA in Power BI Desktop
With Power BI Desktop, you can now access **SAP HANA** databases. To use **SAP HANA**, the SAP HANA ODBC driver must be installed on the local client computer in order for the Power BI Desktop **SAP HANA** data connection to work properly. You can download the SAP HANA Client tools from [SAP Development Tools](https://tools.hana.ondemand.com/#hanatools), which contains the necessary ODBC driver. Alternatively, you can get it from the [SAP Software Download Center](https://support.sap.com/swdc). In the Software portal search for the SAP HANA CLIENT for Windows computers. Since the **SAP Software Download Center** changes its structure frequently, more specific guidance for navigating that site is not available.

To connect to a **SAP HANA** database, select **Get Data > Database > SAP HANA Database** as shown in the following image:

![](media/desktop-sap-hana/sap-hana-1.png)

When connecting to a SAP HANA database, specify the server name. Then from the drop down and input box, specify the port.

In this release **SAP HANA** in [DirectQuery](desktop-directquery-sap-hana.md) mode is supported in Power BI Desktop and the Power BI service, and you can publish and upload reports that use **SAP HANA** in DirectQuery mode to the Power BI service. You can also publish and upload reports to the Power BI Service when not using **SAP HANA** in DirectQuery mode.

## Supported features for SAP HANA
This release has many capabilities for **SAP HANA**, as shown in the following list:

* The Power BI connector for **SAP HANA** uses the SAP ODBC driver, to provide the best user experience
* **SAP HANA** supports both DirectQuery and Import options
* Power BI supports HANA information models (such as Analytic and Calculation Views) and has optimized navigation
* With **SAP HANA**, you can also use the direct SQL feature to connect to Row and Column Tables
* Includes Optimized Navigation for HANA Models
* Power BI supports **SAP HANA** Variables and Input parameters
* HDI-container based Calculation Views
  * Support for HDI-container-based Calculation Views is in public preview in the August 2019 release of Power BI Desktop. To access your HDI-container-based Calculation Views in Power BI, ensure that the HANA database user(s) you use with Power BI have permission to access the HDI runtime container that stores the views you want to access. To grant this access, you must create a Role that allows access to your HDI container and assign the role to the HANA database user you will use with Power BI (this user must also have permission to read from the system tables in the \_SYS\_BI schema, as per usual). Consult the official SAP documentation for detailed instructions on how to create and assign database roles. [This SAP blog post](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fblogs.sap.com%2F2018%2F01%2F24%2Fthe-easy-way-to-make-your-hdi-container-accessible-to-a-classic-database-user%2F&data=02%7C01%7Cv-adbold%40microsoft.com%7Cf7e0a405fe334598ba0608d7096ef5b4%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636988244476739316&sdata=PuRu61GPRYp34mLuGbQk6gdbRikdgbxfqo8q1RBQtm0%3D&reserved=0) may be a good place to start.
  * Note that there are currently some limitations for HANA variables attached to HDI-based Calculation Views. These limitations are due to errors on the HANA side and will be addressed in future releases of SAP HANA. First, it is not possible to apply a HANA variable to a shared column of an HDI-container-based Calculation View. This limitation can be fixed by upgrading to HANA 2 version 37.02 and onwards or HANA 2 version 42 and onwards. Second, multi-entry default values for variables and parameters currently do not show up in the Power BI UI. This is also due to an error in SAP HANA, however; SAP has not yet announced a fix.

## Limitations of SAP HANA
There are also a few limitations to using **SAP HANA**, shown below:

* NVARCHAR strings are truncated to maximum length of 4000 Unicode characters
* SMALLDECIMAL is not supported
* VARBINARY is not supported
* Valid Dates are between 1899/12/30 and 9999/12/31


## Next steps
For more information about DirectQuery and SAP HANA, check out the following resources:

* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data Sources supported by DirectQuery](desktop-directquery-data-sources.md)
* [Enable encryption for SAP HANA](desktop-sap-hana-encryption.md)


