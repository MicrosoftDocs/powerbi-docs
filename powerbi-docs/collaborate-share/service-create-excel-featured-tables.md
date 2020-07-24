---
title: Identify featured tables in Power BI Desktop (preview)
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

In the Data Types Gallery in Excel, your users can find data from *featured tables* in Power BI datasets. In this article, you learn how to identify tables as *featured* in your datasets. These tags make it easier for your users to add enterprise data to their Excel sheets. Here are the basic steps for identifying and sharing featured tables.

1. You [promote or certify datasets in Power BI](../connect-data/service-datasets-promote.md). 
1. You identify featured tables in your datasets in Power BI Desktop.
1. You save those datasets with featured tables to one of the new workspaces. Report creators can create reports with those featured tables. 
1. The rest of the organization can connect to those featured tables, referred to as *data types* in Excel, for relevant and refreshable data. 
 
See the article [Access Power BI featured tables in Excel (preview)](service-excel-featured-tables.md) for details about consuming these featured tables in Excel.

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

Here are limitations for the initial preview.

- Featured tables in Power BI datasets that use the following capabilities aren't shown in Excel: 

    - Row-level security datasets.
    - Microsoft Information Protection enabled datasets.
    - DirectQuery datasets.
    - Datasets with a live connection.

- Excel shows only data in columns and calculated columns in the featured table. The following aren't provided in the initial preview:

    - Measures defined on the feature table.
    - Measures defined on related tables, and implicit measures calculated from relationships.

- Excel only displays featured tables that are stored in the new Power BI workspaces. Featured tables stored in the classic workspaces, or My Workspace, aren't shown as data types in Excel. You can [upgrade classic workspaces to the new workspaces](service-upgrade-workspaces.md) in Power BI.
- See [Considerations and limitations](service-excel-featured-tables.md#considerations-and-limitations) in the article "Access Power BI featured tables in Excel" for other Excel considerations.

## Next steps

- Questions? [Try the Power BI Community](https://community.powerbi.com/)

