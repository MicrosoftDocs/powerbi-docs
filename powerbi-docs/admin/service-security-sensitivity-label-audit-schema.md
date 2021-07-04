---
title: Sensitivity label audit schema
description: Find 
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: Reference
ms.date: 07/03/2021
LocalizationGroup: Data from files
---
# Sensitivity label audit schema

Activity:SensitivityLabelApplied / SensitivityLabelChanged / SensitivityLabelRemoved 

ArtifactType: (Edm.Enum) 

## SensitivityLabelEventData
|Field|Type|Required|Valid Options|
|---------|---------|---------|---------|
|SensitivityLabelId|Edm.Guid||
|OldSensitivityLabelId|Edm.Guid| |
|UserId|Edm.String|Yes||
|[ActionSource](#actionsource)|Edm.Enum|Yes||
|[ActionSourceDetail](#actionsourcedetail)|Edm.Enum|Yes| |	 
|[LabelEventType)](#labeleventtype)|Edm.Enum|Yes||

## ActionSource (Enum)
value Member Description

|Value |Member  |Description  |
|---------|---------|---------|
|2|Auto||
|3|Manual||

## LabelEventType(Enum) 
|Value |Member  |Description  |
|---------|---------|---------|
|1|LabelUpgraded|| 
|2|LabelDowngraded||
|3|LabelRemoved||
|4|LabelChangedSameOrder||

## ArtifactType(Enum): 
|Value |Member  |Description  |
|---------|---------|---------|
|1|Dashboard||
|2|Report||
|3|Dataset||
|7|Dataflow||

## ActionSourceDetail(Enum)
|Value |Member  |Description  |
|---------|---------|---------|
|0|None||
|3|AutoByInheritance||
|4|AutoByDeploymentPipeline||
|5|PublicAPI||

Activity:SensitivityLabelApplied / SensitivityLabelChanged / SensitivityLabelRemoved 

ArtifactType: (Edm.Enum) 

## Next steps
* [Sensitivity labels in Power BI](./service-security-sensitivity-label-overview.md)