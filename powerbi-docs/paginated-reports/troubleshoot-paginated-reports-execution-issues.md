---
title: "Troubleshoot paginated report execution issues"
description: In this article, diagnose and fix processing and rendering issues with paginated reports.
author: maggiesMSFT
ms.author: nisrinivasan
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: troubleshooting
ms.date: 01/08/2024
---
# Troubleshoot paginated report execution issues

After the report processor retrieves the report data, it combines the data and layout information. Each report item property that has an expression is evaluated in the context of the combined data and layout.

After the report data and layout information are combined, the compiled report is sent to a report renderer. For example, when you preview a report locally, you are using the HTML renderer to view the compiled report. Use this topic to help troubleshoot issues specific to report processing and rendering.

## My report definition isn't valid

At run time, the report processor combines data and layout elements in the report definition, and evaluates expressions for report item properties.   
  
The report processor checks that the report definition (.rdl file) conforms to the schema that is specified in the namespace declaration at the beginning of the .rdl file.
  
In addition, the report expressions that are evaluated at run time must follow a set of rules that ensure the report data and layout can be combined correctly. When the report processor detects a problem, you might see the following message: The definition of the report `<report name>` is invalid.  
  
### Report item expressions can only refer to fields within the current dataset scope or, if inside an aggregate, the specified dataset scope.  
  
Use the following list to help determine the cause of the error:

* When a report has more than one dataset, an aggregate expression in a text box on the report body must specify a scope parameter. For example, `=First(Fields!FieldName.Value, "DataSet1")`.  
  
To specify a scope parameter, provide the name of a dataset, data region, or group that is in scope for the report item. For more information, see these articles:

* [Understanding Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expressions/expression-scope-for-totals-aggregates-and-built-in-collections.md), and
* [Expression Reference (Power BI Report Builder)](./expressions/report-builder-expressions.md)
  
### Names of objects must be greater than 0 and less than or equal to 256 characters

The length of object identifiers in a report definition is restricted to 256 characters. Identifiers must be case-sensitive and CLS-compliant. Names must begin with a letter, consist of letters, numbers, or an underscore (_), and have no spaces. For example, text box names or data region names must comply with these guidelines.   
  
To change the name of an object, in the toolbar of the Properties pane, select the item in the drop-down list, scroll to **Name**, and enter a valid object name.   
  
## A text box displays "#Error"; how do I fix it?  

The "#Error" message occurs when the report processor evaluates expressions in report item properties at run-time and detects a data type conversion, scope, or other error.   
  
A data type error usually means the default or the specified data type is not supported. A scope error means that the specified scope was not available at the time that the expression was evaluated.   
  
To eliminate the #Error message, you must rewrite the expression that causes it. To determine more details about the issue, view the detailed error message.   

## Why do I have extra white space, including blank pages, in my report?

Report items are automatically adjusted during report processing to preserve white space that is defined as part of the report. White space in the report design view is preserved. On the report design surface, the white background represents white space that is preserved when a report is viewed, exported, or printed, depending on target medium.  
  
### White space and page breaks interact during rendering  

When you view a report or export the report to a file format, the associated rendering extension processes the report and saves it to the specified file format. Each rendering extension processes the white space in a report according to specific rules. White space is also affected by the page setting properties, page breaks set on report items, the relative position of report items placed in the report body, the KeepTogether property for certain report items, and whether report items are in parent containers.   
  
To eliminate extra pages because of report width, drag the edge of the report design surface to align with the outermost report item. For a left-to-right report layout, drag the right edge to be aligned with the outermost report item. For more information, see [Rendering Behaviors](./report-design/render-behaviors-report-builder-service.md).
  
### White space isn't preserved at the end of a report  

Reporting Services provides an option that lets you control whether to preserve or eliminate white space at the end of a report.   
  
To preserve white space at the end of a report, select the report and in the Properties pane, scroll to ConsumeContainerWhitespace, and type False.   
  
## Why do my reports look different when exported to different formats?

After you run a report, you can export it to another format such as Excel, Word, or PDF. Depending on the format to which you export the report, certain rules and limitations might apply. You can address many limitations by considering them when you create the report. You might need to use a slightly different layout in your report, carefully align items within the report, confine report footers to a single line of text, and so forth. You can also use the RenderFormat built-in global to conditionally use a different report layout for different renderers. Other built-in globals can help you manage pagination in the exported format and name worksheet tabs in Excel. For more information, see [Export Reports](./report-builder/export-reports-report-builder.md) and [Use Built-in Globals an Users Reference](./expressions/built-in-collections-built-in-globals-and-users-references-report-builder.md).  
  
## How can I view all my report data on one page?  

For an interactive viewing experience for reports that don't have excessive amounts of data, you might want to see all the data on one page.   
  
For soft page-break renderers, to view all the data on one page, in Report properties, set InteractiveHeight to 0. In soft page-break renderers, existing page breaks are then ignored.  

> [!NOTE]  
> When a report has no page breaks, the entire report must be processed before you can view the first page.   
  
For more information about categories of renderers, see [Rendering Behaviors](./report-design/render-behaviors-report-builder-service.md).

## Why do I get a "Your session has expired" message?

When you're viewing paginated reports in the Power BI service, sessions may time out, presenting you with a "Your session has expired" notification.

The session times out after 10 minutes of inactivity, or earlier when the device is locked or inactive.

## Why do I get an "Error communicating with Analysis Service" message?

Paginated reports time out after 600 seconds when using a Power BI DirectQuery dataset as a source. After 600 seconds, you receive this error: 
          
"There was an error communicating with Analysis Services. Please verify that the data source is available and your credentials are correct. The connection either timed out or was lost." 
          
For paginated reports running longer than 10 minutes, we recommend using  the XMLA endpoint to connect to the Power BI semantic model.

  

## Related content

- [Troubleshoot Design Issues With Paginated Reports](./troubleshoot-paginated-reports-design-issues.md)
- [Data retrieval guidance for paginated reports](../guidance/report-paginated-data-retrieval.md)
- [Paginated reports capacity planning](./paginated-capacity-planning.md)
- [Troubleshoot subreports in Power BI paginated reports](./subreports-troubleshoot.md)
- [Paginated reports in Power BI: FAQ](./paginated-reports-faq.yml)
