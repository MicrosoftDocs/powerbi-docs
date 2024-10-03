---
title: Control access to datamarts (preview)
description: Learn how to control access to datamarts in Power BI, including setting workspace roles, viewer restrictions, and configuring row-level security.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 09/30/2024
LocalizationGroup: Data from files
ms.custom: FY25Q1-Linter
#customer intent: As a Power BI user I want to learn how to control access to datamarts.
---

# Control access to datamarts

This article describes access control to datamarts, including row level security, rules in Power BI Desktop, and how datamarts might become inaccessible or unavailable.

## Workspace roles

Assigning users to the various workspace roles provides the following capabilities with respect to Datamarts:

| Workspace role   |  Description |
|---|---|
|**Admin**|Grants the user permissions to ingest data through a dataflow, write SQL and visual queries, and update the model or semantic model (create relationships, create measures etc.)|
|**Member**|Grants the user permissions to ingest data through a dataflow,  write SQL and visual queries, and  update the model or semantic model (create relationships, create measures etc.)|
|**Contributor**|Grants the user permissions to ingest data through a dataflow, write SQL and visual queries, and update the model or semantic model (create relationships, create measures etc.) |
|**Viewer**|Grants the user permissions to write SQL and visual queries and access the “Model view” in read-only mode. For more information, see [Viewer restrictions](#viewer-restrictions).|

## Viewer restrictions

The Viewer role is a more limited role in comparison with the other workspace roles.  In addition to fewer SQL permissions given to viewers, there are more restricted actions.

| Feature | Limitation |
|---|---|
|**Settings**|Viewers have read-only access, so they can't rename datamart, add description, or change sensitivity label.|
|**Model view**|Viewers have read-only mode on the Model view.|
|**Run queries**|Viewers don't have full DML/DDL capabilities unless granted specifically. Viewers can read data using SELECT statement in SQL query editor and use all tools in the toolbar in the Visual query editor. Viewers can also read data from Power BI Desktop and other SQL client tools.|
|**Analyze in Excel**|Viewers don't have permission to Analyze in Excel.|
|**Manually update semantic model**|Viewers can't manually update the default semantic model to which the datamart is connected.|
|**New measure**|Viewers don't have permission to create measures.|
|**Lineage view**|Viewers don't have access to reading the lineage view chart.|
|**Share/Manage permissions**|Viewers don't have permission to share datamarts with others.|
|**Create a report**|Viewers don't have access to create content within the workspace and hence can't build reports on top of the datamart.|

## Row level security

Row-level security (RLS) can be used to restrict data access for specified users to a datamart. Filters restrict data access at the row level, and you can define filters within roles. In the Power BI service, members of a workspace have access to datamarts in the workspace, and RLS doesn't restrict such data access.

You can configure RLS for datamarts in the **Datamart editor**. The configured RLS on datamarts automatically gets applied to downstream items, including the auto-generated semantic models and reports.

> [!NOTE]
> Datamarts use the enhanced row-level security editor, which means that not all row-level security filters supported in Power BI can be defined. Limitations include expressions that today can only be defined using DAX including dynamic rules such as USERNAME() or USERPRINCIPALNAME(). To define roles using these filters switch to use the DAX editor.

### Define Row Level Security (RLS) roles and rules for Datamarts

To define RLS roles, take the following steps:

1. Open your datamart and select **Manage Roles** from the ribbon.
    :::image type="content" source="media/datamarts-access-control/datamarts-access-control-02.png" alt-text="Screenshot of the manage roles ribbon button." lightbox="media/datamarts-access-control/datamarts-access-control-02.png":::

2. Create new RLS roles using the **Row security settings** window. You can define a combination of filters on tables and select **Save** to save the role.
    :::image type="content" source="media/datamarts-access-control/datamarts-access-control-03.png" alt-text="Screenshot of the row security settings window." lightbox="media/datamarts-access-control/datamarts-access-control-03.png":::

3. Once the role is saved, select **Assign** to add users to the role. Once assigned, select **Save** to save the role assignments and close the RLS settings modal.
    :::image type="content" source="media/datamarts-access-control/datamarts-access-control-04.png" alt-text="Screenshot of the row security settings selections.":::

To validate the roles created, take the following steps:

1. Select the **View as** button from the ribbon.
    :::image type="content" source="media/datamarts-access-control/datamarts-access-control-05.png" alt-text="Screenshot of the view as ribbon button." lightbox="media/datamarts-access-control/datamarts-access-control-05.png":::

2. Select the role to be validated by selecting the check box for the role, then select **OK**.
    :::image type="content" source="media/datamarts-access-control/datamarts-access-control-06.png" alt-text="Screenshot of the manage view as role window.":::

3. The data view shows the access that the selected role has.
    :::image type="content" source="media/datamarts-access-control/datamarts-access-control-07.png" alt-text="Screenshot of the view as results" lightbox="media/datamarts-access-control/datamarts-access-control-07.png":::

To revert to your access, select the **View as** button on the ribbon again, and select **None**.

:::image type="content" source="media/datamarts-access-control/datamarts-access-control-08.png" alt-text="Screenshot of the view as role window with none selected.":::

## How datamarts become unavailable

A datamart can get marked as an unavailable datamart when one of the following situations occurs.

**Situation 1:** When a Premium workspace is changed from Premium to non-premium, all datamarts in that workspace become unavailable. The **Datamart editor** becomes unavailable and downstream usage of the datamart and auto-generated semantic models is blocked. Users or administrators must upgrade the workspace to its original Premium capacity to restore datamarts.

**Situation 2:** When dataflow updates a datamart and associated semantic model, but due to a system lock the datamart or semantic model update is pending, the datamart becomes unavailable. The **Datamart editor** isn't accessible when a datamart goes into unavailable state. The **try again** action, shown in the following image, enables users to trigger synchronization between dataflow, datamart and semantic model. It can take a few minutes to complete the requested action but downstream consumption can be continued.

:::image type="content" source="media/datamarts-access-control/datamarts-access-control-01.png" alt-text="Screenshot of the request access setting.":::

**Situation 3:** When a Premium workspace is migrated to another Premium capacity in a different region, the datamart becomes unavailable with the error: "Unable to open the datamart because the workspace region has changed. To open the datamart, reconnect the workspace to the region connected when the datamart was created." This behavior is by design since the region where the datamarts were created must be the region where the workspace resides, and migrations aren't supported.

## Related content

This article provided information about controlling access to datamarts.

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Understand datamarts](datamarts-understand.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Create reports with datamarts](datamarts-create-reports.md)
* [Datamart administration](datamarts-administration.md)

For more information about dataflows and transforming data, see the following articles:

* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)
