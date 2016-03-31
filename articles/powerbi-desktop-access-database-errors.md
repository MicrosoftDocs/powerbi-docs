<properties
   pageTitle="Resolve Issues Importing Access Databases and .XLS spreadsheets in Power BI Desktop and Power Query"
   description="Resolve Issues Importing Access Databases and .XLS spreadsheets in Power BI Desktop and Power Query"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/04/2016"
   ms.author="davidi"/>

# Resolve Issues Importing Access Databases and .XLS spreadsheets in Power BI Desktop and Power Query  

In Power BI Desktop, both Access databases and early versions of Excel workbooks (.XLS files of type Excel 2007-2003) use the Access Database Engine. There are two common situations that can prevent the Access Database Engine from working properly:

### Situation 1: No Access Database Engine Installed
When the Power BI Desktop error message indicates the Access Database Engine in not installed, you must install the Access Database Engine version, either 32-bit or 64-bit, that matches your Power BI Desktop version. You can install the Access Database Engine from [this location](http://www.microsoft.com/en-us/download/details.aspx?id=13255).

**Note:** If the installed Access Database Engine bit version is different from your Microsoft Office installation's bit version, Office applications will not be able to use the Access Database Engine.


### Situation 2: The Access Database Engine bit version (32-bit or 64-bit) is different from your Power BI Desktop bit version
This situation often occurs when the installed version of Microsoft Office is 32-bit, and the version of Power BI Desktop installed is 64-bit. The opposite can occur as well, and the bit-version mismatch with occur in either case. Any of the following solutions remedy this error:

1.  Change the version of Power BI Desktop to match the bit-version of your Microsoft Office installation. To change the bit-version of Power BI Desktop, uninstall Power BI Desktop, and then install the version of Power BI Desktop that matches your Office installation. To select a version of Power BI Desktop, on the download page for desktop select **Advanced download options**.

    ![](media/powerbi-desktop-access-database-errors/desktop-access-errors-1.png)

    On the download page that appears, choose your language and then select the **Download** button. ON the  screen that appears, select the checkbox beside PBIDesktop.msi for the 32-bit version, or PBIDesktop_x64.msi for the 64-bit version. In the following screen, the 64-bit version is selected.

    ![](media/powerbi-desktop-access-database-errors/desktop-access-errors-2.png)

    **Note:** When using the 32-bit version of Power BI Desktop, when creating very large data models you might experience out-of-memory issues.


2.  Change the version of Microsoft Office to match the bit-version of your Power BI Desktop installation. To change the bit-version of Microsoft Office, uninstall Office, and then install the version of Office that matches your Power BI Desktop installation.

3.  If the error occurred when attempting to open an .XLS file (an Excel 2007-2003 workbook), you can avoid using the Access Database Engine by opening the .XLS file in Excel, and saving it as an XLSX file.

4.  If the previous three solutions are not feasible, it is possible to install both versions of the Access Database Engine, but this is *not* a recommended workaround. Installing both versions will resolve this issue for Power Query for Excel and Power BI Desktop, but will introduce errors and issues for any application that automatically (by default) uses the bit-version of the Access Database Engine that was installed first. To install both bit-versions of the Access Database Engine, [download](http://www.microsoft.com/en-us/download/details.aspx?id=13255) both versions, then run each of them using the */passive* switch. For example:

        c:\users\joe\downloads\AccessDatabaseEngine.exe /passive

        c:\users\joe\downloads\AccessDatabaseEngine_x64.exe /passive
