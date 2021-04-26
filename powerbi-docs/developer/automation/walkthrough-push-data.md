---
title: Push data into a dataset
description: Push data into a Power BI dataset.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 05/22/2019
---

# Push data into a Power BI dataset

The Power BI API lets you push data into a Power BI dataset. In this article, we show you how to push a Sales Marketing dataset containing a Product table into an existing dataset.

Before getting started, you need an Azure Active Directory (Azure AD) and a [Power BI account](../embedded/create-an-azure-active-directory-tenant.md).

## Steps to push data into a dataset

* Step 1: [Register an app with Azure AD](../embedded/register-app.md)
* Step 2: [Get an authentication access token](walkthrough-push-data-get-token.md)
* Step 3: [Create a dataset in Power BI](walkthrough-push-data-create-dataset.md)
* Step 4: [Get a dataset to add rows into a Power BI table](walkthrough-push-data-get-datasets.md)
* Step 5: [Add rows to a Power BI table](walkthrough-push-data-add-rows.md)

The next section is a general discussion of Power BI API operations that push data.

## Power BI API operations to push data

With the Power BI REST API, you can push data sources to Power BI. When an app adds rows to a dataset, dashboard tiles update automatically with the new data. To push data, use the [PostDataset](/rest/api/power-bi/pushdatasets/datasets_postdataset) and [PostRows](/rest/api/power-bi/pushdatasets/datasets_postrows) operations. To find a dataset, use the [Get Datasets](/rest/api/power-bi/datasets/getdatasets) operation. You can pass a group ID to work with a group for any of these operations. To get a group ID list, use the [Get Groups](/rest/api/power-bi/groups/getgroups) operation.

Here are the operations to push data into a dataset:

* [PostDataset](/rest/api/power-bi/pushdatasets/datasets_postdataset)
* [Get Datasets](/rest/api/power-bi/datasets/getdatasets)
* [Post Rows](/rest/api/power-bi/pushdatasets/datasets_postrows)
* [Get Groups](/rest/api/power-bi/groups/getgroups)

You create a dataset in Power BI by passing a JavaScript Object Notation (JSON) string to the Power BI service. To learn more about JSON, see [Introducing JSON](https://json.org/).

The JSON string for a dataset has the following format:

**Power BI Dataset JSON object**

```json
{"name": "dataset_name", "tables":
    [{"name": "", "columns":
        [{ "name": "column_name1", "dataType": "data_type"},
         { "name": "column_name2", "dataType": "data_type"},
         { ... }
        ]
      }
    ]
}
```

For our Sales Marketing dataset example, you would pass a JSON string as shown below. In this example, **SalesMarketing** is the dataset name, and **Product** is the table name. After defining the table, you define the table schema. For the **SalesMarketing** dataset, the table schema has these columns: ProductID, Manufacturer, Category, Segment, Product, and IsCompete.

**Example dataset object JSON**

```json
{
    "name": "SalesMarketing",
    "tables": [
        {
            "name": "Product",
            "columns": [
            {
                "name": "ProductID",
                "dataType": "int"
            },
            {
                "name": "Manufacturer",
                "dataType": "string"
            },
            {
                "name": "Category",
                "dataType": "string"
            },
            {
                "name": "Segment",
                "dataType": "string"
            },
            {
                "name": "Product",
                "dataType": "string"
            },
            {
                "name": "IsCompete",
                "dataType": "bool"
            }
            ]
        }
    ]
}
```

For a Power BI table schema, you can use the following data types.

## Power BI table data types

| **Data type** | **Restrictions** |
| --- | --- |
| Int64 |Int64.MaxValue and Int64.MinValue not allowed. |
| Double |Double.MaxValue and Double.MinValue values not allowed. NaN not supported.+Infinity and -Infinity not supported in some functions (for example, Min, Max). |
| Boolean |None |
| Datetime |During data loading, we quantize values with day fractions to whole multiples of 1/300 seconds (3.33 ms). |
| String |Currently allows up to 128 K characters. |

## Learn more about pushing data into Power BI

To get started pushing data into a dataset, see [Step 1: Register an app with Azure AD](../embedded/register-app.md) in the nav pane.

## Next steps

* [Sign up for Power BI](../embedded/create-an-azure-active-directory-tenant.md)  
* [Introducing JSON](https://json.org/)  
* [Overview of Power BI REST API](overview-of-power-bi-rest-api.md)  

More questions? [Try the Power BI Community](https://community.powerbi.com/)