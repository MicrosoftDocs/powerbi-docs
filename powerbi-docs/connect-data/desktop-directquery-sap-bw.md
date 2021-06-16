---
title: DirectQuery and SAP Business Warehouse (BW) in Power BI
description: Considerations when using DirectQuery with SAP Business Warehouse (BW)
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/05/2021
LocalizationGroup: Connect to data
---
# Connect to SAP Business Warehouse by using DirectQuery in Power BI
You can connect to **SAP Business Warehouse (BW)** data sources directly using **DirectQuery**. Given the OLAP/multidimensional nature of SAP BW, there are many important differences between DirectQuery over SAP BW versus relational sources like SQL Server. These differences are summarized as follows:

* In **DirectQuery** over relational sources there are a set of queries (as defined in the **Get Data** or **Power Query Editor** dialog) that logically define the data that is available in the field list. This is *not* the case when connecting to an OLAP source such as SAP BW. Instead, when connecting to the SAP server using **Get Data**, just the Infocube or BEx Query is selected. Then all the Key Figures and dimensions of the selected Infocube/BEx Query will be available in the field list.   
* Similarly, there is no **Power Query Editor** when connecting to SAP BW. The data source settings (for example, server name) can be changed by selecting **Transform data > Data source settings**. The settings for any Parameters can be changed by selecting **Transform data > Edit parameters**.
* Given the unique nature of OLAP sources, there are additional restrictions (for both modeling and visualizations) that apply, in addition to the normal restrictions imposed for DirectQuery. These restrictions are described later in this article.

In addition, it is *extremely important* to understand that there are many features of SAP BW that are not supported in Power BI, and that because of the nature of the public interface to SAP BW, there are important cases where the results seen through Power BI will not match those seen when using an SAP tool. These limitations are described later in this article. These limitations and behavior differences should be carefully reviewed, to ensure that the results seen through Power BI, as returned by the SAP public interface, are interpreted correctly.  

> [!NOTE]
> The ability to use DirectQuery over SAP BW was in preview until the March 2018 update to Power BI Desktop. During the preview, feedback and suggested improvements prompted a change that impacts reports that were created using that preview version. Now that General Availability (GA) of DirectQuery over SAP BW has released, you *must* discard any existing (preview-based) reports using DirectQuery over SAP BW that were created with the pre-GA version. In reports created with the pre-GA version of DirectQuery over SAP BW, errors will occur with those pre-GA reports upon invoking Refresh, as a result of attempting to refresh the metadata with any changes to the underlying SAP BW cube. Please re-create those reports from a blank report, using the GA version of DirectQuery over SAP BW. 

## Additional Modeling Restrictions
The primary additional modeling restrictions when connecting to SAP BW using DirectQuery in Power BI are the following:

* **No support for calculated columns:** The ability to create calculated columns is disabled. This also means that Grouping and Clustering, which create calculated columns, are not available.
* **Additional limitations for measures:** There are additional limitations imposed on the DAX expressions that can be used in measures, to reflect the level of support offered by SAP BW.
* **No support for defining relationships:** The relationships are inherent in the external SAP source, and additional relationships cannot be defined in the model.
* **No Data View:** The **Data View** normally displays the detail level data in the tables. Given the nature of OLAP sources like SAP BW, this view is not available over SAP BW.
* **Column and measure details are fixed:** The list of columns and measures seen in the field list are fixed by the underlying source, and cannot be modified. For example, it is not possible to delete a column, nor change its datatype (it can, however, be renamed).
* **Additional limitations in DAX:** There are additional limitations on the DAX that can be used in measure definitions, to reflect limitations in the source. For example, it is not possible to use an aggregate function over a table.

## Additional Visualization Restrictions
The primary additional restrictions in visualizations when connecting to SAP BW using DirectQuery in Power BI are the following:

* **No aggregation of columns:** It is not possible to change the aggregation for a column on a visual; it is always *Do Not Summarize*
* **Measure filtering is disabled:** Measure filtering is disabled to reflect the support offered by SAP BW.
* **Multi-select and include/exclude:** The ability to multi-select data points on a visual is disabled if the points represent values from more than one column. For example, given a bar chart showing Sales by Country, with Category on the Legend, it would not be possible to select the point for (USA, Bikes) and (France, Clothes). Similarly, it would not be possible to select the point for (USA, Bikes) and exclude it from the visual. Both limitations are imposed to reflect the support offered by SAP BW.

## Support for SAP BW features
The following table lists all SAP BW features that are not fully supported, or will behave differently when using Power BI.   

