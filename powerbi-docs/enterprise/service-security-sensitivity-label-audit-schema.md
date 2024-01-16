---
title: Sensitivity label audit schema
description: Learn how changes to sensitivity labels are recorded and logged so that you can track them in the unified audit log or Power BI activity log. 
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 07/03/2021
LocalizationGroup: Data from files
---
# Audit schema for sensitivity labels in Power BI

Whenever a sensitivity label on a semantic model, report, dashboard, or dataflow is applied, changed, or removed, that activity is recorded in the audit log for Power BI. You can track these activities in the unified audit log or in the Power BI activity log. For more information, see [Track user activities in Power BI](../admin/service-admin-auditing.md).

This article documents the information in the Power BI auditing schema that's specific to sensitivity labels. It covers the following activity keys:

* SensitivityLabelApplied
* SensitivityLabelChanged
* SensitivityLabelRemoved

## SensitivityLabelEventData

|Field|Type|Must appear in the schema|Description|
|---------|---------|---------|---------|
|SensitivityLabelId|Edm.Guid||The guid of the new label. This field is only present when the activity key is SensitivityLabelApplied or SensitivityLabelChanged.|
|OldSensitivityLabelId|Edm.Guid||The guid of the label on the item before the action. This field is only present when the activity key is SensitivityLabelChanged or SensitivityLabelRemoved.|
|[ActionSource](#actionsource)|Edm.Enum|Yes|This field indicates whether the label change is the result of an automatic or manual process.|
|[ActionSourceDetail](#actionsourcedetail)|Edm.Enum|Yes|This field gives more detail about what caused the action to take place.|
|[LabelEventType](#labeleventtype)|Edm.Enum|Yes|This field indicates whether the action resulted in a more restrictive label, less restrictive label, or a label of the same degree of sensitivity.|

## ArtifactType

This field indicates the type of item the label change took place on.

|Value |Field  |
|--|---------|
|1|Dashboard|
|2|Report|
|3|Semantic model|
|7|Dataflow|

## ActionSource

This field indicates whether the label change is the result of an automatic or manual process.

|Value |Meaning  |Description  |
|--|---------|---------|
|2|Auto|An automatic process performed the action.|
|3|Manual|A manual process performed the action.|

## ActionSourceDetail

This field gives more detail about what caused the action to take place.

|Value |Meaning  |Description  |
|--|---------|---------|
|0|None|There are no other details.|
|3|AutoByInheritance|The label change took place as a result of an automatically triggered inheritance process.|
|4|AutoByDeploymentPipeline|The label change took place automatically as a result of the deployment pipeline process.|
|5|PublicAPI|The label change action was performed by one of the following Power BI public admin REST APIs: [setLabels](/rest/api/power-bi/admin/information-protection-set-labels-as-admin), [removeLabels](/rest/api/power-bi/admin/information-protection-remove-labels-as-admin).|

## LabelEventType

This field indicates whether the action resulted in a more restrictive label, less restrictive label, or a label of the same degree of sensitivity.

|Value |Meaning  |Description  |
|--|---------|---------|
|1|LabelUpgraded|A more restrictive label was applied to the item.|
|2|LabelDowngraded|A less restrictive label was applied to the item.|
|3|LabelRemoved|The label was removed from the item.|
|4|LabelChangedSameOrder|The label was replaced by another label with the same level of sensitivity.|

## Related content

* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)
* [Track user activities in Power BI](../admin/service-admin-auditing.md)
