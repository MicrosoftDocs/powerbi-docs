---
title: DirectQuery and SAP Business Warehouse (BW) in Power BI
description: Learn about important considerations when using DirectQuery with SAP Business Warehouse in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/24/2023
LocalizationGroup: Connect to data
---
# Connect to SAP Business Warehouse by using DirectQuery in Power BI

You can connect to *SAP Business Warehouse* (SAP BW) data sources directly using *DirectQuery*. Given the OLAP/multidimensional nature of SAP BW, there are many important differences between DirectQuery over SAP BW versus relational sources like SQL Server. These differences are summarized as follows:

* In DirectQuery over relational sources, there's a set of queries, as defined in the **Get Data** or **Power Query Editor** dialog, that logically defines the data that is available in the field list. This configuration is *not* the case when connecting to an OLAP source such as SAP BW. Instead, when connecting to the SAP server using **Get Data**, just the InfoCube or BEx Query is selected. Then all the Key Figures and dimensions of the selected InfoCube/BEx Query are available in the field list.
* Similarly, there's no **Power Query Editor** when connecting to SAP BW. The data source settings, for example, server name, can be changed by selecting **Transform data** > **Data source settings**. The settings for any parameters can be changed by selecting **Transform data** > **Edit parameters**.
* Given the unique nature of OLAP sources, there are other restrictions for both modeling and visualizations that apply, in addition to the normal restrictions imposed for DirectQuery. These restrictions are described later in this article.

In addition, it's *extremely important* to understand that there are many features of SAP BW that aren't supported in Power BI, and that because of the nature of the public interface to SAP BW, there are important cases where the results seen through Power BI don't match the ones seen when using an SAP tool. These limitations are described later in this article. These limitations and behavior differences should be carefully reviewed to ensure that the results seen through Power BI, as returned by the SAP public interface, are interpreted correctly.  

> [!NOTE]
> The ability to use DirectQuery over SAP BW was in preview until the March 2018 update to Power BI Desktop. During the preview, feedback and suggested improvements prompted a change that impacts reports that were created using that preview version. Now that General Availability (GA) of DirectQuery over SAP BW has released, you *must* discard any existing (preview-based) reports using DirectQuery over SAP BW that were created with the pre-GA version.
>
> In reports created with the pre-GA version of DirectQuery over SAP BW, errors occur with those pre-GA reports upon invoking Refresh, as a result of attempting to refresh the metadata with any changes to the underlying SAP BW cube. Please re-create those reports from a blank report, using the GA version of DirectQuery over SAP BW.

## Additional modeling restrictions

The other primary modeling restrictions when connecting to SAP BW using DirectQuery in Power BI are:

* **No support for calculated columns:** The ability to create calculated columns is disabled. This fact also means that grouping and clustering, which create calculated columns, aren't available.
* **Additional limitations for measures:** There are other limitations imposed on the DAX expressions that can be used in measures to reflect the level of support offered by SAP BW.
* **No support for defining relationships:** The relationships are inherent in the external SAP source. Other relationships can't be defined in the model.
* **No Table View:** The Table view normally displays the detail level data in the tables. Given the nature of OLAP sources like SAP BW, this view isn't available over SAP BW.
* **Column and measure details are fixed:** The list of columns and measures seen in the field list are fixed by the underlying source, and can't be modified. For example, it's not possible to delete a column or change its datatype. It can, however, be renamed.
* **Additional limitations in DAX:** There are more limitations on the DAX that can be used in measure definitions to reflect limitations in the source. For example, it's not possible to use an aggregate function over a table.

## Additional visualization restrictions

The other primary restrictions in visualizations when connecting to SAP BW using DirectQuery in Power BI are:

* **No aggregation of columns:** It's not possible to change the aggregation for a column on a visual. It's always *Do Not Summarize*
* **Measure filtering is disabled:** Measure filtering is disabled to reflect the support offered by SAP BW.
* **Multi-select and include/exclude:** The ability to multi-select data points on a visual is disabled if the points represent values from more than one column. For example, given a bar chart showing Sales by Country/Region, with Category on the Legend, it wouldn't be possible to select the point for (USA, Bikes) and (France, Clothes). Similarly, it wouldn't be possible to select the point for (USA, Bikes) and exclude it from the visual. Both limitations are imposed to reflect the support offered by SAP BW.

## Support for SAP BW features

The following table lists all SAP BW features that aren't fully supported, or behave differently when using Power BI.

