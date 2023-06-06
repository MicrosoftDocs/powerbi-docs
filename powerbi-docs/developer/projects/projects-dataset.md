---
title: Power BI Desktop project Dataset folder
description: Learn about the Power BI Desktop project dataset folder
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/31/2023
---

# Power BI Desktop project Dataset folder

> [!IMPORTANT]
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease feature that may be substantially modified before being released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article describes the files and subfolders in a Microsoft Power BI Desktop project's **Dataset** folder. The files and subfolders here represent a Power BI dataset. Depending on your project, the Dataset folder can include:

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

Not every project Dataset folder includes all of the files and subfolders described here.

## Dataset files

#### .pbi\localSettings.json

Contains dataset settings that apply only for the current user and computer. It should be included in gitIgnore or other source control exclusions. By default, this file is ignored by Git.

Refer to the [localSettings.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/localSettings.md) for more information.

#### .pbi\editorSettings.json

Contains dataset editor settings saved as part of the dataset definition for use across users and environments.

Refer to the [editorSettings.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/editorSettings.md) for more information.

#### .pbi\cache.abf

An Analysis Services Backup (ABF) file containing a local cached copy of the model and data when it was last edited. It should be included in gitIgnore or other source control exclusions. By default, this file is ignored by Git.

Power BI Desktop can open a project without a cache.abf file. In that case, it opens the report connected to a model with its entire definition but without data. If a cache.abf exists, Power BI Desktop loads the data and overwrites the model definition with the content in model.bim.

#### .pbi\unappliedChanges.json

Power BI Desktop allows you to save changes made in the Transform Data editor (Power Query) without first applying those changes to the data model.

:::image type="content" source="media/projects-overview/query-change.png" alt-text="Image showing Apply query change dialog.":::

When you select **Apply later**, the unapplied changes are saved into the unappliedChanges.json file. When pending changes are in the unappliedChanges file, Power BI Desktop prompts you to apply or discard those pending changes:

:::image type="content" source="media/projects-overview/pending-changes.png" alt-text="Image showing pending changes warning.":::

If you select **Apply changes**, Power BI Desktop overwrites the queries in model.bim with the queries from unappliedChanges.json. If you edited queries in model.bim outside of Power BI Desktop, your changes are lost and replaced by the queries in unappliedChanges.json when those changes get applied.

Refer to the [unappliedChanges.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/unappliedChanges.md) for more information.

#### model.bim

Contains a Tabular Model Scripting Language (TMSL) [Database object](/analysis-services/tmsl/database-object-tmsl?view=power-bi-premium-current&preserve-view=true) definition of the project model.

#### definition.pbidataset

Contains the overall definition of a dataset and core settings.

Refer to the [definition.pbidataset schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/definition.pbidataset.md) for more information.

#### diagramLayout.json

Contains diagram metadata that defines the structure of the dataset associated with the report. During **PREVIEW**, this file doesn't support external editing.  

#### item.config.json

Identifies the folder as a source control representation of a service item. To learn more, see [Git integration source code format - Config file](/fabric/cicd/git-integration/source-code-format#config-file).

Refer to the [item.config.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/common/item.config.md) for more information.

#### item.metadata.json

Contains attributes that define the item. To learn more, see [Git integration source code format - Metadata file](/fabric/cicd/git-integration/source-code-format#metadata-file)

Refer to the [item.metadata.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/common/item.metadata.md) for more information.

## See also

[Power BI Desktop project Report folder](projects-report.md)  
[Power BI Desktop projects](projects-overview.md)  
[Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current&preserve-view=true)  
