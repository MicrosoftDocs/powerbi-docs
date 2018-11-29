---
title: Resolve Access and .XLS import issues in Power BI Desktop
description: Resolve issues importing Access databases and .XLS spreadsheets in Power BI Desktop and Power Query
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Troubleshooting
---
# Resolve issues importing Access and .XLS files in Power BI Desktop
In **Power BI Desktop**, both **Access databases** and early versions of **Excel workbooks** (.XLS files of type Excel 97-2003) use the *Access Database Engine*. There are three common situations that can prevent the Access Database Engine from working properly:

### Situation 1: No Access Database Engine Installed
When the Power BI Desktop error message indicates the Access Database Engine is not installed, you must install the Access Database Engine version, either 32-bit or 64-bit, that matches your Power BI Desktop version. You can install the Access Database Engine from the [downloads page](http://www.microsoft.com/download/details.aspx?id=13255).

>[!NOTE]
>If the installed Access Database Engine bit version is different from your Microsoft Office installation's bit version, Office applications will not be able to use the Access Database Engine.

### Situation 2: The Access Database Engine bit version (32-bit or 64-bit) is different from your Power BI Desktop bit version
This situation often occurs when the installed version of Microsoft Office is 32-bit, and the version of Power BI Desktop installed is 64-bit. The opposite can occur as well, and the bit-version mismatch with occur in either case (if you're using an Office 365 subscription, see **Situation 3** for a different issue and resolution). Any of the following solutions can remedy this bit-version mismatch error:

1. Change the version of Power BI Desktop to match the bit-version of your Microsoft Office installation. To change the bit-version of Power BI Desktop, uninstall Power BI Desktop, and then install the version of Power BI Desktop that matches your Office installation. To select a version of Power BI Desktop, on the download page for desktop select **Advanced download options**.
   
   ![](media/desktop-access-database-errors/desktop-access-errors-1.png)
   
   On the download page that appears, choose your language and then select the **Download** button. On the  screen that appears, select the checkbox beside PBIDesktop.msi for the 32-bit version, or PBIDesktop_x64.msi for the 64-bit version. In the following screen, the 64-bit version is selected.
   
   ![](media/desktop-access-database-errors/desktop-access-errors-2.png)
   
   >[!NOTE]
   >When using the 32-bit version of Power BI Desktop, when creating very large data models you might experience out-of-memory issues.
2. Change the version of Microsoft Office to match the bit-version of your Power BI Desktop installation. To change the bit-version of Microsoft Office, uninstall Office, and then install the version of Office that matches your Power BI Desktop installation.
3. If the error occurred when attempting to open an .XLS file (an Excel 97-2003 workbook), you can avoid using the Access Database Engine by opening the .XLS file in Excel, and saving it as an XLSX file.
4. If the previous three solutions are not feasible, it is possible to install both versions of the Access Database Engine, but this is *not* a recommended workaround. Installing both versions will resolve this issue for Power Query for Excel and Power BI Desktop, but will introduce errors and issues for any application that automatically (by default) uses the bit-version of the Access Database Engine that was installed first. To install both bit-versions of the Access Database Engine, [download](http://www.microsoft.com/download/details.aspx?id=13255) both versions, then run each of them using the */passive* switch. For example:
   
       c:\users\joe\downloads\AccessDatabaseEngine.exe /passive
   
       c:\users\joe\downloads\AccessDatabaseEngine_x64.exe /passive

### Situation 3: Trouble using Access or .XLS files with an Office 365 subscription
If you are using an Office 365 subscription, whether **Office 2013** or **Office 2016**, the Access Database Engine provider is registered in a virtual registry location that is *only* accessible to Office processes. As a result, the Mashup Engine (which is responsible for running non-Office 365 Excel and Power BI Desktop), which is not an Office process,  cannot use the Access Database Engine provider.

To remedy this situation, you can [download and install the Access Database Engine redistributable](http://www.microsoft.com/download/details.aspx?id=13255) that matches the bit version of your Power BI Desktop installation (see earlier sections for more information about bit-versions).

### Other situations that cause import issues
We strive to cover as many issues that occur with Access or .XLS files as possible. If you encounter an issue that isn't covered in this article, please submit a question about the issue to [Power BI Support](https://powerbi.microsoft.com/support/). We regularly look at issues that may be affecting many customers, and include them in our articles.

