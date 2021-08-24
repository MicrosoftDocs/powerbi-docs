---
title: Developing solutions with dataflows
description: Overview of how to develop solutions with dataflows
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 08/24/2021
LocalizationGroup: Data from files
---


# Developing solutions with dataflows

Power BI **dataflows** are an enterprise-focused data prep solution, enabling an ecosystem of data that's ready for consumption, reuse, and integration. This article provides guidance for common scenarios, with links to articles and other information that help you understand and use dataflows to their full potential.

## Getting access to Premium features of dataflows

Power BI dataflows in Premium capacities provide many key features that help achieve greater scale and performance for your dataflows, such as the following:

- Advanced compute, which accelerates ETL performance and provides DirectQuery capabilities
- Incremental refresh, which lets you load data that's changed from a source
- Linked Entities, which let you reference other dataflows
- Computed Entities, which allow you to build composable building blocks of dataflows that contain more business logic.

For these reasons, we recommend using dataflows in a Premium capacity whenever possible. Dataflows used in a Power BI Pro license can be used for simple, small scale use cases.

**Solution**

Getting access to these [Premium features of dataflows](dataflows-premium-features.md) is possible in two ways:

* Designate a **Premium Capacity** to a given Workspace and bring your own Pro license to author dataflows here
* Bring your own **Premium Per User (PPU)** License, which requires other members of the workspace to also possess a PPU license

You cannot consume PPU dataflows (or any other content) outside the PPU environment (such as in Premium or other skus or licenses).

For Premium capacities, your consumers of dataflows in Power BI Desktop don't need explicit licenses to consume and publish to Power BI, but to publish to a workspace or share a resulting dataset, you'll need at least a Pro license.

For Premium Per User, everyone creating or consuming PPU content must have a PPU license. This requirement varies from the rest of Power BI in that you need to explicitly license everyone with PPU and you cannot mix Free, Pro, or even Premium capacities with PPU content unless you migrate the workspace to a Premium capacity.

Choosing which model typically depends on your organization's size and goals, but the following guidelines apply:

| Team Type | Premium Capacity | Premium Per User |
| --- | --- | --- |
| > 5000 users | ✔ | |
| < 5000 users | | ✔ |

For small teams PPU can bridge the gap between Free, Pro and Premium Per Capacity, but for larger needs, using a Premium capacity with users who have Pro licenses is the best approach.

## Creating **end user dataflows** with security applied

Imagine you need to create dataflows for consumption but have security requirements:

:::image type="content" source="media/dataflows-develop-solutions/dataflows-develop-solutions-01.png" alt-text="Graphic describing scenario":::

In this scenario, you likely have two types of workspaces:

- Backend workspaces where you develop dataflows and build out the business logic
- End-user workspaces where you want to expose some dataflows or tables to a particular group of users for consumption

  - End-user workspace contains linked tables that point to the dataflows in the backend workspace
  - End users have viewer access to the consumer workspace, and no access to the backend workspace
  - When an end user uses Power BI Desktop to access a dataflow in the end-user workspace, they can see the dataflow but the dataflow appears empty in the Navigator, so the linked tables do not show


**Understanding Linked Tables**

Linked tables are simply a pointer to the original dataflow tables and they inherit the permission of the source. If Power BI allowed the linked table to use the destination permission, any user would be able to circumvent the source permission by creating a linked table in the destination pointing to the source.

### Solution: Use Computed Tables

If you have access to Power BI Premium, you can create a computed table in the destination that refers to the linked table, which will have a copy of the data from the linked table (minus any columns you want to remove through projections and rows you want to remove through filters). The user with permission on the destination workspace can access data through this table. In addition, lineage for privileged individuals will show the referenced workspace and allow users to link back to fully understand the parent dataflow. For those users who are not privileged, privacy is still respected and only the name of the workspace is shown.

The following diagram illustrates this setup. On the left is the architectural pattern, on the right is an example showing sales data split and secured by region

:::image type="content" source="media/dataflows-develop-solutions/dataflows-develop-solutions-02.png" alt-text="Graphic describing using linked tables and dataflows":::

## Reducing Refresh Times for dataflows

Imagine you have a large dataflow, but you want to build datasets off of that dataflow and decrease the time required to refresh it. Typically, refreshes take a long time to complete from the data source > dataflow > dataflow > dataflow > dataset, making it difficult to manage or maintain.

