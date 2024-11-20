---
title: Semantic model operation logs
description: View a set of GraphQL operation logs that you can query in your Fabric workspace monitoring database.
author: KesemSharabi
ms.author: kesharab
ms.service: powerbi
ms.topic: reference
ms.date: 11/20/2024

---

# Semantic model operations

Semantic model operation logs are part of the [workspace monitoring](/fabric/get-started/workspace-monitoring-overview) logs and are registered in the Eventhouse KQL database, which is part of the Real-Time Intelligence solution. You can use these logs to monitor the usage and performance of your workspace.

## Semantic model operation logs

Analysis services engine process events such as the start of a batch or transaction. For example, execute query and process partition. Typically used to monitor the performance, health and usage of Power BI's data engine. Contains information from the entire tenant.

Use semantic model logs to:

* Identify periods of high or unusual Analysis Services engine activity by capacity, workspace, report, or user.
* Analyze query performance and trends, including external DirectQuery operations.
* Analyze semantic model refresh duration, overlaps, and processing steps.
* Analyze custom operations sent using the Premium XMLA endpoint.

This table lists the semantic model logs. For more information on the events and drill-down into the `ExecutionMetrics` event, see [Events and schema](/power-bi/transform-model/log-analytics/desktop-log-analytics-configure#events-and-schema).

| ColumnName | ColumnType | Description |
|--|--|--|
| ApplicationContext | dynamic | Property bag of unique identifiers providing details about the application executing the request. For example, report ID. |
| ApplicationName | string | Contains the name of the client application that created the connection to the server. This column is populated with the values passed by the application rather than the displayed name of the program. |
| CallerIpAddress | string | Called IP address |
| CapacityId | string | Unique identifier of the capacity hosting the artifact being operated on. |
| Category | string | Category of the events, like Audit/Security/Request. |
| CorrelationId | string | The ID for correlated events. Can be used to identify correlated events between multiple tables. |
| CpuTimeMs | long | Amount of CPU time (in milliseconds) used by the event. |
| CustomerTenantId | string | Fabric tenant identifier |
| DatasetMode | string | The mode of the semantic model. Import, DirectQuery, or Composite. |
| DurationMs | long | Amount of time (in milliseconds) taken by the   operation. |
| EventText | string | Contains verbose information associated with the   operation, for example, DAX Query. |
| ExecutingUser | string | The user running the operation. |
| Identity | dynamic | Information about user and claims. |
| ItemId | string | Unique identifier of the resource logging the data. |
| ItemKind | string | Type of artifact logging the operation, for example, semantic model. |
| ItemName | string | The name of the Power BI artifact logging this   operation. |
| Level | string | Contains the severity level of the operation being logged. Success, informational, warning, or error. |
| OperationDetailName | string | More details about the operation |
| OperationId | string | Unique identifier of the operation or the request. Same as `XmlaRequestId` |
| OperationName | string | The operation associated with the log record. |
| ProgressCounter | long | Progress counter |
| Region | string | Contains the Fabric region |
| ReplicaId | string | Replica identifier that will let you identify the replica when Query Scale Out (QSO) is enabled. Read-write replica always has ReplicaId='AAA' and read-only replicas have ReplicaId starting 'AAB' onwards. For non-QSO enabled semantic models the ReplicaId is always 'AAA' |
| Status | string | Status of the operation. |
| StatusCode | int | Status code of the operation. It covers success and failure. |
| Timestamp | datetime | The timestamp (UTC) of when the log was generated. |
| User | string | The user associated with the running operation. Used when an end-user identity must be impersonated on the server. |
| WorkspaceId | string | Unique identifier of the workspace containing the item being operated on. |
| WorkspaceMonitoringTableName | string | Name of the table the events are available in Fabric Workspace monitoring |
| WorkspaceName | string | Name of the Fabric workspace containing the item. |
| XmlaObjectPath | string | Object path. A comma-separated list of parents, starting with the object's parent. |
| XmlaProperties | string | Properties of the XMLA request |
| XmlaSessionId | string | Analysis services session identifier |