| Feature | Description |
| --- | --- |
| **Local calculations** | Local calculations defined in a BEx Query change the numbers as displayed through tools like BEx Analyzer. However, they aren't reflected in the numbers returned from SAP, through the public MDX interface. |
| | **As such, the numbers seen in a Power BI visual don't necessarily match those for a corresponding visual in an SAP tool.** |
| | For example, when connecting to a query cube from a BEx query that sets the aggregation to be *Cumulated*, or running sum, Power BI would get back the base numbers, ignoring that setting. An analyst could certainly then apply a running sum calculation locally in Power BI, but would need to exercise caution in how the numbers are interpreted if this action isn't done. |
| **Aggregations** | In some cases, particularly when dealing with multiple currencies, the aggregate numbers returned by the SAP public interface don't match the results shown by SAP tools. |
| | **As such, the numbers seen in a Power BI visual don't necessarily match those for a corresponding visual in an SAP tool.** |
| | For example, totals over different currencies would show as "*" in BEx Analyzer, but the total would get returned by the SAP public interface, without any information that such an aggregate number is meaningless. Thus the number aggregating, say, $, EUR, and AUD, would get displayed by Power BI. |
| **Currency formatting** | Any currency formatting, for example, *$2,300* or *4000 AUD*, isn't reflected in Power BI. |
| **Units of measure** | Units of measure, for example, *230 KG*, aren't reflected in Power BI. |
| **Key versus text** (short, medium, long) | For an SAP BW characteristic like `CostCenter`, the field list shows a single column *Cost Center*.  Using that column displays the default text. By showing hidden fields, it's also possible to see the unique name column that returns the unique name assigned by SAP BW, and is the basis of uniqueness. |
| | The key and other text fields aren't available. |
| **Multiple hierarchies of a characteristic** | In SAP, a characteristic can have multiple hierarchies. Then in tools like BEx Analyzer, when a characteristic is included in a query, the user can select the hierarchy to use. |
| | In Power BI, the various hierarchies can be seen in the field list as different hierarchies on the same dimension. However, selecting multiple levels from two different hierarchies on the same dimension results in empty data being returned by SAP. |
| **Treatment of ragged hierarchies** |![Screenshot of ragged content, showing the treatment of ragged hierarchies.](media/desktop-directquery-sap-bw/directquery-sap-bw_01.png) |
| **Scaling factor/reverse sign** | In SAP, a key figure can have a scaling factor, for example, *1000*, defined as a formatting option, meaning that all display is scaled by that factor. |
| | It can similarly have a property set that reverses the sign. Use of such a key figure in Power BI in a visual, or as part of a calculation results in the unscaled number being used. The sign isn't reversed. The underlying scaling factor isn't available. In Power BI visuals, the scale units shown on the axis (K,M,B) can be controlled as part of the visual formatting. |
| **Hierarchies where levels appear/disappear dynamically** | Initially when connecting to SAP BW, the information on the levels of a hierarchy are retrieved, resulting in a set of fields in the field list. This information is cached, and if the set of levels changes, then the set of fields don't change until *Refresh* is invoked. |
| | This situation is only possible in **Power BI Desktop**. Such refresh to reflect changes to the levels can't be invoked in the Power BI service after publish. |
| **Default filter** | A BEx query can include default filters, which are applied automatically by SAP BEx Analyzer. These filters aren't exposed, and hence the equivalent usage in Power BI doesn't apply the same filters by default. |
| **Hidden Key figures** | A BEx query can control visibility of key figures, and those key figures that are hidden don't appear in SAP BEx Analyzer. This fact isn't reflected through the public API, and hence such hidden key figures still appear in the field list. However, they can then be hidden within Power BI. |
| **Numeric formatting** | Any numeric formatting, such as number of decimal positions and decimal point, isn't automatically reflected in Power BI. However, it's possible to then control such formatting within Power BI. |
| **Hierarchy versioning** | SAP BW allows different versions of a hierarchy to be maintained, for example, the cost center hierarchy in 2007 versus 2008. Only the latest version is available in Power BI, as information on versions isn't exposed by the public API. |
| **Time dependent hierarchies** | When using Power BI, time dependent hierarchies are evaluated at the current date. |
| **Currency conversion** | SAP BW supports currency conversion, based on rates held in the cube. Such capabilities aren't exposed by the public API, and are therefore not available in Power BI. |
| **Sort Order** | The sort order, such as *by Text* or *by Key*, for a characteristic can be defined in SAP. This sort order isn't reflected in Power BI. For example, months might appear as "April", "Aug", and so on. |
| | It's not possible to change this sort order in Power BI. |
| **Technical names** | In **Get Data**, the characteristic/measure names (descriptions) and technical names can both be seen. The field list contains just the characteristic/measure names (descriptions). |
| **Attributes** | It's not possible to access the attributes of a characteristic within Power BI. |
| **End user language setting** | The locale used to connect to SAP BW is set as part of the connection details, and doesn't reflect the locale of the final report consumer. |
| **Text variables** | SAP BW allows field names to contain placeholders for variables, for example, `$YEAR$ Actuals`, that would then get replaced by the selected value. For example, the field appears as *2016 Actuals* in BEx tools, if the year 2016 were selected for the variable. |
| | The column name in Power BI isn't changed depending on the variable value, and therefore would appear as `$YEAR$ Actuals`.  However, the column name can then be changed in Power BI. |
| **Customer exit variables** | Customer exit variables aren't exposed by the public API, and are therefore not supported by Power BI. |
| **Characteristic structures** | Any characteristic structures in the underlying SAP BW source results in an explosion of measures being exposed in Power BI. For example, with two measures `Sales` and `Costs`, and a characteristic structure containing Budget and Actual, four measures are exposed: `Sales.Budget`, `Sales.Actual`, `Costs.Budget`, `Costs.Actual`. |

## Related content

For more information about DirectQuery, check out the following resources:

* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data Sources supported by DirectQuery](power-bi-data-sources.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