### Solution: Use Tables with Enable Load explicitly configured for referenced tables – do not disable load

It is important to note that Power BI does support simple orchestration for dataflows, as defined in [understanding and optimizing dataflows refresh](dataflows-understand-optimize-refresh.md#orchestration). However, taking advantage of this requires explicitly having any downstream dataflows configured to *Enable Load*.

Disabling load typically is appropriate only when the overhead of loading more queries cancels the benefit of the entity with which you're developing.

While disabling load means Power BI doesn't evaluate that given query, when used as ingredients - that is, referenced in other dataflows - it also means that Power BI does not treat it as an existing table where we can provide a pointer to and perform folding and query optimizations. In this sense, performing transformations such as a join or merge is merely a join/merge of two data source queries. Such operations can have a negative impact on performance as Power BI must fully reload already computed logic again, and then apply any additional logic. To simplify the query processing of your dataflow and ensure any engine optimizations are taking place, enable load and ensure that the compute engine in Power BI Premium dataflows is set at the default setting, which is **Optimized**.

It's also important to note that enabling load also enables you to keep the complete view of lineage, since Power BI considers a non-enabled load dataflow as a new item. If lineage is important to you, do not disable load for entities or dataflows connected to other dataflows.

## Reducing Refresh Times for Datasets

Imagine you have a dataflow that is large, but you want to build datasets off of this and decrease the orchestration. Refreshes take a long time to complete from the data source > dataflow(s) > dataset(s), adding increased latency.

### Solution: Use DirectQuery dataflows

DirectQuery can be used whenever a workspace's Enhanced Compute Engine (ECE) setting is configured explicitly to **On**, which is helpful when you have data that doesn't need to be loaded directly into a Power BI model. If you're configuring the ECE to be **On** for the first time, the changes allowing DirectQuery will occur during next refresh, so you need to refresh it when you enable it to have changes take place immediately. Refreshes on the initial dataflow load can be slower as Power BI writes data to both storage and a managed SQL engine. 

To summarize, using DirectQuery with dataflows enables the following enhancements to your Power BI and dataflows processes:

- **Avoid separate refresh schedules** DirectQuery connects directly to a dataflow, removing the need to create an imported dataset. As such, using DirectQuery with your dataflows means you no longer need separate refresh schedules for the dataflow and the dataset to ensure your data is synchronized.

- **Filtering data** DirectQuery is useful for working on a filtered view of data inside a dataflow. If you want to filter data, and thereby work with a smaller subset of the data in your dataflow, you can use DirectQuery (and the Enhanced Compute Engine) to filter dataflow data and work with the filtered subset you need.

Generally, using DirectQuery will trade up-to-date data in your dataset with slower report performance compared to import mode. Consider this approach only when your use case requires low latency data coming from your dataflow, the dataflow data is large, an import would be too time consuming, and you're willing to trade cached performance for up-to-date data.

### Solution: Use the Dataflow connector to enable query folding and incremental refresh for import

The unified Dataflows connector can significantly reduce evaluation time for steps performed over computed entities such as performing joins, distinct, filters, and group by operations. There are two specific benefits:

- Downstream users connecting to the Dataflows connector in Power BI Desktop can take advantage of better performance in authoring scenarios because the new connector supports query folding.
- Dataset refresh operations can also fold to the enhanced compute engine, meaning even incremental refresh from a dataset can fold to a dataflow, improving refresh performance and potentially decreasing latency between refresh cycles. 

To enable this feature for any Premium Dataflow, make sure the [compute engine](dataflows-premium-features.md#the-enhanced-compute-engine) is explicitly set to **On**. Then use the Dataflows connector in Power BI Desktop. You must be using the August 2021 version of Power BI Desktop or later to take advantage of this feature.

For existing solutions, you must be on a Premium or Premium Per User subscription. You may also need to make some changes to your dataflow to take advantage of the Enhanced Compute Engine by updating any existing Power Query queries to use the new connector by replacing `"PowerBI.Dataflows”` in the **Source** section with `“PowerPlatform.Dataflows”`.

## Complex dataflow authoring in Power Query

Imagine you have a dataflow that is millions of rows of data, but you want build complex business logic and transformations with it. Addition to following best practices for working with large dataflows, you need the dataflow previews to perform quickly. However you have dozens of columns and millions of rows of data.

### Solution: Use Schema View

You can [use Schema view](/power-query/schema-view), which is designed to optimize your flow when working on schema level operations by putting your query's column information front and center. Schema view provides contextual interactions to shape your data structure, and lower latency operations as it only requires the column metadata to be computed and not the complete data results.

## Working with bigger data sources

Imagine you run a query on the source system, but you don't want to provide direct access to the system or democratize access. You plan to put this in a dataflow.

### Solution 1: Use a View for the query or optimize the query

Using an optimized data source and query is your best option. Often, the data source operates best with queries intended for it, and Power Query has advanced query folding capabilities to delegate these workloads. Power BI also provides step folding indicators in Power Query Online. You can read more about types of indicators in the [step folding indicators documentation](/power-query/step-folding-indicators).

### Solution 2: Use Native Query

You can also use the [Value.NativeQuery()](/powerquery-m/value-nativequery) M function that allows you to do this by setting *EnableFolding=true* in the third parameter. It's documented [here](/power-query/connectors/postgresql) for the Postgres connector and it also works for the SQL Server connector.

### Solution 3: Break the dataflow into ingestion and consumption dataflows to take advantage of the enhanced compute engine and Linked Entities.

Breaking a dataflow into separate ingestion and consumption dataflows allows you to take advantage of the Enhanced Compute Engine, and Linked Entities. You can learn more about this  pattern and others in our [best practices documentation](dataflows-best-practices.md).

## Ensuring customers use dataflows whenever possible

Imagine you have many dataflows that serve common purposes, such as conformed dimensions (customers, data table, products, geographies). Dataflows are already available in the ribbon for Power BI. Ideally, you want customers primarily using the dataflows you have created.

### Solution: Use Endorsement to certify and promote dataflows

You can learn more about how endorsement works in the following article: [Endorsement - promoting and certifying Power BI content](../../collaborate-share/service-endorsement-overview.md).

## Programmability and automation in Power BI dataflows

Imagine you have business requirements to automate imports, exports, or refreshes, and additional orchestration and actions outside of Power BI. You have a few options to enable doing so, described in the following table:

| **Type** | **Mechanism** |
| --- | --- |
| Use the [PowerAutomate templates](/power-query/dataflows/dataflow-power-automate-connector-templates) | No-code |
| Use [automation scripts in PowerShell](https://github.com/microsoft/powerbi-powershell/tree/master/examples/dataflows) | Automation Scripts |
| Build your own business logic using [the APIs](/rest/api/power-bi/dataflows) | Rest API |

For more information about refresh, see [understanding and optimizing dataflows refresh](dataflows-understand-optimize-refresh.md)

## Ensuring you protect data assets downstream

You can use Sensitivity Labels to apply a data classification and any rules you have configured on downstream artifacts connecting to your dataflows. To learn more about Sensitivity Labels, take a look at [Microsoft Information Protection sensitivity labels in Power BI](../../admin/service-security-sensitivity-label-overview.md). You can review inheritance in the [Sensitivity label downstream inheritance in Power BI](../../admin/service-security-sensitivity-label-downstream-inheritance.md) article.


## Multi-Geo Support

Many customers today have a need to meet data sovereignty and residency requirements. You can complete a manual configuration to your dataflows workspace to be multi-geo. 

Dataflows support multi-geo when using the bring your own storage account feature, described in [configuring dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md). It's important to know that the workspace must be empty prior to attach for this capability. With this specific configuration, you can store dataflow data in specific geo regions as you choose.

## Ensuring you protect data assets behind a VNET

Many customers today have a need to secure your data assets behind a private endpoint. To do so, use VNETs and a Gateway to stay compliant. The following table describes the current VNET support and explains how to use dataflows to stay compliant and protect your data assets:

| **Scenario** | **Status** |
| --- | --- |
| Read VNet data sources through On-prem Gateway | Supported through On-prem Gateway |
| Write data to ADLS account behind VNet using On-prem Gateway | Not yet supported |


## Next steps
The following articles provide more information about dataflows and Power BI:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Creating a dataflow](dataflows-create.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows limitations and considerations](dataflows-features-limitations.md)
* [Dataflows best practices](dataflows-best-practices.md)
