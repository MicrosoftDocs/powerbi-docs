---
title: "Create a paginated report based on a Power BI shared dataset"
description: Create a paginated report in Power BI Report Builder based on a Power BI shared dataset.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.date: 12/11/2025
ms.service: powerbi
ms.subservice: report-builder
ms.custom: video-removed
ms.topic: how-to
ai-usage: ai-assisted
---

# Create a paginated report based on a Power BI shared dataset

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

You can use a dataset that you create in Power BI Desktop as a data source for Power BI Report Builder paginated reports. Picture this scenario: You create a Power BI report in Power BI Desktop. You spend a lot of time designing the data model, then create a beautiful Power BI report with all sorts of great visuals. Your report has a matrix with many rows, so you have to scroll to see them all. Your report readers want a report they can print out, that shows all the rows in that matrix.

A Power BI paginated report can do that: print a table or matrix that runs to multiple pages, with page headers and footers and a perfect page layout that you design. It complements the Power BI Desktop report. You want them to be based on the exact same data, with no discrepancies, so you use the same dataset.

:::image type="content" source="media/report-builder-shared-datasets/power-bi-desktop-report-builder-arrow-26-pgs.png" alt-text="Screenshot of Report Builder paginated report printed from Power BI Desktop.":::

## What you need

Here's a list of what you need and don't need to use a shared dataset in Power BI Report Builder.

