---
title: Access Power BI featured tables in Excel (preview)
description: In Excel, you can find data from featured tables in Power BI datasets in the Data Types Gallery. 
author: maggiesMSFT
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 07/24/2020
ms.author: maggies

LocalizationGroup: Share your work
---
# Access Power BI featured tables in Excel (preview)

In the Data Types Gallery in Excel, you can find data from *featured tables* in Power BI datasets. Featured tables make it easier to add enterprise data to your Excel sheets. Here are the steps to get from Power BI data to Excel sheets.

- A Power BI data modeler [promotes or certifies a dataset in Power BI](../connect-data/service-datasets-promote.md).
- The data modeler [identifies featured tables](service-create-excel-featured-tables.md) in the dataset, and saves that dataset to the Power BI service.
- The rest of the organization can connect to those featured tables in Excel for relevant and refreshable data. Excel refers to those tables as *data types*, and lists them in the Data Types Gallery.

In Excel, you can also browse any dataset that you can access in Power BI. In Excel, select the **Power BI Datasets** option under **Get Data** on the **Data** ribbon.

## The Excel Data Types Gallery
Featured tables in Power BI datasets appear as *data types* on the **Data** ribbon, in the Excel **Data Types** gallery.

:::image type="content" source="media/service-excel-featured-tables/excel-data-ribbon.png" alt-text="Screenshot of Data Types gallery in the Excel Data ribbon.":::

When expanded, the gallery shows the generic data types such as **Stocks** and **Geography**, plus the top 10 **Organization** data types available to you -- featured tables from Power BI datasets.

:::image type="content" source="media/service-excel-featured-tables/excel-data-types-gallery.png" alt-text="Screenshot of Excel Data Types Gallery.":::

## Format a range of cells as a table (optional)

 Before you start, we recommend formatting your data as an Excel table. That way, changes you make to one row will apply to the other rows in the table. 

1. Add a column header. 
2. Then select a cell in your data and press Ctrl + T. 
3. Check **My table has headers** > **OK**.

    :::image type="content" source="media/service-excel-featured-tables/excel-format-table.png" alt-text="Screenshot of converting range to table.":::

## Search for Power BI data in the Excel Data Types Gallery

To search for data in a Power BI featured table, select a cell or a range in your Excel sheet containing a value that matches the value in a featured table. Select **Organization**. Excel searches all the featured tables you have access to, looking for a match.

:::image type="content" source="media/service-excel-featured-tables/excel-table-organization.png" alt-text="Screenshot of Select a cell or range of cells.":::
 
If you know the featured table you're looking for, select **From your organization (preview)** from the gallery and select it.

:::image type="content" source="media/service-excel-featured-tables/excel-organizational-data-table.png" alt-text="Screenshot of Excel Organizational Data, Suppliers data type table.":::
 
When you search, if Excel finds matching rows with high confidence, the cells are immediately linked to those rows. The linked item icon indicates the cells are linked to the rows in Power BI.

:::image type="content" source="media/service-excel-featured-tables/excel-linked-card-icon.png" alt-text="Screenshot of Linked item icon.":::

If a cell has more than one potential matching row, the cell shows a question mark icon, and the **Data Selector** pane opens. In the following example, the user selected a range from B2:B10 and searched for a Power BI featured table. All the rows had matches except cell B5, "Ma Maison". The **Data Selector** shows two possible matches.

:::image type="content" source="media/service-excel-featured-tables/excel-data-selector-pane.png" alt-text="Screenshot of Excel Data Selector pane.":::
 
The Organization data option can return rows from multiple featured tables. Excel groups the potentially matching rows by the data type they came from. Excel sorts the data types based on their strongest potential matching row. Use the chevron arrows to collapse and expand the data types to matching rows.

:::image type="content" source="media/service-excel-featured-tables/excel-data-selector-multiple.png" alt-text="Screenshot of Excel Data Selector pane with multiple possibilities.":::
 
For each row, select the row name to see more details within the row to help you pick the right row. Once you’ve found it, press **Select** to link the row to the cell in Excel. 

:::image type="content" source="media/service-excel-featured-tables/excel-data-selector-details.png" alt-text="Screenshot of Data Selector details.":::
 
Selecting the **Card** icon in the cell shows a card with data from any fields and calculated fields in the featured table. The title of the card shows the value of the row label field in the featured table.
 
:::image type="content" source="media/service-excel-featured-tables/excel-linked-item-details.png" alt-text="Screenshot of Linked item details.":::

Select the **Insert Data** icon, then select a field name from the list of fields to add its value to the grid.  

:::image type="content" source="media/service-excel-featured-tables/excel-select-field.png" alt-text="Screenshot of Select a field name.":::

The field value or values are placed in the adjacent cells. The cell formula refers to the linked cell and the field name, so you can use the data in Excel functions.

:::image type="content" source="media/service-excel-featured-tables/excel-cell-formula.png" alt-text="Screenshot of Excel cell formula.":::

## Cell formulas

When you use an Excel table, you can refer to the linked table column and then add data fields using the `.` (period) reference.

:::image type="content" source="media/service-excel-featured-tables/excel-dot-reference.png" alt-text="Screenshot of Excel period reference.":::

Likewise when you use a cell, you can refer to the cell and use the `.` (period) reference to retrieve fields.

