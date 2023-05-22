---
title: Power BI Desktop Projects Report folder
description: Learn about the Power BI Desktop Projects report folder
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/18/2023
---

# Power BI Desktop project Report folder

> [!IMPORTANT]
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article describes the files and sub-folders in the Microsoft Power BI Desktop project Report folder. Not every project will include all of the files and sub-folders described here.

## \<project name>.Report

Contains files and sub-folders that represent a Power BI Report. Depending on your project, it can include the following:

#### .pbi\\

This sub-folder includes the localSettings.json file, which contains report settings that apply only for the local user/computer.

###### localSettings.json

Contains report settings that apply only for the current user and computer. It should be included in gitIgnore or other source control exclusions. By default, this file is ignored by Git.

#### datasetDiagramLayout.json

This file contains data model diagrams describing the structure of the dataset associated with the report.

#### definition.pbir

This file defines the overall file structure and references the dataset used by the report. Power BI Desktop can open a .PBIR file directly, just the same as if the report were opened from a .PBIP file. Opening a PBIR also opens the dataset alongside if there is a relative reference (`byPath`).

Example definition.pbir JSON:

```json
{
  "version": "1.0",
  "datasetReference": {
    "byPath": {
      "path": "../Sales.Dataset"
    },
    "byConnection": null
  }
}

```

The definition includes the `datasetReference` property, which references the dataset used in the report. The reference can be either of the following:

`byPath` - Specifies a relative path to the target dataset item folder. Absolute paths are not supported. A backslash (/) is used as a folder separator. When used, Power BI Desktop also opens the dataset in full edit mode.

`byConnection` - Specifies a remote dataset in Power BI Service by using a connection string. When a `byConnection` reference is used, Power BI Desktop doesn't open the dataset in edit mode.

When using a `byConnection` reference, the following properties must be specified:

|Property |Description  |
|---------|---------|
|connectionString    |   The connection string referring to the remote dataset.      |
|pbiModelDatabaseName     |   The remote dataset id.      |
|connectionType     |   Type of the connection, for service remote dataset should be `pbiServiceXmlaStyleLive`.      |
|pbiModelVirtualServerName    |  An internal property that should have the value `sobe_wowvirtualserver`.       |

Example using `byConnection`:

```json
{
  "version": "1.0",
  "datasetReference": {
    "byPath": null,
    "byConnection": {
      "connectionString": "Data Source=\"powerbi://api.powerbi.com/v1.0/myorg/Datasets\";Initial Catalog=Sales;Integrated Security=ClaimsToken",
      "pbiServiceModelId": null,
      "pbiModelVirtualServerName": "sobe_wowvirtualserver",
      "pbiModelDatabaseName": "e244efd3-e253-4390-be28-6be45d9da47e",
      "connectionType": "pbiServiceXmlaStyleLive",
      "name": null
    }
  }
}

```

#### item.config.json

This file identifies the folder as a source control representation of a service item.

#### item.metadata.json

This file includes properties common to all service items.

#### report.json

This file defines the content of the report including visuals, layout of various pages, and intended interactions. During **PREVIEW**, this file does not support external editing.

#### mobileState.json

This file describes changes to the report appearance and behavior when rendering on a mobile device. This file does not support external editing.

#### CustomVisuals\\

This sub-folder contains custom visual definitions used in the report. Each custom visual is held in a further sub-folder. Files here do not support external editing.

#### StaticResources\\

A sub-folder that includes two additional sub-folders: SharedResources\ and RegisteredResources\.

##### SharedResources\\

A sub-folder that contains files with internal resources used by Power BI Desktop. Files here do not support external editing.

The files exist to allow a level of forward compatibility. For example, a new release of Power BI Desktop may introduce a new built-in theme. And if a report author with the latest version selects the new theme, another user with an earlier version of Power BI  Desktop can still open the report because the new theme is part of the shared resources folder.

##### RegisteredResources\\

A sub-folder that contains resource files specific to the report and loaded by the user, like custom themes, images, and custom visuals (.pbiviz files).

Developers are responsible for the files here and changes are supported. For example, you can change a file, and after a Power BI Desktop restart, the new file is loaded into the report. This can unblock some useful scenarios like:

- Authoring custom themes outside of Power BI Desktop by using the public schema.
- Applying batch changes by changing the resource file on multiple reports. For example, you can switch the corporate custom theme, change between light and dark themes, and change logo images.

Every resource file must have a corresponding entry in the report.json file, which  during **PREVIEW** doesn't support editing. Sdits to RegisteredResources files are only supported for already loaded resources that causes Power BI Desktop to register the resource in report.json.

#### CustomVisuals\\

A sub-folder that containing metadata on custom visuals added for use in the report. Power BI supports three kinds of custom visuals:

- AppSource PowerBI visuals - Also known as "public custom visuals". They're available from Microsoft AppSource. Report developers can install these visuals directly from Power BI Desktop.
- Organizational store visuals - Organizations can approve and deploy custom visuals to Power BI for their organization. To learn more, see [Organization store](/power-bi/developer/visuals/power-bi-custom-visuals#organizational-store).
- Custom visual files - Also known as "private custom visuals". They files can be loaded into the report by uploading a .pbiviz package.

Only private custom visuals are loaded into the CustomVisuals folder. AppSource and Organization visuals are loaded automatically by Power BI Desktop.

## See also

[Power BI Desktop project dataset folder](projects-dataset.md)  
[Power BI Desktop projects](projects-overview.md)  