- Download and install [Power BI Report Builder](https://aka.ms/pbireportbuilder).
- The dataset can be in any workspace, and you don't need to be a member of that workspace.
- To access a Power BI semantic model, you need to have *Build permission* for the dataset. Read about [Build permission](../connect-data/service-datasets-build-permissions.md).
- You need a [Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md) license or [Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml) license to publish your paginated report.
- You don't need a Power BI Pro or PPU license to create a paginated report in Power BI Report Builder.
- You can publish to *My Workspace*. For any other workspace, you need at least a [Contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles).

If you want to follow along with this article, download the [Retail Analysis sample .pbix](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) file, open it in Power BI Desktop, and add a table with many columns. In the **Format** pane, slide the toggle under **Totals** to the off position.

:::image type="content" source="media/report-builder-shared-datasets/power-bi-desktop-totals-off.png" alt-text="Screenshot of Totals toggled to off position in the Format pane.":::

Then [publish the report to a workspace](../create-reports/desktop-upload-desktop-files.md) in the Power BI service.

## Connect to the Power BI semantic model

1. Open Power BI Report Builder.
1. Select **Sign in** in the upper-right corner of Report Builder to sign in to your Power BI account.
1. In the Report Data pane, select **New** > **Power BI Semantic Model Connection**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-new-dataset.png" alt-text="Screenshot of new dataset in the Report Data pane.":::

    > [!NOTE]
    > You can't create the data source or dataset for a Power BI Semantic Model by using the Report Builder Table, Matrix, or Chart wizards. After you create them, you can use the wizards to create tables, matrixes, or charts based on them.

1. Search or browse for the dataset, or for the workspace where the dataset resides, and then choose **Select**. Report Builder fills in the dataset name.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-select-dataset.png" alt-text="Screenshot that shows datasets to select from.":::

1. The dataset appears under Data Sources in the Report Data pane.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-data-source.png" alt-text="Screenshot of the Report Data pane with the dataset listed under Data Sources.":::

    Remember, you can connect to multiple Power BI semantic models and other data sources in the same paginated report.

## Get the DAX query for the dataset

When you want the data in your Power BI report and in your paginated report to be the same, connecting to the dataset isn't enough. You also need the Data Analysis Expressions (DAX) query that's built on that dataset.

Follow these steps to get the query:

1. Open the Power BI report (.pbix) in Power BI Desktop.
1. Make sure you have a table in your report that contains all the data you want in your paginated report. The table needs to meet these two requirements:
    - It needs to be a flat table, not a matrix or other visual. If it's not a table, convert it to a table now, go through the Performance Analyzer steps that follow, then convert it back to the visual you want.
    - For your numeric fields, use *predefined measures*. They have a calculator symbol next to them. Read about [creating measures](../transform-model/desktop-measures.md). 

        :::image type="content" source="media/report-builder-shared-datasets/power-bi-measure-icon.png" alt-text="Screenshot of the calculator icon next to a predefined measure.":::

1. On the **View** ribbon, select **Performance Analyzer**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-performance-analyzer.png" alt-text="Screenshot of the Performance Analyzer option in the View ribbon.":::

1. In the **Performance Analyzer** pane, select **Start recording**, and then select **Refresh visuals**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-performance-analyzer-refresh-visuals.png" alt-text="Screenshot of the Refresh visuals button in the Performance Analyzer.":::

1. Expand the plus sign (**+**) next to the table name, and select **Copy query**. The query is the DAX formula you need for the dataset in Power BI Report Builder.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-performance-analyzer-copy-query.png" alt-text="Screenshot of the Copy query link in the Performance Analyzer.":::

## Create the dataset with the query

1. Go back to Power BI Report Builder.
1. Right-click the dataset under **Data Sources** and select **Add Dataset**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-add-dataset.png" alt-text="Screenshot of the Add Dataset option under Data Sources.":::

1. In Dataset Properties, enter a name, and select **Query Designer**.
1. Make sure **DAX** is selected, and deselect the **Design Mode** icon.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-query-designer.png" alt-text="Screenshot of the Report Builder Query Designer pane.":::

1. In the upper box, paste the query you copied from Power BI Desktop.

    > [!NOTE]
    > If your query includes the TOPN function, delete it from your query.

1. Select **Execute Query** (the red exclamation mark, !) to make sure your query works. 

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-run-query.png" alt-text="Screenshot of the Execute query button in the Query Designer.":::

    You see the results of the query in the lower box.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-query-results.png" alt-text="Screenshot of the query results in the Query Designer.":::

1. Select **OK**.

    You see your query in the **Query** window of the **Dataset Properties** dialog box.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-dataset-properties.png" alt-text="Screenshot of the Dataset properties dialog box.":::

1. Select **OK**.

    Now you see your new dataset with a list of its fields in the Report Data pane.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-dataset.png" alt-text="Screenshot of the fields listed under the dataset in the Report Data pane.":::

## Create a table in the report

One quick way to create a table is to use the Table Wizard.

1. On the **Insert** ribbon, select **Table** > **Table Wizard**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-table-wizard.png" alt-text="Screenshot of the Table Wizard button on the Insert ribbon.":::

1. Choose the dataset you created with the DAX query > **Next**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-choose-dataset.png" alt-text="Screenshot of the dataset choices in the Table Wizard.":::

1. To make a flat table, select the fields you want in **Available fields**. You can select multiple fields at a time by selecting the first one you want, holding the Shift key, and selecting the last one.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-select-fields.png" alt-text="Screenshot of the available fields available in the Table Wizard.":::

1. Drag the fields to the **Values** box > **Next**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-value-fields.png" alt-text="Screenshot of the Values box in the Table Wizard.":::

1. Choose the layout options you want > **Next**.
1. Select **Finish**. You see your table in Design View.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-design-view.png" alt-text="Screenshot of the table in the Design View.":::

1. Select **Click to add title** and add a title.
1. Select **Run** to preview your report.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-preview.png" alt-text="Screenshot of the Report Preview.":::

1. Select **Print Layout** to see how your report looks when printed. 

    This report layout needs some work. It has 54 pages because the columns and margins make the table two pages wide.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-print-layout-2-p1-p2.png" alt-text="Screenshot of the Report Print Layout.":::

## Format the report

You have several formatting options to make your table fit on one page. 

1. Narrow the page margins in the Properties pane. If you don't see the Properties pane, on the **View** ribbon, select the **Properties** check box.
1. Select the report, not the table or title.
1. In the **Report Properties** pane, under **Page**, expand **Margins** and change each one to **0.75in**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-page-margins.png" alt-text="Screenshot of the page margin properties.":::

1. Make columns narrower. Select the column border and drag the right side to the left.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-column-width.png" alt-text="Screenshot of column width properties.":::

1. Another option is to make sure the number values are formatted well. Select a cell with a number value. 
    > [!TIP]
    > You can format more than cell at a time by holding down the Shift key while you select the other cells.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-select-cells.png" alt-text="Screenshot of multiple-cell selection for formatting.":::

1. On the **Home** ribbon, in the **Number** section, change the **Default** format to a numeric format such as **Currency**.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-number-format.png" alt-text="Screenshot of number format options.":::

1. Change the **Placeholder** style to **Sample Values** so you can see the formatting in the cell. 

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-sample-values.png" alt-text="Screenshot of sample values for formatting.":::

1. If appropriate, decrease the decimals to save more space in the **Number** section.

### Getting rid of blank pages

Even if you make the margins and the table columns narrower, you might still get blank pages. Why? Because of the math. 

When you add up the page margins you set, plus the width of the *body* of the report, the total must be less than the width of the report format.

For example, say your report has an 8.5" by 11" format and you set the side margins to 0.75" each. The two margins together make 1.5", so the body has to be less than 7" wide.

1. Select the right edge of the report design surface, and drag it so it's less than the desired number on the ruler. 

    > [!TIP]
    > You can set it more accurately in the **Body** properties. Under **Size**, set the **Width** property.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-body-size.png" alt-text="Screenshot of body size properties.":::

1. Select **Run** to preview your report and make sure you removed the blank pages. This report now has only 26 pages, instead of the original 54.

    :::image type="content" source="media/report-builder-shared-datasets/power-bi-report-builder-print-26-pgs.png" alt-text="Screenshot of report with blank pages omitted.":::

## Considerations and limitations

- For datasets that use *Live Connection to Analysis Services*, you can connect directly by using the underlying Analysis Services connection instead of a shared dataset.
- If you want to use a Power BI semantic model that uses DirectQuery in Power BI Report Builder, the dataset must include a measure, even if you don't plan to surface the measure in your report. Without the measure, the dataset doesn't return proper data results.
- Datasets with Promoted or Certified endorsements appear in the list of available datasets, but they don't show those marks.

## Related content

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
