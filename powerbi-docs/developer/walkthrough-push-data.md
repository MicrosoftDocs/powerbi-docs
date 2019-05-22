---
title: Push data into a dataset
description: Push data into a Power BI dataset
author: rkarlin
ms.author: rkarlin
manager: kfile
ms.reviewer: madia
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 05/22/2019
---

# Push data into a Power BI dataset

With the Power BI API, you can push data into a Power BI dataset. For example, you want to extend an existing business workflow to push key data into your dataset. In this case, you want to push a Sales Marketing dataset, which has a Product table, into a dataset.

Before you get started pushing data into a dataset, you need an Azure Active Directory (Azure AD) and a [Power BI account](create-an-azure-active-directory-tenant.md).

## Steps to push data into a dataset

* Step 1: [Register an app with Azure AD](walkthrough-push-data-register-app-with-azure-ad.md)
* Step 2: [Get an authentication access token](walkthrough-push-data-get-token.md)
* Step 3: [Create a dataset in Power BI](walkthrough-push-data-create-dataset.md)
* Step 4: [Get a dataset to add rows into a Power BI table](walkthrough-push-data-get-datasets.md)
* Step 5: [Add rows to a Power BI table](walkthrough-push-data-add-rows.md)

The next section is a general discussion of Power BI API operations that push data.

## Power BI API operations to push data

With the Power BI REST API, you can push data sources to Power BI. When an app adds rows to a dataset, tiles on the dashboard are updated automatically with the updated data. To push data, use the [PostDataset](https://docs.microsoft.com/rest/api/power-bi/pushdatasets/datasets_postdataset) and [PostRows](https://docs.microsoft.com/rest/api/power-bi/pushdatasets/datasets_postrows) operations. To find a dataset, use the [Get Datasets](https://docs.microsoft.com/rest/api/power-bi/datasets/getdatasets) operation. You can pass a group ID to work with a group for any of these operations. To get a group ID list, use the [Get Groups](https://docs.microsoft.com/rest/api/power-bi/groups/getgroups) operation.

Here are the operations to push data into a dataset:

* [PostDataset](https://docs.microsoft.com/rest/api/power-bi/pushdatasets/datasets_postdataset)
* [Get Datasets](https://docs.microsoft.com/rest/api/power-bi/datasets/getdatasets)
* [Post Rows](https://docs.microsoft.com/rest/api/power-bi/pushdatasets/datasets_postrows)
* [Get Groups](https://docs.microsoft.com/rest/api/power-bi/groups/getgroups)

You create a dataset in Power BI by passing a JavaScript Object Notation (JSON) string to the Power BI service. To learn more about JSON, see [Introducing JSON](http://json.org/).

The JSON string for a dataset has the following format:

**Power BI Dataset JSON object**

    {"name": "dataset_name", "tables":
        [{"name": "", "columns":
            [{ "name": "column_name1", "dataType": "data_type"},
             { "name": "column_name2", "dataType": "data_type"},
             { ... }
            ]
          }
        ]
    }

For our Sales Marketing dataset example, you would pass a JSON string as shown below. In this example, **SalesMarketing** is the dataset name, and **Product** is the table name. After defining the table, you define the table schema. For the **SalesMarketing** dataset, the table schema has these columns: ProductID, Manufacturer, Category, Segment, Product, and IsCompete.

**Example dataset object JSON**

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

For a Power BI table schema, you can use the following data types.

## Power BI table data types

| **Data type** | **Restrictions** |
| --- | --- |
| Int64 |Int64.MaxValue and Int64.MinValue not allowed. |
| Double |Double.MaxValue and Double.MinValue values not allowed. NaN not supported.+Infinity and -Infinity not supported in some functions (for example, Min, Max). |
| Boolean |None |
| Datetime |During data loading, we quantize values with day fractions to whole multiples of 1/300 seconds (3.33 ms). |
| String |Currently allows up to 128K characters. |

## Learn more about pushing data into Power BI

To get started pushing data into a dataset, see [Step 1: Register an app with Azure AD](walkthrough-push-data-register-app-with-azure-ad.md) in the left navigation pane.

[Next Step >](walkthrough-push-data-register-app-with-azure-ad.md)

## Next steps

[Sign up for Power BI](create-an-azure-active-directory-tenant.md)  
[Introducing JSON](http://json.org/)  
[Overview of Power BI REST API](overview-of-power-bi-rest-api.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)