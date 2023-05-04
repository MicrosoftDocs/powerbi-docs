---
title: Edit data models in the Power BI service (preview)
description: Learn how to edit data models in the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 04/20/2023
ms.custom: references_regions
LocalizationGroup: Transform and shape data
---

# Edit data models in the Power BI service (preview)
Power BI allows users to modify existing data models in the Power BI service using actions such as editing relationships, creating DAX measures and managing RLS. In this experience, users can work and collaborate simultaneously on the same data model.


## Enable the preview feature
Editing data models in the Power BI service is automatically enabled for datasets stored in *My Workspace*. To open the data model for datasets stored in collaborative workspaces, you must turn on the preview feature for that workspace by completing the following steps:

1. In the Power BI service, select **Settings** for the workspace where you want to enable the preview feature.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-01.png" alt-text="Screenshot of settings gear icon." lightbox="media/service-edit-data-models/service-edit-data-models-01.png":::

2. Select **Advanced > Data model settings > Users can edit data models in the Power BI service (preview)**

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-02.png" alt-text="Screenshot of enable preview feature." lightbox="media/service-edit-data-models/service-edit-data-models-02.png":::

3. Select **Save** to see the new experience for datasets in your workspace.

> [!NOTE]
> Enabling the *edit data models in the Power BI service* preview doesn't apply to editing a dataset through an API or an XMLA endpoint.

## Open the data model
You can open the data model for your dataset in the following ways:

* From the workspace content list, select **More options (...)** for the dataset and select **Open data model**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-03.png" alt-text="Screenshot of opening the data model from the more options menu." lightbox="media/service-edit-data-models/service-edit-data-models-03.png":::

* From the datahub content list, select **More options (...)** for the dataset and select **Open data model**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-04.png" alt-text="Screenshot of opening the data model from the datahub content list." lightbox="media/service-edit-data-models/service-edit-data-models-04.png":::

* From the dataset details page, select **Open data model**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-05.png" alt-text="Screenshot of opening the data model from the open data model button." lightbox="media/service-edit-data-models/service-edit-data-models-05.png":::

* From **edit mode** for a report connected to the dataset, select **Open data model** to open the corresponding data model in another tab.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-06.png" alt-text="Screenshot of opening the data model in edit mode." lightbox="media/service-edit-data-models/service-edit-data-models-06.png":::

## Model data
When you open your data model you can see all the tables, columns, and relationships in your model. You can now edit your data model, and any changes are automatically saved. 

### Create measures
To create a [measure](desktop-measures.md) (a measure is a collection of standardized metrics) select the table in the **Data Pane** and select the **New measure** button from the ribbon, as shown in the following image.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-07.png" alt-text="Screenshot of creating a new measure." lightbox="media/service-edit-data-models/service-edit-data-models-07.png":::

Enter the measure into the formula bar and specify the table and the column to which it applies. Similar to Power BI Desktop, the DAX editing experience in the Power BI service presents a rich editor complete with autocomplete for formulas (intellisense). 

You can expand the table to find the measure in the table.

### Create calculated columns
To create a [calculated column](desktop-calculated-columns.md) select the table in the **Data Pane** and select the **New column** button in the ribbon, as shown in the following image.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-08.png" alt-text="Screenshot of creating a calculated column." lightbox="media/service-edit-data-models/service-edit-data-models-08.png":::

Enter the calculated column into the formula bar and specify the table to which it applies. Similar to Power BI Desktop, the DAX editing experience in the Power BI service presents a rich editor complete with autocomplete for formulas (intellisense). 

You can expand the table to find the calculated column in the table.


### Create calculated tables
To create a [calculated table](desktop-calculated-tables.md) select the table in the **Data Pane** and select the **New table** button in the ribbon, as shown in the following image.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-09.png" alt-text="Screenshot of creating a calculated table." lightbox="media/service-edit-data-models/service-edit-data-models-09.png":::

Enter the calculated table into the formula bar. Similar to Power BI Desktop, the DAX editing experience in the Power BI service presents a rich editor complete with autocomplete for formulas (intellisense). You can now see the newly created calculated table in your model.

### Create relationships
To create a relationship, drag the column from one table to the column of the other table to initiate the relationship. In the window that appears, configure the relationship properties.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-10.png" alt-text="Screenshot of creating a relationship." lightbox="media/service-edit-data-models/service-edit-data-models-10.png":::

Select the **Confirm** button when your relationship is complete to save the relationship information.


