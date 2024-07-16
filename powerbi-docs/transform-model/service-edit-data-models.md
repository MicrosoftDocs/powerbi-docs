---
title: Edit data models in the Power BI service (preview)
description: Learn how to edit data models in the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 11/10/2023
ms.custom: references_regions
LocalizationGroup: Transform and shape data
---

# Edit data models in the Power BI service (preview)
Power BI allows users to modify existing data models in the Power BI service using actions such as editing relationships, creating DAX measures and managing RLS. In this experience, users can work and collaborate simultaneously on the same data model.


## Enable the preview feature
Editing data models in the Power BI service is automatically enabled for semantic models stored in *My Workspace*. To open the data model for semantic models stored in collaborative workspaces, you must turn on the preview feature for that workspace by completing the following steps:

1. In the Power BI service, select **Settings** for the workspace where you want to enable the preview feature.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-01.png" alt-text="Screenshot of settings gear icon." lightbox="media/service-edit-data-models/service-edit-data-models-01.png":::

2. Select **Advanced > Data model settings > Users can edit data models in the Power BI service (preview)**

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-02.png" alt-text="Screenshot of enable preview feature." lightbox="media/service-edit-data-models/service-edit-data-models-02.png":::

3. Select **Save** to see the new experience for semantic models in your workspace.

> [!NOTE]
> Enabling the *edit data models in the Power BI service* preview doesn't apply to editing a semantic model through an API or an XMLA endpoint.

## Open the data model
You can open the data model for your semantic model in the following ways:

* From the workspace content list, select **More options (...)** for the semantic model and select **Open data model**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-03.png" alt-text="Screenshot of opening the data model from the more options menu." lightbox="media/service-edit-data-models/service-edit-data-models-03.png":::

* From the data hub content list, select **More options (...)** for the semantic model and select **Open data model**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-04.png" alt-text="Screenshot of opening the data model from the data hub content list." lightbox="media/service-edit-data-models/service-edit-data-models-04.png":::

* From the semantic model details page, select **Open data model**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-05.png" alt-text="Screenshot of opening the data model from the open data model button." lightbox="media/service-edit-data-models/service-edit-data-models-05.png":::

* From **edit mode** for a report connected to the semantic model, select **Open data model** to open the corresponding data model in another tab.

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

### Create a relationship
There are two ways to create a new relationship in the Power BI Service.

The first method is to drag the column from one table in the relationship diagram to the column of the other table to create the relationship.

The other method of creating a relationship is by selecting **Manage relationships** in the ribbon as shown in the following image.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-24.png" alt-text="Screenshot of manage relationships dialog ribbon entry point." lightbox="media/service-edit-data-models/service-edit-data-models-24.png":::

This will open the revamped **Manage relationships** dialog. From here, you can select **New relationship** to create a new relationship in your model.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-25.png" alt-text="Screenshot of creating a new relationship from manage relationships dialog." lightbox="media/service-edit-data-models/service-edit-data-models-25.png":::

From here, configure the relationship properties, and select the **Ok** button when your relationship is complete to save the relationship information.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-26.png" alt-text="Screenshot of editing properties for a new relationship created in the manage relationships dialog." lightbox="media/service-edit-data-models/service-edit-data-models-26.png":::

### Edit a relationship
There are three ways to edit an existing relationship in the Power BI Service.

The first method to edit a relationship is using the **Editing relationships in the Properties pane**, where you can select any line between two tables to see the relationship options in the **Properties** pane. Be sure to expand the **Properties** pane to see the relationship options.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-27.png" alt-text="Screenshot of editing properties for a new relationship in the Properties pane." lightbox="media/service-edit-data-models/service-edit-data-models-27.png":::

The next method is to right-click an existing relationship in the diagram view and select **Properties**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-28.png" alt-text="Screenshot of entering the experience to edit properties of an existing relationship." lightbox="media/service-edit-data-models/service-edit-data-models-28.png":::

In the window that appears, configure the relationship properties, and select the **Ok** button when your relationship is complete to save the relationship information.

The third method is by selecting **Manage relationships** in the ribbon. In the **Manage relationships** dialog you can choose a relationship to edit and then select **Edit**.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-29.png" alt-text="Screenshot of selecting edit in the ribbon of the manage relationships dialog to edit an existing relationship." lightbox="media/service-edit-data-models/service-edit-data-models-29.png":::