:::image type="content" source="media/service-excel-featured-tables/excel-cell-dot-reference.png" alt-text="Screenshot of Cell period reference.":::
 
## Data caching and refresh

When Excel links a cell to a row in a Power BI featured table, it retrieves and saves all the field values in the Excel file. Anyone you share the file with can refer to any of the fields, without requesting data from Power BI.  

Use the **Refresh All** button in the **Data** ribbon to refresh data in linked cells. 

:::image type="content" source="media/service-excel-featured-tables/excel-refresh-all.png" alt-text="Screenshot of Refresh All.":::
 
You can also refresh individual cells. Right-click the cell and select **Data Types** > **Refresh**.

## Show a card, change, or convert to text

Linked cells have added right-click menu options. Right-click a cell. Along with the usual options, you also see:

- **Show Data Type Card**.
- **Refresh**.
- **Change**.
- **Convert to Text**.

:::image type="content" source="media/service-excel-featured-tables/excel-right-click-data-type.png" alt-text="Screenshot of Right-click, Convert to Text.":::
 
**Convert to Text** removes the link to the row in the Power BI featured table. Importantly, the text in the cell will be the row label value of the linked cell. If you linked a cell to a row you didn’t intend to, select **Undo** in Excel to restore the initial cell values.

## Licensing

The Excel Data Types Gallery and connected experiences to Power BI featured tables is only available for Excel E5 and G5 customers. 

## Security

You see only featured tables from datasets you have permission to in Power BI. When refreshing data, you must have permission to access the dataset in Power BI to retrieve the rows. This requires the Build or Write permission on the dataset. 
Excel caches the data returned for the entire row. Anyone you share the Excel file with can see the data for all the fields in all the linked cells.

If a Power BI dataset has row-level security or a Microsoft Information Protection sensitivity label applied to it, featured tables from that dataset aren't included in the Excel Data Types Gallery. This is a limitation of the initial preview.

## Administrative control

Power BI admins can control who in the organization can use featured tables in the Excel Data Types Gallery. See [Featured tables settings](../admin/service-admin-portal.md#featured-tables-settings) in the Admin portal article for details. 
 
### Auditing

Administration audit logs show these events for featured tables:

- **AnalyzedByExternalApplication**: Gives admins visibility into which users are accessing which featured tables.
- **UpdateFeaturedTables**: Gives admins visibility into which users are publishing and updating featured tables.

For a complete list of audit log events, see [Track user activities in Power BI](../admin/service-admin-auditing.md).

## Considerations and limitations

Here are limitations for the initial preview:

- The integration is available in Excel Insiders Builds.
- The Excel Data Types Gallery includes featured tables for users with the appropriate license in Power BI Desktop and the Power BI service. Support for the Power BI service may not be available at the launch of the preview but will be added.
- Featured tables in Power BI datasets that use the following capabilities aren't shown in Excel: 

    - Row-level security datasets.
    - Microsoft Information Protection enabled datasets.
    - DirectQuery datasets.
    - Datasets with a live connection.

- Excel shows only data in columns and calculated columns in the featured table. The following aren't provided in the initial preview:

    - Measures defined on the feature table.
    - Measures defined on related tables, and implicit measures calculated from relationships.

- Excel only displays featured tables (*data types*) that are stored in the new Power BI workspaces. Featured tables stored in the classic workspaces, or My Workspace, aren't shown as data types in Excel. You can [upgrade classic workspaces to the new workspaces](service-upgrade-workspaces.md) in Power BI.

The Data Types experience in Excel is similar to a lookup function. It takes a cell value provided by the Excel sheet, and searches for matching rows in Power BI featured tables. The search experience has the following behaviors:

- When using the **Organizational Data** button to search, Excel only searches featured tables in Certified datasets.
- Row matching is based on text columns in the featured table. It uses the same indexing as Power BI Q&A capability, which is optimized for English-language search. Searching in other languages may not result in accurate matches. Numerical columns aren't considered for matching.
- Matching is based on Exact and Prefix matches for individual search terms. A cell’s value is split based on spaces or other whitespace characters like tabs. Then each word is considered a search term. A row’s text field values are compared to each search term for Exact and Prefix matches. A Prefix match is returned if the row’s text field starts with the search term. For example, if a cell contains “Orange County”, then “Orange” and “County” are distinct search terms. 

    - Rows with text columns whose value exactly match “Orange” or “County” are returned. 
    - Rows with text column whose value starts with “Orange” or “County” are returned. 
    - Importantly, rows that contain “Orange” or “County” but don’t start with them aren't returned.

- Power BI returns at most 100 row suggestions for each cell.
- Setting or updating the featured table is not supported in the XMLA endpoint
- Excel files with a data model can be used to publish featured tables. Load the data into Power BI desktop and then publish the featured table.
- Changing the Table name, Row Label, or Key Column the featured table may impact Excel users with linked cells to rows in the table. 
- Excel shows when the data was retrieved from the Power BI dataset. This isn't necessarily the time that the data was refreshed in Power BI, or the time of the most recent data point in a dataset. For example, say a dataset in Power BI was refreshed a week ago, but the underlying source data was a week old when the refresh happened. The actual data would be 2 weeks old, but Excel would show data retrieved as the date/time at which the data was pulled into Excel.

## Next steps

- [Set featured tables in Power BI Desktop](service-create-excel-featured-tables.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)

