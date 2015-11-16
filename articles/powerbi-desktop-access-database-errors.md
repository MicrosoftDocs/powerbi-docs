<properties
   pageTitle="Fix Access Database Engine Errors in Power BI Desktop"
   description="Fix Access Database Engine Errors in Power BI Desktop"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/16/2015"
   ms.author="davidi"/>

# Fix Access Database Engine Errors in Power BI Desktop  

In Power BI Desktop, there are two common situations that can prevent the Access Database Engine from working properly:

### Situation 1: No Access Database Engine Installed
When the Power BI Desktop error message indicates the Access Database Engine in not installed, you must install the Access Database Engine version, either 32-bit or 64-bit, that matches your Power BI Desktop version. You can install the Access Database Engine from [this location](http://www.microsoft.com/en-us/download/details.aspx?id=13255).

**Note:** If the installed Access Database Engine bit version is different from your Microsoft Office installation's bit version, Office applications will not be able to use the Access Database Engine.


### Situation 2: The Access Database Engine bit version (32-bit or 64-bit) is different from your Power BI Desktop bit version
This situation often occurs when the installed version of Microsoft Office is 32-bit, and the version of Power BI Desktop installed is 64-bit. The opposite can occur as well, and the bit-version mismatch with occur in either case. Any of the following solutions remedy this error:

1.  Change the version of Power BI Desktop to match the bit-version of your Microsoft Office installation. To change the bit-version of Power BI Desktop, uninstall Power BI Desktop, and then install the version of Power BI Desktop that matches your Office installation.

2.  Change the version of Microsoft Office to match the bit-version of your Power BI Desktop installation. To change the bit-version of Microsoft Office, uninstall Office, and then install the version of Office that matches your Power BI Desktop installation.

3.  If the error occurred when attempting to open an .XLS file (an Excel 2007-2003 workbook), you can avoid using the Access Database Engine by opening the .XLS file in Excel, and saving it as an XLSX file.

4.  If the previous three solutions are not feasible, it is possible to install both versions of the Access Database Engine, but this is *not* a recommended workaround. Installing both versions will resolve this issue for Power Query for Excel and Power BI Desktop, but will introduce errors and issues for any application that automatically (by default) uses the bit-version of the Access Database Engine that was installed first. To install both bit-versions of the Access Database Engine, [download](http://www.microsoft.com/en-us/download/details.aspx?id=13255) both versions, then run each of them using the */passive* switch. For example:

        c:\users\joe\downloads\AccessDatabaseEngine.exe /passive

        c:\users\joe\downloads\AccessDatabaseEngine_x64.exe /passive