Alternatively, you can select **Edit** from the context menu of a given relationship in the dialog.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-30.png" alt-text="Screenshot of selecting edit in the context menu of the manage relationships dialog to edit an existing relationship." lightbox="media/service-edit-data-models/service-edit-data-models-30.png":::

From here, configure the relationship properties, and select the **Ok** button when editing your relationship is complete to save the relationship information.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-31.png" alt-text="Screenshot of editing properties of an existing relationship from the manage relationships dialog." lightbox="media/service-edit-data-models/service-edit-data-models-31.png":::

### See a list of all your relationships
Selecting **Manage relationships** in the ribbon opens the revamped **Manage relationships** dialog which provides a comprehensive view of all your relationships, along with their key properties, in one convenient location. From here you can then choose to create new relationships or edit an existing relationship.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-32.png" alt-text="Screenshot of a list of relationships within the manage relationships dialog." lightbox="media/service-edit-data-models/service-edit-data-models-32.png":::

Additionally, you have the option to filter and focus on specific relationships in your model based on cardinality and cross filter direction.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-33.png" alt-text="Screenshot of filtering relationships shown in the relationship list within the manage relationships dialog." lightbox="media/service-edit-data-models/service-edit-data-models-33.png":::

### Set properties
You can change the properties for a given object using the **Properties** pane. You can set common properties across multiple objects at once by holding down the **Ctrl** key and selecting multiple objects either in the relationship diagram or Data pane. When multiple objects are highlighted, changes applied in the **Properties** pane apply to all selected objects.

For example, you could change the data type for multiple columns by holding down the **Ctrl** key, selecting columns, then changing the data type setting in the **Properties** pane.


:::image type="content" source="media/service-edit-data-models/service-edit-data-models-11.png" alt-text="Screenshot of setting properties." lightbox="media/service-edit-data-models/service-edit-data-models-11.png":::

### Set your own date table
To set a **date table**, select the table you want to use as a date table in the **Data** pane, then right-click the table and choose **Mark as date table > Mark as date table** in the menu that appears as shown in the following image.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-34.png" alt-text="Screenshot of mark as date table entry from the Data pane." lightbox="media/service-edit-data-models/service-edit-data-models-34.png":::

Next, specify the date column by selecting it from the dropdown menu within the **Mark as date table** dialog.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-35.png" alt-text="Screenshot of the mark as date table dialog." lightbox="media/service-edit-data-models/service-edit-data-models-35.png":::

Setting your own date table follows the same behavior as what exists in Power BI Desktop. Further details on column validation, scenarios for creating your own date table, and impact on date hierarchies can be found in the [date tables documentation](desktop-date-tables.md)

### Define row-level security roles and rules
You can define [security roles](/fabric/security/service-admin-row-level-security) by taking the following steps:

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
    
    When defining a role using the DAX editor that can't be defined in the default editor, if you attempt to switch to the default editor you'll be prompted with a warning that switching editors might result in some information being lost. To keep this information, select **Cancel** and continue only editing this role in the DAX editor.
    
    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-17.png" alt-text="Screenshot of warning about switching to the default editor.":::


7. Select **Save** to save the role.

8. Once the role is saved, select **Assign** to add users to the role. Once assigned, select **Save** to save the role assignments and close the RLS settings modal.

    :::image type="content" source="media/service-edit-data-models/service-edit-data-models-18.png" alt-text="Screenshot of assigning users to the security role." lightbox="media/service-edit-data-models/service-edit-data-models-18.png":::

### Create layouts
You can create [layouts](desktop-modeling-view.md) of your model that contain only a subset of the tables in your model. This reorganization can help provide a clearer view into the tables you want to work with, and make working with complex semantic models easier. To create a new layout with only a subset of the tables, select the **+** button next to the *All tables* tab along the bottom of the window.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-19.png" alt-text="Screenshot of the plus button used to create a layout.":::

