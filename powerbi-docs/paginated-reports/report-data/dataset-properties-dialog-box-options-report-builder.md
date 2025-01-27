---
title: "Dataset Properties, Options dialog box (Power BI Report Builder)"
description: Learn how to use the Dataset Properties dialog box to change data options, such as collation options and treating subtotals as detail data.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---
# Dataset Properties, Options dialog box (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Select **Options** on the **DatasetProperties** dialog box to change data options, such as collation options and treating subtotals as detail data, for the query. For more information about collations, see [Collation and Unicode Support](/sql/relational-databases/collations/collation-and-unicode-support).  
   
 Data options for an embedded dataset affect only the report in which they are defined.  
  
 For more information, see [Report Embedded Datasets (Power BI Report Builder)](./report-embedded-datasets-report-builder.md).
  
## Collation

 Select a locale that determines the collation sequence to be used for sorting data.

## Default

Indicates that the Power BI service should attempt to derive the value from the data provider when the report runs. If the value cannot be derived, the default value is derived from the locale setting of the node running the report.  
  
## Case sensitivity

 Select a value that determines case sensitivity. This option indicates whether the data is case-sensitive. You can set **Case Sensitivity** to **True**, **False**, or **Auto**. The default value, **Auto**, indicates that Power BI service should attempt to derive the value from the data provider when the report runs. If the data provider does not support the case-sensitivity type, the report runs as though the value were **False**. If you know the value and you know it is supported, choose **True**.  
  
## Accent sensitivity

 Select a value that determines accent sensitivity. **Accent Sensitivity** indicates whether the data is accent sensitive and can be set to **True**, **False**, or **Auto**. The default value, **Auto**, indicates that Power BI service should attempt to derive the value from the data provider when the report is run. If the data provider does not support the accent sensitivity type, the report runs as though the value were **False**. If you know the value and you know it is supported, choose **True**.  
  
## Kanatype sensitivity

 Select a value that determines kanatype sensitivity. This option indicates whether the data is kanatype sensitive; it can be set to **True**, **False**, or **Auto**. The default value, **Auto**, indicates that Power BI service should attempt to derive the value from the data provider when the report runs. If the data provider does not support the kanatype sensitivity type, the report runs as though the value were **False**. If you know the value and you know it is supported, choose **True**.  
  
## Width sensitivity

 Select a value that determines width sensitivity. This option indicates whether the data is width-sensitive and can be set to **True**, **False**, or **Auto**. The default value, **Auto**, indicates that Power BI service should attempt to derive the value from the data provider when the report runs. If the data provider does not support the width sensitivity type, the report runs as though the value were **False**. If you know the value and you know it is supported, choose **True**.  
  
## Interpret subtotals as detail rows

 Select a value that indicates whether you want subtotal rows to be interpreted as detail rows instead of aggregate rows. The default value, **Auto**, indicates that the subtotal rows should be treated as detail rows if the report does not use the **Aggregate**() function to access any fields in the data set. If you want subtotal rows to be interpreted as aggregate rows, choose **False**. If you want the subtotal rows to be interpreted as detail rows and you know that they do not use the **Aggregate**() function, choose **True**.  
  
## Related content

- [Filter, Group, and Sort Data (Power BI Report Builder)](../report-design/filter-group-sort-data-report-builder.md)
- [Report Embedded Datasets (Power BI Report Builder)](./report-embedded-datasets-report-builder.md)
