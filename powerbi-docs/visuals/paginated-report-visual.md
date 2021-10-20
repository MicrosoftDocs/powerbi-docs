---
title: Create and use the paginated report visual
description: In this article, you learn how to add the paginated report visual for Power BI reports. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'mibruhje'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 09/14/2021
---

# Create and use the paginated report visual

[!INCLUDE [applies-yes-paginated-yes-service-yes-desktop](../includes/applies-yes-paginated-yes-service-yes-desktop.md)]

In this article, you learn how to use the paginated report visual for Power BI reports. This native Power BI visual allows you to render any paginated report you’ve uploaded to the service in a Power BI report.  

This visual brings the power of paginated reports to your Power BI reports. You can map fields from your Power BI dataset to be used as parameter values for your paginated report visual. This provides a fully interactive experience like any other visual.  

## Prerequisites

- To access a paginated report to include in your Power BI report with a paginated report visual, you need access to a workspace in a [Power BI Premium capacity](../admin/service-premium-what-is.md).
- To publish your Power BI report with a paginated report visual to the Power BI service, you need a [Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md) license, or [Premium Per User (PPU)](../admin/service-premium-per-user-faq.yml) license, and write access to a workspace in a Power BI Premium capacity.

## Create a paginated report visual

1. Open your Power BI report in Power BI Desktop or in the Power BI service. If in the Power BI service, select **Edit**. 

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-1.png" alt-text="Screenshot of selecting Edit in the Power BI service.":::

1. Select **Paginated Report** from the Visualizations pane.  

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-2.png" alt-text="Screenshot of selecting the Paginated report visual from the Visualizations pane.":::

1. Select **Connect to report**.

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-3.png" alt-text="Screenshot of the Connect to report box.":::

1. Search for and select an existing paginated report saved to the Power BI service. 

1. Select **Set Parameters**.

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-4.png" alt-text="Screenshot of setting parameters.":::

1. You have two options for mapping paginated report parameters:  

    You can bind the paginated report parameter to Power BI fields:

    a. Drag your Power BI field into the Parameters field in the Visualizations pane.  
    b. Select this field from the dropdown menu. Select **See report**.

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-5-set-parameters.png" alt-text="Screenshot of binding a field in Power BI to a parameter in the paginated report visual.":::

    Or choose to use the default parameter for the paginated report, if the report author specified any.

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-5-default-parameters.png" alt-text="Screenshot of specifying parameters in the paginated report visual.":::

1. Now your paginated report will render within your Power BI report.  

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-6.png" alt-text="Screenshot of paginated report rendering in a Power BI report.":::

1. If making edits in the Power BI service, select **Save** to save your changes. If making edits in Power BI Desktop, select **Publish**, then choose a workspace in a Premium capacity to publish your Power BI report to the Power BI service.  

    > [!NOTE]
    > We recommend saving the Power BI report with the paginated report visual to the same workspace as the paginated report. This ensures that readers with access to the Power BI report also have access to the paginated report, which is required for the paginated report visual to render.

    :::image type="content" source="media/paginated-report-visual/paginated-report-visual-step-7.png" alt-text="Screenshot of publishing the report to the Power BI service.":::

## Cross-filtering

You can enable cross-filtering between your paginated report visual and other visuals in your Power BI report by mapping your paginated report parameters to fields in the Power BI report. If you have other visuals that affect the Power BI field you’ve selected for the parameter value(s), the paginated report visual updates as you interact with those visuals.

For example, if Fiscal Year FY2018 is selected in the slicer visual, the paginated report visual automatically updates to show sales for FY2018, because the Power BI field for Fiscal Year is mapped to the paginated report parameter for Fiscal Year.  

:::image type="content" source="media/paginated-report-visual/paginated-report-visual-cross-filtering.png" alt-text="Screenshot of cross-filtering between a paginated report visual and other visuals in the Power BI report.":::

## Turn on the toolbar

From the **Format** pane, you can show or hide the **Toolbar** in your paginated report visual. With the toolbar visible, report readers can easily export the paginated report from within your Power BI report. Paginated reports support exporting to the following formats: Excel, PDF, Accessible PDF, CSV, PowerPoint, Word, MHTML, and XML. Unlike the 150,000 row limitation imposed by standard Power BI reports, with the paginated report visual, you can export up to 1,000,000 rows to Excel, while retaining all the formatting in the paginated report.

:::image type="content" source="media/paginated-report-visual/paginated-report-visual-toolbar-export.png" alt-text="Screenshot of Export option on the paginated report toolbar.":::

You can also show parameters in the toolbar. In the **Format** pane, turn **Parameters** on. With this option enabled, you can select and apply parameters from the paginated report visual toolbar.  

:::image type="content" source="media/paginated-report-visual/paginated-report-visual-toolbar-parameters.png" alt-text="Screenshot of Parameters in the paginated report toolbar.":::

## Auto-apply filters

You can decide whether report filters are automatically applied to the paginated report visual, or not. By default, the Auto-apply filters option is turned off. This means your paginated report visual remains unchanged as you adjust filters in your Power BI report. If you turn on Auto-apply filters, your paginated report visual automatically updates as you apply filters or update other visuals that affect the field you’ve selected for the parameter value.  

- Select your paginated report visual. From the **Format** pane, turn **Auto-apply filters** on.

## Considerations and limitations

- When mapping an aggregate field in Power BI (for example, Sum, Average, Minimum, or Maximum) to a paginated report parameter, consider whether your paginated report parameter is a single-value or multi-value parameter. If mapping to a single-value parameter, the aggregate value is used, but if mapping to a multi-value parameter, the per-row aggregate values are mapped to the parameter.
- When embedding a Power BI report that contains a paginated report visual, using the *embed for your customers* method, you need a service principal and a multi-resource embed token as explained in [Frequently asked questions about Power BI Embedded](../developer/embedded/embedded-faq.yml#how-can-i-embed-a-power-bi-report-that-contains-a-paginated-report-visual-).

### Using a Power BI dataset with a date parameter

> [!NOTE]
> Versions of Power BI Report Builder 15.7.01704.0001 and above allow you to use date parameters with the paginated report visual without having to follow these next steps. [Download the newest version of Power BI Report Builder](https://aka.ms/pbireportbuilder).

When you use a Power BI dataset as the data source for your paginated report and set up a date parameter in your query that then automatically generates the parameter table and parameter, using that parameter in a paginated report parameter will fail. The paginated report visually treats the parameter as a text field and fails to match the Power BI date field. There are three options to work around this:

- From the same Power BI data source, create a new dataset with only the date values. Use this dataset as the available values for your parameter, setting the data type of the parameter as Date/Time.
- Manually change the DAX query text in the auto-generated dataset to remove the part that sets the parameter to be a text value.  
- Change the Power BI dataset using Power Query to add a column that formats the date field as a text field.

## Next steps

- [What are paginated reports in Power BI Premium?](../paginated-reports/paginated-reports-report-builder-power-bi.md) 
- [Tutorial: Create a paginated report and upload it to the Power BI service](../paginated-reports/paginated-reports-quickstart-aw.md) 
- [Power BI Paginated Reports in a Day course](../learning-catalog/paginated-reports-online-course.md) 

More questions? [Try the Power BI Community](https://community.powerbi.com/)
