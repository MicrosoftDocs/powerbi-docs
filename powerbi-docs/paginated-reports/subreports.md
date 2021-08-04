---
title: "Subreports in Power BI paginated reports"
description: In this article, you learn about supported data sources for paginated reports in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 04/29/2020
---

# Subreports in Power BI paginated reports

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] 

A *subreport* is a paginated report item that displays another paginated report inside the body of a main paginated report. Conceptually, a subreport in a report is similar to a frame in a Web page. You use it to embed a report within a report. You can use any report as a subreport. You store the report that is displayed as the subreport in the same Premium workspace as the parent report. You can design the parent report to pass parameters to the subreport. A subreport can repeat within data regions, using a parameter to filter data in each instance of the subreport.  
  
 ![Subreport in a paginated report](media/subreports/paginated-report-subreport.png "Paginated report subreport")  
  
 In this illustration, the contact information displayed in the main Sales Order report actually comes from a Contacts subreport.  
  
You create and modify paginated report definition (.rdl) files in Power BI Report Builder. You can upload subreports stored in SQL Server Reporting Services to a Premium workspace in the Power BI service. The main reports and the subreports need to be published to the same workspace. Install [Power BI Report Builder](https://aka.ms/pbireportbuilder).
  
## Work with Report Builder and the Power BI service

Power BI Report Builder can work with paginated reports on your computer (known as local reports) or with reports on the Power BI service.  When you open Report Builder for the first time, you're asked to sign into your Power BI account. If not, select **Sign In** in the upper-right corner.

:::image type="content" source="media/subreports/report-builder-sign-in.png" alt-text="Sign in to Power BI":::

After signing in, you see a **Power BI Service** option in Power BI Report Builder for the **Open** and **Save As** options on the **File** menu. When you select the **Power BI Service** option to save a report, you create a live connection between Power BI Report Builder and the Power BI service. 

:::image type="content" source="media/subreports/report-builder-subreport-open-service.png" alt-text="Open from the Power BI service":::

## Save a local report to the Power BI service

Before you can add a subreport to a main report, first create the two reports and save them to the same Power BI Premium workspace. 

1. To open an existing local report, on the **File** menu, select **Open** > **This PC** and select an .rdl file.  

2. On the **File** menu, select **Save As** > **Power BI Service**.  See [Publish a paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md) for details.

    > [!NOTE]
    > You can also upload a report by starting in the Power BI service. The same article, [Publish a paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md), has details.

3. In the **Save As** dialog box, select a Power BI Premium workspace where you can store your paginated reports.  Premium workspaces have a diamond icon ![Premium diamond icon](media/subreports/report-builder-premium-diamond.png) next to their name.

    :::image type="content" source="media/subreports/report-builder-subreport-save-as-service.png" alt-text="Save as to the Power BI service":::

4. Select **Save**.

## Add a subreport to a report

Now that you've saved both reports to the same Premium workspace, you can add one to the other as a subreport. There are two ways to add a subreport. 

1. On the **Insert** ribbon, select the **Subreport** button, or right-click on the report canvas and select **Insert** > **Subreport**.

    :::image type="content" source="media/subreports/report-builder-insert-subreport.png" alt-text="Insert a subreport in a report":::

    The **Subreport Properties** dialog box opens.  

2. Select the **Browse** button > navigate to the report you want to use as the subreport > specify the name of the subreport in the **Name** text box.

3. Configure other properties as needed, including [parameters](#use-parameters-in-subreports).

## Use parameters in subreports  
 To pass parameters from the parent report to the subreport, define a report parameter in the report that you use as the subreport. When you place the subreport in the parent report, you can select the report parameter and a value to pass from the parent report to the report parameter in the subreport.  
  
> [!NOTE]  
> The parameter that you select from the subreport is a *report* parameter, not a *query* parameter.  
  
 You can place a subreport in the main body of the report or in a data region. If you place a subreport in a data region, the subreport repeats with each instance of the group or row in the data region. You can pass a value from the group or row to the subreport. In the subreport value property, use a field expression for the field containing the value you want to pass to the subreport parameter.  
  
 For more about working with parameters and subreports, see [Add a subreport and parameters](/sql/reporting-services/report-design/add-a-subreport-and-parameters-report-builder-and-ssrs) in the SQL Server Reporting Services documentation.  

## Preview paginated reports in Report Builder

You can preview your reports in Report Builder.

- On the **Home** ribbon, select **Run**. 

Because Report Builder is a design tool, previewing the report may look different from rendering the report in the Power BI service.

### Notes about previewing

- Report Builder doesn’t store credentials for data sources used in reports.  Report Builder asks you for each set of credentials during preview.  
- If the report data sources are on premises, you need to configure a gateway after saving the report to the Power BI workspace.
- If Report Builder encounters an error during preview, it returns a generic message.  If the error is hard to debug, consider rendering the report in the Power BI service.  

## Considerations

### Maintaining the connection

Report Builder doesn’t persist the connection to Power BI when you close the file.  It's possible to work with a local main report with subreports stored in the Power BI workspace. Be sure to save the main report to the Power BI workspace before closing the report.  If you don't, you may get a ‘not found’ message during preview, because there's no live connection to the Power BI service.  In that case, go to a subreport and select its properties.  Open the subreport again from the Power BI service.  This re-establishes the connection, and all other subreports should be fine.

### Renaming a subreport

If you rename a subreport in the workspace, you need to fix the name reference in the main report. Otherwise, the subreport won't render. The main report still renders with an error message inside the subreport item.

## Migrate large reports

If you're migrating large reports to Power BI, consider using the [RdlMigration tool](../guidance/migrate-ssrs-reports-to-power-bi.md).  The RdlMigration tool has been updated to handle duplicate subreport names.  Duplicate subreport names can occur when two or more reports share the same name but reside in different subdirectories.  If the names aren't uniquely resolved, only the first subreport is recognized.

If you want to use Report Builder to migrate large reports, we recommend working with the subreports first. Save each one to the Power BI workspace to prevent any duplicate report names.

## Share reports with subreports

As we've stated, the main report and subreports must be in the same workspace. Otherwise, the subreport doesn't render. When sharing the main report, you also need to share the subreports. If you share the main report in an app, make sure you also include the subreports in that app. If you share the main report with users or user groups directly, make sure you also share each subreport with the same set of users or user groups.
  
## Next steps

[Troubleshoot subreports in Power BI paginated reports](subreports-troubleshoot.md)

[View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)