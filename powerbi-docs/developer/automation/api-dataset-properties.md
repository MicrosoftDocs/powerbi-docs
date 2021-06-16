---
title: Power BI dataset properties
description: Learn about the properties of Power BI dataset APIs.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 06/08/2018
---

# Dataset properties

The current v1 of datasets API only allows for a dataset to be created with a name and a collection of tables. Each table can have a name and a collection of columns. Each column has a name and datatype. We are expanding these properties most notably with support for measures and relationships between tables. The complete list of supported properties for this release is as follows:

> [!IMPORTANT]
> It can be accessed at the [Datasets Operation Groups](/rest/api/power-bi/datasets) page.

## Dataset

Name  |Type  |Description  |Read Only  |Required
---------|---------|---------|---------|---------
id     |  Guid       | System wide unique identifier for the dataset.        | True        | False        
name     | String        | User defined name of the dataset.        | False        | True        
tables     | Table[]        | Collection of tables.        |  False       | False        
relationships     | Relationship[]        | Collection of relationships between tables.        | False        |  False  
defaultMode     | String        | Determines whether the dataset is pushed, streamed, or both, with values of "Push" and "Streaming."         | False        |  False

## Table

Name  |Type  |Description  |Read Only  |Required
---------|---------|---------|---------|---------
name     | String        |  User defined name of the table. It is also used as the identifier of the table.       | False        |  True       
columns     |  column[]       |  Collection of columns.       | False        |  True       
measures     | measure[]        |  Collection of measures.       | False        |  False       
isHidden     | Boolean        | If true, table will be hidden from client tools.        | False        | False        

## Column

Name  |Type  |Description  |Read Only  |Required
---------|---------|---------|---------|---------
name     |  String        | User defined name of the column.        |  False       | True       
dataType     |  String       |  Supported [EDM data types](/dotnet/framework/data/adonet/entity-data-model-primitive-data-types)  and restrictions. See [Data type restrictions](#data-type-restrictions).      |  False       | True        
formatString     | String        | A string describing how the value should be formatted when it is displayed. To learn more about string formatting, see [FORMAT_STRING Contents](/analysis-services/multidimensional-models/mdx/mdx-cell-properties-format-string-contents).      | False        | False        
sortByColumn    | String        |   String name of a column in the same table to be used to order the current column.     | False        | False       
dataCategory     | String        |  String value to be used for the data category which describes the data within this column. Some common values include: Address, City, Continent, Country, Image, ImageUrl, Latitude, Longitude, Organization, Place, PostalCode, StateOrProvince, WebUrl       |  False       | False        
isHidden    |  Boolean       |  Property indicating if the column is hidden from view. Default is false.       | False        | False        
summarizeBy     | String        |  Default aggregation method for the column. Values include: default, none, sum, min, max, count, average, distinctCount     |  False       | False

## Measure

Name  |Type  |Description  |Read Only  |Required
---------|---------|---------|---------|---------
name     | String        |  User defined name of the measure.       |  False       | True        
expression     | String        | A valid DAX expression.        | False        |  True       
formatString     | String        |  A string describing how the value should be formatted when it is displayed. To learn more about string formatting, see [FORMAT_STRING Contents](/analysis-services/multidimensional-models/mdx/mdx-cell-properties-format-string-contents).       | False        | False        
isHidden     | String        |  If true, table will be hidden from client tools.       |  False       | False       

## Relationship

Name  |Type  |Description  |Read Only  |Required 
---------|---------|---------|---------|---------
name     | String        | User defined name of the relationship. It is also used as the identifier of the relationship.        | False       | True        
crossFilteringBehavior     | String        |    The filter direction of the relationship: OneDirection (default), BothDirections, Automatic       | False        | False        
fromTable     | String        | Name of the foreign key table.        | False        | True         
fromColumn    | String        | Name of the foreign key column.        | False        | True         
toTable    | String        | Name of the primary key table.        | False        | True         
toColumn     | String        | Name of the primary key column.        | False        | True        

## Data type restrictions

These restrictions apply to dataType property.

Data type  |Restrictions  
---------|---------
Int64     |   Int64.MaxValue and Int64.MinValue not allowed.      
Double     |  Double.MaxValue and Double.MinValue values not allowed. NaN not supported.+Infinity and -Infinity not supported in some functions (e.g. Min, Max).       
Boolean     |   True or False.
Datetime    |   During data loading we quantize values with day fractions to whole multiples of 1/300 seconds (3.33ms).      
String     |  Currently allows up to 4000 characters per string value.
Decimal|precision=28, scale=4

## Example
The following code sample includes a number of these properties:

```json
{

  "name": "PushAdvanced",

  "tables": [

    {

      "name": "Date",

      "columns": [

        {

          "name": "Date",

          "dataType": "dateTime",

          "formatString": "dddd\\, mmmm d\\, yyyy",

          "summarizeBy": "none"

        }

      ]

    },

    {

      "name": "sales",

      "columns": [

        {

          "name": "Date",

          "dataType": "dateTime",

          "formatString": "dddd\\, mmmm d\\, yyyy",

          "summarizeBy": "none"

        },

        {

          "name": "Sales",

          "dataType": "int64",

          "formatString": "0",

          "summarizeBy": "sum"

        }

      ],

      "measures": [

        {

          "name": "percent to forecast",

          "expression": "SUM(sales[Sales])/SUM(forecast[forecast])",

          "formatString": "0.00 %;-0.00 %;0.00 %"

        }

      ]

    },

    {

      "name": "forecast",

      "columns": [

        {

          "name": "date",

          "dataType": "dateTime",

          "formatString": "m/d/yyyy",

          "summarizeBy": "none"

        },

        {

          "name": "forecast",

          "dataType": "int64",

          "formatString": "0",

          "summarizeBy": "sum"

        }

      ]

    }

  ],

  "relationships": [

    {

      "name": "2ea345ce-b147-436e-8ac2-9d3c4d82af8d",

      "fromTable": "sales",

      "fromColumn": "Date",

      "toTable": "Date",

      "toColumn": "Date",

      "crossFilteringBehavior": "bothDirections"

    },

    {

      "name": "5d95f419-e589-4345-9581-6e70670b1bba",

      "fromTable": "forecast",

      "fromColumn": "date",

      "toTable": "Date",

      "toColumn": "Date",

      "crossFilteringBehavior": "bothDirections"

    }

  ]

}
```