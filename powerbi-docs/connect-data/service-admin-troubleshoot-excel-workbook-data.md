---
title: "Fix Excel Workbook Data Error in Power BI"
description: "Resolve the 'We couldn't find any data in your Excel workbook' error when importing to Power BI. Learn how to format data as a table and fix import issues. Get step-by-step solutions now."
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 10/01/2025
ai-usage: ai-assisted
ms.custom: ''
LocalizationGroup: Troubleshooting
---
# Fix Excel workbook data error in Power BI

> [!NOTE]
> This article applies to Excel 2007 and later.

When importing Excel workbooks into Power BI, you may encounter the error "We couldn't find any data formatted as a table." This article provides step-by-step solutions to resolve this Excel data import error in Power BI by formatting your data correctly.

When you import an Excel workbook into the Power BI service, you might see the following error:

```output
Error: We couldn't find any data formatted as a table. To import from Excel into the Power BI service, you need to format the data as a table. Select all the data you want in the table and press Ctrl+T.
```

:::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-we-couldnt-find-any-data.png" alt-text="Screenshot of dialog explaining that the Power BI service couldn't find data in workbook.":::

## Quick solution

1. Edit your workbook in Excel.
1. Select the range of cells that contain your data. The first row should contain your column headers (the column names).
1. Press **Ctrl+T** to create a table.
1. Save your workbook.
1. Return to the Power BI service and import your workbook again. If you're working in Excel 2016 and you saved your workbook to OneDrive for work or school, in Excel, select **File** > **Publish**.

## Details

### Cause

In Excel, you can create a *table* out of a range of cells, which makes it easier to sort, filter, and format data.

When you import an Excel workbook, Power BI looks for these tables and imports them into a semantic model. If it doesn't find any tables, you see this error message.

### Solution

1. Open your workbook in Excel.

   > [!NOTE]
   > The pictures here are of Excel 2013. If you're using a different version, things might look a little different, but the steps are the same.

    :::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-troubleshoot-excel-worksheet-1.png" alt-text="Screenshot of the Excel workbook opened.":::

1. Select the range of cells that contain your data. The first row should contain your column headers (the column names).

   :::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-troubleshoot-excel-worksheet-2.png" alt-text="Screenshot of the Excel workbook with a range of cells selected.":::

1. In the ribbon on the **Insert** tab, select **Table**. Or, as a shortcut, press **Ctrl+T**.

   :::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-troubleshoot-excel-worksheet-3.png" alt-text="Screenshot of insert table selected.":::

1. You see the following dialog. Make sure **My table has headers** is selected, then choose **OK**.

    :::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-troubleshoot-excel-create-table.png" alt-text="Screenshot of the Create Table dialog.":::

   Now your data is formatted as a table.

   :::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-troubleshoot-excel-table.png" alt-text="Screenshot of data in Excel formatted as a table.":::

1. Save your workbook.
1. Return to the Power BI service. Select **Create** from the navigation pane, and then select the **Excel** tile under **Add data to start building a report**.

   :::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-get-files.png" alt-text="Screenshot of Add data to get started where you can choose Excel files.":::

1. Import your Excel workbook again. This time, the import should find the table and succeed.

If the import still fails, let us know by selecting **Community** in the help menu:

:::image type="content" source="media/service-admin-troubleshoot-excel-workbook-data/power-bi-question-menu-community.png" alt-text="Screenshot of the community link where you can follow up if the issue persists.":::