You can then drag a table from the **Data** pane onto the new layout. Right-click the table, and then select **Add related tables** from the menu that appears. Doing so includes any table that is related to the original table to the layout.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-20.png" alt-text="Screenshot of selecting add related tables menu item." lightbox="media/service-edit-data-models/service-edit-data-models-20.png":::


### Create reports
You can create a new report from the data model editing in the service experience by selecting the **New report** button in the ribbon. This opens a new browser tab to the report editing canvas to a new report that is built on the semantic model. 

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-21.png" alt-text="Screenshot of selecting the new report button from the ribbon.":::

When you save your new report, you're prompted to choose a workspace, provided you have write permissions for that workspace. If you don't have write permissions, or if you're a free user and the semantic model resides in a Premium-capacity or Fabric F64 or greater workspace, the new report is saved in your *My workspace*.

## AutoSave
As you made changes to your data model, your changes are automatically saved. Changes are permanent with no option to undo.

## Permissions
A user must have write and build [semantic model permissions](../connect-data/service-datasets-permissions.md) in order to open and edit the corresponding data model in the Power BI service.

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
You can monitor the effect editing data models in the service has on your Power BI Premium capacities using the [Premium metrics app](../enterprise/service-premium-metrics-app.md). Capacity effect can be monitored for editing data models in the web using the following [operations](/fabric/enterprise/fabric-operations#background-operations).

|Operation  |Description  |Workload |Type  |
|---------|---------|---------|---------|
|Web Modeling read     |A data model read operation in the semantic model web modeling user experience         |Semantic models	|Interactive         |
|Web Modeling write     |A data model write operation in the semantic model web modeling user experience         |Semantic models	|Interactive         |



## Considerations and limitations

There are a few limitations for this release of editing data models in the Power BI service, which fall into a handful of categories.

### Unsupported semantic models

The following scenarios don't support opening the data model for a semantic model in the service:
* Semantic models that have incremental refresh.
* Semantic models that have been deployed by a deployment pipeline.
* Semantic models that haven't yet been upgraded to enhanced metadata format. You can upgrade to enhanced metadata format by opening the corresponding pbix in Desktop and republishing. 
* Semantic models that have automatic aggregations configured.
* Semantic models that have a live connection.
* Semantic models migrated from Azure Analysis Services (AAS).
* Not all semantic models in Pro workspaces are currently supported in UAE North.

To see which limitation is preventing you from opening your data model, hover over the **Open data model** button in the semantic model details page. This displays a tooltip indicating which limitation is causing the **Open data model** button to be disabled.

:::image type="content" source="media/service-edit-data-models/service-edit-data-models-23.png" alt-text="Screenshot of hovering over the open data model button.":::


### Limitations
There are still many functional gaps between the model view in Power BI desktop and service. Functionality not yet supported in the service includes:
* Setting a table as a feature table
* Configuring any feature table properties
* Changing the storage mode of a table 
* Changing to and from the data category ‘barcode’
* Connecting to new data sources
* Transforming data using Power Query editor
* View as dialog
* Q&A setup and configuration including editing synonyms
* Classifying sensitivity of your report
* External tools integration
* When modifying your data model within the Service, creating a relationship between DirectQuery tables from the same Power BI semantic model or Azure Analysis Services instance will not be properly prevented. Like Desktop, this scenario is not supported, but no error will be generated when you try to perform this action.
* When modifying your data model within the Service, changing the name of data fields will not automatically update in existing visuals in downstream artifacts that depend on that semantic model.

### Semantic models edited with external tools

Utilizing [external tools](../transform-model/desktop-external-tools.md) to modify the semantic model using the XMLA endpoint might cause unexpected behavior when editing your semantic model in the web if the write operation is not supported. For more information about supported write operations, please refer to our documentation on [changes outside of Power BI](../developer/projects/projects-overview.md#model-authoring). 

### Accessibility
Full accessibility isn’t currently supported for data model editing in the Power BI service.



## Related content
This article provided information about the preview for editing data models in the Power BI service. For more information on data modeling in Power BI, see the following resources:

* [Work with Modeling view](desktop-modeling-view.md)
* [Understand model relationships](desktop-relationships-understand.md)
* [Learn DAX basics](desktop-quickstart-learn-dax-basics.md)
* [Row-level security (RLS) with Power BI](/fabric/security/service-admin-row-level-security)
