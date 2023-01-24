---
title: Using DirectQuery for datasets and Analysis Services (preview)
description: Understand using DirectQuery with Power BI datasets and Analysis Services
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 11/22/2022
LocalizationGroup: Connect to data
---
# Using DirectQuery for Power BI datasets and Analysis Services (preview)

With DirectQuery for Power BI datasets and Analysis Services, you can use DirectQuery to connect to Power BI datasets, Azure Analysis Services (AAS), and SQL Server 2022 (CTP) Analysis Services - and you can even combine with other DirectQuery and imported data. Report authors who want to combine the data from their enterprise semantic model with other data they own, such as an Excel spreadsheet, or want to personalize or enrich the metadata from their enterprise semantic model, will find this feature especially useful.

## Enable the preview feature

Since the functionality is currently in preview, you must first enable it. To do so, in Power BI Desktop go to **File > Options and settings > Options**, and in the **Preview features** section, select the **DirectQuery for Power BI datasets and Analysis Services** checkbox to enable this preview feature. You may need to restart Power BI Desktop for the change to take effect.

## Managing this feature

Tenant administrators can enable or disable DirectQuery connections to Power BI datasets in the admin portal. While this is enabled by default, disabling it will effectively stop users from publishing new composite models on Power BI datasets to the service.

:::image type="content" source="media/desktop-directquery-datasets-azure-analysis-services/directquery-connections-datasets-admin-setting.png" alt-text="Admin setting to enable or disable DirectQuery connections to Power BI datasets.":::

Existing reports that leverage a composite model on a Power BI dataset will continue to work and users can still create the composite model in using Desktop but will not be able to publish to the service. Instead, when you create a DirectQuery connection to the Power BI dataset by selecting **Make changes to this model** you will see the following warning message:

![Warning message informing the user that publication of a composite model that uses a Power BI dataset is not allowed, because DirectQuery connections are not allowed by the admin. The user can still create the model using Desktop.](media/desktop-directquery-datasets-azure-analysis-services/directquery-connection-disabled-warning.png)

This way you can still explore the dataset in your local Power BI Desktop environment and create the composite model. However, you will not be able to publish the report to the Service. When you publish the report and model you will see the following error message and publication will be blocked:

![Error message that blocks publication of a composite model that uses a Power BI dataset because DirectQuery connections are not allowed by the admin.](media/desktop-directquery-datasets-azure-analysis-services/directquery-connection-disabled-publish-error.png)

Note that live connections to Power BI datasets are not influenced by the switch, nor are live or DirectQuery connections to Analysis Services. These will continue to work regardless of if the switch has been turned off. Also, any published reports that leverage a composite model on a Power BI dataset will continue to work even if the switch has been turned off after they were published.

## Using DirectQuery for live connections

Using DirectQuery for Power BI datasets and Analysis Services requires your report to have a local model. You can start from a live connection and add or upgrade to a local model, or start with a DirectQuery connection or imported data, which automatically creates a local model in your report.

To see which connections are being used in your model, check the status bar in the bottom right corner of Power BI Desktop. If you're only connected to an Analysis Services source, you see a message like the following image:

![Analysis Services only connection](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-01.png)

If you're connected to a Power BI dataset, you see a message telling you which Power BI dataset you're connected to:

![Power BI dataset connection](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-01b.png)

If you want to customize the metadata of fields in your live connected dataset, select **Make changes to this model** in the status bar. Alternatively, you can select the **Make changes to this model** button in the ribbon, as shown in the following image. In **Report View** the **Make changes to this model** button in the **Modeling** tab. In Model View, the button is in the **Home** tab.

![Make changes to this model button](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-02.png)

Selecting the button displays a dialog confirming addition of a local model. Select **Add a local model** to enable creating new columns or modifying the metadata, for fields from Power BI datasets or Analysis Services. The following image shows the dialog that's displayed. 

![Create local model dialog](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-03.png)

