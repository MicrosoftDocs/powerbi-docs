---
title: Sensitivity label audit schema
description: Find 
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: reference
ms.date: 07/03/2021
LocalizationGroup: Data from files
---
# Sensitivity label audit schema

This article documents the auditing schema for the following activity keys:
* SensitivityLabelApplied
* SensitivityLabelChanged
* SensitivityLabelRemoved

Need some kind of description of what this is and isn't, plus links to other data
Questions:
* [Better name for "member"](https://docs.microsoft.com/office/office-365-management-api/office-365-management-activity-api-schema#enum-auditlogrecordtype---type-edmint32)? 
* What to call the ? column for Activity
* RecordType, UserType also have numbers - we are not responsible? Link?
* Some questions about Word doc: why do we need SensitivityLabelEventData? What is valid options?
* Need some description at the top. Do we need description for each item (i.e. ActionSource, etc.)?

## SensitivityLabelEventData
|Field|Type|Must appear in the schema|Description|
|---------|---------|---------|---------|
|SensitivityLabelId|Edm.Guid||The guid of the new label. This field is only present when the activity key is SensitivityLabelApplied or SensitivityLabelChanged.|
|OldSensitivityLabelId|Edm.Guid||The guid of the label on the artifact before the action. This field is only present when the activity key is SensitivityLabelChanged or SensitivityLabelRemoved.|
|[ActionSource](#actionsource)|Edm.Enum|Yes|This field indicates whether the label change is the result of a automatic or manual process.|
|[ActionSourceDetail](#actionsourcedetail)|Edm.Enum|Yes|This field gives more detail about what caused the action to take place.|	 
|[LabelEventType](#labeleventtype)|Edm.Enum|Yes|This field indicates whether the action resulted in a more restrictive label, less restrictive label, or a label of the same degree of sensitivity.|

## ArtifactType
|Value |Field  |
|--|---------|
|1|Dashboard|
|2|Report|
|3|Dataset|
|7|Dataflow|

## ActionSource
|Value |Meaning  |Description  |
|--|---------|---------|
|2|Auto|An automatic process performed the action.|
|3|Manual|A manual process performed the action.|

## ActionSourceDetail
|Value |Meaning  |Description  |
|---------|---------|---------|
|0|None|There are no additional details.|
|3|AutoByInheritance|The label change took place as a result of automatically triggered inheritance process|
|4|AutoByDeploymentPipeline|The label change took place as a result automatically as a result of deployment pipeline process|
|5|PublicAPI|The label change action was performed by one of the following Power BI public admin REST APIs: [setLabels](https://docs.microsoft.com/rest/api/power-bi/admin/information-protection-set-labels-as-admin), [removeLabels](https://docs.microsoft.com/rest/api/power-bi/admin/information-protection-remove-labels-as-admin).|

## LabelEventType
|Value |Meaning  |Description  |
|---------|---------|---------|
|1|LabelUpgraded|A more restrictive label was applied to the artifact.| 
|2|LabelDowngraded|A less restrictive label was applied to the artifact.|
|3|LabelRemoved|The label was removed from the artifact.|
|4|LabelChangedSameOrder|The label was replaced by another label with the same level of sensitivity.|

## Next steps
* [Sensitivity labels in Power BI](./service-security-sensitivity-label-overview.md)