| Feature | Description |
| --- | --- |
| Local calculations |Local calculations defined in a BEx Query will change the numbers as displayed through tools like BEx Analyzer. However, they are not reflected in the numbers returned from SAP, through the public MDX interface. <br/> <br/> **As such, the numbers seen in a Power BI visual will not necessarily match those for a corresponding visual in an SAP tool.**<br/> <br/>  For example, when connecting to a query cube from a BEx query that sets the aggregation to be Cumulated (i.e. running sum), Power BI would get back the base numbers, ignoring that setting.  An analyst could certainly then apply a running sum calculation locally in Power BI, but would need to exercise caution in how the numbers are interpreted if this is not done. |
| Aggregations |In some cases (particularly when dealing with multiple currencies), the aggregate numbers returned by the SAP public interface do not match those shown by SAP tools. <br/> <br/> **As such, the numbers seen in a Power BI visual will not necessarily match those for a corresponding visual in an SAP tool.** <br/> <br/> For example, totals over different currencies would show as  "*" in BEx Analyzer, but the total would get returned by the SAP public interface, without any information that such an aggregate number is meaningless. Thus the number (aggregating, say, $, EUR, and AUD) would get displayed by Power BI. |
| Currency formatting |Any currency formatting (for example, $2,300 or 4000 AUD) is not reflected in Power BI. |
| Units of measure |Units of measure (for example, 230 KG) are not reflected in Power BI. |
| Key versus text (short, medium, long) |For an SAP BW characteristic like CostCenter, the field list will show a single column Cost Center.  Using that column will display the default text.  By showing hidden fields, it will also be possible to see the unique name column (that returns the unique name assigned by SAP BW, and is the basis of uniqueness).<br/> <br/>  The key and other text fields are not available. |
| Multiple hierarchies of a characteristic |In **SAP**, a characteristic can have multiple hierarchies. Then in tools like BEx Analyzer, when a characteristic is included in a query, the user can select the hierarchy to use. <br/> <br/> In **Power BI**, the various hierarchies can be seen in the field list as different hierarchies on the same dimension.  However, selecting multiple levels from two different hierarchies on the same dimension will result in empty data being returned by SAP. |
| Treatment of ragged hierarchies |![Screenshot of ragged content, showing the treatment of ragged hierarchies.](media/desktop-directquery-sap-bw/directquery-sap-bw_01.png) |
| Scaling factor/reverse sign |In SAP, a key figure can have a scaling factor (for example, 1000) defined as a formatting option, meaning that all display will be scaled by that factor. <br/> <br/> It can similarly have a property set that reverses the sign. Use of such a key figure in Power BI (in a visual, or as part of a calculation) will result in the unscaled number being used (and the sign is not reversed). The underlying scaling factor is not available. In Power BI visuals, the scale units shown on the axis (K,M,B) can be controlled as part of the visual formatting. |
| Hierarchies where levels appear/disappear dynamically |Initially when connecting to SAP BW, the information on the levels of a hierarchy will be retrieved, resulting in a set of fields in the field list. This is cached, and if the set of levels changes, then the set of fields do not change until Refresh is invoked. <br/> <br/> This is only possible in **Power BI Desktop**. Such Refresh to reflect changes to the levels cannot be invoked in the Power BI service after Publish. |
| Default filter |A BEx query can include Default Filters, which will be applied automatically by SAP BEx Analyzer. These are not exposed, and hence the equivalent usage in Power BI will not apply the same filters by default. |
| Hidden Key figures |A BEx query can control visibility of Key Figures, and those that are hidden will not appear in SAP BEx Analyzer. This is not reflected through the public API, and hence such hidden key figures will still appear in the field list. However, they can then be hidden within Power BI. |
| Numeric formatting |Any numeric formatting (number of decimal positions, decimal point, etc.) will not automatically be reflected in Power BI. However, it is possible to then control such formatting within Power BI. |
| Hierarchy versioning |SAP BW allows different versions of a hierarchy to be maintained, for example, the cost center hierarchy in 2007 versus 2008. Only the latest version will be available in Power BI, as information on versions is not exposed by the public API. |
| Time dependent hierarchies |When using Power BI, time dependent hierarchies are evaluated at the current date. |
| Currency conversion |SAP BW supports currency conversion, based on rates held in the cube. Such capabilities are not exposed by the public API, and are therefore not available in Power BI. |
| Sort Order |The sort order (by Text, or by Key) for a characteristic can be defined in SAP. This sort order is not reflected in Power BI. For example, months might appear as “April”, “Aug”, and so on. <br/> <br/> It is not possible to change this sort order in Power BI. |
| Technical names |In **Get Data**, the characteristic/measure names (descriptions) and technical names can both be seen. The field list will contain just the characteristic/measure names (descriptions). |
| Attributes |It is not possible to access the attributes of a characteristic within Power BI. |
| End user language setting |The locale used to connect to SAP BW is set as part of the connection details, and does not reflect the locale of the final report consumer. |
| Text Variables |SAP BW allows field names to contain placeholders for variables (for example, "$YEAR$ Actuals") that would then get replaced by the selected value. For example, the field appears as "2016 Actuals" in BEx tools, if the year 2016 were selected for the variable. <br/> <br/> The column name in Power BI will not be changed depending on the variable value, and therefore would appear as "$YEAR$ Actuals".  However, the column name can then be changed in Power BI. |
| Customer Exit Variables | Customer Exit variables are not exposed by the public API, and are therefore not supported by Power BI. |
| Characteristic Structures | Any Characteristic structures in the underlying SAP BW source will result in an ‘explosion’ of measures being exposed in Power BI. For example, with two measures Sales and Costs, and a characteristic structure containing Budget and Actual, four measures will be exposed: Sales.Budget, Sales.Actual, Costs.Budget, Costs.Actual. |


## Next steps
For more information about DirectQuery, check out the following resources:

* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data Sources supported by DirectQuery](power-bi-data-sources.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
