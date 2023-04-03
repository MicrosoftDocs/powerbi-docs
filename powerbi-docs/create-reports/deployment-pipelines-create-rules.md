---
title: Create deployment rules Power BI Application lifecycle management (ALM)
description: Learn how to create rules to simplify deploying content with the Power BI Application lifecycle management (ALM) tool
author: mberdugo
ms.author: monaberdugo
ms.topic: how-to
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1
ms.date: 12/31/2022
ms.search.form: Deployment rules
---

# Create deployment rules

When you're working in a deployment pipeline, different stages may have different configurations. For example, each stage can have different databases or different query parameters. The development stage might query sample data from the database, while the test and production stages query the entire database.

When you deploy content between pipeline stages, you can configure deployment rules to change the content while keeping some settings intact. For example, if you want a dataset in a production stage to point to a production database instead of one in the test stage, you can define a rule for this. The rule is defined in the production stage, under the appropriate dataset. Once the rule is defined, content deployed from test to production, will inherit the value as defined in the deployment rule, and will always apply as long as the rule is unchanged and valid.

You can configure data source rules and parameter rules. The following table lists the type of Power BI items you can configure rules for, and the type of rule you can configure for each one.

||Data source rule  |Parameter rule  |Details  |
|---------|---------|---------|---------|
|**Dataflow**         |![Applies to.](../media/yes.png) |![Applies to.](../media/yes.png) |Use to determine the values of the data sources or parameters for a specific dataflow. |
|**Dataset**          |![Applies to.](../media/yes.png) |![Applies to.](../media/yes.png) |Use to determine the values of the data sources or parameters for a specific dataset.         |
|**Datamart**          |![Applies to.](../media/yes.png) |![Applies to.](../media/yes.png) |Use to determine the values of the data sources or parameters for a specific datamart.         |
|**Paginated report** |![Applies to.](../media/yes.png) |![Does not apply to.](../media/no.png) |Defined for the data sources of each paginated report. You can use these rules to determine the data sources of the paginated report. |

>[!NOTE]
> Data source rules only work when you change data sources from the same type.

## Create a deployment rule

To create a deployment rule, follow the steps in this section. After you create all the deployment rules you need, deploy the datasets with the newly created rules from the source stage to the target stage where the rules were created. Your rules won't apply until you deploy the datasets from the source to the target stage.

1. In the pipeline stage you want to create a deployment rule for, select **Deployment rules**.

    :::image type="content" source="media/deployment-pipelines-get-started/deployment-settings-screenshot.png" alt-text="A screenshot of the deployment rules button, located in the deployment rules.":::

2. You can set rules to **dataflows**, **datasets**, **datamarts** and **paginated reports**. To find the Power BI item you want to set a rule for, use the search functionality or filter functionalities.

    :::image type="content" source="media/deployment-pipelines-get-started/deployment-rules.png" alt-text="A screenshot of the deployment rules pane, showing that you can set rules for dataflows, datasets, datamarts and paginated reports.":::

3. Select the dataflow, dataset, datamart or paginated report you want to create a rule for.

    :::image type="content" source="media/deployment-pipelines-get-started/deployment-rules-selection.png" alt-text="A screenshot of the deployment rules pane, showing two datasets in the datasets tab. To configure a rule, select an item from one of the tabs.":::

4. Select the type of rule you want to create, expand the list, and then select **Add rule**. There are two types of rules you can create:

    :::image type="content" source="media/deployment-pipelines-get-started/deployment-rule-types.png" alt-text="A screenshot of the deployment rules pane. It shows a selected dataset and the two rule types, data source and parameter, you can configure for it.":::

    * **Data source rules**

        From the data source list, select a data source name to be updated. Use one of the following methods to select a value to replace the one from the source stage:

        * Select from a list.

        * Select *Other* and manually add the new data source. You can only change to a data source from the same type.

        >[!NOTE]
        >
        >* *Data source rules* will be grayed out if you're not the owner of the Power BI item you're creating a rule for, or if your Power BI item doesn't contain any data sources.
        >* For *dataflows*, *datasets* and *paginated reports*, the data source list is taken from the source pipeline stage.
        >* You can’t use the same data source in more than one rule.

    * **Parameter rules** - Select a parameter from the list of parameters; the current value is shown. Edit the value to the value you want to take effect after each deployment.

## Supported data sources for dataflow and dataset rules

Data source rules can be defined for the following data sources:

* Azure Analysis Services (AAS)

* Azure Synapse

* SQL Server Analysis Services (SSAS)

* Azure SQL Server

* SQL server

* Odata Feed

* Oracle

* SapHana (import mode only; not direct query mode)

* SharePoint

* Teradata

For other data sources, we recommend [using parameters to configure your data source](deployment-pipelines-best-practices.md#use-parameters-in-your-model).

## Considerations and limitations

This section lists the limitations for the deployment rules.

* To create a deployment rule, you must be the owner of the dataflow, dataset or paginated report you're creating a rule for.

* Deployment rules can't be created in the development stage.

* When an item is removed or deleted, its rules are deleted too. These rules can't be restored.

* When you unassign and reassign a workspace to [reestablish connections](deployment-pipelines-troubleshooting.yml#how-do-i-reestablish-connections-after-deployment-), rules for that workspace are lost. To use these rules again, reconfigure them.

* Rules for dataflows that have other dataflows as sources, aren't supported.

* Data source rules for common data model (CDM) folders in a dataflow, aren't supported.

* Rules for datasets that use dataflows as their source, aren't supported.

* If the data source or parameter defined in a rule is changed or removed from the item it points to in the source stage, the rule won't be valid anymore, and deployment will fail.

* After you deploy a paginated report with a data source rule, you can't open the report using [Power BI Report Builder](../paginated-reports/report-builder-power-bi.md).

* Deployment rules only take effect the next time you deploy to that stage. However, if you create rules and then compare the stages before you deploy, the comparison is done based on the rules that were created even though they haven't taken effect yet.

>[!NOTE]
>Parameter rules aren't supported for paginated reports.

## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Assign a workspace to a pipeline stage](deployment-pipelines-assign.md)

>[!div class="nextstepaction"]
>[Deployment history](deployment-pipelines-history.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.yml)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
