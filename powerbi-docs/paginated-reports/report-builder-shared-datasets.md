---
title: "Create a paginated report with a Power BI shared dataset - Power BI Report Builder"
description: Create a paginated report in Power BI Report Builder based on a Power BI shared dataset.
author: maggiesMSFT
ms.author: maggies
ms.date: 04/02/2021
ms.service: powerbi
ms.subservice: report-builder
ms.custom: video-NfoOK4QRkhI
ms.topic: how-to
---
# Create a paginated report based on a Power BI shared dataset

[!INCLUDE [applies-yes-paginated-yes-service-yes-desktop](../includes/applies-yes-paginated-yes-service-yes-desktop.md)]

You can use a dataset that you create in Power BI Desktop as a data source for Power BI Report Builder paginated reports. Picture this scenario: You've created a Power BI report in Power BI Desktop. You spent a lot of time designing the data model, then created a beautiful Power BI report with all sorts of great visuals. Your report has a matrix with many rows, so you have to scroll to see them all. Your report readers want a report they can print out, that will show all the rows in that matrix. A Power BI paginated report can do that: print a table or matrix that runs to multiple pages, with page headers and footers and a perfect page layout that you design. It will complement the Power BI Desktop report. You want them to be based on the exact same data, no discrepancies, so you use the same dataset.

![Power BI Desktop to Report Builder paginated report](media/report-builder-shared-datasets/power-bi-desktop-report-builder-arrow-26-pgs.png)

## What you need

Here's a list of what you need and don't need to use a shared dataset in Power BI Report Builder.

