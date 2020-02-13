---
title: 'Tutorial: Use Power BI Analyze in Excel, starting in Excel'
description: In this tutorial, you use the Power BI Datasets page to import datasets into Excel.
author: tejaskulkarni
ms.reviewer: davidiseminger

ms.service: powerbi
ms.subservice: powerbi-service
ms.custom: connect-to-services
ms.topic: tutorial
ms.date: 02/13/2020
ms.author: tekulkar
#customer intent: "As an inexperienced Power BI and Excel user, I want to use powerbi.com/datasets to import my data into Excel so that I can use it."

LocalizationGroup: Connect to services
---

# Tutorial: Use Power BI Analyze in Excel, starting in Excel

Your organization makes use of Power BI to share access to data. You can start the Power BI Analyze in Excel feature from Excel. Then create PivotTable and PivotCharts in Excel, to bring additional context to your analytics or reduce the time to find and import relevant datasets.

To get started selecting a dataset, in Excel select **Analyze in Excel**. You're guided to create a PivotTable that uses the data.  

You can find additional datasets shared by your organization by returning to the Datasets page.

If you encounter issues at any point, select **No** at the appropriate step in the flow below and provide feedback in the linked form.  

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Download an ODC file from the Power BI Datasets page.
> * Enable access to your dataset from Excel.
> * Begin to use the dataset to create PivotTables, charts and worksheets

## Prerequisites

To complete this tutorial, you need:

* A Power BI account. If you're not signed up for Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.

* Ensure you are comfortable with all the steps listed in the [Get started with the Power BI service](https://docs.microsoft.com/power-bi/service-get-started) tutorial.

* You need a Power BI Premium dataset and a Power BI Pro license, visit [What is Power BI Premium?](https://docs.microsoft.com/power-bi/service-premium-what-is) for more information.

* A full list of prerequisites may be found in the comprehensive [Analyze in Excel](https://docs.microsoft.com/power-bi/service-analyze-in-excel#requirements) document.

* An active [Microsoft Office E5 subscription](https://www.microsoft.com/microsoft-365/business/office-365-enterprise-e5-business-software?activetab=pivot%3aoverviewtab)

## Get started

Starting in Excel, select the option to create PivotTables with Power BI shared data and navigate to the Power BI Datasets page.

![Datasets Page](media/service-tutorial-analyze-in-excel/tutorial-analyze-in-excel-01.png)

While using the Analyze in Excel workflow, you will see several prompts to guide you; indicate if you have completed each step to progress. If you come across issues at any step, select **No** and provide your feedback on the corresponding form.

![Workflow Instructions](media/service-tutorial-analyze-in-excel/tutorial-analyze-in-excel-02.png)

## Download and open the ODC file

Choose your dataset from the corresponding list and associated workspace and then click Analyze in Excel. Power BI creates an ODC file and downloads it from the browser to your computer.

![Select dataset](media/service-tutorial-analyze-in-excel/tutorial-analyze-in-excel-03.png)

When you open the file in Excel, an empty PivotTable and Fields list appears with the tables, fields, and measures from the Power BI dataset. You can create PivotTables, charts, and analyze that dataset just as you would work with a local dataset in Excel.

## Enable data connections

In order to analyze Power BI data in Excel, you may be prompted to trust the connection. Administrators can disable the use of Analyze in Excel with on-premises datasets on Analysis Services Databases from the Power BI Admin Portal.

![Enable Connection](media/service-tutorial-analyze-in-excel/tutorial-analyze-in-excel-04.png)

## Install updates and authenticate

You may also be required to authenticate with your Power BI account the first time you open a new ODC file.  If you have issues, visit the comprehensive [Analyze in Excel](https://docs.microsoft.com/power-bi/service-analyze-in-excel#sign-in-to-power-bi ) document for more information or click No during the workflow.

![Enable Connection](media/service-tutorial-analyze-in-excel/tutorial-analyze-in-excel-05.png)

## Analyze away

Similar to other local workbooks, Analyze in Excel allows you to create PivotTables, charts, add data, and create different worksheets with views into your data. Analyze in Excel exposes all detail-level data to any users with permission to the dataset. You can save this workbook, but cannot publish or import it back into Power BI or share it with other users in your organization. For more information and other use cases, visit [Analyze in Excel](https://docs.microsoft.com/power-bi/service-analyze-in-excel#analyze-away).

## Clean up resources

Interactions with the Power BI Service and Datasets page should be limited to downloading the ODC file and clicking through the workflow. If you have trouble with any of these steps, indicate **No** on the appropriate step and provide feedback in the linked form. The form contains a link to more information about the issue. Revisit the Datasets page to retry the process or select another dataset.

## Next steps

You might also be interested in the following articles:

* [Use cross-report drillthrough in Power BI Desktop](https://docs.microsoft.com/power-bi/desktop-cross-report-drill-through)

* [Using slicers Power BI Desktop](https://docs.microsoft.com/power-bi/visuals/power-bi-visualization-slicers)