When you're connected live to an Analysis Services source, there's no local model. To use DirectQuery for live connected sources, such as Power BI datasets and Analysis Services, you must add a local model to your report. When you publish a report with a local model to the Power BI service, a dataset for that local model is published a well.

## Chaining

Datasets, and the datasets and models on which they're based, form a *chain*. This process, called **chaining**, lets you publish a report and dataset based on other Power BI datasets, a feature that previously wasn't possible.

For example, imagine your colleague publishes a Power BI dataset called *Sales and Budget* that's based on an Analysis Services model called *Sales*, and combines it with an Excel sheet called *Budget*.

When you publish a new report (and dataset) called *Sales and Budget Europe* that's based on the *Sales and Budget* Power BI dataset published by your colleague, making some further modifications or extensions as you do so, you're effectively adding a report and dataset to a chain of length three, which started with the *Sales* Analysis Services model, and ends with your *Sales and Budget Europe* Power BI dataset. The following image visualizes this chaining process.

![The process of chaining datasets](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-04.png)

The chain in the previous image is of length three, which is the maximum length during this preview period. Extending beyond a chain length of three isn't supported and results in errors.

## Security warning

Using the **DirectQuery for Power BI datasets and Analysis Services** feature will present you with a security warning dialog, shown in the following image.

![Security warning](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-05.png)

Data may be pushed from one data source to another, which is the same security warning for combining DirectQuery and import sources in a data model. To learn more about this behavior, please see [using composite models in Power BI Desktop](../transform-model/desktop-composite-models.md).

## Features and scenarios to try

The following list provides suggestions on how you can explore **DirectQuery for Power BI datasets and Analysis Services** for yourself:

- Connecting to data from various sources: Import (such as files), Power BI datasets, Azure Analysis Services
- Creating relationships between different data sources
- Writing measures that use fields from different data sources
- Creating new columns for tables from Power BI datasets of Azure Analysis Services
- Creating visuals that use columns from different data sources

Beginning with the April 2021 version of Power BI Desktop, you can also connect to a perspective when making a DirectQuery connection to an Analysis Services model, if a perspective is available.

