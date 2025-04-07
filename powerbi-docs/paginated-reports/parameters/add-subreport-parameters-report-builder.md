---
title: "Add a subreport and parameters to a Power BI paginated report | Microsoft Docs"
description: Learn how to add a subreport to a paginated report. Use subreports when you want to create a main report as a container for multiple related reports in Power BI Report Builder.
ms.date: 01/23/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add a subreport and parameters to a Power BI paginated report (Power BI Report Builder)
 
[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

 Add subreports to a Power BI paginated report when you want to create a main report that is a container for multiple related reports. A subreport is a reference to another report. To relate the reports through data values (for example, to have multiple reports show data for the same customer), you must design a parameterized report (for example, a report that shows the details for a specific customer) as the subreport. When you add a subreport to the main report, you can specify parameters to pass to the subreport.  
  
 You can also add subreports to dynamic rows or columns in a table or matrix. When the main report is processed, the subreport is processed for each row. In this case, consider whether you can achieve the desired effect by using data regions or nested data regions.  
  
 To add a subreport to a report, you must first create the report that will act as the subreport. For more information on creating the subreport, see [Subreports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/subreports-report-builder-and-ssrs).  
    
## Add a subreport  
  
1.  On the **Insert** tab, click **Subreport**.  
  
2.  On the design surface, click a location on the report and then drag a box to the desired size of the subreport. Alternatively, click the design surface to create a subreport of default size.  
  
3.  Right-click the subreport, and then click **Subreport Properties**.  
  
4.  In the **Subreport Properties** dialog box, type a name in the **Name** text box or accept the default. The name must be unique within the report. By default, a general name such as Subreport1 or Subreport2 is assigned.  
  
5.  In the **Use this report as a subreport** box, click **Browse**, or type the name of the report. Clicking **Browse** is preferred because the path to the subreport will be specified automatically. You can specify the report in the several ways. For more information, see [Specifying Paths to External Items &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/specifying-paths-to-external-items-report-builder-and-ssrs).  
  
6.  (Optional) Click **Yes** for **Omit border on page break** to prevent a border from being rendered in the middle of the subreport if the subreport spans more than one page.  
  
7.  Select **OK**.
  
## Specify parameters to pass to a subreport  
  
1.  In Design view, right-click the subreport and then click **Subreport Properties**.  
  
2.  In the **Subreport Properties** dialog box, click **Parameters**.  
  
3.  Click **Add**. A new row is added to the parameter grid.  
  
4.  In the **Name** text box, type the name of a parameter in the subreport or choose it from the list box. This name must match a report parameter, not a query parameter, in the subreport.  
  
5.  In the **Value** list box, type or select a value to pass to the subreport. This value can be static text or an expression that references a field or other object in the main report.  
  
    > [!NOTE]  
    >  In Report Builder, if a parameter is missing from the **Parameters** list and the subreport has a default value defined, the subreport will be processed correctly.  
    >   
    >  In Report Designer, all parameters that are required by the subreport must be included in the **Parameters** list. If a required parameter is missing, the subreport is not displayed correctly in the main report.  
  
6.  Repeat steps 3-5 to specify a name and value for each subreport parameter.  
  
7.  To delete a subreport parameter, click the parameter in the parameter grid, and then click **Delete**.  
  
8.  To change the order of a subreport parameter, click the parameter, and then click the up button or the down button.  
  
     Changing the order of a subreport parameter does not affect the processing of the subreport.  
  
## Related content

- [Subreports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/subreports-report-builder-and-ssrs)   
- [Rendering Behaviors &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/rendering-behaviors-report-builder-and-ssrs)  
  
  
