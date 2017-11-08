---
title: Combine binaries in Power BI Desktop
description: Easily combine binary data sources in Power BI Desktop
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: erikre
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/06/2017
ms.author: davidi

---
# Combine binaries in Power BI Desktop
One powerful approach to importing data into **Power BI Desktop** is to combine multiple files, which have the same schema, into a single logical table. With the November 2016 release of **Power BI Desktop** (and subsequent releases), this convenient and popular approach has been made more convenient and more expansive, as described in this article.

To start the process of combining binaries from the same folder, select **Get Data > File > Folder**.

![](media/desktop-combine-binaries/combine-binaries_1.png)

## Previous combine binaries behavior
Prior to the November 2016 release of **Power BI Desktop**, you could combine certain file types with the **combine binaries** transform, but there were limitations:

* Transformations were not considered for each individual file before the files were combined into a single table. As such, you often had to combine files, then filter out *header values* by filtering rows as part of the edit process.
* The **Combine binaries** transform only worked for *text* or *CSV* files, and didn't work on other supported file formats such as Excel workbooks, JSON files, and others.

Customers asked for more intuitive operation of the **combine binaries** operation, so the transform was enhanced.

## Current combine binaries behavior
**Power BI Desktop** now handles the **combine binaries** more effectively. You start by selecting **combine binaries**, either from the **Home** ribbon tab in **Query Editor**, or from the column itself.

![](media/desktop-combine-binaries/combine-binaries_2a.png)

The **combine binaries** transform now behaves as follows:

* The **combine binaries** transform analyzes each input file, and determines the correct file format to use, such as *text* or *Excel workbook* or *JSON* file.
* The transform allows you to select a specific object from the first file, for example, an *Excel workbook*, to extract.
  
  ![](media/desktop-combine-binaries/combine-binaries_3.png)
* The **combine binaries** then automatically does the following:
  
  * Creates an example query that performs all the required extraction steps in a single file.
  * Creates a *function query* that parameterizes the file/binary input to the *exemplar query*. The exemplar query and the function query are linked, so that changes to the exemplar query are reflected in the function query.
  * Applies the *function query* to the original query with input binaries (for example, the *Folder* query) so it applies the function query for binary inputs on each row, then expands the resulting data extraction as top-level columns.
    
    ![](media/desktop-combine-binaries/combine-binaries_4.png)

With the new behavior of **combine binaries**, you can easily combine all binaries within a given folder as long as they have the same file type and structure (as in, the same columns).

In addition, you can easily apply additional transformation or extraction steps by modifying the automatically created *exemplar query*, without having to worry about modifying or creating additional *function query* steps; any changes to the *exemplar query* are automatically generated in the linked *function query*.

## More Information
﻿There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [Getting Started with Power BI Desktop](powerbi-desktop-getting-started.md)
* [Data Sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](powerbi-desktop-shape-and-combine-data.md)
* [Connect to CSV files in Power BI Desktop](desktop-connect-csv.md)   
* [Enter data directly into Power BI Desktop](powerbi-desktop-enter-data-directly-into-desktop.md)   

