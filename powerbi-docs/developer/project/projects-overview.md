---
title: Learn about Power BI Desktop project
description: Learn how to save and edit a Power BI Desktop project
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/03/2023
---

# Power BI Desktop projects (Preview)

The June 2023 version of Power BI Desktop introduces a groundbreaking new way to work with Power BI Desktop. You can now save your work as a project with report and dataset artifact definitions as individual plain text files.

Saving your work as a project has the following benefits:

**Source Control** - Power BI artifact definitions can be stored in a source control system, like GitHub. This allows project developers to track version history, compare different revisions (diff), and revert to previous versions. Source control can also unblock co-development and collaboration using Power BI Desktop, by leveraging familiar collaboration mechanisms for resolving conflicting changes (merge) and reviewing changes (pull requests).

**Continuous Integration and Continuous Delivery (CI/CD)**- You can leverage systems where developers submit a proposed change to the CI/CD system, and the system subjects the change to a series of *quality gates* before applying the change to the production system.  These quality gates may include code reviews by other developers, automated testing, and automated build to validate the integrity of the changes. CI/CD systems are typically built on top of existing source control systems.

**Text Editor Support** - Artifact definition files for datasets and reports are human readable text files defined using JSON or TMDL. Developers can use code editors like Visual Studio Code for more productive authoring and a rich editing experience including intellisense and validation.



## Power BI project folder

If you're working on a new project or you've opened an existing .pbix, you can save your work as a Power BI project file (.pbip):

:::image type="content" source="media/projects-overview/pbip-saveastype.png" alt-text="Screengrab showing save file as Power BI Project":::

When you save as a project, Power BI Desktop saves report and dataset artifacts as folders, each containing text files that define the artifact. You'll see the following:

:::image type="content" source="media/projects-overview/pbip-files.png" alt-text="Screengrab showing Power BI Project files":::

#### .gitIgnore

Certain files in each artifact are intended only for the user’s local machine, these files hold local settings or cached information such as the cache.abf file in a dataset.

Power BI Desktop will write/update a [.gitignore](https://git-scm.com/docs/gitignore) file in the root folder when saving an artifact, this file contains patterns needed to exclude all local only files from sub-folders.

#### \<project name>.pbip

The Power BI Project File (.pbip) contains a pointer to a report artifact and can be opened by Power BI Desktop to open the report for authoring.  

Opening a PBIP will open the targeted report for authoring, but also the dataset in case the report contains a *byPath* dataset reference. 

#### \<project name>.Dataset

This is the dataset artifact folder.

#### \<project name>.Report

The Report artifact folder is a collection of files and folders that represent a Power BI Report. It contains the following files and further sub-folders:

**report.json** - Describes the content of the report including the definition of visuals, layout of various pages, and intended interactions. During **Preview**, this file does not support external editing.

**mobileState.json** - If present, this file describes changes to the report appearance and behavior when rendering on a mobile device. This file does not support external editing.

**item.config.json** - Identifies this directory as a source control representation of a service item.

**item.metadata.json** - Includes properties common to all service items.

**definition.pbir** - Provides the overall definition of a report.  
Contains metadata about the overall file structure and holds the reference to the dataset used by this report.Power BI Desktop can open a .PBIR file directly. The experience is the same as if the report were opened from a .PBIP file.

**.pbi\\** - A directory that includes **localSettings.json**, which contains report settings that apply only for the current user/machine.

**CustomVisuals\\** - If present, this sub-folder contains custom visual definitions used in the report. Each custom visual is held in a further sub-folder. Files in this sub-folder do not support external editing.

**StaticResources\\** - A sub-folder which includes resource files, such as custom themes or images, used by this report.

- **RegisteredResources\\** - A sub-folder which includes resource files specific to the report definition.

- **SharedResources\\** - A sub-folder which includes copies of standard resource files used by the report definition.


This file holds the reference to the dataset (DatasetReference property) used in this report that can either be one of the following types:

•	byPath - Refer to a dataset artifact using a relative local path.
•	byConnection - Refer to a dataset in the Power BI Service using a connection string.

byPath reference - Relative path to the target dataset artifact folder, absolute paths are not supported. Uses "/" as a folder separator.
When a byPath reference is used, Power BI Desktop when opening the report also open the dataset in full edit mode.

byConnection reference - Reference to a remote dataset in Fabric using a connection string.

When a byConnection reference is used, Power BI Desktop does not open the dataset for edit mode. 
The following properties must be specified:


|Name  |Type  |Required  |Default|Description  |
|---------|---------|---------|---------|---------|
|connectionString     |    String     |   True      |        |   Connection string referencing the remote dataset.      |
|pbiModelDatabaseName     |    String     |  True        |        |   Remote dataset id.     |
|connectionType     |    String     |   True       |pbiServiceXmlaStyleLive|   Type of the connection for service remote dataset.      |
|pbiModelVirtualServerName     |    String     |    True      |sobe_wowvirtualserver| An internal property that should not be changed.       |

Example using byConnection:

```
  "version": "1.0",
  "datasetReference": {
    "byPath": null,
    "byConnection": {
      "connectionString": "Data Source=\"powerbi://api.powerbi.com/v1.0/myorg/Datasets\";Initial Catalog=Sales;Integrated Security=ClaimsToken",
      "pbiServiceModelId": null,
      "pbiModelVirtualServerName": "sobe_wowvirtualserver",
      "pbiModelDatabaseName": "e244efd3-e253-4390-be28-6be45d9da47e",
      "name": null,
      "connectionType": "pbiServiceXmlaStyleLive"
    }
  }
}

```

## Changes outside of Power BI Desktop

When saved as a project, you're not forced into making changes to your dataset and report definitions only in Power BI Desktop. You can use other tools such as VSCode, Tabular Editor, or even Notepad. However, not every file or change supports editing by external tools or text editors.

Changes to files or properties outside of the supported list may raise unexpected errors, or even prevent the application from opening, and it's up to the developer to fix the error. 

If possible, Power BI Desktop will indicate the file and location of error:

:::image type="content" source="media/projects-overview/pbip-unable-to-open-file.png" alt-text="Screengrab of unable to open file error.":::

The following files are not documented nor supported to make changes outside of Power BI Desktop:

- Report\report.json
- Report\mobileState.json

#### Dataset (model.bim)

model.bim is a JSON object definition file.

Most Tabular Object Model (TOM) object types support write change operations

Any TOM object types not covered in supported write operations, are not supported to be changed outside of Power BI Desktop and could result in unexpected errors.

Object that support write operations:

- Measures
- Calculation Groups
- Perspectives
- Translations
- OLS Rules
- KPIs
- Detail rows on measures
- Tables
- Relationships
- M expressions
- Calculated columns and tables
- Format Strings and Descriptions
- Renaming columns and tables
- Changing data types

## Considerations and limitations

- Power BI Desktop is not aware of changes outside of the application. Any changes applied by using external tools require a restart before those changes are shown in Power BI Desktop.
- Sensitivity Labels are not supported on Power BI Projects.
- Download PBIX is not supported for workspaces with Git-Integration.