Beginning with the October 2021 version of Power BI Desktop, you have more control over your connections:
* You can remove a table from  your model using the field list, to keep models as concise and lean as possible (if you connect to a perspective, you can't remove tables from the model)
* You can specify which tables to load, rather than having to load all tables when you only want a specific subset of tables
* You can specify whether to add any tables that are subsequently added to the dataset after you make the connection in your model
* With the October 2021 release, performance improvements were made with parallel execution of model queries, and smart caching

## Considerations and limitations

There are a few **considerations** to keep in mind when using **DirectQuery for Power BI datasets and Analysis Services**:

- If you refresh your data sources, and there are errors with conflicting field or table names, Power BI resolves the errors for you.

- You cannot edit, delete or create new relationships in the same Power BI dataset or Analysis Services source. If you have edit access to these sources, you can make the changes directly in the data source instead.

- To build reports in the Power BI service on a composite model that's based on another dataset, all credentials must be set. On the refresh credential settings page, for Analysis Services sources, the following error will appear, even though the credentials have been set:
    
    ![Credentials false warning](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-06.png)
    As this is confusing and incorrect, this is something we'll take care of soon.

- Build permissions are required to view reports built using this feature when one or more datasets in the chain are in Pro workspaces. If the creator a report has left the company or their Build permissions has been revoked since they created the report, Build permissions will also be required on all datasets in the chain. 

- To be able to make a DirectQuery connection to a Power BI dataset, your tenant needs to have ["Allow XMLA Endpoints and Analyze in Excel with on-premises datasets"](../admin/service-admin-portal-integration.md#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) enabled.

- Connections to a SQL Server 2022 and later Analysis Services server on-premises or IAAS require an [On-premises data gateway](/power-bi/connect-data/service-gateway-onprem) (Standard mode).

- All connections to remote Power BI Datasets models are made using single sign-on. Authenticating with [a service principal](../developer/embedded/embed-service-principal.md) isn't currently supported.

- For premium capacities, the ["XMLA endpoint" should be set to either "Read Only" or "Read/Write"](../enterprise/service-premium-connect-tools.md#enable-xmla-read-write).

- RLS rules will be applied on the source on which they're defined, but won't be applied to any other datasets in the model. RLS defined in the report won't be applied to remote sources, and RLS set on remote sources won't be applied to other data sources. Also, you can't define RLS on a table from another source group nor can you define RLS on a local table that has a relationship to another source group.

- KPIs, row level security, and translations won't be imported from the source in this preview release.

- You may see some unexpected behavior when using a date hierarchy. To resolve this issue, use a date column instead. After adding a date hierarchy to a visual, you can switch to a date column by clicking on the down arrow in the field name, and then clicking on the name of that field instead of using *Date Hierarchy*:

    ![Unexpected date hierarchy behavior](media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-07.png)

    For more information on using date columns versus date hierarchies, visit [this article](../transform-model/desktop-auto-date-time.md).

- You may see unuseful error messages when using AI features with a model that has a DirectQuery connection to Analysis Services. 

- Using ALLSELECTED with a DirectQuery source results in incomplete results.

- Filters and relationships:
    - A filter applied from a data source to a table from another DirectQuery source can only be set on a single column

    - Cross-filtering two tables in a DirectQuery source by filtering them with a table outside of the source isn't a recommended design, and isn't supported.

    - A filter can only touch a table once. Applying the same filter to a table twice, through one of more tables outside of the DirectQuery source, isn't supported.

- During preview, the maximum length of a chain of models is three. Extending beyond the chain length of three isn't supported and results in errors. 

- A *discourage chaining* flag can be set on a model to prevent a chain from being created or extended. See [Manage DirectQuery connections to a published dataset](desktop-discourage-directquery-connections-to-dataset.md) for more information.

- The connection to a Power BI dataset won't be shown in Power Query.

There are also a few **limitations** you need to keep in mind:

- Parameters for database and server names are currently disabled. 

- Defining RLS on tables from a remote source isn't supported.

- Using any of the following sources as a DirectQuery source isn't supported:
  - SQL Server Analysis Services (SSAS)
  - SAP HANA
  - SAP Business Warehouse
  - [Real-time datasets](service-real-time-streaming.md#types-of-real-time-datasets)
  - [Sample Datasets](../create-reports/sample-datasets.md#eight-original-samples)
  - [Excel Online Refresh](refresh-excel-file-onedrive.md)
  - Import Excel / CSV files
  - [Usage metrics (My workspace)](../collaborate-share/service-usage-metrics.md) 

- Using DirectQuery on datasets from “My workspace” isn't currently supported. 

- Using Power BI Embedded with datasets that include a DirectQuery connection to an Azure Analysis Services model isn't currently supported.

- Publishing a report to web using the [publish to web feature](../collaborate-share/service-publish-to-web.md) isn't supported.

- Calculation groups on remote sources aren't supported, with undefined query results.

- Calculated tables aren't supported in the Service using this feature. Attempting to perform a refresh on a dataset with a calculated table or a calculated column that references a DirectQuery data source will result in a "Single sign-on (SSO) credential isn't provided" error message.

- If you rename a workspace after the DirectQuery connection has been set up you'll need to update the data source in Power BI Desktop for the report to continue working.

- Automatic page refresh (APR) is only supported for some scenarios, depending on the data source type. See the article [Automatic page refresh in Power BI](../create-reports/desktop-automatic-page-refresh.md) for more information.

- Take over of a dataset that is using the **DirectQuery to other datasets** feature isn't currently supported.

- [As with any DirectQuery data source](desktop-directquery-about.md#reporting-limitations), hierarchies defined in an Analysis Services model or Power BI dataset won't be shown when connecting to the model or dataset in DirectQuery mode using Excel. 

- **Use low-cardinality columns in cross source group relationships**: When you create a relationship across two different source groups, the columns participating in the relationship (also called the *join* columns) should have low cardinality, ideally 50,000 or less. This consideration applies to non-string key columns; for string key columns, see the following consideration. 

- **Avoid using large strings key columns in cross source group relationships**: When creating a cross source group relationship, avoid using large string columns as the relationship columns, especially for columns that have larger cardinality. When you must use strings columns as the relationship column, calculate the expected string length for the filter by multiplying cardinality (C) by the average length of the string column (A). Make sure the expected string length is below 250,000, such that *A ∗ C < 250,000*.




### Tenant considerations

Any model with a DirectQuery connection to a Power BI dataset or to Analysis Services must be published in the same tenant, which is especially important when accessing a Power BI dataset or an Analysis Services model using B2B guest identities, as depicted in the following diagram. See [Guest users who can edit and manage content](../enterprise/service-admin-azure-ad-b2b.md#guest-users-who-can-edit-and-manage-content) to find the tenant URL for publishing.  

Consider the following diagram. The numbered steps in the diagram are described in paragraphs that follow.

:::image type="content" source="media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-08.png" alt-text="Diagram of not connecting between tenants":::

In the diagram, Ash works with Contoso and is accessing data provided by Fabrikam. Using Power BI Desktop, Ash creates a DirectQuery connection to an Analysis Services model that is hosted in Fabrikam’s tenant. 

To authenticate, Ash uses a B2B Guest user identity (step 1 in the diagram). 

If the report is published to Contoso’s Power BI service (step 2), the dataset published in the Contoso tenant *cannot* successfully authenticate against Fabrikam’s Analysis Services model (step 3). As a result, the report won't work. 

In this scenario, since the Analysis Services model used is hosted in Fabrikam’s tenant, the report also must be published in Fabrikam's tenant. After successful publication in Fabrikam’s tenant (step 4) the dataset can successfully access the Analysis Services model (step 5) and the report will work properly.

### Composite models with DirectQuery connection to source models protected by object-level security

When a composite model gets data from a Power BI dataset or Analysis Services via DirectQuery, and that source model is secured by object-level security, consumers of the composite model may notice unexpected results. The following section explains how these results might come about.

Object-level security (OLS) enables model authors to hide objects that make up the model schema (that is, tables, columns, metadata, etc.) from model consumers (for example, a report builder or a composite model author). In configuring OLS for an object, the model author creates a role, and then removes access to the object for users who are assigned to that role. From the standpoint of those users, the hidden object simply doesn't exist.

OLS is defined for and applied on the source model. It cannot be defined for a composite model built on the source model.

When a composite model is built on top of an OLS-protected Power BI dataset or Analysis Services model via DirectQuery connection, the model schema from the source model is actually copied over into the composite model. What gets copied depends on what the composite model author is permitted see in the source model according to the OLS rules that apply there. The data itself isn't copied over to the composite model – rather, it's always retrieved via DirectQuery from the source model when needed. In other words, data retrieval always gets back to the source model, where OLS rules apply.

Since the composite model isn't secured by OLS rules, the objects that consumers of the composite model see are those that the composite model author could see in the source model rather than what they themselves might have access to. This might result in the following situations

* Someone looking at the composite model might see objects that are hidden from them in the source model by OLS.
* Conversely, they might NOT see an object in the composite model that they CAN see in the source model, because that object was hidden from the composite model author by the OLS rules controlling access to the source model.

An important point is that in spite of the case described in the first bullet, consumers of the composite model will never see actual data they aren't supposed to see, because the data isn't actually located in the composite model. Rather, because of DirectQuery, it's retrieved as needed from the source dataset, where OLS blocks unauthorized access.

With this background in mind, consider the following scenario.

![Diagram showing what happens when a composite model connects to a source model protected by object-level security via Direct Query.](media/desktop-directquery-datasets-azure-analysis-services/directquery-ols-composite-model-interaction.png)

1. Admin_user has published an enterprise semantic model using a Power BI dataset or an Analysis Services model that has a Customer table and a Territory table. Admin_user publishes the dataset to the Power BI service and sets OLS rules that have the following effect:
    * Finance users can't see the Customer table
    * Marketing users can't see the Territory table

1. Finance_user publishes a dataset called "Finance dataset" and a report called "Finance report" that connects via DirectQuery to the enterprise semantic model published in step 1. The Finance report includes a visual that uses a column from the Territory table.

1. Marketing_user opens the Finance report. The visual that uses the Territory table is displayed, but returns an error, because when the report is opened, DirectQuery tries to retrieve the data from the source model using the credentials of the Marketing_user, who is blocked from seeing the Territory table as per the OLS rules set on the enterprise semantic model.

1. Marketing_user creates a new report called "Marketing Report" that uses the Finance dataset as its source. The field list shows the tables and columns that Finance_user has access to. Hence, the Territory table is shown in the fields list, but the Customer table is not. However, when the Marketing_user tries to create a visual that leverages a column from the Territory table, an error is returned, because at that point DirectQuery tries to retrieve data from the source model using Marketing_user's credentials, and OLS rules once again kick in and block access. The same thing happens when Marketing_user creates a new dataset and report that connect to the Finance dataset with a DirectQuery connection – they see the Territory table in the fields list, since that is what Finance_user could see, but when they try to create a visual that leverages that table, they'll be blocked by the OLS rules on the enterprise semantic model.

1. Now let's say that Admin_user updates the OLS rules on the enterprise semantic model to stop Finance from seeing the Territory table.

1. Only when the Finance dataset is refreshed will the updated OLS rules be reflected in it. Thus, when the Finance_user refreshes the Finance dataset, the Territory table will no longer be shown in the fields list, and the visual in the Finance report that uses a column from the Territory table will return an error for Finance_user, because they're now not allowed to access the Territory table.

To sum up:

* Consumers of a composite model see the results of the OLS rules that were applicable to the author of the composite model when they created the model. Thus, when a new report is created based on the composite model, the field list will show the tables that the author of the composite model had access to when they created the model, regardless of what the current user has access to in the source model.
* OLS rules can't be defined on the composite model itself.
* A consumer of a composite model will never see actual data they aren't supposed to see, because relevant OLS rules on the source model will block them when DirectQuery tries to retrieve the data using their credentials.
* If the source model updates its OLS rules, those changes will only affect the composite model when it's refreshed.  

### Loading a subset of tables from a Power BI dataset or Analysis Services model
When connecting to a Power BI dataset or Analysis Services model using a DirectQuery connection, you can decide which tables to connect to. You can also choose to automatically add any table that might get added to the dataset or model after you make the connection to your model. When you connect to a perspective your model will contain all tables in the dataset or model and any tables not included in the perspective will be hidden. Moreover, any table that might get added to the perspective will be added automatically.
This dialog won't be shown for live connections.

>[!NOTE]
>This dialog will only show if you add a DirectQuery connection to a Power BI dataset or Analysis Services model to an existing model. You can also open this dialog by changing the DirectQuery connection to the Power BI dataset or Analysis Services model in the Data source settings after you created it.

:::image type="content" source="media/desktop-directquery-datasets-azure-analysis-services/directquery-datasets-subset.png" alt-text="Dialog that allows specifying what tables to load from a Power BI dataset or Analysis Services model.":::

## Next steps

For more information about DirectQuery, check out the following resources:

- [Use DirectQuery in Power BI Desktop](desktop-use-directquery.md)
- [DirectQuery models in Power BI Desktop](desktop-directquery-about.md)
- [DirectQuery model guidance in Power BI Desktop](../guidance/directquery-model-guidance.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
