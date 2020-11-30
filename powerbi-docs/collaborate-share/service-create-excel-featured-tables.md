---
title: Set featured tables in Power BI Desktop (preview)
description: Create featured tables in Power BI Desktop so they show up in the Data Types Gallery in Excel. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 09/17/2020
LocalizationGroup: Share your work
---
# Set featured tables in Power BI Desktop (preview)

In the Data Types Gallery in Excel, your users can find data from *featured tables* in your Power BI datasets. In this article, you learn how to set tables as *featured* in your datasets. These tags make it easier for your users to add enterprise data to their Excel sheets. Here are the basic steps for setting and sharing featured tables.

1. You identify featured tables in your datasets in Power BI Desktop (this article)
1. You save those datasets with featured tables to one of the new workspaces. Report creators can create reports with those featured tables. 
1. The rest of the organization can connect to those featured tables, referred to as *data types* in Excel, for relevant and refreshable data. The article [Access Power BI featured tables in Excel (preview)](service-excel-featured-tables.md) describes consuming these featured tables in Excel.

> [!NOTE]
> You can [promote or certify datasets in Power BI](../collaborate-share/service-endorse-content.md). That's called *endorsement*. Excel prioritizes tables in endorsed datasets in the Data Types Gallery. Excel lists featured tables in certified datasets first, then tables in promoted datasets. Excel lists featured tables in unendorsed datasets after that. 

## Turn on the featured table preview

1. In Power BI Desktop, select **File** > **Options and Settings** > **Options** > **Preview Features**.
2. Select the **Featured tables** check box.

    :::image type="content" source="media/service-excel-featured-tables/power-bi-preview-featured-tables.png" alt-text="Preview featured tables option":::

3. Restart Power BI Desktop.

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
    - Some datasets aren't supported in the preview, featured tables defined in those datasets won’t appear in Excel. See the next section, Considerations and limitations, for details.

## Considerations and limitations

Here are limitations for the initial preview.

- Featured tables in Power BI datasets that use the following capabilities aren't shown in Excel:

    - DirectQuery datasets.
    - Datasets with a live connection.

- Excel shows only data in columns and calculated columns in the featured table. Measures defined on related tables, and implicit measures calculated from relationships, aren't provided in the initial preview.
- Excel only displays featured tables that are stored in the new Power BI workspaces. Featured tables stored in the classic workspaces aren't shown as data types in Excel. You can [upgrade classic workspaces to the new workspaces](service-upgrade-workspaces.md) in Power BI.
- See [Considerations and limitations](service-excel-featured-tables.md#considerations-and-limitations) in the article "Access Power BI featured tables in Excel" for other Excel considerations.

## Next steps

- [Access Power BI featured tables in Excel](service-excel-featured-tables.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)

