---
title: Power BI Desktop projects dataset folder
description: Learn about the Power BI Desktop projects dataset folder
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/18/2023
---

# Power BI Desktop project dataset folder

### \<project name>.Dataset

This is the dataset item folder containing a collection of files and folders that represent a Power BI Dataset. It contains the following:

#### .pbi\

A directory folder holding files used by Power BI Desktop which aren't considered part of the core item definition.

##### localSettings.json

Contains report settings that only apply for the current user/computer.

##### editorSettings.json

Contains dataset editor settings that saved as part of the dataset definition for use across users or environments.

##### cache.abf

An Analysis Services Backup (ABF) file containing a cached local copy of the model and data as of the time it was last edited.  It’s a considered as a local cache, and it should be included in git ignore or other source control exclusions.

Power BI Desktop can open without a cache.abf file. In that case, it opens the report connected to a model with its entire definition but without data. If a cache.abf exists, Power BI Desktop loads its data and overwrites the model definition with the content at model.bim.

#### definition.pbidataset

Provides the overall description of a dataset. Contains metadata about the overall file structure and core settings.

#### diagramLayout.json

Holds data model diagrams describing the structure of the dataset associated with this report.  

#### item.config.json

Identifies this directory as a source control representation of a service item. 
More information here.

#### item.metadata.json

Holds properties common to all service items.
More information here.

#### model.bim

model.bim is a JSON object definition file.

Most Tabular Object Model (TOM) object types support write change operations

Any TOM object types not covered in supported write operations are not supported to be changed outside of Power BI Desktop and could result in unexpected errors.

Object and operations that support write operations:

| Object / Operation            | Change to AS Instance   | File Change |
|-------------------------------|-------------------------|-------------|
| Measures                      | Y                       | Y           |
| Calc groups                   | Y                       | Y           |
| Perspectives                  | Y                       | Y           |
| Translations                  | Y                       | Y           |
| OLS rules                     | Y                       | Y           |
| Model KPIs                    | Y                       | Y           |
| Detail rows on measures       | Y                       | Y           |
| Tables                        | N                       | Y           |
| M expressions                 | N                       | Y           |
| Relationships                 | Y                       | Y           |
| Calculated columns & tables   | Y                       | Y           |
| Format strings & descriptions | Y                       | Y           |
| Renaming columns & tables     | N                       | Y           |
| Changing data types           | Y                       | Y           |
| Annotations                   | Y                       | Y           |

Keep in mind:

- Any changes made outside Power BI Desktop require a restart for those changes to be applied. Power BI Desktop is not aware of changes to the files outside of the application.
- Power BI Desktop don’t support tables with multiple partitions. Only a single partition for each table is supported. Creating more than one partition results in an error when opening the report.
- If the dataset has the Auto date/time feature enabled, and you creates a new datetime column outside of Power BI Desktop, the local date table isn't be automatically generated.
- Automatic date tables created by Power BI Desktop should not be edited outside of Power BI Desktop.







#### unappliedChanges.json

Power BI Desktop allows you to save changes made in the Transform Data editor (Power Query) without first applying those changes to the data model:

:::image type="content" source="media/projects-overview/query-change.png" alt-text="Image showing Apply query change dialog.":::

When the user selects "Apply later", the unapplied changes are saved into the unappliedChanges.json file.

When an unapplied changes file exists, Desktop shows the following banner to the user to let him apply the changes made in the Transform Data window to the model:

:::image type="content" source="media/projects-overview/pending-changes.png" alt-text="Image showing pending changes warning.":::