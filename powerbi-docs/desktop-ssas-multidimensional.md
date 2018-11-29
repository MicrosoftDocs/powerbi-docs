---
title: Analysis Services Multidimensional data in Power BI Desktop
description: Analysis Services Multidimensional data in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# Connect to SSAS Multidimensional Models in Power BI Desktop
With Power BI Desktop, you can access **SSAS Multidimensional models**, commonly referred to as **SSAS MD**.

To connect to an **SSAS MD** database, select **Get Data &gt; Database &gt; SQL Server Analysis Services Database** as shown in the following image:

![](media/desktop-ssas-multidimensional/ssas-multidimensional-2.png)

**SSAS Multidimensional models** in Live connection mode are supported in both the Power BI service and in Power BI Desktop. You can also publish and upload reports that use **SSAS Multidimensional models** in Live mode to the Power BI service.

## Capabilities and features of SSAS MD
The following sections describe features and capabilities of Power BI and SSAS MD connections.

### Tabular metadata of multidimensional models
The following table shows the correspondence between multidimensional objects and the tabular metadata that's returned to Power BI Desktop. Power BI queries the model for tabular metadata, and based on the returned metadata, runs appropriate DAX queries against Analysis Services when you create a visualization such as a table, matrix, chart, or slicer.

| BISM-Multidimentional object | Tabular Metadata |
| --- | --- |
| Cube |Model |
| Cube dimension |Table |
| Dimension attributes (Keys), Name |Columns |
| Measure group |Table |
| Measure |Measure |
| Measures without associated Measure Group |Within table called *Measures* |
| Measure group -> Cube dimension relationship |Relationship |
| Perspective |Perspective |
| KPI |KPI |
| User/Parent-Child hierarchies |Hierarchies |

### Measures, measure groups, and KPIs
Measure groups in a multidimensional cube are exposed in Power BI as tables with the ∑ sign beside them in the **Fields** pane. Calculated measures that don't have an associated measure group are grouped under a special table called *Measures* in the tabular metadata.

In a multidimensional model, you can define a set of measures or KPIs in a cube to be located within a *Display folder*, which can help simplify complex models. Power BI recognizes Display folders in tabular metadata, and shows measures and KPIs within the Display folders. KPIs in multidimensional databases support *Value*, *Goal*, *Status Graphic*, and *Trend Graphic*.

### Dimension attribute type
Multidimensional models also support associating dimension attributes with specific dimension attribute types. For example, a **Geography** dimension where the *City*, *State-Province*, *Country*, and *Postal Code* dimension attributes have appropriate geography types associated with them are exposed in the tabular metadata. Power BI recognizes the metadata, enabling you to create map visualizations. You'll recognize these associations by the *map* icon next to element in the **Field** pane in Power BI.

Power BI can also render images when you provide a field containing URLs (Uniform Resource Locator) of the images. You can specify these fields as *ImageURL* type in SQL Server Data Tools (or subsequently in Power BI), and its type information is provided to Power BI in the tabular metadata. Power BI can then retrieve those images from the URL, and display them in visuals.

### Parent-child hierarchies
Multidimensional models support Parent-child hierarchies, which are presented as a *hierarchy* in the tabular metadata. Each level of the Parent-child hierarchy is exposed as a hidden column in the tabular metadata. The key attribute of the Parent-child dimension is not exposed in the tabular metadata.

### Dimension calculated members
Multidimensional models support creation of various types of *calculated members*. The two most common types of calculated members are the following:

* Calculated members on attribute hierarchies and not sibling of *All*
* Calculated members on user hierarchies

Multidimensional models expose *calculated members on attribute hierarchies* as values of a column. There are a few additional options and constraints while exposing this type of calculated member:

* Dimension attribute can have an optional *UnknownMember*
* An attribute containing calculated members cannot be the key attribute of the dimension, unless it is the only attribute of the dimension
* An attribute containing calculated members cannot be a parent-child attribute

The calculated members of user hierarchies are not exposed in Power BI. Rather, you will be able to connect to a cube containing calculated members on user hierarchies, but you won't be able to see calculated members if they do not meet the constraints mentioned in the previous bulleted list.

### Security
Multidimensional models support dimension and cell level security by way of *Roles*. When you connect to a cube with Power BI, you are authenticated and evaluated for appropriate permissions. When a user has *dimension security* applied, the respective dimension members are not seen by the user in Power BI. However, when a user has a *cell security* permission defined, where certain cells are restricted, then that user cannot connect to the cube using Power BI.

## Considerations and Limitations
There are certain limitations to using **SSAS MD**:

* Servers must be running SQL Server 2012 SP1 CU4 or later versions of Analysis Services for the Power BI Desktop SSAS MD connector to work properly
* *Actions* and *Named Sets* are not exposed to Power BI, but you can still connect to cubes that also contain *Actions* or *Named sets* and create visuals and reports.
* You may encounter an issue where Power BI displays metadata for an SSAS model, but you're unable to retreive data from the model. This can occur when you have the 32-bit version of the MSOLAP provider installed on your system, and do not have the 64-bit version. Installing the 64-bit version may resolve the issue.
* You can't create 'report level' measures when authoring a report that is connected live to an SSAS multidimensional model. The only measures that are available are those defined in the MD model.

## Supported Features of SSAS MD in Power BI Desktop
The following features of SSAS MD are supported in Power BI Desktop:

* Consumption of the following elements are supported in this release of **SSAS MD** (you can get [more information](https://msdn.microsoft.com/library/jj969574.aspx) about these features):
  * Display folders
  * KPI Trends
  * Default Members
  * Dimension Attributes
  * Dimension Calculated Members (must be a single real member when the dimension has more than one attribute, it cannot be the key attribute of the dimension unless it is the only attribute, and it cannot be a parent-child attribute)
  * Dimension Attribute types
  * Hierarchies
  * Measures (with or without Measure groups)
  * Measures as Variant
  * KPIs
  * ImageUrls
  * Dimension security

## Troubleshooting 
The following list describes all known issues when connecting to SQL Server Analysis Services (SSAS). 

* **Error : Couldn't load model schema** - This error usually occurs when the user connecting to Analysis Services does not have access to database/cube.
