---
title: "Dataset fields collection (Power BI Report Builder)"
description: Learn about dataset field collection. Dataset fields represent the data from a data connection. A field can represent either numeric or non-numeric data.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---
# Dataset fields collection (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Dataset fields represent the data from a data connection. A field can represent either numeric or non-numeric data. Examples include sales amounts, total sales, customer names, database identifiers, URLs, images, spatial data, and e-mail addresses. On the design surface, fields appear as expressions in report items such as text boxes, tables, and charts.  
  
 A report has three types of fields and displays them in the Report Data pane: dataset fields, dataset calculated fields, and built-in fields.  
  
- **Dataset fields.** The metadata that represents the collection of fields that will be returned when the dataset query runs on the data source.  
  
- **Dataset calculated fields.** Additional fields that you create for the dataset. Each calculated field is created by evaluating an expression that you define.  
  
- **Built-in fields.** The metadata that represents a collection of fields provided by Report Builder that provide report information such as the report name or the time when the report was processed. For more information, see [Built-in Globals and Users References &#40;Power BI Report Builder&#41;](../expressions/built-in-collections-built-in-globals-and-users-references-report-builder.md).

  
##  <a name="Fields"></a> Dataset fields and queries

 Dataset fields are specified by the dataset query command and by any calculated fields that you define. For embedded datasets, the field collection is the list of fields that is returned from running the current query against the data source.  
  
  
### Calculated fields

 You specify a calculated field manually by creating an expression. Calculated fields can be used to create new values that do not exist on the data source. For example, a calculated field can represent a new value, a custom sort order for a set of field values, or an existing field that is converted to a different data type.  
  
 Calculated fields are local to a report.


### Using extended field properties

 Data sources that support multidimensional queries, such as SQL Server Analysis Services, support field properties on fields. Field properties appear in the result set for a query, but are not visible in the **Report Data** pane. They are still available to use in your report. To refer to a property for a field, drag the field onto the report, and change the default property **Value** to the field name of the property you want. For example, in an Analysis Services cube, you can define formats for values in the cube cells. The formatted value is available by using the field property **FormattedValue**. To use the value directly instead of using a value and setting the format property of the text box, drag the field to the text box and change the default expression `=Fields!FieldName.Value` to `=Fields!FieldName.FormattedValue`.  
  
> [!NOTE]
> Not all **Field** properties can be used for all data sources. The **Value** and **IsMissing** properties are defined for all data sources. Other predefined properties (such as **Key**, **UniqueName**, and **ParentUniqueName** for multidimensional data sources) are supported only if the data source provides those properties. Custom properties are supported by some data providers. 
  
  
##  <a name="Defaults"></a> Understand default expressions for fields

 A text box can be a text box report item in the report body, or a text box in a cell in a tablix data region. When you link a field with a text box, the location of the text box determines the default expression for the field reference. In the report body, a text box value expression must specify an aggregate and a dataset. If only one dataset exists in the report, this default expression is created for you. For a field that represents a numeric value, the default aggregate function is Sum. For a field that represents a non-numeric value, the default aggregate is First.  
  
 In a tablix data region, the default field expression depends on the row and group memberships of the text box that you add the field to. The field expression for the field Sales, when added to a text box in the detail row of a table, is `[Sales]`. If you add the same field to a text box in a group header, the default expression is `(Sum[Sales])`, because the group header displays summary values for the group, not detail values. When the report runs, the report processor evaluates each expression and substitutes the result in the report.  
  
 For more information about expressions, see [Expressions &#40;Power BI Report Builder&#41;](../expressions/expression-uses-reports-report-builder.md).
  
  
##  <a name="DataTypes"></a> Field data types  
 When you create a dataset, the data types of the fields on the data source may not be exactly the data types used in a report. Data types may go through one or two mapping layers. The data processing extension or data provider may map data types from the data source to common language runtime (CLR) data types. The data types returned by data processing extensions are mapped to a subset of common language runtime (CLR) data types from the .NET Framework.  
  
 On the data source, the data is stored in data types supported by the data source. For example, data in a SQL Server database must be one of the supported SQL Server data types such as **nvarchar** or **datetime**. When you retrieve data from the data source, the data passes through a data processing extension or data provider that is associated with the data source type. Depending on the data processing extension, data may be converted from the data types used by data source into data types supported by the data processing extension. Reporting Services uses data types supported by the common language runtime (CLR). The data provider maps each column in the result set from the native data type to a .NET Framework common language runtime (CLR) data type.  
  
 At each stage, the data is represented by the data types as described in the following list:  
  
- **Data source** The data types supported by the version of the type of data source to which you are connecting.  
  
     For example, typical data types for a SQL Server data source include **int**, **datetime**, and **varchar**.  
  
- **Data provider or data processing extension** The data types supported by the version of the data provider of the data processing extension you select when you connect to the data source. Data providers based on the .NET Framework use data types supported by the CLR.
  
     For example, typical data types supported by the .NET Framework include **Int32** and **String**. Calendar dates and times are supported by the **DateTime** structure.
  
- **Report processor** The data types are based on the version of the CLR installed when you installed Power BI Report Builder.  

 For more information about including references to a dataset field from an expression, see [Data Types in Expressions &#40;Power BI Report Builder&#41;](../expressions/data-types-expressions-report-builder.md).
  
  
##  <a name="MissingFields"></a> Detect missing fields at run time  
 When the report is processed, the result set for a dataset may not contain values for all of the columns specified because the columns no longer exist on the data source. You can use the field property IsMissing to detect whether values for a field were returned at run-time. For more information, see [Dataset Fields Collection References &#40;Power BI Report Builder&#41;](../expressions/built-in-collections-dataset-fields-collection-references-report-builder.md).
  
## Related content

- [Report Embedded Datasets and Shared Datasets &#40;Power BI Report Builder&#41;](../report-data/report-embedded-datasets-report-builder.md)
- [Supported data sources for Power BI paginated reports](../paginated-reports-data-sources.md)
- [On-premises data gateway in-depth](../../connect-data/service-gateway-onprem-indepth.md)
- [Add or remove a gateway data source](../../connect-data/service-gateway-data-sources.md)