- Power BI Report Builder. [Download and install Power BI Report Builder](https://aka.ms/pbireportbuilder).
- The dataset doesn't have to be in a workspace in a Premium capacity, and you don't need to be a member of that workspace. 
- To access a Power BI dataset, you need to have Build permission for the dataset. Read about [Build permission](../connect-data/service-datasets-build-permissions.md).
- You don't need a Power BI Pro or Premium Per User (PPU) license to create a paginated report in Report Builder. 
- You do need a Power BI Pro or Premium Per User (PPU) license to publish your paginated report. You also need at least a Contributor role for a workspace in a Premium capacity. 
- Optional: If you want to follow along with this article, download the Power BI Desktop [Retail Analysis sample .pbix](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) file, open it in Power BI Desktop and add a table with a lot of columns. In the **Format** pane, turn off **Totals**. Then publish it to a workspace in the Power BI service.

    ![Totals off](media/report-builder-shared-datasets/power-bi-desktop-totals-off.png)

## Connect to the Power BI dataset

1. Open Power BI Report Builder.
1. Select **Sign in** in the upper-right corner of Report Builder to sign in to your Power BI account.
1. In the Report Data pane, select **New** > **Power BI Dataset Connection**.

    ![New dataset in the Report Data pane](media/report-builder-shared-datasets/power-bi-report-builder-new-dataset.png)

    > [!NOTE]
    > You can't create the data source or dataset for a Power BI dataset by using the Report Builder Table, Matrix, or Chart wizards. After you've created them, you can use the wizards to create tables, matrixes, or charts based on them.

1. Search or browse for the dataset or the workspace where it resides > **Select**.
    Report Builder fills in the dataset name.

    ![Select dataset](media/report-builder-shared-datasets/power-bi-report-builder-select-dataset.png)
    
1. The dataset is listed under Data Sources in the Report Data pane.

    ![Dataset under Data Sources in the Report Data pane](media/report-builder-shared-datasets/power-bi-report-builder-data-source.png)

    Remember, you can connect to multiple Power BI datasets and other data sources in the same paginated report.


## Get the DAX query for the dataset

When you want the data in your Power BI report and in your Report Builder report to be the same, it's not enough to connect to the dataset. You also need the query that's built on that dataset.

### Video: Get the DAX query

In the following video, Chris Finlan demonstrates how to get the DAX you need for your paginated report.

> [!NOTE]  
> This video might use earlier versions of Power BI Report Builder or the Power BI service.

<iframe width="400" height="450" src="https://www.youtube.com/embed/NfoOK4QRkhI" frameborder="0" allowfullscreen></iframe>

### Steps to get the DAX query

Now here are the steps to get the query.

1. Open the Power BI report (.pbix) in Power BI Desktop.
1. Make sure you have a table in your report that contains all the data you want in your paginated report. The table needs to meet these two requirements:
    - It needs to be a flat table, not a matrix or other visual. If it's not a table, convert it to a table now, go through the Performance Analyzer steps that follow, then convert it back to the visual you want.
    - For your numeric fields, you need to use *predefined measures*. They have a calculator symbol next to them. Read about [creating measures](../transform-model/desktop-measures.md). 

        ![Measure icon](media/report-builder-shared-datasets/power-bi-measure-icon.png)

1. On the **View** ribbon, select **Performance Analyzer**.

    ![Open the Performance Analyzer](media/report-builder-shared-datasets/power-bi-performance-analyzer.png)

1. In the **Performance Analyzer** pane, select **Start recording**, then select **Refresh visuals**.

    ![Refresh visuals](media/report-builder-shared-datasets/power-bi-performance-analyzer-refresh-visuals.png)

1. Expand the plus sign (**+**) next to the table name, and select **Copy query**. The query is the DAX formula you need for the dataset in Power BI Report Builder.

    ![Copy the query](media/report-builder-shared-datasets/power-bi-performance-analyzer-copy-query.png)

## Create the dataset with the query

1. Go back to Power BI Report Builder.
1. Right-click the dataset under **Data Sources** and select **Add Dataset**.

    ![Add dataset](media/report-builder-shared-datasets/power-bi-report-builder-add-dataset.png)

1. In Dataset Properties, give it a name, and select **Query Designer**.

4. Make sure **DAX** is selected, and deselect the **Design Mode** icon.

    ![Report Builder Query Designer](media/report-builder-shared-datasets/power-bi-report-builder-query-designer.png)

1. In the upper box, paste the query you copied from Power BI Desktop.

    > [!NOTE]
    > If your query includes the TOPN function, delete it from your query.

1. Select **Execute Query** (the red exclamation mark, !) to be sure your query works. 

    ![Run the query](media/report-builder-shared-datasets/power-bi-report-builder-run-query.png)

    You see the results of the query in the lower box.

    ![Query results](media/report-builder-shared-datasets/power-bi-report-builder-query-results.png)

1. Select **OK**.

    You see your query in the **Query** window of the **Dataset Properties** dialog box.

    ![Dataset properties dialog box](media/report-builder-shared-datasets/power-bi-report-builder-dataset-properties.png)

1. Select **OK**.

    Now you see your new dataset with a list of its fields in the Report Data pane.

    ![Dataset in the Report Data pane](media/report-builder-shared-datasets/power-bi-report-builder-dataset.png)

## Create a table in the report

One quick way to create a table is to use the Table Wizard.

1. On the **Insert** ribbon, select **Table** > **Table Wizard**.

    ![Start the Table Wizard](media/report-builder-shared-datasets/power-bi-report-builder-table-wizard.png)

1. Choose the dataset you created with the DAX query > **Next**.

    ![Choose a dataset](media/report-builder-shared-datasets/power-bi-report-builder-choose-dataset.png)

1. To make a flat table, select the fields you want in **Available fields**. You can select multiple fields at a time by selecting the first one you want, holding the Shift key, and selecting the last one.

    ![Select multiple fields](media/report-builder-shared-datasets/power-bi-report-builder-select-fields.png)

1. Drag the fields to the **Values** box > **Next**.

    ![Table Wizard](media/report-builder-shared-datasets/power-bi-report-builder-value-fields.png)

1. Choose the layout options you want > **Next**.

1. Select **Finish**.
    You see your table in Design View.

    ![Report Design view](media/report-builder-shared-datasets/power-bi-report-builder-design-view.png)

1. Select **Click to add title** and add a title.

1. Select **Run** to preview your report.

    ![Report Preview](media/report-builder-shared-datasets/power-bi-report-builder-preview.png)

1. Select **Print Layout** to see how your report will look printed. 

    This report layout needs some work. It has 54 pages because the columns and margins make the table two pages wide.

    ![Report Print Layout](media/report-builder-shared-datasets/power-bi-report-builder-print-layout-2-p1-p2.png)

## Format the report

You have several formatting options to make your table fit on one page. 

1. You can narrow the page margins in the Properties pane. If you don't see the Properties pane, on the **View** ribbon, select the **Properties** check box.

1. Select the report, not the table or title.
1. In the **Report Properties** pane, under **Page**, expand **Margins** and change each one to **0.75in**.

    ![Set page margins](media/report-builder-shared-datasets/power-bi-report-builder-page-margins.png)

1. You can also make columns narrower. Select the column border and drag the right side to the left.

    ![Set column width](media/report-builder-shared-datasets/power-bi-report-builder-column-width.png)

1. Another option is to make sure the number values are formatted well. Select a cell with a number value. 
    > [!TIP]
    > You can format more than cell at a time by holding down the Shift key while you select the other cells.

    ![Select more than one cell](media/report-builder-shared-datasets/power-bi-report-builder-select-cells.png)

1. On the **Home** ribbon, in the **Number** section, change the **Default** format to a numeric format such as **Currency**.

    ![Set number format](media/report-builder-shared-datasets/power-bi-report-builder-number-format.png)

1. Change the **Placeholder** style to **Sample Values** so you can see the formatting in the cell. 

    ![View sample values](media/report-builder-shared-datasets/power-bi-report-builder-sample-values.png)

1. If appropriate, in the **Number** section decrease the decimals to save more space.

### Getting rid of blank pages

Even if you've made the margins and the table columns narrower, you may still end up with every other page being blank. Why? Because of the math. 

When you add up the page margins you set, plus the width of the *body* of the report, it has to be less than the width of the report format.

For example, say your report has an 8.5" X 11" format and you've set the side margins to 0.75 each. The two margins together make 1.5", so the body has to be less than 7" wide.

1. Select the right edge of the report design surface, and drag it so it's less than the desired number on the ruler. 

    > [!TIP]
    > You can set it more accurately in the **Body** properties. Under **Size**, set the **Width** property.

    ![Set body size](media/report-builder-shared-datasets/power-bi-report-builder-body-size.png)

1. Select **Run** to preview your report and make sure you've gotten rid of the blank pages. This report now has only 26 pages, instead of the original 54. Success!

    ![Print no blank pages](media/report-builder-shared-datasets/power-bi-report-builder-print-26-pgs.png)

## Limitations and considerations 

- For datasets that use a Live Connection to Analysis Services, you can connect directly by using the underlying Analysis Services connection instead of a shared dataset.
- If you want to use a Power BI dataset that uses DirectQuery in Power BI Report Builder, the dataset has to include a measure, even if you don't plan to surface the measure in your report. Without the measure, the dataset won't return proper data results.
- Datasets with Promoted or Certified endorsements appear in the list of available datasets, but they aren't marked as such. 
- You can't embed paginated reports that are based on Power BI shared datasets in the "App Owns Data" scenario.

## Next steps

- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)
