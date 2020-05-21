---
title: Access Power BI featured tables in Excel (preview)
description: In Excel, you can find data from featured tables in Power BI datasets in the Data Types Gallery. 
author: maggiesMSFT
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/20/2020
ms.author: maggies

LocalizationGroup: Share your work
---
# Access Power BI featured tables in Excel (preview)

In Excel, you can find data from featured tables in Power BI datasets in the Data Types Gallery. Featured tables make it easier to add enterprise data to your Excel sheets. By using Power BI certified and promoted datasets capabilities, organizations enable more users to find and use relevant and refreshable data to make better decisions. Read more about using [Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.

The Data Types Gallery only shows featured tables that a modeler has curated in Power BI datasets. You can also browse any dataset in Excel that you can access in Power BI. In Excel, select the **Power BI Datasets** option under **Get Data** on the **Data** ribbon.

## Access Power BI data through the Excel Data Types Gallery
Featured tables in Power BI datasets appear in the Excel Data Types gallery in the Data ribbon.

:::image type="content" source="media/service-excel-featured-tables/excel-data-ribbon.png" alt-text="Excel Data ribbon":::

When expanded, the gallery shows the top available data types.

:::image type="content" source="media/service-excel-featured-tables/excel-data-types-gallery.png" alt-text="Excel Data Types Gallery":::
 
To look up data in a Power BI featured table, select a cell or a range in your Excel sheet.

:::image type="content" source="media/service-excel-featured-tables/excel-select-cell.png" alt-text="Select a cell":::
 
Select the **Organizational data** option from the gallery to search for data in featured tables in certified datasets you have access to.

:::image type="content" source="media/service-excel-featured-tables/excel-organizational-data.png" alt-text="Excel Organizational Data":::
 
Select a specific data type if you know what kind of data you’re searching for, or you don't find matching rows using the Organizational data option.

:::image type="content" source="media/service-excel-featured-tables/excel-select-data-type.png" alt-text="Select a data type":::
 
When you search, if a matching row is found with high confidence, the cell is immediately linked to that row. The linked item icon indicates the cell is linked to the row in Power BI.

:::image type="content" source="media/service-excel-featured-tables/excel-linked-item-icon.png" alt-text="Linked item icon":::

If a cell has multiple potential matching rows, a data selector pane is shown. The cell shows the question mark icon, which opens the data selector pane to that row. Here's an example after the user selected a range from A2:A7 and searched a Power BI feature table.

:::image type="content" source="media/service-excel-featured-tables/excel-multiple-matches.png" alt-text="Multiple possible matching rows":::

The **Data Selector** pane shows the potentially matching rows.

:::image type="content" source="media/service-excel-featured-tables/excel-data-selector-pane.png" alt-text="Excel Data Selector pane":::
 
The Organizational data option can return rows from multiple data types. Excel groups the potentially matching rows by the data type they came from. Excel sorts the data types based on their strongest potential matching row. Use the chevron arrows to collapse and expand the data types to matching rows.

:::image type="content" source="media/service-excel-featured-tables/excel-data-selector-multiple.png" alt-text="Excel Data Selector pane":::
 
For each row, select the row name to see more details within the row to help you pick the right row. Once you’ve found a row, press **Select** to link the row to the cell in Excel. 

:::image type="content" source="media/service-excel-featured-tables/excel-data-selector-select.png" alt-text="Data Selector details":::
 
When a row is selected, the cell is linked to the row and its value is with the value of the **Row Label** field in the Power BI featured table. 

:::image type="content" source="media/service-excel-featured-tables/excel-linked-item-icon.png" alt-text="Excel linked item":::
 
Selecting the **Linked Cell** icon shows a card with data from any fields and calculated fields in the featured table. The title of the card shows the value of the row label field in the featured table.
 
:::image type="content" source="media/service-excel-featured-tables/excel-linked-item-details.png" alt-text="Linked item details":::

Select the **Insert Data** icon to add field values to the grid.

:::image type="content" source="media/service-excel-featured-tables/excel-insert-data.png" alt-text="Insert data"::: 

Select a field name from the list of fields to add its value to the grid.  

:::image type="content" source="media/service-excel-featured-tables/excel-select-field.png" alt-text="Select a field name":::

The field value is placed in the adjacent cell. The cell formula refers to the linked cell and the field name, so you can use the data in Excel functions.

:::image type="content" source="media/service-excel-featured-tables/excel-cell-formula.png" alt-text="Excel cell formula":::
 
When you format your data as an Excel table, adding fields expands the table and sets the column header to match the field name. Rows linked to the same data types are also populated with their respective values.

:::image type="content" source="media/service-excel-featured-tables/excel-field-column-name.png" alt-text="Field is the column name"::: 

## Cell formulas

When you use an Excel table, you can refer to the linked table column and then add data fields using the `.` (period) reference.

:::image type="content" source="media/service-excel-featured-tables/excel-dot-reference.png" alt-text="Excel period reference":::

Likewise when you use a cell, you can refer to the cell and use the `.` (period) reference to retrieve fields.

:::image type="content" source="media/service-excel-featured-tables/excel-cell-dot-reference.png" alt-text="Cell period reference":::
 
## Data caching and refresh

When Excel links a cell to a row in a Power BI featured table, it retrieves and saves all the field values in the Excel file. Anyone you share the file with can refer to any of the fields, without requesting data from Power BI.  

Use the **Refresh All** button in the **Data** ribbon to refresh data in linked cells. 

:::image type="content" source="media/service-excel-featured-tables/excel-refresh-all.png" alt-text="Refresh All":::
 
You can also refresh individual cells. Right-click the cell and select **Data Types** > **Refresh**.

## Show a card, change, or convert to text

Linked cells have added right-click menu options. Right-click a cell > select **Data Type** >  

- **Show Card**
- **Refresh**
- **Change** 
- **Convert to Text**.

:::image type="content" source="media/service-excel-featured-tables/excel-right-click-data-type.png" alt-text="Right-click, Convert to Text":::
 
**Convert to Text** removes the link to the row in the Power BI featured table. Importantly, the text in the cell will be the row label value of the linked cell. If you linked a cell to a row you didn’t intend to, select **Undo** in Excel to restore the initial cell values.

## Licensing
The Excel Data Types Gallery and connected experiences to Power BI featured tables is only available for Excel E5 and G5 customers. 

## Security

You see only featured tables from datasets you have permission to in Power BI. When refreshing data, you must have permission to access the dataset in Power BI to retrieve the rows. This requires the Build or Write permission on the dataset. 
Excel caches the data returned for the entire row. Anyone you share the Excel file with can see the data for all the fields in all the linked cells.

If a Power BI dataset has row-level security or a Microsoft Information Protection sensitivity label applied to it, featured tables from that dataset aren't included in the Excel Data Types Gallery. This is a limitation of the initial preview.

## Curate a featured table in Power BI Desktop
The Excel Data Types Gallery shows featured tables in datasets uploaded to the Power BI service. Use Power BI Desktop to curate featured tables in the data model, then upload them to the Power BI service.

### Turn on the featured table preview

1. In Power BI Desktop, select **File** > **Options and Settings** > **Options** > **Preview Features**.
2. Select the **Featured tables** check box.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-preview-featured-tables.png" alt-text="Preview featured tables option":::

### Select a table

1. In Power BI Desktop, go to Model view.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-model-view.png" alt-text="Model view":::
 
2. Select a table, and set **Is featured table** to **Yes**.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-featured-table-yes.png" alt-text="Set Is featured table to Yes":::

4. In **Set up this featured table**, provide the required fields:

    - A **Description**.
    - The **Row label** field value is used in Excel so users can easily identify the row. It appears as the cell value for a linked cell, in the **Data Selector** pane, and in the **Information** card. 
    - The **Key column** field value provides the unique ID for the row. This value enables Excel to link a cell to a specific row in the table.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-set-up-featured-table.png" alt-text="Set up featured table":::

After you publish or import the dataset to the Power BI service, the featured table is displayed in the Excel Data Types Gallery.

- Excel caches the list of data types so you need to restart Excel to see newly published featured tables.
- Some datasets aren't supported in the preview, featured tables defined in those datasets won’t appear in Excel. See considerations and limitations for details.

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

- Excel only displays featured tables that are stored in the new Power BI workspaces. Featured tables stored in the classic workspaces, or My Workspace, aren't shown as data types in Excel. You can [upgrade classic workspaces to the new workspaces](service-upgrade-workspaces.md) in Power BI.

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

- Questions? [Try the Power BI Community](https://community.powerbi.com/)

