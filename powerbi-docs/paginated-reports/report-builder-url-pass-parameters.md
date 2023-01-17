---
title: "Pass a report parameter in a URL for a paginated report in Power BI"
description: Learn how to pass report parameters to a report by including them in a paginated report URL.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.reviewer: "nisrinivasan"
ms.custom: ""
ms.date: 01/06/2023

---

# Pass a report parameter in a URL for a paginated report in Power BI

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-service](../includes/yes-service.md)] [!INCLUDE [yes-mobile](../includes/yes-mobile.md)] [!INCLUDE [yes-paginated](../includes/yes-paginated.md)] [!INCLUDE [yes-premium](../includes/yes-premium.md)] [!INCLUDE [no-desktop](../includes/no-desktop.md)] 

You can pass report parameters to a report by including them in a paginated report URL. All query parameters can have corresponding report parameters. Therefore, you pass a query parameter to a report by passing the corresponding report parameter. You need to prefix the parameter name with `rp:` for Power BI to recognize it in the URL. 

Report parameters are case-sensitive and use these special characters: 

- A space in the parameter portion of the URL is replaced with a plus sign (+).  For example: 

    `rp:Holiday=Christmas+Day`

- A semicolon in any portion of the string is replaced with the characters `%3A`.

Browsers should automatically perform the proper URL encoding. You don't have to encode any of the characters manually. 

## Prerequisites 

- To publish a Power BI paginated report to the Power BI service, you need a [Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md) or [Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml) license.
- You can publish to My Workspace. For any other workspace, you need at least a [contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles).

## Parameter examples

To set a report parameter within a URL, use the following syntax: 

- `rp:parameter=value`

For example, the following URL specifies two parameters, *Salesperson* and *State*, defined in a report in My Workspace:

```
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:Salesperson=Tie+Bear&rp:State=Utah 
```

The following URL specifies the same two parameters defined in a report in an app:

```
https://app.powerbi.com/groups/me/apps/xxxxxxx-c4c4-4217-afd9-3920a0d1e2b0/rdlreports/b1d5e659-639e-41d0-b733-05d2bca9853c?rp:Salesperson=Tiggee&rp:State=Utah 
```

To pass a null value for a parameter, use the following syntax: 

- `parameter:isnull=true`

For example:

```
rp:SalesOrderNumber:isnull=true
```

To pass a *Boolean* value, use 0 for false and 1 for true. To pass a *Float* value, include the decimal separator of the server locale.

## Additional examples 

The following URL example includes a multi-value parameter *Salesperson*. The format for a multi-value parameter is to repeat the parameter name for each value. 

```
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:Salesperson=Tie+Bear&rp:Salesperson=Mickey 
```

The following URL example passes a single parameter of *SellStartDate* with a value of "7/1/2005", for a native mode report server.

```
https://app.powerbi.com/groups/me/rdlreports/xxxxxxx-abc7-40f0-b456-febzf9cdda4d?rp:SellStartDate=7/1/2005
```

## Considerations and limitations

- If your report contains a report parameter that has a default value, and the value of the *Prompt* property is **false** (that is, the *Prompt User* property isn't selected in Report Manager), then you can't pass a value for that report parameter within a URL. This provides administrators with the option of preventing end users from adding or modifying the values of certain report parameters.
- Power BI doesn't support a query string of more than 2,000 characters. You may inadvertently exceed this value if you use URL parameters to view your paginated report, especially if your query string contains multiple parameter values. To properly load the report, reduce the number of characters to under 2,000.
- The limit in the query string is evaluated after you sign in to Power BI. If you open the report before signing in, the limit is reduced.

## Next steps

- [URL parameters in paginated reports in Power BI](report-builder-url-parameters.md)
- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
