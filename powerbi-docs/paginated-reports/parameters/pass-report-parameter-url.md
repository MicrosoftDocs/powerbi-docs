---
title: "Pass a report parameter within a URL for a Power BI paginated report | Microsoft Docs"
description: Learn how to pass report parameters directly to the report processing engine by including them in a report URL for a Power BI paginated report.
ms.date: 01/25/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
---
# Pass a report parameter within a URL for a Power BI paginated report

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can pass report parameters to a report by including them in a report URL for Paginated Reports. These URL parameters are not prefixed because they are passed directly to the report processing engine.  

All query parameters can have corresponding report parameters. You pass a query parameter to a report by passing the corresponding report parameter. For more information, see [Build a Query in the Relational Query Designer &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/build-a-query-in-the-relational-query-designer-report-builder-and-ssrs).

## Paginated report parameter rules

Report parameters are case-sensitive and utilize the following special characters:  
 
- Any space characters in the URL string are replaced with the characters "%20," according to URL encoding standards.  
- A space character in the parameter portion of the URL is replaced with a plus character (+).  
- A semicolon in any portion of the string is replaced with the characters "%3A."  
- Browsers should automatically perform the proper URL encoding. You do not have to encode any of the characters manually. 
- If you don't include the proxy syntax, then prefix the parameter with *rp:*.  

## Paginated report parameter examples

To set a report parameter within a URL, use the following syntax:  
  
```  
  
rp:parameter=value  
```  
  
 For example, to specify two parameters, "Salesperson" and "State", defined in a report in My Workspace, you'd use the following URL:  
  
```  
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:Salesperson=Tie+Bear&rp:State=Utah 
```  
  
To specify the same two parameters defined in a report in an app, you'd use the following URL:  
  
```  
https://app.powerbi.com/groups/me/apps/xxxxxxx-c4c4-4217-afd9-3920a0d1e2b0/rdlreports/xxxxxxx-639e-41d0-b733-05d2bca9853c?rp:Salesperson=Tiggee&rp:State=Utah 
```  
  
 To pass a null value for a parameter, use the following syntax: 
  
```  
  
parameter:isnull=true  
  
```  
  
 For example,  
  
```  
rp:SalesOrderNumber:isnull=true 
```  
  
 To pass a **Boolean** value, use 0 for false and 1 for true. To pass a **Float** value, include the decimal separator of the server locale.
  
> [!NOTE]  
>  If your report contains a report parameter that has a default value and the value of the **Prompt** property is **false** (that is, the Prompt User property is not selected in Report Manager), then you cannot pass a value for that report parameter within a URL. This provides administrators an option for preventing end users from adding or modifying the values of certain report parameters.  
  
###  <a name="bkmk_examples"></a> Additional examples  
The following URL example includes a multi-value parameter "Salesperson”. The format for a multi-value parameter is to repeat the parameter name for each value.

  
```  
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:Salesperson=Tie+Bear&rp:Salesperson=Mickey
```  
  
The following URL example passes a single parameter of SellStartDate with a value of "7/1/2005".  
  
```  
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:SellStartDate=7/1/2005
```  
  
## Considerations and limitations
  
- If your report contains a report parameter that has a default value, and the value of the Prompt property is false (that is, the Prompt User property isn't selected in Power BI Report Builder), then you can't pass a value for that report parameter within a URL. This provides administrators the option of preventing end users from adding or modifying the values of certain report parameters.
- Power BI doesn't support a query string of more than 2,000 characters. You may inadvertently exceed this value if you use URL parameters to view your paginated report, especially if your query string contains multiple parameter values. To properly load the report, reduce the number of characters to under 2,000.
- The limit in the query string is evaluated after you're signed in to Power BI. If you open the report before signing in, the limit is reduced.
- The supported date formats for passing report parameters within a URL are ISO (YYYY-MM-DD) and en-US (MM/DD/YYYY).
  
## Related content

- [URL parameters in paginated reports in Power BI](../report-builder-url-parameters.md)
- [What are paginated reports in Power BI?](../paginated-reports-report-builder-power-bi.md)
