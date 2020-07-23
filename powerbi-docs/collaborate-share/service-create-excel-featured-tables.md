---
title: Label featured tables in Power BI Desktop (preview)
description: Create featured tables in Power BI Desktop so they show up in the Data Types Gallery in Excel. 
author: maggiesMSFT
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 07/23/2020
ms.author: maggies

LocalizationGroup: Share your work
---
# Identify featured tables in Power BI Desktop (preview)

In the Data Types Gallery in Excel, your users can find data from *featured tables* in Power BI datasets. In this article, you learn how to tag tables as *featured* in your datasets. These tags make it easier for your users to add enterprise data to their Excel sheets. First, you [promote or certify datasets in Power BI](../connect-data/service-datasets-promote.md). Then you identify featured tables in your datasets in Power BI Desktop. Report creators can create reports with those featured tables. And the rest of the organization can connect to those featured tables, referred to as *data types* in Excel, for relevant and refreshable data. 

Read more about using [Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.

The Data Types Gallery only shows featured tables that a modeler has curated in Power BI datasets. You can also browse any dataset in Excel that you can access in Power BI. In Excel, select the **Power BI Datasets** option under **Get Data** on the **Data** ribbon.

The Excel Data Types Gallery shows featured tables in datasets uploaded to the Power BI service. Use Power BI Desktop to curate featured tables in the data model, then upload them to the Power BI service.

## Turn on the featured table preview

1. In Power BI Desktop, select **File** > **Options and Settings** > **Options** > **Preview Features**.
2. Select the **Featured tables** check box.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-preview-featured-tables.png" alt-text="Preview featured tables option":::

## Select a table

1. In Power BI Desktop, go to Model view.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-model-view.png" alt-text="Model view":::
 
2. Select a table, and set **Is featured table** to **Yes**.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-featured-table-yes.png" alt-text="Set Is featured table to Yes":::

4. In **Set up this featured table**, provide the required fields:

    - A **Description**. Start the description with "Featured table" to help Power BI report creators identify it as such.
    - The **Row label** field value is used in Excel so users can easily identify the row. It appears as the cell value for a linked cell, in the **Data Selector** pane, and in the **Information** card. 
    - The **Key column** field value provides the unique ID for the row. This value enables Excel to link a cell to a specific row in the table.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-set-up-featured-table.png" alt-text="Set up featured table":::

1. After you publish or import the dataset to the Power BI service,  the featured table is displayed in the Excel Data Types Gallery. You and other report creators can also create reports built on this dataset.

1. In Excel: 
- Excel caches the list of data types so you need to restart Excel to see newly published featured tables.
- Some datasets aren't supported in the preview, featured tables defined in those datasets won’t appear in Excel. See considerations and limitations for details.

## Considerations and limitations

Here are limitations for the initial preview:

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

