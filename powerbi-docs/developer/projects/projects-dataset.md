---
title: Power BI Desktop projects Dataset folder
description: Learn about the Power BI Desktop projects dataset folder
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
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease product that may be substantially modified before being released for General Availability (GA). Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article describes the files and subfolders in the Microsoft Power BI Desktop project Dataset folder. Not every project includes all of the files and subfolders described here.

## \<project name>.Dataset

Contains files and folders that represent a Power BI Dataset. Depending on your project, it can include:

#### model.bim

Contains a JSON definition of the model.

#### definition.pbidataset

Contains metadata that defines the file structure and core settings.

#### diagramLayout.json

Contains diagram metadata that defines the structure of the dataset associated with the report.  

#### item.config.json

An automatically generated system file that contains `version` and `logicalId` attributes. In effect, it identifies the folder as a source control representation of a service item. To learn more, see [Git integration source code format - Config file](/fabric/cicd/git-integration/source-code-format#config-file).

#### item.metadata.json

An automatically generated system file that contains `type`, `displayName`, `description` attributes. To learn more, see [Git integration source code format - Metadata file](/fabric/cicd/git-integration/source-code-format#metadata-file)

#### unappliedChanges.json

Power BI Desktop allows you to save changes made in the Transform Data editor (Power Query) without first applying those changes to the data model.

:::image type="content" source="media/projects-overview/query-change.png" alt-text="Image showing Apply query change dialog.":::

When you select **Apply later**, the unapplied changes are saved into an unappliedChanges.json file. When an unappliedChanges file exists, Power BI Desktop prompts you to apply or discard pending changes:

:::image type="content" source="media/projects-overview/pending-changes.png" alt-text="Image showing pending changes warning.":::

#### .pbi\

A sub-folder that includes the following files used by Power BI Desktop. These files aren't considered part of the core artifact definition:

###### localSettings.json

Contains dataset settings that apply only for the current user and computer. It should be included in gitIgnore or other source control exclusions. By default, this file is ignored by Git.

###### editorSettings.json

Contains dataset editor settings saved as part of the dataset definition for use across users and environments.

###### cache.abf

An Analysis Services Backup (ABF) file containing a local cached copy of the model and data when it was last edited. It should be included in gitIgnore or other source control exclusions. By default, this file is ignored by Git.

Power BI Desktop can open without a cache.abf file. In that case, it opens the report connected to a model with its entire definition but without data. If a cache.abf exists, Power BI Desktop loads the data and overwrites the model definition with the content in model.bim.

