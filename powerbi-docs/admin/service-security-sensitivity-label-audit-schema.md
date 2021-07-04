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
* Better name for "member"?
* What to call the ? column for Activity
* RecordType, UserType also have numbers - we are not responsible? Link?
* Some questions about Word doc: why do we need SensitivityLabelEventData?
* Need some description at the top. Do we need description for each item (i.e. ActionSource, etc.)?

## ActionSource
|Value |Member  |Description  |
|---------|---------|---------|
|2|Auto||
|3|Manual||

## ActionSourceDetail
|Value |Member  |Description  |
|---------|---------|---------|
|0|None||
|3|AutoByInheritance||
|4|AutoByDeploymentPipeline||
|5|PublicAPI||

## Activity
|?|Description|
|---------|---------|
|SensitivityLabelApplied||
|SensitivityLabelChanged||
|SensitivityLabelRemoved|| 


## ArtifactType
|Value |Member  |Description  |
|---------|---------|---------|
|1|Dashboard||
|2|Report||
|3|Dataset||
|7|Dataflow||

## LabelEventType
|Value |Member  |Description  |
|---------|---------|---------|
|1|LabelUpgraded|| 
|2|LabelDowngraded||
|3|LabelRemoved||
|4|LabelChangedSameOrder||

## SensitivityLabelEventData
|Field|Type|Required|Valid Options|
|---------|---------|---------|---------|
|SensitivityLabelId|Edm.Guid||
|OldSensitivityLabelId|Edm.Guid| |
|UserId|Edm.String|Yes||
|[ActionSource](#actionsource-enum)|Edm.Enum|Yes||
|[ActionSourceDetail](#actionsourcedetail-enum)|Edm.Enum|Yes| |	 
|[LabelEventType)](#labeleventtype-enum)|Edm.Enum|Yes||

## Next steps
* [Sensitivity labels in Power BI](./service-security-sensitivity-label-overview.md)