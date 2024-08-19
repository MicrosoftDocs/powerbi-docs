---
title: Power BI Desktop project semantic model folder
description: Learn about the Power BI Desktop project semantic model folder.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 03/14/2024
---

# Power BI Desktop project semantic model folder

> [!IMPORTANT]
> Power BI Desktop projects is currently in **preview**.

This article describes the files and subfolders in a Microsoft Power BI Desktop project's **Semantic Model** folder. The files and subfolders here represent a Power BI semantic model. Depending on your project, the semantic model folder can include:

- .pbi\
  - [localSettings.json](#pbilocalsettingsjson)
  - [editorSettings.json](#pbieditorsettingsjson)
  - [cache.abf](#pbicacheabf)
  - [unappliedChanges.json](#pbiunappliedchangesjson)
- [definition.pbism](#definitionpbism)<sup>[1](#required1)</sup>
- [model.bim](#modelbim)<sup>[2](#required2)</sup>
- [definition\ folder](#definition-folder)<sup>[3](#required3)</sup>
- [diagramLayout.json](#diagramlayoutjson)
- [.platform](#platform)

<a name="required1">1</a> - This file is required.  
<a name="required2">2</a> - This file is required when saving using TMSL format.  
<a name="required3">3</a> - This file is required when saving using TMDL format.  

Not every project semantic model folder includes all of the files and subfolders described here.

## Semantic Model files

#### .pbi\localSettings.json

Contains semantic model settings that apply only for the current user and computer. It should be included in gitIgnore or other source control exclusions. By default, Git ignores this file.

For more information, see the [localSettings.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/localSettings.md).

#### .pbi\editorSettings.json

Contains semantic model editor settings saved as part of the semantic model definition for use across users and environments.

For more information, see the [editorSettings.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/editorSettings.md).

#### .pbi\cache.abf

An Analysis Services Backup (ABF) file containing a local cached copy of the model and data when it was last edited. It should be included in gitIgnore or other source control exclusions. By default, Git ignores this file.

Power BI Desktop can open a project without a cache.abf file. In that case, it opens the report connected to a model with its entire definition but without data. If a cache.abf exists, Power BI Desktop loads the data and overwrites the model definition with the content in model.bim.

#### .pbi\unappliedChanges.json

Power BI Desktop allows you to save changes made in the Transform Data editor (Power Query) without first applying those changes to the data model.

:::image type="content" source="media/projects-overview/query-change.png" alt-text="Image showing Apply query change dialog.":::

When you select **Apply later**, the unapplied changes are saved into the unappliedChanges.json file. When pending changes are in the unappliedChanges file, Power BI Desktop prompts you to apply or discard those pending changes:

:::image type="content" source="media/projects-overview/pending-changes.png" alt-text="Image showing pending changes warning.":::

If you select **Apply changes**, Power BI Desktop overwrites the queries in model.bim with the queries from unappliedChanges.json. If you edited queries in model.bim outside of Power BI Desktop and there's a previous unappliedChanges.json file, your changes are lost and replaced by the queries in unappliedChanges.json when those changes are applied.

The unappliedChanges.json file is automatically incorporated into the semantic model definition and saved in Git by default. This allows you to commit your ongoing work to the development branch, serving as a backup and making it accessible to other team members. However, you can exclude this file from Git's tracking, preventing unfinished query work from affecting other developers.

For more information, see the [unappliedChanges.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/unappliedChanges.md).

#### definition.pbism

Contains the overall definition of a semantic model and core settings.

This file also specifies the supported semantic model definition formats through the 'version' property.

| Version  | Supported formats    |
|----------|----------------------------|
| 1.0      | Semantic model definition must be stored as TMSL in the model.bim file. |
| 4.0 or above | Semantic model definition can be stored as TMSL (model.bim file) or TMDL (\definition folder). |

For more information, see the [definition.pbism schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/dataset/definition.pbidataset.md).


#### model.bim

This file is only available if the Power BI project is saved using the TMSL format. It contains a Tabular Model Scripting Language (TMSL) [Database object](/analysis-services/tmsl/database-object-tmsl?view=power-bi-premium-current&preserve-view=true) definition of the project model.

#### definition\ folder

This folder is only available if the Power BI project is saved using the [TMDL format](#tmdl-format). It replaces the [model.bim](#modelbim) file.  

This folder contains a [Tabular Model Definition Language (TMDL)](/analysis-services/tmdl/tmdl-overview) [Database object](/analysis-services/tmsl/database-object-tmsl) definition of the project model.

#### diagramLayout.json

Contains diagram metadata that defines the structure of the semantic model associated with the report. During **PREVIEW**, this file doesn't support external editing.  

#### .platform

Fabric platform file that holds properties vital for establishing and maintaining the connection between Fabric items and Git.

To learn more, see [Git integration automatically generated system files](/fabric/cicd/git-integration/source-code-format#automatically-generated-system-files).

## TMDL format

With the objective of providing a better source control and co-development experience, you can save your Power BI Project files (PBIP) using Tabular Model Definition Language (TMDL) as the semantic model file format.

Unlike Tabular Model Scripting Language (TMSL), TMDL has been designed from the ground up to be human-friendly, facilitating not only *readability* but also easy *editing* in any text editor. This represents a substantial enhancement for source control and *collaborative* development experiences.

:::image type="content" source="./media/projects-dataset/semantic-model-compare.png" alt-text="Screenshot of friendly TMDL diffs." lightbox="./media/projects-dataset/semantic-model-compare.png":::

Instead of a big JSON file like Tabular Model Scripting Language (TMSL), TMDL has a folder structure with separate files for each table, perspective, role, and culture. This makes it easier to work with others, and to understand the semantic model structure by just looking at the folder and files. Ultimately, this leads to a great source control and co-development experience when dealing with git diff’s and merge conflicts.

:::image type="content" source="./media/projects-dataset/semantic-model-diffs.png" alt-text="Screenshot of semantic model TMDL diffs." lightbox="./media/projects-dataset/semantic-model-diffs.png":::

Learn more about TMDL [here](/analysis-services/tmdl/tmdl-overview).

### Enable TMDL format Preview feature

Saving as a Power BI Project using TMDL is currently in preview. Before using it, you must first enable it in Preview features:

Go to **File > Options and settings > Options > Preview features** and check the box next to **Store semantic model using TMDL format**.

### Save as a project using TMDL

With the TMDL Preview feature enabled, when you save a project, your semantic model is saved as a TMDL folder named *\definition* inside of [semantic model folder](./projects-dataset.md):  

:::image type="content" source="./media/projects-dataset/semantic-model-folder.png" alt-text="Screenshot of the definition folder inside a semantic model folder.":::

Learn more about the [TMDL folder structure](/analysis-services/tmdl/tmdl-overview#tmdl-folder-structure).

### Convert existing PBIP to TMDL

If you already have a PBIP using TMSL as semantic model format, you can convert it to TMDL as follows:

1. Open the PBIP in Power BI Desktop.
1. Ensure the Preview Feature is enabled.
1. **Save** the project. A prompt appears asking you to upgrade into TMDL.
1. Select **Upgrade**.

    > [!IMPORTANT]
    > Once you upgrade to TMDL, you can't revert back to TMSL. If you think you might want to revert back to TMSL, save a copy of your PBIP files first.

    :::image type="content" source="./media/projects-dataset/upgrade-project.png" alt-text="Screenshot of prompt to upgrade semantic model folder to TMDL.":::

The existing Tabular Model Scripting Language (TMSL) file (*model.bim*) is replaced with a *\definition* folder containing the TMDL representation of the semantic model.

:::image type="content" source="./media/projects-dataset/folders-compare.png" alt-text="Screenshot of PBIP projects with TMSL folders and with TMDL folders.":::

If you select to **Keep current** format, Desktop won't prompt again to upgrade.

### Make external changes to TMDL files

For a better experience reading and editing your TMDL files, install the [TMDL - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=analysis-services.TMDL) Microsoft VS Code extension.

Open the PBIP folder using VS Code and navigate to semantic model definition folder.

:::image type="content" source="./media/projects-dataset/semantic-model-definition-folder.png" alt-text="Screenshot of a semantic model definition folder in VS Code.":::

Power BI Desktop isn't aware of changes to project files made by other tools. Therefore, if you make any changes to open files outside of Power BI Desktop, you need to restart for those changes to be shown in Power BI Desktop.

Please refer [here](./projects-overview.md#model-authoring) for supported write operations outside of Power BI Desktop.

#### TMDL Errors

If any invalid edits are made to the TMDL files, Power BI Desktop throws an error on open, with the location of the error:

:::image type="content" source="./media/projects-dataset/edit-error.png" alt-text="Screenshot of an error message for an invalid file.":::

### TMDL considerations and limitations

During the Public Preview, [Fabric Git Integration](/fabric/cicd/git-integration/intro-to-git-integration) will still export the semantic model using TMSL by default. However, if the semantic model is imported into Fabric using Fabric Git Integration with TMDL format, then Fabric Git Integration will use TMDL format to export the semantic model definition to Git if there are any semantic model changes in the service.

> [!IMPORTANT]
> If you import your semantic model using any other import method, such as [Power BI Desktop Publish](../../create-reports/desktop-upload-desktop-files.md), Fabric Git Integration will switch back to the default TMSL format.

## Related content

- [Power BI Desktop project report folder](projects-report.md)  
- [Power BI Desktop projects](projects-overview.md)  
- [Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference)
