---
title: Resolve Access and .XLS import issues in Power BI Desktop
description: Resolve issues importing Access databases and .XLS spreadsheets in Power BI Desktop and Power Query
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 04/19/2021
LocalizationGroup: Troubleshooting
---
# Troubleshoot importing Access and Excel .xls files in Power BI Desktop

In Power BI Desktop, both Access databases and early versions of Excel workbooks (.XLS files of type Excel 97-2003) use the *Access Database Engine*. There are three common situations that can prevent the Access Database Engine from working properly.

## Situation 1: No Access Database Engine is installed

If the Power BI Desktop error message indicates the Access Database Engine isn't installed, you must install the Access Database Engine version, either 32-bit or 64-bit, that matches your Power BI Desktop version. You can install the Access Database Engine from the [downloads page](https://www.microsoft.com/download/details.aspx?id=13255).

If you're working with dataflows and using a gateway to connect to the data, you must install the Access Database Engine onto the computer running the gateway. 

>[!NOTE]
>If the installed Access Database Engine bit-version is different from your Microsoft Office installation's bit-version, Office applications won't be able to use the Access Database Engine.

## Situation 2: The Access Database Engine bit-version (32-bit or 64-bit) is different from your Power BI Desktop bit-version

This situation often occurs when the installed version of Microsoft Office is 32-bit, and the version of Power BI Desktop installed is 64-bit. The opposite can occur as well and the bit-version mismatch will occur in either case. You can also apply these solutions to other mismatches, for example other 32-bit COM applications such as Visual Studio SSDT. If you're using a Microsoft 365 subscription, see [Situation 3](#situation-3-trouble-using-access-or-xls-files-with-a-microsoft-365-subscription) for a different issue and resolution. Any of the following solutions can remedy this bit-version mismatch error:

### Solution 1

Change the version of Power BI Desktop to match the bit-version of your Microsoft Office installation. 

1. To change the bit-version of Power BI Desktop, uninstall Power BI Desktop, and then install the version of Power BI Desktop that matches your Office installation. 

1. To select a version of Power BI Desktop, select **Advanced download options** on the Power BI Desktop download page.
   
   ![Advanced download options on the Power BI Desktop download page](media/desktop-access-database-errors/desktop-access-errors-1.png)
   
1. On the download page that appears, choose your language and then select the **Download** button. 
 
1. On the screen that appears, select the checkbox beside PBIDesktop.msi for the 32-bit version, or PBIDesktop_x64.msi for the 64-bit version. 

   In the following screenshot, the 64-bit version is selected.
   
   ![Choose the type of  Power BI Desktop download](media/desktop-access-database-errors/desktop-access-errors-2.png)
   
   >[!NOTE]
   >If you use the 32-bit version of Power BI Desktop when creating very large data models, you might experience out-of-memory issues.

### Solution 2

Change the bit-version of Microsoft Office to match the bit-version of your Power BI Desktop installation:

1. Uninstall Microsoft Office

2. Install the version of Office that matches your Power BI Desktop installation.

### Solution 3

If the error occurs when you attempt to open an .XLS file (an Excel 97-2003 workbook), you can avoid using the Access Database Engine by opening the .XLS file in Excel, and saving it as an XLSX file.

### Solution 4

If the previous three solutions are not feasible, it's possible to install both versions of the Access Database Engine. However, this workaround isn't recommended. Although installing both versions will resolve this issue for Power Query for Excel and Power BI Desktop, it will introduce errors and issues for any application that automatically (by default) uses the bit-version of the Access Database Engine that was installed first. 

To install both bit-versions of the Access Database Engine, follow these steps:

1. Install both bit-versions of the Access Database Engine from the [download page](https://www.microsoft.com/download/details.aspx?id=13255). 

1. Run each version of the Access Database Engine by using the */passive* switch. For example:

   ```console
   c:\users\joe\downloads\AccessDatabaseEngine.exe /passive

   c:\users\joe\downloads\AccessDatabaseEngine_x64.exe /passive
   ```

## Situation 3: Trouble using Access or .XLS files with a Microsoft 365 subscription

If you're using a Microsoft 365 subscription, whether **Office 2013** or **Office 2016**, the Access Database Engine provider is registered in a virtual registry location that's *only* accessible to Microsoft Office processes. As a result, the Mashup Engine (which is responsible for running non-Office 365 Excel and Power BI Desktop, and isn't an Office process), can't use the Access Database Engine provider.

To remedy this situation, [download and install the Access Database Engine redistributable](https://www.microsoft.com/download/details.aspx?id=13255) that matches the bit-version of your Power BI Desktop installation. For more information about bit-versions, see the earlier sections in this article.

## Other situations that can cause import issues

We strive to cover as many issues that occur with Access or .XLS files as possible. If you encounter an issue that isn't covered in this article, submit a question about the issue to [Power BI Support](https://powerbi.microsoft.com/support/). We regularly look at issues that may be affecting many customers, and include them in our articles.

