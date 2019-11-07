---
title: "Pass a report parameter in a URL for a paginated report - Power BI Report Builder"
description: This topic describes how to pass report parameters to a report by including them in a paginated report URL.
ms.service: powerbi
ms.subservice: report-builder
ms.custom:
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: "cfinlan"
ms.custom: ""
ms.date: 08/29/2019
---

# Pass a report parameter in a URL for a paginated report in Power BI 

You can pass report parameters to a report by including them in a paginated report URL. All query parameters can have corresponding report parameters. Therefore, you pass a query parameter to a report by passing the corresponding report parameter. You need to prefix the parameter name with `rp:` for Power BI to recognize it in the URL. 

Report parameters are case-sensitive and use these special characters: 

- A space in the parameter portion of the URL is replaced with a plus sign (+).  For example: 

    ```rp:Holiday=Christmas+Day```

- A semicolon in any portion of the string is replaced with the characters `%3A`.

Browsers should automatically perform the proper URL encoding. You don't have to encode any of the characters manually. 

To set a report parameter within a URL, use the following syntax: 

```
rp:parameter=value
```

For example, to specify two parameters, "Salesperson" and "State", defined in a report in your My Workspace,you'd use the following URL: 

```
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:Salesperson=Tie+Bear&rp:State=Utah 
```

To specify the same two parameters defined in a report in an app, you'd use the following URL: 

```
https://app.powerbi.com/groups/me/apps/xxxxxxx-c4c4-4217-afd9-3920a0d1e2b0/rdlreports/b1d5e659-639e-41d0-b733-05d2bca9853c?rp:Salesperson=Tiggee&State=Utah 
```

To pass a null value for a parameter, use the following syntax: 

```
parameter:isnull=true
```

For example:

```
rp:SalesOrderNumber:isnull=true
```

To pass a Boolean value, use 0 for false and 1 for true. To pass a Float value, include the decimal separator of the server locale.

> [!NOTE]
> If your report contains a report parameter that has a default value, and the value of the **Prompt** property is **false** (that is, the **Prompt User** property isn't selected in Report Manager), then you can't pass a value for that report parameter within a URL. This provides administrators the option of preventing end users from adding or modifying the values of certain report parameters.

## Additional examples 

The following URL example includes a multi-value parameter "Salesperson”. The format for a multi-value parameter is to repeat the parameter name for each value. 

```
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:Salesperson=Tie+Bear&rp:Salesperson=Mickey 
```

The following URL example passes a single parameter of SellStartDate with a value of "7/1/2005", for a native mode report server.

```
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:SellStartDate=7/1/2005
```

## Next steps

- [URL parameters in paginated reports in Power BI](report-builder-url-parameters.md)
- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)
