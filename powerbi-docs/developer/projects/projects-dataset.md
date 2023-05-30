---
title: Power BI Desktop project Dataset folder
description: Learn about the Power BI Desktop project dataset folder
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/18/2023
---

# Power BI Desktop project Dataset folder

> [!IMPORTANT]
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease feature that may be substantially modified before being released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article describes the files and subfolders in a Microsoft Power BI Desktop project's **.Dataset** folder. The files and subfolders here represent a Power BI dataset. Depending on your project, the .Dataset folder can include:

- .pbi\
    - [localSettings.json](#pbilocalsettingsjson)
    - [editorSettings.json](#pbieditorsettingsjson)
    - [cache.abf](#pbicacheabf)
    - [unappliedChanges.json](#pbiunappliedchangesjson)
- [model.bim](#modelbim)
- [definition.pbidataset](#definitionpbidataset)
- [diagramLayout.json](#diagramlayoutjson)
- [item.config.json](#itemconfigjson)
- [item.metadata.json](#itemmetadatajson)

Not every project .Dataset folder includes all of the files and subfolders described here.

## Dataset files

#### .pbi\localSettings.json

Contains dataset settings that apply only for the current user and computer. It should be included in gitIgnore or other source control exclusions. By default, this file is ignored by Git.

#### .pbi\editorSettings.json

Contains dataset editor settings saved as part of the dataset definition for use across users and environments.

#### .pbi\cache.abf

An Analysis Services Backup (ABF) file containing a local cached copy of the model and data when it was last edited. It should be included in gitIgnore or other source control exclusions. By default, this file is ignored by Git.

Power BI Desktop can open a project without a cache.abf file. In that case, it opens the report connected to a model with its entire definition but without data. If a cache.abf exists, Power BI Desktop loads the data and overwrites the model definition with the content in model.bim.

#### .pbi\unappliedChanges.json

Power BI Desktop allows you to save changes made in the Transform Data editor (Power Query) without first applying those changes to the data model.

:::image type="content" source="media/projects-overview/query-change.png" alt-text="Image showing Apply query change dialog.":::

When you select **Apply later**, the unapplied changes are saved into the unappliedChanges.json file. When pending changes are in the unappliedChanges file, Power BI Desktop prompts you to apply or discard those pending changes:

:::image type="content" source="media/projects-overview/pending-changes.png" alt-text="Image showing pending changes warning.":::

#### model.bim

Contains a Tabular Model Scripting Language (TMSL) [Database object](/analysis-services/tmsl/database-object-tmsl?view=power-bi-premium-current&preserve-view=true) definition of the project model.

#### definition.pbidataset

Contains metadata that defines the file structure and core settings.

#### diagramLayout.json

Contains diagram metadata that defines the structure of the dataset associated with the report.  

#### item.config.json

Identifies the folder as a source control representation of a service item. To learn more, see [Git integration source code format - Config file](/fabric/cicd/git-integration/source-code-format#config-file).

#### item.metadata.json

Contains attributes that define the item. To learn more, see [Git integration source code format - Metadata file](/fabric/cicd/git-integration/source-code-format#metadata-file)

## See also

[Power BI Desktop project Report folder](projects-report.md)  
[Power BI Desktop projects](projects-overview.md)  
[Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current&preserve-view=true)  
