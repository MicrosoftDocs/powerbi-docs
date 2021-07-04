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
# Audit schema for sensitivity labels in Power BI

This article documents the information in the Power BI auditing schema that is specific to sensitivity labels. It covers the following activity keys:

* SensitivityLabelApplied
* SensitivityLabelChanged
* SensitivityLabelRemoved

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
|--|---------|---------|
|0|None|There are no additional details.|
|3|AutoByInheritance|The label change took place as a result of automatically triggered inheritance process|
|4|AutoByDeploymentPipeline|The label change took place as a result automatically as a result of deployment pipeline process|
|5|PublicAPI|The label change action was performed by one of the following Power BI public admin REST APIs: [setLabels](https://docs.microsoft.com/rest/api/power-bi/admin/information-protection-set-labels-as-admin), [removeLabels](https://docs.microsoft.com/rest/api/power-bi/admin/information-protection-remove-labels-as-admin).|

## LabelEventType
|Value |Meaning  |Description  |
|--|---------|---------|
|1|LabelUpgraded|A more restrictive label was applied to the artifact.| 
|2|LabelDowngraded|A less restrictive label was applied to the artifact.|
|3|LabelRemoved|The label was removed from the artifact.|
|4|LabelChangedSameOrder|The label was replaced by another label with the same level of sensitivity.|

## Next steps
* [Sensitivity labels in Power BI](./service-security-sensitivity-label-overview.md)
* Power BI REST admin APIs:
    * [setLabels](https://docs.microsoft.com/rest/api/power-bi/admin/information-protection-set-labels-as-admin)
    * [removeLabels](https://docs.microsoft.com/rest/api/power-bi/admin/information-protection-remove-labels-as-admin)