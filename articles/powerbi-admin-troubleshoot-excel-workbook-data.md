<properties
   pageTitle=""We couldn't find any data in your Excel workbook""
   description=""We couldn't find any data in your Excel workbook""
   services="powerbi"
   documentationCenter=""
   authors="Minewiskan"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/06/2015"
   ms.author="owend"/>
# "We couldn't find any data in your Excel workbook"

## Problem

When you import an Excel workbook into Power BI, you may see the following error:

*Error: We couldn't find any data in your Excel workbook. Your data might not be formatted properly. You'll need to edit your workbook in Excel and then import it again.*

![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_WeCouldntFindAnyData.png)

## Quick solution

1. Edit your workbook in Excel.

2. Select the range of cells that contain your data. The first row should contain your column headers (the column names).

3. Press **Ctrl + T** to create a table.

4. Save your workbook.

5. Return to Power BI and import your workbook again, or if you're working in Excel 2016 and you've saved your workbook to OneDrive for Business, in Excel, click File > Publish.

## Details

### Cause

In Excel, you can create a **table** out of a range of cells, which makes it easier to sort, filter, and format data.

When you import an Excel workbook, Power BI looks for these tables and imports them into a dataset; if it doesn't find any tables, you'll see this error message.

### Solution

1. Open your workbook in Excel. (Note: The pictures here are of Excel 2013. If you're using Excel 2007 or 2010, things may look a little different, but the steps are the same.)

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_Trb_XLWksht1.png)

2. Select the range of cells that contain your data. The first row should contain your column headers (the column names):

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_Trb_XLWksht2.png)

3. In the ribbon on the **INSERT** tab, click **Table**. (Or, as a shortcut, press **Ctrl + T**.)

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_Trb_XLWksht3.png)

4. You'll see the following dialog. Make sure **My table has headers** is checked, and select **OK**:

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_Trb_XLCreateTbl.png)

5. Now your data is formatted as a table:

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_Trb_XLTbl.png)

6. Save your workbook.

7. Return to Power BI. Select Get Data at the bottom of the left navigation pane.

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_GetData.png)

8. In the **Files** box, select **Get**.

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_GetFiles.png)

9. Import your Excel workbook again. This time, the import should find the table and succeed.

	If the import still fails, let us know by clicking **Community **in the help menu:

	![](media/powerbi-admin-troubleshoot-excel-workbook-data/PBI_QuestionMenuCommunity.png)

## More information

-   This article applies to Excel 2007 and later.
-   The pictures here are of Excel 2013. If you're using a different version, things may look a little different, but the steps are the same.