### Set properties
You can change the properties for a given object using the **Properties** pane. You can set common properties across multiple objects at once by holding down the **Ctrl** key and selecting multiple objects either in the relationship diagram or Data pane. When multiple objects are highlighted, changes applied in the **Properties** pane apply to all selected objects.

For example, you could change the data type for multiple columns by holding down the **Ctrl** key, selecting columns, then changing the data type setting in the **Properties** pane.


:::image type="content" source="media/service-edit-data-models/service-edit-data-models-11.png" alt-text="Screenshot of setting properties." lightbox="media/service-edit-data-models/service-edit-data-models-11.png":::


### Define row-level security roles and rules
You can define [security roles](../enterprise/service-admin-rls.md) by taking the following steps:

1. From the ribbon, select Manage roles.

    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-12.png" alt-text="Screenshot of manage roles button.":::

2. From the **Manage roles** window, select **New** to create a new role.

    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-13.png" alt-text="Screenshot of selecting new from manage security roles." lightbox="media/service-edit-data-models/service-edit-data-models-13.png":::

3. Under **Roles**, provide a name for the role and select enter.

    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-14.png" alt-text="Screenshot of naming a security role.":::

4. Under **Select tables**, select the table to which you want to apply a row-level security filter.

5. Under **Filter data**, use the default editor to define your roles. The expressions created return a true or false value.

    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-15.png" alt-text="Screenshot of selecting filter data for security roles." lightbox="media/service-edit-data-models/service-edit-data-models-15.png":::
    
    > [!NOTE]
    > Not all row-level security filters supported in Power BI can be defined using the default editor. Limitations include expressions that today can only be defined using DAX, including dynamic rules such as username or userprincipalname. To define roles using these filters, switch to use the DAX editor.

6. Optionally select **Switch to DAX editor** to use the DAX editor to define your role. You can switch back to the default editor by selecting **Switch to default editor**. All changes made in either editor interface persist when switching interfaces when possible.

    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-16.png" alt-text="Screenshot of switching to the DAX editor." lightbox="media/service-edit-data-models/service-edit-data-models-16.png":::
    
    When defining a role using the DAX editor that can't be defined in the default editor, if you attempt to switch to the default editor you'll be prompted with a warning that switching editors may result in some information being lost. To keep this information, select **Cancel** and continue only editing this role in the DAX editor.
    
    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-17.png" alt-text="Screenshot of warning about switching to the default editor.":::


7. Select **Save** to save the role.

8. Once the role is saved, select **Assign** to add users to the role. Once assigned, select **Save** to save the role assignments and close the RLS settings modal.

    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-18.png" alt-text="Screenshot of assigning users to the security role." lightbox="media/service-edit-data-models/service-edit-data-models-18.png":::

### Create layouts
You can create [layouts](desktop-modeling-view.md) of your model that contain only a subset of the tables in your model. This reorganization can help provide a clearer view into the tables you want to work with, and make working with complex datasets easier. To create a new layout with only a subset of the tables, select the **+** button next to the *All tables* tab along the bottom of the window.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-19.png" alt-text="Screenshot of the plus button used to create a layout.":::

You can then drag a table from the **Data** pane onto the new layout. Right-click the table, and then select **Add related tables** from the menu that appears. Doing so includes any table that is related to the original table to the layout.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-20.png" alt-text="Screenshot of selecting add related tables menu item." lightbox="media/service-edit-data-models/service-edit-data-models-20.png":::


> [!NOTE]
> Any additional layouts you make in the Power BI service other than the *All tables* layout won’t be saved for future sessions. Additionally, when uploading a .PBIX file to the Power BI service, no existing layouts other than *All tables* appear in the Power BI service.

### Create reports
You can create a new report from the data model editing in the service experience by selecting the **New report** button in the ribbon. This opens a new browser tab to the report editing canvas to a new report that is built on the dataset. 

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-21.png" alt-text="Screenshot of selecting the new report button from the ribbon.":::

When you save your new report, you're prompted to choose a workspace, provided you have write permissions for that workspace. If you don't have write permissions, or if you're a free user and the dataset resides in a Premium-capacity workspace, the new report is saved in your *My workspace*.

## Autosave
As you made changes to your data model, your changes are automatically saved. Changes are permanent with no option to undo.

## Permissions
A user must have write and build [dataset permissions](../connect-data/service-datasets-permissions.md) in order to open and edit the corresponding data model in the Power BI service.

