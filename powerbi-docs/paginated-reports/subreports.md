---
title: Subreports in Power BI Paginated Reports
description: Learn about supported data sources for paginated reports in the Power BI service.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 12/01/2025
ai-usage: ai-assisted
---

# Subreports in Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

A *subreport* is a paginated report item that displays another paginated report inside the body of a main paginated report. Conceptually, a subreport in a report is similar to a frame in a Web page. You use it to embed a report within a report. You can use any report as a subreport. You store the report that is displayed as the subreport in the same workspace as the parent report. You can design the parent report to pass parameters to the subreport. A subreport can repeat within data regions, using a parameter to filter data in each instance of the subreport.  

In the following screenshot, the contact information displayed in the main Sales Order report actually comes from a Contacts subreport.  
  
:::image type="content" source="media/subreports/paginated-report-subreport.png" alt-text="Screenshot showing a subreport in a paginated report." lightbox="media/subreports/paginated-report-subreport.png":::
  
You create and modify paginated report definition (.rdl) files in Power BI Report Builder. You can upload subreports stored in SQL Server Reporting Services to a workspace in the Power BI service. The main reports and the subreports need to be published to the same workspace. 

## Prerequisites 

[!INCLUDE [power-bi-paginated-prerequisites](../includes/power-bi-paginated-prerequisites.md)]
 
## Work with Report Builder and the Power BI service

Power BI Report Builder can work with paginated reports on your computer, known as local reports, or with reports on the Power BI service.  When you open Report Builder for the first time, you're asked to sign into your Power BI account. If not, select **Sign In** at the upper-right corner.

:::image type="content" source="media/subreports/report-builder-sign-in.png" alt-text="Screenshot showing Sign in to Power BI." lightbox="media/subreports/report-builder-sign-in.png":::

After signing in, you see a **Power BI Service** option in Power BI Report Builder for the **Open** and **Save As** options on the **File** menu. When you select the **Power BI Service** option to save a report, you create a live connection between Power BI Report Builder and the Power BI service. 

:::image type="content" source="media/subreports/report-builder-subreport-open-service.png" alt-text="Screenshot showing Open from the Power BI service." lightbox="media/subreports/report-builder-subreport-open-service.png":::

## Save a local report to the Power BI service

Before you can add a subreport to a main report, first create the two reports and save them to the same Power BI workspace.

1. To open an existing local report, on the **File** menu, select **Open** > **This PC** and select an .rdl file.  

1. On the **File** menu, select **Save As** > **Power BI Service**. For more information, see [Publish a paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md).

    > [!NOTE]
    > You can also upload a report by starting in the Power BI service. The same article, [Publish a paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md), has details.

1. In the **Save As** dialog box, select a Power BI workspace where you can store your paginated reports.

    :::image type="content" source="media/subreports/report-builder-subreport-save-as-service.png" alt-text="Screenshot showing Save as to the Power BI service." lightbox="media/subreports/report-builder-subreport-save-as-service.png":::

1. Select **Save**.

## Add a subreport to a report

After you save both reports to the same workspace, you can add one to the other as a subreport. There are two ways to add a subreport.

1. On the **Insert** ribbon, select the **Subreport** button, or right-click on the report canvas and select **Insert** > **Subreport**.

    :::image type="content" source="media/subreports/report-builder-insert-subreport.png" alt-text="Screenshot showing Insert a subreport in a report." lightbox="media/subreports/report-builder-insert-subreport.png":::

    The **Subreport Properties** dialog box opens.  

1. Select the **Browse** button > navigate to the report you want to use as the subreport > specify the name of the subreport in the **Name** text box.

1. Configure other properties as needed, including [parameters](#use-parameters-in-subreports).

## Use parameters in subreports  

To pass parameters from the parent report to the subreport, define a report parameter in the report that you use as the subreport. When you place the subreport in the parent report, you can select the report parameter and a value to pass from the parent report to the report parameter in the subreport.  
  
> [!NOTE]  
> The parameter that you select from the subreport is a *report* parameter, not a *query* parameter.  
  
You can place a subreport in the main body of the report or in a data region. If you place a subreport in a data region, the subreport repeats with each instance of the group or row in the data region. You can pass a value from the group or row to the subreport. In the subreport value property, use a field expression for the field containing the value you want to pass to the subreport parameter.  
  
For more about working with parameters and subreports, see [Add a subreport and parameters](parameters/add-subreport-parameters-report-builder.md).  

## Preview paginated reports in Report Builder

You can preview your reports in Report Builder.

- On the **Home** ribbon, select **Run**. 

Because Report Builder is a design tool, previewing the report might look different from rendering the report in the Power BI service.

### Notes about previewing

- Report Builder doesn’t store credentials for data sources used in reports.  Report Builder asks you for each set of credentials during preview.  
- If the report data sources are on premises, you need to configure a gateway after saving the report to the Power BI workspace.
- If Report Builder encounters an error during preview, it returns a generic message.  If the error is hard to debug, consider rendering the report in the Power BI service.  

## Considerations

Keep the following points in mind when working with subreports.

### Maintain the connection

When you close the file, the connection between Report Builder and Power BI ends. It's possible to work with a local main report with subreports stored in the Power BI workspace. Be sure to save the main report to the Power BI workspace before closing the report.  If you don't, you might get a ‘not found’ message during preview, because there's no live connection to the Power BI service.  In that case, go to a subreport and select its properties.  Open the subreport again from the Power BI service.  This re-establishes the connection, and all other subreports should be fine.

### Rename a subreport

If you rename a subreport in the workspace, you need to fix the name reference in the main report. Otherwise, the subreport won't render. The main report still renders with an error message inside the subreport item.

## Migrate large reports

If you're migrating large reports to Power BI, consider using the [RDL migration tool](../guidance/migrate-ssrs-reports-to-power-bi.md#migration-tool-for-previous-versions-of-sql-server). The RDL migration tool was updated to handle duplicate subreport names.  Duplicate subreport names can occur when two or more reports share the same name but reside in different subdirectories.  If the names aren't uniquely resolved, only the first subreport is recognized.

If you want to use Report Builder to migrate large reports, you should work with the subreports first. Save each one to the Power BI workspace to prevent any duplicate report names.

## Share reports with subreports

The main report and subreports must be in the same workspace. Otherwise, the subreport doesn't render. When sharing the main report, you also need to share the subreports. If you share the main report in an app, make sure you also include the subreports in that app. If you share the main report with users or user groups directly, make sure you also share each subreport with the same set of users or user groups.
  
## Related content

- [Troubleshoot subreports in Power BI paginated reports](subreports-troubleshoot.md)

- [View a paginated report in the Power BI service](../explore-reports/paginated-reports-view-power-bi-service.md)

- More questions? [Ask the Power BI community](https://community.powerbi.com/)