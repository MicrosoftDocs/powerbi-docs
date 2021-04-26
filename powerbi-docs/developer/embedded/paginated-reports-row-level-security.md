---
title: Use row-level security with Power BI embedded analytics content
description: Learn about the steps you need to take to embed Power BI content within your Power BI embedded analytics application.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: nishalit
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 11/04/2019 
---

# Implementing row-level security in embedded paginated reports

When you embed a paginated report, you can control which data is displayed. This allows tailoring the displayed information per user. For example, if you have a Power BI paginated report that includes global sale results, you can embed it so that only the sale results from a certain region are available.

This feature provides a secure way of displaying a subset of the data, in a way that doesn't compromise the rest of data. It resembles the [Row Level Security (RLS)](embedded-row-level-security.md) feature, which provides a secure way of displaying data in Power BI reports (that are not paginated), dashboards, tiles, and datasets.  

> [!NOTE]
> This feature works with embedding paginated reports for customers.

## Configuring a parameter to filter the dataset

When applying row-level security to a Power BI paginated report, you need to assign a [parameter](../../paginated-reports/report-builder-parameters.md) to the **UserID** attribute. This parameter will restrict the data pulled from the dataset, before the report is embedded.

After assigning the parameter to **UserID**, use the [Reports GenerateTokenInGroup](/rest/api/power-bi/embedtoken/reports_generatetokeningroup) API to get the embed token.

## Use UserID as a filter at report or query level

You can use **UserId** as a *filter* or in a *query* to the datasource in [Power BI Report Builder](../../paginated-reports/report-builder-power-bi.md).

### Using the filter

1. In the **Dataset Properties** window, from the left pane, select **Filter**.

    ![Power BI Report Builder filter](media/paginated-reports-row-level-security/filter.png)

2. From the **Expression** dropdown menu, select the parameter you want to use for filtering the data.

     ![Screenshot shows the value Color selected from the Expression menu.](media/paginated-reports-row-level-security/expression.png)

3. Click the **Value** function button. 

    ![Power BI Report Builder value](media/paginated-reports-row-level-security/function.png)

4. In the **Expression** window, from the **Category** list, select **Built-in Fields**.

    ![Screenshot shows the Expression window with Built-in Fields selected as Category and ExecutionTime selected as Item.](media/paginated-reports-row-level-security/built-in-fields.png)

5. From the **Item** list, select **UserID** and click **OK**.

    ![Power BI Report Builder UserID](media/paginated-reports-row-level-security/userid.png)

6. In the **Dataset Properties** window, verify that the expression is *your selected parameter = UserID*, and click **OK**.

    ![Power BI Report Builder dataset properties](media/paginated-reports-row-level-security/verify.png)

### Using a query

1. In the **Dataset Properties** window, from the left pane, select **Parameters** and click **Add**.

    ![Power BI Report Builder parameters](media/paginated-reports-row-level-security/parameters.png)

2. In the **Parameter Name** enter **\@UserID**, and in the **Parameter Value** add **[&UserID]**.

    ![Power BI Report Builder parameter name](media/paginated-reports-row-level-security/parameter-name.png) 

3. From the left pane, select  **Query**, in the Query add the **UserID** parameter as part of your query, and click **OK**.
    > [!NOTE]
    > In the screenshot below the color parameter is used as an example (whereFinalTable.Color = @UserID). If needed, it is possible to create a more complex query.

    ![Power BI Report Builder queries edit](media/paginated-reports-row-level-security/query-edit.png)

## Passing the configured parameter using the embed token

When embedding a paginated report for your customers, the [Reports GenerateTokenInGroup](/rest/api/power-bi/embedtoken/reports_generatetokeningroup) API is used to get the embed token. This token can also be used to filter some of the data that is pulled out of the paginated report.

To expose only some of the data, assign the `username` field with the information you want to be displayed. For example, in a paginated report that has a color parameter, if you enter *green* in the `username` field, the embed token will restrict the embedded data to display only the data that has the *green* value in the color column.

```JSON
{
    "accessLevel": "View",
    "reportId": "cfafbeb1-8037-4d0c-896e-a46fb27ff229",
    "identities": [
            {
                    // Replace the 'username' with a paginated report parameter
                    "username":     "...",
                    "reports: [
                        "cfafbeb1-8037-4d0c-896e-a46fb27ff229"
                    ]
            }
    ]
}
```