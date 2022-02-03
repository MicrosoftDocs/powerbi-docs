---
title: Set featured tables in Power BI Desktop
description: Create featured tables in Power BI Desktop so they show up in the Excel Organization Data Types Gallery. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 06/28/2021
LocalizationGroup: Share your work
---
# Set featured tables in Power BI Desktop to show in Excel Organization Data Types Gallery

In the Data Types Gallery in Excel, your users can find data from *featured tables* in your Power BI datasets. In this article, you learn how to set tables as *featured* in your datasets. These tags make it easier for your users to add enterprise data to their Excel sheets. Here are the basic steps for setting and sharing featured tables.

1. You identify featured tables in your datasets in Power BI Desktop (this article)
1. You save those datasets with featured tables to one of the new workspaces. Report creators can create reports with those featured tables. 
1. The rest of the organization can connect to those featured tables, referred to as *data types* in Excel, for relevant and refreshable data. The article [Access Power BI featured tables in Excel](service-excel-featured-tables.md) describes consuming these featured tables in Excel.

> [!NOTE]
> You can [promote or certify datasets in Power BI](../collaborate-share/service-endorse-content.md). That's called *endorsement*. Excel prioritizes tables in endorsed datasets in the Data Types Gallery. Excel lists featured tables in certified datasets first, then tables in promoted datasets. Excel lists featured tables in unendorsed datasets after that. 

> [!NOTE]
> Creating featured tables is available by default. You can change the **Featured tables** capability through **File** > **Options and Settings** > **Options** > **Preview Features**.

## Select a table

1. In Power BI Desktop, go to Model view.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-model-view.png" alt-text="Model view":::
 
2. Select a table, and set **Is featured table** to **Yes**.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-featured-table-yes.png" alt-text="Set Is featured table to Yes":::

4. In **Set up this featured table**, provide the required fields:

    - A **Description**. 
        > [!TIP]
        > Start the description with "Featured table" to help Power BI report creators identify it.
    - The **Row label** field value is used in Excel so users can easily identify the row. It appears as the cell value for a linked cell, in the **Data Selector** pane, and in the **Information** card. 
    - The **Key column** field value provides the unique ID for the row. This value enables Excel to link a cell to a specific row in the table.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-set-up-featured-table.png" alt-text="Set up featured table":::

1. After you publish or import the dataset to the Power BI service,  the featured table is displayed in the Excel Data Types Gallery. You and other report creators can also create reports built on this dataset.

1. In Excel: 
    - Excel caches the list of data types so you need to restart Excel to see newly published featured tables.
    - Some datasets aren't supported. Featured tables defined in those datasets won’t appear in Excel. See the next section, Considerations and limitations, for details.

## Considerations and limitations

Here are the current limitations:

- The integration is available in Excel in the current channel.
- Featured tables in Power BI datasets that use the following capabilities aren't shown in Excel: 

    - DirectQuery datasets.
    - Datasets with a live connection.

- Excel shows only data in columns, calculated columns, and measures defined in the featured table. The following aren't provided:
   
    - Measures defined on related tables.
    - Implicit measures calculated from relationships.

- Excel only displays featured tables (*data types*) that are stored in the new Power BI workspaces. Featured tables stored in the classic workspaces  aren't shown as data types in Excel. You can [upgrade classic workspaces to the new workspaces](service-upgrade-workspaces.md) in Power BI.

The Data Types experience in Excel is similar to a lookup function. It takes a cell value provided by the Excel sheet, and searches for matching rows in Power BI featured tables. The search experience has the following behaviors:

- Row matching is based on text columns in the featured table. It uses the same indexing as Power BI Q&A capability, which is optimized for English-language search. Searching in other languages may not result in accurate matches. 
- Featured tables use Power BI Q&A indexing when users query data in those tables. See [How does indexing work with Q&A?](../natural-language/q-and-a-data-sources.md#how-does-indexing-work-with-qa) for details.
- Most numerical columns aren't considered for matching. If the Row Label or Key Column are numeric, they are included for matching.
- Matching is based on Exact and Prefix matches for individual search terms. A cell’s value is split based on spaces or other whitespace characters like tabs. Then each word is considered a search term. A row’s text field values are compared to each search term for Exact and Prefix matches. A Prefix match is returned if the row’s text field starts with the search term. For example, if a cell contains “Orange County”, then “Orange” and “County” are distinct search terms. 

    - Rows with text columns whose values exactly match “Orange” or “County” are returned. 
    - Rows with text columns whose values start with “Orange” or “County” are returned. 
    - Importantly, rows that contain “Orange” or “County” but don’t start with them aren't returned.

- Power BI returns at most 100 row suggestions for each cell.
- Some symbols aren't supported.
- Setting or updating the featured table isn't supported in the XMLA endpoint
- Excel files with a data model can be used to publish featured tables. Load the data into Power BI Desktop and then publish the featured table.
- Changing the Table name, Row Label, or Key Column in the featured table may impact Excel users with linked cells to rows in the table. 
- Excel shows when the data was retrieved from the Power BI dataset. This time isn't necessarily the time that the data was refreshed in Power BI, or the time of the most recent data point in a dataset. For example, say a dataset in Power BI was refreshed a week ago, but the underlying source data was a week old when the refresh happened. The actual data would be two weeks old, but Excel would show data retrieved as the date/time at which the data was pulled into Excel.
- See [Considerations and limitations](service-excel-featured-tables.md#considerations-and-limitations) in the article "Access Power BI featured tables in Excel" for other Excel considerations.

## Next steps

- [Access Power BI featured tables in Excel](service-excel-featured-tables.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