## Enabling data model editing in the admin portal
Power BI administrators can enable or disable data model editing in the service for the entire organization or for specific security groups, using the setting found in the Power BI **admin portal**, as shown in the following image.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-22.png" alt-text="Screenshot of the admin portal setting enabled for editing data models in the service.":::

## Viewing audit logs and activity events
Power BI administrators can audit operations pertaining to editing data models in the web operations from the **Microsoft 365 Admin Center**. Audit operations supported for editing data models in the web are the following:


|Friendly name  |Operation name  |Notes  |
|---------|---------|---------|
|Applied a change to model in Power BI     |ApplyChangeToPowerBIModel         |A user makes a change to an existing model. This occurs whenever any edit is made to the model (example: write a DAX measure, manage relationships, others)         |
|Retrieved a model from Power BI     |GetPowerBIDataModel         |A user opens the **Open data model** experience or resyncs a data model.         |



For more information on accessing your audit logs, see the [Access your audit logs](../admin/service-admin-auditing.md) article.


## Capacity utilization and reporting
You can monitor the impact editing data models in the service has on your Power BI Premium capacities using the [Premium metrics app](../enterprise/service-premium-metrics-app.md). Capacity impact can be monitored for editing data models in the web using the following [operations](../enterprise/service-premium-interactive-background-operations.md#background-operations).


|Operation  |Description  |Workload |Type  |
|---------|---------|---------|---------|
|Web Modeling read     |A data model read operation in the dataset web modeling user experience         |Datasets	|Interactive         |
|Web Modeling write     |A data model write operation in the dataset web modeling user experience         |Datasets	|Interactive         |



## Considerations and limitations

There are a few limitations for this release of editing data models in the Power BI service, which fall into a handful of categories.

### Unsupported datasets

The following scenarios don't support opening the data model for a dataset in the service:
* Datasets that have incremental refresh.
* Datasets that have been deployed by a deployment pipeline.
* Datasets modified by an XMLA endpoint.
* Datasets that haven't yet been upgraded to enhanced metadata format. You can upgrade to enhanced metadata format by opening the corresponding pbix in Desktop and republishing. 
* Datasets that have automatic aggregations configured.
* Datasets that have a live connection.
* Not all datasets in Pro workspaces are currently supported in the following regions: 
    * Brazil South
    * Canada Central
    * Central US
    * East US
    * East US 2
    * India Central
    * Japan East
    * North Central US
    * North Europe
    * South Africa North
    * South Central US
    * Southeast Asia
    * UAE North
    * UK South
    * West US
    * West US 2

To see which limitation is preventing you from opening your data model, hover over the **Open data model** button in the dataset details page. This displays a tooltip indicating which limitation is causing the **Open data model** button to be disabled.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-23.png" alt-text="Screenshot of hovering over the open data model button.":::

### Layouts
Any changes you make to layouts won’t be saved for future sessions. This includes:

* Any additional layouts you make in the service other than the *All tables* layout won’t be saved for future sessions. Additionally, when uploading a .PBIX file to the service, no existing layouts other than *All tables* appear in the Power BI service. When downloading the .PBIX file, no layouts other than *All tables* appear in Power BI Desktop.
* Any visual changes you make to a relationship diagram in any layout including the *All tables* layout won’t be saved for future sessions. This encompasses all visual alterations made to a layout such as the location of cards, expand all/collapse all fields in a card, and pinning fields to the top of a card. 


### Limitations
There are still many functional gaps between the model view in Power BI desktop and service. Functionality not yet supported in the service includes:
* Renaming and deleting tables that are not calculated tables
* Renaming and deleting columns that are not calculated columns
* Setting a table as a feature table
* Configuring any feature table properties
* Editing the sort by property for a column 
* Creating and configuring a custom date table
* Changing the storage mode of a table 
* Changing to and from the data category ‘barcode’
* Connecting to new data sources
* Transforming data using Power Query editor
* Manage relationships dialog
* View as dialog
* Autodetect relationships
* Q&A setup and configuration including editing synonyms
* Classifying sensitivity of your report
*  External tools integration

### Accessibility
Full accessibility isn’t currently supported for data model editing in the Power BI service.



## Next steps
This article provided information about the preview for editing data models in the Power BI service. For more information on data modeling in Power BI, see the following resources:

* [Work with Modeling view](desktop-modeling-view.md)
* [Understand model relationships](desktop-relationships-understand.md)
* [Learn DAX basics](desktop-quickstart-learn-dax-basics.md)
* [Row-level security (RLS) with Power BI](../enterprise/service-admin-rls.md)
