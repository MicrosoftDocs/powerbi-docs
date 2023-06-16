---
title: "Add an assembly reference to a paginated report"
description: Learn how to provide an assembly reference to a report so that the report processor can resolve names in Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
ms.reviewer: rpatkar
---
# Add an assembly reference to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  When you embed custom code that contains references to Microsoft .NET Framework classes that are not in <xref:System.Math> or <xref:System.Convert>, you must provide an assembly reference to the report so that the report processor can resolve the names. For more information, see [Add Code to a Report &#40;Power BI Report Builder&#41;](./add-code-to-a-report.md).
  
### To add an assembly reference to a report  
  
1.  In **Design** view, right-click the design surface outside the border of the report and click **Report Properties**.  
  
2.  Click **References**.  
  
3.  In **Add or remove assemblies**, click **Add** and then click the ellipsis button to browse to the assembly.  
  
4.  In **Add or remove classes**, click **Add** and then type name of the class and provide an instance name to use within the report.  
  
    > [!NOTE]  
    >  Specify a class and instance name only for instance-based members. Do not specify static members in the **Classes** list. For more information, see [Custom Code and Assembly References in Expressions &#40;Power BI Report Builder&#41;](./custom-code-and-assembly-references-in-expressions.md).
  
5.  Select **OK**.
  
## Next steps
 [Expression Uses in Reports &#40;Power BI Report Builder&#41;](./expression-uses-reports-report-builder.md)   
 [Expression Examples &#40;Power BI Report Builder&#41;](./report-builder-expression-examples.md)   
 [Data Types in Expressions &#40;Power BI Report Builder&#41;](./data-types-expressions-report-builder.md)   
 [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
  
