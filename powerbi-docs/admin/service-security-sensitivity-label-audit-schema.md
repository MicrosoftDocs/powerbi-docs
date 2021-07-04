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

Need some kind of description of what this is and isn't, plus links to other data
Questions:
* [Better name for "member"](https://docs.microsoft.com/office/office-365-management-api/office-365-management-activity-api-schema#enum-auditlogrecordtype---type-edmint32)? 
* What to call the ? column for Activity
* RecordType, UserType also have numbers - we are not responsible? Link?
* Some questions about Word doc: why do we need SensitivityLabelEventData? What is valid options?
* Need some description at the top. Do we need description for each item (i.e. ActionSource, etc.)?

## ActionSource
|Value |Member name  |Description  |
|--|---------|---------|
|2|Auto|An automatic process performed the action.|
|3|Manual|A manual process performed the action.|

## ActionSourceDetail
|Value |Member name  |Description  |
|---------|---------|---------|
|0|None|?|
|3|AutoByInheritance|The label change took place as a result of automatically triggered inheritance process|
|4|AutoByDeploymentPipeline|The label change took place as a result of automatically triggered inheritance process|
|5|PublicAPI|The label change action was performed by a public API.|

## Activity
|?|Description|
|---------|---------|
|SensitivityLabelApplied||
|SensitivityLabelChanged||
|SensitivityLabelRemoved|| 


## ArtifactType
|Value |Member name  |
|--|---------|
|1|Dashboard|
|2|Report|
|3|Dataset|
|7|Dataflow|

## LabelEventType
|Value |Member name  |Description  |
|---------|---------|---------|
|1|LabelUpgraded|A more restrictive label was applied to the artifact.| 
|2|LabelDowngraded|A less restrictive label was applied to the artifact.|
|3|LabelRemoved|The label was removed from the artifact.|
|4|LabelChangedSameOrder|?|

## SensitivityLabelEventData
|Field|Type|Required|Valid Options|
|---------|---------|---------|---------|
|SensitivityLabelId|Edm.Guid||
|OldSensitivityLabelId|Edm.Guid| |
|UserId|Edm.String|Yes||
|[ActionSource](#actionsource)|Edm.Enum|Yes||
|[ActionSourceDetail](#actionsourcedetail)|Edm.Enum|Yes| |	 
|[LabelEventType](#labeleventtype)|Edm.Enum|Yes||

## Next steps
* [Sensitivity labels in Power BI](./service-security-sensitivity-label-overview.md)