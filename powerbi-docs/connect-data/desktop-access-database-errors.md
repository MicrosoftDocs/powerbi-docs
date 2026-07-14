---
title: Troubleshoot Access and XLS import issues in Power BI
description: Troubleshoot and resolve Access database and Excel XLS spreadsheet import issues in Power BI Desktop and Power Query Editor.
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 12/03/2024
LocalizationGroup: Troubleshooting
---
# Troubleshoot Access and Excel XLS import issues in Power BI Desktop

In Power BI Desktop, imported Access databases and Excel 97-2003 XLS files both use the *Access Database Engine*. Three common situations can prevent the Access Database Engine from working properly:

- No Access Database Engine is installed.
- The Access Database Engine bit version (32-bit or 64-bit) doesn't match your Power BI Desktop version. Power BI Desktop requires the 64-bit Access Database Engine.
- You're using Access or XLS files with a Microsoft 365 subscription.

This article explains these issues and tells you how to troubleshoot them.

## No Access Database Engine installed

If a Power BI Desktop error message indicates the Access Database Engine isn't installed, [install the 64-bit Access 365 Runtime](https://support.microsoft.com/office/download-and-install-microsoft-365-access-runtime-185c5a32-8ba9-491e-ac76-91cbe3ea09c9).

If you work with dataflows and use a gateway to connect to the data, you must install the Access Database Engine on the computer that runs the gateway.

## Access Database Engine bit version is different from Power BI Desktop bit version

This situation usually occurs when the installed Microsoft Office version is 32-bit and the installed Power BI Desktop version is 64-bit. Power BI Desktop is only available in 64-bit, so a bit version mismatch can occur if you have 32-bit Microsoft Office installed.

Any of the following solutions can remedy this bit-version mismatch error. You can also apply these solutions to other mismatches, for example other 32-bit COM applications like Visual Studio SSDT.

If you're using Access or XLS files with a Microsoft 365 subscription, see [Access or XLS files with Microsoft 365](#you-use-access-or-xls-files-with-microsoft-365) for a different issue and resolution.

### Solution 1: Install 64-bit Power BI Desktop

Power BI Desktop is only available as a 64-bit application. To ensure compatibility with the Access Database Engine:

1. If you currently have Power BI Desktop installed, verify that it's the 64-bit version or [download the latest version](https://www.microsoft.com/download/details.aspx?id=58494).

1. Install the 64-bit Access Database Engine to match Power BI Desktop. For installation guidance, see [No Access Database Engine installed](#no-access-database-engine-installed).

### Solution 2: Change Microsoft Office bit version to match Power BI Desktop bit version

To change the bit version of Microsoft Office to match the bit version of your Power BI Desktop installation:

1. Uninstall Microsoft Office.

2. Install the version of Office that matches your Power BI Desktop installation.

### Solution 3: Save the XLS file as XLSX

If the error occurs with an Excel 97-2003 XLS workbook, you can avoid using the Access Database Engine by opening the XLS file in Excel and saving it as an XLSX file.

## You use Access or XLS files with Microsoft 365

Subscription versions of Office 2013-2019 that use Click-to-Run installation technology register the Access Database Engine provider in a virtual registry location that only Microsoft Office processes can access. The Mashup Engine, which is responsible for running non-Microsoft 365 Excel and Power BI Desktop, isn't an Office process, so it can't use the Access Database Engine provider.

To fix this situation, see [Unable to use the Access ODBC, OLEDB, or DAO interfaces outside Office Click-to-Run applications](/office/troubleshoot/access/cannot-use-odbc-or-oledb) for installation guidance.

## Other import issues

The Power BI team regularly looks for issues that might affect many users, and tries to include them in documentation. If you encounter an issue that this article doesn't cover, submit a question about the issue to [Power BI Support](https://powerbi.microsoft.com/support).
